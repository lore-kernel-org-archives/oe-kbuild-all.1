Content-Type: multipart/mixed; boundary="===============5239586090490231199=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.6/muqss 17/18] kernel/sched/MuQSS.c:1061:37: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sun, 10 May 2020 16:21:53 +0800
Message-ID: <202005101651.XBTXvJ4y%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5239586090490231199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.6/muqss
head:   e70073b6a71de959a53ff82f74481c15fa23b2cd
commit: d5ebb5eb13168ae8e9cb78540557301bc339abf8 [17/18] muqss: Merge v0.199
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout d5ebb5eb13168ae8e9cb78540557301bc339abf8
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/sched/MuQSS.c:1061:37: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct *tsk @@    =
got struct task_structstruct task_struct *tsk @@
>> kernel/sched/MuQSS.c:1061:37: sparse:    expected struct task_struct *tsk
>> kernel/sched/MuQSS.c:1061:37: sparse:    got struct task_struct [noderef=
] <asn:4> *curr
>> kernel/sched/MuQSS.c:1064:21: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *preempt @@=
    got struct task_structstruct task_struct *preempt @@
>> kernel/sched/MuQSS.c:1064:21: sparse:    expected struct task_struct *pr=
eempt
   kernel/sched/MuQSS.c:1064:21: sparse:    got struct task_struct [noderef=
] <asn:4> *curr
   kernel/sched/MuQSS.c:1070:40: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct *tsk @@    =
got struct task_structstruct task_struct *tsk @@
   kernel/sched/MuQSS.c:1070:40: sparse:    expected struct task_struct *tsk
   kernel/sched/MuQSS.c:1070:40: sparse:    got struct task_struct [noderef=
] <asn:4> *curr
>> kernel/sched/MuQSS.c:1075:38: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
>> kernel/sched/MuQSS.c:1075:38: sparse:    expected struct task_struct *p
   kernel/sched/MuQSS.c:1075:38: sparse:    got struct task_struct [noderef=
] <asn:4> *curr
   kernel/sched/MuQSS.c:1709:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:1709:17: sparse:    struct sched_domain [noderef] <=
asn:4> *
   kernel/sched/MuQSS.c:1709:17: sparse:    struct sched_domain *
>> kernel/sched/MuQSS.c:1857:21: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct const *p @@=
    got struct task_struct task_struct const *p @@
>> kernel/sched/MuQSS.c:2337:11: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
   kernel/sched/MuQSS.c:2384:16: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *parent @@ =
   got struct task_structstruct task_struct *parent @@
>> kernel/sched/MuQSS.c:2396:17: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *rq_curr @@=
    got struct task_structstruct task_struct *rq_curr @@
>> kernel/sched/MuQSS.c:3349:35: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@    expected struct task_struct *p @@    g=
ot struct task_structstruct task_struct *p @@
   kernel/sched/MuQSS.c:3581:37: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
   kernel/sched/MuQSS.c:3951:19: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
>> kernel/sched/MuQSS.c:4024:14: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *prev @@   =
 got struct task_structstruct task_struct *prev @@
   kernel/sched/MuQSS.c:4489:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:4489:17: sparse:    struct task_struct *
   kernel/sched/MuQSS.c:4489:17: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:4659:30: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:4659:30: sparse:    struct task_struct [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:4659:30: sparse:    struct task_struct *
>> kernel/sched/MuQSS.c:5617:14: sparse: sparse: incorrect type in assignme=
nt (different address spaces) @@    expected struct task_struct *rq_p @@   =
 got struct task_structstruct task_struct *rq_p @@
   kernel/sched/MuQSS.c:5625:34: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
   kernel/sched/MuQSS.c:5894:25: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@    expected struct task_struct *p @@    go=
t struct task_structstruct task_struct *p @@
   kernel/sched/MuQSS.c:6063:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6063:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6063:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6471:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6471:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6471:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6478:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.c:6478:9: sparse:    struct sched_domain [noderef] <a=
sn:4> *
   kernel/sched/MuQSS.c:6478:9: sparse:    struct sched_domain *
   kernel/sched/MuQSS.c:6827:17: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:6827:17: sparse:    struct sched_domain [noderef] <=
asn:4> *
   kernel/sched/MuQSS.c:6827:17: sparse:    struct sched_domain *
>> kernel/sched/MuQSS.c:7439:16: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@    expected struct task_struct * @@=
    got struct task_structstruct task_struct * @@
   kernel/sched/MuQSS.h:773:16: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/MuQSS.h:773:16: sparse:    struct update_util_data [noderef=
] <asn:4> *
   kernel/sched/MuQSS.h:773:16: sparse:    struct update_util_data *
   kernel/sched/MuQSS.c:1439:38: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:1439:38: sparse:    struct task_struct [noderef] <a=
sn:4> *
>> kernel/sched/MuQSS.c:1439:38: sparse:    struct task_struct const *
   kernel/sched/MuQSS.c:3266:15: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/MuQSS.c:3266:15: sparse:    struct task_struct *
   kernel/sched/MuQSS.c:3266:15: sparse:    struct task_struct [noderef] <a=
sn:4> *

vim +1061 kernel/sched/MuQSS.c

edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1051  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1052  /*
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1053   * Resched current on rq. We d=
on't know if rq is local to this CPU nor if it
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1054   * is locked so we do not use =
an intermediate variable for the task to avoid
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1055   * having it dereferenced.
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1056   */
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1057  static void resched_curr(struc=
t rq *rq)
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1058  {
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1059  	int cpu;
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1060  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25 @1061  	if (test_tsk_need_resched(rq-=
>curr))
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1062  		return;
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1063  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25 @1064  	rq->preempt =3D rq->curr;
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1065  	cpu =3D rq->cpu;
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1066  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1067  	/* We're doing this without h=
olding the rq lock if it's not task_rq */
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1068  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1069  	if (cpu =3D=3D smp_processor_=
id()) {
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1070  		set_tsk_need_resched(rq->cur=
r);
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1071  		set_preempt_need_resched();
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1072  		return;
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1073  	}
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1074  =

edbc5ae3fb7ae0 Con Kolivas 2019-10-25 @1075  	if (set_nr_and_not_polling(rq=
->curr))
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1076  		smp_sched_reschedule(cpu);
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1077  	else
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1078  		trace_sched_wake_idle_withou=
t_ipi(cpu);
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1079  }
edbc5ae3fb7ae0 Con Kolivas 2019-10-25  1080  =


:::::: The code at line 1061 was first introduced by commit
:::::: edbc5ae3fb7ae074a02e40802df66ae90ff4888e MultiQueue Skiplist Schedul=
er v0.198

:::::: TO: Con Kolivas <kernel@kolivas.org>
:::::: CC: Steven Barrett <steven@liquorix.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5239586090490231199==--

