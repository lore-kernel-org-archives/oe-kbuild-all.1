Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2F215F42
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 05:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769664131; cv=none; b=pTRHCtTPLukNY+l+1F2Z70aiiZ7fSUHkbxNnm88X18+A/bXXxepLLksb0pAltjcRJweIqSeqxm/IKrjOZdr5+h708HEVrL6yUuJwdI1TbG2YNUJKIyXSE095Ab8Y2bQgovPySocE6MvOTiZkXzIx80Cb/tpL40CupglBjNLl/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769664131; c=relaxed/simple;
	bh=A01u606f1GR9w+QwbQbAzLgCSUnU6yjRL6DKCbA3g5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4jR+7/ibmLhIHNB7pgGLPa+QwsK6ic77IrXfwUxKwCSPPaqyk8IOZsBtGpG1P8b6OholwSElKuGwBRBuF9eRLROIKdl1uNo8cTmmy50CSd0YFKsovlnpmnTtvFyotJoBAQdGWRFl60hTEirK9ryQf7++SOFSul3z8NQJsyQhaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3llJjp1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3llJjp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769664129; x=1801200129;
  h=date:from:to:cc:subject:message-id;
  bh=A01u606f1GR9w+QwbQbAzLgCSUnU6yjRL6DKCbA3g5g=;
  b=k3llJjp1kIWA+yJkxYFIGwxmH1SC6VbC+9G15Wq6jyPtEbJgsJCr3zTc
   LHyoTMndcMUyFLli+B+2+kkuhOXkiVxC6CDz0ZdHIn8rRaHsHlSQqmnPn
   yildgz43anWH8i2VnDzdD3P3zktGaQZPS0pXM8v4160G0scP2hUVKrgTe
   pr5C3Ho56MNVXPSbVkzO1aF+kzAjRUfDYMXfWFz2mo1Rw/4JTGWnme61r
   t/DJ+N1JiJ+D1A9wWiiYdF+/1KA4MFYORtqDyCp0jKzFab8car+IGmACo
   ja31DjcLzsbTFPvqhbbqhzvq+cT4lHSe00FzqevW4hhZliXgLX+jCnj0w
   Q==;
X-CSE-ConnectionGUID: aEVMbXlzTMCPqDVRe96U2w==
X-CSE-MsgGUID: ig4bbI7eTjqtbdeLtC7brg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74741966"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="74741966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 21:22:09 -0800
X-CSE-ConnectionGUID: pSLwRc+OTUmm2041YVye4g==
X-CSE-MsgGUID: r2JWGOEzRhSLQTYQNQlKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="213016010"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2026 21:22:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlKTk-00000000b7Y-1NHL;
	Thu, 29 Jan 2026 05:22:04 +0000
Date: Thu, 29 Jan 2026 13:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Subject: [linux-next:master 525/10321]
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:71: warning: 'snprintf' output
 may be truncated before the last format character
Message-ID: <202601291312.QmkD0QFR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jack,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f24e4edcd1b8981c6b448ea2680726dedd87279
commit: e220edf2d6fd6dbf08fa93790809500a80217948 [525/10321] drm/amdgpu/mes_v12_1: initial support for mes_v12_1
config: alpha-randconfig-r132-20260128 (https://download.01.org/0day-ci/archive/20260129/202601291312.QmkD0QFR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291312.QmkD0QFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291312.QmkD0QFR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c: In function 'mes_v12_1_sw_init':
>> drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:71: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
                                                                          ^
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:2: note: 'snprintf' output between 16 and 23 bytes into a destination of size 16
     snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       (unsigned char)xcc_id, (unsigned char)ring->me,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       (unsigned char)ring->pipe, (unsigned char)ring->queue);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=m]


vim +/snprintf +1352 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

  1326	
  1327	static int mes_v12_1_kiq_ring_init(struct amdgpu_device *adev, int xcc_id)
  1328	{
  1329		struct amdgpu_ring *ring;
  1330		int inst = MES_PIPE_INST(xcc_id, AMDGPU_MES_KIQ_PIPE);
  1331	
  1332		spin_lock_init(&adev->gfx.kiq[xcc_id].ring_lock);
  1333	
  1334		ring = &adev->gfx.kiq[xcc_id].ring;
  1335	
  1336		ring->me = 3;
  1337		ring->pipe = 1;
  1338		ring->queue = 0;
  1339		ring->xcc_id = xcc_id;
  1340		ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
  1341	
  1342		ring->adev = NULL;
  1343		ring->ring_obj = NULL;
  1344		ring->use_doorbell = true;
  1345		ring->eop_gpu_addr = adev->mes.eop_gpu_addr[inst];
  1346		ring->no_scheduler = true;
  1347		ring->doorbell_index =
  1348			(adev->doorbell_index.mes_ring1 +
  1349			 xcc_id * adev->doorbell_index.xcc_doorbell_range)
  1350			<< 1;
  1351	
> 1352		snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
  1353			 (unsigned char)xcc_id, (unsigned char)ring->me,
  1354			 (unsigned char)ring->pipe, (unsigned char)ring->queue);
  1355	
  1356		return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
  1357					AMDGPU_RING_PRIO_DEFAULT, NULL);
  1358	}
  1359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
