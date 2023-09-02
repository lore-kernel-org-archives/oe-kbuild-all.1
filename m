Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92417D2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693638553; x=1725174553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDvfxpkFs2R7tqNTyOCJxLLtIiUqCKKs0KF3ggaqZIg=;
  b=mXkW6CqBRPu1iImPHuZ35dI7SCSq6vWeas3PrTqkkh2yB1CneaxVr1JA
   m/3iKAfs54Wgy2s6IweYwlwwFRFGWb+odrfHHquS8OSC0XJbzcGB2PDIZ
   cG9XvYBqiCfvh6pw98FbIxbWe6+3wsc6UgcXOotMUjG23Y1r9db1yYSj5
   wctJC8WAseEjfeXjXY7XP7xMwNyHy0FmfnTB1qvHsU+9NFLIL116agAz7
   QwRZwH9J3PItt9txeqxOforO97CGCMqm3V1IzJfNy2Yl1UsAMPVyc2fuN
   xXQzeOCHli80EGsDgWPdm1zbeWuPI7+m+6hWkp01D4PS5G9CjHun/D55Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440325995"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="440325995"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 00:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986918016"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="986918016"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 00:09:11 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcKkn-00026L-1c;
	Sat, 02 Sep 2023 07:09:09 +0000
Date: Sat, 2 Sep 2023 15:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 16/68]
 drivers/char/xilinx_hwicap/xilinx_hwicap.c:731:37: error: 'op' undeclared;
 did you mean 'up'?
Message-ID: <202309021501.ykX3AGMi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   9ece0c059fa7600e46d8e2deecc2fa1bd86cde7e
commit: d94927fa9e5037f54d34add695e789862d4e5d0a [16/68] char: xilinx_hwicap: Use device_get_match_data()
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20230902/202309021501.ykX3AGMi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021501.ykX3AGMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021501.ykX3AGMi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/xilinx_hwicap/xilinx_hwicap.c: In function 'hwicap_drv_probe':
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:731:37: error: 'op' undeclared (first use in this function); did you mean 'up'?
     731 |         rc = of_address_to_resource(op->dev.of_node, 0, &res);
         |                                     ^~
         |                                     up
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:731:37: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:731:57: error: passing argument 3 of 'of_address_to_resource' from incompatible pointer type [-Werror=incompatible-pointer-types]
     731 |         rc = of_address_to_resource(op->dev.of_node, 0, &res);
         |                                                         ^~~~
         |                                                         |
         |                                                         struct resource **
   In file included from drivers/char/xilinx_hwicap/xilinx_hwicap.c:88:
   include/linux/of_address.h:63:52: note: expected 'struct resource *' but argument is of type 'struct resource **'
      63 |                                   struct resource *r);
         |                                   ~~~~~~~~~~~~~~~~~^
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:742:9: error: 'regs' undeclared (first use in this function); did you mean 'res'?
     742 |         regs = &v4_config_registers;
         |         ^~~~
         |         res
>> drivers/char/xilinx_hwicap/xilinx_hwicap.c:755:54: error: passing argument 3 of 'hwicap_setup' from incompatible pointer type [-Werror=incompatible-pointer-types]
     755 |         return hwicap_setup(&op->dev, id ? *id : -1, &res, config, regs);
         |                                                      ^~~~
         |                                                      |
         |                                                      struct resource **
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:600:40: note: expected 'const struct resource *' but argument is of type 'struct resource **'
     600 |                 const struct resource *regs_res,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:755:60: error: passing argument 4 of 'hwicap_setup' from incompatible pointer type [-Werror=incompatible-pointer-types]
     755 |         return hwicap_setup(&op->dev, id ? *id : -1, &res, config, regs);
         |                                                            ^~~~~~
         |                                                            |
         |                                                            const struct config_registers *
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:601:52: note: expected 'const struct hwicap_driver_config *' but argument is of type 'const struct config_registers *'
     601 |                 const struct hwicap_driver_config *config,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/char/xilinx_hwicap/xilinx_hwicap.c:756:1: error: control reaches end of non-void function [-Werror=return-type]
     756 | }
         | ^
   cc1: some warnings being treated as errors


vim +731 drivers/char/xilinx_hwicap/xilinx_hwicap.c

ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  720  
d94927fa9e5037 Rob Herring          2023-09-01  721  static int hwicap_drv_probe(struct platform_device *pdev)
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  722  {
d94927fa9e5037 Rob Herring          2023-09-01  723  	struct resource *res;
d94927fa9e5037 Rob Herring          2023-09-01  724  	const struct config_registers *config;
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  725  	const char *family;
d94927fa9e5037 Rob Herring          2023-09-01  726  	const unsigned int *id;
55f19d56742a7b Grant Likely         2011-02-22  727  	int rc;
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  728  
d94927fa9e5037 Rob Herring          2023-09-01  729  	config = device_get_match_data(&pdev->dev);
55f19d56742a7b Grant Likely         2011-02-22  730  
55f19d56742a7b Grant Likely         2011-02-22 @731  	rc = of_address_to_resource(op->dev.of_node, 0, &res);
55f19d56742a7b Grant Likely         2011-02-22  732  	if (rc) {
55f19d56742a7b Grant Likely         2011-02-22  733  		dev_err(&op->dev, "invalid address\n");
55f19d56742a7b Grant Likely         2011-02-22  734  		return rc;
55f19d56742a7b Grant Likely         2011-02-22  735  	}
55f19d56742a7b Grant Likely         2011-02-22  736  
55f19d56742a7b Grant Likely         2011-02-22  737  	id = of_get_property(op->dev.of_node, "port-number", NULL);
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  738  
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  739  	/* It's most likely that we're using V4, if the family is not
5cb95fae7a326f Nava kishore Manne   2017-07-28  740  	 * specified
5cb95fae7a326f Nava kishore Manne   2017-07-28  741  	 */
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06 @742  	regs = &v4_config_registers;
55f19d56742a7b Grant Likely         2011-02-22  743  	family = of_get_property(op->dev.of_node, "xlnx,family", NULL);
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  744  
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  745  	if (family) {
5cb95fae7a326f Nava kishore Manne   2017-07-28  746  		if (!strcmp(family, "virtex2p"))
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  747  			regs = &v2_config_registers;
5cb95fae7a326f Nava kishore Manne   2017-07-28  748  		else if (!strcmp(family, "virtex4"))
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  749  			regs = &v4_config_registers;
5cb95fae7a326f Nava kishore Manne   2017-07-28  750  		else if (!strcmp(family, "virtex5"))
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  751  			regs = &v5_config_registers;
5cb95fae7a326f Nava kishore Manne   2017-07-28  752  		else if (!strcmp(family, "virtex6"))
73eb94a094e54c Daniel Borkmann      2012-04-18  753  			regs = &v6_config_registers;
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  754  	}
d94927fa9e5037 Rob Herring          2023-09-01 @755  	return hwicap_setup(&op->dev, id ? *id : -1, &res, config, regs);
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  756  }
ef141a0bb0dc61 Stephen Neuendorffer 2008-02-06  757  

:::::: The code at line 731 was first introduced by commit
:::::: 55f19d56742a7b544e80b47339c17bfcfd0ff3b4 dt: xilinx_hwicap: merge platform and of_platform driver bindings

:::::: TO: Grant Likely <grant.likely@secretlab.ca>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
