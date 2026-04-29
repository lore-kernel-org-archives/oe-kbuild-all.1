Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B1356A12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 23:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777504030; cv=none; b=Wt7S0m13vft7ZEBfab4LoxS6u/XG0O47tokNM1HG8GKIvWmTcGlpkYPL4o7eWwGUSb74TSHTl6MSCTXVxyOVVPu2AKQCRDBrQ1sBCEqBaLqiloEXYAeHnlG01pDoPIpZFw5GDvkW68hG6TH6l/hSEFQg5qYV0qdIk9mr3J3y6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777504030; c=relaxed/simple;
	bh=4XFlSA/NAK4Ecj74J7p6efOg5BIhfZBwQZzrKm7Ts5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kZ3sScV8DWgmXrCdw1AgQaxNwP3T7bL2LalvIif/H1/0awgp+DTG3n6Bz8blFEBwNh+cs6lopNoCYvlq38yNd2h/PzeXcLmictbVXGl6pF/pH+91aAbfuVFq6/FidBzBp4uc4wVa6aKjgdlDrwGAYRrLxK2E7iwz8SHDyxh/Zg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUv0Ty4D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUv0Ty4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777504029; x=1809040029;
  h=date:from:to:cc:subject:message-id;
  bh=4XFlSA/NAK4Ecj74J7p6efOg5BIhfZBwQZzrKm7Ts5U=;
  b=fUv0Ty4DITWo/8qj9gVWcYWjnZnLS0A7dWiv3uadfUvjWvY69sqZT/6Y
   CTpzJa8JnozhGxqzY0fUuGwaurK5ZuiePTFBVCKrgC4GPyqcHwEGj6IOq
   PBLh4gPNznE/5s35NIoZxYpWy9zaifDfvOrVM9RC5Sx7Gone2NAX2sBks
   vuumyajKlP7UGRZXvccbXgdO0MhBy34YNb/WOy2CymopIXyAxySkswujm
   hZXK+/Kx16Z5pfL7RZESS4IGl270WffoJxpafIiy5570T0QY5o3lN08Pj
   CENWCtrmSKO1EARjbuKZxs0WihQQHHivwOfHp9Cvf/lrfyaRrq0ua3Fh6
   Q==;
X-CSE-ConnectionGUID: rVVc1rhwTFamyGD4zczhZQ==
X-CSE-MsgGUID: H85ENvgFSHuiOqF7zIyrEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77611430"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="77611430"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 16:07:07 -0700
X-CSE-ConnectionGUID: 6kTEOYo4TgOkU07l8rVyaQ==
X-CSE-MsgGUID: L1s938SyQMmFMp+GemtDCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234676558"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 16:07:05 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIDzi-00000000BdA-26yK;
	Wed, 29 Apr 2026 23:07:02 +0000
Date: Thu, 30 Apr 2026 07:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mtd:mtd/spi-mem-cont-read 4/6]
 drivers/spi/spi-mxic.c:406:74: error: 'desc->info.op_tmpl' is a pointer; did
 you mean to use '->'?
Message-ID: <202604300635.SqXMr4TR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Miquel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/spi-mem-cont-read
head:   6e3e2ce14a3c0a111736dc9140a3200363ab704f
commit: 56b2c08482734182d867bf853bce5233d78df796 [4/6] spi: spi-mem: Transform the read operation template
config: csky-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300635.SqXMr4TR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300635.SqXMr4TR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300635.SqXMr4TR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from drivers/spi/spi-mxic.c:12:
   drivers/spi/spi-mxic.c: In function 'mxic_spi_mem_dirmap_read':
>> drivers/spi/spi-mxic.c:406:74: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     406 |         writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
         |                                                                          ^
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
>> drivers/spi/spi-mxic.c:409:41: error: passing argument 1 of 'mxic_spi_mem_prep_op_cfg' from incompatible pointer type [-Wincompatible-pointer-types]
     409 |         writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
         |                                         ^~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct spi_mem_op **
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/spi/spi-mxic.c:319:62: note: expected 'const struct spi_mem_op *' but argument is of type 'struct spi_mem_op **'
     319 | static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   drivers/spi/spi-mxic.c:414:45: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     414 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                                             ^
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/spi/spi-mxic.c:414:16: note: in expansion of macro 'LMODE_CMD0'
     414 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                ^~~~~~~~~~
   drivers/spi/spi-mxic.c:419:63: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     419 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                                               ^
         |                                                               ->
   drivers/spi/spi-mxic.c: In function 'mxic_spi_mem_dirmap_write':
   drivers/spi/spi-mxic.c:451:74: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     451 |         writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
         |                                                                          ^
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/spi/spi-mxic.c:454:41: error: passing argument 1 of 'mxic_spi_mem_prep_op_cfg' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |         writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
         |                                         ^~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         struct spi_mem_op **
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/spi/spi-mxic.c:319:62: note: expected 'const struct spi_mem_op *' but argument is of type 'struct spi_mem_op **'
     319 | static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~
   drivers/spi/spi-mxic.c:459:45: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     459 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                                             ^
   arch/csky/include/asm/io.h:31:59: note: in definition of macro 'writel'
      31 | #define writel(v,c)             ({ wmb(); writel_relaxed((v),(c)); mb(); })
         |                                                           ^
   drivers/spi/spi-mxic.c:459:16: note: in expansion of macro 'LMODE_CMD0'
     459 |         writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
         |                ^~~~~~~~~~
   drivers/spi/spi-mxic.c:464:63: error: 'desc->info.op_tmpl' is a pointer; did you mean to use '->'?
     464 |         if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
         |                                                               ^
         |                                                               ->
   drivers/spi/spi-mxic.c: In function 'mxic_spi_mem_dirmap_create':
