# ResumeAI ATS Checker

A sophisticated ATS (Applicant Tracking System) checker that uses AI-powered analysis to evaluate resumes against job descriptions. This tool mimics enterprise-level ATS systems used by FAANG companies, providing detailed insights on how well a resume matches a specific job description.

## Features

- **BERT-like Contextual Analysis**: Uses semantic understanding to evaluate resume-job description match
- **Multi-dimensional Scoring**: Evaluates across multiple competency areas
- **Skill Proficiency Detection**: Identifies skill levels (beginner, intermediate, expert) based on contextual clues
- **Career Chronology Analysis**: Analyzes employment history, gaps, and career progression
- **Detailed Feedback**: Provides actionable recommendations to improve match score

## Prerequisites

- Node.js (v14 or later)
- npm (Node Package Manager)
- Ollama (for embedding model)

## Step-by-Step Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/resumeai-ats-checker.git
cd resumeai-ats-checker
```

### 2. Install Node.js Dependencies

```bash
npm install
```

This will install required packages:
- axios
- mathjs
- natural

### 3. Install Ollama

Ollama is used for generating embeddings to perform semantic analysis.

#### For Linux:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

#### For macOS:

Download and install from [https://ollama.com/download](https://ollama.com/download)

#### For Windows:

Download and install from [https://ollama.com/download](https://ollama.com/download)

### 4. Pull the Required Embedding Model

After installing Ollama, pull the `nomic-embed-text` model:

```bash
ollama pull nomic-embed-text
```

## Running the ATS Checker

### 1. Start the Ollama Server

Open a terminal window and start the Ollama server:

```bash
ollama serve
```

Keep this terminal window open while using the ATS checker.

### 2. Run the ATS Checker

Open a new terminal window, navigate to the project directory, and run:

```bash
node ats-checker.js
```

This will analyze the sample resume and job description included in the code.

## Using Your Own Resume and Job Description

To analyze your own resume against a specific job description:

1. Open `ats-checker.js` in a text editor
2. Find the `jobDescription` variable and replace its content with your target job description
3. Find the `candidateResume` variable and replace its content with your resume text
4. Save the file
5. Make sure the Ollama server is running
6. Run the checker:
   ```bash
   node ats-checker.js
   ```

## Understanding the Results

The ATS checker provides comprehensive analysis across multiple dimensions:

1. **Overall ATS Score**: Weighted score based on all factors (0-100%)
2. **Semantic Similarity**: How contextually similar the resume is to the job description
3. **Keyword Match**: Relevant keywords from the job description found in the resume
4. **Technical Skills Match**: Technical skills from the job description found in the resume
5. **Skill Proficiency Analysis**: Assessment of skill levels (beginner, intermediate, expert)
6. **Education Match**: Educational requirements analysis
7. **Experience Match**: Years of experience analysis
8. **Career Chronology Analysis**: Analysis of work history, gaps, and progression
9. **Soft Skills Match**: Soft skills from the job description found in the resume

## Key Features in Detail

### Skill Proficiency Detection

The system analyzes contextual clues in your resume to determine your proficiency level for each skill:

- **Expert**: When skills are described with terms like "mastery," "extensive experience," "led," "architected," etc.
- **Intermediate**: When skills are mentioned with "proficient," "experienced," "implemented," etc.
- **Beginner**: When skills are described with "familiar with," "exposure to," "basic knowledge," etc.

The system also analyzes:
- Employment duration with each skill
- Project complexity markers
- Leadership/contributory role markers
- Certifications and training experience

### Career Chronology Analysis

The system provides insights on:
- Total calculated experience
- Employment gaps (if any)
- Career progression patterns
- Job-hopping tendencies
- Average job duration

## Troubleshooting

### Ollama-Related Issues

If you encounter errors related to the embedding model:

1. Ensure Ollama is running in a separate terminal window (`ollama serve`)
2. Check if the model was downloaded correctly (`ollama list`)
3. If needed, re-pull the model: `ollama pull nomic-embed-text`

### Node.js Issues

If you encounter issues with Node.js:

1. Verify your Node.js version with `node -v` (should be v14 or later)
2. Try reinstalling the dependencies with `npm install`
3. Check for errors in the console output

### Performance Considerations

For large resumes or job descriptions, the analysis may take a moment to complete due to the embedding process.

## License

[MIT License](LICENSE)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 