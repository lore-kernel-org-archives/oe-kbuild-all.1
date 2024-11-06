Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B7183CD6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730884522; cv=none; b=sfhz1P1uW8zuZX5Kb39O98Jv+ui+7gZ0TYxZWtM7CGlvFAeCeroMoZk17PgNzqD+II6TDE4WfnKMpmW7wdPltJQYJrje2OXbDD4rMPGTSsBgaALJ+ov+GcgFUA0YtosppPdUuihKt5R0y1abn1l3b0I8jknmk9S9wueHpwBETaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730884522; c=relaxed/simple;
	bh=/Npg9/hxkPWObzSzIiWTA0Jk1ljgcIH8msj9tPrDd3A=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZbtPdvk8wWQpys6PLwcwBdYny7UYgmW0Gc9J1klnQDUTOuurfgkbSg6uDvvecqYE3wjBoYa9WAhPvZs76Bg/YRNrwqnwFf4NWW4nina4WrTCK5xPcEenvZ83iDuoaqPMh4oCNYnMU4NUwBqFBzNonGxLc8k8JwDvxnfeIL+rI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NaHxS3Em; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NaHxS3Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730884521; x=1762420521;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/Npg9/hxkPWObzSzIiWTA0Jk1ljgcIH8msj9tPrDd3A=;
  b=NaHxS3EmhCuANOLn4AJTEB61WhEfUDCtTUzikPSh7bei1KW2qyDslTT/
   jg1KMB/daH26RHnM1ZnSfpqOOB/uGc/HIcjq7dkYUvenoo/B5TcxZBx7n
   3wMt5R6FlzzdDUuG9E9wxVCCffFSdxdUXVCQIrybci3iPjFydqsyp1sMc
   RVR8ZCWlzBVs66r/IdedUtQxYf8gkEFUSIj8dLSAiY42CSMGa5qI9EuuT
   78pQesEPwPG++t6NY7GN7gkQwRVsfEJKqfuND1qYwnufgv8wpQwyQ4IsY
   ARYvAydxT452h7cHqHiVeW0aXOdLdgBWUU3AQRZs+OAYsCSK5lcDpDcYK
   A==;
X-CSE-ConnectionGUID: hkQMKOXqRlu7Z06X0OnIYg==
X-CSE-MsgGUID: cdoI2+AES1+Q4eEX6UCvpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48134404"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48134404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:15:20 -0800
X-CSE-ConnectionGUID: HEli/JvTRp+Cc0hrkfuvyw==
X-CSE-MsgGUID: uUNeK9kJTXWXNPwb5GCLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="115215718"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2024 01:15:19 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8c8C-000n7y-2r;
	Wed, 06 Nov 2024 09:15:16 +0000
Date: Wed, 6 Nov 2024 17:14:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-5.10.y 272/304] drivers/remoteproc/stm32_rproc.c:636:34:
 warning: unused variable 'stm32_rproc_match'
Message-ID: <202411061748.x3yj2LGR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-5.10.y
head:   b2add7c50b5bf51a401424ad00792b130a73c2c5
commit: f0b0a4de789d0fd7640f63c76eeba68caec18744 [272/304] remoteproc: stm32: use correct format strings on 64-bit
config: x86_64-buildonly-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061748.x3yj2LGR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061748.x3yj2LGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061748.x3yj2LGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/remoteproc/stm32_rproc.c:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1527:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/remoteproc/stm32_rproc.c:572:43: warning: format specifies type 'unsigned int' but the argument has type 'phys_addr_t' (aka 'unsigned long long') [-Wformat]
     572 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
         |                                             ~~~         ^~~
         |                                             %#llx
   include/linux/dev_printk.h:131:47: note: expanded from macro 'dev_dbg'
     131 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
>> drivers/remoteproc/stm32_rproc.c:636:34: warning: unused variable 'stm32_rproc_match' [-Wunused-const-variable]
     636 | static const struct of_device_id stm32_rproc_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/stm32_rproc_match +636 drivers/remoteproc/stm32_rproc.c

