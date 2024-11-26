Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09651482ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 03:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732591243; cv=none; b=VhFKddZakAZB/YoHxahXREbONeDhyOahMtWAanLQ9XK85Hx7SRepURUe6hZl73JU2Jino5B05hsoSf8dMB7QC7+UXMA+/ARIvI/6j3QL1HTHvcLGPBYiduxE5x2GFkgHtnaCPSw0ja+WmMd2LpKJaoNSoIbS735QL69xAvc120g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732591243; c=relaxed/simple;
	bh=/eUicUYyBHArPmuppCJO46cSLJm0U8/9cp6SL0ENZ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thUBShtxqNnPpf3lbpz99Ndx6MaF71rRbc4iEdZlUEw2kyZRkqj2hSiMwIbOmE82jVtikKAKGWJQEUu+JpkX8jliz6reBh27JlViycQqI9Is6S6PLhP56xRR/OuOK/S6aT1joUiuJ2jCdm1BU+dmC6aS/a2sYeD9PJzdK6/8lY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q48NaeQG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q48NaeQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732591240; x=1764127240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eUicUYyBHArPmuppCJO46cSLJm0U8/9cp6SL0ENZ7k=;
  b=Q48NaeQGtkG38MZ2qml2/xJ+r55pulQETICJPNaLpyklms9UIU6mAJk5
   +ZKtEUqfCYN44RXB8SbEpA4YuoKB5vsF7iNzzVHKECrMRHVmHABbLtN1P
   wbjYYmMS0sya4CqcTGPZLSlcaQ0yRlR1i8EYx9lWCTUjK0neB1fMW8QuY
   898QYV8HyU7foeLCBDRzDF1XjMN6YAtYYIrFiO5Lqn10vYcIxxmXIeaXm
   7WF4S7ax0ZIRh1W1KxpBPqxsI7eUTnu8ZqpTFIylKRM5cFsf9lPgWAL37
   CqtbQu16qRxW4XHST3qllpxJG2xXJz5DVBmSKBrvQsfIeik+U4OVsiyvt
   g==;
X-CSE-ConnectionGUID: FH6jCJCnTYCfM6fF2bgMiA==
X-CSE-MsgGUID: MxgzMzDOToa2yDEjNGj9Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36516088"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="36516088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 19:20:37 -0800
X-CSE-ConnectionGUID: 3Gp6Ql4ORNOwg6TX9xrlxg==
X-CSE-MsgGUID: zcCTGQm1SUCqqfxhkjztZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="92285340"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 19:20:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFm7t-00071t-1A;
	Tue, 26 Nov 2024 03:20:33 +0000
Date: Tue, 26 Nov 2024 11:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 5/6] kernel/sched/pelt.c:479:50: sparse:
 sparse: dereference of noderef expression
Message-ID: <202411261119.Lj0iQ4LZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mathieu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   ef0d4186083127d2f99ed04e051fd94ba061d253
commit: 98bf0fbb65226809a8df4d1948c5b6cf0c91590f [5/6] tracing: Remove conditional locking from __DO_TRACE()
config: x86_64-randconfig-122-20241125 (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261119.Lj0iQ4LZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2703:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2703:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2819:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2353:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2353:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2353:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2564:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2564:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2564:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2227:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2227:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2227:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2303:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2303:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2303:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2864:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2864:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2864:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2866:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2866:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2866:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2868:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2868:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2868:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3092:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/pelt.c:479:50: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/sched/cputime.h):
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'thread_group_cputime' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
   kernel/sched/deadline.c:1264:29: sparse: sparse: context imbalance in 'dl_task_timer' - different lock contexts for basic block
>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
   kernel/sched/deadline.c:1675:6: sparse: sparse: context imbalance in '__dl_server_attach_root' - wrong count at exit
   kernel/sched/deadline.c:1690:5: sparse: sparse: context imbalance in 'dl_server_apply_params' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:1750:9: sparse: sparse: context imbalance in 'inactive_task_timer' - unexpected unlock
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1298:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1699:15: sparse: sparse: dereference of noderef expression
--
   kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1203:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1261:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1261:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1261:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12779:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12779:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12779:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6104:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6104:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6104:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6834:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6834:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6834:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7037:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7037:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7037:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8411:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8411:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8411:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8615:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8615:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8615:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8760:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8760:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8760:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8791:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8791:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8791:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9002:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9002:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9973:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9973:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9973:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10595:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10595:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10595:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12018:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12018:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12018:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11668:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11668:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11668:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12127:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12127:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12127:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/fair.c:7524:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7530:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7537:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7545:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8699:9: sparse: sparse: context imbalance in 'task_dead_fair' - wrong count at exit
   kernel/sched/sched.h:2472:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct *
>> kernel/sched/fair.c:11850:64: sparse: sparse: dereference of noderef expression
>> kernel/sched/fair.c:11850:64: sparse: sparse: dereference of noderef expression
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *

vim +479 kernel/sched/pelt.c

902d67a2d40f5b Tejun Heo      2024-09-11  470  
902d67a2d40f5b Tejun Heo      2024-09-11  471  /*
902d67a2d40f5b Tejun Heo      2024-09-11  472   * Load avg and utiliztion metrics need to be updated periodically and before
902d67a2d40f5b Tejun Heo      2024-09-11  473   * consumption. This function updates the metrics for all subsystems except for
902d67a2d40f5b Tejun Heo      2024-09-11  474   * the fair class. @rq must be locked and have its clock updated.
902d67a2d40f5b Tejun Heo      2024-09-11  475   */
902d67a2d40f5b Tejun Heo      2024-09-11  476  bool update_other_load_avgs(struct rq *rq)
902d67a2d40f5b Tejun Heo      2024-09-11  477  {
902d67a2d40f5b Tejun Heo      2024-09-11  478  	u64 now = rq_clock_pelt(rq);
af0c8b2bf67b25 Peter Zijlstra 2024-10-09 @479  	const struct sched_class *curr_class = rq->donor->sched_class;

:::::: The code at line 479 was first introduced by commit
:::::: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
