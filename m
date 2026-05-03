Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07D346A13
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 05:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777786813; cv=none; b=p7GXSb6gcV5CoXFRXcll+ru/4UHyxo1ahZc749vNKTTHX2HbZ4iSa9jz657DodG+qp/zhsOU/2GYc0e9GxAORPYn7cixGbWDJ5JqLFD5O9GlVuGD9cKApFb5neZQWv8A8WjTzYmcvho3fLx//2V+6Kdu1NpFGtcOEUSn1q2PLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777786813; c=relaxed/simple;
	bh=zg+4kFReMge4H9negJ0oyUNPktFtJo7QkF8O1g2TusU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LBPifPr+TilWrGUYlEWrZiGHvK3wcZXHlcPpfyL6+dlUkoV6HQs6xDV1/OhSpovzOEDhPZLcf7nMZ2xnYpOScYJ6obLANVd4AeXADrySfVM6VkfExj9LG30x3vnrMRKs7IXvdHVenoFDDXyyo40XYhDNiUKR4UaZs3qpGPCej9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldSEnC9T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldSEnC9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777786811; x=1809322811;
  h=date:from:to:cc:subject:message-id;
  bh=zg+4kFReMge4H9negJ0oyUNPktFtJo7QkF8O1g2TusU=;
  b=ldSEnC9Tm0CJ2wtJFf61owXS3qcTuJzRcnRa8sIQbubjQKHEDu83jOyY
   J7WfLkbZPLT6HJJVnGAy/FkY1Cjbn+D2DY/y2Kdnfpjb9ifaCIUEYuhNf
   x6hKWhjVKzr6Zl3pKGize8oSKMuTYDBNF7BvxeFvOZjNEVsufCxllOMUL
   fc5UAsigbFzsAtToZzd5fKHjjrbX2wWkNS33WuRcCzTpnFsjToXR6+Bo4
   mX5iLOXCBJUHMGyQNGp1NsoI991geC5UyTQKtePqRp4PMBT9XXIFFcaqe
   mfHV6kxe/G3TOyrgpEmhb2gxwIIBe6aKWfwL78GvTEl2hf+lzne4W+JkF
   A==;
X-CSE-ConnectionGUID: Y5UaEiK5T+6gXDFO0HS96A==
X-CSE-MsgGUID: WomXnmwFQ++ebHye7geNGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="81255996"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="81255996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 22:40:10 -0700
X-CSE-ConnectionGUID: DFefSHb3TLmUvsOUfL61bw==
X-CSE-MsgGUID: lZzUYrZ+QQuUQee5IhTw4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235097021"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2026 22:40:08 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJPYk-000000002DR-0TSG;
	Sun, 03 May 2026 05:40:06 +0000
Date: Sun, 03 May 2026 13:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 9/9]
 mm/slab_common.c:1360:17: error: implicit declaration of function
 'IRQ_WORK_INIT_LAZY'
Message-ID: <202605031335.uTcGPrgE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: 1e4fd024c798fbeff0b5a3c5f55cdcf710367c59 [9/9] foo
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031335.uTcGPrgE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031335.uTcGPrgE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031335.uTcGPrgE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slab_common.c:1356:23: error: implicit declaration of function 'IRQ_WORK_INIT'; did you mean 'IRQ_WORK_VECTOR'? [-Wimplicit-function-declaration]
    1356 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~
         |                       IRQ_WORK_VECTOR
   mm/slab_common.c:1356:23: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/slab_common.c:1356:23: note: (near initialization for 'krc.defer_free.node.llist.next')
   mm/slab_common.c:1356:23: error: initializer element is not constant
   mm/slab_common.c:1356:23: note: (near initialization for 'krc.defer_free.node.llist.next')
   mm/slab_common.c:1358:27: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1358 |         .defer_call_rcu = IRQ_WORK_INIT(defer_call_rcu_irq_work_fn),
         |                           ^~~~~~~~~~~~~
   mm/slab_common.c:1358:27: note: (near initialization for 'krc.defer_call_rcu.node.llist.next')
   mm/slab_common.c:1358:27: error: initializer element is not constant
   mm/slab_common.c:1358:27: note: (near initialization for 'krc.defer_call_rcu.node.llist.next')
>> mm/slab_common.c:1360:17: error: implicit declaration of function 'IRQ_WORK_INIT_LAZY' [-Wimplicit-function-declaration]
    1360 |                 IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1360:17: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/slab_common.c:1360:17: note: (near initialization for 'krc.sched_delayed_monitor.node.llist.next')
   mm/slab_common.c:1360:17: error: initializer element is not constant
   mm/slab_common.c:1360:17: note: (near initialization for 'krc.sched_delayed_monitor.node.llist.next')
   mm/slab_common.c:1362:17: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1362 |                 IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
         |                 ^~~~~~~~~~~~~~~~~~
   mm/slab_common.c:1362:17: note: (near initialization for 'krc.run_page_cache_worker.node.llist.next')
   mm/slab_common.c:1362:17: error: initializer element is not constant
   mm/slab_common.c:1362:17: note: (near initialization for 'krc.run_page_cache_worker.node.llist.next')
   mm/slab_common.c: In function 'defer_kvfree_rcu_barrier':
   mm/slab_common.c:1384:17: error: implicit declaration of function 'irq_work_sync' [-Wimplicit-function-declaration]
    1384 |                 irq_work_sync(&per_cpu_ptr(&krc, cpu)->defer_free);
         |                 ^~~~~~~~~~~~~
   mm/slab_common.c: In function '__schedule_delayed_monitor_work':
   mm/slab_common.c:1810:33: error: implicit declaration of function 'irq_work_queue'; did you mean 'drain_workqueue'? [-Wimplicit-function-declaration]
    1810 |                                 irq_work_queue(&krcp->sched_delayed_monitor);
         |                                 ^~~~~~~~~~~~~~
         |                                 drain_workqueue


vim +/IRQ_WORK_INIT_LAZY +1360 mm/slab_common.c

56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1352) 
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1353) static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1354) 	.lock = __RAW_SPIN_LOCK_UNLOCKED(krc.lock),
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1355) 	.defer_head = LLIST_HEAD_INIT(defer_head),
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1356) 	.defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
0f991a4617a587 Harry Yoo (Oracle  2026-03-26  1357) 	.defer_call_rcu_head = LLIST_HEAD_INIT(defer_call_rcu_head),
0f991a4617a587 Harry Yoo (Oracle  2026-03-26  1358) 	.defer_call_rcu = IRQ_WORK_INIT(defer_call_rcu_irq_work_fn),
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1359) 	.sched_delayed_monitor =
56d22ff0926080 Harry Yoo (Oracle  2026-03-25 @1360) 		IRQ_WORK_INIT_LAZY(sched_delayed_monitor_irq_work_fn),
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1361) 	.run_page_cache_worker =
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1362) 		IRQ_WORK_INIT_LAZY(run_page_cache_worker_irq_work_fn),
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1363) };
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1364) #else
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1365) struct kfree_rcu_cpu {
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1366) 	struct llist_head defer_head;
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1367) 	struct irq_work defer_free;
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1368) };
56d22ff0926080 Harry Yoo (Oracle  2026-03-25  1369) 

:::::: The code at line 1360 was first introduced by commit
:::::: 56d22ff0926080094a3df57e64b2aa87c9e1433d mm/slab: introduce kfree_rcu_nolock()

:::::: TO: Harry Yoo (Oracle) <harry@kernel.org>
:::::: CC: Harry Yoo (Oracle) <harry@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
