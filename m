Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EDE1BDCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766018787; cv=none; b=bvi9tKEGUdRluIzqgDE5uE52VO5geo48N0cwJga8ryK++PfBQbbxqwtZ/ef+zXKHCYLZL+9k/NXIjKdhawWUpuNZI3QR9KTY6Kx6cG569dkfiyGdtC5NhS8TG6LWgErNo0xEg/4X0yOlcsyiZyHQrbruuXMHRSY6HMqyBrQbo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766018787; c=relaxed/simple;
	bh=KHyj37zXgBm9Jnjlb4VtpRzMfb2Yw1RzBE5AyLoi9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fel9Yl2cCb0KnTQJMPxsqIr0f40ka2IIAkGTnVuRm+LdZ0mQQ2n6yJ6SWNqnetoOVP7CgG71Niaa8qtZAr/91oWtanUL8LyrRJG0oZZ83ulcJH8ypmB+OS+yVPJWjCHpIorCgM47pk01fjny9W0QMD+AiuLB4MFXGAXJctEsIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsKgQ+ER; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsKgQ+ER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766018785; x=1797554785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KHyj37zXgBm9Jnjlb4VtpRzMfb2Yw1RzBE5AyLoi9Ks=;
  b=dsKgQ+ERkh45TWk9Hi+qQwSI5S52d7+bIpUkLkUBxjM4nqnD9VRAT6FO
   F+jko9rVVXSzlYbYPlctQoMEbGKxTeswYZ5rV83sH9rBmV+jnVgzups7X
   7lwSUTGzgRdWlg96OA2fnruD8dSeJMoO6b6E0vVI4T+cViFxCpOzWcVoG
   oeTKXA+xiGyD04kOOMIQLDyPdK2uW030bflfdwV/xcApzfR59svgyPONG
   g2/KQ7gd0jGrhccsZiNuTzgYMj73+L1RIQ8/lnJmsiKqGsnrvE+lWfG4T
   zSNwL90XA/AA0/9nsfQrHmETy2mb6RyLUtDB6mF8G21dqKxkR03eLDGV7
   g==;
X-CSE-ConnectionGUID: 2vRlUvo+TzObrkPHK08bwg==
X-CSE-MsgGUID: ImTGZFweSEmQmTShHD6Y2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85387738"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="85387738"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 16:46:23 -0800
X-CSE-ConnectionGUID: chxl2h8lR9iTX6h8x1oOSQ==
X-CSE-MsgGUID: MXK0rfU1T16drlcJFo/lgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="221848124"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2025 16:46:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW29r-000000001OD-2Uoe;
	Thu, 18 Dec 2025 00:46:19 +0000
Date: Thu, 18 Dec 2025 08:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] drivers/dma/fsl-qdma.c:387:15:
 sparse: sparse: restricted __le32 degrades to integer
