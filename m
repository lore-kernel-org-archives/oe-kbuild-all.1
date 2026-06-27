Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58F8834
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jun 2026 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579006; cv=none; b=C/ZRUdV8W7AoMI+JDE/aSAdljRQzBAkThG3svTwTFi5+5xnYpRp1nGhGlLStg8+2mJlvKX61MmvdbPsLjUo4+tUwJ38FQunBsyM29WmvsaTBQtP1lLYulG2vK0D/CXfhnMKoFBogZ5w5Sb40QQJ2uZoXMgvj00440t3W0sA1I9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579006; c=relaxed/simple;
	bh=cqYcKlWfDccdY+MU0AYJgWmdVZSbSnZ15KWe0opoqZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2MEBba65ajFBPdg5LZ0rNRL0jbJk+v5C0Iu4hiFsGw9x8rcAOzrE93803h9HXoW4mZ5TU0ereqn9ZqHpPyOeZ+ZinsIdcdJsUyKldZbK8jeMz0I92tkKztuXomf9mslnjdxBIwQohUN4rzf8S9/e7O0fzSTo8HfuUAqC2R+xdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA47uj0U; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA47uj0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782579004; x=1814115004;
  h=date:from:to:cc:subject:message-id;
  bh=cqYcKlWfDccdY+MU0AYJgWmdVZSbSnZ15KWe0opoqZw=;
  b=LA47uj0U3kgSTzAGo7fCqKE2+HCJ2JJokPT8RiSfdOxqPT9nV774nJN1
   BoOhfDsNj1zvrv5sojLCJcJ8ECaFRJ8gVoATBGHLz7VzHN1XQYcEDwxuN
   ykSVRT8kWr/fcaLKL9oMdCIIAEDck+S0bgyUQBeT9Amd6NuBtfqDfkahe
   mtHsWQJNPIJjK4nUTapwXfw97q3XH3gEdzmpOv9biwIiyPyL51zdofDdL
   GUZlyouN//raj5S6+tjnr1Yo8KO/bExVEHzqjOOxsO/rAC8e5qEyDx/9F
   Vl2O1kdCvACNAdom3d0xjh5Aakwz+5Nt9RwCDNU5KUbvqL+gqAoFwgIPz
   g==;
X-CSE-ConnectionGUID: BdFui6HbQSSOnXljm6Q+uA==
X-CSE-MsgGUID: 30X44xRCSeGjQHG5C++XRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="70853895"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="70853895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 09:50:03 -0700
X-CSE-ConnectionGUID: DQ+Xm8MUSzmO4Z9Uw+nscw==
X-CSE-MsgGUID: +W+o4eGTSu6Bf9tAaIsGNA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jun 2026 09:50:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdWE9-000000005z5-33XF;
	Sat, 27 Jun 2026 16:49:57 +0000
Date: Sun, 28 Jun 2026 00:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/mes_v12_1.c:1352:67: warning:
 '%hhu' directive output may be truncated writing between 1 and 3 bytes into a
 region of size between 0 and 2
Message-ID: <202606280057.fyVNB4Oh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jack,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a66900afbd6b2a063eebad35294038a654de2b0
commit: e220edf2d6fd6dbf08fa93790809500a80217948 drm/amdgpu/mes_v12_1: initial support for mes_v12_1
date:   7 months ago
config: s390-randconfig-r131-20260627 (https://download.01.org/0day-ci/archive/20260628/202606280057.fyVNB4Oh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606280057.fyVNB4Oh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e220edf2d6fd ("drm/amdgpu/mes_v12_1: initial support for mes_v12_1")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606280057.fyVNB4Oh-lkp@intel.com/

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
