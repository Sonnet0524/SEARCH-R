# Getting Started

This guide will help you quickly set up and start using the Research Agent Framework.

---

## Step 1: Understand the Core Concepts

Before you start, make sure you understand:

1. **Research Cycle**: Observe → Retrieve → Think → Discuss → Reflect
2. **Research Depth**: From First Principles (Level 0) to Implementation Approaches (Level 3)
3. **Human's Dual Roles**: Information Transmitter vs. Key Decision Maker
4. **Core Value**: Recording thinking process + Insight & Challenge partnership

Read `README.md` for detailed explanations.

---

## Step 2: Define Your Research Agent's Role

Reference `agents/research/AGENTS.md` and customize based on your project:

### Key Questions to Answer:

1. **What is your research domain?**
   - AI Agent framework? Software architecture? Business process?
   - Define your research boundaries

2. **What research depth do you need?**
   - Level 0: First principles (philosophical foundation)
   - Level 1: Theoretical frameworks (models and theories)
   - Level 2: Design principles (guidelines and rules)
   - Level 3: Implementation approaches (design ideas)
   - Level 4: Implementation details ❌ (not Research Agent's responsibility)

3. **How should Research Agent interact with you?**
   - What questions should Research Agent ask?
   - What challenges should Research Agent raise?
   - What decisions require your input?

---

## Step 3: Setup Document Structure

Create a research directory structure in your project:

```
your-project/
└── research/
    ├── research-log.md              # Overall research log (timeline)
    ├── observations/                # Observation notes
    ├── retrievals/                  # Retrieval notes
    ├── reflections/                 # Thinking notes
    ├── discussions/                 # Discussion records
    ├── theories/                    # Theory documents
    └── meta/                        # Meta-research
        ├── research-methodology.md  # Your research methodology
        ├── self-reflections/        # Self-reflection notes
        └── method-iterations/       # Method iteration records
```

**Note**: You don't need to create all directories at once. Create them as needed.

---

## Step 4: Use Templates

Templates are located in `framework/templates/`. Choose appropriate templates based on your needs:

### Observation Notes
- Use when: Observing Agent Team practice, document changes, collaboration traces
- Template: `observation-template.md`

### Retrieval Reports
- Use when: Systematic literature review, framework comparison
- Template: `retrieval-survey-template.md`
- Quick retrieval: `retrieval-quick-template.md`

### Thinking Notes
- Use when: Deep thinking, forming hypotheses, first principles reasoning
- Template: `reflection-template.md`

### Theory Documents
- Use when: Building theoretical frameworks, defining design principles
- Template: `theory-template.md`

### Self-reflection
- Use when: After each session, evaluating research effectiveness
- Template: `self-reflection-template.md`

---

## Step 5: Start the Research Cycle

### Session Start

1. **Observe**
   - Read session logs (if any)
   - Check document changes
   - Observe Agent collaboration traces

2. **Retrieve** (if needed)
   - Search for relevant materials
   - Compare with other frameworks
   - Find theoretical support

3. **Think**
   - Identify patterns
   - Ask questions
   - Form hypotheses
   - Reason from first principles

4. **Discuss**
   - Provide insights
   - Raise challenges
   - Record decisions
   - Promote deep thinking

5. **Reflect**
   - Validate insights
   - Revise hypotheses
   - Summarize methodology
   - Self-reflect

### Session End

1. **Update Documents**
   - Update `research-log.md`
   - Create necessary notes (observation/retrieval/thinking)
   - Update theory documents (if any)

2. **Self-reflection**
   - Fill `self-reflection-template.md`
   - Evaluate research effectiveness
   - Identify improvement points

3. **Next Actions**
   - Plan next observation points
   - Identify needed retrieval directions
   - Prepare for next discussion

---

## Step 6: Iterate and Improve

### Regular Review

Every 5-10 sessions, review your research:

1. **Methodology Effectiveness**
   - Is the research cycle working?
   - Are you reaching sufficient depth?
   - Are insights valuable?

2. **Template Usability**
   - Are templates too complex?
   - Are any fields unnecessary?
   - What fields are missing?

3. **Document Structure**
   - Is the structure too complex?
   - Are you creating too many documents?
   - What can be simplified?

### Method Iteration

When you find methodology problems:

1. Record detailed reflection in `meta/self-reflections/`
2. Discuss with users/colleagues
3. Update `agents/research/AGENTS.md` (if needed)
4. Update this framework repository (if applicable)

---

## Best Practices

### Do's ✅

1. **Keep it lightweight**
   - Don't over-document
   - Only record valuable information
   - Every token matters

2. **Deep thinking over quantity**
   - One deep insight > ten shallow observations
   - Ask "why" multiple times
   - Build theoretical foundations

3. **Continuous iteration**
   - Reflect after each session
   - Improve methods constantly
   - Don't fear changing approaches

4. **Collaborate with humans**
   - Provide insights, don't just answer questions
   - Raise challenges, don't just accept assumptions
   - Promote deep discussions, don't just report results

### Don'ts ❌

1. **Don't act as an executor**
   - Don't provide implementation details
   - Don't make decisions for humans
   - Don't execute tasks

2. **Don't stay on surface**
   - Don't stop at Level 2 without justification
   - Don't avoid first principles thinking
   - Don't accept superficial answers

3. **Don't over-complicate**
   - Don't create documents for the sake of documents
   - Don't use complex templates for simple research
   - Don't ignore practical constraints

---

## Example Workflow

Here's an example of a complete research session:

```
1. Session Start
   - Read CATCH_UP.md (current state)
   - Read session-log.md (PM Agent's recent work)
   
2. Observe (15 min)
   - PM made 3 key decisions
   - Created 2 Subagents
   - Encountered 1 problem with Subagent output format

3. Retrieve (if needed, 10 min)
   - Search for "Agent output standardization"
   - Compare 3 frameworks' approaches
   
4. Think (20 min)
   - Pattern: PM creates many Subagents
   - Question: Should Subagent output be standardized?
   - Hypothesis: Standardized output improves collaboration
   - First principles: What is the essence of Agent collaboration?
   
5. Discuss (30 min)
   - Insight: Subagent output standardization is valuable
   - Challenge: Will standardization reduce flexibility?
   - Decision: User decides to try lightweight standardization
   
6. Reflect (10 min)
   - Research depth: Level 2 (design principles)
   - Insight quality: High
   - Method improvement: Need more observation data
   
7. Document
   - Update research-log.md
   - Create observation note
   - Create self-reflection note
   - Update CATCH_UP.md
```

---

## Troubleshooting

### Problem: Research Agent stays on surface

**Solution**:
- Explicitly ask Research Agent to think from first principles
- Ask "why" multiple times
- Request theoretical foundations

### Problem: Too many documents

**Solution**:
- Only create documents when needed
- Simplify template usage
- Focus on quality over quantity

### Problem: Research cycle not working

**Solution**:
- Review `research-log.md` to find patterns
- Discuss with Research Agent about methodology
- Adjust research depth as needed

### Problem: Lack of observation data

**Solution**:
- Ask other Agents to create session logs
- Observe document changes
- Request users to provide practice data

---

## Next Steps

1. Start your first research session
2. Use templates to create documents
3. Reflect on research effectiveness
4. Iterate and improve methodology
5. Share your experience (if applicable)

---

**Maintainer**: Research Agent  
**Created**: 2026-03-07  
**Status**: Ready for use
