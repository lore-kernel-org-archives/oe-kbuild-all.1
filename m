Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081C21CC51
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983557; cv=none; b=UYh2uTetgBnvhQYgXUcHTlyHmI/pfYAPb9i2NDkXYCFc0OUZQPJsPMovpk+/9EZZ67tXesItJ7XsoDzLjL9Gpsb3wZdikE/bCDzJdxrw42ZM3iXHC+hpw8w8UASEVrwyDOTlSIHduuzYq7wVTqwB8gTR8tmkJz5G60l50RdNhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983557; c=relaxed/simple;
	bh=XRqTw8WEXEyyZqpAz95rpKXSMjdkW/CLUS0QVNEvCis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K1JJBuMgY5qord8QGZon5+862M1n7U3MW6RFnpfcS212aiCdFSlUpNRayT7XLGBRKnEgq0qZGn4cObkZbIVH5J6vGDyOwu/iHjbA8vUoH9dzayXtIx3LGKh5rMZTrOvWb3MEhoMdKnmD6hM3gQnG00MugcJBgN+Pq3mHAiZphnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4o7UKOO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4o7UKOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764983553; x=1796519553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRqTw8WEXEyyZqpAz95rpKXSMjdkW/CLUS0QVNEvCis=;
  b=e4o7UKOO3wF16bOPRgkjqPcs1Pzw3QMcab2GUmc5uOdtVOdOZOEY+Xvn
   2LUunqgGad/xWfJjyT+MBgYCKNO7A2kkLAXpzD9Re0CDVW0zj68IQXf9Z
   dfqLZv5Yqjrgl01guZ9r3YF2xQdSxCFxBKOnk7R8c0bpNQ50bj9UDJzJK
   1xbOtHYKll+BDNR8vSg0EFQliF9nPokG83JEsRjvi3F9j8lT16fJeEVpA
   41/ZWWfPr4ztH0qmys85IjQ1FBX5k0Ic1HYWexFWaQyEJdrDpMZ3i76Oe
   bW8wJJz42L8LyfVGl/OcJUT7/SQiaCPZ7ZRCqPYljLh3+hayXsW3cKJpt
   Q==;
X-CSE-ConnectionGUID: dwNBj11CQei6axTrmkMvZg==
X-CSE-MsgGUID: R/51YUwEQoONS8Vx4mDYNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67182128"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="67182128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 17:12:33 -0800
X-CSE-ConnectionGUID: 0g7qwiGVTxaJye81A7SP4g==
X-CSE-MsgGUID: SbcbseDKRPKIrw0EQA+92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195247159"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2025 17:12:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRgqa-00000000Fhh-0toe;
	Sat, 06 Dec 2025 01:12:28 +0000
Date: Sat, 6 Dec 2025 09:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 2443/2507]
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:74: warning: '%hhu' directive
 output may be truncated writing 1 byte into a region of size between 0 and 2
Message-ID: <202512060922.DDiANbBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   074d1b1468931eefcb1fa54f4509fffe3161a42e
commit: 63c4c0252f93ccad8f91d08be0383d9160508e4c [2443/2507] drm/amdgpu/mes_v12_1: initial support for mes_v12_1
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20251206/202512060922.DDiANbBP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060922.DDiANbBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060922.DDiANbBP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c: In function 'mes_v12_1_sw_init':
>> drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:74: warning: '%hhu' directive output may be truncated writing 1 byte into a region of size between 0 and 2 [-Wformat-truncation=]
    1352 |         snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
         |                                                                          ^~~~
   In function 'mes_v12_1_kiq_ring_init',
       inlined from 'mes_v12_1_sw_init' at drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1425:9:
   drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:9: note: 'snprintf' output between 16 and 18 bytes into a destination of size 16
    1352 |         snprintf(ring->name, sizeof(ring->name), "mes_kiq_%hhu.%hhu.%hhu.%hhu",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1353 |                  (unsigned char)xcc_id, (unsigned char)ring->me,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1354 |                  (unsigned char)ring->pipe, (unsigned char)ring->queue);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
