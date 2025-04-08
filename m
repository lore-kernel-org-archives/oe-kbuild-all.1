Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B3B35973
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087110; cv=none; b=RCoKoIA8L0HPlbOBiUegYvycDUvVSqIB4QPPRESf3m3ALIBWmywH2LsqTY7XQ8JhHgKSyan/xREPSC5N7q7ORN0tdvQ/rXPFQ1+xaHpbxLaJdd08KaXhz563S4NJuXzs5l/FptnuWB9+qXRof49MPmmNyea0u0kJNoXS6YQsDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087110; c=relaxed/simple;
	bh=iJDADu2knRwH1wKFgS7AbUORlaOcN2a2XHzTP3U+fWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ac9GoCUWAyKoWK/BHZTA3cnQirGF5eljdsvIVT0oaPl5YfR4TwhFs4/02lrDWSZ/oubOPD0c5gcc17h1MCQwXlZmvlkn1p2wfKICc2JzDp2YMh3JLW06Esst5LU+rzGJ3rG3MgJOyJETe6zAzUkywnZOZ42v6pKw4e8JAKXUixg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cb5glupf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cb5glupf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744087108; x=1775623108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJDADu2knRwH1wKFgS7AbUORlaOcN2a2XHzTP3U+fWY=;
  b=Cb5glupfiWPtl7MJWdjUul0wjYrHudq3iBlY0qU1tsxlyCWQWNnicYO0
   zV7E/VQXVDAlKfU2VsC6x40e7rsJ6GyKQo9vjGJqMRNzLdMzCGTdTsxEe
   j9mfLUe0dp1goMoUCuLL1urVhCwK40nVYMwhJo+2cVhRGZi4OgFMJ1UmO
   R7tnQmBMfQNBW3wQxYGIGw59FfB+XP65HDq9nefDE3bYHTSOxeISjTwga
   j0NDZnJW5zeQJ8k52Eox2kVV8IHbdRS0a5jbUnTeOs91AES+wfRbZwmxz
   CTMAssy5JULYce/ZmDKJpMpuN9xgEQ1nN6MC8QiSsNc7KLO8leYaROvc1
   w==;
X-CSE-ConnectionGUID: JseNu9gyTTmq71GQaPOG2g==
X-CSE-MsgGUID: s2Bvo7m+QoStkU21pQO+KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44749791"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="44749791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 21:38:26 -0700
X-CSE-ConnectionGUID: jAM8bA42S+eMXEAzDakDrw==
X-CSE-MsgGUID: lK9zlJ5BRKKDgE5lFj8H9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128127830"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2025 21:38:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u20j9-00047T-0L;
	Tue, 08 Apr 2025 04:38:23 +0000
Date: Tue, 8 Apr 2025 12:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1568/1568]
 drivers/spi/spi-phytium-plat.c:122:8: error: implicit declaration of
 function 'gpiod_count'
