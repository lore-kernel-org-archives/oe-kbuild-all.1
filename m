Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F03019BA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770452740; cv=none; b=fFGfAinAyWK8VIPoGlKcs6SODfRji07viF3oRAcnxWuOJej6WaCug+BopmbiLZPxJOCQ/1iicVrnskHHGiLv5KsnN2uNTq928LK8xsNa0eg31lwP8hdHZXrLXvrKlkROM0WdZMrtmu4CpMBXlxPOUSDtorsMl5P+ooM/fMe7+0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770452740; c=relaxed/simple;
	bh=zKEPRkB62AmyrST6f8isXgjfvmDinkq3SyoDJH3Y6JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpThqeo4JSwG+NJD9kTDvh4XrH19mNwz+TvZ0dIhySKG8VEYd3NaxzlMIU/shsU61rxU7Cgp4varrLrJn3XRoJ5vCFL4nR9NsGf5M6gjKVvkAGnXLmoXNcaZ+l9hVuyO7UPJO7FsGijKvngKlPzFk/LuRRbTrJJoGCY0EzS4Dpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4N5axsl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4N5axsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770452740; x=1801988740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zKEPRkB62AmyrST6f8isXgjfvmDinkq3SyoDJH3Y6JI=;
  b=R4N5axslGyDOtoC+5tTnb3spel4DnvQYN5JAfnOovDXIfsbiK8SCPvE4
   32suCRRCfYXYi/W1rySr0U4HvDCSSYHUPOX8qq8LWuPTVwWaaP0W2iH65
   QgXzFB1l+l+FV5ZU0Mu9P4eATG641tBjpHZ2c8Bncg7gm7UeiRmrBMMr7
   LucgrKR+jYVWVnFe9NJQziZB6mGKKO6a1u3mrzLTouXiRNRtsuKdMls/t
   e1UhfRciThGfedqoeKZszdi5rQU/XJ5yazxY+ubfs2lvcgc6gzA+OLCwa
   /ja/nB6kHTxcIr79aTxuyeFe5EPR4dngwIsM8I+O6itGEix4j4vMvxCgW
   Q==;
X-CSE-ConnectionGUID: htytda/hRCOR9BvLkrHMEA==
X-CSE-MsgGUID: 2rXFBtFMTLiIq2U0Blrskg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82762322"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="82762322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 00:25:38 -0800
X-CSE-ConnectionGUID: tkWvxGxhTKC31JfbiuI+Eg==
X-CSE-MsgGUID: dlYWNglDRkCeM3zfdARvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="241436546"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2026 00:25:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voddG-00000000lVu-1V8B;
	Sat, 07 Feb 2026 08:25:34 +0000
Date: Sat, 7 Feb 2026 16:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/7] mm/slab: introduce kfree_rcu_nolock()
Message-ID: <202602071657.F7XwiIey-lkp@intel.com>
References: <20260206093410.160622-7-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206093410.160622-7-harry.yoo@oracle.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260205]
[also build test ERROR on v6.19-rc8]
[cannot apply to akpm-mm/mm-everything linus/master vbabka-slab/for-next rcu/rcu/dev v6.19-rc8 v6.19-rc7 v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-slab-introduce-k-v-free_rcu-with-struct-rcu_ptr/20260206-173717
base:   next-20260205
patch link:    https://lore.kernel.org/r/20260206093410.160622-7-harry.yoo%40oracle.com
patch subject: [RFC PATCH 6/7] mm/slab: introduce kfree_rcu_nolock()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071657.F7XwiIey-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071657.F7XwiIey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071657.F7XwiIey-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slab_common.c:1381:21: error: implicit declaration of function 'IRQ_WORK_INIT'; did you mean 'IRQ_WORK_VECTOR'? [-Wimplicit-function-declaration]
    1381 |         .irq_work = IRQ_WORK_INIT(defer_kfree_rcu),
         |                     ^~~~~~~~~~~~~
         |                     IRQ_WORK_VECTOR
>> mm/slab_common.c:1381:21: error: initialization of 'struct llist_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/slab_common.c:1381:21: note: (near initialization for 'krc.irq_work.node.llist.next')
>> mm/slab_common.c:1381:21: error: initializer element is not constant
   mm/slab_common.c:1381:21: note: (near initialization for 'krc.irq_work.node.llist.next')
   mm/slab_common.c: In function 'kvfree_call_rcu_head':
>> mm/slab_common.c:1393:25: error: implicit declaration of function 'irq_work_queue'; did you mean 'drain_workqueue'? [-Wimplicit-function-declaration]
    1393 |                         irq_work_queue(&krcp->irq_work);
         |                         ^~~~~~~~~~~~~~
         |                         drain_workqueue


vim +1381 mm/slab_common.c

  1377	
  1378	#ifndef CONFIG_KVFREE_RCU_BATCHED
  1379	static DEFINE_PER_CPU(struct kfree_rcu_cpu, krc) = {
  1380		.llist_head = LLIST_HEAD_INIT(llist_head),
> 1381		.irq_work = IRQ_WORK_INIT(defer_kfree_rcu),
  1382	};
  1383	
  1384	void kvfree_call_rcu_head(struct rcu_head *head, void *ptr, bool allow_spin)
  1385	{
  1386		if (!allow_spin) {
  1387			struct kfree_rcu_cpu *krcp;
  1388	
  1389			guard(preempt)();
  1390	
  1391			krcp = this_cpu_ptr(&krc);
  1392			if (llist_add((struct llist_node *)head, &krcp->llist_head))
> 1393				irq_work_queue(&krcp->irq_work);
  1394			return;
  1395		}
  1396	
  1397		if (head) {
  1398			kasan_record_aux_stack(ptr);
  1399			call_rcu(head, kvfree_rcu_cb);
  1400			return;
  1401		}
  1402	
  1403		// kvfree_rcu(one_arg) call.
  1404		might_sleep();
  1405		synchronize_rcu();
  1406		kvfree(ptr);
  1407	}
  1408	EXPORT_SYMBOL_GPL(kvfree_call_rcu_head);
  1409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
