Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196422CBE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 02:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766456653; cv=none; b=lp9ddgLBtbNB9nPhNCu2pLJ/20D4a/3bFt6tq3FAFfzhD9+6mTnDFPkwUJSgExhO6wjgzRUw6m996Y+pjHB2BbFYvzWGD8mWxuc5awRB4ef0LCYVNhej/1g2TZ7vsRyPCYGAxWNFfa45CerK/qY4VLMSMjQYgLQQY9shJDk47xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766456653; c=relaxed/simple;
	bh=Kk9APBgswcD5wei6Tx5Nnl+NBnbpijjzz3jd2I073dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hotP3uHoxPVpGR8STBrD7N/Rl1G+8uLfbnVfSWaxKpmnOzL7RbQymg1LBf5Vf2gWKnESFDzGm6jh6Ee/g1ogbWR2BD4LGTEmXgJhwAmEPrKQuvSQRbTerokQealHc/gdocL/Sd/pCCq+Ptoz/mAwT1ilb3EMtGhZawc/suvaTNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXrPRInE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXrPRInE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766456650; x=1797992650;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Kk9APBgswcD5wei6Tx5Nnl+NBnbpijjzz3jd2I073dQ=;
  b=XXrPRInE4C8t9PUzNajX/+He8sd/FxWp5Q7aEcKPigPf+FxscfQa1T74
   1576mJXv6eS27mP/c4G6WD4t2oobX85pHGPEjKjyr0gFWZyFDqgG257Lr
   NNYa9SJaysGuxb+CLxKqgwCTBjfZTpo/70li2gcY2MnUUjHrJtlpLk3xb
   O3TFt3so2bdWhTJrSlX27wNBPbqdugjTA6ipDTmnjfttixNp5xqLaHGky
   8B3xIvxlwHaLu3hmtWN8ETnmf4sjTdN++KkUHmyIC4EJQNrfKBK6RfeC+
   EUqEU3Y0WQJCftXcU9EvlxhkIDROjVHZSG76KTQgNrSRqHTqbhL32CFLw
   Q==;
X-CSE-ConnectionGUID: OVSt5mpERyW64RK/4fF1GA==
X-CSE-MsgGUID: oqBo1DgdRwGk5jjKXbRNpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79672221"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79672221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 18:24:09 -0800
X-CSE-ConnectionGUID: 4EEGk8IpSiSmEt2+DWGD7A==
X-CSE-MsgGUID: Ltk01eZ5RQ6Fu2QT3O5vAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="200162925"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 18:24:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXs4C-000000001Ld-3tZF;
	Tue, 23 Dec 2025 02:24:04 +0000
Date: Tue, 23 Dec 2025 10:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xia Fukun <xiafukun@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/sched/fair.c:9005:51:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202512231020.T3d5Cq3i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: c52c17a85f1fa9cde2bcb15359096634cfd9eb7c [3541/3541] sched: Add tra=
cepoint for qos smt expeller
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/arc=
hive/20251223/202512231020.T3d5Cq3i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251223/202512231020.T3d5Cq3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231020.T3d5Cq3i-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_dete=
ct_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_=
interval' was not declared. Should it be static?
   kernel/sched/fair.c:163:14: sparse: sparse: symbol 'sysctl_sched_prio_lo=
ad_balance_enabled' was not declared. Should it be static?
   kernel/sched/fair.c:191:5: sparse: sparse: symbol 'sysctl_sched_util_low=
_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1283:34: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct sched_entity const *se =
@@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1283:34: sparse:     expected struct sched_entity co=
nst *se
   kernel/sched/fair.c:1283:34: sparse:     got struct sched_entity [nodere=
f] __rcu *
   kernel/sched/fair.c:3066:13: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct task_struct *tsk @@    =
 got struct task_struct [noderef] __rcu * @@
   kernel/sched/fair.c:3066:13: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:3066:13: sparse:     got struct task_struct [noderef=
] __rcu *
   kernel/sched/fair.c:13203:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13203:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:13203:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:5161:25: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5161:25: sparse:    struct sparsemask [noderef] __rc=
u *
   kernel/sched/fair.c:5161:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:5178:25: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:5178:25: sparse:    struct sparsemask [noderef] __rc=
u *
   kernel/sched/fair.c:5178:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:13559:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:13559:25: sparse:    struct sparsemask [noderef] __r=
