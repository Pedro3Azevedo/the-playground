import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from matplotlib.ticker import FuncFormatter

# 1. Setup the data (ALL SPORTS IN ENGLISH)
data = {
    "Year": list(range(2013, 2025)),
   # "Football": [
    #    153462,155968, 161167,
     #   168097, 176349, 189417, 184391, 190865, 126006, 195332, 215051, 238441
     #],
    "Swimming": [
        11651,21695, 43083,
        52355, 65499, 89755, 106127, 21479, 46980, 76833, 103494, 128091
    ],
    "Volleyball": [
 43023, 43076, 43120,
        43625, 44208, 44739, 48791, 53316, 40771, 51280, 59202, 60901
    ],
    "Handball": [
 46405,50114, 50244,
        49981, 49812, 49661, 49192, 45394, 31447, 42809, 48594, 57529
    ],
    "Tennis": [
         18459,19276, 16159,
        15755, 16139, 18839, 18731, 19243, 21784, 26390, 27578, 26279
    ],
    "Basketball": [
38347, 35590, 36688,
        40135, 41807, 39247, 31546, 26608, 18020, 27519, 30833, 31359
    ]
}

# 2. Create DataFrame
df = pd.DataFrame(data)
df_melted = df.melt('Year', var_name='Sport', value_name='Practitioners')

# 3. Create figure with custom background
# Increased width slightly (12x6) to fit all X-labels comfortably
fig, ax = plt.subplots(figsize=(12, 6), dpi=150)

# BASKETBALL-THEMED BACKGROUND
gradient = np.linspace(0, 1, 256).reshape(1, -1)
gradient = np.vstack([gradient] * 256)
ax.imshow(gradient, extent=[2012.5, 2024.5, 1000, 300000], aspect='auto', 
          cmap='copper', alpha=0.08, zorder=0)

# 4. Distinct colors
colors = {
    #"Football": "#2ca02c",
    "Swimming": "#1f77b4",
    "Volleyball": "#9467bd",
    "Handball": "#d62728",
    "Tennis": "#17becf",
    "Basketball": "#ff7f0e"
}

# 5. Plot lines
for sport in colors.keys():
    data_subset = df_melted[df_melted['Sport'] == sport]
    
    lw = 3.5 if sport == "Basketball" else 1.5
    alpha = 1.0 if sport == "Basketball" else 0.85
    
    ax.plot(
        data_subset['Year'], 
        data_subset['Practitioners'],
        label=sport,
        color=colors[sport],
        linewidth=lw,
        marker='o',
        markersize=5,
        alpha=alpha,
        zorder=3,
        markeredgewidth=1.5,
        markeredgecolor='white'
    )

# 6. ENHANCED GRID (Vertical & Horizontal)
# Vertical lines for EVERY year to trace values easily
ax.grid(True, axis='x', which='major', alpha=0.15, linestyle='--', linewidth=0.8, color='#666666')
ax.grid(True, axis='y', which='major', alpha=0.2, linestyle='-', linewidth=0.6, color='#999999')
ax.set_axisbelow(True)

# 7. Title and labels
ax.set_title(
    "Evolution from the Second to Sixth Federated Sports in Portugal (2013–2024)",
    fontsize=13, 
    weight='bold', 
    pad=15,
    color='#1a1a1a'
)
ax.set_xlabel("Year", fontsize=11, weight='bold', color='#333333')
ax.set_ylabel("Number of Athletes", fontsize=11, weight='bold', color='#333333')

# 8. Set Log Scale
#ax.set_yscale('log')

ax.grid(True, axis='x', which='major', alpha=0.15, linestyle='--', linewidth=0.8, color='#666666')
ax.grid(True, axis='y', which='major', alpha=0.2, linestyle='-', linewidth=0.6, color='#999999')
ax.set_axisbelow(True)

# 9. X-AXIS: SHOW EVERY SINGLE YEAR
ax.set_xticks(range(2013, 2025))
ax.set_xticklabels(range(2013, 2025), rotation=90, ha='center', fontsize=8)  # Rotated 90 degrees

# 10. Y-axis formatting

# Y-AXIS: Full range 0-250K but optimized for visibility
ax.set_ylim(0, 130000)

# Custom ticks: Dense at bottom, sparse at top
ticks = list(np.arange(0, 130001, 5000))
ax.set_yticks(ticks)

# Y-axis formatting
def k_formatter(x, pos):
    return f'{int(x/1000)}K'
ax.yaxis.set_major_formatter(FuncFormatter(k_formatter))
ax.tick_params(axis='y', labelsize=8)


# 11. Styled spines
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['left'].set_color('#8B4513')
ax.spines['bottom'].set_color('#8B4513')
ax.spines['left'].set_linewidth(1.5)
ax.spines['bottom'].set_linewidth(1.5)

# 12. Legend
legend = ax.legend(
    frameon=True, 
    loc='center left', 
    bbox_to_anchor=(1, 0.5),
    fontsize=10,
    framealpha=0.95,
    edgecolor='#8B4513',
    fancybox=True
)
legend.get_frame().set_facecolor('#fffaf0')
legend.get_frame().set_linewidth(1.5)

# 13. Background color
ax.set_facecolor('#fffbf0')

# 14. Add attribution
ax.text(0.98, 0.02, 'Data: IPDJ', 
        transform=ax.transAxes, fontsize=8, alpha=0.6, 
        ha='right', style='italic', color='#666666')

# 15. Tight layout
plt.tight_layout()

# 16. Save
plt.savefig(
    "sports_comparison_detailed.pdf", 
    format='pdf', 
    dpi=150,
    bbox_inches='tight',
    facecolor='#fffbf0'
)

print("✓ Detailed plot saved as 'sports_comparison_detailed.pdf'")
plt.show()
