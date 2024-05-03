Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1141C72
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714765612; cv=none; b=cV9zP4og16ljlS2JVGtQtHcu4nhphS6tdXC6w2O1JyQX6BXH5k/QJo/LvJalemu6BhHieqyhQPEbjYjtnxvxklbkgJsVZbQhnDOvDn8JoAn6jT4PBKCQZD3HDbDLShJK+yJ9lVN3JvejlQsWRRjw8NmFq2rqEUHH89HZnzjAcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714765612; c=relaxed/simple;
	bh=Ja9K5GR9yI4lzgg748DBtvhmXTGfenFNvPAX9rHrw3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfL8HDtkOA1OH+GWLCZ5TseYE9lyyXlrXFUT2+ot9sUuyj55bzv38oAM8V7gRSTPAwU4LAej3To2pwXRyE3kgI7XAVapUdINtStRAlb/xhlEmrMcDoVMnOLIdxnyE0VXBNh54FLfrG2yD5HZMhytYppTfA7DOBYOxPKwhoJNaSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSEX3fao; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSEX3fao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714765610; x=1746301610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ja9K5GR9yI4lzgg748DBtvhmXTGfenFNvPAX9rHrw3w=;
  b=BSEX3faooxo9emuRk3dz1sHLcr0v0OhTJODejgXI0EZ0fVes5iMgxZmq
   0Am5tavw4RrUu52o19jmQPBU4YU5IK0ZOBCu9RQWF0FkEywQaD2o0kSM2
   jPj2zUJB91LLGtV3+Or1p6zCkE9PcRZipU/PdnLq1PScNEzL7KhmZEumR
   rEU2nCboNySefhGKxrJCWqxGdFxWVcrhgqXSfLmu/LUIwUBRSfVW5K0gX
   8ZlN32nVX2pH/uAx/TNaIWTph2alc2Z+esXs1f1EwLjxwdEcATZb4Nbfp
   tOhK0/9BgqbE/cuQhnyZSgbBOoje8u+0LbN4iUYcvMnmz7t6vFe373NL4
   A==;
X-CSE-ConnectionGUID: 0nGA61xySAuZRP0gWZS0Hw==
X-CSE-MsgGUID: q6NE3J/MSzeM0b8LoI489A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28115932"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28115932"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:46:50 -0700
X-CSE-ConnectionGUID: 5VB0jKr7SKu90hvTjk8h1w==
X-CSE-MsgGUID: BL40CPjrTmijZFvloLHPkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32021162"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 May 2024 12:46:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2yrm-000C3g-2N;
	Fri, 03 May 2024 19:46:46 +0000