cu *
   kernel/sched/fair.c:13559:25: sparse:    struct sparsemask *
   kernel/sched/fair.c:6012:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:6012:22: sparse:    struct task_struct *
   kernel/sched/fair.c:8121:20: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8121:20: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:8121:20: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:8436:9: sparse: sparse: incorrect type in assignment=
 (different address spaces) @@     expected struct sched_domain *[assigned]=
 tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8436:9: sparse:     expected struct sched_domain *[a=
ssigned] tmp
   kernel/sched/fair.c:8436:9: sparse:     got struct sched_domain [noderef=
] __rcu *parent
   kernel/sched/fair.c:8548:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8548:38: sparse:     expected struct task_struct *cu=
rr
   kernel/sched/fair.c:8548:38: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:8774:22: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:8774:22: sparse:    struct task_struct *
>> kernel/sched/fair.c:9005:51: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *sibling_p =
@@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9005:51: sparse:     expected struct task_struct *si=
bling_p
   kernel/sched/fair.c:9005:51: sparse:     got struct task_struct [noderef=
] __rcu *curr
   kernel/sched/fair.c:9010:30: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/fair.c:9010:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9084:48: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected struct task_struct *p @@     g=
ot struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9332:38: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected struct task_struct *curr @@  =
   got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10403:40: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected struct sched_domain *child @=
@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11040:22: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/fair.c:11040:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12481:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12481:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:12481:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:12138:44: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected struct sched_domain *sd_pare=
nt @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12138:44: sparse:     expected struct sched_domain *=
sd_parent
   kernel/sched/fair.c:12138:44: sparse:     got struct sched_domain [noder=
ef] __rcu *parent
   kernel/sched/fair.c:12577:9: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12577:9: sparse:     expected struct sched_domain *[=
assigned] sd
   kernel/sched/fair.c:12577:9: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c:3012:9: sparse: sparse: context imbalance in 'task_n=
uma_placement' - different lock contexts for basic block
   kernel/sched/fair.c:7307:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7307:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7307:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:7313:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7313:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7313:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:7320:28: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *sd @@    =
 got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7320:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7320:28: sparse:     got struct sched_domain [nodere=
f] __rcu *child
   kernel/sched/fair.c:7328:17: sparse: sparse: incorrect type in assignmen=
t (different address spaces) @@     expected struct sched_domain *[assigned=
] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7328:17: sparse:     expected struct sched_domain *[=
assigned] tmp
   kernel/sched/fair.c:7328:17: sparse:     got struct sched_domain [nodere=
f] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2338:9: sparse: sparse: incompatible types in compa=
rison expression (different address spaces):
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct [noderef] __r=
cu *
   kernel/sched/sched.h:2338:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2174:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2174:25: sparse:    struct task_struct *

vim +9005 kernel/sched/fair.c

  8984=09
  8985	static bool _qos_smt_check_need_resched(int this_cpu, struct rq *rq)
  8986	{
  8987		int cpu;
  8988=09
  8989		if (!sched_smt_active())
  8990			return false;
  8991=09
  8992		for_each_cpu(cpu, cpu_smt_mask(this_cpu)) {
  8993			if (cpu =3D=3D this_cpu)
  8994				continue;
  8995=09
  8996			/*
  8997			* There are two cases rely on the set need_resched to drive away
  8998			* offline task=EF=BC=9A
  8999			* a) The qos_smt_status of siblings cpu is online, the task of cur=
r cpu is offline;
  9000			* b) The qos_smt_status of siblings cpu is offline, the task of cu=
rr cpu is idle,
  9001			*    and current cpu only has SCHED_IDLE tasks enqueued.
  9002			*/
  9003			if (per_cpu(qos_smt_status, cpu) =3D=3D QOS_LEVEL_ONLINE &&
  9004			    task_group(current)->qos_level < QOS_LEVEL_ONLINE) {
> 9005				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, =
cpu));
  9006				return true;
  9007			}
  9008=09
  9009			if (per_cpu(qos_smt_status, cpu) =3D=3D QOS_LEVEL_OFFLINE &&
  9010			    rq->curr =3D=3D rq->idle && sched_idle_cpu(this_cpu)) {
  9011				trace_sched_qos_smt_expel(cpu_curr(cpu), per_cpu(qos_smt_status, =
cpu));
  9012				return true;
  9013			}
  9014		}
  9015=09
  9016		return false;
  9017	}
  9018=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
