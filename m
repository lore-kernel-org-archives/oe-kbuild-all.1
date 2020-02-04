Content-Type: multipart/mixed; boundary="===============7986302072961307267=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.4.y-rt 206/261] drivers/gpu/drm/i915/display/intel_sprite.c:84:30: warning: unused variable 'pipe_update_lock'
Date: Tue, 04 Feb 2020 12:39:20 +0100
Message-ID: <20200204113920.tnzqn4nce2qtaqzm@linutronix.de>
In-Reply-To: <CAKwvOdnMeLaA2n3yVgP+RPO6dBOQPPUtmo99JhbseDYMekWbOg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7986302072961307267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-01-13 09:13:11 [-0800], Nick Desaulniers wrote:
> Hi Mike,
> Below is a report from a 0day bot build w/ Clang. Can you please take
> a look? Apologies if this has already been reported.

this hasn't been reported so far. The problem is that for !RT the
variable isn't touched. I have no idea why the variable itself is an
int, it does not look required. It might have been part of a debugging
API to spot wrong usage for !RT.

So either we trick the compiler into using it and check the type or
remove it=E2=80=A6

Sebastian
--===============7986302072961307267==--

