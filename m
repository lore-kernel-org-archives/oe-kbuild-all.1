Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EEC285C9F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 01:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771205000; cv=none; b=uZxeCnsenaqHD/3F8Nq2STpO43eUFybXcu7v6kRHvs9HA0Hg7QIvyMsUJdQojFen+7PACKS9V+bJguqlTBjpuQtCrQwL5FSAo0tSDy0x4XZw3v+pVSmwUR3ZBuMS7gsncNRTxecyW8ZFroQcin9dH+bOxnkczlRqX57GPKIsn3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771205000; c=relaxed/simple;
	bh=WXjrzmJZtNJm88e/F1h6DR2U/3PiAZCleWnmnkT8Zac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5wsLzPrluQYM3eFkp9BGmI+kQ3SZNIVd5uQP2aKK2XbMm3I07MyI+yz0/6tW0io/dsvPHrplGnTuea/LF9OVdF+YpwdH74h7EJg2DXnRuKDo4otsmTQj6hnXdLKcaSjGsGAhVVCcA2ouoLXl7kYphM3CiGtsrZGGN67xq/KI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5Wyw+sE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5Wyw+sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771204999; x=1802740999;
  h=date:from:to:cc:subject:message-id;
  bh=WXjrzmJZtNJm88e/F1h6DR2U/3PiAZCleWnmnkT8Zac=;
  b=I5Wyw+sE8VDs6Ks/yWZhSQod38lDwss0V9ceXG2BqTm+dgOcZptellXz
   +lrJTwkHProcKMll3i6FhdWPc+KVbGJH7jJsB5cvfmNBK7CsfATA1XO+s
   sYP0NkqdBA3efMQRxKwRUBp8R74mSeV6AxITY6MWpY3IhAlcA7ALv72Lt
   YG5TgtA+9CI+L+V1qgGp/b7z5vPVsWpElFZ2bWUA/wvMtGKIdadpcnJOO
   NNx53QIgdIk+/l4qVXPM/jKe7BifMUd6n2OJI4PnF0Bmii6qIJSnQGRj8
   Qxy+jKvyM8JEipluCgu1dHxUKM57VaSlO3Qv5I+TcK7MQLlujXO3LBBl8
   A==;
X-CSE-ConnectionGUID: wfop6ViJR2uWWVXWIoRm8w==
X-CSE-MsgGUID: 8jvjVrNmRhqbnc9b1/nalA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71489788"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71489788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:23:16 -0800
X-CSE-ConnectionGUID: EHLv0hUaTRy2g4bWecoe6Q==
X-CSE-MsgGUID: m0FIFLMeRA+YlzHqyC68FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="213480308"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Feb 2026 17:23:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrnKQ-00000000zIO-3C0E;
	Mon, 16 Feb 2026 01:23:10 +0000
Date: Mon, 16 Feb 2026 09:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/events/uprobes.c:2038:17: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202602160931.CnnMtX4E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: dd1a7567784e2b1f80258be04f57bcfa82c997eb uprobes: SRCU-protect uretprobe lifetime (with timeout)
date:   1 year, 4 months ago
config: x86_64-randconfig-121-20260216 (https://download.01.org/0day-ci/archive/20260216/202602160931.CnnMtX4E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160931.CnnMtX4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160931.CnnMtX4E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:2038:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2038:17: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2038:17: sparse:    struct return_instance *
   kernel/events/uprobes.c:2119:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2119:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2119:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2178:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2178:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2178:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2237:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2239:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2498:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2498:25: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2498:25: sparse:    struct return_instance *
   kernel/events/uprobes.c:2626:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2628:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock
   kernel/events/uprobes.c:730:17: sparse: sparse: context imbalance in 'hprobe_finalize' - unexpected unlock
   kernel/events/uprobes.c:798:25: sparse: sparse: context imbalance in 'hprobe_expire' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +2038 kernel/events/uprobes.c

  2005	
  2006	static int dup_utask(struct task_struct *t, struct uprobe_task *o_utask)
  2007	{
  2008		struct uprobe_task *n_utask;
  2009		struct return_instance **p, *o, *n;
  2010		struct uprobe *uprobe;
  2011	
  2012		n_utask = alloc_utask();
  2013		if (!n_utask)
  2014			return -ENOMEM;
  2015		t->utask = n_utask;
  2016	
  2017		/* protect uprobes from freeing, we'll need try_get_uprobe() them */
  2018		guard(srcu)(&uretprobes_srcu);
  2019	
  2020		p = &n_utask->return_instances;
  2021		for (o = o_utask->return_instances; o; o = o->next) {
  2022			n = dup_return_instance(o);
  2023			if (!n)
  2024				return -ENOMEM;
  2025	
  2026			/* if uprobe is non-NULL, we'll have an extra refcount for uprobe */
  2027			uprobe = hprobe_expire(&o->hprobe, true);
  2028	
  2029			/*
  2030			 * New utask will have stable properly refcounted uprobe or
  2031			 * NULL. Even if we failed to get refcounted uprobe, we still
  2032			 * need to preserve full set of return_instances for proper
  2033			 * uretprobe handling and nesting in forked task.
  2034			 */
  2035			hprobe_init_stable(&n->hprobe, uprobe);
  2036	
  2037			n->next = NULL;
> 2038			rcu_assign_pointer(*p, n);
  2039			p = &n->next;
  2040	
  2041			n_utask->depth++;
  2042		}
  2043	
  2044		return 0;
  2045	}
  2046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
