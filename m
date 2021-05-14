Content-Type: multipart/mixed; boundary="===============7014050063625137228=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
Date: Fri, 14 May 2021 09:13:13 -0400
Message-ID: <CAJKOXPcbDkuDpq3YCgKVW-9eUTJDymO1icb6BNnwzx3=9BRR8Q@mail.gmail.com>
In-Reply-To: <202105082122.yrF7ploN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7014050063625137228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 8 May 2021 at 09:30, kernel test robot <lkp@intel.com> wrote:
>
> Hi Krzysztof,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   dd860052c99b1e088352bdd4fb7aef46f8d2ef47
> commit: 7a69a6f68da5084e7f42df18bbc3b38f3785cccf mfd: omap-usb: Depend on=
 COMMON_CLK to fix compile tests
> date:   5 months ago
> config: mips-randconfig-c023-20210508 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D7a69a6f68da5084e7f42df18bbc3b38f3785cccf
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7a69a6f68da5084e7f42df18bbc3b38f3785cccf
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dmips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] und=
efined!

I sent a fix for this one.

Best regards,
Krzysztof
--===============7014050063625137228==--

