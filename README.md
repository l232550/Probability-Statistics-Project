
---

# 🌾 Interactive Irrigation Data Dashboard

*MT2005 Probability & Statistics Project*

## 📊 Overview

This project presents an **interactive dashboard built with R Shiny** to analyze irrigation trends across Pakistan (2015–2022). It focuses on **areas irrigated by canals, tubewells, wells, and other sources** across different provinces.

Developed as part of the **MT2005 Probability and Statistics** course, this tool combines **interactive visualization**, **statistical analysis**, and a **user-friendly interface** to explore rich agricultural data.

---

## 🎥 Demo

Watch a quick walkthrough of the dashboard in action:  
[📂 Click here to watch the demo video](demo.mp4)

> The video file is included in this repository and located in the root directory. It may open in a new tab or download depending on your browser.

---

## ✨ Features

* 🔍 **Filterable data table** by year and province
* 📈 **Multiple plot types**: histograms, bar charts, boxplots, pie charts
* 📉 **Regression analysis**: linear and multiple regression tools
* 🧰 Built with `shinydashboard` and enhanced via `plotly` for interactivity
* 🧹 Clean and tidy data manipulation with `dplyr` and `tidyr`

---

## 📁 Dataset Source

Data sourced from the **Pakistan Bureau of Statistics**:
[Area Irrigated by Different Sources (2015–2022)](https://www.pbs.gov.pk/sites/default/files/tables/agriculture_statistics/new/Area_Irrigated_by_Different_Sources.pdf)

---

## ⚙️ Installation & Usage

### 🔧 Prerequisites

Ensure you have **R (v4.0+)** and **RStudio**. Then install the required packages:

```r
install.packages(c(
  "shiny", "shinydashboard", "plotly", "ggplot2", 
  "DT", "dplyr", "tidyr", "broom", 
  "RColorBrewer", "plotrix"
))
```

### ▶️ Running the App

1. Clone the repository:

   ```bash
   git clone https://github.com/USERNAME/REPOSITORY.git
   ```
2. Open the project in **RStudio**
3. Run `app.R` by clicking **Run App** or using:

   ```r
   shiny::runApp()
   ```

---

## 👥 Project Team

<table>
  <tr>
    <td align="center" valign="top" style="padding: 10px;">
      <a href="https://github.com/l232550" style="text-decoration: none; color: inherit;">
        <img src="https://avatars.githubusercontent.com/u/60905341?v=4" width="100" alt="Tooba Nadeem" style="border-radius: 8px;" /><br />
        <b>Tooba Nadeem</b>
      </a><br />
      <small>23L-2550</small>
    </td>

    <td align="center" valign="top" style="padding: 10px;">
      <a href="https://github.com/AbdullahHabib" style="text-decoration: none; color: inherit;">
        <img src="https://avatars.githubusercontent.com/u/44205846?v=4" width="100" alt="Abdullah Habib" style="border-radius: 8px;" /><br />
        <b>Abdullah Habib</b>
      </a><br />
      <small>23F-3061</small>
    </td>
  </tr>
  <tr>
    <td colspan="2" style="padding: 10px; text-align: center; font-size: 14px;">
      <ul style="list-style: none; padding: 0; margin: 0;">
        <li><b>Section:</b> BS(SE)-4A</li>
        <li><b>Instructor:</b> <em>Dr. Haris Khurram</em></li>
      </ul>
    </td>
  </tr>
</table>


---

## 📄 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---
