Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC53BD22C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 11:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869481; cv=none; b=qI6af20queDNwnCGahY8nteDSK1IZYzyeOSReCp2LD86zxC/nbtETOrWMTbGwlm8/dv6jgHFUxCaRKJqEBzsqCWRfvD6Knpwdm2NF7kfrp9acyEbR8ODD9KHfm4X2GhM5rqR8tF7IqsJwNcA4Z7UHvGwZnAYtARUVPAdvfhEVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869481; c=relaxed/simple;
	bh=KQCdqygHmuMUSpvpKLuirxN7JJECFZ26lSCPY308ox4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u39FQD+3tJPLJcjqGhnNvEGG4TutX0L/gMNEmvhZYJY/cQerYZaQf/JI+XOdOHDto+hqbaTr39Ifpa/lSQXvwOVEZe3CzWtyYXt8KPCYPE9NiR5O2cuct1ZJYP++rfbnUk2Fj8S99EhobtGPtqD+Xb6BRv/JX894ORUFbbySSlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxnFGVAu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxnFGVAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774869479; x=1806405479;
  h=date:from:to:cc:subject:message-id;
  bh=KQCdqygHmuMUSpvpKLuirxN7JJECFZ26lSCPY308ox4=;
  b=QxnFGVAu3KP5InCuYiOUtGPE2a0qZxTRQOyPdoYAATek/XCB4wl6GSN9
   eYU4YukOjwofZNhyYa+rKcYhQ7nQWQAr0opPJpcL3EmJ+yl5u+SH8RO7d
   Yfnxaa35MqUAMElzku2nPZn7EHKf9BcMc9v8cGr6iHxOQFpes8DxZZTW3
   xqVIDXtulSi/qa6fl3e5LvB8EhGev8c3mm1hAJMyRE7X0cR39XXIxvXi7
   26WQZ1ODsf4Qm4IcTjUhde4TPhbCMDlYLAcbezU7vhwiNVM6V2cGuykU5
   zs69P3cMnM3dMofvmtDCJhGfUtW/k++/C4lG69TMN1s3q9ZzBtY+Jf6eQ
   Q==;
X-CSE-ConnectionGUID: GaJ/Vt5gTlKfWGaCjqfMoA==
X-CSE-MsgGUID: kyj5oFV6RxeCtRMW1OcfhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79760954"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79760954"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:17:59 -0700
X-CSE-ConnectionGUID: 2DtGHbQ7RUyvk2Mz0+1d6g==
X-CSE-MsgGUID: oNqsHutwR025YtivFVsa+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249079417"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 04:17:57 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Ad1-0000000010n-0oca;
	Mon, 30 Mar 2026 11:17:55 +0000
Date: Mon, 30 Mar 2026 19:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] lib/sbitmap.c:104:
 warning: Function parameter or member 'sb' not described in
 'sbitmap_spinlock'
Message-ID: <202603301944.FgubUex3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: 05baf38affa65735b6698f089e82af7c0e17b349 [2/2] ANDROID: sbitmap: Fix sbitmap_spinlock()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603301944.FgubUex3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301944.FgubUex3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301944.FgubUex3-lkp@intel.com/

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
