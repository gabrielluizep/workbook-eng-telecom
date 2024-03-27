import pandas as pd
import plotly.express as px
import streamlit as st
from numpy import cos, e, linspace, pi

st.title("Fourier Series")

col1, col2 = st.columns(2)

with col1:
    st.latex(
        r"""
        \begin{align*}
        x(t) &= a_0 + 2 \sum_{k=1}^{\infty} a_k e^{jk\omega_0 t}\\
        \\

        \omega_0 &= \frac{2\pi}{T} \\
        \end{align*}
        """
    )

with col2:
    st.latex(
        r"""
        \begin{align*}
        a_0 &= \frac{1}{T} \int_{0}^{T} x(t) dt \\
    
        \\  

        a_k &= \frac{1}{T} \int_{0}^{T} x(t) e^{-jk\omega_0 t} dt \\
    
        \end{align*}
        """
    )

st.header("Questions")
t = linspace(-5, 5, 1000)

# =============================================================================
st.subheader("a)")
st.latex(r"y(t) = 0 + \sum_{k=1}^{\infty} \frac{j (-1)^{k}}{k \pi} e^{jk\pi t} \\")

with st.expander(label="Demonstration"):
    st.markdown("Calculating the integral of $te^{at}$")
    st.latex(
        r"""
        \begin{align*}
        \int f g' dt &= f g - \int f' g dt \\
        
        \\

        f &= t ; g' = e^{at}\\
        f' &= 1 ; g = \frac{1}{a} e^{at} \\
        
        \\

        \int t e^{at} dt &= t \frac{1}{a} e^{at} - \int 1 \frac{1}{a} e^{at} dt \\ 
        &= \frac{1}{a} t e^{at} - \frac{1}{a} \int e^{at} dt \\
        &= \frac{1}{a} t e^{at} - \frac{1}{a^2} e^{at} + C \\ 
        &= \frac{(at - 1) e^{at}}{a^2}  + C \\
        \end{align*}

        """
    )

    st.latex(
        r"""
        \begin{align*}
        a_k &= \frac{1}{T} \int_{0}^{T} x(t) e^{-jk\frac{2\pi}{T}t} dt \\
        a_k &= \frac{1}{2} \int_{0}^{2} {t[u(t+1)-u(t-1)]} e^{-jk\pi t} dt \\
        a_k &= \frac{1}{2} \int_{-1}^{1} t e^{-jk\pi t} dt \\
        
        \\

        \int t e^{-jk\pi t} dt &=  \frac{(-jk\pi t - 1) e^{-jk\pi t}}{(-jk\pi)^2} \\
        &= \frac{(-jk\pi t - 1) e^{-jk\pi t}}{j^2k^2\pi^2} \\
        &= \frac{(-jk\pi t - 1) e^{-jk\pi t}}{(-1)2k^2\pi^2} \\
        &= \frac{(jk\pi t + 1) e^{-jk\pi t}}{k^2\pi^2} \\
        
        \\

        a_k &= \frac{1}{2} \left[\frac{(jk\pi t + 1) e^{-jk\pi t}}{k^2\pi^2}\right]\biggr\vert_{-1}^{1} \\
        a_k &= \frac{1}{2} \left[\frac{(jk\pi + 1) e^{-jk\pi}}{k^2 \pi^2} - \frac{(-jk\pi + 1) e^{jk\pi}}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{(jk\pi + 1) e^{-jk\pi}}{k^2 \pi^2} + \frac{(jk\pi - 1) e^{jk\pi}}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{jk\pi e^{-jk\pi}}{k^2 \pi^2} + \frac{e^{-jk\pi}}{k^2 \pi^2} + \frac{jk\pi e^{jk\pi}}{k^2\pi^2} - \frac{e^{jk\pi}}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{j e^{-jk\pi}}{k \pi} + \frac{e^{-jk\pi}}{k^2 \pi^2} + \frac{j e^{jk\pi}}{k \pi} - \frac{e^{jk\pi}}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{j e^{-jk\pi} + j e^{jk\pi}}{k \pi} + \frac{e^{-jk\pi} - e^{jk\pi}}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{j (e^{-jk\pi} + e^{jk\pi})}{k \pi} + \frac{e^{-jk\pi} - e^{jk\pi}}{k^2\pi^2}\right] \\
        
        \\

        \begin{cases}
        e^{j\theta} = \cos\theta + j\sin\theta \\
        e^{-j\theta} = \cos\theta - j\sin\theta \\
        \end{cases}

        &\quad\therefore\quad

        \begin{cases}
        e^{j\theta} + e^{-j\theta} = 2\cos\theta \\
        e^{j\theta} - e^{-j\theta} = 2j\sin\theta \\
        \end{cases}

        \\

        a_k &= \frac{1}{2} \left[\frac{j (2\cos(jk\pi))}{k \pi} + \frac{2j\sin(jk\pi)}{k^2\pi^2}\right] \\
        
        \\
        \cos(k\pi) &=
        \begin{cases}
        1 & \text{if } k \text{ is even} \\
        -1 & \text{if } k \text{ is odd} \\
        \end{cases}
        = (-1)^k \\
        
        \\

        \sin(k\pi) &=
        \begin{cases}
        0 & \text{if } k \text{ is even} \\
        0 & \text{if } k \text{ is odd} \\
        \end{cases}
        = 0 \\
        
        \\

        a_k &= \frac{1}{2} \left[\frac{j (2(-1)^k)}{k \pi} + \frac{2j(0)}{k^2\pi^2}\right] \\
        a_k &= \frac{1}{2} \left[\frac{j (2(-1)^k)}{k \pi}\right] \\
        a_k &= \frac{j (-1)^{k}}{k \pi} \\
        
        \\

        y(t) &= a_0 + \frac{1}{T} \sum_{k=-\infty}^{\infty} a_k e^{jk\frac{2\pi}{T}t} \\
        &= 0 + \frac{1}{2} \sum_{k=-\infty}^{\infty} \frac{j (-1)^{k}}{k \pi} e^{jk\frac{2\pi}{2}t} \\
        &= \frac{1}{2} \sum_{k=-\infty}^{\infty} \frac{j (-1)^{k}}{k \pi} e^{jk\pi t} \\
        &\equiv 2 \cdot \frac{1}{2} \sum_{k=1}^{\infty} \frac{j (-1)^{k}}{k \pi} e^{jk\pi t} \\
        &= \sum_{k=1}^{\infty} \frac{j (-1)^{k}}{k \pi} e^{jk\pi t} \\
        \end{align*}
        """
    )

