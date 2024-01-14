Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C25D277
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 17:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fc0sY2JN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705253090; x=1736789090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a5Mj4tThEdqRpqjjHdMgMgUbNN7nH+uW4bfMJAu+l/Q=;
  b=fc0sY2JNHHPssiWABV55HiU0cTqPPbob8fQEXY/Bpa5FPM4DqOYQpbwn
   6SHHTSxb/4oZKfeKZtOg66rLUueZYIClcmoIP4tXAmuRHdUwB35XO6d8E
   f7ncvCmLRoH8Q3kE8Dl5u9dX1kHTpsCk3ne+DL2xpPXS++PdoO1wWegHL
   MLVr1HhS1YmFKF8HU6jzVpDRe6F5yBA2r4VkRw/1Likqs/v66SI9LlZ/I
   6OcgMONfzfivMIaHsn81EUj5KmRYN7/M3DiJHR8nizmBDx42JPZynX8Qi
   1g+8T1B1vrihmYdfS9riaNGGGSsnY0kvcynxNqiUTYQfjxTobl5WEAJmG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="398342296"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="398342296"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 09:24:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="906829523"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="906829523"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2024 09:24:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP4E2-000BhQ-0Y;
	Sun, 14 Jan 2024 17:24:46 +0000
Date: Mon, 15 Jan 2024 01:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4454/17888]
 drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared;
 did you mean 'BTF_TYPE_TAG'?
