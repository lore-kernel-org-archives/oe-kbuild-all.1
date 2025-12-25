Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3787725B1FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766691286; cv=none; b=LhAlX9yu54sotrkW2rsNdT3i1DOPi3B06sDrW729e+IpH3CEOccNBiPHrpK6TuhACWrrPwkqxYhHxHt9DRniDfLL9pyivOsWi1vhb6HNGR2l8KgPp+4auEIL719Uq7kQRH9oNitC+BwQc+hTPn6ay1G8+34YJlu14zI2Xdm6tgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766691286; c=relaxed/simple;
	bh=P2jLoPwE4HdBw7J26Hq79gg7LnGjxFXqAxNJo5L/0xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VAZ1HtdMzAi8h7neIK+kvvuuzPCc5tYq170zqIrcrz0RhSFcmEuc4ToQVGAtbiUYUwzhZcub/mWjID62dQr62u18xKvqMoUcw5iovkGlQKUNQE9a9YMnoSzEhcZn7BQvzBUSkCpdH3LLQhI1+jOxU5J1IGLcgBgnz53zOf6An10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gykp0OqA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gykp0OqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766691284; x=1798227284;
  h=date:from:to:cc:subject:message-id;
  bh=P2jLoPwE4HdBw7J26Hq79gg7LnGjxFXqAxNJo5L/0xc=;
  b=gykp0OqA+Sd6RP5y0EsVc7tGIzP8/cSaqYZOjStSIgOhALgselvCFFqg
   5cqFLDgJZPuehe5i07Jl8z+HD5o8yefBGZQ4qyyx/0UZ3hMcxk2lvSK3w
   H2fUg7Lqa6Alk28LOKIUWGuw6B8dH6SquXJDXpuCOaJQ1BQfV+JBzArNA
   Q4XM+g3cCl8ctjYbsPQS3RCOedQCYCNmU84NhwQvfoiJ+M0FKjIIa9whz
   UrWkJ8IYUPwzuMKNU1N/MRx8wTc3W4vqI3fqiL/dPOR3tULDUel1pRNnQ
   8G6VBapSQ6C631uM6eLr1gKKe/xIE9KSzdc18szPN0/RCa5CmVbJ/yhSF
   g==;
X-CSE-ConnectionGUID: RGews+g0QgWOuqJfjGt64w==
X-CSE-MsgGUID: pxeMBDc9SLaPwtpnT1NNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79202587"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79202587"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 11:34:44 -0800
X-CSE-ConnectionGUID: PBi6FOb/S9aKO6VO1DMbeA==
X-CSE-MsgGUID: 2qRya6HnRZC7ZYM0AhLQVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200280869"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2025 11:34:42 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYr6X-000000004Pj-1BXU;
	Thu, 25 Dec 2025 19:34:34 +0000
Date: Fri, 26 Dec 2025 03:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Subject: [linux-next:master 751/2671]
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:67: warning: '%hhu' directive
 output may be truncated writing between 1 and 3 bytes into a region of size
 between 0 and 2
Message-ID: <202512260319.Gs0JObld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: e220edf2d6fd6dbf08fa93790809500a80217948 [751/2671] drm/amdgpu/mes_v12_1: initial support for mes_v12_1
config: s390-randconfig-002-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260319.Gs0JObld-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260319.Gs0JObld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260319.Gs0JObld-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c: In function 'mes_v12_1_sw_init':
>> drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:67: warning: '%hhu' directive output may be truncated writing between 1 and 3 bytes into a region of size between 0 and 2 [-Wformat-truncation=]
     snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
                                                                      ^~~~
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:43: note: using the range [0, 255] for directive argument
     snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:2: note: 'snprintf' output between 16 and 24 bytes into a destination of size 16
     snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       (unsigned char)xcc_id, (unsigned char)ring->me,
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       (unsigned char)ring->pipe, (unsigned char)ring->queue);
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1352 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c

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