Message-ID: <202504081227.W3mx0ZSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1568/1568] spi: add phytium spi support
config: x86_64-randconfig-104-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081227.W3mx0ZSS-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081227.W3mx0ZSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081227.W3mx0ZSS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:122:8: error: implicit declaration of function 'gpiod_count' [-Werror,-Wimplicit-function-declaration]
     122 |                 n =  gpiod_count(&pdev->dev, "cs");
         |                      ^
   drivers/spi/spi-phytium-plat.c:122:8: note: did you mean 'cpuid_count'?
   arch/x86/include/asm/processor.h:620:20: note: 'cpuid_count' declared here
     620 | static inline void cpuid_count(unsigned int op, int count,
         |                    ^
>> drivers/spi/spi-phytium-plat.c:128:12: error: implicit declaration of function 'devm_gpiod_get_index_optional' [-Werror,-Wimplicit-function-declaration]
     128 |                         gpiod = devm_gpiod_get_index_optional(&pdev->dev,
         |                                 ^
>> drivers/spi/spi-phytium-plat.c:129:17: error: use of undeclared identifier 'GPIOD_OUT_LOW'
     129 |                                                         "cs", i, GPIOD_OUT_LOW);
         |                                                                  ^
>> drivers/spi/spi-phytium-plat.c:136:14: error: implicit declaration of function 'desc_to_gpio' [-Werror,-Wimplicit-function-declaration]
     136 |                         cs_gpio = desc_to_gpio(gpiod);
         |                                   ^
   drivers/spi/spi-phytium-plat.c:136:14: note: did you mean 'irq_to_gpio'?
   include/linux/gpio.h:236:19: note: 'irq_to_gpio' declared here
     236 | static inline int irq_to_gpio(unsigned irq)
         |                   ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
   Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
   Selected by [m]:
   - SPI_PHYTIUM_PLAT [=m] && SPI [=y] && SPI_MASTER [=y]


vim +/gpiod_count +122 drivers/spi/spi-phytium-plat.c

    37	
    38	static int phytium_spi_probe(struct platform_device *pdev)
    39	{
    40		struct phytium_spi_clk *ftsc;
    41		struct phytium_spi *fts;
    42		struct resource *mem;
    43		int ret;
    44		int num_cs;
    45		int cs_gpio;
    46		int global_cs;
    47		int i;
    48	
    49		ftsc = devm_kzalloc(&pdev->dev, sizeof(struct phytium_spi_clk),
    50				GFP_KERNEL);
    51		if (!ftsc)
    52			return -ENOMEM;
    53	
    54		fts = &ftsc->fts;
    55	
    56		mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    57		if (!mem) {
    58			dev_err(&pdev->dev, "no mem resource?\n");
    59			return -EINVAL;
    60		}
    61	
    62		fts->regs = devm_ioremap_resource(&pdev->dev, mem);
    63		if (IS_ERR(fts->regs)) {
    64			dev_err(&pdev->dev, "SPI region map failed\n");
    65			return PTR_ERR(fts->regs);
    66		}
    67	
    68		fts->irq = platform_get_irq(pdev, 0);
    69		if (fts->irq < 0) {
    70			dev_err(&pdev->dev, "no irq resource?\n");
    71			return fts->irq; /* -ENXIO */
    72		}
    73	
    74		if (pdev->dev.of_node) {
    75			ftsc->clk = devm_clk_get(&pdev->dev, NULL);
    76	
    77			if (IS_ERR(ftsc->clk))
    78				return PTR_ERR(ftsc->clk);
    79			ret = clk_prepare_enable(ftsc->clk);
    80			if (ret)
    81				return ret;
    82	
    83			fts->max_freq = clk_get_rate(ftsc->clk);
    84		} else if (has_acpi_companion(&pdev->dev)) {
    85			fts->max_freq = 48000000;
    86		}
    87	
    88		fts->bus_num = pdev->id;
    89		device_property_read_u32(&pdev->dev,
    90				"reg-io-width", &fts->reg_io_width);
    91	
    92		num_cs = 4;
    93	
    94		device_property_read_u32(&pdev->dev, "num-cs", &num_cs);
    95	
    96		fts->num_cs = num_cs;
    97	
    98		if (pdev->dev.of_node) {
    99			int i;
   100	
   101			for (i = 0; i < fts->num_cs; i++) {
   102				cs_gpio = of_get_named_gpio(pdev->dev.of_node,
   103						"cs-gpios", i);
   104	
   105				if (cs_gpio == -EPROBE_DEFER) {
   106					ret = cs_gpio;
   107					goto out;
   108				}
   109	
   110				if (gpio_is_valid(cs_gpio)) {
   111					ret = devm_gpio_request(&pdev->dev, cs_gpio,
   112							dev_name(&pdev->dev));
   113					if (ret)
   114						goto out;
   115				}
   116			}
   117		} else if (has_acpi_companion(&pdev->dev)) {
   118			int n;
   119			int *cs;
   120			struct gpio_desc *gpiod;
   121	
 > 122			n =  gpiod_count(&pdev->dev, "cs");
   123	
   124			cs = devm_kcalloc(&pdev->dev, n, sizeof(int), GFP_KERNEL);
   125			fts->cs = cs;
   126	
   127			for (i = 0; i < n; i++) {
 > 128				gpiod = devm_gpiod_get_index_optional(&pdev->dev,
 > 129								"cs", i, GPIOD_OUT_LOW);
   130	
   131				if (IS_ERR(gpiod)) {
   132					ret = PTR_ERR(gpiod);
   133					goto out;
   134				}
   135	
 > 136				cs_gpio = desc_to_gpio(gpiod);
   137				cs[i] = cs_gpio;
   138			}
   139		}
   140	
   141		device_property_read_u32(&pdev->dev, "global-cs", &global_cs);
   142		fts->global_cs = global_cs;
   143	
   144		ret = phytium_spi_add_host(&pdev->dev, fts);
   145		if (ret)
   146			goto out;
   147	
   148		platform_set_drvdata(pdev, ftsc);
   149		return 0;
   150	
   151	out:
   152		clk_disable_unprepare(ftsc->clk);
   153		return ret;
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
