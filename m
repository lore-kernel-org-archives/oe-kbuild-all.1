Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095338911E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 01:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787104437; cv=none; b=EBx+5vmiSE2beo1hshMP1Y0agUVKYm3Zufs0zkUdXUPOYNxidAhQzxTDq+T5/pC1LMxcZjGP5RL8g5730Xep8vQF8RT6nEu0Wf2eoeY4dJKm/mR5HG4vpLAILI+FQQSwzXJO4nbLVXmQA54Co0GlHSEKs2xNfAtiMKYUMnKwgzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787104437; c=relaxed/simple;
	bh=/OfaoOqWsFmn3DwfU/crQjCS0zT/jrqHlrtMHHLt9xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WLqYA2gXsPk0nDbWwvWgMLDewoyf1MNX2aCrZzdkpWxuaPBRkx2S76afHun2q3/HpaZxMRR6MT5YHLC6RLo0ZffhkH1ZMxmsT+IXeA+Js1DLzUPIETC2uVIcG3RkVZv+iBOijmEMvWCjWall+XNzaF7fJKrU23CNwgXpZgw2Z0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cR/whCr1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cR/whCr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787104435; x=1818640435;
  h=date:from:to:cc:subject:message-id;
  bh=/OfaoOqWsFmn3DwfU/crQjCS0zT/jrqHlrtMHHLt9xg=;
  b=cR/whCr1ULdhu0Rqtu0NeGTv6E5gSNVFrdFNzRn9IH0p4VokNeb+buPi
   E7rUoa6TR1N5JjrVkP0Hsz9PDn36Jdvx/S/U/3nTMFBvQRO618Mqs7nbe
   wa/UgFRPqj8iJivMt+pPA3ShbGKdAXnXueZp1XCrdASmhJtiBHK1im14w
   1NhnaxgTNQxPE0MoYTFEF9QDlo6LS/cuRZJ6yYNBdYWhpyCPM+VQeOL3+
   fuRtgJjFgJQFuw6V6ZvBdBbs9gGlVgbgCvTLXWkIfYqGmG4tItm/UFW0K
   j4aGGK7pGCA/GEwaFa+eRcoLqFf2Gov1q1KX7ZxfdQELc1CA/ShjkOWeD
   g==;
X-CSE-ConnectionGUID: gB65RhVOTRalUHmS3k6qPQ==
X-CSE-MsgGUID: UE3hvGXPQemNonu+GayCgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="104988792"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="104988792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 18:53:54 -0700
X-CSE-ConnectionGUID: bH9yS/T2QdS3EH5mrCIIcA==
X-CSE-MsgGUID: 6VLJSynxSA+Io+Ee9wcCuw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2026 18:53:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVUz-00000000ena-3OE6;
	Wed, 19 Aug 2026 01:53:49 +0000
Date: Wed, 19 Aug 2026 09:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/32] fs/f2fs/f2fs.h:2392:47:
 error: 'struct f2fs_rwsem' has no member named 'read_waiters'
Message-ID: <202608190824.NpXWcfW1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5c36f73a41f1533cae407eba882ca2940e1775f1
commit: 4e1c4268094aed2888ea52c2626905886854a5c2 [0/32] ANDROID: vendor_hooks: add hooks for f2fs down read
config: i386-randconfig-002-20260818 (https://download.01.org/0day-ci/archive/20260819/202608190824.NpXWcfW1-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190824.NpXWcfW1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190824.NpXWcfW1-lkp@intel.com/

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
