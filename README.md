[![Dependency Status](https://gemnasium.com/rlcheng/haikus.svg)](https://gemnasium.com/rlcheng/haikus)
[![Build Status](https://travis-ci.org/rlcheng/haikus.svg)](https://travis-ci.org/rlcheng/haikus)
[![Code Climate](https://codeclimate.com/github/rlcheng/haikus/badges/gpa.svg)](https://codeclimate.com/github/rlcheng/haikus)
[![Coverage Status](https://coveralls.io/repos/rlcheng/haikus/badge.svg?branch=master&service=github)](https://coveralls.io/github/rlcheng/haikus?branch=master)

###Pull Requests, Merging, and PivotalTracker
"Start" a ticket on PivotalTracker and add yourself as an owner

Use the ticket id# to name branches in the following format:
+ feature/ticket_number-INITIALS
+ bugfix/ticket_number-INITIALS

Push branch, open pull request, and "Finish" ticket on PivotalTracker

Once PR is approved, merge PR and "Deliver" ticket on PivotalTracker

Product Manager will Accept or Reject the ticket

--

###To install:

```sh
bundle install
rails s
```

###Verify install:
```sh
curl http://localhost:3000/ping
```