13140de09cc2dd Fabien Dessenne  2019-05-14  555  
9d057eacf804e2 Mathieu Poirier  2021-03-12  556  static int stm32_rproc_da_to_pa(struct rproc *rproc,
9d057eacf804e2 Mathieu Poirier  2021-03-12  557  				u64 da, phys_addr_t *pa)
9d057eacf804e2 Mathieu Poirier  2021-03-12  558  {
9d057eacf804e2 Mathieu Poirier  2021-03-12  559  	struct stm32_rproc *ddata = rproc->priv;
9d057eacf804e2 Mathieu Poirier  2021-03-12  560  	struct device *dev = rproc->dev.parent;
9d057eacf804e2 Mathieu Poirier  2021-03-12  561  	struct stm32_rproc_mem *p_mem;
9d057eacf804e2 Mathieu Poirier  2021-03-12  562  	unsigned int i;
9d057eacf804e2 Mathieu Poirier  2021-03-12  563  
9d057eacf804e2 Mathieu Poirier  2021-03-12  564  	for (i = 0; i < ddata->nb_rmems; i++) {
9d057eacf804e2 Mathieu Poirier  2021-03-12  565  		p_mem = &ddata->rmems[i];
9d057eacf804e2 Mathieu Poirier  2021-03-12  566  
9d057eacf804e2 Mathieu Poirier  2021-03-12  567  		if (da < p_mem->dev_addr ||
9d057eacf804e2 Mathieu Poirier  2021-03-12  568  		    da >= p_mem->dev_addr + p_mem->size)
9d057eacf804e2 Mathieu Poirier  2021-03-12  569  			continue;
9d057eacf804e2 Mathieu Poirier  2021-03-12  570  
9d057eacf804e2 Mathieu Poirier  2021-03-12  571  		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
9d057eacf804e2 Mathieu Poirier  2021-03-12 @572  		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
9d057eacf804e2 Mathieu Poirier  2021-03-12  573  
9d057eacf804e2 Mathieu Poirier  2021-03-12  574  		return 0;
9d057eacf804e2 Mathieu Poirier  2021-03-12  575  	}
9d057eacf804e2 Mathieu Poirier  2021-03-12  576  
9d057eacf804e2 Mathieu Poirier  2021-03-12  577  	dev_err(dev, "can't translate da %llx\n", da);
9d057eacf804e2 Mathieu Poirier  2021-03-12  578  
9d057eacf804e2 Mathieu Poirier  2021-03-12  579  	return -EINVAL;
9d057eacf804e2 Mathieu Poirier  2021-03-12  580  }
9d057eacf804e2 Mathieu Poirier  2021-03-12  581  
9d057eacf804e2 Mathieu Poirier  2021-03-12  582  static struct resource_table *
9d057eacf804e2 Mathieu Poirier  2021-03-12  583  stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
9d057eacf804e2 Mathieu Poirier  2021-03-12  584  {
9d057eacf804e2 Mathieu Poirier  2021-03-12  585  	struct stm32_rproc *ddata = rproc->priv;
9d057eacf804e2 Mathieu Poirier  2021-03-12  586  	struct device *dev = rproc->dev.parent;
9d057eacf804e2 Mathieu Poirier  2021-03-12  587  	phys_addr_t rsc_pa;
9d057eacf804e2 Mathieu Poirier  2021-03-12  588  	u32 rsc_da;
9d057eacf804e2 Mathieu Poirier  2021-03-12  589  	int err;
9d057eacf804e2 Mathieu Poirier  2021-03-12  590  
9d057eacf804e2 Mathieu Poirier  2021-03-12  591  	/* The resource table has already been mapped, nothing to do */
9d057eacf804e2 Mathieu Poirier  2021-03-12  592  	if (ddata->rsc_va)
9d057eacf804e2 Mathieu Poirier  2021-03-12  593  		goto done;
9d057eacf804e2 Mathieu Poirier  2021-03-12  594  
9d057eacf804e2 Mathieu Poirier  2021-03-12  595  	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
9d057eacf804e2 Mathieu Poirier  2021-03-12  596  	if (err) {
9d057eacf804e2 Mathieu Poirier  2021-03-12  597  		dev_err(dev, "failed to read rsc tbl addr\n");
9d057eacf804e2 Mathieu Poirier  2021-03-12  598  		return ERR_PTR(-EINVAL);
9d057eacf804e2 Mathieu Poirier  2021-03-12  599  	}
9d057eacf804e2 Mathieu Poirier  2021-03-12  600  
9d057eacf804e2 Mathieu Poirier  2021-03-12  601  	if (!rsc_da)
9d057eacf804e2 Mathieu Poirier  2021-03-12  602  		/* no rsc table */
9d057eacf804e2 Mathieu Poirier  2021-03-12  603  		return ERR_PTR(-ENOENT);
9d057eacf804e2 Mathieu Poirier  2021-03-12  604  
9d057eacf804e2 Mathieu Poirier  2021-03-12  605  	err = stm32_rproc_da_to_pa(rproc, rsc_da, &rsc_pa);
9d057eacf804e2 Mathieu Poirier  2021-03-12  606  	if (err)
9d057eacf804e2 Mathieu Poirier  2021-03-12  607  		return ERR_PTR(err);
9d057eacf804e2 Mathieu Poirier  2021-03-12  608  
9d057eacf804e2 Mathieu Poirier  2021-03-12  609  	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
9d057eacf804e2 Mathieu Poirier  2021-03-12  610  	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
f0b0a4de789d0f Arnd Bergmann    2023-06-09  611  		dev_err(dev, "Unable to map memory region: %pa+%x\n",
9d057eacf804e2 Mathieu Poirier  2021-03-12  612  			&rsc_pa, RSC_TBL_SIZE);
9d057eacf804e2 Mathieu Poirier  2021-03-12  613  		ddata->rsc_va = NULL;
9d057eacf804e2 Mathieu Poirier  2021-03-12  614  		return ERR_PTR(-ENOMEM);
9d057eacf804e2 Mathieu Poirier  2021-03-12  615  	}
9d057eacf804e2 Mathieu Poirier  2021-03-12  616  
9d057eacf804e2 Mathieu Poirier  2021-03-12  617  done:
9d057eacf804e2 Mathieu Poirier  2021-03-12  618  	/* Assuming the resource table fits in 1kB is fair */
9d057eacf804e2 Mathieu Poirier  2021-03-12  619  	*table_sz = RSC_TBL_SIZE;
9d057eacf804e2 Mathieu Poirier  2021-03-12  620  	return (struct resource_table *)ddata->rsc_va;
9d057eacf804e2 Mathieu Poirier  2021-03-12  621  }
9d057eacf804e2 Mathieu Poirier  2021-03-12  622  
1d7e9bc40abb48 Rikard Falkeborn 2020-11-08  623  static const struct rproc_ops st_rproc_ops = {
13140de09cc2dd Fabien Dessenne  2019-05-14  624  	.start		= stm32_rproc_start,
13140de09cc2dd Fabien Dessenne  2019-05-14  625  	.stop		= stm32_rproc_stop,
bee04d4672e0e8 Mathieu Poirier  2020-07-14  626  	.attach		= stm32_rproc_attach,
13140de09cc2dd Fabien Dessenne  2019-05-14  627  	.kick		= stm32_rproc_kick,
13140de09cc2dd Fabien Dessenne  2019-05-14  628  	.load		= rproc_elf_load_segments,
13140de09cc2dd Fabien Dessenne  2019-05-14  629  	.parse_fw	= stm32_rproc_parse_fw,
13140de09cc2dd Fabien Dessenne  2019-05-14  630  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
9d057eacf804e2 Mathieu Poirier  2021-03-12  631  	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
e29ff72b779426 Clement Leger    2020-04-22  632  	.sanity_check	= rproc_elf_sanity_check,
13140de09cc2dd Fabien Dessenne  2019-05-14  633  	.get_boot_addr	= rproc_elf_get_boot_addr,
13140de09cc2dd Fabien Dessenne  2019-05-14  634  };
13140de09cc2dd Fabien Dessenne  2019-05-14  635  
13140de09cc2dd Fabien Dessenne  2019-05-14 @636  static const struct of_device_id stm32_rproc_match[] = {
13140de09cc2dd Fabien Dessenne  2019-05-14  637  	{ .compatible = "st,stm32mp1-m4" },
13140de09cc2dd Fabien Dessenne  2019-05-14  638  	{},
13140de09cc2dd Fabien Dessenne  2019-05-14  639  };
13140de09cc2dd Fabien Dessenne  2019-05-14  640  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
13140de09cc2dd Fabien Dessenne  2019-05-14  641  

:::::: The code at line 636 was first introduced by commit
:::::: 13140de09cc2dd5e5166ad42292bb82af4e23cef remoteproc: stm32: add an ST stm32_rproc driver

:::::: TO: Fabien Dessenne <fabien.dessenne@st.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
