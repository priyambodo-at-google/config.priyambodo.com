# Suggested code may be subject to a license. Learn more: ~LicenseLog:1580355659.
# Base image with Python and Poetry pre-installed
FROM python:3.11 AS base

# Install Poetry - Used for dependency management
RUN pip install poetry

# Set working directory to /app inside the container
WORKDIR /app

# Copy project configuration files (pyproject.toml and poetry.lock)
COPY pyproject.toml poetry.lock
 ./

# Install project dependencies using Poetry
# virtualenvs.create false: Prevents Poetry from creating a virtual environment
# --no-interaction: Runs the installation without asking for user input
# --no-ansi: Disables ANSI escape codes in the output
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copy the rest of the application code into the container
COPY . .

# Expose port 8080 for Streamlit to run on
EXPOSE 8080

# Define the command to run when the container starts
# This starts the Streamlit app using the specified file and port
ENTRYPOINT ["streamlit", "run", "0_🥷_I_am_Gemini_v6.py", "--server.port=8080", "--server.address=0.0.0.0"]
