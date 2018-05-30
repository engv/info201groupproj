# info201groupproj
# Project Description

Intro:
We chose to dive deeper in the raw answers to the Big Five Personality Test, constructed with items from the International Personality Item Pool. These results come from "The Big Five" factors: (1) Extraversion, (2) Agreeableness, (3) Conscientiousness, (4) Emotional Stability, and (5) Intellect/Imagination and its scoring is in the direction of positivley or negatively correlated with the dominant trait. It asks a total of 50 questions to decern 5 factors, which is slightly different than the traditional Myers-Briggs personality types (MBTI) that only tested for four different traits. This data set also collects some additional information on the users of this survey. Data such as race, age, english as first language: engnat, gender, dominant hand, how the participant located the test: source, and country of origin were included along with the corresponding personality test results. There are a total of 19,719 entries that were recorded.

The **IPIP** is an international non-profit organization that compiles personality data around the world. We aim for our target audience to be those who have either already taken the personality test, and those who are interested in learning more about the distribution of different personality traits regarding the Big Five Personality Test.

**Questions:**
1. What personality traits are common in certain parts of the world in comparison to where I live?
2. Where are the overlaps or commonalities between two or more different personality types?
3. How might filtering by gender, age or other info reveal further information as to who this personality test participants are?

# Technical Description
In order to read in our data, we will be calling on read.csv since it is in a nice csv file format. In terms of data-wrangling, we will need to filter the data . We expect to be using the _shiny library_ as well as either _ggplot2_ or _plotly_. As for anticipating future bottlenecks, interpreting the raw data may be a challenge, as the raw data format is a little confusing and doesn't reveal obvious information. Also, missing information in each column might challenging to work around.


O - Pragmatic
C - Unconscientious
E - Introvert
A - Disagreeable
N - Secures
