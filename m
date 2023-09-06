Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE9710963
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694020126; x=1725556126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7YlcfEDlfmLhJXQIpgi4oFmssVJJ2+zkRFqWbDsrEo=;
  b=Xyaelth4ceE8+4Dw4+OkJ6N03SodLmsXSZIUYyNqPRQFIM3r+yhl4IEC
   zLkiu0gwNtk4L+u4EbhEMr46G91SY1HKWbYKs/Iht/ITUD3FZ+2wiCshJ
   GhSOdO1asPrifmF7at9V/q/oeWf5CHtJnolKVOetCHovXy4srxPEx32dw
   JknQIN9HLzMq38Cl/IGVX7fQHzVzzaEKonoVGTilpphwsh7vNZ07NTdwq
   8vqK4cfI9vJuOq6V4OS4DJdAE2j0+QH3XitnYMx9suAmJso3NbfLa1U92
   zgmh42GZSCXFXpraTgPOtyfFMBTO1juBa6XMDvYYJo+SGnjL3Trf6wE1I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380928230"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380928230"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072465883"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="1072465883"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 10:08:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdw19-0000Qc-1e;
	Wed, 06 Sep 2023 17:08:39 +0000
Date: Thu, 7 Sep 2023 01:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3829/24606]
 drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: implicit declaration of
 function '__ioremap'
Message-ID: <202309070101.BMp7u76j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: e621849d1464f98a17ed9a39307cc14fc210e8d3 [3829/24606] soc: fsl: dpio: change CENA regs to be cacheable
config: arm-randconfig-r032-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070101.BMp7u76j-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070101.BMp7u76j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070101.BMp7u76j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: implicit declaration of function '__ioremap' [-Werror,-Wimplicit-function-declaration]
                   desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
                                    ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:38: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                           ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror,-Wimplicit-function-declaration]
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:95: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                                                                         ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_TYPE_PAGE'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:26: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                    ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_AF'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:42: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                    ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_PXN'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:51: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                             ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_UXN'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:61: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                                       ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_DIRTY'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:71: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                                                 ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'PTE_WRITE'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:83: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                                                             ^
>> drivers/soc/fsl/dpio/dpio-driver.c:208:20: error: use of undeclared identifier 'MT_NORMAL'
   drivers/soc/fsl/dpio/dpio-driver.c:32:73: note: expanded from macro 'ioremap_cache_ns'
   #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
                                                                              ^
   drivers/soc/fsl/dpio/dpio-driver.c:30:108: note: expanded from macro 'PROT_NORMAL_NS'
   #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
                                                                                                                      ^
   9 errors generated.