qa = dict({"y": 0, "a_0": 0, "a_k": lambda k: (1j * (-1) ** k) / (k * pi), "w_0": pi})
for k in range(1, 1000):
    qa["y"] = qa["y"] + qa["a_k"](k) * e ** (1j * k * qa["w_0"] * t)

qa["y"] = qa["y"] * 2 + qa["a_0"]
df_a = pd.DataFrame(qa["y"].real, index=t, columns=["y"])

fig_a = px.line(df_a, x=None, y="y")
fig_a.update_layout(
    title="Fourier Series",
    xaxis_title="t",
    yaxis_title="y(t)",
    legend_title="",
    font=dict(family="Courier New, monospace", size=18, color="RebeccaPurple"),
)
st.plotly_chart(fig_a)

# =============================================================================
st.subheader("d)")
st.latex(
    r"y(t) = -\frac{1}{2} + 2 \sum_{k=1}^{\infty} \left[\frac{1}{2} - (-1)^k\right] e^{jk\pi t}"
)

with st.expander(label="Demonstration"):
    st.latex(
        r"""
        \begin{align*}  
        T = 2 ; &\quad \omega_0 = \frac{2\pi}{T} = \frac{2\pi}{2} = \pi \\
        
        \\
        
        a_0 &= \frac{1}{T} \int_{0}^{T} x(t) dt \\cdot
        &= -\frac{1}{2} \\
        
        \\

        a_k &= \frac{1}{T} \int_{0}^{T} x(t) e^{-jk\omega_0 t} dt \\
        &= \frac{1}{2} \int_{0}^{2} \left[\delta(t) - 2 \delta(t-1) \right] e^{-jk\pi t} dt \\
        &= \frac{1}{2} \left[\int_{0}^{2} \delta(t) e^{-jk\pi t} dt - 2 \int_{0}^{2} \delta(t-1) e^{-jk\pi t} dt\right] \\
        &= \frac{1}{2} \left[\int_{0}^{2} \delta(t) e^{-jk\pi \cdot 0} dt - 2 \int_{0}^{2} \delta(t-1) e^{-jk\pi \cdot (1)} dt\right] \\
        &= \frac{1}{2} \left[e^{0} \int_{0}^{2} \delta(t) dt - 2 e^{-jk\pi} \int_{0}^{2} \delta(t-1) dt\right] \\ 
        &= \frac{1}{2} \left[1 - 2 e^{-jk\pi} \right] \\
        &= \frac{1}{2} \left[1 - 2 \cdot (-1)^k \right] \\
        &= \frac{1}{2} - (-1)^k \\
        
        \\

        y(t) &= a_0 + \frac{1}{T} \sum_{k=-\infty}^{\infty} a_k e^{jk\omega_0 t} \\
        &= -\frac{1}{2} + \frac{1}{2} \sum_{k=-\infty}^{\infty} \left[\frac{1}{2} - (-1)^k\right] e^{jk\pi t} \\
        &\equiv -\frac{1}{2} + 2 \cdot \frac{1}{2} \sum_{k=1}^{\infty} \left[\frac{1}{2} - (-1)^k\right] e^{jk\pi t}\\
        &= -\frac{1}{2} + 2 \sum_{k=1}^{\infty} \left[\frac{1}{2} - (-1)^k\right] e^{jk\pi t}
        \end{align*}
        """
    )

