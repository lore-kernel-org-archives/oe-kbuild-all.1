Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9661A724C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765415845; cv=none; b=FQrFK+/4A0NHyqbVnm8Gq+wHfdO4NbH6odWp1eB3fNdGjovfNmiFtnYpZeYcnP7OLXYoSMWv41s3DTVCe9WIgizFa7uUii5qivAvIQdRlzw55AuaJWFtC6m0qipoX79JCQlH5p2Tjg5NBeGpqSOCeFmVul1hf+ne41DQiqb+uFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765415845; c=relaxed/simple;
	bh=wc6aIxVCdmEarDNtBfAmlKYX2lJjs8Jiy1iFHeW0+gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cY4oK7gVN+YNVwtNeloOdEhrS/WwBDryebMUmWD2bQJGnIAUnZ01mcMA4xBmOfOgezQfYc0AHLBkcDA9Fd+p2S6sJ3hgtqRMa6G6kdptTMxtZLCY6t8Uql3L5BC5wQ30Tg+pScgLWd3yZ6taQr7XyRAwmUmMaVYQIeVmnmkYA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLNZWYqr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLNZWYqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765415844; x=1796951844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wc6aIxVCdmEarDNtBfAmlKYX2lJjs8Jiy1iFHeW0+gM=;
  b=WLNZWYqrX15TZMXda4x1OyW8/ZTbdvcHEAOVioHaDyluqIS/KBswd/3i
   S2abFSjs9pmQSCked+oDFdGEI++0d/uI5YD982+fI3Vsqj0TEaO3CoEmt
   ERtwfi9LZiLg41C9P+xbvbpLKiGpGJ5u9oq7Jp9Dgujwp0wcJzHZf4pdL
   4A9fma3G0ijBfnwPS8PkmvURI22Nny6J4fV5b2BAmxzfaDM5sddvrT5ci
   HqU2wslO3vf7n1v4XE0w+hg6KXlF2H10uXBVghMgYuK+HjPp9iaJCmCfh
   TLtKhRDnVs8uMuwcXsrPTE3Nnxe2+7rspZ2mDe7crGxctKTBR73TRSI0v
   g==;
X-CSE-ConnectionGUID: ajSJovUWR6u0Wn0uGGlyEw==
X-CSE-MsgGUID: nmWLtmnlTYGhkYJlZw/s0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71242227"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71242227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 17:17:23 -0800
X-CSE-ConnectionGUID: 4NYYmMTWQiaOWnGsYJaPVw==
X-CSE-MsgGUID: YVssa/cWS9m0RQqP55jcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201141670"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2025 17:17:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTVJ1-000000003x7-3SWp;
	Thu, 11 Dec 2025 01:17:19 +0000
Date: Thu, 11 Dec 2025 09:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>
Subject: [agd5f:drm-next 104/264]
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:71: warning: 'snprintf' output
 may be truncated before the last format character
Message-ID: <202512110915.RYZNrIFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   f24e96d69f5b9eb0f3b9c49e53c385c50729edfd
commit: e220edf2d6fd6dbf08fa93790809500a80217948 [104/264] drm/amdgpu/mes_v12_1: initial support for mes_v12_1
config: alpha-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110915.RYZNrIFY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110915.RYZNrIFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110915.RYZNrIFY-lkp@intel.com/

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
