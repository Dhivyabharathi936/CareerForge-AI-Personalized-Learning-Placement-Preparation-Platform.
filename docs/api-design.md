# API Design Documentation

## Base URL
```
Development: http://localhost:8000/api/v1
Production: https://api.learningplatform.com/api/v1
```

## Authentication
All protected endpoints require JWT token in Authorization header:
```
Authorization: Bearer <jwt_token>
```

## Response Format
```json
{
  "success": true,
  "data": {},
  "message": "Success message",
  "errors": null,
  "meta": {
    "timestamp": "2024-01-01T00:00:00Z",
    "version": "1.0.0"
  }
}
```

## Error Response Format
```json
{
  "success": false,
  "data": null,
  "message": "Error message",
  "errors": [
    {
      "field": "email",
      "message": "Invalid email format"
    }
  ],
  "meta": {
    "timestamp": "2024-01-01T00:00:00Z",
    "version": "1.0.0"
  }
}
```

## 1. Authentication Endpoints

### POST /auth/register
Register a new student account.

**Request Body:**
```json
{
  "email": "student@example.com",
  "password": "password123",
  "first_name": "John",
  "last_name": "Doe",
  "college": "Sample University",
  "graduation_year": 2025,
  "branch": "Computer Science"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "uuid",
      "email": "student@example.com",
      "first_name": "John",
      "last_name": "Doe",
      "role": "student"
    },
    "message": "Registration successful. Please verify your email."
  }
}
```

### POST /auth/login
Authenticate user and get JWT tokens.

**Request Body:**
```json
{
  "email": "student@example.com",
  "password": "password123"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "access_token": "jwt_access_token",
    "refresh_token": "jwt_refresh_token",
    "token_type": "bearer",
    "expires_in": 3600,
    "user": {
      "id": "uuid",
      "email": "student@example.com",
      "first_name": "John",
      "last_name": "Doe",
      "role": "student"
    }
  }
}
```

### POST /auth/refresh
Refresh access token using refresh token.

**Request Body:**
```json
{
  "refresh_token": "jwt_refresh_token"
}
```

### POST /auth/logout
Logout user and invalidate tokens.

### POST /auth/forgot-password
Request password reset email.

**Request Body:**
```json
{
  "email": "student@example.com"
}
```

### POST /auth/reset-password
Reset password using reset token.

**Request Body:**
```json
{
  "token": "reset_token",
  "new_password": "newpassword123"
}
```

## 2. Student Profile Endpoints

### GET /students/profile
Get current student's profile.

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "user": {
      "id": "uuid",
      "email": "student@example.com",
      "first_name": "John",
      "last_name": "Doe"
    },
    "college": "Sample University",
    "graduation_year": 2025,
    "current_year": 4,
    "branch": "Computer Science",
    "phone": "+1234567890",
    "linkedin_url": "https://linkedin.com/in/johndoe",
    "github_url": "https://github.com/johndoe",
    "onboarding_completed": true,
    "target_companies": [
      {
        "id": "uuid",
        "name": "Google",
        "type": "product",
        "priority": 1
      }
    ]
  }
}
```

### PUT /students/profile
Update student profile.

**Request Body:**
```json
{
  "college": "Updated University",
  "phone": "+1234567890",
  "linkedin_url": "https://linkedin.com/in/johndoe",
  "github_url": "https://github.com/johndoe"
}
```

### POST /students/target-companies
Set target companies for student.

**Request Body:**
```json
{
  "companies": [
    {
      "company_id": "uuid",
      "priority": 1
    },
    {
      "company_id": "uuid",
      "priority": 2
    }
  ]
}
```

### POST /students/onboarding-assessment
Submit onboarding assessment results.

**Request Body:**
```json
{
  "assessment_results": {
    "subject_scores": {
      "DSA": 0.7,
      "OOPS": 0.8,
      "DBMS": 0.6
    },
    "total_score": 0.7,
    "time_taken": 1800
  }
}
```

## 3. Learning Content Endpoints

### GET /learn/subjects
Get all subjects with topics.

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "name": "Data Structures & Algorithms",
      "code": "DSA",
      "description": "Arrays, trees, graphs, sorting algorithms",
      "icon": "tree",
      "color": "#06B6D4",
      "topics": [
        {
          "id": "uuid",
          "name": "Arrays",
          "description": "Array operations and algorithms",
          "difficulty_level": 1,
          "estimated_time": 40,
          "progress": {
            "status": "completed",
            "accuracy_percentage": 85.5,
            "time_spent": 45
          }
        }
      ]
    }
  ]
}
```