qd = dict({"y": 0, "a_0": -1 / 2, "a_k": lambda k: (1 / 2 - (-1) ** k), "w_0": pi})
for k in range(1, 30):
    qd["y"] = qd["y"] + qd["a_k"](k) * e ** (1j * k * qd["w_0"] * t)

qd["y"] = qd["y"] * 2 + qd["a_0"]

df_d = pd.DataFrame(qd["y"].real, index=t, columns=["y"])

st.line_chart(df_d, x=None, y="y")

# =============================================================================
st.subheader("e)")
st.latex(
    r"y(t) = 0 + \frac{1}{3} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right] e^{jk\pi t/3} \\"
)

with st.expander(label="Demonstration"):
    st.latex(
        r"""
        \begin{align*}
        T = 6 ; &\quad \omega_0 = \frac{2\pi}{T} = \frac{2\pi}{6} = \frac{\pi}{3} \\
        
        \\

        a_0 &= \frac{1}{T} \int_{0}^{T} x(t) dt \\
        &= \frac{1}{6} \left[ \int_{-2}^{-1} dt - \int_{1}^{2} dt \right]\\
        &= \frac{1}{6} \left[ t \biggr\vert_{-2}^{-1} - t \biggr\vert_{1}^{2}\right] \\
        &= \frac{1}{6} \left[ (-1) - (-2) - \left(2 - 1 \right) \right] \\
        &= \frac{1}{6} \left[ 1 - 1 \right] \\
        &= 0 \\
        
        \\

        a_k &= \frac{1}{T} \int_{0}^{T} x(t) e^{-jk\omega_0 t} dt \\
        
        &= \frac{1}{6} \left[\int_{-2}^{-1} e^{-jk\pi t/3} dt - \int_{1}^{2} e^{-jk\pi t/3} dt \right]\\
        &= \frac{1}{6} \left[ \frac{e^{-jk\pi t/3}}{-jk\pi/3} \biggr\vert_{-2}^{-1} - \frac{e^{-jk\pi t/3}}{-jk\pi/3} \biggr\vert_{1}^{2}\right]\\
        &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ e^{-jk\pi/3t} \biggr\vert_{-2}^{-1} - e^{-jk\pi/3t} \biggr\vert_{1}^{2}\right]\\
        &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ \left(e^{-jk\pi/3(-1)} - e^{-jk\pi/3(-2)}\right) - \left(e^{-jk\pi/3(2)} - e^{-jk\pi/3(1)}\right)\right]\\
        &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ \left(e^{jk\pi/3} - e^{2jk\pi/3}\right) - \left(e^{-2jk\pi/3} - e^{-jk\pi/3}\right)\right]\\
        &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ e^{jk\pi/3} - e^{2jk\pi/3} - e^{-2jk\pi/3} + e^{-jk\pi/3}\right]\\
        &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ \left(e^{jk\pi/3} + e^{-jk\pi/3}\right) - \left(e^{2jk\pi/3} + e^{-2jk\pi/3}\right)\right]\\
        
        \\ 

        \text{Obs.:} &\begin{cases}
        e^{j\theta} = \cos\theta + j\sin\theta \\
        e^{-j\theta} = \cos\theta - j\sin\theta \\
        \end{cases}

        \quad \therefore \quad

        e^{-j\theta} + e^{j\theta} = 2\cos\theta \\

        \\

        a_k &= \frac{1}{6} \frac{1}{-jk\pi/3} \left[ 2\cos(k\pi/3) - 2\cos(2k\pi/3)\right]\\
        &= \frac{1}{6} \frac{1}{jk\pi/3} \left[ 2\cos(2k\pi/3) - 2\cos(k\pi/3)\right]\\
        &= \frac{1}{3} \frac{1}{jk\pi/3} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right]\\
        &= \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right]\\
        
        \\

        y(t) &= a_0 + \frac{1}{T} \sum_{k=-\infty}^{\infty} a_k e^{jk\omega_0 t} \\
        &= 0 + \frac{1}{6} \sum_{k=-\infty}^{\infty} \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right] e^{jk\pi t/3} \\
        &= \frac{1}{6} \sum_{k=-\infty}^{\infty} \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right] e^{jk\pi t/3} \\
        &\equiv 2 \cdot \frac{1}{6} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right] e^{jk\pi t/3} \\
        &= \frac{1}{3} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ \cos(2k\pi/3) - \cos(k\pi/3)\right] e^{jk\pi t/3} \\
        \end{align*}
        """
    )

