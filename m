Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C692F21D3F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765718053; cv=none; b=jcU+kPhtlVoekYrLgh7/l8Ik/BB1R1cbvyuaBlpOYNZHnlMZFp0B31e/b6/5HrEdFDPqt8Q6QcGTWM6AjHs+FnkeKGZwXD3ChsZp9eeVlVktCWIncBulHUi2zyt1J0e7FXKMs/WorK3LNJR7AZB0verhys+3jSkOK68HuFZ1J7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765718053; c=relaxed/simple;
	bh=yhF4N+Q09s9B1jSAjfqauoZqqfIpMBw6jCZD0TlwFcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iiMaOs82NVrBkBBAGUkhufbKd5q1/fh6mYgzdADyfOmG10fRmXrsUb/tvUl7ZAKHa+F+T9moPM/rha2eARtAf+DlITzPodcljxys4nso8xGfp+9oYs3wYRNjZatrRR9cnJHFaqlHzyO/F14ZRrlQU01sUndJwXNxSys4+fUdl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr7rBYnQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr7rBYnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765718052; x=1797254052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhF4N+Q09s9B1jSAjfqauoZqqfIpMBw6jCZD0TlwFcA=;
  b=lr7rBYnQLayudVHA6rF+w5setxInAsVIIVFi/JTxWnk+/KwcAVmI309X
   35LnCDztdDN5qT1TRALSJryeaCI8BITLsykDIX9y3vOTrMHhc6aQgCvDQ
   qygCyCRyIvP/2EIYOXjiu0y5TKQrVO5dyWUw8DYbLdDbw0IJ8an1wVJeT
   lzG7GmPlUI04oYIXadthFRPWnFU9uFCdbQ9i/6ECTWLpV5DGS/OsLUmBS
   TeZ7Sb8L/bsIvmNYgxGHDcWm0VxC1DEU2+iyR8XTo0pqZ6atXpjwoR7TC
   TmKxqJA12DShNTWg4X2+bCvsncyI/NbwSR523y9Pwlt1BQ/Tp7UoOcRzz
   w==;
X-CSE-ConnectionGUID: WXC1zrL5TUiBYVWj7ZbVTg==
X-CSE-MsgGUID: 8mRpCfXMRsydtTZx5t05+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67683176"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67683176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 05:14:12 -0800
X-CSE-ConnectionGUID: zPC3K12wQWGgmIpW+9YBLQ==
X-CSE-MsgGUID: ZXa0dWDHRgCRQKw3AZ6mAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197129940"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Dec 2025 05:14:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUlvM-0000000091x-05IL;
	Sun, 14 Dec 2025 13:14:08 +0000
Date: Sun, 14 Dec 2025 21:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-12 1/1] lib/sbitmap.c:104:
 warning: Function parameter or member 'sb' not described in
 'sbitmap_spinlock'
Message-ID: <202512142114.0R0O3eyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-12
head:   0832a8cf7ee1e46c7472139b10da3bc2a68bb8c0
commit: 7b1f455c7143098e61cdd2298639e3c412c285f2 [1/1] ANDROID: sbitmap: Fix sbitmap_spinlock()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512142114.0R0O3eyF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142114.0R0O3eyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142114.0R0O3eyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sbitmap.c:104: warning: Function parameter or member 'sb' not described in 'sbitmap_spinlock'
>> lib/sbitmap.c:104: warning: Excess function parameter 'map' description in 'sbitmap_spinlock'
   lib/sbitmap.c:104: warning: Excess function parameter 'map_nr' description in 'sbitmap_spinlock'


vim +104 lib/sbitmap.c

