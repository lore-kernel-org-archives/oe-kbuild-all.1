Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32061DF73A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740309681; cv=none; b=GosbN1PezaHOfMOQWqGxBZmpu4/jizFS4eb0oNKUJPOkBteGCB6lHE4jcsyyrU8nEvwN9QXNnd+dUsTv+ysGXVildo302UWGCcXbdnPxm+Jc+7w8fFCVEYNV4aWxtTgsJM36nrSBdNuLXXG9sj9ek1V4vYPJHAxYmYQ3J68YI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740309681; c=relaxed/simple;
	bh=Fu7s5UrJYJOUrOP5LJS6ELdHsY1oLJ/xPMQtnkqCIpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLhb0cVekDE6I33kCqOcshjQBLylcG4n2ZnrqzfnGHEyol0gfGeE1dtHj4RKhluDBUKCoH4tNyB+EkNd6u0AeFu+vLtdjhutikSluztVqxZo0dandk8qLw1pXdhGI5KHz6yR2ahK1047VCNS3GX9KuLru8X0Lrhzulw8udhc3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvCTPpPx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvCTPpPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740309679; x=1771845679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fu7s5UrJYJOUrOP5LJS6ELdHsY1oLJ/xPMQtnkqCIpI=;
  b=FvCTPpPx8IMV+vtkAkmbGKehH8A1Tahx8BfMUuOJXs1n37tVSe9urSKx
   cotWsZhrp51OoDI4GEEpuEHwOVuekCPt5imMZpbnNiJoKUUyBQNulOxcr
   LhTzgSLc8vHZa2awpSHmSJsszPoza+2shgnO4Bud3jon9ga2hutNYjRlW
   NQgOAhqwFUVojEDFJW82LBnrbHbItkETrZVeVLlB5Fa0NQrenE6sb4M5i
   k2+y7cGQUcBVbOkHA33zs/uT9WQmF+ye6vLXYPxfRK16Kj1AyVPdIuxyG
   09zugc9SndFt6xqWm4ABm1fP5UjmK9bJcGST+Nazzn0kQ4x7k2LHa2E96
   Q==;
X-CSE-ConnectionGUID: 2/tIhTD6SBuLNlOjaUQuTQ==
X-CSE-MsgGUID: /eXi9SFLRzqPJtvxej/iOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28673800"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28673800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 03:21:18 -0800
X-CSE-ConnectionGUID: n57auS3zRG++0L+HEFYvOw==
X-CSE-MsgGUID: bzvO23VUSbWYYMrjFY6Aug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146704070"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2025 03:21:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmA2s-0007Hv-2R;
	Sun, 23 Feb 2025 11:21:14 +0000
Date: Sun, 23 Feb 2025 19:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9]
 drivers/remoteproc/mtk_vcp_loader.c:130:9: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202502231933.M686oZBX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   be485e577c3a0ec3fd52f17d7b423cadc8fc63e4
commit: 65b501d72807a421824c8b0da783b7f0c4f92d0c [9/9] CHROMIUM: remoteproc: vcp: add vcp kernel driver
config: arm64-randconfig-r112-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231933.M686oZBX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250223/202502231933.M686oZBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231933.M686oZBX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/mtk_vcp_loader.c:130:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/remoteproc/mtk_vcp_loader.c:223:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem * @@
   drivers/remoteproc/mtk_vcp_loader.c:223:9: sparse:     expected void const *
   drivers/remoteproc/mtk_vcp_loader.c:223:9: sparse:     got void [noderef] __iomem *
--
>> drivers/remoteproc/mtk_vcp_rproc.c:64:27: sparse: sparse: Using plain integer as NULL pointer
   drivers/remoteproc/mtk_vcp_rproc.c:65:27: sparse: sparse: Using plain integer as NULL pointer
   drivers/remoteproc/mtk_vcp_rproc.c:66:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/remoteproc/mtk_vcp_rproc.c:62:24: sparse: sparse: symbol 'vcp_mboxdev' was not declared. Should it be static?
   drivers/remoteproc/mtk_vcp_rproc.c:77:19: sparse: sparse: Using plain integer as NULL pointer
