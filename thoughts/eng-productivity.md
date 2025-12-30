# Engineering Productivity: What Makes Sense to Measure in GenAI Era

## Initiative Tenets
These principles guide our approach to defining and measuring engineering productivity:

* Provide teams with clear, standardized methods to measure productivity and learn from best practices across the organization.
* Help teams identify blind spots and prioritize changes that deliver maximum return on investment.
* Focus on systemic and process improvements rather than penalizing individuals for low productivity.
* Recognize that misused or misunderstood metrics erode trust and diminish actual productivity.

## Why Engineering Productivity Matters (Now)
Traditional metrics like story points delivered, lines of code, and PR count no longer accurately measure team or individual productivity in modern software engineering times. While we continue to use these as inputs, their weighting requires careful consideration. In the GenAI era, code volume is no longer expensive or scarce. We must account for how AI tools enhance efficiency or create roadblocks, and be more intentional about what truly matters for both business outcomes and team success. 


## Defining Engineering Productivity from First Principles
Productivity is not the same as output. Engineering productivity measures the rate at which a team converts effort and resources into measurable business value, constrained by time, quality, and developer well-being.

We can express this relationship as:

Engineering Productivity =  $\frac{Value}{function(EngineeringQuality, DeliveryQuality, TeamHealth)}$

While the exact functional relationship between denominator variables is difficult to determine, this framework shows how these factors act as inputs with their respective weightings and correlations.

**Value Delivered**: This compels teams to focus on outcomes (adoption, user efficiency improvement, revenue generation) rather than output (story points, PR counts). In an AI world where output is cheap, value is the only numerator that matters.

**Engineering Quality**: This reflects feature engineering maturity. Shipping quickly but breaking production or accumulating bugs and rework reduces productivity.

**Delivery Quality**: This represents the set of metrics that capture delivery process efficiency. If a team produces high value but takes six months to ship, productivity is low.

**Team Health**: This captures developer friction and morale. When shipping a simple feature requires excessive manual approval steps, process overload, or wading through thousands of lines of AI-generated boilerplate code and debugging obscure libraries, productivity collapses.

## What input and output metrics to measure for each factors impacting producivity 

### Metrics for Outcome and Value Delivered

**Key question:**
> "Did engineering materially improve the product and business?"

* Business KPI movement attributable to engineering
* Feature adoption rate
* Cost efficiency (product infrastructure cost per active user or other relevant entity)


### Relevant Metrics to measure Engineering Quality Factor : 

**Key question:**
> How fast and safely does the team turn ideas into production?

* Test coverage %
* Security vulnerabilities %
* Defect density
* PR cycle time (open → merged)
* Rework rate (% PRs requiring major revision)
* Review iterations
* Review latency (time waiting on humans)
* CI wait time
* Lead time: Commit → Production (P50 / P90)
* Deployment frequency
* Change failure rate
* Mean time to restore (MTTR)
* Rollback rate


### Relevant Metrics to measure Delivery Quality Factor : 

**Key questions:**
> Where is engineering time actually being spent?

* Story points planned vs delivered
* Carryover rate (trend)
* Scope churn during sprint
* WIP per engineer
* Feature delivery %
* Defect remediation %
* Tech debt remediation %
* On-call/Support %
* Unplanned work %

### Metrics for Team Health

**Key question:**
> Is this productivity sustainable?

* Team engagement pulse
* Team attrition rate
* On-call load distribution
* After-hours deploys/incidents
* Attrition risk indicator

By measuring what truly matters across value, quality, delivery, and team health, we can build engineering organizations that thrive in the GenAI era. The metrics outlined here provide a comprehensive lens through which teams can identify bottlenecks early, celebrate genuine progress, and continuously improve their productivity metrics. The question is no longer whether we should measure engineering productivity differently, but how quickly we can adapt our measurement frameworks to reflect the reality of modern software development.

