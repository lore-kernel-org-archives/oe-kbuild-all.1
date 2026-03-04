Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51133E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664402; cv=none; b=e3ZtN+dHf86JdVurQQ4ixQ89MgoozKSdmh2LOu+EwHaX+0ZZGCgZBU2FW2yO/shUSMfW9BQFlL+NN9fFVFLrj2J2m0vlXe0jNQJ+/V1TC9O+/j9W+G32AK8ExZqNIQJlfVTrdBEbG3ALne7+Kv7YJJW4i+Z2OW1Rm3EJuMzDtLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664402; c=relaxed/simple;
	bh=tOgQG31bCud5ek2adw/V/bgKE/QxMsUvxYe6MD/JKuE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AuV8bP9ZJ+6/9ZtmHB2y9a219LHqrW7nqyGsLpGF0v0G4xL4UjvfV0HU9izvOALakMbizXjMsjfnP8+MGn/FPyVMcqZXKWRgh/XQNxh2pQW4lOju7ovmYhrfu7yJZHZ31G6FDk9XCVVZL6GtCwaohmYZ5FKLzMB6thrrsw1IVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTjUqX7y; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTjUqX7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772664400; x=1804200400;
  h=date:from:to:cc:subject:message-id;
  bh=tOgQG31bCud5ek2adw/V/bgKE/QxMsUvxYe6MD/JKuE=;
  b=NTjUqX7y/xjTBXpvom623MAzflVSeLO03fnzmxmGaEne0oWKRco1QoTJ
   yPBGFTwl9PVsfMg1iDgwJHKCp6onNu4cnXlxGdeiiCViRkXehZrTIsQ3D
   HITDwX6IICDXDyICubJoblVwUaNY2SLAg73DC6UYroszWo961WAS5qf7w
   nwwWE5zPbl1X3VtH4nAtxUDicuR/osSazNGgiV7uVv9ptDt8+3boE5Cdd
   KdzaNbzyF5PLef0weIApRAY0EU41NHViY0CjZbNq6uFKrNgo685Pa102v
   qDHiIx9SnYoOOUcMgEVHvLq8ag3NuWk2xVVIa0lFn/2z0hNBn46gqeElR
   Q==;
X-CSE-ConnectionGUID: SkNnnOYZTpSa7v59bED73g==
X-CSE-MsgGUID: EgW+cWn1Q0eRDygfTTm4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96355705"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="96355705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 14:46:40 -0800
X-CSE-ConnectionGUID: fffE6GCBTsCTPLGTgldLIg==
X-CSE-MsgGUID: 2UxCikz1Qnipn4eiQpjiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="215368064"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2026 14:46:38 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxuzD-000000004dH-2Qlp;
	Wed, 04 Mar 2026 22:46:35 +0000
Date: Thu, 05 Mar 2026 06:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/hwspinlock/refactor-alloc-buildtest 5/15]
 drivers/hwspinlock/omap_hwspinlock.c:71:37: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202603050627.uRlAg3Ij-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
head:   f2fc589840b1a727d4318cd5e9fc99d23fb3a35c
commit: 1a2ed3da73876c7c585e4287376e5420e36ddb95 [5/15] hwspinlock: omap: use new callback to initialize hwspinlock priv
config: microblaze-randconfig-r121-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050627.uRlAg3Ij-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050627.uRlAg3Ij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050627.uRlAg3Ij-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/omap_hwspinlock.c:40:55: sparse:     got void *
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *lock_addr @@     got void * @@
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse:     expected void [noderef] __iomem *lock_addr
   drivers/hwspinlock/omap_hwspinlock.c:48:55: sparse:     got void *
>> drivers/hwspinlock/omap_hwspinlock.c:71:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *io_base_ofs @@     got void *init_data @@
   drivers/hwspinlock/omap_hwspinlock.c:71:37: sparse:     expected void [noderef] __iomem *io_base_ofs
   drivers/hwspinlock/omap_hwspinlock.c:71:37: sparse:     got void *init_data
>> drivers/hwspinlock/omap_hwspinlock.c:73:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/omap_hwspinlock.c:73:28: sparse:     expected void *
   drivers/hwspinlock/omap_hwspinlock.c:73:28: sparse:     got void [noderef] __iomem *
>> drivers/hwspinlock/omap_hwspinlock.c:128:70: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void *init_data @@     got void [noderef] __iomem * @@
   drivers/hwspinlock/omap_hwspinlock.c:128:70: sparse:     expected void *init_data
   drivers/hwspinlock/omap_hwspinlock.c:128:70: sparse:     got void [noderef] __iomem *

vim +71 drivers/hwspinlock/omap_hwspinlock.c

    68	
    69	static void *omap_hwspinlock_init_priv(int local_id, void *init_data)
    70	{
  > 71		void __iomem *io_base_ofs = init_data;
    72	
  > 73		return io_base_ofs + sizeof(u32) * local_id;
    74	}
    75	
    76	static const struct hwspinlock_ops omap_hwspinlock_ops = {
    77		.trylock = omap_hwspinlock_trylock,
    78		.unlock = omap_hwspinlock_unlock,
    79		.relax = omap_hwspinlock_relax,
    80		.init_priv = omap_hwspinlock_init_priv,
    81	};
    82	
    83	static int omap_hwspinlock_probe(struct platform_device *pdev)
    84	{
    85		struct hwspinlock_device *bank;
    86		void __iomem *io_base;
    87		int num_locks, i, ret;
    88		/* Only a single hwspinlock block device is supported */
    89		int base_id = 0;
    90	
    91		io_base = devm_platform_ioremap_resource(pdev, 0);
    92		if (IS_ERR(io_base))
    93			return PTR_ERR(io_base);
    94	
    95		/*
    96		 * make sure the module is enabled and clocked before reading
    97		 * the module SYSSTATUS register
    98		 */
    99		ret = devm_pm_runtime_enable(&pdev->dev);
   100		if (ret)
   101			return ret;
   102		ret = pm_runtime_resume_and_get(&pdev->dev);
   103		if (ret < 0)
   104			return ret;
   105	
   106		/* Determine number of locks */
   107		i = readl(io_base + SYSSTATUS_OFFSET);
   108		i >>= SPINLOCK_NUMLOCKS_BIT_OFFSET;
   109	
   110		/*
   111		 * runtime PM will make sure the clock of this module is
   112		 * enabled again iff at least one lock is requested
   113		 */
   114		pm_runtime_put(&pdev->dev);
   115	
   116		/* one of the four lsb's must be set, and nothing else */
   117		if (hweight_long(i & 0xf) != 1 || i > 8)
   118			return -EINVAL;
   119	
   120		num_locks = i * 32; /* actual number of locks in this device */
   121	
   122		bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
   123				    GFP_KERNEL);
   124		if (!bank)
   125			return -ENOMEM;
   126	
   127		return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
 > 128						 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
