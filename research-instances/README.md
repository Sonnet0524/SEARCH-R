# Research Instances

This directory stores research instances created by L1 research agents.

## Purpose

- Provide storage space for L1 (agent-team-research) research instances
- Support research task delegation from L1 to L0
- Enable research instance tracking and management

## Structure

```
research-instances/
├── {project-name}/              # Project-specific research instances
│   ├── {instance-id}.json       # Instance configuration
│   ├── {instance-id}-log.md     # Execution log
│   └── {instance-id}-output/    # Research outputs
└── README.md                    # This file
```

## Instance Configuration Format

```json
{
  "instance_id": "research-20260308-001",
  "project_name": "knowledge-assistant-dev",
  "l1_source": "agent-team-research",
  "created_at": "2026-03-08T14:55:00Z",
  "status": "active",
  "research_goal": "Research goal description",
  "methodology": "SEARCH-R",
  "scope": {
    "depth": "Level 0-2",
    "areas": ["area1", "area2"]
  },
  "deliverables": [
    {
      "type": "theory",
      "path": "{instance-id}-output/theory/",
      "status": "pending"
    }
  ]
}
```

## Usage

### For L1 Agents

1. Create instance configuration
   ```bash
   # Create instance directory
   mkdir research-instances/{project-name}
   
   # Create instance config
   echo '{instance-config}' > research-instances/{project-name}/{instance-id}.json
   ```

2. Execute research
   - Follow SEARCH-R methodology
   - Record process in log file
   - Generate deliverables

3. Report results
   - Update instance status
   - Notify L1 when complete

### For L0 Repository

- Maintain instance storage
- Track instance status
- Provide methodology support

## Instance Status

- **pending**: Instance created, not started
- **active**: Research in progress
- **review**: Awaiting Human review
- **completed**: Research completed
- **archived**: Instance archived

## Related

- L0 Repository: SEARCH-R
- L1 Repository: agent-team-research
- Methodology: ../methodology/SEARCH-R-cycle.md

---

**Maintainer**: SEARCH-R Framework  
**Created**: 2026-03-08  
**Purpose**: L1 research instance storage
