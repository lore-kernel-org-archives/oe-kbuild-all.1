Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A828469F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771369403; cv=none; b=e9gzhv2SzDWS16SskT7MLMQ1Wii97d/mPyYgWK/YnlWrytntT++g1IUhdIGrkAKO6kb6QRw8NfIQv7C/NmWvqxjMOcgaDr/4e9/b2sq36TEw6Y2xc5swDMZer5Z7x6xjAxQWx97a9I/fOQmBf9GHls9YQfWVScSCHCttUwo5xW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771369403; c=relaxed/simple;
	bh=S11PPFF8ss6YWATIicIxAtRBPtCI3t/gfA0dXrVR8nU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jxpe6g4O/OSC1UsSy1pW6BrnTZXcJtav72vpiidmYiDbnDgMKyQbt3Ad5OIEtpTOfPH6IxHGQuZ1bwaYffTCjUTnJL8Ao3WfkPNWGttL8Rf5eqQJKlbw60METWXZxm/B8eNLjyOCCPWWBQal9KsozcStvx3LVN3ZTcLuCphIlvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMkTd+WO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMkTd+WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771369401; x=1802905401;
  h=date:from:to:cc:subject:message-id;
  bh=S11PPFF8ss6YWATIicIxAtRBPtCI3t/gfA0dXrVR8nU=;
  b=lMkTd+WOLapXjBcJOWF6xresHCTr4LUCWwgxkMeDfKx6HPtjR9f+W7v9
   NoJ5cXV/WGo92DGeCuBjus7W5En4ky+dQFFbTjR5FKVHn7PG2Bh7SYQEU
   181EFhJkvvrEVP2Nl3q/EdHEwJpCQytNsAM/Y6XEwxYrqSlp+/1XYDzPy
   2a9EETDPA1ru6AeIpc5pGsksT3YkQMJsOs5cKj6Ef/EgvkkCzaBpyjWRB
   VQaShSHjGcrCQn3Kbn6U+3ZIKziYUDKSIl9BogI+jDhyFflNegPr/cKPL
   2b2iijvRdQpazhtbl1DJlOg2oeYV+4Cufpover/rhejyFifSVXsYuHY8p
   w==;
X-CSE-ConnectionGUID: T4vVX60iRuipv2aNM0CyoQ==
X-CSE-MsgGUID: 0KRbdFSuTwuLEDFpDnE0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83813124"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83813124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 15:03:20 -0800
X-CSE-ConnectionGUID: 90dHHgIXTqugYuZYpRoSuA==
X-CSE-MsgGUID: 3KqGNRTXSzmOInpv+Ap2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="244616992"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 15:03:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsU67-000000011m2-3Wj0;
	Tue, 17 Feb 2026 23:03:15 +0000
Date: Wed, 18 Feb 2026 07:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 14/14]
 drivers/ata/libata-core.c:4818:26: sparse: sparse: cast to restricted __le16
Message-ID: <202602180600.OmvYW9VJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   795595cd79ba6d53ee6165ab807c5452487ec0f3
commit: 795595cd79ba6d53ee6165ab807c5452487ec0f3 [14/14] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: powerpc-randconfig-r131-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180600.OmvYW9VJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180600.OmvYW9VJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180600.OmvYW9VJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ata/libata-core.c:4818:26: sparse: sparse: cast to restricted __le16
--
>> drivers/fsi/fsi-master-ast-cf.c:399:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] rdata @@     got unsigned int [assigned] [usertype] rdata @@
   drivers/fsi/fsi-master-ast-cf.c:399:65: sparse:     expected restricted __be32 [usertype] rdata
   drivers/fsi/fsi-master-ast-cf.c:399:65: sparse:     got unsigned int [assigned] [usertype] rdata
--
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:30:39: sparse:     got void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/stm32_hwspinlock.c:41:39: sparse:     got void *priv
>> drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     expected void *priv
   drivers/hwspinlock/stm32_hwspinlock.c:110:39: sparse:     got void [noderef] __iomem *
--
>> drivers/hwspinlock/u8500_hsem.c:52:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/u8500_hsem.c:52:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/u8500_hsem.c:52:39: sparse:     got void *priv
   drivers/hwspinlock/u8500_hsem.c:65:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/u8500_hsem.c:65:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/u8500_hsem.c:65:39: sparse:     got void *priv
   drivers/hwspinlock/u8500_hsem.c:116:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/u8500_hsem.c:116:30: sparse:     expected void *priv
   drivers/hwspinlock/u8500_hsem.c:116:30: sparse:     got void [noderef] __iomem *
>> drivers/hwspinlock/u8500_hsem.c:126:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *io_base @@     got void * @@
   drivers/hwspinlock/u8500_hsem.c:126:52: sparse:     expected void [noderef] __iomem *io_base
   drivers/hwspinlock/u8500_hsem.c:126:52: sparse:     got void *
--
   drivers/hwspinlock/sun6i_hwspinlock.c:65:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/sun6i_hwspinlock.c:65:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:65:39: sparse:     got void *priv
   drivers/hwspinlock/sun6i_hwspinlock.c:72:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void *priv @@
   drivers/hwspinlock/sun6i_hwspinlock.c:72:39: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/sun6i_hwspinlock.c:72:39: sparse:     got void *priv
>> drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse:     expected void *priv
   drivers/hwspinlock/sun6i_hwspinlock.c:166:30: sparse:     got void [noderef] __iomem *
--
>> drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     expected void *base
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     got void *base
--
   drivers/uio/uio_fsl_elbc_gpcm.c:86:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:86:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:86:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:90:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:90:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:90:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:94:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:94:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:94:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:105:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:105:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:105:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:118:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:118:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:118:31: sparse:     got restricted __be32 *
