Document Tracker

A server-rendered Rails application for managing and organizing business documents.

This app focuses on a common internal-tool use case: tracking documents like contracts, invoices, reports, and receipts in a way that’s simple, fast, and easy to maintain.

Overview

Document Tracker allows users to:

Create and manage documents with titles and descriptions

Assign document status (Draft, Reviewed, Finalized)

Categorize documents by type (Contract, Invoice, Report, etc.)

Tag documents for easier organization

Filter documents by title, status, type, and tag

Use the app comfortably on both desktop and mobile

The interface is intentionally minimal. The goal is to reduce friction and make documents easy to find without adding unnecessary features.

Why I built this

This project is part of my public portfolio and reflects how I approach Rails development in real-world scenarios.

Rather than building a large or flashy demo, I wanted to create something closer to the kind of internal tools many teams rely on every day. The emphasis is on clarity, maintainability, and shipping a usable product.

It demonstrates how I:

Structure Rails models and controllers

Design straightforward CRUD workflows

Keep UI and behavior predictable

Favor convention over unnecessary abstraction

Tech stack

Ruby on Rails

PostgreSQL

ERB (server-rendered views)

Minimal JavaScript

Custom CSS for layout and responsiveness

No front-end frameworks were used. The app relies on Rails conventions and standard MVC patterns.

Key design decisions

Server-rendered UI
Keeps the app fast, accessible, and easy to reason about.

Minimal JavaScript
Limits complexity and avoids unnecessary client-side state.

Explicit data models
Statuses, types, and tags are modeled clearly rather than hidden in logic.

Internal-tool mindset
Optimized for usability and maintainability over visual flair.

This reflects how many production Rails apps are built, especially for internal or business-facing tools.

Running locally
bundle install
rails db:create db:migrate db:seed
rails server


Then visit:

http://localhost:3000

Deployment

The app is designed to deploy cleanly to Heroku using a standard Rails setup.

What I’d improve next

If this were extended further, the next steps would be:

User authentication and per-user document ownership

File uploads and document previews

Pagination and saved filter states

Activity history (who changed what and when)

Basic authorization rules for different document states

These were intentionally left out to keep the initial scope focused and the codebase easy to follow.

Notes for reviewers

Most of my prior client work was private and contract-based, so this project exists to provide a clear, public example of:

My Rails code style

How I approach application structure

How I think about UX in practical business tools

How I balance simplicity with real-world requirements

This app is meant to feel like something you might actually inherit or extend on a small team, not a contrived demo.