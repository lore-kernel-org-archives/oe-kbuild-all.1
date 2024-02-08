Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0582EB14
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707391484; cv=none; b=aFgyzjbFa1DSo/g5/9n+oGaGfGJG96AUm15v567fm7bvVe/FQJxRaSz+GA+bzRyckyJk8DMqvoGymbAJruTWqjUTCVK0gAo9w9M+7z2PnP6VeYXaAy+8AoXJU3d6QNrxY6VoaWK0HWBuwRPg/qiYJ9ZsxH3RV4zZcTeZmYrShEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707391484; c=relaxed/simple;
	bh=YqNsZQ6ry3ujNDRhTbP4x+tFrFcx0XCgDzWymcuA3iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svByxKwOuEzAQCKujq9fqY0Ca/A541zeK4ctwqmIACn8NnhTwr6t3X+Z5xZFW8cJ7eJLoDiK7YO0TFsVpsBTYMinrnhrPJqjA6b9c2TLwmb8tT0HzxvyvyCeF5Bi4WWWaQOjwnn/U/SkiO+RlvxyAjqIIuw0YXgU3EwARdc4IlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AS11tIdB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AS11tIdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707391482; x=1738927482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YqNsZQ6ry3ujNDRhTbP4x+tFrFcx0XCgDzWymcuA3iE=;
  b=AS11tIdBnN5R0xFWa3W2J5x207nnEVi2Eb5PSsnHoL8zt9ojJJITOydR
   G7CtFib346bbT75URuAC9sDE6vYEe1+8prVRrAhKwlPNqFgRUxqTAZ1w+
   7hNgLT2xWDS5Jg0aPrPJtbcTemGo5vHWluTx97SEQ1l92XmBkCj3ugsAM
   oUEZ+XSheHQwNG5dXnitSb5UP93V9DRyUhlIHXrJN1rVVE7EzKLm4M0YC
   log1pBLnK8O+osMaTguS/CJS4iN0tibKcsrYrmRILrmzhV3znY3+zNaNu
   GxB9+RA6kECl/XD1c1wQyTsPo/EgxMtKjEp+4QUqHTusVa2ziPHRhRPvl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1355295"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1355295"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 03:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6400503"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2024 03:24:39 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY2WD-0003hY-03;
	Thu, 08 Feb 2024 11:24:37 +0000
Date: Thu, 8 Feb 2024 19:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Ma <peng.ma@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:pending-fixes 276/335] drivers/dma/fsl-qdma.c:387:15:
 sparse: sparse: restricted __le32 degrades to integer
Message-ID: <202402081929.mggOTHaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   cdf641895851e4edf648a3d063e90f8f5a07e77f
commit: 9d739bccf261dd93ec1babf82f5c5d71dd4caa3e [276/335] dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
config: arm-randconfig-r123-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081929.mggOTHaZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402081929.mggOTHaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081929.mggOTHaZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-qdma.c:387:15: sparse: sparse: restricted __le32 degrades to integer
   drivers/dma/fsl-qdma.c:390:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:390:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:390:19: sparse:     got unsigned long long
>> drivers/dma/fsl-qdma.c:392:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-qdma.c:392:13: sparse:     expected unsigned int [assigned] [usertype] cmd
   drivers/dma/fsl-qdma.c:392:13: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-qdma.c:394:13: sparse: sparse: invalid assignment: |=
   drivers/dma/fsl-qdma.c:394:13: sparse:    left side has type unsigned int
   drivers/dma/fsl-qdma.c:394:13: sparse:    right side has type restricted __le32
   drivers/dma/fsl-qdma.c:395:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:395:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:395:19: sparse:     got unsigned long long
   drivers/dma/fsl-qdma.c:645:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:645:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:645:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:681:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:681:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:681:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:688:58: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:688:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:688:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:696:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:696:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:696:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:702:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:702:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:702:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:785:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *block @@     got void [noderef] __iomem *[assigned] block @@
   drivers/dma/fsl-qdma.c:785:67: sparse:     expected void *block
   drivers/dma/fsl-qdma.c:785:67: sparse:     got void [noderef] __iomem *[assigned] block

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
9d739bccf261dd Peng Ma 2024-02-01  388  			  FSL_QDMA_CMD_RWTTYPE_OFFSET) |
9d739bccf261dd Peng Ma 2024-02-01  389  			  FSL_QDMA_CMD_PF;
8f95adcf3a5aab Peng Ma 2019-05-22  390  	sdf->data = QDMA_SDDF_CMD(cmd);
8f95adcf3a5aab Peng Ma 2019-05-22  391  
8f95adcf3a5aab Peng Ma 2019-05-22 @392  	cmd = cpu_to_le32(FSL_QDMA_CMD_RWTTYPE <<
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
