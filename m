Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA21392
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741418586; cv=none; b=QGqbxNnqDDOm+ijfGW4fJC3lqypoVcfK6yzjAMnH98m+AzNlxNBRu0tEetqxZOsk50irAL0KwxmYgyYVL4NGX8mqd/0ksCG0tx/NBVEzRmG9gnXL0BibgR60B5ZxzlJSplpalaBSqhbXCIV9DWTd0L2VivM9LBz1zBnTDmlAWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741418586; c=relaxed/simple;
	bh=OcmFWUoe33XaCHWaZcTAHN/KILUqemZD4SJiCvgYBHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rwwZNPqdM1dYKDsDn2xWiiSSZNJk5dc1jmQmDiYJxrFm8U8P4xz0RMOpUB6zCkgA3uQ3W/1cxJc4fEvGLglwOAu5coskjpV1HVV18gktRzcV0D4yYB652e2iDUJDcp6y2WS6vpdc21ZFT+JMEkIwaPhRNF5lbdn5tzqPIvfRB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABgPx2os; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABgPx2os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741418584; x=1772954584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcmFWUoe33XaCHWaZcTAHN/KILUqemZD4SJiCvgYBHQ=;
  b=ABgPx2osZBifLFJdF7Ell7MHHswHyC/jTE+pxLdEvHiADygcpF31UkOX
   5pXCCLYQ0/navC8lqy9dlJjcGudgG5/lj2HgEnTFRRPXH0nLCFsmX7SHO
   WQuReKtur8vrC6LMGUq8Sm229KqzZIIEhEfD9XxqTsXJIBBWweSODGzM8
   lGR6Ka7xhxwx1kXeLp3hgoanbe1nTf3XzwYmm36/JH7HqLWC5UcK6jV9b
   RZvcn2DLkLqdbwMdRf6q4XTtgGKhpjLa0CYf4dMQVHc9dh57wVF+HpANj
   ZIwKMGTxVws5BTs+mlUlyrg4RXvIe1DuQcYMXOjMPDu8YyxiTXU8yi7Hf
   w==;
X-CSE-ConnectionGUID: z5uJapvXRNepKAjGA4PWpQ==
X-CSE-MsgGUID: R9XVPVuZR0u8udl+W6nU0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="60025830"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="60025830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 23:23:03 -0800
X-CSE-ConnectionGUID: I1tBM8LrTDeEwpO8LB60cg==
X-CSE-MsgGUID: unXKmMoBR5Kf7zliv1A8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123696355"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2025 23:23:03 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqoWS-0001e6-2w;
	Sat, 08 Mar 2025 07:23:00 +0000
Date: Sat, 8 Mar 2025 15:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-experiments 297/411]
 drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:24: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202503081553.xpNsPmOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 21a8993e78a379a22cd049ca8b4f8ff1bae66612 [297/411] start porting vgpu away from encoding it's own stuff
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250308/202503081553.xpNsPmOk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081553.xpNsPmOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081553.xpNsPmOk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:10: error: 'struct nvkm_vgpu_mgr_vfio_ops' has no member named 'rm_ctrl_get'
     273 |         .rm_ctrl_get = rm_ctrl_get,
         |          ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     273 |         .rm_ctrl_get = rm_ctrl_get,
         |                        ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:24: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
>> drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:24: warning: excess elements in struct initializer
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:273:24: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:274:10: error: 'struct nvkm_vgpu_mgr_vfio_ops' has no member named 'rm_ctrl_wr'
     274 |         .rm_ctrl_wr = rm_ctrl_wr,
         |          ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:274:23: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     274 |         .rm_ctrl_wr = rm_ctrl_wr,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:274:23: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:274:23: warning: excess elements in struct initializer
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:274:23: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:275:10: error: 'struct nvkm_vgpu_mgr_vfio_ops' has no member named 'rm_ctrl_rd'
     275 |         .rm_ctrl_rd = rm_ctrl_rd,
         |          ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:275:23: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     275 |         .rm_ctrl_rd = rm_ctrl_rd,
         |                       ^~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:275:23: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:275:23: warning: excess elements in struct initializer
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:275:23: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:276:10: error: 'struct nvkm_vgpu_mgr_vfio_ops' has no member named 'rm_ctrl_done'
     276 |         .rm_ctrl_done = rm_ctrl_done,
         |          ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:276:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     276 |         .rm_ctrl_done = rm_ctrl_done,
         |                         ^~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:276:25: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:276:25: warning: excess elements in struct initializer
   drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c:276:25: note: (near initialization for 'nvkm_vgpu_mgr_vfio_ops')
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +273 drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c

376e56be39310d0 Zhi Wang 2024-09-15  264  
2f48467e9860881 Zhi Wang 2024-09-14  265  struct nvkm_vgpu_mgr_vfio_ops nvkm_vgpu_mgr_vfio_ops = {
2f48467e9860881 Zhi Wang 2024-09-14  266  	.vgpu_mgr_is_enabled = vgpu_mgr_is_enabled,
2f48467e9860881 Zhi Wang 2024-09-14  267  	.get_handle = get_handle,
2f48467e9860881 Zhi Wang 2024-09-14  268  	.attach_handle = attach_handle,
2f48467e9860881 Zhi Wang 2024-09-14  269  	.detach_handle = detach_handle,
e06db080115b1d9 Zhi Wang 2024-09-14  270  	.alloc_gsp_client = alloc_gsp_client,
e06db080115b1d9 Zhi Wang 2024-09-14  271  	.free_gsp_client = free_gsp_client,
e06db080115b1d9 Zhi Wang 2024-09-14  272  	.get_gsp_client_handle = get_gsp_client_handle,
5660b431a80caec Zhi Wang 2024-09-15 @273  	.rm_ctrl_get = rm_ctrl_get,
5660b431a80caec Zhi Wang 2024-09-15  274  	.rm_ctrl_wr = rm_ctrl_wr,
5660b431a80caec Zhi Wang 2024-09-15  275  	.rm_ctrl_rd = rm_ctrl_rd,
5660b431a80caec Zhi Wang 2024-09-15  276  	.rm_ctrl_done = rm_ctrl_done,
cd1048ecedbb6d4 Zhi Wang 2024-09-15  277  	.alloc_chids = alloc_chids,
cd1048ecedbb6d4 Zhi Wang 2024-09-15  278  	.free_chids = free_chids,
9eeb4652ed269e4 Zhi Wang 2024-09-15  279  	.alloc_fbmem = alloc_fbmem,
9eeb4652ed269e4 Zhi Wang 2024-09-15  280  	.free_fbmem = free_fbmem,
8d3fa270cae416e Zhi Wang 2024-09-15  281  	.bar1_map_mem = bar1_map_mem,
8d3fa270cae416e Zhi Wang 2024-09-15  282  	.bar1_unmap_mem = bar1_unmap_mem,
376e56be39310d0 Zhi Wang 2024-09-15  283  	.get_engine_bitmap = get_engine_bitmap,
2f48467e9860881 Zhi Wang 2024-09-14  284  };
2f48467e9860881 Zhi Wang 2024-09-14  285  

:::::: The code at line 273 was first introduced by commit
:::::: 5660b431a80caecbc5213322cbd39db25d40ac80 nvkm/vgpu: introduce GSP RM control interface for vGPU

:::::: TO: Zhi Wang <zhiw@nvidia.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
