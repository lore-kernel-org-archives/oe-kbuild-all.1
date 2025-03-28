Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B946B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 04:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743136271; cv=none; b=Hq4RJiK0Muz9oQ7MYOYnX3e4Fn1GzPAFmNLcAzP9zgd4LpBBZakbjQffZEyD4/Sh8RDIzfdwZy/+Gj7/9xgewNpTw5Yl1t2u1/k6+tqb9ChKzrfS7CJCmhbHBnCIz84BJXzKagHF0FCZnil3vG9kf2sgRheT4MUfGwQBtjNy5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743136271; c=relaxed/simple;
	bh=09BNolcDnEOyazOuVIRWmZrcaT3/gCLreqxN3NrzpdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAzOUnVuhgoa8Pg7h8CycgXSuLust2eyO3l3faA2ltP9ClyKmdmpKXudYaiehiOQnwPX9mFeTYnfKxx3/3OH9pNesV0SeSlIlYa6RIDFa728NkSFHVTlNxNVoAWf/weHV9TWpmk4lgpct1bc3P+tFyt/7N8Lrc8NJZreqhuW12w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWM2XvII; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWM2XvII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743136268; x=1774672268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09BNolcDnEOyazOuVIRWmZrcaT3/gCLreqxN3NrzpdA=;
  b=UWM2XvIIunbQtbRDh1chlJ2xsBpkH0KV9ziU0MGnotx/uILkxnay9EkN
   VQvAsX3QzCuOhkPUOXMlCiFUPoYKXYhwoU6RSGKAqfKZUb4AtkDgU3Ebq
   MaUpgBBCaZrXy1o4wL66YXKD4t9aSgHVaTdHE2xW5a9gtgv8Wer2V46kK
   ftNKqtbCetvSS0fwcMLAzjMqSTJE3v4WeTnD/LD377F0qAzPPIef+G9DN
   kVxb6rplExiX1m6JY9Hp1s267PgefguKi38Td9iS/A64dkAGeLi3y0YCT
   k5ktxD/83wRNB7J/PYtADnCj0q5nobtZQxBWsTVC+LKvbejDH4YQMgWOF
   g==;
X-CSE-ConnectionGUID: yUGoe7RSSO6OKaVf5qrVdg==
X-CSE-MsgGUID: Oj/f1UOcSrmQXBSL2btlnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="62024124"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="62024124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 21:31:08 -0700
X-CSE-ConnectionGUID: RYcB/61vTgS6mf4vt0sS2w==
X-CSE-MsgGUID: IAGog663TMCjpeP3Qvotpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130199353"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 21:31:07 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ty1N2-00078c-29;
	Fri, 28 Mar 2025 04:31:04 +0000
Date: Fri, 28 Mar 2025 12:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 498/498]
 drivers/cpufreq/mediatek-cpufreq-hw_main.c:620:63-68: WARNING: conversion to
 bool not needed here
