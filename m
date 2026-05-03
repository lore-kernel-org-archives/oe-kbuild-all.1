Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD63201113
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 03:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777779540; cv=none; b=QBujIF0FeucdD53Hteo7pq4hi/Pa5vU1oUMFhoJPM4nHvhvMrGpn5hjOb7eYXK+SHfnd9WZNQ07yCpLx8GU8kWGFPmXiOH9yYMXZjCN9rjGTW8bRfOj+Z8XnmJR7QKuod54eHADd1nwGXAs58zvG87ZIdfjy8AlPIvn2azdltoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777779540; c=relaxed/simple;
	bh=bie6eMWjDDf0C3V8G6yDDGWKiSNiWfjcDHHp8hIMKpA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Riz5X2UfeIhUo6F4GTF+neanYl+o39ShyvZHqGPwoN/pb26COnsIKWlLaZcl+78+P2f5twOa4AKUjshOI/Q5nIdla9xTYvWgBFqpjx8wIrE8Wynxco40KD84zO6UWKzSOVOvCBeuROW7jO411mPNmx065XTGt1j6uOOy8eSRMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7Lkxn8B; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7Lkxn8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777779539; x=1809315539;
  h=date:from:to:cc:subject:message-id;
  bh=bie6eMWjDDf0C3V8G6yDDGWKiSNiWfjcDHHp8hIMKpA=;
  b=G7Lkxn8BDxW/EOCkdUkJRqTvmL5yGjWFocx+pG+Mr6l0HRKq9hnp2Gm6
   n/ETRXjhlyXSzIe9aSVYzDQK2Jd4viQSylaUGwcPYz4/6nxlKHVcEUgHx
   kb9t1pvrDKY3ab+bFYoDdF8uzcHmy8BSvBET17W+i/+zRc9G0bntgv6Ds
   cMK3uvlpqMQEavRRApp+sr+J3cgB9MNP3TNpRDrPxXALXqs38AGVsLnMC
   2Lc0Js1cp0HJP/vRBbKKTgpiueXV6gjTeHKAK/ZjdNsLyd53hDyaYG0A4
   C8cxziFVWeqTpiiRoCD+mOt/oeRa0tk2u4aPrmx3c1UDxWtSXYRGmdp6O
   w==;
X-CSE-ConnectionGUID: WiM6AUiTTYuzeHvU2GJ2sw==
X-CSE-MsgGUID: fg0hF4OsQL+SEEO6WDFquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="82294396"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="82294396"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 20:38:59 -0700
X-CSE-ConnectionGUID: GQUcEiy5Q3u3avfXRf5t/Q==
X-CSE-MsgGUID: QUZHw+7PQxy8LGSIi3ftQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="239529313"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2026 20:38:58 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJNfS-0000000026B-3OfG;
	Sun, 03 May 2026 03:38:54 +0000
Date: Sun, 03 May 2026 11:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [harry:kvfree-rcu-improvements-rfc-v2r1-wip 4/9]
 mm/slab_common.c:1368:23: error: implicit declaration of function
 'IRQ_WORK_INIT'; did you mean 'IRQ_WORK_VECTOR'?
Message-ID: <202605031132.83gN286l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git kvfree-rcu-improvements-rfc-v2r1-wip
head:   1e4fd024c798fbeff0b5a3c5f55cdcf710367c59
commit: 56d22ff0926080094a3df57e64b2aa87c9e1433d [4/9] mm/slab: introduce kfree_rcu_nolock()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031132.83gN286l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031132.83gN286l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031132.83gN286l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slab_common.c:1368:23: error: implicit declaration of function 'IRQ_WORK_INIT'; did you mean 'IRQ_WORK_VECTOR'? [-Wimplicit-function-declaration]
    1368 |         .defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
         |                       ^~~~~~~~~~~~~
         |                       IRQ_WORK_VECTOR
>> mm/slab_common.c:1368:23: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/slab_common.c:1368:23: note: (near initialization for 'krc.defer_free.node.llist.next')
>> mm/slab_common.c:1368:23: error: initializer element is not constant
   mm/slab_common.c:1368:23: note: (near initialization for 'krc.defer_free.node.llist.next')
   mm/slab_common.c: In function 'defer_kvfree_rcu_barrier':
