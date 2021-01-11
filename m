Content-Type: multipart/mixed; boundary="===============7601598461749868317=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.10.y-rt-rebase 78/268] ERROR: modpost: ".trace_event_buffer_commit__" undefined!
Date: Mon, 11 Jan 2021 10:43:05 +0100
Message-ID: <20210111094305.eu4zagsageuelb6o@linutronix.de>
In-Reply-To: <202101091712.fUTtUcqz-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7601598461749868317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-09 17:26:19 [+0800], kernel test robot wrote:
> Hi Sebastian,
Hi,

> First bad commit (maybe !=3D root cause):

This is the case, it also happens without any of the patches applied.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git linux-5.10.y-rt-rebase
> head:   84e06671a0c96a0522167ab39e75425b056eaeef
> commit: 6bafcad3f4cdff454cd612d108fd7c70bf0e12bd [78/268] tracing: Merge =
irqflags + preemt counter, add RT bits
> config: powerpc-randconfig-r004-20210108 (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-dev=
el.git/commit/?id=3D6bafcad3f4cdff454cd612d108fd7c70bf0e12bd
>         git remote add linux-rt-devel https://git.kernel.org/pub/scm/linu=
x/kernel/git/rt/linux-rt-devel.git
>         git fetch --no-tags linux-rt-devel linux-5.10.y-rt-rebase
>         git checkout 6bafcad3f4cdff454cd612d108fd7c70bf0e12bd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dpowerpc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> ERROR: modpost: ".__gcov_exit" [samples/trace_printk/trace-printk.ko] und=
efined!
=E2=80=A6

Sebastian
--===============7601598461749868317==--

