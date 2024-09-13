Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799D4BA2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 19:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255702; cv=none; b=VWl1UnQddlMIRXFzNkZaGlu0puIghrPqJTWuRtCdgf8JwKvwZwOY6WHs4wW/k/ONkKkWroLRwUgntyaQwL9F6BoOiboKKquNHiVL+mm28Ev+G+SxMsxwWbTtjQuymU8fPqA1W9S9ypuLZcITab+ZJkYpw2zssFB4Nst+jNT9Bvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255702; c=relaxed/simple;
	bh=nAFbR7abra0BZYB6LFWKSdJzsqfz9M0rIzt/PXqvAAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLM16JpBYvLb3hYMeMKYThFGsf5qvKWGuK6TyHAzHD8vIORavrkwc4xrKGdWphD9c63zal1NVVzSeiVFipox4q1Cpr4FjoQh59070VoYGMBjfHx2v+vAp1eTZU00osjUmkx+YSLTBCSure8/PvEN4XTLFMB5kfZGzlNJHEPMO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8PaYggx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8PaYggx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255700; x=1757791700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nAFbR7abra0BZYB6LFWKSdJzsqfz9M0rIzt/PXqvAAU=;
  b=I8PaYggxZG1mlXUefTE7EcAfU6lWMyF5SGSFKDtxcu8figXxHpDafXb6
   bF8esbPIcaz+oemVmACGIv/fyMKaLSk/Hdd3AfsK/v+AxJxFdgNF1mXad
   latj2Oh1qwp+O5WYbmBKJBkaTk+IM7vZjYbqSCuCmf+NHYAvGOGvOACbY
   UAN5vjMZNj/OKTZshVP8alke0Ytm4UDv5pvvBmPbQ+GSLaMd2rylutCU6
   YDhE9tuKsdZu6JoaOZxo/S/xRrbxROInuCtyAY2slZRQHqL+ZsXHSBM8F
   5xWT3/qaWaUchBSMGryaGE8REw8UITUaCxjottPXWBQ4Pp07aJBWKo+zy
   A==;
X-CSE-ConnectionGUID: l6/u+jLYS+CFDAYHbrQcFA==
X-CSE-MsgGUID: 4T425PbqRoatYJcHd7FL/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13517154"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="13517154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:28:20 -0700
X-CSE-ConnectionGUID: wnZWsATSSf+8+SYZ+rt4DA==
X-CSE-MsgGUID: 0urTNAb0Sdy3z3RnebY3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="72764317"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 12:28:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spBxo-0006u2-0M;
	Fri, 13 Sep 2024 19:28:16 +0000
Date: Sat, 14 Sep 2024 03:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guneshwor Singh <guneshwor.o.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"Shah, Hardik T" <hardik.t.shah@intel.com>
Subject: [intel-lts:4.19/android_s 804/30000]
 sound/soc/intel/fpga/hda_intel_cnl_fpga.c:189:16: warning: cast to pointer
 from integer of different size
Message-ID: <202409140345.7b5ZSI8y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 52b1cd7d118231b0c57a4c42c8522ea51d6ab77a [804/30000] Add facility to load ROM via debugfs
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409140345.7b5ZSI8y-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140345.7b5ZSI8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140345.7b5ZSI8y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/intel/fpga/hda_intel_cnl_fpga.c: In function 'hda_intel_cnl_fpga_probe':
>> sound/soc/intel/fpga/hda_intel_cnl_fpga.c:189:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     189 |                (void *)pci_resource_start(pdev, 0));
         |                ^
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:193:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     193 |                (void *)pci_resource_start(pdev, 1));
         |                ^
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:197:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     197 |                (void *)pci_resource_start(pdev, 2));
         |                ^
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:201:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     201 |                (void *)pci_resource_start(pdev, 3));
         |                ^
   In file included from sound/soc/intel/fpga/hda_intel_cnl_fpga.c:17:
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c: At top level:
   include/linux/module.h:139:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'hda_intel_cnl_fpga_driver_exit': 'cold' [-Wmissing-attributes]
     139 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1609:1: note: in expansion of macro 'module_exit'
    1609 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/pci.h:1298:9: note: in expansion of macro 'module_driver'
    1298 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:1: note: in expansion of macro 'module_pci_driver'
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/pci.h:31,
                    from sound/soc/intel/fpga/hda_intel_cnl_fpga.c:18:
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:19: note: 'cleanup_module' target declared here
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1605:20: note: in definition of macro 'module_driver'
    1605 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:1: note: in expansion of macro 'module_pci_driver'
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:133:13: warning: 'init_module' specifies less restrictive attribute than its target 'hda_intel_cnl_fpga_driver_init': 'cold' [-Wmissing-attributes]
     133 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1604:1: note: in expansion of macro 'module_init'
    1604 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/pci.h:1298:9: note: in expansion of macro 'module_driver'
    1298 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:1: note: in expansion of macro 'module_pci_driver'
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         | ^~~~~~~~~~~~~~~~~
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:19: note: 'init_module' target declared here
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1600:19: note: in definition of macro 'module_driver'
    1600 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   sound/soc/intel/fpga/hda_intel_cnl_fpga.c:271:1: note: in expansion of macro 'module_pci_driver'
     271 | module_pci_driver(hda_intel_cnl_fpga_driver);
         | ^~~~~~~~~~~~~~~~~