>> drivers/remoteproc/mtk_vcp_rproc.c:71:23: sparse: sparse: symbol 'vcp_ipidev' was not declared. Should it be static?
   drivers/remoteproc/mtk_vcp_rproc.c:92:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/remoteproc/mtk_vcp_rproc.c:99:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/remoteproc/mtk_vcp_rproc.c:106:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/remoteproc/mtk_vcp_rproc.c:113:31: sparse: sparse: Using plain integer as NULL pointer
>> drivers/remoteproc/mtk_vcp_rproc.c:578:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/mtk_vcp_rproc.c:771:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/remoteproc/mtk_vcp_rproc.c:813:22: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/remoteproc/mtk_vcp_rproc.c:989:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *share_memory_virt @@     got void * @@
   drivers/remoteproc/mtk_vcp_rproc.c:989:27: sparse:     expected void [noderef] __iomem *share_memory_virt
   drivers/remoteproc/mtk_vcp_rproc.c:989:27: sparse:     got void *
>> drivers/remoteproc/mtk_vcp_rproc.c:979:67: sparse: sparse: cast truncates bits from constant value (1ffffffff becomes ffffffff)
--
>> drivers/rpmsg/mtk_vcp_rpmsg.c:701:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *mbox_base @@     got void *mbox_base @@
   drivers/rpmsg/mtk_vcp_rpmsg.c:701:29: sparse:     expected void [noderef] __iomem *mbox_base
   drivers/rpmsg/mtk_vcp_rpmsg.c:701:29: sparse:     got void *mbox_base
>> drivers/rpmsg/mtk_vcp_rpmsg.c:701:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *mbox_init @@     got void *mbox_init @@
   drivers/rpmsg/mtk_vcp_rpmsg.c:701:40: sparse:     expected void [noderef] __iomem *mbox_init
   drivers/rpmsg/mtk_vcp_rpmsg.c:701:40: sparse:     got void *mbox_init
   drivers/rpmsg/mtk_vcp_rpmsg.c:665:5: sparse: sparse: symbol 'vcp_ipi_table_init' redeclared with different type (incompatible argument 1 (different address spaces)):
   drivers/rpmsg/mtk_vcp_rpmsg.c:665:5: sparse:    int extern [addressable] [signed] [toplevel] vcp_ipi_table_init( ... )
   drivers/rpmsg/mtk_vcp_rpmsg.c: note: in included file:
   include/linux/rpmsg/mtk_vcp_rpmsg.h:253:5: sparse: note: previously declared as:
   include/linux/rpmsg/mtk_vcp_rpmsg.h:253:5: sparse:    int extern [addressable] [signed] [toplevel] vcp_ipi_table_init( ... )

