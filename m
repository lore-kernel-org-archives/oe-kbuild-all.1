Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB1345CD1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761910275; cv=none; b=Dg8NTWbA0fC763JKltG7WLEUNLV80Gdy+lFrz6XBPNYItoxoNkHFyOnvgTR3ZqLhUhTWMAGth3lxqOBSYpXn8UyuqawAx5Zf7kn0wJvn167IW6jRaxitpTVkkJCQrQm9a7UmgcV/NXuj8fNRpwi3UM73bjGFbkKo4Ubl1yy+Z3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761910275; c=relaxed/simple;
	bh=mAkQik61IYWr6fYhJ+VtZXB4iON7xYJVBmyB/FBHtZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHWjsZgA0lL3hREHdH4H2l9ZGRfxf6QRM/fLRoWInc6UvOPynzrCQG94w9QBgoDFqZ2xiDLGzQEl9NGzRFoe3UKfROZv4AkEpZ1Jz5FgMeJZrw/UTVDoQDQ+weYqx1Vy5UJhFZxW4D6EaGWIFUireyLzZclsDv/xLD7ZJZuj+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZAqm5pk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZAqm5pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761910274; x=1793446274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAkQik61IYWr6fYhJ+VtZXB4iON7xYJVBmyB/FBHtZI=;
  b=jZAqm5pk2sZr+CJ62tOIFEdBdJTqBPwyHxeKK6n6lte8qOykHRdiuGyz
   S99xxTqok9DBoXiGr5ZrZ2imtvKOGst8P+of7BYEUsigSJSzYynYlEpla
   4PUMxXLnOmLhemOoCGRpkY5VVL70yDyH5dwvspo4ekz7+19aaToTMaDkr
   azqNuFL6Gc/W0V0F061hUAUjsfV4XHz0z8ULUIdCGQqIqhIxVA6SNNh7A
   c1snFiw6cTt543DoiF/MQrBVF0Y4aUZtT8DGw8SRlQcOdiFrPyYUb/9el
   pWiCrvsIUa/246+vzLG03PaY3ptY3hCDNZNUtSoWAzMjP4wFB+9jG+VyR
   A==;
X-CSE-ConnectionGUID: sJavv6iXS4GfWhUrG2eHfA==
X-CSE-MsgGUID: UQqaDql/RDSfwFKseiAMKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63996829"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63996829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:31:13 -0700
X-CSE-ConnectionGUID: aHc8vTLFTSy14Gc5fqpSNQ==
X-CSE-MsgGUID: 3bzrhqmURMiwvyscED+tbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186331561"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 31 Oct 2025 04:31:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEnLR-000N2i-2t;
	Fri, 31 Oct 2025 11:31:04 +0000
Date: Fri, 31 Oct 2025 19:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:blk-crypto-fallback 2/9] mm/mempool.c:411:52: error:
 'FAULT_NOWARN' undeclared
Message-ID: <202510311915.uL0ikF9V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git blk-crypto-fallback
head:   7046442804f2d8296aa28a8b1959b01d8ccf7a1f
commit: 12036d734d9e70145877a992efeeea44b4447a22 [2/9] mempool: add error injection support
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251031/202510311915.uL0ikF9V-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311915.uL0ikF9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311915.uL0ikF9V-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mempool.c: In function 'mempool_alloc_noprof':
>> mm/mempool.c:411:52: error: 'FAULT_NOWARN' undeclared (first use in this function)
     411 |         if (should_fail_ex(&fail_mempool_alloc, 1, FAULT_NOWARN)) {
         |                                                    ^~~~~~~~~~~~
   mm/mempool.c:411:52: note: each undeclared identifier is reported only once for each function it appears in


vim +/FAULT_NOWARN +411 mm/mempool.c

   382	
   383	/**
   384	 * mempool_alloc - allocate an element from a memory pool
   385	 * @pool:	pointer to the memory pool
   386	 * @gfp_mask:	GFP_* flags.
   387	 *
   388	 * Note: This function only sleeps if the alloc_fn callback sleeps or returns
   389	 * %NULL.  Using __GFP_ZERO is not supported.
   390	 *
   391	 * Return: pointer to the allocated element or %NULL on error. This function
   392	 * never returns %NULL when @gfp_mask allows sleeping.
   393	 */
   394	void *mempool_alloc_noprof(mempool_t *pool, gfp_t gfp_mask)
   395	{
   396		void *element;
   397		unsigned long flags;
   398		wait_queue_entry_t wait;
   399		gfp_t gfp_temp;
   400	
   401		VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
   402		might_alloc(gfp_mask);
   403	
   404		gfp_mask |= __GFP_NOMEMALLOC;	/* don't allocate emergency reserves */
   405		gfp_mask |= __GFP_NORETRY;	/* don't loop in __alloc_pages */
   406		gfp_mask |= __GFP_NOWARN;	/* failures are OK */
   407	
   408		gfp_temp = gfp_mask & ~(__GFP_DIRECT_RECLAIM|__GFP_IO);
   409	
   410	repeat_alloc:
 > 411		if (should_fail_ex(&fail_mempool_alloc, 1, FAULT_NOWARN)) {
   412			pr_info("forcing mempool usage for pool %pS\n",
   413					(void *)_RET_IP_);
   414			element = NULL;
   415		} else {
   416			element = pool->alloc(gfp_temp, pool->pool_data);
   417			if (likely(element != NULL))
   418				return element;
   419		}
   420	
   421		spin_lock_irqsave(&pool->lock, flags);
   422		if (likely(pool->curr_nr)) {
   423			element = remove_element(pool);
   424			spin_unlock_irqrestore(&pool->lock, flags);
   425			/* paired with rmb in mempool_free(), read comment there */
   426			smp_wmb();
   427			/*
   428			 * Update the allocation stack trace as this is more useful
   429			 * for debugging.
   430			 */
   431			kmemleak_update_trace(element);
   432			return element;
   433		}
   434	
   435		/*
   436		 * We use gfp mask w/o direct reclaim or IO for the first round.  If
   437		 * alloc failed with that and @pool was empty, retry immediately.
   438		 */
   439		if (gfp_temp != gfp_mask) {
   440			spin_unlock_irqrestore(&pool->lock, flags);
   441			gfp_temp = gfp_mask;
   442			goto repeat_alloc;
   443		}
   444	
   445		/* We must not sleep if !__GFP_DIRECT_RECLAIM */
   446		if (!(gfp_mask & __GFP_DIRECT_RECLAIM)) {
   447			spin_unlock_irqrestore(&pool->lock, flags);
   448			return NULL;
   449		}
   450	
   451		/* Let's wait for someone else to return an element to @pool */
   452		init_wait(&wait);
   453		prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
   454	
   455		spin_unlock_irqrestore(&pool->lock, flags);
   456	
   457		/*
   458		 * FIXME: this should be io_schedule().  The timeout is there as a
   459		 * workaround for some DM problems in 2.6.18.
   460		 */
   461		io_schedule_timeout(5*HZ);
   462	
   463		finish_wait(&pool->wait, &wait);
   464		goto repeat_alloc;
   465	}
   466	EXPORT_SYMBOL(mempool_alloc_noprof);
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