Message-ID: <202401150109.RuqaZ3hF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haiying,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 4b883ce5099a8f46512c2901dd0c6600674bb4f6 [4454/17888] soc: fsl: dpio: change CENA regs to be cacheable
config: arm-randconfig-003-20240113 (https://download.01.org/0day-ci/archive/20240115/202401150109.RuqaZ3hF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150109.RuqaZ3hF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150109.RuqaZ3hF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
   drivers/soc/fsl/dpio/dpio-driver.c:32:41: error: implicit declaration of function '__ioremap'; did you mean 'ioremap'? [-Werror=implicit-function-declaration]
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                         ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/page.h:19,
                    from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/soc/fsl/dpio/dpio-driver.c:10:
>> drivers/soc/fsl/dpio/dpio-driver.c:30:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'BTF_TYPE_TAG'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:30:34: note: each undeclared identifier is reported only once for each function it appears in
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:59: error: 'PTE_PXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:69: error: 'PTE_UXN' undeclared (first use in this function)
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'MAY_WRITE'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:30:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      30 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   arch/arm/include/asm/page-nommu.h:32:26: note: in definition of macro '__pgprot'
      32 | #define __pgprot(x)     (x)
         |                          ^
   drivers/soc/fsl/dpio/dpio-driver.c:32:76: note: in expansion of macro 'PROT_NORMAL_NS'
      32 | #define ioremap_cache_ns(addr, size)    __ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
         |                                                                            ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:209:34: note: in expansion of macro 'ioremap_cache_ns'
     209 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +30 drivers/soc/fsl/dpio/dpio-driver.c

    29	
  > 30	#define PROT_NORMAL_NS		(PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
    31	
  > 32	#define ioremap_cache_ns(addr, size)	__ioremap((addr), (size), __pgprot(PROT_NORMAL_NS))
    33	
    34	
    35	struct dpio_priv {
    36		struct dpaa2_io *io;
    37	};
    38	
    39	static cpumask_var_t cpus_unused_mask;
    40	
    41	static const struct soc_device_attribute ls1088a_soc[] = {
    42		{.family = "QorIQ LS1088A"},
    43		{ /* sentinel */ }
    44	};
    45	
    46	static const struct soc_device_attribute ls2080a_soc[] = {
    47		{.family = "QorIQ LS2080A"},
    48		{ /* sentinel */ }
    49	};
    50	
    51	static const struct soc_device_attribute ls2088a_soc[] = {
    52		{.family = "QorIQ LS2088A"},
    53		{ /* sentinel */ }
    54	};
    55	
    56	static const struct soc_device_attribute lx2160a_soc[] = {
    57		{.family = "QorIQ LX2160A"},
    58		{ /* sentinel */ }
    59	};
    60	
    61	static int dpaa2_dpio_get_cluster_sdest(struct fsl_mc_device *dpio_dev, int cpu)
    62	{
    63		int cluster_base, cluster_size;
    64	
    65		if (soc_device_match(ls1088a_soc)) {
    66			cluster_base = 2;
    67			cluster_size = 4;
    68		} else if (soc_device_match(ls2080a_soc) ||
    69			   soc_device_match(ls2088a_soc) ||
    70			   soc_device_match(lx2160a_soc)) {
    71			cluster_base = 0;
    72			cluster_size = 2;
    73		} else {
    74			dev_err(&dpio_dev->dev, "unknown SoC version\n");
    75			return -1;
    76		}
    77	
    78		return cluster_base + cpu / cluster_size;
    79	}
    80	
    81	static irqreturn_t dpio_irq_handler(int irq_num, void *arg)
    82	{
    83		struct device *dev = (struct device *)arg;
    84		struct dpio_priv *priv = dev_get_drvdata(dev);
    85	
    86		return dpaa2_io_irq(priv->io);
    87	}
    88	
    89	static void unregister_dpio_irq_handlers(struct fsl_mc_device *dpio_dev)
    90	{
    91		struct fsl_mc_device_irq *irq;
    92	
    93		irq = dpio_dev->irqs[0];
    94	
    95		/* clear the affinity hint */
    96		irq_set_affinity_hint(irq->virq, NULL);
    97	}
    98	
    99	static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
   100	{
   101		int error;
   102		struct fsl_mc_device_irq *irq;
   103	
   104		irq = dpio_dev->irqs[0];
   105		error = devm_request_irq(&dpio_dev->dev,
   106					 irq->virq,
   107					 dpio_irq_handler,
   108					 0,
   109					 dev_name(&dpio_dev->dev),
   110					 &dpio_dev->dev);
   111		if (error < 0) {
   112			dev_err(&dpio_dev->dev,
   113				"devm_request_irq() failed: %d\n",
   114				error);
   115			return error;
   116		}
   117	
   118		/* set the affinity hint */
   119		if (irq_set_affinity_hint(irq->virq, cpumask_of(cpu)))
   120			dev_err(&dpio_dev->dev,
   121				"irq_set_affinity failed irq %d cpu %d\n",
   122				irq->virq, cpu);
   123	
   124		return 0;
   125	}
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
   170		desc.qman_clk = dpio_attrs.clk;
   171	
   172		err = dpio_enable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   173		if (err) {
   174			dev_err(dev, "dpio_enable() failed %d\n", err);
   175			goto err_get_attr;
   176		}
   177	
   178		/* initialize DPIO descriptor */
   179		desc.receives_notifications = dpio_attrs.num_priorities ? 1 : 0;
   180		desc.has_8prio = dpio_attrs.num_priorities == 8 ? 1 : 0;
   181		desc.dpio_id = dpio_dev->obj_desc.id;
   182	
   183		/* get the cpu to use for the affinity hint */
   184		possible_next_cpu = cpumask_first(cpus_unused_mask);
   185		if (possible_next_cpu >= nr_cpu_ids) {
   186			dev_err(dev, "probe failed. Number of DPIOs exceeds NR_CPUS.\n");
   187			err = -ERANGE;
   188			goto err_allocate_irqs;
   189		}
   190		desc.cpu = possible_next_cpu;
   191		cpumask_clear_cpu(possible_next_cpu, cpus_unused_mask);
   192	
   193		sdest = dpaa2_dpio_get_cluster_sdest(dpio_dev, desc.cpu);
   194		if (sdest >= 0) {
   195			err = dpio_set_stashing_destination(dpio_dev->mc_io, 0,
   196							    dpio_dev->mc_handle,
   197							    sdest);
   198			if (err)
   199				dev_err(dev, "dpio_set_stashing_destination failed for cpu%d\n",
   200					desc.cpu);
   201		}
   202	
   203		if (dpio_dev->obj_desc.region_count < 3) {
   204			/* No support for DDR backed portals, use classic mapping */
   205			/*
   206			 * Set the CENA regs to be the cache enabled area of the portal to
   207			 * achieve the best performance.
   208			 */
 > 209			desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
   210							resource_size(&dpio_dev->regions[0]));
   211		} else {
   212			desc.regs_cena = devm_memremap(dev, dpio_dev->regions[2].start,
   213						resource_size(&dpio_dev->regions[2]),
   214						MEMREMAP_WB);
   215		}
   216	
   217		if (IS_ERR(desc.regs_cena)) {
   218			dev_err(dev, "ioremap_cache_ns failed\n");
   219			err = PTR_ERR(desc.regs_cena);
   220			goto err_allocate_irqs;
   221		}
   222	
   223		desc.regs_cinh = devm_ioremap(dev, dpio_dev->regions[1].start,
   224					      resource_size(&dpio_dev->regions[1]));
   225		if (!desc.regs_cinh) {
   226			err = -ENOMEM;
   227			dev_err(dev, "devm_ioremap failed\n");
   228			goto err_allocate_irqs;
   229		}
   230	
   231		err = fsl_mc_allocate_irqs(dpio_dev);
   232		if (err) {
   233			dev_err(dev, "fsl_mc_allocate_irqs failed. err=%d\n", err);
   234			goto err_allocate_irqs;
   235		}
   236	
   237		priv->io = dpaa2_io_create(&desc, dev);
   238		if (!priv->io) {
   239			dev_err(dev, "dpaa2_io_create failed\n");
   240			err = -ENOMEM;
   241			goto err_dpaa2_io_create;
   242		}
   243	
   244		err = register_dpio_irq_handlers(dpio_dev, desc.cpu);
   245		if (err)
   246			goto err_register_dpio_irq;
   247	
   248		dev_info(dev, "probed\n");
   249		dev_dbg(dev, "   receives_notifications = %d\n",
   250			desc.receives_notifications);
   251		dpio_close(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   252	
   253		return 0;
   254	
   255	err_dpaa2_io_create:
   256		unregister_dpio_irq_handlers(dpio_dev);
   257	err_register_dpio_irq:
   258		fsl_mc_free_irqs(dpio_dev);
   259	err_allocate_irqs:
   260		dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   261	err_get_attr:
   262	err_reset:
   263		dpio_close(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
   264	err_open:
   265		fsl_mc_portal_free(dpio_dev->mc_io);
   266	err_priv_alloc:
   267		return err;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
