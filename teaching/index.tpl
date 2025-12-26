<html>
<head>
  <link href='/main.css' rel='stylesheet'/>
  <% include ../analytics.html %>
  <title>Jensen Lab: Teaching</title>
</head>

<body>

<% include ../navigation.html %>

<div class='front-matter'>
  <div class='wrap'>
      <h1>Teaching</h1>
  </div>
</div>
<div class='wrap article'>

  <h2 id="books">Books</h2>

  <h4><i>Linear Algebra: Foundations of Machine Learning</i></h4>

  <p>This book offers a gentle introduction to the algebra of vectors and
  high-dimensional systems. Selected topics from linear algebra, optimization,
  and nonlinear systems prepare readers for advanced coursework in machine
  learning and data science.

  <p>The book grew out of a sophomore-level courses on biomedical data science
  at the University of Illinois (<a href="#bioe210">BIOE 210</a>) and the University of Michigan. A free PDF of the Fall 2022 edition
  is available <a href="LAML.pdf">here</a>. Instructor resources are
  available upon request.

  <p><b>Table of Contents</b>
    <ul>
      <li><b>Part I: Linear Systems</b>
        <ul>
          <li>Fields and vectors
          <li>Matrices
          <li>Rotation and translation matrices
          <li>Solving linear systems
          <li>The Finite Difference Method
          <li>Matrix inverses
          <li>Rank and solvability
          <li>Linear models and regression
          <li>Building regression models
        </ul>
      <li><b>Part II: Nonlinear Systems</b>
        <ul>
          <li>Root finding
          <li>Optimization and convexity
          <li>Gradient descent
          <li>Logistic regression
          <li>Bias, variance, and regularization
          <li>Geometry
          <li>Support Vector Machines
        </ul>
      <li><b>Part III: High-Dimensional Systems</b>
        <ul>
          <li>Vector spaces, span, and basis
          <li>Eigenvectors and eigenvalues
          <li>Matrix decompositions
          <li>Low-rank approximations
        </ul>
    </ul>

<h2>Courses</h2>

<h4 id="bioe210">BIOE 210: Linear Algebra for Biomedical Data Science</h4>

<p>Using analytical and computational tools from linear algebra, students in this course will
<ul>
  <li>Solve large systems of linear equations, systems of linear ODEs, and linear PDEs.
<li>Analyze large, multivariable datasets to quantify relationships between variables.
<li>Decompose complex datasets into simpler representations.
<li>Introduce and solve common problems in classification, image processing, and machine learning.
<li>Develop a geometric understanding of high-dimensional spaces.
  </ul>

  <p>The course website for Spring 2022 is available <a href="http://bioe210.github.io">here</a>.


<h4>BIOE 498/598 PJ: Experiment Design & Optimization</h4>

<p>All engineers perform experiments. Whether they be "wet-lab" or simulated, experiments test the limits of our hypotheses and drive our understanding. Often engineers want to go beyond validating their theories and models. Engineers want the best designs -- the optimal combination of cost, reliability, performance, and usability.

<p>Part I of this course presents Design of Experiments and Response Surface Methodology, two systematic frameworks for optimizing and understanding real-world systems. Using both experimental data and computer simulations, students will explore methods to efficiently search large design spaces. Upon completion, students will be able to
<ul>
    <li>Design experiments with maximum statistical power.
    <li>Use sequential experiments to find optimal experimental conditions.
    <li>Tune "black box" models with multiple inputs and parameters.
</ul>

<p>Part II generalizes the above techniques into Surrogate Optimization to tackle larger problems with complex response surfaces. Surrogate optimization emphasizes active learning and sequential experiments that adapt designs based on intermediate results.

<p>Part III introduces Reinforcement Learning, a branch of artificial intelligence where agents both design experiment and interpret the results. Reinforcement learning underlies many recent AI breakthroughs in gameplay, logistics, protein folding, self-driving cars, and robotics. Students will learn to build agents that rival human experts when solving multistage decision problems.

<p>The techniques in this course apply to any field of science and engineering. The course will focus on biomedical and bioengineering topics, including
<ul>
  <li>Bioprocess and metabolic engineering
<li>Medical device design and testing
<li>Optimizing molecular biology assays
<li>Design of synthetic gene circuits
</ul>

Students will use real-world data and simulation software to optimize designs. As is typical in engineering, many of the projects lack a single "best" answer. Students will learn to balance multiple objectives and constraints when solving problems.

<p>The course website for Spring 2022 is available <a href="http://bioe498.github.io">here</a>.

</div>

<% include ../footer.html %>

</body>
</html>
