Content-Type: multipart/mixed; boundary="===============7181024884449102547=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v3] sched/fair: select idle cpu from idle cpumask for task wakeup
Date: Thu, 22 Oct 2020 01:40:00 +0800
Message-ID: <202010220139.9jmvpk3E-lkp@intel.com>
In-Reply-To: <20201021150335.1103231-1-aubrey.li@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7181024884449102547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Aubrey,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master linus/master linux/master v5.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Aubrey-Li/sched-fair-selec=
t-idle-cpu-from-idle-cpumask-for-task-wakeup/20201021-230800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git feff2e6=
5efd8d84cf831668e182b2ce73c604bbb
config: nds32-allnoconfig (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dbfb0d54ab82b9a27e28a8b85=
0cfe1f1f542991a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Aubrey-Li/sched-fair-select-idle-c=
pu-from-idle-cpumask-for-task-wakeup/20201021-230800
        git checkout dbfb0d54ab82b9a27e28a8b850cfe1f1f542991a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnds32 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nds32le-linux-ld: kernel/sched/idle.o: in function `set_next_task_idle':
   idle.c:(.text+0x30): undefined reference to `update_idle_cpumask'
>> nds32le-linux-ld: idle.c:(.text+0x34): undefined reference to `update_id=
le_cpumask'
   nds32le-linux-ld: kernel/sched/idle.o: in function `pick_next_task_idle':
   idle.c:(.text+0x46): undefined reference to `update_idle_cpumask'
   nds32le-linux-ld: idle.c:(.text+0x4a): undefined reference to `update_id=
le_cpumask'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7181024884449102547==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
3ACX7jRQZ5c9SIGZ+Oj/ANtbgfAgSgAA
--===============7181024884449102547==--