vim +/__iomem +130 drivers/remoteproc/mtk_vcp_loader.c

    69	
    70	static int load_vcp_bin(const u8 *fw_src,
    71				size_t size,
    72				void __iomem *img_buf_va,
    73				phys_addr_t img_buf_pa,
    74				dma_addr_t img_buf_iova,
    75				struct mtk_vcp_device *vcp)
    76	{
    77		void __iomem *ld_ptr;
    78		void __iomem *dram_img_ptr;
    79		void __iomem *dram_img_backup_ptr;
    80		phys_addr_t ld_ptr_phy;
    81		phys_addr_t dram_img_ptr_phy;
    82		u32 fw_size;
    83		u32 ld_size;
    84		u32 dram_img_size;
    85		u32 dram_img_offset = 0;
    86		u32 dram_backup_img_offset = 0;
    87		struct vcp_region_info_st vcp_region_info = {};
    88		struct arm_smccc_res res;
    89	
    90		/*
    91		 * Layout of VCP reserved DRAM memory.
    92		 ************************
    93		 * +------------------+ *
    94		 * |  VCP Loader      | *
    95		 * +------------------+ *
    96		 * |  VCP Firmware    | *
    97		 * +------------------+ *
    98		 ************************
    99		 * +------------------+ *
   100		 * |  VCP DRAM        | *
   101		 * +------------------+ *
   102		 * |  VCP DRAM backup | *
   103		 * +------------------+ *
   104		 ************************
   105		 */
   106	
   107		/* step 2: load/verify firmware */
   108		ld_ptr = img_buf_va;
   109		ld_ptr_phy = img_buf_pa;
   110		ld_size = VCP_LOADER_SIZE;
   111		fw_size = loader_partition(img_buf_va, fw_src, size, VCP_HFRP_SECTION_NAME);
   112		if (!fw_size) {
   113			dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_SECTION_NAME);
   114			return -EINVAL;
   115		}
   116	
   117		/* step 3: load/verify vcp dram section binary */
   118		dram_img_size = loader_partition(img_buf_va + VCP_DRAM_OFFSET,
   119						 fw_src, size, VCP_HFRP_DRAM_SECTION_NAME);
   120		if (!dram_img_size) {
   121			dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_DRAM_SECTION_NAME);
   122			return -EINVAL;
   123		}
   124	
   125		dram_img_ptr = img_buf_va + VCP_DRAM_OFFSET;
   126		dram_img_ptr_phy = img_buf_pa + VCP_DRAM_OFFSET;
   127		dram_img_backup_ptr = dram_img_ptr + round_up(dram_img_size, ALIGN_1024);
   128	
   129		/* copy loader and fw to sram */
 > 130		memcpy_toio(vcp->vcp_cluster->sram_base, (void *)img_buf_va, fw_size);
   131	
   132		/* Let vcp check if the struct matches the one in tinysys */
   133		vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
   134	
   135		/* keep *_addr[35:4] in region info for region info accommodate 32 bits data only */
   136		vcp_region_info.ap_loader_start_pa = (u32)img_buf_pa;
   137		vcp_region_info.ap_loader_start   = VCP_PACK_IOVA(img_buf_iova);
   138		vcp_region_info.ap_firmware_start = VCP_PACK_IOVA(img_buf_iova + ld_size);
   139	
   140		/* set size to 0 to prevent vcp loader load fw, because fw already load-in SRAM */
   141		vcp_region_info.ap_loader_size = 0;
   142		vcp_region_info.ap_firmware_size = 0;
   143	
   144		dram_img_offset = dram_img_ptr - img_buf_va;
   145		dram_backup_img_offset = dram_img_offset + round_up(dram_img_size, ALIGN_1024);
   146	
   147		vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + dram_img_offset);
   148		vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
   149		vcp_region_info.ap_dram_size  = (u32)dram_img_size;
   150	
   151		vcp_region_info.l2tcm_offset = (u32)MMUP_SRAM_OFFSET;
   152	
   153		memcpy_toio(vcp->vcp_cluster->sram_base + REGION_OFFSET,
   154			    &vcp_region_info, sizeof(vcp_region_info));
   155	
   156		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
   157			      MTK_TINYSYS_MMUP_KERNEL_OP_SET_L2TCM_OFFSET,
   158			      MMUP_SRAM_OFFSET, 0, 0, 0, 0, 0, &res);
   159	
   160		return 0;
   161	}
   162	
   163	static int load_mmup_bin(const u8 *fw_src,
   164				 size_t size,
   165				 void __iomem *img_buf_va,
   166				 phys_addr_t img_buf_pa,
   167				 dma_addr_t img_buf_iova,
   168				 struct mtk_vcp_device *vcp)
   169	{
   170		void __iomem *ld_ptr;
   171		void __iomem *dram_img_ptr;
   172		void __iomem *dram_img_backup_ptr;
   173		phys_addr_t ld_ptr_phy;
   174		phys_addr_t dram_img_ptr_phy;
   175		u32 fw_size;
   176		u32 ld_size;
   177		u32 dram_img_size;
   178		u32 dram_img_offset = 0;
   179		u32 dram_backup_img_offset = 0;
   180		struct vcp_region_info_st vcp_region_info = {};
   181		struct arm_smccc_res res;
   182	
   183		/*
   184		 * Layout of MMUP reserved DRAM memory.
   185		 ************************
   186		 * +------------------+ *
   187		 * |  MMUP Loader     | *
   188		 * +------------------+ *
   189		 * |  MMUP Firmware   | *
   190		 * +------------------+ *
   191		 ************************
   192		 * +------------------+ *
   193		 * |  MMUP DRAM       | *
   194		 * +------------------+ *
   195		 * |  MMUP DRAM backup| *
   196		 * +------------------+ *
   197		 ************************
   198		 */
   199	
   200		/* step 2: load/verify firmware */
   201		ld_ptr = img_buf_va;
   202		ld_ptr_phy = img_buf_pa + MMUP_SRAM_OFFSET;
   203		ld_size = VCP_LOADER_SIZE;
   204		fw_size = loader_partition(img_buf_va + MMUP_SRAM_OFFSET, fw_src, size,
   205					   VCP_MMUP_SECTION_NAME);
   206		if (!fw_size) {
   207			dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_SECTION_NAME);
   208			return -EINVAL;
   209		}
   210	
   211		/* step 3: load/verify vcp dram section binary */
   212		dram_img_size = loader_partition(img_buf_va + MMUP_DRAM_IMG_OFFSET, fw_src, size,
   213						 VCP_MMUP_DRAM_SECTION_NAME);
   214		if (!dram_img_size) {
   215			dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_DRAM_SECTION_NAME);
   216			return -EINVAL;
   217		}
   218		dram_img_ptr = img_buf_va + MMUP_DRAM_IMG_OFFSET;
   219		dram_img_ptr_phy = img_buf_pa + MMUP_DRAM_IMG_OFFSET;
   220		dram_img_backup_ptr = dram_img_ptr + round_up(dram_img_size, ALIGN_1024);
   221	
   222		/* copy loader and fw to sram */
 > 223		memcpy_toio(vcp->vcp_cluster->sram_base + MMUP_SRAM_OFFSET,
   224			    img_buf_va + MMUP_SRAM_OFFSET, fw_size);
   225	
   226		/* Let vcp check if the struct matches the one in tinysys */
   227		vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
   228		/* keep *_addr[35:4] in region info for region info accommodate 32 bits data only */
   229		vcp_region_info.ap_loader_start_pa = (u32)(img_buf_pa + MMUP_SRAM_OFFSET);
   230		vcp_region_info.ap_loader_start   = VCP_PACK_IOVA(img_buf_iova + MMUP_SRAM_OFFSET);
   231		vcp_region_info.ap_firmware_start = VCP_PACK_IOVA(img_buf_iova + MMUP_SRAM_OFFSET + ld_size);
   232	
   233		/* set size to 0 to prevent vcp loader load fw, because fw already load-in SRAM */
   234		vcp_region_info.ap_loader_size = 0;
   235		vcp_region_info.ap_firmware_size = 0;
   236	
   237		dram_img_offset = dram_img_ptr - img_buf_va;
   238		dram_backup_img_offset = dram_img_offset + round_up(dram_img_size, ALIGN_1024);
   239		vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + dram_img_offset);
   240		vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
   241		vcp_region_info.ap_dram_size  = (u32)dram_img_size;
   242	
   243		memcpy_toio(vcp->vcp_cluster->sram_base + MMUP_SRAM_OFFSET + REGION_OFFSET,
   244			    &vcp_region_info, sizeof(vcp_region_info));
   245	
   246		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
   247			      MTK_TINYSYS_MMUP_KERNEL_OP_SET_FW_SIZE,
   248			      fw_size, 0, 0, 0, 0, 0, &res);
   249	
   250		return 0;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
