Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EEB2D3EEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 02:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105702; cv=none; b=Y/wZ4OGCZI34DuXIPvmFonP5oxNPtVvZAS17DdETkxYwP+Pguc/X+pIdT1bRG/PVaDbhulnT0n7q/UlxdsEOs6r4liG83fF/1CLAJdFZceaKQHvcacIaEEYtEwZh/dc52EhoUE68J7cxPQ5F/jgapUoxaOHQ4FXnzenWr97SjwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105702; c=relaxed/simple;
	bh=8ZdkBeOsOCO9pG5a5T6Pa3viC6EApeLhn9c0JQXpsfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rN0D9fzC7aISzK/F/FEqufWVnINapPzU4lP0DiXDiliBv7ATOoUzkDWtDdX+lelIbBvzsTwdwJ5zAyVoRn3qeL6LqPz6vk9Q4dWNYoWN8FzAHc8kVSZIM3wLyyQ4nk5NqIRfe/cs3XNZ3H0L91I/77Od4UKAcyddO1UGY5CSIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxhhuLip; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxhhuLip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787105701; x=1818641701;
  h=date:from:to:cc:subject:message-id;
  bh=8ZdkBeOsOCO9pG5a5T6Pa3viC6EApeLhn9c0JQXpsfU=;
  b=fxhhuLipKtRUpGlnpvGpZZfC4jPrGr9cu01FeJaU+pfUgzgZNiX9qQHg
   9lApK8pS3lWA5mxqQqBXiaAD6IP0goqXfVA4YLSOEYnqcLjNTlndfblDE
   oDabLiB6zp6b81VMHTYPSMghLojuvc7FDPXpT2X6i0p0o6esX8NZ/+oVk
   whzoVXzbd/+o1Hd6xRSnr7BXNjBNDZjuamixsX3S6wOTjY6sQRYNp41YS
   +/tHzeGYVnwMKlEtKdfL3BJ7+ghFkRUgQji7x1O2BHk2I0N4yS64hO4lQ
   1SxPUhN1zselqMp7NqxmsPcmER+GAKxUfXKFZfzGpYxrDI3zVci5qC257
   A==;
X-CSE-ConnectionGUID: 6guDLp9hSwS2i9rxlBevHQ==
X-CSE-MsgGUID: kHY+rGV1QHaFNasDqH2LrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87482197"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87482197"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:15:00 -0700
X-CSE-ConnectionGUID: StbElsLVQymNIX/CWZYZ2Q==
X-CSE-MsgGUID: FFmmFrfuTMeHk0CZrEC+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268911566"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 19:14:58 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVpQ-00000000ep4-1rtb;
	Wed, 19 Aug 2026 02:14:56 +0000
Date: Wed, 19 Aug 2026 10:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 32/32]
 fs/f2fs/f2fs.h:2392:47: error: 'struct f2fs_rwsem' has no member named
 'read_waiters'
Message-ID: <202608190924.se9Aeifh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5c36f73a41f1533cae407eba882ca2940e1775f1
commit: 4e1c4268094aed2888ea52c2626905886854a5c2 [32/32] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190924.se9Aeifh-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190924.se9Aeifh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190924.se9Aeifh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
   fs/f2fs/f2fs.h: In function 'f2fs_down_read':
>> fs/f2fs/f2fs.h:2392:47: error: 'struct f2fs_rwsem' has no member named 'read_waiters'
    2392 |         _trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
         |                                               ^~


vim +2392 fs/f2fs/f2fs.h

  2385	
  2386	void _trace_android_rvh_f2fs_down_read(wait_queue_head_t *read_waiters,
  2387					   struct rw_semaphore *rwsem, bool *skip);
  2388	
  2389	static inline void f2fs_down_read(struct f2fs_rwsem *sem)
  2390	{
  2391		bool skip = false;
> 2392		_trace_android_rvh_f2fs_down_read(&sem->read_waiters, &sem->internal_rwsem, &skip);
  2393		if (skip)
  2394			return;
  2395	#ifdef CONFIG_F2FS_UNFAIR_RWSEM
  2396		wait_event(sem->read_waiters, down_read_trylock(&sem->internal_rwsem));
  2397	#else
  2398		down_read(&sem->internal_rwsem);
  2399	#endif
  2400	}
  2401	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
