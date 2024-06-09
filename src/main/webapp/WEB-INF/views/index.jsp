<%--
  Created by IntelliJ IDEA.
  User: NBS
  Date: 06/09/2024
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diabetes Tracker</title>
    <link rel="stylesheet" href="/resources/css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-purple">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="../img/hero.png" alt="logo" class="logo">
                Diabetes Tracker
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#testimonials">Testimonials</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pricing">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<main>
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Take Control of Your Diabetes</h1>
                    <p>Easily track your blood sugar levels, medication, and diet with our user-friendly app.</p>
                    <a href="record-glucose-list.jsp" class="btn btn-orange btn-lg">Get Started</a>
                </div>
                <div class="col-md-6">
                    <img src="img/hero.png" alt="Hero Image" class="img-fluid">
                </div>
            </div>
        </div>
    </section>

    <section class="features" id="features">
        <div class="container">
            <h2 class="section-title">Features</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fas fa-chart-line feature-icon"></i>
                        <h3>Blood Sugar Tracking</h3>
                        <p>Easily log your blood sugar levels and view trends over time.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fas fa-utensils feature-icon"></i>
                        <h3>Diet Management</h3>
                        <p>Track your food intake and get personalized meal suggestions.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fas fa-pills feature-icon"></i>
                        <h3>Medication Reminders</h3>
                        <p>Never miss a dose with our convenient medication reminders.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="testimonials bg-light" id="testimonials">
        <div class="container">
            <h2 class="section-title">What Our Users Say</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-box">
                        <i class="fas fa-quote-left quote-icon"></i>
                        <p>"This app has been a game-changer for me. I can finally keep track of my blood sugar levels and make better decisions about my diet and exercise."</p>
                        <h4>John Doe</h4>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-box">
                        <i class="fas fa-quote-left quote-icon"></i>
                        <p>"The medication reminders have been a lifesaver. I never forget to take my insulin or other medications thanks to this app."</p>
                        <h4>Jane Smith</h4>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-box">
                        <i class="fas fa-quote-left quote-icon"></i>
                        <p>"The user interface is so intuitive and easy to use. I highly recommend this app to anyone struggling with diabetes management."</p>
                        <h4>Michael Johnson</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="pricing" id="pricing">
        <div class="container">
            <h2 class="section-title">Pricing Plans</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="pricing-box">
                        <h3>Basic</h3>
                        <p class="price">$4.99/month</p>
                        <ul class="features-list">
                            <li>Blood Sugar Tracking</li>
                            <li>Diet Logging</li>
                            <li>Basic Reports</li>
                        </ul>
                        <a href="#" class="btn btn-purple">Get Started</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-box featured">
                        <h3>Premium</h3>
                        <p class="price">$9.99/month</p>
                        <ul class="features-list">
                            <li>Blood Sugar Tracking</li>
                            <li>Diet Logging</li>
                            <li>Advanced Reports</li>
                            <li>Medication Reminders</li>
                            <li>Meal Suggestions</li>
                        </ul>
                        <a href="#" class="btn btn-orange">Get Started</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-box">
                        <h3>Enterprise</h3>
                        <p class="price">$19.99/month</p>
                        <ul class="features-list">
                            <li>Blood Sugar Tracking</li>
                            <li>Diet Logging</li>
                            <li>Advanced Reports</li>
                            <li>Medication Reminders</li>
                            <li>Meal Suggestions</li>
                            <li>Priority Support</li>
                        </ul>
                        <a href="list" class="btn btn-purple">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="contact bg-light" id="contact">
        <div class="container">
            <h2 class="section-title">Get in Touch</h2>
            <div class="row">
                <div class="col-md-6">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="5" placeholder="Message" required></textarea>
                        </div><button type="submit" class="btn btn-orange">Submit</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="contact-info">
                        <div class="info-box">
                            <i class="fas fa-map-marker-alt"></i>
                            <p>123 Main Street, Cityville, State</p>
                        </div>
                        <div class="info-box">
                            <i class="fas fa-envelope"></i>
                            <p>info@diabetestracker.com</p>
                        </div>
                        <div class="info-box">
                            <i class="fas fa-phone"></i>
                            <p>(123) 456-7890</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<footer class="bg-purple">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; 2023 Diabetes Tracker. All rights reserved.</p>
            </div>
            <div class="col-md-6">
                <ul class="social-icons">
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
