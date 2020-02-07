Content-Type: multipart/mixed; boundary="===============1758773799125989422=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [vincent.guittot:sched/pelt 3/5] kernel/sched/fair.c:1607:9-10: WARNING: return of 0/1 in function 'load_too_imbalanced' with return type bool
Date: Fri, 07 Feb 2020 22:19:16 +0800
Message-ID: <202002072209.1oo3567r%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1758773799125989422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/pelt
head:   72c9cba7acfa9d51fe5ced5ff3a3cde60c69e022
commit: a2bcf50a05b93817cf143756b6406c6cb5bc7a45 [3/5] sched/numa: replace =
runnable_load_avg by load_avg

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> kernel/sched/fair.c:1607:9-10: WARNING: return of 0/1 in function 'load_=
too_imbalanced' with return type bool
   kernel/sched/fair.c:9113:9-10: WARNING: return of 0/1 in function 'volun=
tary_active_balance' with return type bool

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1758773799125989422==--