>> drivers/spi/spi-mxic.c:512:50: error: passing argument 2 of 'mxic_spi_mem_supports_op' from incompatible pointer type [-Wincompatible-pointer-types]
     512 |         if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
         |                                                  ^~~~~~~~~~~~~~~~~~~
         |                                                  |
         |                                                  struct spi_mem_op **
   drivers/spi/spi-mxic.c:486:63: note: expected 'const struct spi_mem_op *' but argument is of type 'struct spi_mem_op **'
     486 |                                      const struct spi_mem_op *op)
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~^~


vim +406 drivers/spi/spi-mxic.c

b942d80b0a394e8 Mason Yang                          2018-10-17  395  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  396  static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  397  					u64 offs, size_t len, void *buf)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  398  {
fc42bb55c05fa73 Yang Yingliang                      2023-08-23  399  	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  400  	int ret;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  401  	u32 sts;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  402  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  403  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  404  		return -EINVAL;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  405  
50cb86f21ec2ede AlvinZhou                           2024-09-26 @406  	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
50cb86f21ec2ede AlvinZhou                           2024-09-26  407  	       mxic->regs + HC_CFG);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  408  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27 @409  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  410  	       mxic->regs + LRD_CFG);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  411  	writel(desc->info.offset + offs, mxic->regs + LRD_ADDR);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  412  	len = min_t(size_t, len, mxic->linear.size);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  413  	writel(len, mxic->regs + LRD_RANGE);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  414  	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
9e264f3f85a56cc Amit Kumar Mahapatra via Alsa-devel 2023-03-10  415  	       LMODE_SLV_ACT(spi_get_chipselect(desc->mem->spi, 0)) |
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  416  	       LMODE_EN,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  417  	       mxic->regs + LRD_CTRL);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  418  
00360ebae483e60 Miquel Raynal                       2022-02-02  419  	if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
00360ebae483e60 Miquel Raynal                       2022-02-02  420  		ret = mxic_ecc_process_data_pipelined(mxic->ecc.pipelined_engine,
00360ebae483e60 Miquel Raynal                       2022-02-02  421  						      NAND_PAGE_READ,
00360ebae483e60 Miquel Raynal                       2022-02-02  422  						      mxic->linear.dma + offs);
00360ebae483e60 Miquel Raynal                       2022-02-02  423  		if (ret)
00360ebae483e60 Miquel Raynal                       2022-02-02  424  			return ret;
00360ebae483e60 Miquel Raynal                       2022-02-02  425  	} else {
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  426  		memcpy_fromio(buf, mxic->linear.map, len);
00360ebae483e60 Miquel Raynal                       2022-02-02  427  	}
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  428  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  429  	writel(INT_LRD_DIS, mxic->regs + INT_STS);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  430  	writel(0, mxic->regs + LRD_CTRL);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  431  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  432  	ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  433  				 sts & INT_LRD_DIS, 0, USEC_PER_SEC);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  434  	if (ret)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  435  		return ret;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  436  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  437  	return len;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  438  }
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  439  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  440  static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  441  					 u64 offs, size_t len,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  442  					 const void *buf)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  443  {
fc42bb55c05fa73 Yang Yingliang                      2023-08-23  444  	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  445  	u32 sts;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  446  	int ret;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  447  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  448  	if (WARN_ON(offs + desc->info.offset + len > U32_MAX))
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  449  		return -EINVAL;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  450  
50cb86f21ec2ede AlvinZhou                           2024-09-26  451  	writel(mxic_spi_prep_hc_cfg(desc->mem->spi, 0, desc->info.op_tmpl.data.swap16),
50cb86f21ec2ede AlvinZhou                           2024-09-26  452  	       mxic->regs + HC_CFG);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  453  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  454  	writel(mxic_spi_mem_prep_op_cfg(&desc->info.op_tmpl, len),
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  455  	       mxic->regs + LWR_CFG);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  456  	writel(desc->info.offset + offs, mxic->regs + LWR_ADDR);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  457  	len = min_t(size_t, len, mxic->linear.size);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  458  	writel(len, mxic->regs + LWR_RANGE);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27 @459  	writel(LMODE_CMD0(desc->info.op_tmpl.cmd.opcode) |
9e264f3f85a56cc Amit Kumar Mahapatra via Alsa-devel 2023-03-10  460  	       LMODE_SLV_ACT(spi_get_chipselect(desc->mem->spi, 0)) |
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  461  	       LMODE_EN,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  462  	       mxic->regs + LWR_CTRL);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  463  
00360ebae483e60 Miquel Raynal                       2022-02-02  464  	if (mxic->ecc.use_pipelined_conf && desc->info.op_tmpl.data.ecc) {
00360ebae483e60 Miquel Raynal                       2022-02-02  465  		ret = mxic_ecc_process_data_pipelined(mxic->ecc.pipelined_engine,
00360ebae483e60 Miquel Raynal                       2022-02-02  466  						      NAND_PAGE_WRITE,
00360ebae483e60 Miquel Raynal                       2022-02-02  467  						      mxic->linear.dma + offs);
00360ebae483e60 Miquel Raynal                       2022-02-02  468  		if (ret)
00360ebae483e60 Miquel Raynal                       2022-02-02  469  			return ret;
00360ebae483e60 Miquel Raynal                       2022-02-02  470  	} else {
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  471  		memcpy_toio(mxic->linear.map, buf, len);
00360ebae483e60 Miquel Raynal                       2022-02-02  472  	}
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  473  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  474  	writel(INT_LWR_DIS, mxic->regs + INT_STS);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  475  	writel(0, mxic->regs + LWR_CTRL);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  476  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  477  	ret = readl_poll_timeout(mxic->regs + INT_STS, sts,
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  478  				 sts & INT_LWR_DIS, 0, USEC_PER_SEC);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  479  	if (ret)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  480  		return ret;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  481  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  482  	return len;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  483  }
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  484  
b942d80b0a394e8 Mason Yang                          2018-10-17  485  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
b942d80b0a394e8 Mason Yang                          2018-10-17  486  				     const struct spi_mem_op *op)
b942d80b0a394e8 Mason Yang                          2018-10-17  487  {
d05aaa66ba3ca3f Zhengxun Li                         2021-08-04  488  	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
d05aaa66ba3ca3f Zhengxun Li                         2021-08-04  489  	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
b942d80b0a394e8 Mason Yang                          2018-10-17  490  		return false;
b942d80b0a394e8 Mason Yang                          2018-10-17  491  
b942d80b0a394e8 Mason Yang                          2018-10-17  492  	if (op->data.nbytes && op->dummy.nbytes &&
b942d80b0a394e8 Mason Yang                          2018-10-17  493  	    op->data.buswidth != op->dummy.buswidth)
b942d80b0a394e8 Mason Yang                          2018-10-17  494  		return false;
b942d80b0a394e8 Mason Yang                          2018-10-17  495  
b942d80b0a394e8 Mason Yang                          2018-10-17  496  	if (op->addr.nbytes > 7)
b942d80b0a394e8 Mason Yang                          2018-10-17  497  		return false;
b942d80b0a394e8 Mason Yang                          2018-10-17  498  
539ff2488af87f2 Miquel Raynal                       2019-09-19  499  	return spi_mem_default_supports_op(mem, op);
b942d80b0a394e8 Mason Yang                          2018-10-17  500  }
b942d80b0a394e8 Mason Yang                          2018-10-17  501  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  502  static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  503  {
fc42bb55c05fa73 Yang Yingliang                      2023-08-23  504  	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  505  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  506  	if (!mxic->linear.map)
5e657a8e660c0fc Miquel Raynal                       2024-05-22  507  		return -EOPNOTSUPP;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  508  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  509  	if (desc->info.offset + desc->info.length > U32_MAX)
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  510  		return -EINVAL;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  511  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27 @512  	if (!mxic_spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  513  		return -EOPNOTSUPP;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  514  
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  515  	return 0;
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  516  }
33fce1d8bfa8220 Miquel Raynal                       2022-01-27  517  

:::::: The code at line 406 was first introduced by commit
:::::: 50cb86f21ec2ede08d0ec0479fbd8697a8a25616 spi: mxic: Add support for swapping byte

:::::: TO: AlvinZhou <alvinzhou@mxic.com.tw>
:::::: CC: Tudor Ambarus <tudor.ambarus@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
