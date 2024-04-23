Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA53EA95
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 23:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713916435; cv=none; b=Ik6qkktCnrWdJpM6lr60TUQM5/2WO8QBt2OfDemoIp++/2KRHmKourSoF2nZ+aZ3g1pVpf74fSFuN6qZ+cUzMdurLbgNT1CASibf/nnxg7cSvu3nDwDbea8GQJAKQO00Ss6Ek+1vnxQwRosRFNSoLt8o1VQ637PWVcnxMovsFzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713916435; c=relaxed/simple;
	bh=kZfS0uRsG/Dm2T9dsA8NXuwSp1lamZJ9Cbqqc6vO+X0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2KE0xEvumTEIlW0uJkFtdrmjVwVbqm7Nqvk2DL/qls/N/hewLTRdN1MiudU/yxuO2tAGtQWMJrONoIWBV4LN2Mh9X9ADQVihv3yEo/yXqxo08+hOmQdPIXDZ45rRvblwtG0W5loxWspAqd6Lk1W/WTxwRa5b7TDpgglZtH5SSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4dS+Pd3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4dS+Pd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713916434; x=1745452434;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kZfS0uRsG/Dm2T9dsA8NXuwSp1lamZJ9Cbqqc6vO+X0=;
  b=R4dS+Pd3P+ze4uAZ60QgdhPOMuljoR7JiTdjCuVNbs62FInQE0xZo0jp
   aXTBK3ptaeRsl7UWivjGwiOJr5cdjxod9JxbSSJsjcSHZKFuEdkzrsYIW
   9yuCtEQB3zjiLgYVOuX6PFYl5oED+Re3bvKYomttUXSW2UmN5MXJYhyp4
   OmI7csDHRy/A27E1WlzV8IzRgxFAar2160dZIuQMwxko+Md9vHPIndNE6
   7wCFAb/vQgIj9K3GsLA6/86mBMTbyrsY/mpUDDdIB4ZwuTqoFfOTtkW+6
   YbYkzw+m9deBLjS69H65ohzu444DdSV6/B5uxouvNT0k7oHBb9ga3Gk+x
   g==;
X-CSE-ConnectionGUID: +23cv+TBQBa4u1dQGxUM+g==
X-CSE-MsgGUID: xRcTFWXmSgmBxQJA8tqOPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9394776"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9394776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 16:53:49 -0700
X-CSE-ConnectionGUID: KJcu3h7TS1eFcgLME8X2Tg==
X-CSE-MsgGUID: /BWZ5wlETui6GtpCITYv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24568681"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2024 16:53:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzPxJ-0000do-2m
	for oe-kbuild-all@lists.linux.dev;
	Tue, 23 Apr 2024 23:53:45 +0000
Date: Wed, 24 Apr 2024 07:53:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1478/6555]
 drivers/remoteproc/qcom_q6v5_adsp.c:384:26: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202404240709.W9CUpyQT-lkp@intel.com>
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
commit: 8f8d231e9e005f1b771101ff86aa5144a140f55f [1478/6555] UPSTREAM: remoteproc: qcom: Introduce Non-PAS ADSP PIL driver
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404240709.W9CUpyQT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240709.W9CUpyQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240709.W9CUpyQT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_adsp.c:384:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_adsp.c:384:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_adsp.c:384:26: sparse:     got void [noderef] <asn:2> *
   In file included from drivers/remoteproc/qcom_q6v5_adsp.c:15:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'adsp_pil_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1585:1: note: in expansion of macro 'module_exit'
    1585 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 13-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_adsp.c:499:1: note: in expansion of macro 'module_platform_driver'
     499 | module_platform_driver(adsp_pil_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/remoteproc/qcom_q6v5_adsp.c:17:
   drivers/remoteproc/qcom_q6v5_adsp.c:499:24: note: 'cleanup_module' target declared here
     499 | module_platform_driver(adsp_pil_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/device.h:1581:20: note: in definition of macro 'module_driver'
    1581 | static void __exit __driver##_exit(void) 26-      |                    ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_adsp.c:499:1: note: in expansion of macro 'module_platform_driver'
     499 | module_platform_driver(adsp_pil_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'adsp_pil_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1580:1: note: in expansion of macro 'module_init'
    1580 | module_init(__driver##_init); 35-      | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, 38-      |         ^~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_adsp.c:499:1: note: in expansion of macro 'module_platform_driver'
     499 | module_platform_driver(adsp_pil_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/remoteproc/qcom_q6v5_adsp.c:499:24: note: 'init_module' target declared here
     499 | module_platform_driver(adsp_pil_driver);
         |                        ^~~~~~~~~~~~~~~
   include/linux/device.h:1576:19: note: in definition of macro 'module_driver'
    1576 | static int __init __driver##_init(void) 47-      |                   ^~~~~~~~
   drivers/remoteproc/qcom_q6v5_adsp.c:499:1: note: in expansion of macro 'module_platform_driver'
     499 | module_platform_driver(adsp_pil_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~

vim +384 drivers/remoteproc/qcom_q6v5_adsp.c

   365	
   366	static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
   367	{
   368		struct device_node *node;
   369		struct resource r;
   370		int ret;
   371	
   372		node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
   373		if (!node) {
   374			dev_err(adsp->dev, "no memory-region specified\n");
   375			return -EINVAL;
   376		}
   377	
   378		ret = of_address_to_resource(node, 0, &r);
   379		if (ret)
   380			return ret;
   381	
   382		adsp->mem_phys = adsp->mem_reloc = r.start;
   383		adsp->mem_size = resource_size(&r);
 > 384		adsp->mem_region = devm_ioremap_wc(adsp->dev,
   385					adsp->mem_phys, adsp->mem_size);
   386		if (!adsp->mem_region) {
   387			dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
   388				&r.start, adsp->mem_size);
   389			return -EBUSY;
   390		}
   391	
   392		return 0;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
