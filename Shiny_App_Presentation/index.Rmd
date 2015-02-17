---
title       : Trigonometric Function Calculator Shiny Application
subtitle    : A How-to
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview

* An application which allows for radian angle inputs and displays both the value of the 6 trigonometric functions at the input angle and a unit circle displaying the radian angle

---

## Slider Value Entry

* Allows for entry of radian angles via a slider ranging from $0$ to $2\pi$
  * Shows how the values of the trigonometric functions change in a somewhat continuous manner. 

---

## Manual Value Entry

* Allows for manual entry of radian values
  * Gives precise control over calculated trigonometric functions.

---

## Features

* Values are rounded to the nearest thousandths
* Values are saved for each entry method (i.e. values are not overwritten when switching entry method)
