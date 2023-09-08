Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EAD1867
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 07:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694159637; x=1725695637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MnK1TwQGilSLN+EKH0s/ulij5AAWhKZ2bdQ0zlMK4+4=;
  b=nTk13k6O/NRtDM8HbRlKBBpOCXgM7d1FDohNoGSpbHjKYpmc5FCM5NYq
   +1jZvqbl2auRonztH5d9cFyfOmCx3EjpSAFIa08m1zVViRoqgg+Wb7mmB
   yxDlli9LPVK7BhQk5xgxnIV03SKAJU6Qapg1Mw9eBbFgTYPOdhGGEApua
   GOqihVEyyOtn4uN25g6+P1/oRzwQPFk8hm7nlh93KK/2+E6qfYKlEQJq7
   fXO5s38/IGLF4pem7Rr4DBfyUUQPOLMFx1WqcSbYseEHvui6/dyDtuJO8
   4fjFyJteyNYv3I11LU4maaCWemRzKWLpwa3u0y1FXNWQ87HAJRiV073f7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357050979"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="357050979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 00:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="989163092"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="989163092"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 00:53:55 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeWJN-00022d-0X;
	Fri, 08 Sep 2023 07:53:53 +0000
Date: Fri, 8 Sep 2023 15:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:isp/heap-alloc 130/132]
 drivers/media/platform/apple/isp/isp-drv.c:116:16: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 2 has type
 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202309081508.zSszYFdd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   d5548fd857a3ca9087e974c8e73d6f487b11c94b
commit: 0b076abdfbca374da4e01d40f74eda178e438dc3 [130/132] isp: Use preallocated heap
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20230908/202309081508.zSszYFdd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081508.zSszYFdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081508.zSszYFdd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from include/linux/iommu.h:10,
                    from drivers/media/platform/apple/isp/isp-drv.c:12:
   drivers/media/platform/apple/isp/isp-drv.c: In function 'apple_isp_init_iommu':
>> drivers/media/platform/apple/isp/isp-drv.c:116:16: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~
         |                                        |
         |                                        phys_addr_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/media/platform/apple/isp/isp-drv.c:116:9: note: in expansion of macro 'printk'
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |         ^~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:116:28: note: format string is defined here
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                         ~~~^
         |                            |
         |                            long long unsigned int
         |                         %x
>> drivers/media/platform/apple/isp/isp-drv.c:116:16: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~             ~~~~~~~~~
         |                                                   |
         |                                                   size_t {aka unsigned int}
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/media/platform/apple/isp/isp-drv.c:116:9: note: in expansion of macro 'printk'
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |         ^~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:116:34: note: format string is defined here
     116 |         printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %x
   drivers/media/platform/apple/isp/isp-drv.c: At top level:
   drivers/media/platform/apple/isp/isp-drv.c:333:34: warning: 'apple_isp_hw_t8110' defined but not used [-Wunused-const-variable=]
     333 | static const struct apple_isp_hw apple_isp_hw_t8110 = {
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:306:34: warning: 'apple_isp_hw_t6000' defined but not used [-Wunused-const-variable=]
     306 | static const struct apple_isp_hw apple_isp_hw_t6000 = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +116 drivers/media/platform/apple/isp/isp-drv.c

    78	
    79	static int apple_isp_init_iommu(struct apple_isp *isp)
    80	{
    81		struct device *dev = isp->dev;
    82		phys_addr_t heap_base;
    83		size_t heap_size;
    84		u64 vm_size;
    85		int err;
    86		int idx;
    87		int size;
    88		struct device_node *mem_node;
    89		const __be32 *maps, *end;
    90	
    91		isp->domain = iommu_get_domain_for_dev(isp->dev);
    92		if (!isp->domain)
    93			return -EPROBE_DEFER;
    94		isp->shift = __ffs(isp->domain->pgsize_bitmap);
    95	
    96		idx = of_property_match_string(dev->of_node, "memory-region-names", "heap");
    97		mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
    98		if (!mem_node) {
    99			dev_err(dev, "No memory-region found for heap\n");
   100			return -ENODEV;
   101		}
   102	
   103		maps = of_get_property(mem_node, "iommu-addresses", &size);
   104		if (!maps || !size) {
   105			dev_err(dev, "No valid iommu-addresses found for heap\n");
   106			return -ENODEV;
   107		}
   108	
   109		end = maps + size / sizeof(__be32);
   110	
   111		while (maps < end) {
   112			maps++;
   113			maps = of_translate_dma_region(dev->of_node, maps, &heap_base, &heap_size);
   114		}
   115	
 > 116		printk("heap: 0x%llx 0x%lx\n", heap_base, heap_size);
   117	
   118		isp->fw.heap_top = heap_base + heap_size;
   119	
   120		err = of_property_read_u64(dev->of_node, "apple,dart-vm-size",
   121					   &vm_size);
   122		if (err) {
   123			dev_err(dev, "failed to read 'apple,dart-vm-size': %d\n", err);
   124			return err;
   125		}
   126	
   127		drm_mm_init(&isp->iovad, isp->fw.heap_top, vm_size - heap_base);
   128	
   129		apple_isp_iommu_sync_ttbr(isp);
   130	
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
