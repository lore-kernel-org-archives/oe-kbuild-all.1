Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA83B4EB7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 19:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625198; cv=none; b=nXHDRE0Whv9jheWCL9+GsXJTPswp/vdfuIqR2Tki6/vmLGSkROHJBHNGJ8SaVji/jvpmiCq70SwO1GVmm1oW3700E/PMFiOJc1n5w06WkIPX3sssgVKlDo8hxNZ9mVbNIrquKttMNidt+9lD1eQMHBSIO87j5FhI5Ytot44OYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625198; c=relaxed/simple;
	bh=wXJmD69eMdHfeU5U/PKdtXPEC60+eNpqBe0XR0dNPZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PnxY1XwzDkU0bAMtZhnmYz07yu8Qg7DUZPRHbUIlqgIByhcSNslZ7QeFnVrPB0vbUY0/U8OQO161RbGyakJLkRNZDQWcx0LTi7aWiK70V1kHp9PkWsQRCYYhSWjJvAuRipl/akCNYLhtfxD/oo5FB7P1XSSysAPdpB/XI3U/cgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbspRrpi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbspRrpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783625196; x=1815161196;
  h=date:from:to:cc:subject:message-id;
  bh=wXJmD69eMdHfeU5U/PKdtXPEC60+eNpqBe0XR0dNPZk=;
  b=BbspRrpinNmTYkuYMV+1V+Qh4rH5Kux4vBLo+epWFG2ccV35Osy88Ud+
   A4fj1ZOdSfTAfgVf7vAqyZDxYmQ9WvU2pIKmwhkQ9ZeX54/zL4hs7bPxF
   he6OI0uV3kOqLhAyNsj0YGvl94/vKXL3EGCBxJcvQNn0Rouup4Cw36nri
   Zirz8UQId84YgwiZCmJtvDOghGiUTZlAQ4FlixdNM3dTa7jE7U8l5gw76
   ak5LHxhY1nr2uthqGjjB3fL9S7edEnMbGUHaqtab6bwRn4WZxXgXFk5sY
   19jL/aHN1bolTxK714EU2eoZLnS4gu7AQ7dEUXD+H7mcwmkvMNsFGvmY2
   A==;
X-CSE-ConnectionGUID: NbYxqnt8SjmcZrQYB8pZ+g==
X-CSE-MsgGUID: mK/TdNvKTe+HW35Dc/3Q/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88149634"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88149634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 12:26:36 -0700
X-CSE-ConnectionGUID: LoAhtLKrQ46fasFR1H8I0Q==
X-CSE-MsgGUID: 6p6j3hMKRCGSsvE168IbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258981054"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2026 12:26:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whuOF-00000000I2l-2TXW;
	Thu, 09 Jul 2026 19:26:31 +0000
Date: Fri, 10 Jul 2026 03:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2888/4669]
 drivers/mtd/maps/uclinux.c:58:15: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202607100227.esCbqJWc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9810cd75b9fb56a3425d391cba3f608502bd474
commit: 2b533e775aec580cf60074417f4ca00ac9cf3580 [2888/4669] Revert "mtd: maps: remove uclinux map driver"
config: riscv-randconfig-r122-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100227.esCbqJWc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100227.esCbqJWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100227.esCbqJWc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/maps/uclinux.c:58:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/mtd/maps/uclinux.c:58:15: sparse:     expected void *
   drivers/mtd/maps/uclinux.c:58:15: sparse:     got void [noderef] __iomem *
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
   drivers/mtd/maps/uclinux.c:80:30: sparse: sparse: cast to restricted __be32
>> drivers/mtd/maps/uclinux.c:92:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void * @@
   drivers/mtd/maps/uclinux.c:92:20: sparse:     expected void [noderef] __iomem *virt
   drivers/mtd/maps/uclinux.c:92:20: sparse:     got void *
>> drivers/mtd/maps/uclinux.c:94:27: sparse: sparse: Using plain integer as NULL pointer

vim +58 drivers/mtd/maps/uclinux.c

    53	
    54	static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
    55		size_t *retlen, void **virt, resource_size_t *phys)
    56	{
    57		struct map_info *map = mtd->priv;
  > 58		*virt = map->virt + from;
    59		if (phys)
    60			*phys = map->phys + from;
    61		*retlen = len;
    62		return(0);
    63	}
    64	
    65	/****************************************************************************/
    66	
    67	static int __init uclinux_mtd_init(void)
    68	{
    69		struct mtd_info *mtd;
    70		struct map_info *mapp;
    71	
    72		mapp = &uclinux_ram_map;
    73	
    74		if (physaddr == -1)
    75			mapp->phys = (resource_size_t)__bss_stop;
    76		else
    77			mapp->phys = physaddr;
    78	
    79		if (!mapp->size)
    80			mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
    81		mapp->bankwidth = 4;
    82	
    83		printk("uclinux[mtd]: probe address=0x%x size=0x%x\n",
    84		       	(int) mapp->phys, (int) mapp->size);
    85	
    86		/*
    87		 * The filesystem is guaranteed to be in direct mapped memory. It is
    88		 * directly following the kernels own bss region. Following the same
    89		 * mechanism used by architectures setting up traditional initrds we
    90		 * use phys_to_virt to get the virtual address of its start.
    91		 */
  > 92		mapp->virt = phys_to_virt(mapp->phys);
    93	
  > 94		if (mapp->virt == 0) {
    95			printk("uclinux[mtd]: no virtual mapping?\n");
    96			return(-EIO);
    97		}
    98	
    99		simple_map_init(mapp);
   100	
   101		mtd = do_map_probe("map_" MAP_NAME, mapp);
   102		if (!mtd) {
   103			printk("uclinux[mtd]: failed to find a mapping?\n");
   104			return(-ENXIO);
   105		}
   106	
   107		mtd->owner = THIS_MODULE;
   108		mtd->_point = uclinux_point;
   109		mtd->priv = mapp;
   110	
   111		uclinux_ram_mtdinfo = mtd;
   112		mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
   113	
   114		return(0);
   115	}
   116	device_initcall(uclinux_mtd_init);
   117	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
