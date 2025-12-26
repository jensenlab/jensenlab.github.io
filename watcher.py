import os
import re
import time
import argparse
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

TEMPLATE_INCLUDE_RE = re.compile(r"<% include ([\w\-.\/\\]+) %>")

def process_tpl_file(src_path):
    with open(src_path, 'r', encoding='utf-8') as f:
        content = f.read()

    def include_replacer(match):
        include_filename = match.group(1)
        include_path = os.path.join(os.path.dirname(src_path), include_filename)
        if not os.path.isfile(include_path):
            print(f"Include file not found: {include_path}")
            return f"[FILE NOT FOUND: {include_filename}]"
        with open(include_path, 'r', encoding='utf-8') as f_inc:
            return f_inc.read()

    processed_content = TEMPLATE_INCLUDE_RE.sub(include_replacer, content)

    html_path = os.path.splitext(src_path)[0] + ".html"
    with open(html_path, 'w', encoding='utf-8') as f_html:
        f_html.write(processed_content)
    print(f"Processed {src_path} -> {html_path}")

def process_all_tpl_files(directory):
    for root, dirs, files in os.walk(directory):
        for filename in files:
            if filename.endswith(".tpl"):
                process_tpl_file(os.path.join(root, filename))

class TplEventHandler(FileSystemEventHandler):
    def on_modified(self, event):
        if event.is_directory:
            return
        if event.src_path.endswith(".tpl"):
            process_tpl_file(event.src_path)

    def on_created(self, event):
        self.on_modified(event)

def watch_directory(path):
    event_handler = TplEventHandler()
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    print(f"Watching for changes to .tpl files in '{path}' (recursively)...")
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process .tpl files by expanding <% include %> directives.")
    parser.add_argument('directory', help='Directory to scan or watch')
    parser.add_argument('--once', action='store_true', help='Process all .tpl files once and exit')
    args = parser.parse_args()

    if args.once:
        process_all_tpl_files(args.directory)
    else:
        watch_directory(args.directory)

