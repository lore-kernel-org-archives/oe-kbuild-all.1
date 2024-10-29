Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3FEAFA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 10:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730198768; cv=none; b=IwKpEwXQvbqh4iWcirdL/cuFLzuvxBj/WnpoedIaAKOu08U85UoPCdcq4hBqK0Y724qt4yTkNODhus4o34VVu0ZWgaXsSgbHcXl9tLfvll989u5aEpEJTtGwG4C8h6EMzi4Br08rgZMydpxu2vy8Y4jWUqtMPoP8ZHZl3Q959yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730198768; c=relaxed/simple;
	bh=3Guh5z+xy2l0twJFVKkHm+vp9MlTs0zDgdxgmmi521A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dj1rYqfhhKyV5z5h05EoMCjnQk9Ph7cBXVodbsy9jW5h5lDM11Hc8FNGXErc6pNOuhA8czIpJWeqf37fFGp0JwidYl88C54StRkIfW6uKK0yyvwvEW/h+KrDmONSIchVL7+EhL1K43TnNkVmw6PqXUvhWaX5+sYeuDmXcQw/5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/H8CW0R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/H8CW0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730198766; x=1761734766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Guh5z+xy2l0twJFVKkHm+vp9MlTs0zDgdxgmmi521A=;
  b=F/H8CW0ROu6uScMeGKfah3MVvjau4bGidVT/cgh7dhjlvL8BSSgbiNa0
   n+zdwqFlK2u2S9UA+PaDXK8iCwJ4oEc5bu1etwpOvNAJYz5vq0eeNCYp8
   F6J6n4JZ9k4AkrwGYfr2rlnWVBe3BFCggDMpJvcLj8xjXldQaA7OIf6cO
   cnNQF5YplPGotJ8/wxu3q6KOselo9mabqUPm92pDjJMJPxsPMPrbWQ2aN
   KMoqN8QHHF3bvts4USoFKngpTU9bCV8+jjr0eX2JRHiQFeEReukXc3tAQ
   5dWfLFvhAFmyuu/8IrfEqM6ZIcnxCfSxOAIUxuOn5OrzGyBGM7O5MFSof
   Q==;
X-CSE-ConnectionGUID: XFvW6n25TgCLyH+6uhG/lw==
X-CSE-MsgGUID: 2WWsT2zBQDyFCPp5e/P0tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="47309267"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="47309267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 03:45:54 -0700
X-CSE-ConnectionGUID: DDPnzQXYTwaKvrb1nn2vJQ==
X-CSE-MsgGUID: fvDL3EzGSgaD21DHm4w2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86532652"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2024 03:45:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5jjT-000dYK-2C;
	Tue, 29 Oct 2024 10:45:51 +0000
Date: Tue, 29 Oct 2024 18:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/core 21/21] kernel/events/uprobes.c:2040:17:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202410291813.K7U1SI4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   72a27524a4939fc0958796a46b51c1fab3729367
commit: 72a27524a4939fc0958796a46b51c1fab3729367 [21/21] uprobes: SRCU-protect uretprobe lifetime (with timeout)
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291813.K7U1SI4M-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291813.K7U1SI4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291813.K7U1SI4M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:2040:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2040:17: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2040:17: sparse:    struct return_instance *
   kernel/events/uprobes.c:2121:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2121:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2121:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2180:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2180:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2180:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2239:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2241:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2500:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2500:25: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2500:25: sparse:    struct return_instance *
   kernel/events/uprobes.c:2628:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2630:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c: note: in included file:
   include/linux/rmap.h:703:28: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/events/uprobes.c:732:17: sparse: sparse: context imbalance in 'hprobe_finalize' - unexpected unlock
   kernel/events/uprobes.c:800:25: sparse: sparse: context imbalance in 'hprobe_expire' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +2040 kernel/events/uprobes.c

  2007	
  2008	static int dup_utask(struct task_struct *t, struct uprobe_task *o_utask)
  2009	{
  2010		struct uprobe_task *n_utask;
  2011		struct return_instance **p, *o, *n;
  2012		struct uprobe *uprobe;
  2013	
  2014		n_utask = alloc_utask();
  2015		if (!n_utask)
  2016			return -ENOMEM;
  2017		t->utask = n_utask;
  2018	
  2019		/* protect uprobes from freeing, we'll need try_get_uprobe() them */
  2020		guard(srcu)(&uretprobes_srcu);
  2021	
  2022		p = &n_utask->return_instances;
  2023		for (o = o_utask->return_instances; o; o = o->next) {
  2024			n = dup_return_instance(o);
  2025			if (!n)
  2026				return -ENOMEM;
  2027	
  2028			/* if uprobe is non-NULL, we'll have an extra refcount for uprobe */
  2029			uprobe = hprobe_expire(&o->hprobe, true);
  2030	
  2031			/*
  2032			 * New utask will have stable properly refcounted uprobe or
  2033			 * NULL. Even if we failed to get refcounted uprobe, we still
  2034			 * need to preserve full set of return_instances for proper
  2035			 * uretprobe handling and nesting in forked task.
  2036			 */
  2037			hprobe_init_stable(&n->hprobe, uprobe);
  2038	
  2039			n->next = NULL;
> 2040			rcu_assign_pointer(*p, n);
  2041			p = &n->next;
  2042	
  2043			n_utask->depth++;
  2044		}
  2045	
  2046		return 0;
  2047	}
  2048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
