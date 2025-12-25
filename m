Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789093A1E9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766698824; cv=none; b=O7l5uoaDNGGS4JoXQiZJmD+HQAuSPL+0ytVH6tBi9FNglAHd61TpZ4xbr0zrfgisant9j2sOz01RBPy0Yyioqv+YgNX7a2d28kg4ihrhfQIn8W/7TQsZLli5FGwmrgxBtl01dhvVLyhRl2WQNpZcXG8O4BjQC7HB/zyOdw0Xe7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766698824; c=relaxed/simple;
	bh=9t40Ejxfi5fx/z7qxWxy+ESzU3LITjSv/Fy3Zjmy6lU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WrpLl8gJmNvYDaqSMXk2ExPfkGHxe9IVQ/lmHFcaftIGemEkulKWDWH9MaGC7qB9IWCucowPFBrkvKC5vilGWRE3z9y263GXnncPBhrXF7+3CDMnCx6rUcyPv69Dm1nnxl//+IiSSTkGPyynC0YmW9KerKqAyEmpo6pnYiYYjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xmgg7dUs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xmgg7dUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766698822; x=1798234822;
  h=date:from:to:cc:subject:message-id;
  bh=9t40Ejxfi5fx/z7qxWxy+ESzU3LITjSv/Fy3Zjmy6lU=;
  b=Xmgg7dUs1s8SYIOmKW83w/O7fH2FCwLnhr06uxclCf2g4IDu3qespDFS
   WiyamxpstCXI7nW2UC+z9dFmdGCY2h7YmGWVIXhey61qxGQ6PC+R4bKuc
   AyKjDnp7YD3hay6HiqgjMMQ/eWAMth3lv1PyNMBgx20GkQOdP0WYmf4cw
   U3Mc3PXZPteBS1foVEYgxW4sPsHwpiOdbopCNpXZgza9SK+8N3W9RebZ+
   vZAi3Ge/dcdR6xh4OvDXTofvaqr6z3fhUqK4Zffkbnp6kZ+n6jao1KcwY
   SyCCSB9qb/gHiYTEWpdKcFpPJplrSI/ZP0T0pQPdwkdDuRt2dJQquH4rV
   g==;
X-CSE-ConnectionGUID: dHSgrimGSNK7vM+/KdP0Mw==
X-CSE-MsgGUID: b6AquH/jQQe2fp2WClm9bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79117622"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79117622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:40:21 -0800
X-CSE-ConnectionGUID: nO5CGAfyTbWCRzEZ4j4Ndw==
X-CSE-MsgGUID: 7LjR+0TOTqmDgT9ZuEpX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200187266"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2025 13:40:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYt4D-000000004Tl-3pBL;
	Thu, 25 Dec 2025 21:40:17 +0000
Date: Fri, 26 Dec 2025 05:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 47/55]
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c:135:5: warning: format specifies
 type 'unsigned long long' but the argument has type 'dma_addr_t' (aka
 'unsigned int')
