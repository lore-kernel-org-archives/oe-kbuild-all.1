Content-Type: multipart/mixed; boundary="===============6978505357127623261=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mel:sched-sisrewrite-v1r3 9/13] kernel/sched/fair.c:5944:6: error: implicit declaration of function '__test_idle_cores'
Date: Wed, 26 Feb 2020 05:22:36 +0800
Message-ID: <202002260554.Df0iA7lJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6978505357127623261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git sched=
-sisrewrite-v1r3
head:   cb9492ad9bd4da41afa994fbe26eac85672b2daa
commit: 7ee915b436cf9c26b3b51e4df6774aa556b34c9a [9/13] sched/fair: Classif=
y the type of search that select_idle_cpu should conduct
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 7ee915b436cf9c26b3b51e4df6774aa556b34c9a
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sis_classify':
>> kernel/sched/fair.c:5944:6: error: implicit declaration of function '__t=
est_idle_cores' [-Werror=3Dimplicit-function-declaration]
    5944 |  if (__test_idle_cores(sds))
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:6047:20: error: conflicting types for '__test_idle_c=
ores'
    6047 | static inline bool __test_idle_cores(struct sched_domain_shared =
*sds)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5944:6: note: previous implicit declaration of '__te=
st_idle_cores' was here
    5944 |  if (__test_idle_cores(sds))
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'sis_start_target':
   kernel/sched/fair.c:6078:12: error: implicit declaration of function 'al=
t_smt_target'; did you mean 'sis_start_target'? [-Werror=3Dimplicit-functio=
n-declaration]
    6078 |   target =3D alt_smt_target(cpus, target);
         |            ^~~~~~~~~~~~~~
         |            sis_start_target
   kernel/sched/fair.c: In function 'select_idle_cpu':
   kernel/sched/fair.c:6206:3: error: implicit declaration of function 'set=
_idle_cores'; did you mean 'test_idle_cores'? [-Werror=3Dimplicit-function-=
declaration]
    6206 |   set_idle_cores(target, 0);
         |   ^~~~~~~~~~~~~~
         |   test_idle_cores
   cc1: some warnings being treated as errors

vim +/__test_idle_cores +5944 kernel/sched/fair.c

  5940	=

  5941	static inline enum
  5942	sis_type sis_classify(struct sched_domain_shared *sds, int target)
  5943	{
> 5944		if (__test_idle_cores(sds))
  5945			return sis_has_idle_core;
  5946	=

  5947		return READ_ONCE(sds->sis_type);
  5948	}
  5949	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6978505357127623261==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6978505357127623261==--

