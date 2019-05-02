---
title: "An introduction to Braess' Paradox"
categories:
  - Mobilities  # Mobilities, Data, AI
tags:
  - math
  - traffic
# ### table of content standard ###
layout: single
toc: true
# toc_label: "Braess' Paradox"
toc_icon: "road"  # corresponding Font Awesome icon name (without fa prefix): heart, cog
# classes: wide # let text wrap around toc
---

*Tl'dr: Usually, additional roads improve congestion. However, in certain circumstances, more roads can lead to worse congestion. It is important to assess the impact of new infrastructure!*

I first learned about Braess' Paradox in a third year transportation engineering class. It is a simple exercise to demonstrate the importance of evaluating the impact of infrastructural investments.

## Base Case Scenario

### Problem Definition

Given there is 300 cars trying to travel from point A to point B, as shown below:

{% raw %}<img src="/assets/images/posts/network_braess_paradox_1.svg" alt="" width="300">{% endraw %}

To help us in our calculation, let us assume the travel time on these road links are as follows, where t is travel time, and v is volume on the road (i.e., number of cars):
* for link 1 and 4: &nbsp;$$ t=1+0.02v $$
* for link 2 and 3: &nbsp;$$ t=6+0.01v $$

There are two possible path connecting A and B:
* path x through link 1 and 2, via the top two links
* path y through link 3 and 4, via the bottom two links

### Solution

Without doing any calculations, we know the number of cars will be equally divided between path x and y because the two paths have exactly the same two types of links. We can confirm this by the calculations below:

Let the travel times of the two options, $$t_1$$ and $$t_2$$, be equal (this is the condition for user equilibrium where you cannot "beat" the system by switching path), find volumes on the two path $$v1$$ and $$v2$$:

$$ t_x = t_y \rightarrow t_1 + t_2 = t_3 + t_4 $$

$$ v_1 = v_2 = v_x \text{ and } v_3 = v_4 = v_y $$

$$ 1+0.02(v_x) + 6+0.01(v_x) = 1+0.02(v_y) + 6+0.01(v_y) $$

$$ \text{since}\, v_{total} = v_x + v_y $$

$$ 7+0.03(v_{total}-v_y) = 7+0.03(v_y) $$

$$ v_y = 150 $$

$$ \boxed{v_y = 150, v_x = 150, t_x = t_y = 11.5} $$

The travel time per car is 11.5 minutes; there are 150 cars on each path.

### Benefit Evaluation

In this example, let us evaluate "benefit" in terms of total network travel times. For simplicity, let us assume there are only 1 person per car

$$ \boxed{tt_{network} = 11.5(300) = 3,450} $$

The total network travel time is 3,450 minutes or 2.40 days.


## New Network Scenario

If you have get the gist of the calculation in the base case scenario, the next part is going to get more interesting. What if we add a new one way road in the middle of the network? Traditional wisdom would suggest that adding new roads will improve congestion--let's see if that is true and by how much.

### Problem Definition

Again, there are 300 cars trying to travel from point A to point B, as shown below, but now with an additional one-way road in the middle:

{% raw %}<img src="/assets/images/posts/network_braess_paradox_2.svg" alt="" width="300">{% endraw %}

Here are a summary of the travel time functions:
* for link 1 and 4: &nbsp;$$ t=1+0.02v $$
* for link 2 and 3: &nbsp;$$ t=6+0.01v $$
* for link 5: &nbsp;$$ t=2+0.01v $$

Since we added a new link, there are now 3 ways to travel across the network:
* path x through link 1 and 2, via the top two links
* path y through link 3 and 4, via the bottom two links
* path z through link 1, 5 and 4

### Solution

The additional path adds a new spin to solving this problem, but our assumptions are still the same. Using user equilibrium assumption, the travel times on all paths will be equal. Here are the summary of conditions:

$$ t_x = t_y = t_z $$

$$ t_x = t_1 + t_2 $$

$$ t_y = t_3 + t_4 $$

$$ t_z = t_1 + t_4 + t_5 $$

$$ 300 = v_x + v_y + v_z $$

Applying the below conditions is where we need to be careful with the math. Because path z shares path with both path x and y, we have to make sure to add the volumes to the shared links on path z. We can ensure that this is accounted for by using volume on the links when solving for volumes:

$$ v_1 = v_x + v_z $$

$$ v_2 = v_x $$

$$ v_3 = v_y $$

$$ v_4 = v_y + v_z $$

$$ v_5 = v_z $$

$$ 300 = v_2 + v_3 + v_5 $$

Let rearrange our equations and solve all the volumes first.

$$ t_2 = t_3 $$

$$ 6 + 0.01v_2 + 1 + 0.02v_2 = 6 + 0.01v_3 + 1 + 0.02v_3 $$

$$ v_2 = v_3 $$

$$ 300 = 2v_2 + v_5 $$

$$ (300 - v_5)/2 = v_2 $$

Now that we have almost all of the volume relationships between paths and links, we are very close to getting all of the volumes solved.

$$ t_5 = t_3 $$

$$ 1 + 0.02v_1 + 1 + 0.02v_4 + 2 + 0.01v_5 = 6 + 0.01v_3 + 1 + 0.02v_4 $$

$$ 0.02(v_2+v_5) + 0.02(v_2+v_5) + 0.01v_5 = 3 + 0.01v_3 + 0.02(v_2+v_5) $$

$$ 0.01v_2+ 0.03v_5 = 3 $$

$$ 0.01(300 - v_5)/2+ 0.03v_5 = 3 $$

$$ 0.025v_5 = 1.5 $$

$$ v_5 = 60 $$

So given our other conditions, here are our answers for link volumes and travel times:

$$ \boxed{v_1 = 180, v_2 = 120, v_3 = 120, v_4 = 180, v_5 = 60} $$

$$ \boxed{t_1 = 4.6, t_2 = 7.2, t_3 = 7.2, t_4 = 4.6, t_5 = 1.6} $$

Finally, let's add up respective link travel times to get path travel times.

$$ \boxed{t_x = t_y = t_z = 11.8} $$

### Benefit Evaluation

$$ \boxed{tt_{network} = 11.8(300) = 3,540} $$

The total network travel time is 3,540 minutes or 2.46 days.

Our total network travel time has increased, indicating a worsening of congestion.

## Closing Remarks

So, what have we learned from this simple example of Braess' Paradox? In simple terms, we cannot rely on our intuitions and rules of thumb in all cases. There are exceptions to the rule that building roads will resolve congestion and it is important for us to assess the impact of infrastructure on road performance.
