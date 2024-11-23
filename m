Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C7257D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732352612; cv=none; b=jZ/lj9zM4JCqH4/ak7OQY0iiYMo50q/jNnV7zygyvLUnxllpzsEAUD0DEconI37vt4eLi3Y9k+m0OTYIM9W9yvPYvaf/nrwZk9wDsHM+NMUZtEOOdpzJZGj+ge8Nazr3yQuk7SHzmj41Znrmytw42qGWHNvIR2TIMpY9rkcAmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732352612; c=relaxed/simple;
	bh=skvqc1nH5LbxJ2DSolu0WEhm9EcCPrRvhgSdh5N2Dg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B05WLReRo2P5DY+v3n5+n9shy3vO0H8GIT6gn+KFC8SqFMFqV1uy0JiqbbLGoftF1dUgIvBEZOmnC5BGw8KLbQxhLslLDQN6P2kbHKT68YPKav2eZM6dYWE9ZX4CPwrbWwRUJ2cQW9Gm2FZ2Kk2llAdLSOkvqXl0uYjHH6Un8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf96gE0s; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf96gE0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732352609; x=1763888609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skvqc1nH5LbxJ2DSolu0WEhm9EcCPrRvhgSdh5N2Dg4=;
  b=Cf96gE0s2RnIBrGFzG6mLGC/XsmcZCZ8Bx9NOW5cpwAtbbyGIIbg2A9e
   iNY+CAk9iaoPt1y1lRrYqa3RCNUPOohuTdeodi0QJlMprS6R4VlaJqB8R
   9L4BD75Dv4CNOF8me5K4nF0/oAnOUHTmOmPc+VScgkOOAHM/mfNhyWOT7
   6LDYqA9j9sCrQhkesvp0JfXhIDqsGIc/JbK1yGjI0vU1cQ+zTCKBLMgEI
   SqXEV8sfuTI4iDt/CRombgoX+EvMnljqxgtSlnzuJ3HBqVD1u5OVnTIjT
   n+MA1qHK2vd1jzBC/KgVXNT979DeYfzK44McvoCoaJ0QfivhfXsgJBKtx
   g==;
X-CSE-ConnectionGUID: U6Bxj1lVTtWC3UFc64zKpQ==
X-CSE-MsgGUID: Vqk4dOjbS3WZEqEEPpY57A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50025108"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="50025108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 01:03:28 -0800
X-CSE-ConnectionGUID: IB3bKSotTRGsuvR65AA8oQ==
X-CSE-MsgGUID: lodfavZVRXiTir83TQYyVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90598693"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Nov 2024 01:03:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEm32-0004XT-1k;
	Sat, 23 Nov 2024 09:03:24 +0000
Date: Sat, 23 Nov 2024 17:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiadong Zhu <Jiadong.Zhu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 1363/1393]
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:772: warning: Function parameter or
 struct member 'restore' not described in 'sdma_v4_4_2_page_resume'
Message-ID: <202411231633.nx0WafSk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   52a0eae4140af43141a217398938aaa26241fa39
commit: 161e967f7faa2cfe0ceb84b13f7d5508719c4f5e [1363/1393] drm/amdgpu/sdma4.4.2: implement ring reset callback for sdma4.4.2
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411231633.nx0WafSk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231633.nx0WafSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231633.nx0WafSk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:772: warning: Function parameter or struct member 'restore' not described in 'sdma_v4_4_2_page_resume'
>> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:937: warning: Function parameter or struct member 'restore' not described in 'sdma_v4_4_2_inst_start'


vim +772 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c

