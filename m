Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B73B7B7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197166; cv=none; b=ihtyWb+9g9i8DAg4WXnZLA1z2JJgYHEDgdV4HNk4AFmF3vIb3tC6M5jmMHBEjNFE1Jc4rWJ4aOm/OXbpEo+qqqrH4Uk1plASbvfurpM/2LODO1cs5CoXbMnxMqWK+FryqosOXaMOYilwi/rnP7BUu5RoMviw3LkmFE0yatFCXJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197166; c=relaxed/simple;
	bh=/t6+IWwhWHvqHi8fK1lqVdmZrD/S+m/TCMeKE4LGJsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kOKmoB5X63oypUw2bsR2QeFLTVEN1uA54zK1uAGLKzBaWtoO+vre06kjHATIiV1IhlvBPNZnfKGvJ69kCHChp0zkOCTdrsLR7qTruFr3U41TVw+iIRpM6VwBnHxoEcvfQhv0yBS65nhV5E9iE36wJ5cigUfyakwlldiLSGdRSQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi5mVqJ7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi5mVqJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784197164; x=1815733164;
  h=date:from:to:cc:subject:message-id;
  bh=/t6+IWwhWHvqHi8fK1lqVdmZrD/S+m/TCMeKE4LGJsc=;
  b=Fi5mVqJ7979Ot93vbrbHqY/mZI8sTeyjln2qsjhXJe0SWQc4xL68rNSY
   GQlSMiSWzPntlcnM25J/wZVqptOeL0aSErdBYtY2f6DRB7A2HyG5D+QnK
   pwlKpcjCQR5COOa+mMtTpG1NBZdZ8Lo5vrMyX4cmZuMHNjDtisDF6B4z2
   RR5xtGZo4isf5lcR/SgmoVKCesdislae2nznXVmrq4VU2V18Wl5gBrPtI
   L9H2iGDJ2Qdeqp7HZc2v/A2EeSe2VI7rKZVymUoXdSfpuXWU/g50kkInt
   QL9PLsXh0MnDQLXS3RmmVh3BTDwmYxZGzHM6wOIPIjjt6jcONzOQLFWBh
   A==;
X-CSE-ConnectionGUID: Lu/dNYG1Raix7e0Th8anoA==
X-CSE-MsgGUID: rVlbFuZdRcK5xrHZ/joqtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96367426"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="96367426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:19:23 -0700
X-CSE-ConnectionGUID: x7Cmb5/nSO+4K3/ZOi5AoQ==
X-CSE-MsgGUID: dWAo4WC+Q5CWOsC/DrPvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253833328"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2026 03:19:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkJBT-00000000Ofq-31dv;
	Thu, 16 Jul 2026 10:19:16 +0000
Date: Thu, 16 Jul 2026 18:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 1/1]
 lib/sbitmap.c:104: warning: Function parameter or member 'sb' not described
 in 'sbitmap_spinlock'
Message-ID: <202607161823.2stQ8bZY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   bb7218bc09c920f6ff72bf0b939cf88fa52736ff
commit: 05baf38affa65735b6698f089e82af7c0e17b349 [1/1] ANDROID: sbitmap: Fix sbitmap_spinlock()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260716/202607161823.2stQ8bZY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161823.2stQ8bZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161823.2stQ8bZY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sbitmap.c:104: warning: Function parameter or member 'sb' not described in 'sbitmap_spinlock'
>> lib/sbitmap.c:104: warning: Excess function parameter 'map' description in 'sbitmap_spinlock'
>> lib/sbitmap.c:104: warning: Excess function parameter 'map_nr' description in 'sbitmap_spinlock'


vim +104 lib/sbitmap.c

