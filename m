Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A783446C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909520; cv=none; b=K3Btzy3a1SNhGg0vaGxkBohUpZObJesp4MMi2K5AluZb27ctoG4+RFqOQkCSu9PkFrgQg1rs5mun2V5aBZUF0BaP9k1cNmLRDZ9dfcOgL8IhDDMz11uenRR/Lo1UEVEfgLDCW7DKC01WZ11iTOXshx8ooinhX/GVJwUrePxeHtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909520; c=relaxed/simple;
	bh=EkkmVdMIQehg2jfJSVIL2rKSi+0TuTnZDj3VwcCCfdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPYjdkHklDznfcYqcCjDG5GjqIgEfw54jepC1OtXLGS7wN7Z5ERi6EmB/7DetVZ5t/LO3KByQfImdsmEcwGsJffvQYU5zNRFfpzxwJXgLrfkzgepF/6n+k1OG5FxXfW4FCriYz3YK+SwYgTrpJPpiE12QW/bnfhfuJ8G4Snprxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kvVUwLYI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kvVUwLYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761909518; x=1793445518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkkmVdMIQehg2jfJSVIL2rKSi+0TuTnZDj3VwcCCfdY=;
  b=kvVUwLYIWyOrydqV4b1G2cGriXFUW//PGDBsM7hZUDn7apHiKdiwdrGx
   Rb0lJA/bjTO8O3GKnx68sqJPTUclo002tbivQnQqVlPRIf60TsxPo/LR8
   N5S25KL4rIGjvGcw0VQf1akCN6RHPIJaIcElY2xgs8Nj+AwOJ/t1/kLqa
   KcXY/fRudPbbpumPrFZU20+/PRpFt/6R/jAiGhf9iVwXnvOXgadSLY7ML
   AzhErb7Z6HMwZE14J9qvOVznYzqMnbWfhO40naHLL/KJdkefpIPbIgkdQ
   AkmmyE6uQ1K+OI4JGgtW6EBATm23TWPhZ5RmzvZnCav8Nwjxf/hUDjm7R
   g==;
X-CSE-ConnectionGUID: vq3ZWqf9SCCghFyjJAUBjg==
X-CSE-MsgGUID: BQCKBRmISw2elFiBI31DXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75186200"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75186200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:18:38 -0700
X-CSE-ConnectionGUID: mGQr+Zh5RWGpjyjaeCnA7w==
X-CSE-MsgGUID: HqoLhXFWQSCvqti9y18Mng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="191357410"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2025 04:18:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEn8x-000N2G-1F;
	Fri, 31 Oct 2025 11:18:14 +0000
Date: Fri, 31 Oct 2025 19:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:blk-crypto-fallback 2/9] mm/mempool.c:411:45: error: use
 of undeclared identifier 'FAULT_NOWARN'
Message-ID: <202510311948.o1YLBLyh-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251031/202510311948.o1YLBLyh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311948.o1YLBLyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311948.o1YLBLyh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mempool.c:411:45: error: use of undeclared identifier 'FAULT_NOWARN'
     411 |         if (should_fail_ex(&fail_mempool_alloc, 1, FAULT_NOWARN)) {
         |                                                    ^~~~~~~~~~~~
   1 error generated.


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
