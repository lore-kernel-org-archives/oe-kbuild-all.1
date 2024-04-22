Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4618E10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 05:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713764461; cv=none; b=AxVI3VwbBW7fbUwSbI7W6ls87LIaNQ/eKhX+jJ63ECY4REwTq+zhmk9rWDuhLd1n/TiptwbvNnrXKltcR5WVVP2g5aK90IGO/VIxGIJ13dnnKJkKpAHpgguwML+BJmjxgQ5hmyED3xJl4417Zxs84Y3wXzcUh1D7CcKmKVmja5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713764461; c=relaxed/simple;
	bh=lP+yhgNP5ZJe9E3mQ60jBWWokMkkBh8sf0Caqx1T1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWWtdvfUEgk7eHn2jQqFiLQSptCyL/oxVQt22M0AUEmGcyyheqKD4mkAenO5BJFdTZGkHMPS0BagzHDlGFBsBCALW9dljA6I6qOTSBZJQSqkh2aNm+m3IxP43n2j2w1/7ZmIXJDhl2e04+pmRF6CzAj7DgQkhMt29/knvbxg+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIPyT0+7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIPyT0+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713764458; x=1745300458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lP+yhgNP5ZJe9E3mQ60jBWWokMkkBh8sf0Caqx1T1pw=;
  b=TIPyT0+7+OqtRDzlMspCwBqMSwPgyc396785XFBIFpnfPRrXtRptlOWA
   9GWmze+ETgwovEq2J8E8aXz7yv666F7aPo8wqhQQtFFetISSWSC2TBzlu
   5VEGHBsEa2M4hDg6a6dco+Zr9mUIjaBbNuo1Gm1Koonsvnw4wFPZ3pNch
   tO3Em7OdNNxqzgSc5A9lZzEeEW7Y4zdArS3owR4NU1twO9HBOlm6VMrHs
   kQBTMC+vCXYSWNTXPg5l8yHkg/e/29EN9mbfBfHB8kAaSxYvpQBjt8rrp
   mz+NnSg8TD13srYrC9SVStBP4auThmO1fs2/sr7hkgUktKSo40vwPnjjY
   g==;
X-CSE-ConnectionGUID: g22ZoaJmSk6geKx/YuqZqA==
X-CSE-MsgGUID: P3uBnVIxTAuLY+JiPj+TDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="19979103"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="19979103"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:40:58 -0700
X-CSE-ConnectionGUID: /x4gI5QvS/OKQru41vXKWg==
X-CSE-MsgGUID: IOF6rzE+QP6doxCmpy65yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="28678008"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Apr 2024 22:40:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rymQA-000CKw-1U;
	Mon, 22 Apr 2024 05:40:54 +0000
Date: Mon, 22 Apr 2024 13:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 377/6555]
 drivers/remoteproc/qcom_q6v5_pas.c:246:26: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202404221340.Lqi8xUkg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 5e19c1b9d22e9030faf1c1416954d3462cc12ea7 [377/6555] FROMGIT: remoteproc: qcom: Rename Hexagon v5 PAS driver
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221340.Lqi8xUkg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240422/202404221340.Lqi8xUkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221340.Lqi8xUkg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_pas.c:246:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_pas.c:246:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:246:26: sparse:     got void [noderef] <asn:2> *
   In file included from drivers/remoteproc/qcom_q6v5_pas.c:22:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'adsp_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1585:1: note: in expansion of macro 'module_exit'
    1585 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 13-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_pas.c:372:1: note: in expansion of macro 'module_platform_driver'
     372 | module_platform_driver(adsp_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/remoteproc/qcom_q6v5_pas.c:24:
   drivers/remoteproc/qcom_q6v5_pas.c:372:24: note: 'cleanup_module' target declared here
     372 | module_platform_driver(adsp_driver);
         |                        ^~~~~~~~~~~
   include/linux/device.h:1581:20: note: in definition of macro 'module_driver'
    1581 | static void __exit __driver##_exit(void) 26-      |                    ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_pas.c:372:1: note: in expansion of macro 'module_platform_driver'
     372 | module_platform_driver(adsp_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'adsp_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1580:1: note: in expansion of macro 'module_init'
    1580 | module_init(__driver##_init); 35-      | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 38-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_pas.c:372:1: note: in expansion of macro 'module_platform_driver'
     372 | module_platform_driver(adsp_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_pas.c:372:24: note: 'init_module' target declared here
     372 | module_platform_driver(adsp_driver);
         |                        ^~~~~~~~~~~
   include/linux/device.h:1576:19: note: in definition of macro 'module_driver'
    1576 | static int __init __driver##_init(void) 47-      |                   ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_pas.c:372:1: note: in expansion of macro 'module_platform_driver'
     372 | module_platform_driver(adsp_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~

vim +246 drivers/remoteproc/qcom_q6v5_pas.c

b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  227  
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  228  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  229  {
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  230  	struct device_node *node;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  231  	struct resource r;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  232  	int ret;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  233  
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  234  	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  235  	if (!node) {
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  236  		dev_err(adsp->dev, "no memory-region specified\n");
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  237  		return -EINVAL;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  238  	}
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  239  
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  240  	ret = of_address_to_resource(node, 0, &r);
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  241  	if (ret)
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  242  		return ret;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  243  
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  244  	adsp->mem_phys = adsp->mem_reloc = r.start;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  245  	adsp->mem_size = resource_size(&r);
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22 @246  	adsp->mem_region = devm_ioremap_wc(adsp->dev, adsp->mem_phys, adsp->mem_size);
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  247  	if (!adsp->mem_region) {
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  248  		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  249  			&r.start, adsp->mem_size);
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  250  		return -EBUSY;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  251  	}
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  252  
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  253  	return 0;
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  254  }
b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson 2016-08-22  255  

:::::: The code at line 246 was first introduced by commit
:::::: b9e718e950c3dfa458bbf9180a8d8691e55413ae remoteproc: Introduce Qualcomm ADSP PIL

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
