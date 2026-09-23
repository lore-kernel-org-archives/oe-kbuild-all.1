Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9B3DD84C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183893; cv=none; b=AUKD0x111rZ9byDgyYgvrllFSYXpKcbsh3wJzFMjgDF0uiAf+Y/HCItmgHe6I1aKOHqqLo7zWV1TP4mp/1dxY4sxsdJoPsXwxo5A2Fp5NBRMxr+DDZUUaCdmjzK/2CL8c5Fa2KOngkZ0O023Uq4D6AUSrTp4hzRxHPBqD3qa4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183893; c=relaxed/simple;
	bh=ype0viho2U2eqsl8yRFS0Qf+BUD1km4sDLwI3cbRe0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nUzxjquC9PuBn2d2tS5ePoAzg4R33+VlbCMRVoazTb818EU6WxxXqRRl0xC9EqpM9KL/v6vpvEIV8Aa8paPYG1c94iCLPBUhvwc7r4Eb5Mw+peB4jwX1e+8NfR0mUFIPhUYWuZX+hK/pLHlWFb2g89KdNuOAHyGprlWEydijmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqVMc7v4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqVMc7v4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790183891; x=1821719891;
  h=date:from:to:cc:subject:message-id;
  bh=ype0viho2U2eqsl8yRFS0Qf+BUD1km4sDLwI3cbRe0A=;
  b=AqVMc7v4VPYeSXXCTS0JgsVwzRrrH367BgHtZIvmfzawH6K91CV9RiKd
   PMY42M6vVPtatOduoIlSGM+pwHXimU9sO53qtlR/C725kcdbHetMd1CsQ
   T4JydHRsds3aps7fx8PAj4UnvN4ymiRRLpx8aRdM97HIib7SgAzLp712W
   SvWaSwf/VWYUE42UxDhnoU0FgyQXTnQnVpQEmji82L6XMT4tPbj1XGv8g
   RY3C2d8P82Lv317xPzyPwmoMqKrcv2232mLlmDmPoJcvs7SW+AkOC60fr
   NIwVdcAxwbBfghGGvZ8sQIRRjTexjOuQ4HVfGD7zBrGJqkEIY7Lx7spLq
   A==;
X-CSE-ConnectionGUID: jkpEPvnDTQurAL1KYnGSsg==
X-CSE-MsgGUID: q+Tu7fqGTweVSBBVJthw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90035272"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90035272"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 10:18:10 -0700
X-CSE-ConnectionGUID: f/ENQl9WQw+k6LJgzS0RKQ==
X-CSE-MsgGUID: SPO4Jh7LQcuj8WqB+fIezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299959273"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 10:18:08 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Qbe-000000000kt-1MI5;
	Wed, 23 Sep 2026 17:18:06 +0000
Date: Wed, 23 Sep 2026 19:17:30 +0200
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 47/114]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: warning:
 stack frame size (32912) exceeds limit (2048) in 'dc_memory_pool_create'
Message-ID: <202609231919.tiTCav93-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   cf48bd0a46279f4607956cb17c71bda96ee802e3
commit: 6f74688d7e2377e253671d36acd63a988186216b [47/114] drm/amd/display: Add lock-free memory pool
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260923/202609231919.tiTCav93-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231919.tiTCav93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231919.tiTCav93-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:87:37: warning: stack frame size (32912) exceeds limit (2048) in 'dc_memory_pool_create' [-Wframe-larger-than]
      87 | __must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
         |                                     ^
   1 warning generated.


vim +/dc_memory_pool_create +87 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c

    86	
  > 87	__must_check struct dc_memory_pool *dc_memory_pool_create(size_t size,
    88								  size_t capacity)
    89	{
    90		if (!size || !capacity)
    91			return NULL;
    92	
    93		// Limited by split between size and generation in index_t
    94		if (capacity >= (uint32_t)-DC_MEMORY_POOL_ENUM_SIZE)
    95			return NULL;
    96	
    97		// uint32_t because that's what alloc functions take
    98		const uint32_t block_pages = (uint32_t)size_in_pages(size);
    99		const uint32_t lines = (uint32_t)capacity * block_pages;
   100		const uint32_t padded_struct_size =
   101			sizeof(struct dc_memory_pool) + PAGE_SIZE;
   102	
   103		void *unaligned_pool = kzalloc(padded_struct_size, GFP_KERNEL);
   104	
   105		if (!unaligned_pool)
   106			return NULL;
   107	
   108		struct dc_memory_pool *pool = page_align_up(unaligned_pool);
   109	
   110		*pool = (struct dc_memory_pool){
   111			.size = size,
   112			.capacity = capacity,
   113			.unaligned_pool = unaligned_pool,
   114			.unaligned_memory = kcalloc(lines + 1, PAGE_SIZE, GFP_KERNEL),
   115			.free_list = kcalloc((uint32_t)capacity, sizeof(atomic_t),
   116					     GFP_KERNEL),
   117			.free_head = ATOMIC_INIT(0),
   118		};
   119		pool->memory = page_align_up(pool->unaligned_memory);
   120	
   121		if (!pool->unaligned_memory || !pool->free_list) {
   122			dc_memory_pool_destroy(pool);
   123			return NULL;
   124		}
   125	
   126		for (int32_t i = 0; i < (int32_t)capacity; i++)
   127			atomic_set_release(&pool->free_list[i], i + 1);
   128	
   129		atomic_set_release(&pool->free_list[capacity - 1],
   130				   DC_MEMORY_POOL_SENTINEL);
   131	
   132		return pool;
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