bf2c4282a10a928 Ming Lei        2021-01-22   59  
1960324b25c8e48 Yang Yang       2024-07-16   60  /**
1960324b25c8e48 Yang Yang       2024-07-16   61   * sbitmap_spinlock() - Get the spinlock corresponding to sbitmap_work.
1960324b25c8e48 Yang Yang       2024-07-16   62   * @map: The memory address of the index sbitmap_work area.
1960324b25c8e48 Yang Yang       2024-07-16   63   * @map_nr: Number of words (cachelines) being used for the bitmap.
1960324b25c8e48 Yang Yang       2024-07-16   64   * @index: The index of the spinlock.
1960324b25c8e48 Yang Yang       2024-07-16   65   *
1960324b25c8e48 Yang Yang       2024-07-16   66   * this lock: serializes simultaneous updates of ->word and ->cleared.
1960324b25c8e48 Yang Yang       2024-07-16   67   * sbitmap_spinlock is for checking on ->cleared and updating on both
1960324b25c8e48 Yang Yang       2024-07-16   68   * ->cleared and ->word need to be done atomically.
1960324b25c8e48 Yang Yang       2024-07-16   69   *  Prevent the following situations from causing block:
1960324b25c8e48 Yang Yang       2024-07-16   70   * Configuration for sbq:
1960324b25c8e48 Yang Yang       2024-07-16   71   * depth=64, wake_batch=6, shift=6, map_nr=1
1960324b25c8e48 Yang Yang       2024-07-16   72   *
1960324b25c8e48 Yang Yang       2024-07-16   73   * 1. There are 64 requests in progress:
1960324b25c8e48 Yang Yang       2024-07-16   74   * map->word = 0xFFFFFFFFFFFFFFFF
1960324b25c8e48 Yang Yang       2024-07-16   75   * 2. After all the 64 requests complete, and no more requests come:
1960324b25c8e48 Yang Yang       2024-07-16   76   * map->word = 0xFFFFFFFFFFFFFFFF, map->cleared = 0xFFFFFFFFFFFFFFFF
1960324b25c8e48 Yang Yang       2024-07-16   77   * 3. Now two tasks try to allocate requests:
1960324b25c8e48 Yang Yang       2024-07-16   78   * T1:                                       T2:
1960324b25c8e48 Yang Yang       2024-07-16   79   * __blk_mq_get_tag                          .
1960324b25c8e48 Yang Yang       2024-07-16   80   * __sbitmap_queue_get                       .
1960324b25c8e48 Yang Yang       2024-07-16   81   * sbitmap_get                               .
1960324b25c8e48 Yang Yang       2024-07-16   82   * sbitmap_find_bit                          .
1960324b25c8e48 Yang Yang       2024-07-16   83   * sbitmap_find_bit_in_word                  .
1960324b25c8e48 Yang Yang       2024-07-16   84   * sbitmap_get_word  -> nr=-1              __blk_mq_get_tag
1960324b25c8e48 Yang Yang       2024-07-16   85   * sbitmap_deferred_clear                    __sbitmap_queue_get
1960324b25c8e48 Yang Yang       2024-07-16   86   * //map->cleared=0xFFFFFFFFFFFFFFFF         sbitmap_find_bit
1960324b25c8e48 Yang Yang       2024-07-16   87   *   if (!READ_ONCE(map->cleared))           sbitmap_find_bit_in_word
1960324b25c8e48 Yang Yang       2024-07-16   88   *     return false;                         __sbitmap_get_word -> nr=-1
1960324b25c8e48 Yang Yang       2024-07-16   89   * mask = xchg(&map->cleared, 0)             sbitmap_deferred_clear
1960324b25c8e48 Yang Yang       2024-07-16   90   * atomic_long_andnot()                      // map->cleared=0
1960324b25c8e48 Yang Yang       2024-07-16   91   *                                             if (!(map->cleared))
1960324b25c8e48 Yang Yang       2024-07-16   92   *                                               return false;
1960324b25c8e48 Yang Yang       2024-07-16   93   *
1960324b25c8e48 Yang Yang       2024-07-16   94   *                                    // map->cleared is cleared by T1
1960324b25c8e48 Yang Yang       2024-07-16   95   *                                    // T2 fail to acquire the tag
1960324b25c8e48 Yang Yang       2024-07-16   96   *
1960324b25c8e48 Yang Yang       2024-07-16   97   * 4. T2 is the sole tag waiter. When T1 puts the tag, T2 cannot be woken
1960324b25c8e48 Yang Yang       2024-07-16   98   * up due to the wake_batch being set at 6. If no more requests come, T1
1960324b25c8e48 Yang Yang       2024-07-16   99   * will wait here indefinitely.
1960324b25c8e48 Yang Yang       2024-07-16  100   *
1960324b25c8e48 Yang Yang       2024-07-16  101   * Return: Returns the spinlock corresponding to index.
1960324b25c8e48 Yang Yang       2024-07-16  102   */
7b1f455c7143098 Bart Van Assche 2025-04-03  103  static spinlock_t *sbitmap_spinlock(struct sbitmap *sb, unsigned int index)
1960324b25c8e48 Yang Yang       2024-07-16 @104  {
7b1f455c7143098 Bart Van Assche 2025-04-03  105  	const unsigned int max_map_nr = *(unsigned int *)&sb->map[-1];
7b1f455c7143098 Bart Van Assche 2025-04-03  106  	spinlock_t *const base_lock = (spinlock_t *)
7b1f455c7143098 Bart Van Assche 2025-04-03  107  		round_up((uintptr_t)&sb->map[max_map_nr],
7b1f455c7143098 Bart Van Assche 2025-04-03  108  			 __alignof__(spinlock_t));
7b1f455c7143098 Bart Van Assche 2025-04-03  109  
7b1f455c7143098 Bart Van Assche 2025-04-03  110  	WARN_ON_ONCE(index < 0 || index >= sb->map_nr);
1960324b25c8e48 Yang Yang       2024-07-16  111  
1960324b25c8e48 Yang Yang       2024-07-16  112  	return &base_lock[index];
1960324b25c8e48 Yang Yang       2024-07-16  113  }
1960324b25c8e48 Yang Yang       2024-07-16  114  

:::::: The code at line 104 was first introduced by commit
:::::: 1960324b25c8e48c0e05af54ba87a1b8fa2af920 ANDROID: Fixed the KMI corruption issue caused by the patch of 72d04bdcf3f7.

:::::: TO: Yang Yang <yang.yang@vivo.com>
:::::: CC: Wang Jianzheng <11134417@vivo.corp-partner.google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
