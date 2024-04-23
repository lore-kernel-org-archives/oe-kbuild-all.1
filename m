Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2A13E020
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713889540; cv=none; b=aKmwxrOk7GTTpF+q0VNm2yoQLJ73rc3EXs7M39F0nBgaU7ZqVL+mhWFQDHtAzXuJBdZBo3RO3+c+LvoFVSWyucCUkfEAVOGeLBzQ4pwM3sZI1gM7tVEA6Ti6Qin93UDeWNdU9fsbXuBm6EtHlfpp2F5262ebRdGGkCEtMupedXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713889540; c=relaxed/simple;
	bh=9rPx59ZmZKUBPHzudNnA3aD08LTdkx91EZR02kxoux0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YTxjdy18L0t5Ixwk6E4f3E+gy/zAP3a7Xrag9i9bLOQYml1WtBw9ha+krjEs5LRxOwSrsd2/rFhKxDg3MjdRqGUqLyIT7ddDMZSTOiO4VlUGqR52J74zscYDU4VqTUCWJnc3+UiVn/tQ4os5RHgyfDQk50n809p2V/4mSYIIIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHhI8YJp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHhI8YJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713889538; x=1745425538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rPx59ZmZKUBPHzudNnA3aD08LTdkx91EZR02kxoux0=;
  b=FHhI8YJp/RlL6ns53BRoRMWFAMNLhWkhW0yXkxseBGZhEjXOK5ERSsyq
   9TTunw9kR9j43JFcDUhkUzL5A/Kupl3kMegHftkdQuh1ybj8jgDlwblDK
   j04lq5fF10FO+NHWHMROnchl3dlkIunapUPffqOLvJ0KsuW3sCLSYVNOy
   rnlA/Io5W6YiSCRT8seqbApJM/Qg4FnGCLn5f4C/NByMOPXVs5I53rpET
   subvv2/DHcVs9Bn158qLqsH6khUjRsFiqaMradvekhtIQjvUM9fkPDstx
   wosignwY2NtOuPWHAWZ41OavljDI1KJ5ddcwrS+G2N42vMx1AHcKpD0qP
   A==;
X-CSE-ConnectionGUID: 2B8Mx98/TmGXcHv2Fp+8Sw==
X-CSE-MsgGUID: VD0q7GuaSaqIUp0DvWahmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9335302"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9335302"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:25:37 -0700
X-CSE-ConnectionGUID: wh6/HtE3S0ChENCiUEoc2g==
X-CSE-MsgGUID: EbC3mmZaSpCYBZi8YtK9WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55396235"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2024 09:25:36 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzIxZ-0000Jg-2R;
	Tue, 23 Apr 2024 16:25:33 +0000
Date: Wed, 24 Apr 2024 00:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 378/6555]
 drivers/remoteproc/qcom_q6v5_mss.c:1096:27: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202404240050.g2a05gBI-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404240050.g2a05gBI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240050.g2a05gBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240050.g2a05gBI-lkp@intel.com/

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