>> mm/slab_common.c:1378:17: error: implicit declaration of function 'irq_work_sync' [-Wimplicit-function-declaration]
    1378 |                 irq_work_sync(&per_cpu_ptr(&krc, cpu)->defer_free);
         |                 ^~~~~~~~~~~~~
   mm/slab_common.c: In function 'kvfree_call_rcu_head':
>> mm/slab_common.c:1433:25: error: implicit declaration of function 'irq_work_queue'; did you mean 'drain_workqueue'? [-Wimplicit-function-declaration]
    1433 |                         irq_work_queue(&krcp->defer_free);
         |                         ^~~~~~~~~~~~~~
         |                         drain_workqueue


vim +1368 mm/slab_common.c

  1365	
  1366	static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
  1367		.defer_head = LLIST_HEAD_INIT(defer_head),
> 1368		.defer_free = IRQ_WORK_INIT(defer_kfree_rcu_irq_work_fn),
  1369	};
  1370	#endif
  1371	
  1372	/* Wait for deferred work from kfree_rcu_nolock() */
  1373	void defer_kvfree_rcu_barrier(void)
  1374	{
  1375		int cpu;
  1376	
  1377		for_each_possible_cpu(cpu)
> 1378			irq_work_sync(&per_cpu_ptr(&krc, cpu)->defer_free);
  1379	}
  1380	
  1381	static void *object_start_addr(void *ptr)
  1382	{
  1383		struct slab *slab;
  1384		void *start;
  1385	
  1386		if (is_vmalloc_addr(ptr)) {
  1387			start  = (void *)PAGE_ALIGN_DOWN((unsigned long)ptr);
  1388		} else {
  1389			slab = virt_to_slab(ptr);
  1390			if (!slab)
  1391				start = (void *)PAGE_ALIGN_DOWN((unsigned long)ptr);
  1392			else if (is_kfence_address(ptr))
  1393				start = kfence_object_start(ptr);
  1394			else
  1395				start = nearest_obj(slab->slab_cache, slab, ptr);
  1396		}
  1397	
  1398		return start;
  1399	}
  1400	
  1401	static void defer_kfree_rcu_irq_work_fn(struct irq_work *work)
  1402	{
  1403		struct kfree_rcu_cpu *krcp;
  1404		struct llist_head *head;
  1405		struct llist_node *llnode, *pos, *t;
  1406	
  1407		krcp = container_of(work, struct kfree_rcu_cpu, defer_free);
  1408		head = &krcp->defer_head;
  1409	
  1410		if (llist_empty(head))
  1411			return;
  1412	
  1413		llnode = llist_del_all(head);
  1414		llist_for_each_safe(pos, t, llnode) {
  1415			void *objp;
  1416			struct rcu_ptr *rcup = (struct rcu_ptr *)pos;
  1417	
  1418			objp = object_start_addr(rcup);
  1419			kvfree_call_rcu(rcup, objp, true);
  1420		}
  1421	}
  1422	
  1423	#ifndef CONFIG_KVFREE_RCU_BATCHED
  1424	void kvfree_call_rcu_head(struct rcu_head *head, void *ptr, bool allow_spin)
  1425	{
  1426		if (!allow_spin) {
  1427			struct kfree_rcu_cpu *krcp;
  1428	
  1429			guard(preempt)();
  1430	
  1431			krcp = this_cpu_ptr(&krc);
  1432			if (llist_add((struct llist_node *)head, &krcp->defer_head))
> 1433				irq_work_queue(&krcp->defer_free);
  1434			return;
  1435		}
  1436	
  1437		if (head) {
  1438			kasan_record_aux_stack(ptr);
  1439			call_rcu(head, kvfree_rcu_cb);
  1440			return;
  1441		}
  1442	
  1443		// kvfree_rcu(one_arg) call.
  1444		might_sleep();
  1445		synchronize_rcu();
  1446		kvfree(ptr);
  1447	}
  1448	EXPORT_SYMBOL_GPL(kvfree_call_rcu_head);
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
