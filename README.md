# ResumeAI ATS Checker

A sophisticated ATS (Applicant Tracking System) checker that uses AI-powered analysis to evaluate resumes against job descriptions. This tool mimics enterprise-level ATS systems used by FAANG companies, providing detailed insights on how well a resume matches a specific job description.

## Features

- **BERT-like Contextual Analysis**: Uses semantic understanding to evaluate resume-job description match
- **Multi-dimensional Scoring**: Evaluates across multiple competency areas
- **Skill Proficiency Detection**: Identifies skill levels (beginner, intermediate, expert) based on contextual clues
- **Career Chronology Analysis**: Analyzes employment history, gaps, and career progression
- **Detailed Feedback**: Provides actionable recommendations to improve match score

## Quick Start Guide

This section provides the minimum steps to get up and running with the ResumeAI ATS Checker.

### Linux (Automated Setup)

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/resumeai-ats-checker.git
   cd resumeai-ats-checker
   ```

2. Make the scripts executable and run the automated setup:
   ```bash
   chmod +x setup.sh start.sh
   ./setup.sh
   ```

3. Start the ATS checker with a single command:
   ```bash
   ./start.sh
   ```
   
   This will:
   - Check if Ollama is running and start it if needed
   - Verify the embedding model is installed
   - Run the ATS checker
   - Clean up when done

### macOS

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/resumeai-ats-checker.git
   cd resumeai-ats-checker
   ```

2. Install Ollama from [https://ollama.com/download](https://ollama.com/download)

3. Install dependencies and run:
   ```bash
   npm install
   ollama serve &  # Start Ollama in background
   ollama pull nomic-embed-text  # Download the model
   node ats-checker.js
   ```

### Windows (Semi-Automated)

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/resumeai-ats-checker.git
   cd resumeai-ats-checker
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Install Ollama from [https://ollama.com/download](https://ollama.com/download)

4. Start Ollama server (in a separate command prompt):
   ```bash
   ollama serve
   ```

5. Run the automated batch file:
   ```bash
   start.bat
   ```
   
   This will:
   - Check if Ollama is running
   - Verify the embedding model is installed
   - Run the ATS checker

### Using Your Own Resume and Job Description

1. Open `ats-checker.js` in a text editor
2. Replace the `jobDescription` variable with your target job description
3. Replace the `candidateResume` variable with your resume text
4. Run the checker again using the appropriate script for your OS

## Prerequisites

- Node.js (v14 or later)
- npm (Node Package Manager)
- Ollama (for embedding model)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/resumeai-ats-checker.git
cd resumeai-ats-checker
```

### 2. Automated Setup (Linux/Windows)

#### For Linux:

Use the provided shell scripts to automatically set up and run the application:

```bash
# Make scripts executable
chmod +x setup.sh start.sh

# Run the setup script (one-time setup)
./setup.sh

# Start the application (each time you want to run it)
./start.sh
```

The `setup.sh` script will:
- Check for and verify Node.js and npm installation
- Install Node.js dependencies
- Install Ollama if not already installed
- Pull the required embedding model

The `start.sh` script will:
- Verify Ollama server is running (and start it if not)
- Verify the embedding model is installed
- Run the ATS checker
- Shut down Ollama when done (if it was started by the script)

#### For Windows:

```bash
# Install dependencies manually
npm install

# Start the application using the batch file
start.bat
```

The `start.bat` script will check for Ollama, verify the model is installed, and run the ATS checker.

### 3. Manual Setup

If you prefer to set up manually, follow these steps:

#### Install Node Dependencies

```bash
npm install
```

This will install required packages:
- axios
- mathjs
- natural

#### Install and Set Up Ollama

Ollama is used for generating embeddings to perform semantic analysis of resume and job descriptions.

For Linux:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

For macOS:

Download and install from [https://ollama.com/download](https://ollama.com/download)

For Windows:

Download and install from [https://ollama.com/download](https://ollama.com/download)

#### Pull the Embedding Model

After installing Ollama, pull the `nomic-embed-text` model:

```bash
ollama pull nomic-embed-text
```

#### Start Ollama Server

Make sure the Ollama server is running:

```bash
ollama serve
```

Keep this terminal window open, and open a new one for the next steps.

## Usage

### Using Automation Scripts

For the simplest experience:

#### Linux:
```bash
# Just run the start script
./start.sh
```

#### Windows:
```bash
# Make sure Ollama is running in another window
# Then run the batch file
start.bat
```

### Basic Usage (Manual)

The ATS checker is configured with a sample job description and resume in the `ats-checker.js` file. To run the analysis with these samples:

```bash
node ats-checker.js
```

This will output a detailed analysis of how well the sample resume matches the job description.

### Customizing for Your Resume and Job Description

1. Open `ats-checker.js` in a text editor
2. Replace the contents of the `jobDescription` variable with the job description you're targeting
3. Replace the contents of the `candidateResume` variable with your resume text
4. Save the file and run the checker:

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

### Script-related Issues

If you encounter issues with the automation scripts:

1. Ensure scripts are executable: `chmod +x setup.sh start.sh`
2. If `start.sh` fails to start Ollama, try running it manually in a separate window: `ollama serve`
3. Check script logs for specific error messages
4. For Windows users, make sure to run `start.bat` from Command Prompt or PowerShell with administrator privileges if needed

### Embedding Model Issues

If you encounter errors related to the embedding model:

1. Ensure Ollama is running in a separate terminal window (`ollama serve`)
2. Check if the model was downloaded correctly (`ollama list`)
3. If needed, re-pull the model: `ollama pull nomic-embed-text`

### Performance Considerations

For large resumes or job descriptions, the analysis may take a moment to complete due to the embedding process.

## License

[MIT License](LICENSE)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. 