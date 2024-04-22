Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15687131191
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780911; cv=none; b=T0puPi57362rLbmOJB14ZkLFA6XmHw3VEcnA0epRtwmH75Th6eAhuRo2x+6SNTlZfnbtNeIHpXG+pXFsGbm9TxNi10VdfeVxGxhlMV2uek3QfkQX6KAk1GOctdQ5tAS3/s39h1PqKFB630VZrhgwLxeZqzmMNpb9BllzzoX/TXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780911; c=relaxed/simple;
	bh=0ZCSM0jJ68bfISc9Ar8zZxr2TyfUK1WRXr8xgIq34Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrMV9HJTdBQ8NMiOi8NfV+pFvmWEKK08P8FtnGzm2gWLLqF+i8F/acN7IVqHHwa+cAmQEO2uf7AVd5opZox/sfUyVXW5hDbWjiPk8DV2ZN7lbTq0BsyaqV4eHK39VOgkydDaFUUrEmm/4crBeXUJ3hx2zAH049q3IMNu9+etm3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFrP4aI6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFrP4aI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713780909; x=1745316909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZCSM0jJ68bfISc9Ar8zZxr2TyfUK1WRXr8xgIq34Pc=;
  b=SFrP4aI6R9qhu8fRShlPOk00D/JasVAmLP5jYfxlW3ph2+B19qITSmPm
   E89bWvX6be761fJ+MIUqbzu9EC9FG5Avm25FrnOv7Qgh+SDBGI/e7ed/j
   7RRUAkHElBdDdn165PZa2nIBnVqf5dKoYTf7IU8WiPA5jTXoYsGhWvWXH
   nnhwc8vP10cTr7yuFCttsaEYvB8SSyIdjeew5QjAzOu3x3NZMpZIZkOXW
   lI5zLfvyviynDr1nvlXTlfTte1LHivXRCub6kckkbCHAkS/n1rsIkzsvo
   GR1DDet3r8s5ubt5eZA3KisYLdTSyZJ/SkUab6gImXKaa2iQU6ORV3Vsi
   w==;
X-CSE-ConnectionGUID: +Qi7SCmvQpu2iSkRbfSrXw==
X-CSE-MsgGUID: pOXO50f3RBW+yEBhlox4NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20005663"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="20005663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 03:15:08 -0700
X-CSE-ConnectionGUID: pD3gFcZSRCeaafQB3G5IDA==
X-CSE-MsgGUID: jGgA2+ysSoyR+sLD96PtkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="28430954"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2024 03:15:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryqhV-000CTy-0M;
	Mon, 22 Apr 2024 10:15:05 +0000
Date: Mon, 22 Apr 2024 18:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 378/6555]
 drivers/remoteproc/qcom_q6v5_mss.c:1096:27: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202404221830.EmqpdzCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bjorn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 781ba8bb996c991ffb5c4c02fae4e172b8711b52 [378/6555] FROMGIT: remoteproc: qcom: Rename Hexagon v5 modem driver
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240422/202404221830.EmqpdzCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240422/202404221830.EmqpdzCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221830.EmqpdzCQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_mss.c:1096:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mba_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1096:27: sparse:     expected void *mba_region
   drivers/remoteproc/qcom_q6v5_mss.c:1096:27: sparse:     got void [noderef] <asn:2> *