vim +189 sound/soc/intel/fpga/hda_intel_cnl_fpga.c

   166	
   167	static int hda_intel_cnl_fpga_probe(struct pci_dev *pdev,
   168			const struct pci_device_id *pci_id)
   169	{
   170		struct hda_intel_cnl_fpga_dev *fpgadev;
   171		int ret = 0;
   172	
   173		ret = pci_enable_device(pdev);
   174		if (ret) {
   175			dev_err(&pdev->dev, "%s: pci_enable_device failed: %d\n",
   176				__func__, ret);
   177			return ret;
   178		}
   179	
   180		fpgadev = kzalloc(sizeof(struct hda_intel_cnl_fpga_dev), GFP_KERNEL);
   181		if (!fpgadev) {
   182			dev_err(&pdev->dev, "%s: kzalloc failed, aborting.\n",
   183				__func__);
   184			ret = -ENOMEM;
   185			goto err_alloc;
   186		}
   187	
   188		printk(KERN_INFO "%s: bar: 0, start 0x%p\n", __func__,
 > 189		       (void *)pci_resource_start(pdev, 0));
   190		printk(KERN_INFO "%s: bar: 0, flags 0x%lx\n", __func__,
   191		       pci_resource_flags(pdev, 0));
   192		printk(KERN_INFO "%s: bar: 1, start 0x%p\n", __func__,
   193		       (void *)pci_resource_start(pdev, 1));
   194		printk(KERN_INFO "%s: bar: 1, flags 0x%lx\n", __func__,
   195		       pci_resource_flags(pdev, 1));
   196		printk(KERN_INFO "%s: bar: 2, start 0x%p\n", __func__,
   197		       (void *)pci_resource_start(pdev, 2));
   198		printk(KERN_INFO "%s: bar: 2, flags 0x%lx\n", __func__,
   199		       pci_resource_flags(pdev, 2));
   200		printk(KERN_INFO "%s: bar: 3, start 0x%p\n", __func__,
   201		       (void *)pci_resource_start(pdev, 3));
   202		printk(KERN_INFO "%s: bar: 3, flags 0x%lx\n", __func__,
   203		       pci_resource_flags(pdev, 3));
   204	
   205		fpgadev->rom_mem_base
   206			= pci_ioremap_bar(pdev, HDA_INTEL_CNL_FPGA_ROM_BAR_IDX);
   207		printk("%s: bar: 0x%p\n", __func__, fpgadev->rom_mem_base);
   208		if (!fpgadev->rom_mem_base) {
   209			dev_err(&pdev->dev, "%s: ioremap failed, aborting\n",
   210				__func__);
   211			ret = -ENXIO;
   212			goto err_map;
   213		}
   214	
   215		fpgadev->pdev = pdev;
   216	
   217		pci_set_drvdata(pdev, fpgadev);
   218	
   219		if (!debugfs_create_file("cnl_oed_rom", 0644, NULL,
   220			fpgadev, &hda_intel_cnl_fpga_rom_fops)) {
   221			dev_err(&pdev->dev, "%s: cannot create debugfs entry.\n",
   222				__func__);
   223			ret = -ENODEV;
   224			goto err_map;
   225		}
   226	
   227		return ret;
   228	
   229	err_map:
   230		if (fpgadev->rom_mem_base) {
   231			iounmap(fpgadev->rom_mem_base);
   232			fpgadev->rom_mem_base = NULL;
   233		}
   234		kfree(fpgadev);
   235	err_alloc:
   236		pci_disable_device(pdev);
   237		return ret;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
