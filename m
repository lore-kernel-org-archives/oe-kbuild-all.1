Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3083F9C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714393604; cv=none; b=mzcngI8S9zgUETnu/laiyi2VIkTOmuj0Rz6DIvQ/RCv0OvEbkUMZS96SOZohhJ7i67cPZvE3UU0+6X+JHpo22s5R7tuVailKuTvL1wmiwowrCEV3UBBBbF7cIGRJIXB6DyG+sOA8o4UGpkjNG3D4osgybFa4F1P9oXUjb1sC8EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714393604; c=relaxed/simple;
	bh=KxVwuW48O/742YTkU/Clt5HxxTZ7swe+AjK3stereG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyq1kgXnGU8ComuJQXNd3oheaP1scA8y9Bs8/Ps8OeEppPGfVtwXDUTu+fbJ0/CBU3KUER+H22HKgrBSCSsOpjUXv6+y30QRiSpiinViF97mJ8MAY9Dew7HQfSVCPVgMj8imXQB2nHsIXnirx3xnNKLpXGNemeYHuDmfsL0kNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNqUdoCJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNqUdoCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714393602; x=1745929602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KxVwuW48O/742YTkU/Clt5HxxTZ7swe+AjK3stereG8=;
  b=RNqUdoCJGaFXp8m8FX4XkMwNocU/+YHsN1pvN/c03WHMfrwwn+DYSPnE
   IjFWdiJanKIEylIqYcgNKOiTH7Ljy0YZzg7/m71CeaalEhIXqJvPsX9rG
   GU2uPM+H+j9MH9/f/TamIVSVxJ1XjqnwnjONbyrpI2IEgryr65za1VzhU
   bWpYJNT+qm2wjX9NdDu5TStaz5kQ4dhdyhI3MFYp4u2mrnnxx+BTBmTSm
   Abeh6U3BNODLdiFvoKGzjyACbBZ1zZjTFNWq+CGRbdGd9O+vLVQIzP+8n
   7XUkXDiAke88r4E1OnFEoFk14MRAxBTnFcU8LqQ9dMqF3KogDV/MpYi1v
   w==;
X-CSE-ConnectionGUID: n6v6SSp0TXukW0L9iQjbtg==
X-CSE-MsgGUID: NVQonUNDQ5OC+gUlxHrjdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10268588"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10268588"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 05:26:41 -0700
X-CSE-ConnectionGUID: QBys7yKESm2gLYAs9X/BXA==
X-CSE-MsgGUID: p2HBgeZ1TyGtQ3NS9HT6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30894735"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 05:26:40 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Q5d-0007AY-24;
	Mon, 29 Apr 2024 12:26:37 +0000
Date: Mon, 29 Apr 2024 20:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5880/11728]
 drivers/clk/imx/imx95-blk-ctrl.c:328:25: error: use of undeclared identifier
 'imx95_blk_ctrl_match'; did you mean 'imx95_bc_of_match'?
Message-ID: <202404292035.CVGj6A6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: b2ce3f7fa3779b1409e6083db48f7cc95a273654 [5880/11728] Merge branch 'dts/next' into next
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240429/202404292035.CVGj6A6v-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404292035.CVGj6A6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404292035.CVGj6A6v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/imx/imx95-blk-ctrl.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/clk/imx/imx95-blk-ctrl.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/clk/imx/imx95-blk-ctrl.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/clk/imx/imx95-blk-ctrl.c:328:25: error: use of undeclared identifier 'imx95_blk_ctrl_match'; did you mean 'imx95_bc_of_match'?
     328 | MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         imx95_bc_of_match
   include/linux/module.h:244:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/clk/imx/imx95-blk-ctrl.c:319:34: note: 'imx95_bc_of_match' declared here
     319 | static const struct of_device_id imx95_bc_of_match[] = {
         |                                  ^
   6 warnings and 1 error generated.


vim +328 drivers/clk/imx/imx95-blk-ctrl.c

387c5cea9cf94e Peng Fan 2023-09-18  318  
387c5cea9cf94e Peng Fan 2023-09-18  319  static const struct of_device_id imx95_bc_of_match[] = {
387c5cea9cf94e Peng Fan 2023-09-18  320  	{ .compatible = "fsl,imx95-vpumix-blk-ctrl", .data = &vpublk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  321  	{ .compatible = "fsl,imx95-cameramix-csr", .data = &camblk_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  322  	{ .compatible = "fsl,imx95-display-master-csr", },
387c5cea9cf94e Peng Fan 2023-09-18  323  	{ .compatible = "fsl,imx95-dispmix-lvds-csr", .data = &lvds_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  324  	{ .compatible = "fsl,imx95-dispmix-csr", .data = &dispmix_csr_dev_data },
387c5cea9cf94e Peng Fan 2023-09-18  325  	{ .compatible = "fsl,imx95-netcmix-blk-ctrl", },
387c5cea9cf94e Peng Fan 2023-09-18  326  	{ /* Sentinel */ },
387c5cea9cf94e Peng Fan 2023-09-18  327  };
387c5cea9cf94e Peng Fan 2023-09-18 @328  MODULE_DEVICE_TABLE(of, imx95_blk_ctrl_match);
387c5cea9cf94e Peng Fan 2023-09-18  329  

:::::: The code at line 328 was first introduced by commit
:::::: 387c5cea9cf94eb645f2e433404f023b24dfd509 LF-10523-12 clk: imx: add i.MX95 blk ctrl clk driver

:::::: TO: Peng Fan <peng.fan@nxp.com>
:::::: CC: Peng Fan <peng.fan@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
