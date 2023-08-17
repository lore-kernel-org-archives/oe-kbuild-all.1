Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F6137D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692256391; x=1723792391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFN0V+v1YEUyiRmmfAbVFiFoknmBjdB9eVsIuWE1uzY=;
  b=hTl1z7YdJRngQ1iChfyEVF5Bbb66oLhC64oA3d9VT42xMH96pNQrz8lh
   kZVKkiLFJXApex7m+tVdSxNMy4p6XHlneJrnhfFAgzkFtJSJ+ZzBbibFZ
   crF624HxBgEOPute9DXssJ9zc+Raz1C6pJRXtIA7BKPiuKddKCTGA8Zmj
   O66WstpecsO7uv0f84uz/X3SSB5WMw52nOWzEVdL9vqhjM4RY9uyozwlG
   7JlJAv+liVg4vTqJm2AiUsohQgruhlbTnUi8pIH3TAi3AAt+oRKTOBj7u
   1O7yOhJoPw8F6wWOQ7KXAzm28oC+ahg9Ir84IioWEWFU3clnI/bva3nY7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403714252"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403714252"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711423349"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="711423349"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 00:13:07 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXBi-0000sp-1T;
	Thu, 17 Aug 2023 07:13:02 +0000
Date: Thu, 17 Aug 2023 15:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Lu <victorchengchi.lu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Zhigang Luo <zhigang.luo@amd.com>
Subject: [linux-next:master 2339/10848]
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:576: warning: Function parameter
 or member 'xcc_id' not described in 'amdgpu_mm_wreg_mmio_rlc'
Message-ID: <202308171555.5mSXBst8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: 8ed49dd1d3a7448744d57e1da2062b074cba2e49 [2339/10848] drm/amdgpu: Add RLCG interface driver implementation for gfx v9.4.3 (v3)
config: arc-randconfig-r013-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171555.5mSXBst8-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171555.5mSXBst8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171555.5mSXBst8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:576: warning: Function parameter or member 'xcc_id' not described in 'amdgpu_mm_wreg_mmio_rlc'


vim +576 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

47ed4e1c93a6c7 Ken Wang          2017-07-04  563  
03f2abb07e54b3 Yann Dirson       2021-12-14  564  /**
4cc9f86f851847 Tom St Denis      2022-01-07  565   * amdgpu_mm_wreg_mmio_rlc -  write register either with direct/indirect mmio or with RLC path if in range
2e0cc4d48b91a8 Monk Liu          2020-03-10  566   *
71579346991927 Rajneesh Bhardwaj 2022-02-10  567   * @adev: amdgpu_device pointer
71579346991927 Rajneesh Bhardwaj 2022-02-10  568   * @reg: mmio/rlc register
71579346991927 Rajneesh Bhardwaj 2022-02-10  569   * @v: value to write
71579346991927 Rajneesh Bhardwaj 2022-02-10  570   *
71579346991927 Rajneesh Bhardwaj 2022-02-10  571   * this function is invoked only for the debugfs register access
03f2abb07e54b3 Yann Dirson       2021-12-14  572   */
f7ee1874b06cfd Hawking Zhang     2020-09-18  573  void amdgpu_mm_wreg_mmio_rlc(struct amdgpu_device *adev,
8ed49dd1d3a744 Victor Lu         2023-06-16  574  			     uint32_t reg, uint32_t v,
8ed49dd1d3a744 Victor Lu         2023-06-16  575  			     uint32_t xcc_id)
2e0cc4d48b91a8 Monk Liu          2020-03-10 @576  {
56b53c0b5aa5de Dennis Li         2021-03-10  577  	if (amdgpu_device_skip_hw_access(adev))
bf36b52e781d74 Andrey Grodzovsky 2020-07-29  578  		return;
bf36b52e781d74 Andrey Grodzovsky 2020-07-29  579  
2e0cc4d48b91a8 Monk Liu          2020-03-10  580  	if (amdgpu_sriov_fullaccess(adev) &&
2e0cc4d48b91a8 Monk Liu          2020-03-10  581  	    adev->gfx.rlc.funcs &&
2e0cc4d48b91a8 Monk Liu          2020-03-10  582  	    adev->gfx.rlc.funcs->is_rlcg_access_range) {
2e0cc4d48b91a8 Monk Liu          2020-03-10  583  		if (adev->gfx.rlc.funcs->is_rlcg_access_range(adev, reg))
8ed49dd1d3a744 Victor Lu         2023-06-16  584  			return amdgpu_sriov_wreg(adev, reg, v, 0, 0, xcc_id);
4cc9f86f851847 Tom St Denis      2022-01-07  585  	} else if ((reg * 4) >= adev->rmmio_size) {
4cc9f86f851847 Tom St Denis      2022-01-07  586  		adev->pcie_wreg(adev, reg * 4, v);
f7ee1874b06cfd Hawking Zhang     2020-09-18  587  	} else {
f7ee1874b06cfd Hawking Zhang     2020-09-18  588  		writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
47ed4e1c93a6c7 Ken Wang          2017-07-04  589  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  590  }
d38ceaf99ed015 Alex Deucher      2015-04-20  591  

:::::: The code at line 576 was first introduced by commit
:::::: 2e0cc4d48b91a856a34027b093306c01c45d3a38 drm/amdgpu: revise RLCG access path

:::::: TO: Monk Liu <Monk.Liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