Message-ID: <202512260529.IUoR14yt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: b075ffc5fc01b16aa5fbcec10f5920402d301188 [47/55] rvtrace: Add trace ramsink driver
config: riscv-randconfig-r122-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260529.IUoR14yt-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260529.IUoR14yt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260529.IUoR14yt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/hwtracing/rvtrace/rvtrace-ramsink.c:135:5: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                            priv->start, start_min);
                            ^~~~~~~~~~~
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:77: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
                                                                            ~~~~             ^~~~~~~~~
                                                                            %x
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:77: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
                                                                            ~~~~             ^~~~~~~~~
                                                                            %x
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   10 warnings generated.

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/rvtrace/rvtrace-ramsink.c:260:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:260:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:261:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:261:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:262:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:262:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:262:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:262:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +135 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

   107	
   108	static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp)
   109	{
   110		struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
   111		u64 start_min, limit_max, end;
   112		u32 low, high;
   113	
   114		/* Probe min and max values for start and limit registers */
   115		rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
   116		rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
   117		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
   118		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
   119		start_min = (u64)(high) << 32 | low;
   120	
   121		rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
   122		rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   123		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
   124		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   125		limit_max = (u64)(high) << 32 | low;
   126	
   127		if (priv->end < start_min) {
   128			dev_err(&comp->dev, "DMA memory not addressable by device\n");
   129			return -EINVAL;
   130		}
   131	
   132		/* Setup ram sink start addresses */
   133		if (priv->start < start_min) {
   134			dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
 > 135				 priv->start, start_min);
   136			priv->va += start_min - priv->start;
   137			priv->start = start_min;
   138		}
   139	
   140		priv->prev_head = priv->start;
   141		priv->end = priv->start + priv->size;
   142		rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
   143		rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
   144		rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
   145		rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
   146		/* Setup ram sink limit addresses */
   147		if (priv->end > limit_max) {
   148			dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
   149				 limit_max);
   150			priv->end = limit_max;
   151			priv->size = priv->end - priv->start;
   152		}
   153	
   154		/* Limit address needs to be set to end - 4 to avoid overflow */
   155		end = priv->end - 4;
   156		rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
   157		rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
   158		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
   159		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   160		end = (u64)(high) << 32 | low;
   161		if (end != (priv->end - 4)) {
   162			dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
   163				 end);
   164			priv->end = end;
   165			priv->size = priv->end - priv->start;
   166		}
   167	
   168		return 0;
   169	}
   170	
   171	static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
   172	{
   173		struct device *pdev = comp->pdata->dev;
   174		struct rvtrace_ramsink_priv *priv;
   175	
   176		priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
   177		if (!priv)
   178			return -ENOMEM;
   179	
   180		dev_set_drvdata(&comp->dev, priv);
   181	
   182		/* Derive RAM sink memory size based on component implementation ID */
   183		switch (comp->pdata->impid) {
   184		default:
   185			priv->size = SZ_1M;
   186			break;
   187		}
   188	
   189		priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
   190		if (!priv->va)
   191			return -ENOMEM;
   192	
   193		return rvtrace_ramsink_setup_buf(comp);
   194	}
   195	
   196	static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
   197	{
   198		struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
   199	
   200		dma_free_coherent(&comp->dev, priv->size, priv->va, priv->start);
   201	}
   202	
   203	static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
   204	{
   205		int ret;
   206	
   207		ret = rvtrace_ramsink_setup(comp);
   208		if (ret)
   209			return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
   210	
   211		ret = rvtrace_enable_component(comp);
   212		if (ret)
   213			return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
   214	
   215		return ret;
   216	}
   217	
   218	static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
   219	{
   220		int ret;
   221	
   222		ret = rvtrace_disable_component(comp);
   223		if (ret)
   224			dev_err(&comp->dev, "failed to disable ramsink.\n");
   225	
   226		rvtrace_ramsink_cleanup(comp);
   227	}
   228	
   229	static struct rvtrace_component_id rvtrace_ramsink_ids[] = {
   230		{ .type = RVTRACE_COMPONENT_TYPE_RAMSINK,
   231		  .version = rvtrace_component_mkversion(1, 0), },
   232		{},
   233	};
   234	
   235	static struct rvtrace_driver rvtrace_ramsink_driver = {
   236		.id_table = rvtrace_ramsink_ids,
   237		.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
   238		.stop = rvtrace_ramsink_stop,
   239		.probe = rvtrace_ramsink_probe,
   240		.remove = rvtrace_ramsink_remove,
   241		.driver = {
   242			.name = "rvtrace-ramsink",
   243		},
   244	};
   245	
   246	static int __init rvtrace_ramsink_init(void)
   247	{
   248		return rvtrace_register_driver(&rvtrace_ramsink_driver);
   249	}
   250	
   251	static void __exit rvtrace_ramsink_exit(void)
   252	{
   253		rvtrace_unregister_driver(&rvtrace_ramsink_driver);
   254	}
   255	
   256	module_init(rvtrace_ramsink_init);
   257	module_exit(rvtrace_ramsink_exit);
   258	
   259	/* Module information */
 > 260	MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
