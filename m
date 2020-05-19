Content-Type: multipart/mixed; boundary="===============6799571533032948148=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: kbuild-all@lists.01.org
Subject: Re: [daniel.lezcano:timers/drivers/timer-ti 2/2] drivers/clocksource/timer-ti-dm-systimer.c:517:6: warning: variable 'pa' set but not used
Date: Tue, 19 May 2020 08:53:24 -0700
Message-ID: <20200519155324.GR43721@atomide.com>
In-Reply-To: <202005192002.BUOMi5g2%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6799571533032948148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* kbuild test robot <lkp@intel.com> [200519 12:43]:
> tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drivers/=
timer-ti
> head:   aba1ad05da088944a62eb87fb0cd8391152e8985
> commit: aba1ad05da088944a62eb87fb0cd8391152e8985 [2/2] clocksource/driver=
s/timer-ti-dm: Add clockevent and clocksource support
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout aba1ad05da088944a62eb87fb0cd8391152e8985
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> drivers/clocksource/timer-ti-dm-systimer.c: In function 'dmtimer_clockeve=
nt_init':
> >> drivers/clocksource/timer-ti-dm-systimer.c:517:6: warning: variable 'p=
a' set but not used [-Wunused-but-set-variable]
> 517 |  u32 pa;
> |      ^~
> drivers/clocksource/timer-ti-dm-systimer.c: In function 'dmtimer_clocksou=
rce_init':
> drivers/clocksource/timer-ti-dm-systimer.c:640:6: warning: variable 'pa' =
set but not used [-Wunused-but-set-variable]
> 640 |  u32 pa;
> |      ^~

Thanks, I've sent a fix removing these as patch in case Daniel did not
already fix it locally:

[PATCH] clocksource/drivers/timer-ti-dm: Fix warning for set but not used

Regards,

Tony
--===============6799571533032948148==--