Message-ID: <202512180850.Q89JsCEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: 106c1ac953a66556ec77456c46e818208d3a9bce [2/2] dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
config: arm64-randconfig-r132-20251216 (https://download.01.org/0day-ci/archive/20251218/202512180850.Q89JsCEX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180850.Q89JsCEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180850.Q89JsCEX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-qdma.c:387:15: sparse: sparse: restricted __le32 degrades to integer
   drivers/dma/fsl-qdma.c:390:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:390:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:390:19: sparse:     got unsigned long long
   drivers/dma/fsl-qdma.c:392:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-qdma.c:392:13: sparse:     expected unsigned int [assigned] [usertype] cmd
   drivers/dma/fsl-qdma.c:392:13: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-qdma.c:394:13: sparse: sparse: invalid assignment: |=
   drivers/dma/fsl-qdma.c:394:13: sparse:    left side has type unsigned int
   drivers/dma/fsl-qdma.c:394:13: sparse:    right side has type restricted __le32
   drivers/dma/fsl-qdma.c:395:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:395:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:395:19: sparse:     got unsigned long long
   drivers/dma/fsl-qdma.c:646:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:646:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:646:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:682:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:682:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:682:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:689:58: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:689:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:689:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:697:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:697:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:697:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:703:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:703:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:703:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:786:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *block @@     got void [noderef] __iomem *[assigned] block @@
   drivers/dma/fsl-qdma.c:786:67: sparse:     expected void *block
   drivers/dma/fsl-qdma.c:786:67: sparse:     got void [noderef] __iomem *[assigned] block

vim +387 drivers/dma/fsl-qdma.c

b092529e0aa098 Peng Ma 2018-10-30  354  
b092529e0aa098 Peng Ma 2018-10-30  355  static void fsl_qdma_comp_fill_memcpy(struct fsl_qdma_comp *fsl_comp,
b092529e0aa098 Peng Ma 2018-10-30  356  				      dma_addr_t dst, dma_addr_t src, u32 len)
b092529e0aa098 Peng Ma 2018-10-30  357  {
8f95adcf3a5aab Peng Ma 2019-05-22  358  	u32 cmd;
b092529e0aa098 Peng Ma 2018-10-30  359  	struct fsl_qdma_format *sdf, *ddf;
b092529e0aa098 Peng Ma 2018-10-30  360  	struct fsl_qdma_format *ccdf, *csgf_desc, *csgf_src, *csgf_dest;
b092529e0aa098 Peng Ma 2018-10-30  361  
b092529e0aa098 Peng Ma 2018-10-30  362  	ccdf = fsl_comp->virt_addr;
b092529e0aa098 Peng Ma 2018-10-30  363  	csgf_desc = fsl_comp->virt_addr + 1;
b092529e0aa098 Peng Ma 2018-10-30  364  	csgf_src = fsl_comp->virt_addr + 2;
b092529e0aa098 Peng Ma 2018-10-30  365  	csgf_dest = fsl_comp->virt_addr + 3;
b092529e0aa098 Peng Ma 2018-10-30  366  	sdf = fsl_comp->desc_virt_addr;
b092529e0aa098 Peng Ma 2018-10-30  367  	ddf = fsl_comp->desc_virt_addr + 1;
b092529e0aa098 Peng Ma 2018-10-30  368  
b092529e0aa098 Peng Ma 2018-10-30  369  	memset(fsl_comp->virt_addr, 0, FSL_QDMA_COMMAND_BUFFER_SIZE);
b092529e0aa098 Peng Ma 2018-10-30  370  	memset(fsl_comp->desc_virt_addr, 0, FSL_QDMA_DESCRIPTOR_BUFFER_SIZE);
b092529e0aa098 Peng Ma 2018-10-30  371  	/* Head Command Descriptor(Frame Descriptor) */
b092529e0aa098 Peng Ma 2018-10-30  372  	qdma_desc_addr_set64(ccdf, fsl_comp->bus_addr + 16);
b092529e0aa098 Peng Ma 2018-10-30  373  	qdma_ccdf_set_format(ccdf, qdma_ccdf_get_offset(ccdf));
b092529e0aa098 Peng Ma 2018-10-30  374  	qdma_ccdf_set_ser(ccdf, qdma_ccdf_get_status(ccdf));
b092529e0aa098 Peng Ma 2018-10-30  375  	/* Status notification is enqueued to status queue. */
b092529e0aa098 Peng Ma 2018-10-30  376  	/* Compound Command Descriptor(Frame List Table) */
b092529e0aa098 Peng Ma 2018-10-30  377  	qdma_desc_addr_set64(csgf_desc, fsl_comp->desc_bus_addr);
b092529e0aa098 Peng Ma 2018-10-30  378  	/* It must be 32 as Compound S/G Descriptor */
b092529e0aa098 Peng Ma 2018-10-30  379  	qdma_csgf_set_len(csgf_desc, 32);
b092529e0aa098 Peng Ma 2018-10-30  380  	qdma_desc_addr_set64(csgf_src, src);
b092529e0aa098 Peng Ma 2018-10-30  381  	qdma_csgf_set_len(csgf_src, len);
b092529e0aa098 Peng Ma 2018-10-30  382  	qdma_desc_addr_set64(csgf_dest, dst);
b092529e0aa098 Peng Ma 2018-10-30  383  	qdma_csgf_set_len(csgf_dest, len);
b092529e0aa098 Peng Ma 2018-10-30  384  	/* This entry is the last entry. */
b092529e0aa098 Peng Ma 2018-10-30  385  	qdma_csgf_set_f(csgf_dest, len);
b092529e0aa098 Peng Ma 2018-10-30  386  	/* Descriptor Buffer */
8f95adcf3a5aab Peng Ma 2019-05-22 @387  	cmd = cpu_to_le32(FSL_QDMA_CMD_RWTTYPE <<
106c1ac953a665 Peng Ma 2024-02-01  388  			  FSL_QDMA_CMD_RWTTYPE_OFFSET) |
106c1ac953a665 Peng Ma 2024-02-01  389  			  FSL_QDMA_CMD_PF;
8f95adcf3a5aab Peng Ma 2019-05-22  390  	sdf->data = QDMA_SDDF_CMD(cmd);
8f95adcf3a5aab Peng Ma 2019-05-22  391  
8f95adcf3a5aab Peng Ma 2019-05-22  392  	cmd = cpu_to_le32(FSL_QDMA_CMD_RWTTYPE <<
b092529e0aa098 Peng Ma 2018-10-30  393  			  FSL_QDMA_CMD_RWTTYPE_OFFSET);
8f95adcf3a5aab Peng Ma 2019-05-22  394  	cmd |= cpu_to_le32(FSL_QDMA_CMD_LWC << FSL_QDMA_CMD_LWC_OFFSET);
8f95adcf3a5aab Peng Ma 2019-05-22  395  	ddf->data = QDMA_SDDF_CMD(cmd);
b092529e0aa098 Peng Ma 2018-10-30  396  }
b092529e0aa098 Peng Ma 2018-10-30  397  

:::::: The code at line 387 was first introduced by commit
:::::: 8f95adcf3a5aabb7a416d3c03c561acd580df213 dmaengine: fsl-qdma: fixed the source/destination descriptor format

:::::: TO: Peng Ma <peng.ma@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
