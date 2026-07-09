Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60193806DA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585501; cv=none; b=nHbq30nwAvh3duTCpRh4Gf2ghLkFujI5u0LCsjE+bZ/xKGfd5rsv4TUvhoxzR6yGaR/oGzPiUrOxKdPzecP3bvVydggCuYLSce4h6DpgfIM2ZT1gOFbVjOHpsXccz9H5Is4mtYJCWKico47Gk7Jl0YCOqHurCRIhZzNIhFnB1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585501; c=relaxed/simple;
	bh=PxOqqsvhBN11W6/oVo5InTOiKDT9SXLt+t4ceQvi8bU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DBTkoLCrdUbLl89XtFAtkpzO9/feR9hYXwSl/pMLe+lvm79bDs74nVsXD2HvLvVSHtldwDZDy24buIuoRHJ1BxQkwCOjU0JoQiVxi5dOGICbEEwXIxiMldE4Hmm6c9GCM/3uJQyrbTWJFKxwDqnLJuI1sbx5pRkn9F0NnztzhGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rrya3dxo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rrya3dxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783585498; x=1815121498;
  h=date:from:to:cc:subject:message-id;
  bh=PxOqqsvhBN11W6/oVo5InTOiKDT9SXLt+t4ceQvi8bU=;
  b=Rrya3dxo/59M10B+gnDmjyoJgtO6s8dnc9GvUZPgqG/C0VQenDQTvY+W
   6SQdzHhE2OO0X10rZAh5TiazSuxFfHX/5E89C/Al3uGyt9Z46TiKFAx9f
   H4J5OMma1WwjcrFlUkvm92cMXaJ0rToi5A3KycaL8Kt6m27AiJN5jXbP6
   9Ufe58EVeg7ywWx3WPP7AGdRksTOXibgDg9gSWy+rxHG8kxh66j0nA8WW
   Vfa+SZFAU68o5zaj4X0KudM8wTWTHOHldPwWkMI8ENqIqEMN38OHYStCU
   BLRuw1tWNqzSjMW1RYBoLNAxTn3HXDH6tQw0TJuEB/vpzgwzNGczBEL1t
   Q==;
X-CSE-ConnectionGUID: tujbubJXSN2qfxcZ74ZazA==
X-CSE-MsgGUID: q7SnXhR8Tu+RrXc77/b8rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83372476"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83372476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:24:58 -0700
X-CSE-ConnectionGUID: sBXXlgGWQnShXNvAa+gLkQ==
X-CSE-MsgGUID: prmxN9GUSma5MxRUQN0Gew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250536150"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2026 01:24:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whk3x-00000000HRr-10PN;
	Thu, 09 Jul 2026 08:24:53 +0000
Date: Thu, 09 Jul 2026 16:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202607091659.SHEscT0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Harry,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef drm/amdgpu: Remove UML build exclusion from Kconfig
date:   7 weeks ago
config: um-randconfig-r122-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091659.SHEscT0c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091659.SHEscT0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: af3f2f5db265 ("drm/amdgpu: Remove UML build exclusion from Kconfig")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091659.SHEscT0c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:95:20: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h, drivers/gpu/drm/amd/amdgpu/amdgpu_object.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:519:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:3097:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:3097:17: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:3097:17: sparse:    struct dma_fence *

vim +95 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c

d8d019ccffb838b Felix Kuehling       2018-02-06   86  
d8d019ccffb838b Felix Kuehling       2018-02-06   87  struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
d8d019ccffb838b Felix Kuehling       2018-02-06   88  {
d8d019ccffb838b Felix Kuehling       2018-02-06   89  	struct amdgpu_amdkfd_fence *fence;
d8d019ccffb838b Felix Kuehling       2018-02-06   90  
d8d019ccffb838b Felix Kuehling       2018-02-06   91  	if (!f)
d8d019ccffb838b Felix Kuehling       2018-02-06   92  		return NULL;
d8d019ccffb838b Felix Kuehling       2018-02-06   93  
d8d019ccffb838b Felix Kuehling       2018-02-06   94  	fence = container_of(f, struct amdgpu_amdkfd_fence, base);
bf2ad4fb8adca89 Srinivasan Shanmugam 2023-12-27  @95  	if (f->ops == &amdkfd_fence_ops)
d8d019ccffb838b Felix Kuehling       2018-02-06   96  		return fence;
d8d019ccffb838b Felix Kuehling       2018-02-06   97  
d8d019ccffb838b Felix Kuehling       2018-02-06   98  	return NULL;
d8d019ccffb838b Felix Kuehling       2018-02-06   99  }
d8d019ccffb838b Felix Kuehling       2018-02-06  100  

:::::: The code at line 95 was first introduced by commit
:::::: bf2ad4fb8adca89374b54b225d494e0b1956dbea drm/amdgpu: Drop 'fence' check in 'to_amdgpu_amdkfd_fence()'

:::::: TO: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
