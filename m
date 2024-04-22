Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4891146A6A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 17:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713806635; cv=none; b=LLkdgCr8c5s07lFCq8J7dgq9pcj1zMbcP3dJoxQzS/ipgXLCaqsy7T4qVxdktm/jDi9edAy9lod1BJLSOgfiioqOR2Jp+ImlFdCcjXsdKh0VQRxw9n9h9XOoo7vf5rdqrUMHOgh/JutTRmg3wgCvoQZqDQr3akACZOQq78hIDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713806635; c=relaxed/simple;
	bh=8z00Xze8Wfc1gjfc9kwqSR7umnTqTlDMSX0/b06emtU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZo7NBRyb9wjuyx+wx+XnPou2vIznobHOWzqixDBRPLOsJpBCZvY6RakUJNGTAIn0Uk6BvvBiWQ6EOBEnArQDWK5TcKDsMdhw8UYKSBGW4RjAKV8nrzONdHN8NcPl4L6aMdBzxnczKCWpIFAe5Jv7SctrmNrDuUXF1xYiQ+iM94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjlsL2NM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjlsL2NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713806634; x=1745342634;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8z00Xze8Wfc1gjfc9kwqSR7umnTqTlDMSX0/b06emtU=;
  b=VjlsL2NM07Y550CEUgDzhIU1EWkHEqkImL79Pkf45TRPNiRo3bMtkwPD
   hOMtSJuK4h0Cqx7Kdctocol4f2U0DN8w06ReSNgS5qBEwTKG3yZQODQR7
   Aco7UrIW9tET9wpiE52UYIlOEvx73hFAk38mfd0Sm6AAC+pjrEejcGB3A
   uE3ch3EfQ3YzIRLFxe2C01l7e1uKSafT0eQHvUpPvOAGnIAIt6z1xsF30
   IV8Y/krd4MglK844adtYzBM/3GYjKgPyQhtgbr8qPVw9fBSxiKRxW5TsS
   IomoQT9dqEO5TindBbyslyfDfq4hgkW+27MlOWWt8blPba0kFIQ9L0K9B
   w==;
X-CSE-ConnectionGUID: vAGOv+LtQXKgZuXa7ZmRFQ==
X-CSE-MsgGUID: XBS6A3qNTUeas8hwEDlVzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19967623"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="19967623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 10:23:36 -0700
X-CSE-ConnectionGUID: 922lsAPkRb+6al8EfdaTFQ==
X-CSE-MsgGUID: +S6QcfPGRy+iB1EEn/n7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="28740124"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Apr 2024 10:23:35 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryxO9-00008m-0B
	for oe-kbuild-all@lists.linux.dev;
	Mon, 22 Apr 2024 17:23:33 +0000
Date: Tue, 23 Apr 2024 01:23:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1478/6555]
 drivers/remoteproc/qcom_q6v5_adsp.c:384:26: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202404230143.CngHsZJM-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240423/202404230143.CngHsZJM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404230143.CngHsZJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230143.CngHsZJM-lkp@intel.com/

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