bf2c4282a10a92 Ming Lei        2021-01-22   59  
783d6780cd6684 Yang Yang       2024-07-16   60  /**
783d6780cd6684 Yang Yang       2024-07-16   61   * sbitmap_spinlock() - Get the spinlock corresponding to sbitmap_work.
783d6780cd6684 Yang Yang       2024-07-16   62   * @map: The memory address of the index sbitmap_work area.
783d6780cd6684 Yang Yang       2024-07-16   63   * @map_nr: Number of words (cachelines) being used for the bitmap.
783d6780cd6684 Yang Yang       2024-07-16   64   * @index: The index of the spinlock.
783d6780cd6684 Yang Yang       2024-07-16   65   *
783d6780cd6684 Yang Yang       2024-07-16   66   * this lock: serializes simultaneous updates of ->word and ->cleared.
783d6780cd6684 Yang Yang       2024-07-16   67   * sbitmap_spinlock is for checking on ->cleared and updating on both
783d6780cd6684 Yang Yang       2024-07-16   68   * ->cleared and ->word need to be done atomically.
783d6780cd6684 Yang Yang       2024-07-16   69   *  Prevent the following situations from causing block:
783d6780cd6684 Yang Yang       2024-07-16   70   * Configuration for sbq:
783d6780cd6684 Yang Yang       2024-07-16   71   * depth=64, wake_batch=6, shift=6, map_nr=1
783d6780cd6684 Yang Yang       2024-07-16   72   *
783d6780cd6684 Yang Yang       2024-07-16   73   * 1. There are 64 requests in progress:
783d6780cd6684 Yang Yang       2024-07-16   74   * map->word = 0xFFFFFFFFFFFFFFFF
783d6780cd6684 Yang Yang       2024-07-16   75   * 2. After all the 64 requests complete, and no more requests come:
783d6780cd6684 Yang Yang       2024-07-16   76   * map->word = 0xFFFFFFFFFFFFFFFF, map->cleared = 0xFFFFFFFFFFFFFFFF
783d6780cd6684 Yang Yang       2024-07-16   77   * 3. Now two tasks try to allocate requests:
783d6780cd6684 Yang Yang       2024-07-16   78   * T1:                                       T2:
783d6780cd6684 Yang Yang       2024-07-16   79   * __blk_mq_get_tag                          .
783d6780cd6684 Yang Yang       2024-07-16   80   * __sbitmap_queue_get                       .
783d6780cd6684 Yang Yang       2024-07-16   81   * sbitmap_get                               .
783d6780cd6684 Yang Yang       2024-07-16   82   * sbitmap_find_bit                          .
783d6780cd6684 Yang Yang       2024-07-16   83   * sbitmap_find_bit_in_word                  .
783d6780cd6684 Yang Yang       2024-07-16   84   * sbitmap_get_word  -> nr=-1              __blk_mq_get_tag
783d6780cd6684 Yang Yang       2024-07-16   85   * sbitmap_deferred_clear                    __sbitmap_queue_get
783d6780cd6684 Yang Yang       2024-07-16   86   * //map->cleared=0xFFFFFFFFFFFFFFFF         sbitmap_find_bit
783d6780cd6684 Yang Yang       2024-07-16   87   *   if (!READ_ONCE(map->cleared))           sbitmap_find_bit_in_word
783d6780cd6684 Yang Yang       2024-07-16   88   *     return false;                         __sbitmap_get_word -> nr=-1
783d6780cd6684 Yang Yang       2024-07-16   89   * mask = xchg(&map->cleared, 0)             sbitmap_deferred_clear
783d6780cd6684 Yang Yang       2024-07-16   90   * atomic_long_andnot()                      // map->cleared=0
783d6780cd6684 Yang Yang       2024-07-16   91   *                                             if (!(map->cleared))
783d6780cd6684 Yang Yang       2024-07-16   92   *                                               return false;
783d6780cd6684 Yang Yang       2024-07-16   93   *
783d6780cd6684 Yang Yang       2024-07-16   94   *                                    // map->cleared is cleared by T1
783d6780cd6684 Yang Yang       2024-07-16   95   *                                    // T2 fail to acquire the tag
783d6780cd6684 Yang Yang       2024-07-16   96   *
783d6780cd6684 Yang Yang       2024-07-16   97   * 4. T2 is the sole tag waiter. When T1 puts the tag, T2 cannot be woken
783d6780cd6684 Yang Yang       2024-07-16   98   * up due to the wake_batch being set at 6. If no more requests come, T1
783d6780cd6684 Yang Yang       2024-07-16   99   * will wait here indefinitely.
783d6780cd6684 Yang Yang       2024-07-16  100   *
783d6780cd6684 Yang Yang       2024-07-16  101   * Return: Returns the spinlock corresponding to index.
783d6780cd6684 Yang Yang       2024-07-16  102   */
05baf38affa657 Bart Van Assche 2025-04-03  103  static spinlock_t *sbitmap_spinlock(struct sbitmap *sb, unsigned int index)
783d6780cd6684 Yang Yang       2024-07-16 @104  {
05baf38affa657 Bart Van Assche 2025-04-03  105  	const unsigned int max_map_nr = *(unsigned int *)&sb->map[-1];
05baf38affa657 Bart Van Assche 2025-04-03  106  	spinlock_t *const base_lock = (spinlock_t *)
05baf38affa657 Bart Van Assche 2025-04-03  107  		round_up((uintptr_t)&sb->map[max_map_nr],
05baf38affa657 Bart Van Assche 2025-04-03  108  			 __alignof__(spinlock_t));
05baf38affa657 Bart Van Assche 2025-04-03  109  
05baf38affa657 Bart Van Assche 2025-04-03  110  	WARN_ON_ONCE(index < 0 || index >= sb->map_nr);
783d6780cd6684 Yang Yang       2024-07-16  111  
783d6780cd6684 Yang Yang       2024-07-16  112  	return &base_lock[index];
783d6780cd6684 Yang Yang       2024-07-16  113  }
783d6780cd6684 Yang Yang       2024-07-16  114  

:::::: The code at line 104 was first introduced by commit
:::::: 783d6780cd66848c96945c8143a808a2b98c9836 ANDROID: Fixed the KMI corruption issue caused by the patch of 72d04bdcf3f7.

:::::: TO: Yang Yang <yang.yang@vivo.com>
:::::: CC: Todd Kjos <tkjos@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