### GET /learn/subjects/{subject_id}/topics
Get topics for a specific subject.

### GET /learn/topics/{topic_id}
Get detailed information about a topic.

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "name": "Arrays",
    "description": "Array operations and algorithms",
    "difficulty_level": 1,
    "estimated_time": 40,
    "prerequisites": ["Basic Programming"],
    "resources": [
      {
        "id": "uuid",
        "title": "Array Fundamentals",
        "description": "Complete guide to arrays",
        "resource_type": "tutorial",
        "url": "https://example.com/arrays",
        "difficulty_level": 1,
        "estimated_time": 30
      }
    ],
    "progress": {
      "status": "in_progress",
      "accuracy_percentage": 75.0,
      "time_spent": 25,
      "last_accessed": "2024-01-01T10:00:00Z"
    }
  }
}
```

### POST /learn/topics/{topic_id}/progress
Update learning progress for a topic.

**Request Body:**
```json
{
  "status": "completed",
  "time_spent": 30,
  "notes": "Completed all exercises"
}
```

## 4. Practice Endpoints

### GET /practice/questions
Get practice questions with filters.

**Query Parameters:**
- `topic_id`: Filter by topic
- `difficulty`: Filter by difficulty (1-5)
- `limit`: Number of questions (default: 10)
- `company`: Filter by company

**Response:**
```json
{
  "success": true,
  "data": {
    "questions": [
      {
        "id": "uuid",
        "question_text": "What is the time complexity of binary search?",
        "question_type": "mcq",
        "difficulty_level": 2,
        "options": [
          {"id": "a", "text": "O(n)"},
          {"id": "b", "text": "O(log n)"},
          {"id": "c", "text": "O(n²)"},
          {"id": "d", "text": "O(1)"}
        ],
        "topic": {
          "id": "uuid",
          "name": "Searching Algorithms",
          "subject": "DSA"
        }
      }
    ],
    "total": 100,
    "page": 1,
    "limit": 10
  }
}
```

### POST /practice/sessions
Start a new practice session.

**Request Body:**
```json
{
  "session_type": "topic_wise",
  "topic_id": "uuid",
  "question_count": 10,
  "difficulty_level": 2
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "session_id": "uuid",
    "questions": [
      {
        "id": "uuid",
        "question_text": "What is polymorphism?",
        "question_type": "mcq",
        "options": [
          {"id": "a", "text": "Option A"},
          {"id": "b", "text": "Option B"}
        ],
        "order": 1
      }
    ],
    "total_questions": 10,
    "time_limit": 600
  }
}
```

### POST /practice/sessions/{session_id}/submit
Submit answer for a question in practice session.

**Request Body:**
```json
{
  "question_id": "uuid",
  "answer": "b",
  "time_taken": 30
}
```

### POST /practice/sessions/{session_id}/complete
Complete a practice session.

**Response:**
```json
{
  "success": true,
  "data": {
    "session_id": "uuid",
    "total_questions": 10,
    "correct_answers": 8,
    "wrong_answers": 2,
    "score": 80.0,
    "time_taken": 450,
    "weak_topics": ["Inheritance", "Polymorphism"],
    "recommendations": [
      {
        "topic_id": "uuid",
        "message": "Practice more questions on Inheritance",
        "resources": ["uuid1", "uuid2"]
      }
    ]
  }
}
```

## 5. AI Tutor Endpoints

### POST /ai/explain
Get AI explanation for a concept or question.

**Request Body:**
```json
{
  "topic": "Binary Search",
  "question": "Explain how binary search works",
  "context": {
    "subject": "DSA",
    "difficulty_level": 2
  }
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "explanation": "Binary search is a search algorithm that...",
    "examples": ["Example 1", "Example 2"],
    "related_topics": ["Arrays", "Sorting"],
    "difficulty_level": 2,
    "estimated_read_time": 5
  }
}
```

### POST /ai/summarize
Get AI summary of a resource or topic.

**Request Body:**
```json
{
  "resource_url": "https://example.com/article",
  "topic": "Machine Learning Basics"
}
```

### POST /ai/generate-questions
Generate practice questions using AI.

**Request Body:**
```json
{
  "topic_id": "uuid",
  "difficulty_level": 2,
  "question_count": 5,
  "question_type": "mcq"
}
```

## 6. Personalization Endpoints

### GET /personalization/roadmap
Get personalized learning roadmap.

**Response:**
```json
{
  "success": true,
  "data": {
    "roadmap_id": "uuid",
    "generated_at": "2024-01-01T00:00:00Z",
    "target_companies": ["Google", "Microsoft"],
    "phases": [
      {
        "phase": 1,
        "title": "Foundation Building",
        "duration_weeks": 4,
        "topics": [
          {
            "topic_id": "uuid",
            "name": "Arrays",
            "priority": 0.9,
            "estimated_time": 40,
            "status": "not_started"
          }
        ]
      }
    ],
    "overall_progress": 25.5,
    "estimated_completion": "2024-06-01"
  }
}
```

### GET /personalization/weaknesses
Get student's weak areas and recommendations.

**Response:**
```json
{
  "success": true,
  "data": {
    "weak_topics": [
      {
        "topic_id": "uuid",
        "name": "Inheritance",
        "subject": "OOPS",
        "weakness_score": 0.8,
        "failure_count": 3,
        "last_failure_date": "2024-01-01T00:00:00Z",
        "recommended_resources": [
          {
            "id": "uuid",
            "title": "OOP Inheritance Guide",
            "url": "https://example.com/inheritance"
          }
        ],
        "ai_recommendations": "Focus on understanding the concept of method overriding..."
      }
    ],
    "improvement_plan": {
      "daily_practice_time": 30,
      "weekly_goals": ["Complete 20 inheritance questions"],
      "milestone_date": "2024-02-01"
    }
  }
}
```

## 7. Analytics Endpoints

### GET /analytics/dashboard
Get student dashboard analytics.

**Response:**
```json
{
  "success": true,
  "data": {
    "overall_progress": 65.5,
    "readiness_score": 72.0,
    "subjects_progress": [
      {
        "subject": "DSA",
        "progress": 80.0,
        "accuracy": 85.5,
        "time_spent": 1200
      }
    ],
    "recent_activity": [
      {
        "type": "practice_session",
        "description": "Completed Arrays practice",
        "score": 90.0,
        "date": "2024-01-01T10:00:00Z"
      }
    ],
    "weekly_stats": {
      "questions_attempted": 150,
      "accuracy": 78.5,
      "time_spent": 480,
      "topics_completed": 5
    }
  }
}
```

### GET /analytics/progress-history
Get historical progress data.

**Query Parameters:**
- `period`: day, week, month (default: week)
- `subject_id`: Filter by subject

## 8. Weekly Test Endpoints

### GET /tests/weekly/current
Get current week's test.

### POST /tests/weekly/{test_id}/start
Start weekly test.

### POST /tests/weekly/{test_id}/submit
Submit weekly test answers.

### GET /tests/weekly/{test_id}/report
Get test report and PDF download link.

## 9. Admin Endpoints

### GET /admin/dashboard
Get admin dashboard statistics.

### GET /admin/companies
Get all companies with management options.

### POST /admin/companies
Create new company.

### PUT /admin/companies/{company_id}
Update company information.

### GET /admin/subjects
Get all subjects with topics.

### POST /admin/questions
Add new questions to question bank.

### GET /admin/users
Get all users with filters.

### PUT /admin/settings
Update system settings.

## Rate Limiting
- Authentication endpoints: 5 requests per minute
- AI endpoints: 10 requests per minute per user
- General endpoints: 100 requests per minute per user
- Admin endpoints: 50 requests per minute

## Pagination
For endpoints returning lists, use these query parameters:
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20, max: 100)
- `sort`: Sort field
- `order`: asc or desc (default: asc)

## WebSocket Events
Real-time updates for:
- Practice session progress
- AI tutor responses
- Weekly test notifications
- System announcements

**Connection:** `ws://localhost:8000/ws/{user_id}?token={jwt_token}`