7138fc88fdc1f9 Le Ma                2022-05-18   761  
7138fc88fdc1f9 Le Ma                2022-05-18   762  /**
7138fc88fdc1f9 Le Ma                2022-05-18   763   * sdma_v4_4_2_page_resume - setup and start the async dma engines
7138fc88fdc1f9 Le Ma                2022-05-18   764   *
7138fc88fdc1f9 Le Ma                2022-05-18   765   * @adev: amdgpu_device pointer
7138fc88fdc1f9 Le Ma                2022-05-18   766   * @i: instance to resume
7138fc88fdc1f9 Le Ma                2022-05-18   767   *
7138fc88fdc1f9 Le Ma                2022-05-18   768   * Set up the page DMA ring buffers and enable them.
7138fc88fdc1f9 Le Ma                2022-05-18   769   * Returns 0 for success, error for failure.
7138fc88fdc1f9 Le Ma                2022-05-18   770   */
161e967f7faa2c Jiadong Zhu          2024-09-29   771  static void sdma_v4_4_2_page_resume(struct amdgpu_device *adev, unsigned int i, bool restore)
7138fc88fdc1f9 Le Ma                2022-05-18  @772  {
7138fc88fdc1f9 Le Ma                2022-05-18   773  	struct amdgpu_ring *ring = &adev->sdma.instance[i].page;
7138fc88fdc1f9 Le Ma                2022-05-18   774  	u32 rb_cntl, ib_cntl, wptr_poll_cntl;
7138fc88fdc1f9 Le Ma                2022-05-18   775  	u32 wb_offset;
7138fc88fdc1f9 Le Ma                2022-05-18   776  	u32 doorbell;
7138fc88fdc1f9 Le Ma                2022-05-18   777  	u32 doorbell_offset;
7138fc88fdc1f9 Le Ma                2022-05-18   778  	u64 wptr_gpu_addr;
7138fc88fdc1f9 Le Ma                2022-05-18   779  
7138fc88fdc1f9 Le Ma                2022-05-18   780  	wb_offset = (ring->rptr_offs * 4);
7138fc88fdc1f9 Le Ma                2022-05-18   781  
7138fc88fdc1f9 Le Ma                2022-05-18   782  	rb_cntl = RREG32_SDMA(i, regSDMA_PAGE_RB_CNTL);
7138fc88fdc1f9 Le Ma                2022-05-18   783  	rb_cntl = sdma_v4_4_2_rb_cntl(ring, rb_cntl);
7138fc88fdc1f9 Le Ma                2022-05-18   784  	WREG32_SDMA(i, regSDMA_PAGE_RB_CNTL, rb_cntl);
7138fc88fdc1f9 Le Ma                2022-05-18   785  
7138fc88fdc1f9 Le Ma                2022-05-18   786  	/* Initialize the ring buffer's read and write pointers */
161e967f7faa2c Jiadong Zhu          2024-09-29   787  	if (restore) {
161e967f7faa2c Jiadong Zhu          2024-09-29   788  		WREG32_SDMA(i, regSDMA_GFX_RB_RPTR, lower_32_bits(ring->wptr << 2));
161e967f7faa2c Jiadong Zhu          2024-09-29   789  		WREG32_SDMA(i, regSDMA_GFX_RB_RPTR_HI, upper_32_bits(ring->wptr << 2));
161e967f7faa2c Jiadong Zhu          2024-09-29   790  		WREG32_SDMA(i, regSDMA_GFX_RB_WPTR, lower_32_bits(ring->wptr << 2));
161e967f7faa2c Jiadong Zhu          2024-09-29   791  		WREG32_SDMA(i, regSDMA_GFX_RB_WPTR_HI, upper_32_bits(ring->wptr << 2));
161e967f7faa2c Jiadong Zhu          2024-09-29   792  	} else {
7138fc88fdc1f9 Le Ma                2022-05-18   793  		WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   794  		WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_HI, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   795  		WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   796  		WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_HI, 0);
161e967f7faa2c Jiadong Zhu          2024-09-29   797  	}
7138fc88fdc1f9 Le Ma                2022-05-18   798  
7138fc88fdc1f9 Le Ma                2022-05-18   799  	/* set the wb address whether it's enabled or not */
7138fc88fdc1f9 Le Ma                2022-05-18   800  	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_ADDR_HI,
7138fc88fdc1f9 Le Ma                2022-05-18   801  	       upper_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFF);
7138fc88fdc1f9 Le Ma                2022-05-18   802  	WREG32_SDMA(i, regSDMA_PAGE_RB_RPTR_ADDR_LO,
7138fc88fdc1f9 Le Ma                2022-05-18   803  	       lower_32_bits(adev->wb.gpu_addr + wb_offset) & 0xFFFFFFFC);
7138fc88fdc1f9 Le Ma                2022-05-18   804  
7138fc88fdc1f9 Le Ma                2022-05-18   805  	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_PAGE_RB_CNTL,
7138fc88fdc1f9 Le Ma                2022-05-18   806  				RPTR_WRITEBACK_ENABLE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   807  
7138fc88fdc1f9 Le Ma                2022-05-18   808  	WREG32_SDMA(i, regSDMA_PAGE_RB_BASE, ring->gpu_addr >> 8);
7138fc88fdc1f9 Le Ma                2022-05-18   809  	WREG32_SDMA(i, regSDMA_PAGE_RB_BASE_HI, ring->gpu_addr >> 40);
7138fc88fdc1f9 Le Ma                2022-05-18   810  
161e967f7faa2c Jiadong Zhu          2024-09-29   811  	if (!restore)
7138fc88fdc1f9 Le Ma                2022-05-18   812  		ring->wptr = 0;
7138fc88fdc1f9 Le Ma                2022-05-18   813  
7138fc88fdc1f9 Le Ma                2022-05-18   814  	/* before programing wptr to a less value, need set minor_ptr_update first */
7138fc88fdc1f9 Le Ma                2022-05-18   815  	WREG32_SDMA(i, regSDMA_PAGE_MINOR_PTR_UPDATE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   816  
7138fc88fdc1f9 Le Ma                2022-05-18   817  	doorbell = RREG32_SDMA(i, regSDMA_PAGE_DOORBELL);
7138fc88fdc1f9 Le Ma                2022-05-18   818  	doorbell_offset = RREG32_SDMA(i, regSDMA_PAGE_DOORBELL_OFFSET);
7138fc88fdc1f9 Le Ma                2022-05-18   819  
7138fc88fdc1f9 Le Ma                2022-05-18   820  	doorbell = REG_SET_FIELD(doorbell, SDMA_PAGE_DOORBELL, ENABLE,
7138fc88fdc1f9 Le Ma                2022-05-18   821  				 ring->use_doorbell);
7138fc88fdc1f9 Le Ma                2022-05-18   822  	doorbell_offset = REG_SET_FIELD(doorbell_offset,
7138fc88fdc1f9 Le Ma                2022-05-18   823  					SDMA_PAGE_DOORBELL_OFFSET,
7138fc88fdc1f9 Le Ma                2022-05-18   824  					OFFSET, ring->doorbell_index);
7138fc88fdc1f9 Le Ma                2022-05-18   825  	WREG32_SDMA(i, regSDMA_PAGE_DOORBELL, doorbell);
7138fc88fdc1f9 Le Ma                2022-05-18   826  	WREG32_SDMA(i, regSDMA_PAGE_DOORBELL_OFFSET, doorbell_offset);
7138fc88fdc1f9 Le Ma                2022-05-18   827  
7138fc88fdc1f9 Le Ma                2022-05-18   828  	/* paging queue doorbell range is setup at sdma_v4_4_2_gfx_resume */
7138fc88fdc1f9 Le Ma                2022-05-18   829  	sdma_v4_4_2_page_ring_set_wptr(ring);
7138fc88fdc1f9 Le Ma                2022-05-18   830  
7138fc88fdc1f9 Le Ma                2022-05-18   831  	/* set minor_ptr_update to 0 after wptr programed */
7138fc88fdc1f9 Le Ma                2022-05-18   832  	WREG32_SDMA(i, regSDMA_PAGE_MINOR_PTR_UPDATE, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   833  
7138fc88fdc1f9 Le Ma                2022-05-18   834  	/* setup the wptr shadow polling */
7138fc88fdc1f9 Le Ma                2022-05-18   835  	wptr_gpu_addr = adev->wb.gpu_addr + (ring->wptr_offs * 4);
7138fc88fdc1f9 Le Ma                2022-05-18   836  	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_ADDR_LO,
7138fc88fdc1f9 Le Ma                2022-05-18   837  		    lower_32_bits(wptr_gpu_addr));
7138fc88fdc1f9 Le Ma                2022-05-18   838  	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_ADDR_HI,
7138fc88fdc1f9 Le Ma                2022-05-18   839  		    upper_32_bits(wptr_gpu_addr));
7138fc88fdc1f9 Le Ma                2022-05-18   840  	wptr_poll_cntl = RREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_CNTL);
7138fc88fdc1f9 Le Ma                2022-05-18   841  	wptr_poll_cntl = REG_SET_FIELD(wptr_poll_cntl,
7138fc88fdc1f9 Le Ma                2022-05-18   842  				       SDMA_PAGE_RB_WPTR_POLL_CNTL,
7138fc88fdc1f9 Le Ma                2022-05-18   843  				       F32_POLL_ENABLE, amdgpu_sriov_vf(adev)? 1 : 0);
7138fc88fdc1f9 Le Ma                2022-05-18   844  	WREG32_SDMA(i, regSDMA_PAGE_RB_WPTR_POLL_CNTL, wptr_poll_cntl);
7138fc88fdc1f9 Le Ma                2022-05-18   845  
7138fc88fdc1f9 Le Ma                2022-05-18   846  	/* enable DMA RB */
7138fc88fdc1f9 Le Ma                2022-05-18   847  	rb_cntl = REG_SET_FIELD(rb_cntl, SDMA_PAGE_RB_CNTL, RB_ENABLE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   848  	WREG32_SDMA(i, regSDMA_PAGE_RB_CNTL, rb_cntl);
7138fc88fdc1f9 Le Ma                2022-05-18   849  
7138fc88fdc1f9 Le Ma                2022-05-18   850  	ib_cntl = RREG32_SDMA(i, regSDMA_PAGE_IB_CNTL);
7138fc88fdc1f9 Le Ma                2022-05-18   851  	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_PAGE_IB_CNTL, IB_ENABLE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   852  #ifdef __BIG_ENDIAN
7138fc88fdc1f9 Le Ma                2022-05-18   853  	ib_cntl = REG_SET_FIELD(ib_cntl, SDMA_PAGE_IB_CNTL, IB_SWAP_ENABLE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   854  #endif
7138fc88fdc1f9 Le Ma                2022-05-18   855  	/* enable DMA IBs */
7138fc88fdc1f9 Le Ma                2022-05-18   856  	WREG32_SDMA(i, regSDMA_PAGE_IB_CNTL, ib_cntl);
7138fc88fdc1f9 Le Ma                2022-05-18   857  }
7138fc88fdc1f9 Le Ma                2022-05-18   858  
7138fc88fdc1f9 Le Ma                2022-05-18   859  static void sdma_v4_4_2_init_pg(struct amdgpu_device *adev)
7138fc88fdc1f9 Le Ma                2022-05-18   860  {
7138fc88fdc1f9 Le Ma                2022-05-18   861  
7138fc88fdc1f9 Le Ma                2022-05-18   862  }
7138fc88fdc1f9 Le Ma                2022-05-18   863  
7138fc88fdc1f9 Le Ma                2022-05-18   864  /**
aaff9c089947cd Jiapeng Chong        2023-05-23   865   * sdma_v4_4_2_inst_rlc_resume - setup and start the async dma engines
7138fc88fdc1f9 Le Ma                2022-05-18   866   *
7138fc88fdc1f9 Le Ma                2022-05-18   867   * @adev: amdgpu_device pointer
23616d1ff31d6e Srinivasan Shanmugam 2023-05-25   868   * @inst_mask: mask of dma engine instances to be enabled
7138fc88fdc1f9 Le Ma                2022-05-18   869   *
7138fc88fdc1f9 Le Ma                2022-05-18   870   * Set up the compute DMA queues and enable them.
7138fc88fdc1f9 Le Ma                2022-05-18   871   * Returns 0 for success, error for failure.
7138fc88fdc1f9 Le Ma                2022-05-18   872   */
527c670e532341 Lijo Lazar           2022-09-14   873  static int sdma_v4_4_2_inst_rlc_resume(struct amdgpu_device *adev,
527c670e532341 Lijo Lazar           2022-09-14   874  				       uint32_t inst_mask)
7138fc88fdc1f9 Le Ma                2022-05-18   875  {
7138fc88fdc1f9 Le Ma                2022-05-18   876  	sdma_v4_4_2_init_pg(adev);
7138fc88fdc1f9 Le Ma                2022-05-18   877  
7138fc88fdc1f9 Le Ma                2022-05-18   878  	return 0;
7138fc88fdc1f9 Le Ma                2022-05-18   879  }
7138fc88fdc1f9 Le Ma                2022-05-18   880  
7138fc88fdc1f9 Le Ma                2022-05-18   881  /**
aaff9c089947cd Jiapeng Chong        2023-05-23   882   * sdma_v4_4_2_inst_load_microcode - load the sDMA ME ucode
7138fc88fdc1f9 Le Ma                2022-05-18   883   *
7138fc88fdc1f9 Le Ma                2022-05-18   884   * @adev: amdgpu_device pointer
23616d1ff31d6e Srinivasan Shanmugam 2023-05-25   885   * @inst_mask: mask of dma engine instances to be enabled
7138fc88fdc1f9 Le Ma                2022-05-18   886   *
7138fc88fdc1f9 Le Ma                2022-05-18   887   * Loads the sDMA0/1 ucode.
7138fc88fdc1f9 Le Ma                2022-05-18   888   * Returns 0 for success, -EINVAL if the ucode is not available.
7138fc88fdc1f9 Le Ma                2022-05-18   889   */
527c670e532341 Lijo Lazar           2022-09-14   890  static int sdma_v4_4_2_inst_load_microcode(struct amdgpu_device *adev,
527c670e532341 Lijo Lazar           2022-09-14   891  					   uint32_t inst_mask)
7138fc88fdc1f9 Le Ma                2022-05-18   892  {
7138fc88fdc1f9 Le Ma                2022-05-18   893  	const struct sdma_firmware_header_v1_0 *hdr;
7138fc88fdc1f9 Le Ma                2022-05-18   894  	const __le32 *fw_data;
7138fc88fdc1f9 Le Ma                2022-05-18   895  	u32 fw_size;
7138fc88fdc1f9 Le Ma                2022-05-18   896  	int i, j;
7138fc88fdc1f9 Le Ma                2022-05-18   897  
7138fc88fdc1f9 Le Ma                2022-05-18   898  	/* halt the MEs */
527c670e532341 Lijo Lazar           2022-09-14   899  	sdma_v4_4_2_inst_enable(adev, false, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   900  
527c670e532341 Lijo Lazar           2022-09-14   901  	for_each_inst(i, inst_mask) {
7138fc88fdc1f9 Le Ma                2022-05-18   902  		if (!adev->sdma.instance[i].fw)
7138fc88fdc1f9 Le Ma                2022-05-18   903  			return -EINVAL;
7138fc88fdc1f9 Le Ma                2022-05-18   904  
7138fc88fdc1f9 Le Ma                2022-05-18   905  		hdr = (const struct sdma_firmware_header_v1_0 *)adev->sdma.instance[i].fw->data;
7138fc88fdc1f9 Le Ma                2022-05-18   906  		amdgpu_ucode_print_sdma_hdr(&hdr->header);
7138fc88fdc1f9 Le Ma                2022-05-18   907  		fw_size = le32_to_cpu(hdr->header.ucode_size_bytes) / 4;
7138fc88fdc1f9 Le Ma                2022-05-18   908  
7138fc88fdc1f9 Le Ma                2022-05-18   909  		fw_data = (const __le32 *)
7138fc88fdc1f9 Le Ma                2022-05-18   910  			(adev->sdma.instance[i].fw->data +
7138fc88fdc1f9 Le Ma                2022-05-18   911  				le32_to_cpu(hdr->header.ucode_array_offset_bytes));
7138fc88fdc1f9 Le Ma                2022-05-18   912  
7138fc88fdc1f9 Le Ma                2022-05-18   913  		WREG32_SDMA(i, regSDMA_UCODE_ADDR, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   914  
7138fc88fdc1f9 Le Ma                2022-05-18   915  		for (j = 0; j < fw_size; j++)
7138fc88fdc1f9 Le Ma                2022-05-18   916  			WREG32_SDMA(i, regSDMA_UCODE_DATA,
7138fc88fdc1f9 Le Ma                2022-05-18   917  				    le32_to_cpup(fw_data++));
7138fc88fdc1f9 Le Ma                2022-05-18   918  
7138fc88fdc1f9 Le Ma                2022-05-18   919  		WREG32_SDMA(i, regSDMA_UCODE_ADDR,
7138fc88fdc1f9 Le Ma                2022-05-18   920  			    adev->sdma.instance[i].fw_version);
7138fc88fdc1f9 Le Ma                2022-05-18   921  	}
7138fc88fdc1f9 Le Ma                2022-05-18   922  
7138fc88fdc1f9 Le Ma                2022-05-18   923  	return 0;
7138fc88fdc1f9 Le Ma                2022-05-18   924  }
7138fc88fdc1f9 Le Ma                2022-05-18   925  
7138fc88fdc1f9 Le Ma                2022-05-18   926  /**
527c670e532341 Lijo Lazar           2022-09-14   927   * sdma_v4_4_2_inst_start - setup and start the async dma engines
7138fc88fdc1f9 Le Ma                2022-05-18   928   *
7138fc88fdc1f9 Le Ma                2022-05-18   929   * @adev: amdgpu_device pointer
23616d1ff31d6e Srinivasan Shanmugam 2023-05-25   930   * @inst_mask: mask of dma engine instances to be enabled
7138fc88fdc1f9 Le Ma                2022-05-18   931   *
7138fc88fdc1f9 Le Ma                2022-05-18   932   * Set up the DMA engines and enable them.
7138fc88fdc1f9 Le Ma                2022-05-18   933   * Returns 0 for success, error for failure.
7138fc88fdc1f9 Le Ma                2022-05-18   934   */
527c670e532341 Lijo Lazar           2022-09-14   935  static int sdma_v4_4_2_inst_start(struct amdgpu_device *adev,
161e967f7faa2c Jiadong Zhu          2024-09-29   936  				  uint32_t inst_mask, bool restore)
7138fc88fdc1f9 Le Ma                2022-05-18  @937  {
7138fc88fdc1f9 Le Ma                2022-05-18   938  	struct amdgpu_ring *ring;
527c670e532341 Lijo Lazar           2022-09-14   939  	uint32_t tmp_mask;
7138fc88fdc1f9 Le Ma                2022-05-18   940  	int i, r = 0;
7138fc88fdc1f9 Le Ma                2022-05-18   941  
7138fc88fdc1f9 Le Ma                2022-05-18   942  	if (amdgpu_sriov_vf(adev)) {
527c670e532341 Lijo Lazar           2022-09-14   943  		sdma_v4_4_2_inst_ctx_switch_enable(adev, false, inst_mask);
527c670e532341 Lijo Lazar           2022-09-14   944  		sdma_v4_4_2_inst_enable(adev, false, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   945  	} else {
7138fc88fdc1f9 Le Ma                2022-05-18   946  		/* bypass sdma microcode loading on Gopher */
161e967f7faa2c Jiadong Zhu          2024-09-29   947  		if (!restore && adev->firmware.load_type != AMDGPU_FW_LOAD_PSP &&
527c670e532341 Lijo Lazar           2022-09-14   948  		    adev->sdma.instance[0].fw) {
527c670e532341 Lijo Lazar           2022-09-14   949  			r = sdma_v4_4_2_inst_load_microcode(adev, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   950  			if (r)
7138fc88fdc1f9 Le Ma                2022-05-18   951  				return r;
7138fc88fdc1f9 Le Ma                2022-05-18   952  		}
7138fc88fdc1f9 Le Ma                2022-05-18   953  
7138fc88fdc1f9 Le Ma                2022-05-18   954  		/* unhalt the MEs */
527c670e532341 Lijo Lazar           2022-09-14   955  		sdma_v4_4_2_inst_enable(adev, true, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   956  		/* enable sdma ring preemption */
527c670e532341 Lijo Lazar           2022-09-14   957  		sdma_v4_4_2_inst_ctx_switch_enable(adev, true, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   958  	}
7138fc88fdc1f9 Le Ma                2022-05-18   959  
7138fc88fdc1f9 Le Ma                2022-05-18   960  	/* start the gfx rings and rlc compute queues */
527c670e532341 Lijo Lazar           2022-09-14   961  	tmp_mask = inst_mask;
527c670e532341 Lijo Lazar           2022-09-14   962  	for_each_inst(i, tmp_mask) {
7138fc88fdc1f9 Le Ma                2022-05-18   963  		uint32_t temp;
7138fc88fdc1f9 Le Ma                2022-05-18   964  
7138fc88fdc1f9 Le Ma                2022-05-18   965  		WREG32_SDMA(i, regSDMA_SEM_WAIT_FAIL_TIMER_CNTL, 0);
161e967f7faa2c Jiadong Zhu          2024-09-29   966  		sdma_v4_4_2_gfx_resume(adev, i, restore);
7138fc88fdc1f9 Le Ma                2022-05-18   967  		if (adev->sdma.has_page_queue)
161e967f7faa2c Jiadong Zhu          2024-09-29   968  			sdma_v4_4_2_page_resume(adev, i, restore);
7138fc88fdc1f9 Le Ma                2022-05-18   969  
7138fc88fdc1f9 Le Ma                2022-05-18   970  		/* set utc l1 enable flag always to 1 */
7138fc88fdc1f9 Le Ma                2022-05-18   971  		temp = RREG32_SDMA(i, regSDMA_CNTL);
7138fc88fdc1f9 Le Ma                2022-05-18   972  		temp = REG_SET_FIELD(temp, SDMA_CNTL, UTC_L1_ENABLE, 1);
35ff4301ebc37b Le Ma                2023-02-03   973  		/* enable context empty interrupt during initialization */
35ff4301ebc37b Le Ma                2023-02-03   974  		temp = REG_SET_FIELD(temp, SDMA_CNTL, CTXEMPTY_INT_ENABLE, 1);
7138fc88fdc1f9 Le Ma                2022-05-18   975  		WREG32_SDMA(i, regSDMA_CNTL, temp);
7138fc88fdc1f9 Le Ma                2022-05-18   976  
7138fc88fdc1f9 Le Ma                2022-05-18   977  		if (!amdgpu_sriov_vf(adev)) {
7f03b1d14d5137 Mangesh Gadre        2023-06-21   978  			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
7138fc88fdc1f9 Le Ma                2022-05-18   979  				/* unhalt engine */
7138fc88fdc1f9 Le Ma                2022-05-18   980  				temp = RREG32_SDMA(i, regSDMA_F32_CNTL);
7138fc88fdc1f9 Le Ma                2022-05-18   981  				temp = REG_SET_FIELD(temp, SDMA_F32_CNTL, HALT, 0);
7138fc88fdc1f9 Le Ma                2022-05-18   982  				WREG32_SDMA(i, regSDMA_F32_CNTL, temp);
7138fc88fdc1f9 Le Ma                2022-05-18   983  			}
7138fc88fdc1f9 Le Ma                2022-05-18   984  		}
7f03b1d14d5137 Mangesh Gadre        2023-06-21   985  	}
7138fc88fdc1f9 Le Ma                2022-05-18   986  
7138fc88fdc1f9 Le Ma                2022-05-18   987  	if (amdgpu_sriov_vf(adev)) {
527c670e532341 Lijo Lazar           2022-09-14   988  		sdma_v4_4_2_inst_ctx_switch_enable(adev, true, inst_mask);
527c670e532341 Lijo Lazar           2022-09-14   989  		sdma_v4_4_2_inst_enable(adev, true, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   990  	} else {
527c670e532341 Lijo Lazar           2022-09-14   991  		r = sdma_v4_4_2_inst_rlc_resume(adev, inst_mask);
7138fc88fdc1f9 Le Ma                2022-05-18   992  		if (r)
7138fc88fdc1f9 Le Ma                2022-05-18   993  			return r;
7138fc88fdc1f9 Le Ma                2022-05-18   994  	}
7138fc88fdc1f9 Le Ma                2022-05-18   995  
527c670e532341 Lijo Lazar           2022-09-14   996  	tmp_mask = inst_mask;
527c670e532341 Lijo Lazar           2022-09-14   997  	for_each_inst(i, tmp_mask) {
7138fc88fdc1f9 Le Ma                2022-05-18   998  		ring = &adev->sdma.instance[i].ring;
7138fc88fdc1f9 Le Ma                2022-05-18   999  
7138fc88fdc1f9 Le Ma                2022-05-18  1000  		r = amdgpu_ring_test_helper(ring);
7138fc88fdc1f9 Le Ma                2022-05-18  1001  		if (r)
7138fc88fdc1f9 Le Ma                2022-05-18  1002  			return r;
7138fc88fdc1f9 Le Ma                2022-05-18  1003  
7138fc88fdc1f9 Le Ma                2022-05-18  1004  		if (adev->sdma.has_page_queue) {
7138fc88fdc1f9 Le Ma                2022-05-18  1005  			struct amdgpu_ring *page = &adev->sdma.instance[i].page;
7138fc88fdc1f9 Le Ma                2022-05-18  1006  
7138fc88fdc1f9 Le Ma                2022-05-18  1007  			r = amdgpu_ring_test_helper(page);
7138fc88fdc1f9 Le Ma                2022-05-18  1008  			if (r)
7138fc88fdc1f9 Le Ma                2022-05-18  1009  				return r;
7138fc88fdc1f9 Le Ma                2022-05-18  1010  		}
7138fc88fdc1f9 Le Ma                2022-05-18  1011  	}
7138fc88fdc1f9 Le Ma                2022-05-18  1012  
7138fc88fdc1f9 Le Ma                2022-05-18  1013  	return r;
7138fc88fdc1f9 Le Ma                2022-05-18  1014  }
7138fc88fdc1f9 Le Ma                2022-05-18  1015  

:::::: The code at line 772 was first introduced by commit
:::::: 7138fc88fdc1f999a547657af8623d3a2a862fc1 drm/amdgpu: add sdma v4_4_2 support (v4)

:::::: TO: Le Ma <le.ma@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
