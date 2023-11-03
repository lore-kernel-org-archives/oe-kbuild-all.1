Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB531FCE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 06:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ni4h89iU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698991711; x=1730527711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4Op5h4Fbp0ittQ+aRCZwpQfxVwaQ7Tj8ItqypTKyuY=;
  b=Ni4h89iUVgKqq1e96cn9GxjApE4Bimf38S9766l4sdU27bOVc7nYixJk
   fHhj9ecp2LBzbBtxMGU8+8w15V0F4BT0EIVHVydROQSw7rFmdp96XxbhB
   /AOK/h334OBt16WIjnmInvg0RHdTZEZXXvhQ1i1A9fa9OtxuUcgav/u1C
   qz4E1kde/iit8N3NKcM0h/pdurC1HHfoI+Pzjweg3IH1j9fyE92FOTUAc
   frhyy56wWGY/W+dzlPCKXKCFY2eqBIcrMS3C1lVBKAVEPlDbGX2vdzFYA
   fRY09ivCissEKpBObfSHSYRhw+I1l9vh8TVKrOXDmf57BoITLJdzOFCr9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="7524077"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="7524077"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 23:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="790661990"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="790661990"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Nov 2023 23:08:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qynLt-0002Hw-2c;
	Fri, 03 Nov 2023 06:08:17 +0000
Date: Fri, 3 Nov 2023 14:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 18194/19511]
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:758: warning: Excess function
 parameter 'pcie_index' description in 'amdgpu_device_indirect_wreg'
Message-ID: <202311031338.E4UUc2m9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   c9e649645161e37c36af70f533ff243e5d13414b
commit: 6c75299532e38fc3cea4e7c1046cbb36cba0fcaf [18194/19511] UPSTREAM: drm/amdgpu: Move to common indirect reg access helper
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311031338.E4UUc2m9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031338.E4UUc2m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031338.E4UUc2m9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:758: warning: Excess function parameter 'pcie_index' description in 'amdgpu_device_indirect_wreg'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:758: warning: Excess function parameter 'pcie_data' description in 'amdgpu_device_indirect_wreg'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:789: warning: Excess function parameter 'pcie_index' description in 'amdgpu_device_indirect_wreg64'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:789: warning: Excess function parameter 'pcie_data' description in 'amdgpu_device_indirect_wreg64'
   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5224: warning: Function parameter or member 'reset_context' not described in 'amdgpu_device_gpu_recover'


vim +758 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

