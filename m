Content-Type: multipart/mixed; boundary="===============0583275788323204758=="
MIME-Version: 1.0
From: Li, Aubrey <aubrey.li@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3] sched/fair: select idle cpu from idle cpumask for task wakeup
Date: Thu, 22 Oct 2020 09:28:09 +0800
Message-ID: <70792dce-c6a1-78f8-6f24-2bb04d42bfd8@linux.intel.com>
In-Reply-To: <202010220139.9jmvpk3E-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0583275788323204758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020/10/22 1:40, kernel test robot wrote:
> Hi Aubrey,
> =

> [FYI, it's a private test report for your RFC patch.]
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on tip/master linus/master linux/master v5.9]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

Yes this PATCH is based on 5.8.10 and I don't expect it works on v5.9.
I posted it as a RFC to request more discussion from the community.

Thanks,
-Aubrey

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Aubrey-Li/sched-fair-sel=
ect-idle-cpu-from-idle-cpumask-for-task-wakeup/20201021-230800
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git feff2=
e65efd8d84cf831668e182b2ce73c604bbb
> config: nds32-allnoconfig (attached as .config)
> compiler: nds32le-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/dbfb0d54ab82b9a27e28a8b=
850cfe1f1f542991a
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Aubrey-Li/sched-fair-select-idle=
-cpu-from-idle-cpumask-for-task-wakeup/20201021-230800
>         git checkout dbfb0d54ab82b9a27e28a8b850cfe1f1f542991a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dnds32 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    nds32le-linux-ld: kernel/sched/idle.o: in function `set_next_task_idle=
':
>    idle.c:(.text+0x30): undefined reference to `update_idle_cpumask'
>>> nds32le-linux-ld: idle.c:(.text+0x34): undefined reference to `update_i=
dle_cpumask'
>    nds32le-linux-ld: kernel/sched/idle.o: in function `pick_next_task_idl=
e':
>    idle.c:(.text+0x46): undefined reference to `update_idle_cpumask'
>    nds32le-linux-ld: idle.c:(.text+0x4a): undefined reference to `update_=
idle_cpumask'
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============0583275788323204758==--

