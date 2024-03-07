Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1924C6C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709775164; cv=none; b=ceaaj+Pg/EseyQoh3szf2VbudmGtJrcb9S/Uqe15FxOoOM9AWckiXxjHZeoPmwbsWMQ0iS44wXHqXcRrVsnkhFHRRNwT95jl9RV74gAu0LrmxHnTM3qtgH+vufdQiCOaXqK2c2J+cJOi52YRwEXrgoPRE69gF3kB/Pnj90WoSOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709775164; c=relaxed/simple;
	bh=E1EcUm9ag3k7MnElSSosUyv5GKo8/FtpJAk1gITdK/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHEtaH4lbeYqebgENEsvb7kJQAfcc5PgcApjACXzSItk/kZKZnLQWOlB+IlDk7P+5O2ST5rCnVmacjkTFfKy0gDvGiAmaXKuhszLwkdRaxnY+Uc6Ay2R/bOpUOt6FoCMzZ/PWmuXsQ5WQx2e9G5ecRhzJ63o21szYx6tvJlh1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXe9YVJT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXe9YVJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709775163; x=1741311163;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E1EcUm9ag3k7MnElSSosUyv5GKo8/FtpJAk1gITdK/U=;
  b=XXe9YVJTW9gXZjS3J0sPXtzZNyhW3eCJkNOAuSG17i4DrgcSs8eM5Jxn
   qpf945whEZ/rWuGZGOP480ukpQcCqzbQcrzR5vRGiTJ96UH/hfuvY4rCc
   K74oENA4KUTgfyziXh815D31v3IKjkD5XAMIzL6bhufpDug+hQX0sv7Yl
   cp5PX+BuEFUFlyigMujn5YEzaqdQdwZuCUjrlHkWdU2VEab00nWFeSC9w
   LJTTMD4hqrggimoBq0ltnyGddx/5gU4/FkG9KC5tZP7+ZoFnBQs6t9djp
   SC5R1HrWPZQf6mpdxvs/UWIIOiDeBAVjqrym0d2PNr6utDmSlT3vbA6gj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="26897627"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="26897627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:32:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="33099713"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2024 17:32:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri2ce-0004gJ-39;
	Thu, 07 Mar 2024 01:32:36 +0000
Date: Thu, 7 Mar 2024 09:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [drm-misc:drm-misc-next 2/2]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: '%d' directive output
 may be truncated writing between 1 and 10 bytes into a region of size
 between 0 and 8
Message-ID: <202403070922.OGdsI4vn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   f89632a9e5fa6c4787c14458cd42a9ef42025434
commit: f89632a9e5fa6c4787c14458cd42a9ef42025434 [2/2] drm: Add CONFIG_DRM_WERROR
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240307/202403070922.OGdsI4vn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403070922.OGdsI4vn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403070922.OGdsI4vn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c: In function 'amdgpu_gfx_kiq_init_ring':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:61: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 8 [-Werror=format-truncation=]
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |                                                             ^~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:50: note: directive argument in the range [0, 2147483647]
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |                                                  ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:332:9: note: 'snprintf' output between 12 and 41 bytes into a destination of size 16
     332 |         snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     333 |                  xcc_id, ring->me, ring->pipe, ring->queue);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +332 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c

71c37505e7eaa0 Alex Deucher    2017-06-07  306  
71c37505e7eaa0 Alex Deucher    2017-06-07  307  int amdgpu_gfx_kiq_init_ring(struct amdgpu_device *adev,
71c37505e7eaa0 Alex Deucher    2017-06-07  308  			     struct amdgpu_ring *ring,
def799c6596d07 Le Ma           2022-05-24  309  			     struct amdgpu_irq_src *irq, int xcc_id)
71c37505e7eaa0 Alex Deucher    2017-06-07  310  {
def799c6596d07 Le Ma           2022-05-24  311  	struct amdgpu_kiq *kiq = &adev->gfx.kiq[xcc_id];
71c37505e7eaa0 Alex Deucher    2017-06-07  312  	int r = 0;
71c37505e7eaa0 Alex Deucher    2017-06-07  313  
43ca8efa46d9b1 pding           2017-10-13  314  	spin_lock_init(&kiq->ring_lock);
71c37505e7eaa0 Alex Deucher    2017-06-07  315  
71c37505e7eaa0 Alex Deucher    2017-06-07  316  	ring->adev = NULL;
71c37505e7eaa0 Alex Deucher    2017-06-07  317  	ring->ring_obj = NULL;
71c37505e7eaa0 Alex Deucher    2017-06-07  318  	ring->use_doorbell = true;
def799c6596d07 Le Ma           2022-05-24  319  	ring->xcc_id = xcc_id;
3566938b3491bb Le Ma           2021-12-20  320  	ring->vm_hub = AMDGPU_GFXHUB(xcc_id);
233bb3733bd439 Lijo Lazar      2023-01-19  321  	ring->doorbell_index =
233bb3733bd439 Lijo Lazar      2023-01-19  322  		(adev->doorbell_index.kiq +
233bb3733bd439 Lijo Lazar      2023-01-19  323  		 xcc_id * adev->doorbell_index.xcc_doorbell_range)
233bb3733bd439 Lijo Lazar      2023-01-19  324  		<< 1;
71c37505e7eaa0 Alex Deucher    2017-06-07  325  
def799c6596d07 Le Ma           2022-05-24  326  	r = amdgpu_gfx_kiq_acquire(adev, ring, xcc_id);
71c37505e7eaa0 Alex Deucher    2017-06-07  327  	if (r)
71c37505e7eaa0 Alex Deucher    2017-06-07  328  		return r;
71c37505e7eaa0 Alex Deucher    2017-06-07  329  
71c37505e7eaa0 Alex Deucher    2017-06-07  330  	ring->eop_gpu_addr = kiq->eop_gpu_addr;
a783910d5c8b45 Alex Deucher    2020-04-09  331  	ring->no_scheduler = true;
345a36c4f1baa0 Jani Nikula     2024-01-10 @332  	snprintf(ring->name, sizeof(ring->name), "kiq_%d.%d.%d.%d",
345a36c4f1baa0 Jani Nikula     2024-01-10  333  		 xcc_id, ring->me, ring->pipe, ring->queue);
c107171b8d3241 Christian König 2021-02-02  334  	r = amdgpu_ring_init(adev, ring, 1024, irq, AMDGPU_CP_KIQ_IRQ_DRIVER0,
c107171b8d3241 Christian König 2021-02-02  335  			     AMDGPU_RING_PRIO_DEFAULT, NULL);
71c37505e7eaa0 Alex Deucher    2017-06-07  336  	if (r)
71c37505e7eaa0 Alex Deucher    2017-06-07  337  		dev_warn(adev->dev, "(%d) failed to init kiq ring\n", r);
71c37505e7eaa0 Alex Deucher    2017-06-07  338  
71c37505e7eaa0 Alex Deucher    2017-06-07  339  	return r;
71c37505e7eaa0 Alex Deucher    2017-06-07  340  }
71c37505e7eaa0 Alex Deucher    2017-06-07  341  

:::::: The code at line 332 was first introduced by commit
:::::: 345a36c4f1baa03275d88cd13747c6c1748b1fc0 drm/amdgpu: prefer snprintf over sprintf

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