vim +/__ioremap +208 drivers/soc/fsl/dpio/dpio-driver.c

   126	
   127	static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
   128	{
   129		struct dpio_attr dpio_attrs;
   130		struct dpaa2_io_desc desc;
   131		struct dpio_priv *priv;
   132		int err = -ENOMEM;
   133		struct device *dev = &dpio_dev->dev;
   134		int possible_next_cpu;
   135		int sdest;
   136	
   137		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   138		if (!priv)
   139			goto err_priv_alloc;
   140	
   141		dev_set_drvdata(dev, priv);
   142	
   143		err = fsl_mc_portal_allocate(dpio_dev, 0, &dpio_dev->mc_io);
   144		if (err) {
   145			dev_dbg(dev, "MC portal allocation failed\n");
   146			err = -EPROBE_DEFER;
   147			goto err_priv_alloc;
   148		}
   149	
   150		err = dpio_open(dpio_dev->mc_io, 0, dpio_dev->obj_desc.id,
   151				&dpio_dev->mc_handle);
   152		if (err) {
   153			dev_err(dev, "dpio_open() failed\n");
   154			goto err_open;
   155		}
   156	
   157		err = dpio_reset(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   158		if (err) {
   159			dev_err(dev, "dpio_reset() failed\n");
   160			goto err_reset;
   161		}
   162	
   163		err = dpio_get_attributes(dpio_dev->mc_io, 0, dpio_dev->mc_handle,
   164					  &dpio_attrs);
   165		if (err) {
   166			dev_err(dev, "dpio_get_attributes() failed %d\n", err);
   167			goto err_get_attr;
   168		}
   169		desc.qman_version = dpio_attrs.qbman_version;
   170	
   171		err = dpio_enable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   172		if (err) {
   173			dev_err(dev, "dpio_enable() failed %d\n", err);
   174			goto err_get_attr;
   175		}
   176	
   177		/* initialize DPIO descriptor */
   178		desc.receives_notifications = dpio_attrs.num_priorities ? 1 : 0;
   179		desc.has_8prio = dpio_attrs.num_priorities == 8 ? 1 : 0;
   180		desc.dpio_id = dpio_dev->obj_desc.id;
   181	
   182		/* get the cpu to use for the affinity hint */
   183		possible_next_cpu = cpumask_first(cpus_unused_mask);
   184		if (possible_next_cpu >= nr_cpu_ids) {
   185			dev_err(dev, "probe failed. Number of DPIOs exceeds NR_CPUS.\n");
   186			err = -ERANGE;
   187			goto err_allocate_irqs;
   188		}
   189		desc.cpu = possible_next_cpu;
   190		cpumask_clear_cpu(possible_next_cpu, cpus_unused_mask);
   191	
   192		sdest = dpaa2_dpio_get_cluster_sdest(dpio_dev, desc.cpu);
   193		if (sdest >= 0) {
   194			err = dpio_set_stashing_destination(dpio_dev->mc_io, 0,
   195							    dpio_dev->mc_handle,
   196							    sdest);
   197			if (err)
   198				dev_err(dev, "dpio_set_stashing_destination failed for cpu%d\n",
   199					desc.cpu);
   200		}
   201	
   202		if (dpio_dev->obj_desc.region_count < 3) {
   203			/* No support for DDR backed portals, use classic mapping */
   204			/*
   205			 * Set the CENA regs to be the cache enabled area of the portal to
   206			 * achieve the best performance.
   207			 */
 > 208			desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
   209							resource_size(&dpio_dev->regions[0]));
   210		} else {
   211			desc.regs_cena = devm_memremap(dev, dpio_dev->regions[2].start,
   212						resource_size(&dpio_dev->regions[2]),
   213						MEMREMAP_WB);
   214		}
   215	
   216		if (IS_ERR(desc.regs_cena)) {
   217			dev_err(dev, "ioremap_cache_ns failed\n");
   218			err = PTR_ERR(desc.regs_cena);
   219			goto err_allocate_irqs;
   220		}
   221	
   222		desc.regs_cinh = devm_ioremap(dev, dpio_dev->regions[1].start,
   223					      resource_size(&dpio_dev->regions[1]));
   224		if (!desc.regs_cinh) {
   225			err = -ENOMEM;
   226			dev_err(dev, "devm_ioremap failed\n");
   227			goto err_allocate_irqs;
   228		}
   229	
   230		err = fsl_mc_allocate_irqs(dpio_dev);
   231		if (err) {
   232			dev_err(dev, "fsl_mc_allocate_irqs failed. err=%d\n", err);
   233			goto err_allocate_irqs;
   234		}
   235	
   236		priv->io = dpaa2_io_create(&desc, dev);
   237		if (!priv->io) {
   238			dev_err(dev, "dpaa2_io_create failed\n");
   239			err = -ENOMEM;
   240			goto err_dpaa2_io_create;
   241		}
   242	
   243		err = register_dpio_irq_handlers(dpio_dev, desc.cpu);
   244		if (err)
   245			goto err_register_dpio_irq;
   246	
   247		dev_info(dev, "probed\n");
   248		dev_dbg(dev, "   receives_notifications = %d\n",
   249			desc.receives_notifications);
   250		dpio_close(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   251	
   252		return 0;
   253	
   254	err_dpaa2_io_create:
   255		unregister_dpio_irq_handlers(dpio_dev);
   256	err_register_dpio_irq:
   257		fsl_mc_free_irqs(dpio_dev);
   258	err_allocate_irqs:
   259		dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   260	err_get_attr:
   261	err_reset:
   262		dpio_close(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   263	err_open:
   264		fsl_mc_portal_free(dpio_dev->mc_io);
   265	err_priv_alloc:
   266		return err;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