Date: Sat, 4 May 2024 03:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1014/1143]
 drivers/soc/aspeed/rvas/video_main.c:1437:6: warning: variable 'mcr_base' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202405040352.S51iX41G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: f778d27331abc1655c4425fcdee0086a7b81464e [1014/1143] RVAS: add rvas driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040352.S51iX41G-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040352.S51iX41G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040352.S51iX41G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/soc/aspeed/rvas/video_main.c:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/soc/aspeed/rvas/video_main.c:25:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/soc/aspeed/rvas/video_main.c:295:6: warning: no previous prototype for function 'free_all_mem_entries' [-Wmissing-prototypes]
     295 | void free_all_mem_entries(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     295 | void free_all_mem_entries(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:386:5: warning: no previous prototype for function 'get_mem_entry' [-Wmissing-prototypes]
     386 | int get_mem_entry(struct AstRVAS *pAstRVAS)
         |     ^
   drivers/soc/aspeed/rvas/video_main.c:386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     386 | int get_mem_entry(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:416:6: warning: no previous prototype for function 'delete_mem_entry' [-Wmissing-prototypes]
     416 | bool delete_mem_entry(const void *crmh, struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     416 | bool delete_mem_entry(const void *crmh, struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:603:6: warning: no previous prototype for function 'init_osr_es' [-Wmissing-prototypes]
     603 | void init_osr_es(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:603:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     603 | void init_osr_es(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:627:6: warning: no previous prototype for function 'release_osr_es' [-Wmissing-prototypes]
     627 | void release_osr_es(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:627:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     627 | void release_osr_es(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:725:6: warning: no previous prototype for function 'display_event_map' [-Wmissing-prototypes]
     725 | void display_event_map(const struct EventMap *pem)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     725 | void display_event_map(const struct EventMap *pem)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:971:6: warning: no previous prototype for function 'disable_video_engines' [-Wmissing-prototypes]
     971 | void disable_video_engines(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:971:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     971 | void disable_video_engines(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:977:6: warning: no previous prototype for function 'enable_video_engines' [-Wmissing-prototypes]
     977 | void enable_video_engines(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:977:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     977 | void enable_video_engines(struct AstRVAS *pAstRVAS)
         | ^
         | static 
   drivers/soc/aspeed/rvas/video_main.c:983:6: warning: no previous prototype for function 'disable_rvas_engines' [-Wmissing-prototypes]
     983 | void disable_rvas_engines(struct AstRVAS *pAstRVAS)
         |      ^
   drivers/soc/aspeed/rvas/video_main.c:983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     983 | void disable_rvas_engines(struct AstRVAS *pAstRVAS)
         | ^
         | static 
>> drivers/soc/aspeed/rvas/video_main.c:1437:6: warning: variable 'mcr_base' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1437 |         if (!edac_node) {
         |             ^~~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c:1445:28: note: uninitialized use occurs here
    1445 |         set_FBInfo_size(pAstRVAS, mcr_base);
         |                                   ^~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c:1437:2: note: remove the 'if' if its condition is always false
    1437 |         if (!edac_node) {
         |         ^~~~~~~~~~~~~~~~~
    1438 |                 dev_err(&pdev->dev, "cannot find edac node\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1439 |         } else {
         |         ~~~~~~
   drivers/soc/aspeed/rvas/video_main.c:1382:24: note: initialize the variable 'mcr_base' to silence this warning
    1382 |         void __iomem *mcr_base;
         |                               ^
         |                                = NULL
   drivers/soc/aspeed/rvas/video_main.c:1554:18: warning: unused variable 'ast2500_dram_table' [-Wunused-const-variable]
    1554 | static const u32 ast2500_dram_table[] = {
         |                  ^~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/rvas/video_main.c:1561:18: warning: unused variable 'ast2600_dram_table' [-Wunused-const-variable]
    1561 | static const u32 ast2600_dram_table[] = {
         |                  ^~~~~~~~~~~~~~~~~~
   19 warnings generated.


vim +1437 drivers/soc/aspeed/rvas/video_main.c

  1372	
  1373	//
  1374	//
  1375	//
  1376	static int video_drv_probe(struct platform_device *pdev)
  1377	{
  1378		int result = 0;
  1379		struct regmap *sdram_scu;
  1380		struct device_node *dp_node;
  1381		struct device_node *edac_node;
  1382		void __iomem *mcr_base;
  1383	
  1384		pr_info("RVAS driver probe\n");
  1385		pAstRVAS = devm_kzalloc(&pdev->dev, sizeof(struct AstRVAS), GFP_KERNEL);
  1386		VIDEO_DBG("pAstRVAS: 0x%p\n", pAstRVAS);
  1387	
  1388		if (!pAstRVAS) {
  1389			dev_err(pAstRVAS->pdev, "Cannot allocate device structure\n");
  1390			return -ENOMEM;
  1391		}
  1392		pAstRVAS->pdev = (void *)&pdev->dev;
  1393	
  1394		// Get resources
  1395		result = video_drv_get_resources(pdev);
  1396		if (result < 0) {
  1397			dev_err(pAstRVAS->pdev, "video_probe: Error getting resources\n");
  1398			return result;
  1399		}
  1400	
  1401		//get irqs
  1402		result = video_drv_get_irqs(pdev);
  1403		if (result < 0) {
  1404			dev_err(pAstRVAS->pdev, "video_probe: Error getting irqs\n");
  1405			return result;
  1406		}
  1407	
  1408		pAstRVAS->rvas_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
  1409		if (IS_ERR(pAstRVAS->rvas_reset)) {
  1410			dev_err(&pdev->dev, "can't get rvas reset\n");
  1411			return -ENOENT;
  1412		}
  1413	
  1414		pAstRVAS->video_engine_reset = devm_reset_control_get_by_index(&pdev->dev, 1);
  1415		if (IS_ERR(pAstRVAS->video_engine_reset)) {
  1416			dev_err(&pdev->dev, "can't get video engine reset\n");
  1417			return -ENOENT;
  1418		}
  1419	
  1420		//prepare video engine clock
  1421		result = video_drv_get_clock(pdev);
  1422		if (result < 0) {
  1423			dev_err(pAstRVAS->pdev, "video_probe: Error getting clocks\n");
  1424			return result;
  1425		}
  1426	
  1427		dp_node = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-displayport");
  1428		if (!dp_node) {
  1429			dev_err(&pdev->dev, "cannot find dp node\n");
  1430		} else {
  1431			dp_base = of_iomap(dp_node, 0);
  1432			if (!dp_base)
  1433				dev_err(&pdev->dev, "failed to iomem of display port\n");
  1434		}
  1435	
  1436		edac_node = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sdram-edac");
> 1437		if (!edac_node) {
  1438			dev_err(&pdev->dev, "cannot find edac node\n");
  1439		} else {
  1440			mcr_base = of_iomap(edac_node, 0);
  1441			if (!mcr_base)
  1442				dev_err(&pdev->dev, "failed to iomem of MCR\n");
  1443		}
  1444	
  1445		set_FBInfo_size(pAstRVAS, mcr_base);
  1446	
  1447		//scu
  1448		sdram_scu = syscon_regmap_lookup_by_compatible("aspeed,ast2600-scu");
  1449		VIDEO_DBG("sdram_scu: 0x%p\n", sdram_scu);
  1450		if (IS_ERR(sdram_scu)) {
  1451			dev_err(&pdev->dev, "failed to find ast2600-scu regmap\n");
  1452			return PTR_ERR(sdram_scu);
  1453		}
  1454		pAstRVAS->scu = sdram_scu;
  1455	
  1456		result = misc_register(&video_misc);
  1457		if (result) {
  1458			pr_err("Failed in miscellaneous register (err: %d)\n", result);
  1459			return result;
  1460		}
  1461		pr_info("Video misc minor %d\n", video_misc.minor);
  1462	
  1463		if (sysfs_create_group(&pdev->dev.kobj, &rvas_attribute_group)) {
  1464			pr_err("Failed in creating group\n");
  1465			return -1;
  1466		}
  1467	
  1468		VIDEO_DBG("Disabling interrupts...\n");
  1469		disable_grce_tse_interrupt(pAstRVAS);
  1470	
  1471		//reserve memory
  1472		of_reserved_mem_device_init(&pdev->dev);
  1473		result = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
  1474		if (result) {
  1475			dev_err(&pdev->dev, "Failed to set DMA mask\n");
  1476			of_reserved_mem_device_release(&pdev->dev);
  1477		}
  1478	
  1479		// map irqs to irq_handlers
  1480		result = video_drv_map_irqs(pdev);
  1481		if (result < 0) {
  1482			dev_err(pAstRVAS->pdev, "video_probe: Error mapping irqs\n");
  1483			return result;
  1484		}
  1485		VIDEO_DBG("After IRQ registration\n");
  1486	
  1487		platform_set_drvdata(pdev, pAstRVAS);
  1488		pAstRVAS->rvas_dev = &video_misc;
  1489		VIDEO_DBG("pdev: 0x%p dev: 0x%p pAstRVAS: 0x%p rvas_dev: 0x%p\n", pdev,
  1490			  &pdev->dev, pAstRVAS, pAstRVAS->rvas_dev);
  1491	
  1492		init_osr_es(pAstRVAS);
  1493		rvas_init();
  1494		video_engine_reserveMem(pAstRVAS);
  1495		video_engine_init();
  1496	
  1497		pr_info("RVAS: driver successfully loaded.\n");
  1498		return result;
  1499	}
  1500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