>> drivers/uio/uio_fsl_elbc_gpcm.c:132:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:132:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:132:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:140:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:140:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:140:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     got restricted __be32 [noderef] __iomem *
--
>> drivers/phy/microchip/sparx5_serdes.c:34:20: sparse: sparse: symbol 'sparx5_serdes_tsize' was not declared. Should it be static?
   drivers/phy/microchip/sparx5_serdes.c:41:20: sparse: sparse: symbol 'lan969x_serdes_tsize' was not declared. Should it be static?
--
>> drivers/video/fbdev/pxa168fb.c:668:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got void * @@
   drivers/video/fbdev/pxa168fb.c:668:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/pxa168fb.c:668:27: sparse:     got void *
>> drivers/video/fbdev/pxa168fb.c:758:25: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/pxa168fb.c:758:25: sparse:     expected void *cpu_addr
   drivers/video/fbdev/pxa168fb.c:758:25: sparse:     got char [noderef] __iomem *screen_base
   drivers/video/fbdev/pxa168fb.c:790:25: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got char [noderef] __iomem *screen_base @@
   drivers/video/fbdev/pxa168fb.c:790:25: sparse:     expected void *cpu_addr
   drivers/video/fbdev/pxa168fb.c:790:25: sparse:     got char [noderef] __iomem *screen_base
--
   drivers/video/fbdev/broadsheetfb.c:298:40: sparse: sparse: restricted __le32 degrades to integer
   drivers/video/fbdev/broadsheetfb.c:299:45: sparse: sparse: restricted __le32 degrades to integer
>> drivers/video/fbdev/broadsheetfb.c:879:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/video/fbdev/broadsheetfb.c:879:17: sparse:     expected unsigned short
   drivers/video/fbdev/broadsheetfb.c:879:17: sparse:     got restricted __le16 [usertype]
--
>> drivers/video/fbdev/pvr2fb.c:1081:11: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/soc/qcom/qcom-geni-se.c:1061:21: sparse: sparse: cast to restricted __le32
>> drivers/soc/qcom/qcom-geni-se.c:1061:21: sparse: sparse: cast from restricted __le16
--
>> drivers/mtd/nand/raw/hisi504_nand.c:362:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:367:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:465:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:477:17: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void const *
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     expected void *
   drivers/mtd/nand/raw/hisi504_nand.c:603:9: sparse:     got void [noderef] __iomem *mmio
--
   drivers/mtd/nand/raw/meson_nand.c:542:23: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/meson_nand.c:542:23: sparse:    left side has type restricted __le64
   drivers/mtd/nand/raw/meson_nand.c:542:23: sparse:    right side has type unsigned char
   drivers/mtd/nand/raw/meson_nand.c:543:23: sparse: sparse: invalid assignment: |=
   drivers/mtd/nand/raw/meson_nand.c:543:23: sparse:    left side has type restricted __le64
   drivers/mtd/nand/raw/meson_nand.c:543:23: sparse:    right side has type int
>> drivers/mtd/nand/raw/meson_nand.c:555:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __le64 [usertype] @@
   drivers/mtd/nand/raw/meson_nand.c:555:32: sparse:     expected unsigned char [usertype]
   drivers/mtd/nand/raw/meson_nand.c:555:32: sparse:     got restricted __le64 [usertype]
>> drivers/mtd/nand/raw/meson_nand.c:556:38: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:570:21: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:571:53: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:572:37: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:577:21: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:578:53: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:579:37: sparse: sparse: restricted __le64 degrades to integer
   drivers/mtd/nand/raw/meson_nand.c:823:23: sparse: sparse: restricted __le64 degrades to integer
--
>> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:52:25: sparse: sparse: symbol 'imx_legacy_bridge_funcs' was not declared. Should it be static?
--
   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:79:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_groups' was not declared. Should it be static?
>> drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c:116:27: sparse: sparse: symbol 'sdm660_lpi_pinctrl_functions' was not declared. Should it be static?

vim +4818 drivers/ata/libata-core.c

2874d5ee6c06ab drivers/ata/libata-core.c  Geert Uytterhoeven 2017-01-03  4799  
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4800  /**
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4801   *	swap_buf_le16 - swap halves of 16-bit words in place
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4802   *	@buf:  Buffer to swap
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4803   *	@buf_words:  Number of 16-bit words in buffer.
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4804   *
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4805   *	Swap halves of 16-bit words if needed to convert from
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4806   *	little-endian byte order to native cpu byte order, or
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4807   *	vice-versa.
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4808   *
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4809   *	LOCKING:
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4810   *	Inherited from caller.
a1af37344f669d drivers/scsi/libata-core.c Albert Lee         2006-03-25  4811   */
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4812  void swap_buf_le16(u16 *buf, unsigned int buf_words)
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4813  {
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4814  #ifdef __BIG_ENDIAN
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4815  	unsigned int i;
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4816  
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4817  	for (i = 0; i < buf_words; i++)
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25 @4818  		buf[i] = le16_to_cpu(buf[i]);
624d5c514eed18 drivers/ata/libata-core.c  Tejun Heo          2008-03-25  4819  #endif /* __BIG_ENDIAN */
8061f5f0a04cfd drivers/scsi/libata-core.c Tejun Heo          2006-03-05  4820  }
8061f5f0a04cfd drivers/scsi/libata-core.c Tejun Heo          2006-03-05  4821  

:::::: The code at line 4818 was first introduced by commit
:::::: 624d5c514eed18d5a93062e9d86d67065175f30a libata: reorganize SFF related stuff

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