1bba36834c3bc3 Hawking Zhang 2020-09-17  745  
1bba36834c3bc3 Hawking Zhang 2020-09-17  746  /**
1bba36834c3bc3 Hawking Zhang 2020-09-17  747   * amdgpu_device_indirect_wreg - write an indirect register address
1bba36834c3bc3 Hawking Zhang 2020-09-17  748   *
1bba36834c3bc3 Hawking Zhang 2020-09-17  749   * @adev: amdgpu_device pointer
1bba36834c3bc3 Hawking Zhang 2020-09-17  750   * @pcie_index: mmio register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  751   * @pcie_data: mmio register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  752   * @reg_addr: indirect register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  753   * @reg_data: indirect register data
1bba36834c3bc3 Hawking Zhang 2020-09-17  754   *
1bba36834c3bc3 Hawking Zhang 2020-09-17  755   */
1bba36834c3bc3 Hawking Zhang 2020-09-17  756  void amdgpu_device_indirect_wreg(struct amdgpu_device *adev,
1bba36834c3bc3 Hawking Zhang 2020-09-17  757  				 u32 reg_addr, u32 reg_data)
1bba36834c3bc3 Hawking Zhang 2020-09-17 @758  {
6c75299532e38f Hawking Zhang 2023-03-06  759  	unsigned long flags, pcie_index, pcie_data;
1bba36834c3bc3 Hawking Zhang 2020-09-17  760  	void __iomem *pcie_index_offset;
1bba36834c3bc3 Hawking Zhang 2020-09-17  761  	void __iomem *pcie_data_offset;
1bba36834c3bc3 Hawking Zhang 2020-09-17  762  
6c75299532e38f Hawking Zhang 2023-03-06  763  	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
6c75299532e38f Hawking Zhang 2023-03-06  764  	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
6c75299532e38f Hawking Zhang 2023-03-06  765  
1bba36834c3bc3 Hawking Zhang 2020-09-17  766  	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
1bba36834c3bc3 Hawking Zhang 2020-09-17  767  	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
1bba36834c3bc3 Hawking Zhang 2020-09-17  768  	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
1bba36834c3bc3 Hawking Zhang 2020-09-17  769  
1bba36834c3bc3 Hawking Zhang 2020-09-17  770  	writel(reg_addr, pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  771  	readl(pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  772  	writel(reg_data, pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  773  	readl(pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  774  	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
1bba36834c3bc3 Hawking Zhang 2020-09-17  775  }
1bba36834c3bc3 Hawking Zhang 2020-09-17  776  
1bba36834c3bc3 Hawking Zhang 2020-09-17  777  /**
1bba36834c3bc3 Hawking Zhang 2020-09-17  778   * amdgpu_device_indirect_wreg64 - write a 64bits indirect register address
1bba36834c3bc3 Hawking Zhang 2020-09-17  779   *
1bba36834c3bc3 Hawking Zhang 2020-09-17  780   * @adev: amdgpu_device pointer
1bba36834c3bc3 Hawking Zhang 2020-09-17  781   * @pcie_index: mmio register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  782   * @pcie_data: mmio register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  783   * @reg_addr: indirect register offset
1bba36834c3bc3 Hawking Zhang 2020-09-17  784   * @reg_data: indirect register data
1bba36834c3bc3 Hawking Zhang 2020-09-17  785   *
1bba36834c3bc3 Hawking Zhang 2020-09-17  786   */
1bba36834c3bc3 Hawking Zhang 2020-09-17  787  void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev,
1bba36834c3bc3 Hawking Zhang 2020-09-17  788  				   u32 reg_addr, u64 reg_data)
1bba36834c3bc3 Hawking Zhang 2020-09-17 @789  {
6c75299532e38f Hawking Zhang 2023-03-06  790  	unsigned long flags, pcie_index, pcie_data;
1bba36834c3bc3 Hawking Zhang 2020-09-17  791  	void __iomem *pcie_index_offset;
1bba36834c3bc3 Hawking Zhang 2020-09-17  792  	void __iomem *pcie_data_offset;
1bba36834c3bc3 Hawking Zhang 2020-09-17  793  
6c75299532e38f Hawking Zhang 2023-03-06  794  	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
6c75299532e38f Hawking Zhang 2023-03-06  795  	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
6c75299532e38f Hawking Zhang 2023-03-06  796  
1bba36834c3bc3 Hawking Zhang 2020-09-17  797  	spin_lock_irqsave(&adev->pcie_idx_lock, flags);
1bba36834c3bc3 Hawking Zhang 2020-09-17  798  	pcie_index_offset = (void __iomem *)adev->rmmio + pcie_index * 4;
1bba36834c3bc3 Hawking Zhang 2020-09-17  799  	pcie_data_offset = (void __iomem *)adev->rmmio + pcie_data * 4;
1bba36834c3bc3 Hawking Zhang 2020-09-17  800  
1bba36834c3bc3 Hawking Zhang 2020-09-17  801  	/* write low 32 bits */
1bba36834c3bc3 Hawking Zhang 2020-09-17  802  	writel(reg_addr, pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  803  	readl(pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  804  	writel((u32)(reg_data & 0xffffffffULL), pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  805  	readl(pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  806  	/* write high 32 bits */
1bba36834c3bc3 Hawking Zhang 2020-09-17  807  	writel(reg_addr + 4, pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  808  	readl(pcie_index_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  809  	writel((u32)(reg_data >> 32), pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  810  	readl(pcie_data_offset);
1bba36834c3bc3 Hawking Zhang 2020-09-17  811  	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
1bba36834c3bc3 Hawking Zhang 2020-09-17  812  }
1bba36834c3bc3 Hawking Zhang 2020-09-17  813  

:::::: The code at line 758 was first introduced by commit
:::::: 1bba36834c3bc317d8a30dd5d0cc3e59d64dbfb3 drm/amdgpu: add helper function for indirect reg access (v3)

:::::: TO: Hawking Zhang <Hawking.Zhang@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