Message-ID: <202503281257.BmX4sfnQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   971c23c737d79895eb40ddbbed5817f6ee6ea162
commit: 3c107c736a59f5d566bc0d7ef4910c92040f0017 [498/498] CHROMIUM: cpufreq: Add cpufreq-hw drivers for MT8196
config: arm-randconfig-r061-20250328 (https://download.01.org/0day-ci/archive/20250328/202503281257.BmX4sfnQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503281257.BmX4sfnQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/mediatek-cpufreq-hw_main.c:620:63-68: WARNING: conversion to bool not needed here
--
>> drivers/cpufreq/mediatek-cpufreq-hw_fdvfs.c:77:1-7: ERROR: missing put_device; call of_find_device_by_node on line 54, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_fdvfs.c:83:1-7: ERROR: missing put_device; call of_find_device_by_node on line 54, but without a corresponding object release within this function.
--
>> drivers/cpufreq/mediatek-cpufreq-hw_main.c:583:2-8: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:589:2-8: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:627:3-9: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:636:3-9: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:643:3-9: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:649:4-10: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:656:4-10: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:664:2-8: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:669:1-7: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.
   drivers/cpufreq/mediatek-cpufreq-hw_main.c:673:1-7: ERROR: missing put_device; call of_find_device_by_node on line 574, but without a corresponding object release within this function.

vim +620 drivers/cpufreq/mediatek-cpufreq-hw_main.c

   551	
   552	static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
   553	{
   554		struct device_node *cpu_np;
   555		struct device_node *hvfs_node, *csram_sys_node;
   556		struct of_phandle_args args;
   557		struct resource *csram_res;
   558		struct platform_device *pdev_c;
   559		static void __iomem *csram_base;
   560		const u16 *offsets;
   561		unsigned int cpu;
   562		int ret;
   563	
   564		offsets = of_device_get_match_data(&pdev->dev);
   565		if (!offsets)
   566			return -EINVAL;
   567	
   568		hvfs_node = of_find_compatible_node(NULL, NULL, "mediatek,cpufreq-hybrid");
   569		if (!hvfs_node) {
   570			dev_err(&pdev->dev, "failed to find node @ %s\n", __func__);
   571			return -ENODEV;
   572		}
   573	
 > 574		pdev_c = of_find_device_by_node(hvfs_node);
   575		if (!pdev_c) {
   576			dev_err(&pdev->dev, "failed to find pdev @ %s\n", __func__);
   577			return -EINVAL;
   578		}
   579	
   580		csram_res = platform_get_resource(pdev_c, IORESOURCE_MEM, 1);
   581		if (!csram_res) {
   582			dev_err(&pdev->dev, "failed to get mem resource @ %s\n", __func__);
 > 583			return -ENODEV;
   584		}
   585	
   586		if (!request_mem_region(csram_res->start, resource_size(csram_res),
   587				csram_res->name)) {
   588			dev_err(&pdev->dev, "failed to request resource %pR\n", csram_res);
   589			return -EBUSY;
   590		}
   591	
   592		csram_base = ioremap(csram_res->start, resource_size(csram_res));
   593		if (!csram_base) {
   594			dev_err(&pdev->dev, "failed to map csram_base @ %s\n", __func__);
   595			ret = -ENOMEM;
   596			goto release_region;
   597		}
   598	
   599		csram_sys_node = of_parse_phandle(hvfs_node, "csram-sys-base", 0);
   600		if (csram_sys_node != NULL) {
   601			static void __iomem *csram_sys_base;
   602	
   603			csram_sys_base = of_iomap(csram_sys_node, 0);
   604			if (readl_relaxed(csram_sys_base) != CHECK_VAL ||
   605			    !readl_relaxed(csram_sys_base + CSRAM_BASE_ADD +
   606					   cpufreq_mtk_offsets[REG_FREQ_HW_STATE])) {
   607				dev_err(&pdev->dev, "%s: cpufreq hardware not enable\n", __func__);
   608				ret = -EIO;
   609				iounmap(csram_base);
   610				goto release_region;
   611			}
   612			dev_dbg(&pdev->dev, "%s: cpufreq hardware enable\n", __func__);
   613		}
   614	
   615		if (readl_relaxed(csram_base + REG_FREQ_SCALING)){
   616			freq_scaling_disabled = false;
   617			iounmap(csram_base);
   618			release_mem_region(csram_res->start, resource_size(csram_res));
   619		}
 > 620		fdvfs_enabled = check_fdvfs_support(&pdev->dev) == 1 ? true : false;
   621		per_core_enabled = check_per_core_enabled(&pdev->dev);
   622	
   623		if (per_core_enabled) {
   624			per_core_base = ioremap(csram_res->start + PER_CORE_OFF, PER_CORE_SIZE);
   625			if (!per_core_base) {
   626				dev_err(&pdev->dev, "failed to map per_core_base @ %s\n", __func__);
   627				return -ENOMEM;
   628			}
   629		}
   630	
   631		for_each_possible_cpu(cpu) {
   632			cpu_np = of_cpu_device_node_get(cpu);
   633			if (!cpu_np) {
   634				dev_err(&pdev->dev, "Failed to get cpu %d device\n",
   635					cpu);
   636				return -ENODEV;
   637			}
   638	
   639			ret = of_parse_phandle_with_args(cpu_np, "performance-domains",
   640							 "#performance-domain-cells", 0,
   641							 &args);
   642			if (ret < 0)
   643				return ret;
   644	
   645			if (per_core_enabled) {
   646				ret = mtk_per_core_cpu_resources_init(pdev, cpu, args.args[0], offsets);
   647				if (ret) {
   648					dev_err(&pdev->dev, "per-core CPUFreq resource init failed\n");
   649					return ret;
   650				}
   651			} else {
   652				/* Get the bases of cpufreq for domains */
   653				ret = mtk_cpu_resources_init(pdev, cpu, args.args[0], offsets);
   654				if (ret) {
   655					dev_err(&pdev->dev, "CPUFreq resource init failed\n");
   656					return ret;
   657				}
   658			}
   659		}
   660	
   661		ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
   662		if (ret) {
   663			dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
   664			return ret;
   665		}
   666		register_die_notifier(&die_blk);
   667		atomic_notifier_chain_register(&panic_notifier_list, &panic_blk);
   668	
   669		return 0;
   670	
   671	release_region:
   672		release_mem_region(csram_res->start, resource_size(csram_res));
   673		return ret;
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