qe = dict(
    {
        "y": 0,
        "a_0": 0,
        "a_k": lambda k: (1 / (1j * k)) * (cos(2 * k * pi / 3) - cos(k * pi / 3)),
        "w_0": pi / 3,
    }
)
for k in range(1, 1000):
    qe["y"] = qe["y"] + qe["a_k"](k) * e ** (1j * k * qe["w_0"] * t)

qe["y"] = qe["y"] * 2 + qe["a_0"]
df_e = pd.DataFrame(qe["y"].real, index=t, columns=["y"])

st.line_chart(df_e, x=None, y="y")

# =============================================================================
st.subheader("f)")
st.latex(
    r"y(t) = 1 + \frac{2}{3} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ 2 - e^{-2jk\pi/3} - e^{-4jk\pi/3} \right] e^{jk\pi t/3} \\"
)

with st.expander(label="Demonstration"):
    st.latex(
        r"""
        \begin{align*}
        T = 3 ; &\quad \omega_0 = \frac{2\pi}{T} = \frac{2\pi}{3} \\
        
        \\

        a_0 &= \frac{1}{T} \int_{0}^{T} x(t) dt \\
        &= \frac{1}{3} \left[ \int_{0}^{1} 2 dt + \int_{1}^{2} 1 dt \right]\\
        &= \frac{1}{3} \left[ 2t \biggr\vert_{0}^{1} + t \biggr\vert_{1}^{2}\right] \\
        &= \frac{1}{3} \left[ 2 \left(1 - 0\right) + \left(2 - 1 \right) \right] \\
        &= \frac{1}{3} \left[ 2 + 1 \right] \\
        &= 1 \\
        
        \\

        a_k &= \frac{1}{T} \int_{0}^{T} x(t) e^{-jk\omega_0 t} dt \\
        &= \frac{1}{3} \left[\int_{0}^{1} 2 e^{-2jk\pi t/3} dt + \int_{1}^{2} 1 e^{-2jk\pi t/3} dt \right]\\
        &= \frac{1}{3} \left[ 2 \int_{0}^{1} e^{-2jk\pi t/3} dt + \int_{1}^{2} e^{-2jk\pi t/3} dt \right]\\
        &= \frac{1}{3} \left[ 2 \frac{e^{-2jk\pi t/3}}{-jk\pi/3} \biggr\vert_{0}^{1} + \frac{e^{-2jk\pi t/3}}{-jk\pi/3} \biggr\vert_{1}^{2} \right]\\
        &= \frac{1}{3} \cdot \frac{1}{-jk\pi/3} \left[ 2 e^{-2jk\pi t/3} \biggr\vert_{0}^{1} + e^{-2jk\pi t/3} \biggr\vert_{1}^{2} \right]\\
        &= \frac{1}{3} \cdot \frac{1}{-jk\pi/3} \left[ 2 \left(e^{-2jk\pi/3} - e^{0}\right) + \left(e^{-4jk\pi/3} - e^{-2jk\pi/3}\right) \right]\\
        &= \frac{1}{3} \cdot \frac{1}{-jk\pi/3} \left[ 2 e^{-2jk\pi/3} - 2 + e^{-4jk\pi/3} - e^{-2jk\pi/3} \right]\\
        &= \frac{1}{3} \cdot \frac{1}{-jk\pi/3} \left[ e^{-2jk\pi/3} - 2 + e^{-4jk\pi/3} \right]\\
        &= \frac{1}{3} \cdot \frac{1}{jk\pi} \left[ 2 - e^{-2jk\pi/3} - e^{-4jk\pi/3} \right]\\

        \\

        y(t) &= a_0 + \frac{1}{T} \sum_{k=-\infty}^{\infty} a_k e^{jk\omega_0 t} \\
        &= 1 + \frac{1}{3} \sum_{k=-\infty}^{\infty} \frac{1}{jk\pi} \left[ 2 - e^{-2jk\pi/3} - e^{-4jk\pi/3} \right] e^{jk\pi t/3} \\
        &\equiv 1 + 2 \cdot \frac{1}{3} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ 2 - e^{-2jk\pi/3} - e^{-4jk\pi/3} \right] e^{jk\pi t/3} \\
        &= 1 + \frac{2}{3} \sum_{k=1}^{\infty} \frac{1}{jk\pi} \left[ 2 - e^{-2jk\pi/3} - e^{-4jk\pi/3} \right] e^{jk\pi t/3} \\
        \end{align*}
        """
    )

y_f = 0
f = dict(
    {
        "y": 0,
        "a_0": 1,
        "a_k": lambda k: (1 / (3 * 1j * k * pi))
        * (2 - (e ** (-2 * k * pi * 1j / 3)) - (e ** (-4 * k * pi * 1j / 3))),
        "w_0": pi / 3,
    }
)

for k in range(1, 1000):
    f["y"] = f["y"] + f["a_k"](k) * (e ** (2 * k * f["w_0"] * 1j * t))

f["y"] = 2 / 3 * f["y"] + 1
df_f = pd.DataFrame(f["y"].real, index=t, columns=["y"])

st.line_chart(df_f, x=None, y="y")