>> drivers/remoteproc/qcom_q6v5_mss.c:1114:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mpss_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1114:28: sparse:     expected void *mpss_region
   drivers/remoteproc/qcom_q6v5_mss.c:1114:28: sparse:     got void [noderef] <asn:2> *
   In file included from drivers/remoteproc/qcom_q6v5_mss.c:24:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'q6v5_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1585:1: note: in expansion of macro 'module_exit'
    1585 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 16-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:1375:1: note: in expansion of macro 'module_platform_driver'
    1375 | module_platform_driver(q6v5_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/dma-mapping.h:7,
                    from drivers/remoteproc/qcom_q6v5_mss.c:20:
   drivers/remoteproc/qcom_q6v5_mss.c:1375:24: note: 'cleanup_module' target declared here
    1375 | module_platform_driver(q6v5_driver);
         |                        ^~~~~~~~~~~
   include/linux/device.h:1581:20: note: in definition of macro 'module_driver'
    1581 | static void __exit __driver##_exit(void) 27-      |                    ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:1375:1: note: in expansion of macro 'module_platform_driver'
    1375 | module_platform_driver(q6v5_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'q6v5_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1580:1: note: in expansion of macro 'module_init'
    1580 | module_init(__driver##_init); 36-      | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 39-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:1375:1: note: in expansion of macro 'module_platform_driver'
    1375 | module_platform_driver(q6v5_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:1375:24: note: 'init_module' target declared here
    1375 | module_platform_driver(q6v5_driver);
         |                        ^~~~~~~~~~~
   include/linux/device.h:1576:19: note: in definition of macro 'module_driver'
    1576 | static int __init __driver##_init(void) 48-      |                   ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:1375:1: note: in expansion of macro 'module_platform_driver'
    1375 | module_platform_driver(q6v5_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c: In function 'q6v5_mpss_load':
   drivers/remoteproc/qcom_q6v5_mss.c:741:70: warning: '%02d' directive output may be truncated writing between 2 and 11 bytes into a region of size 3 [-Wformat-truncation=]
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                                                                      ^~~~
   drivers/remoteproc/qcom_q6v5_mss.c:741:62: note: directive argument in the range [-2147483641, 65534]
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                                                              ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_mss.c:741:25: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     741 |                         snprintf(seg_name, sizeof(seg_name), "modem.b%02d", i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +1096 drivers/remoteproc/qcom_q6v5_mss.c

051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1077  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1078  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1079  {
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1080  	struct device_node *child;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1081  	struct device_node *node;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1082  	struct resource r;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1083  	int ret;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1084  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1085  	child = of_get_child_by_name(qproc->dev->of_node, "mba");
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1086  	node = of_parse_phandle(child, "memory-region", 0);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1087  	ret = of_address_to_resource(node, 0, &r);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1088  	if (ret) {
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1089  		dev_err(qproc->dev, "unable to resolve mba region\n");
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1090  		return ret;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1091  	}
278d744c46fd4f drivers/remoteproc/qcom_q6v5_pil.c Tobias Jordan   2018-02-15  1092  	of_node_put(node);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1093  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1094  	qproc->mba_phys = r.start;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1095  	qproc->mba_size = resource_size(&r);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20 @1096  	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1097  	if (!qproc->mba_region) {
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1098  		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1099  			&r.start, qproc->mba_size);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1100  		return -EBUSY;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1101  	}
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1102  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1103  	child = of_get_child_by_name(qproc->dev->of_node, "mpss");
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1104  	node = of_parse_phandle(child, "memory-region", 0);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1105  	ret = of_address_to_resource(node, 0, &r);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1106  	if (ret) {
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1107  		dev_err(qproc->dev, "unable to resolve mpss region\n");
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1108  		return ret;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1109  	}
278d744c46fd4f drivers/remoteproc/qcom_q6v5_pil.c Tobias Jordan   2018-02-15  1110  	of_node_put(node);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1111  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1112  	qproc->mpss_phys = qproc->mpss_reloc = r.start;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1113  	qproc->mpss_size = resource_size(&r);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20 @1114  	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1115  	if (!qproc->mpss_region) {
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1116  		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1117  			&r.start, qproc->mpss_size);
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1118  		return -EBUSY;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1119  	}
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1120  
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1121  	return 0;
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1122  }
051fb70fd4ea40 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson 2016-06-20  1123  

:::::: The code at line 1096 was first introduced by commit
:::::: 051fb70fd4ea40fbc7139186a4890b2fe5cb1e76 remoteproc: qcom: Driver for the self-authenticating Hexagon v5

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
