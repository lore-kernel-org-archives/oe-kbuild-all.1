Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5917AD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573720; x=1725109720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1Ok2PMrdq2uMJEioUoQq5lcLJG/P0WVfMcUkyXaKVs=;
  b=jpsXzsiQ4D4nUtRn83zgsCxEqefCnTi277W1R09aR+u9MCJiT0aeQdb8
   Zk1WI4c7uZsJmkmxx6Maa9XOYUgNddH6/QRrD1OqTcKiaWlvP++MCx8zZ
   fsRnH4EUvTEouOunp0TdDjUznbPS5UtELFQvmZp63Owf3F1GIDXGjBVp/
   1o1C1faJRA6A8sMlpJmkoWRDFhslaABbfYIlmUpyN8IjVBEmN3qD7vXnd
   4lnRBKSqEYbMSeK+Cl55azYmKgpUfjutX0mes+3eZxJe1X979+Frqmt6o
   h3EhApmxvRkohnTXureegn6o+vRzSGUol8oWw7m19ZLDFHlZ7tserc5FG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366441043"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366441043"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913684928"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="913684928"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 06:08:38 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc3t6-0001J4-2i;
	Fri, 01 Sep 2023 13:08:36 +0000
Date: Fri, 1 Sep 2023 21:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 8/8] drivers/phy/realtek/phy-rtk-usb2.c:1072:35:
 warning: initialization of 'struct rtk_phy *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202309012028.tpuMCIDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   a143793949161ccf952d0b50ee37e442cf8c02e9
commit: a143793949161ccf952d0b50ee37e442cf8c02e9 [8/8] of: header cleanups
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309012028.tpuMCIDE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012028.tpuMCIDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012028.tpuMCIDE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/realtek/phy-rtk-usb2.c: In function 'rtk_usb2phy_probe':
   drivers/phy/realtek/phy-rtk-usb2.c:1016:35: error: invalid use of undefined type 'struct platform_device'
    1016 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/phy/realtek/phy-rtk-usb2.c:1032:48: error: invalid use of undefined type 'struct platform_device'
    1032 |         rtk_phy->dev                    = &pdev->dev;
         |                                                ^~
   drivers/phy/realtek/phy-rtk-usb2.c:1047:9: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'regulator_set_drvdata'? [-Werror=implicit-function-declaration]
    1047 |         platform_set_drvdata(pdev, rtk_phy);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         regulator_set_drvdata
   drivers/phy/realtek/phy-rtk-usb2.c: In function 'rtk_usb2phy_remove':
   drivers/phy/realtek/phy-rtk-usb2.c:1072:35: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'regulator_get_drvdata'? [-Werror=implicit-function-declaration]
    1072 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   regulator_get_drvdata
>> drivers/phy/realtek/phy-rtk-usb2.c:1072:35: warning: initialization of 'struct rtk_phy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/phy/realtek/phy-rtk-usb2.c: At top level:
   drivers/phy/realtek/phy-rtk-usb2.c:1317:15: error: variable 'rtk_usb2phy_driver' has initializer but incomplete type
    1317 | static struct platform_driver rtk_usb2phy_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1318:10: error: 'struct platform_driver' has no member named 'probe'
    1318 |         .probe          = rtk_usb2phy_probe,
         |          ^~~~~
>> drivers/phy/realtek/phy-rtk-usb2.c:1318:27: warning: excess elements in struct initializer
    1318 |         .probe          = rtk_usb2phy_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1318:27: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1319:10: error: 'struct platform_driver' has no member named 'remove_new'
    1319 |         .remove_new     = rtk_usb2phy_remove,
         |          ^~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1319:27: warning: excess elements in struct initializer
    1319 |         .remove_new     = rtk_usb2phy_remove,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1319:27: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1320:10: error: 'struct platform_driver' has no member named 'driver'
    1320 |         .driver         = {
         |          ^~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1320:27: error: extra brace group at end of initializer
    1320 |         .driver         = {
         |                           ^
   drivers/phy/realtek/phy-rtk-usb2.c:1320:27: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1320:27: warning: excess elements in struct initializer
   drivers/phy/realtek/phy-rtk-usb2.c:1320:27: note: (near initialization for 'rtk_usb2phy_driver')
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:1: warning: data definition has no type or storage class
    1326 | module_platform_driver(rtk_usb2phy_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1326:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/phy/realtek/phy-rtk-usb2.c:1326:1: warning: parameter names (without types) in function declaration
   drivers/phy/realtek/phy-rtk-usb2.c:1317:31: error: storage size of 'rtk_usb2phy_driver' isn't known
    1317 | static struct platform_driver rtk_usb2phy_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb2.c:1317:31: warning: 'rtk_usb2phy_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
--
   drivers/phy/realtek/phy-rtk-usb3.c: In function 'rtk_usb3phy_probe':
   drivers/phy/realtek/phy-rtk-usb3.c:570:35: error: invalid use of undefined type 'struct platform_device'
     570 |         struct device *dev = &pdev->dev;
         |                                   ^~
   drivers/phy/realtek/phy-rtk-usb3.c:586:48: error: invalid use of undefined type 'struct platform_device'
     586 |         rtk_phy->dev                    = &pdev->dev;
         |                                                ^~
   drivers/phy/realtek/phy-rtk-usb3.c:601:9: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'regulator_set_drvdata'? [-Werror=implicit-function-declaration]
     601 |         platform_set_drvdata(pdev, rtk_phy);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         regulator_set_drvdata
   drivers/phy/realtek/phy-rtk-usb3.c: In function 'rtk_usb3phy_remove':
   drivers/phy/realtek/phy-rtk-usb3.c:625:35: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'regulator_get_drvdata'? [-Werror=implicit-function-declaration]
     625 |         struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
         |                                   ^~~~~~~~~~~~~~~~~~~~
         |                                   regulator_get_drvdata
>> drivers/phy/realtek/phy-rtk-usb3.c:625:35: warning: initialization of 'struct rtk_phy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/phy/realtek/phy-rtk-usb3.c: At top level:
   drivers/phy/realtek/phy-rtk-usb3.c:753:15: error: variable 'rtk_usb3phy_driver' has initializer but incomplete type
     753 | static struct platform_driver rtk_usb3phy_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:754:10: error: 'struct platform_driver' has no member named 'probe'
     754 |         .probe          = rtk_usb3phy_probe,
         |          ^~~~~
>> drivers/phy/realtek/phy-rtk-usb3.c:754:27: warning: excess elements in struct initializer
     754 |         .probe          = rtk_usb3phy_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:754:27: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:755:10: error: 'struct platform_driver' has no member named 'remove_new'
     755 |         .remove_new     = rtk_usb3phy_remove,
         |          ^~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:755:27: warning: excess elements in struct initializer
     755 |         .remove_new     = rtk_usb3phy_remove,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:755:27: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:756:10: error: 'struct platform_driver' has no member named 'driver'
     756 |         .driver         = {
         |          ^~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:756:27: error: extra brace group at end of initializer
     756 |         .driver         = {
         |                           ^
   drivers/phy/realtek/phy-rtk-usb3.c:756:27: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:756:27: warning: excess elements in struct initializer
   drivers/phy/realtek/phy-rtk-usb3.c:756:27: note: (near initialization for 'rtk_usb3phy_driver')
>> drivers/phy/realtek/phy-rtk-usb3.c:762:1: warning: data definition has no type or storage class
     762 | module_platform_driver(rtk_usb3phy_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:762:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/phy/realtek/phy-rtk-usb3.c:762:1: warning: parameter names (without types) in function declaration
   drivers/phy/realtek/phy-rtk-usb3.c:753:31: error: storage size of 'rtk_usb3phy_driver' isn't known
     753 | static struct platform_driver rtk_usb3phy_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-usb3.c:753:31: warning: 'rtk_usb3phy_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +1072 drivers/phy/realtek/phy-rtk-usb2.c

134e6d25f6bd06 Stanley Chang 2023-07-25  1012  
134e6d25f6bd06 Stanley Chang 2023-07-25  1013  static int rtk_usb2phy_probe(struct platform_device *pdev)
134e6d25f6bd06 Stanley Chang 2023-07-25  1014  {
134e6d25f6bd06 Stanley Chang 2023-07-25  1015  	struct rtk_phy *rtk_phy;
134e6d25f6bd06 Stanley Chang 2023-07-25  1016  	struct device *dev = &pdev->dev;
134e6d25f6bd06 Stanley Chang 2023-07-25  1017  	struct phy *generic_phy;
134e6d25f6bd06 Stanley Chang 2023-07-25  1018  	struct phy_provider *phy_provider;
134e6d25f6bd06 Stanley Chang 2023-07-25  1019  	const struct phy_cfg *phy_cfg;
134e6d25f6bd06 Stanley Chang 2023-07-25  1020  	int ret = 0;
134e6d25f6bd06 Stanley Chang 2023-07-25  1021  
134e6d25f6bd06 Stanley Chang 2023-07-25  1022  	phy_cfg = of_device_get_match_data(dev);
134e6d25f6bd06 Stanley Chang 2023-07-25  1023  	if (!phy_cfg) {
134e6d25f6bd06 Stanley Chang 2023-07-25  1024  		dev_err(dev, "phy config are not assigned!\n");
134e6d25f6bd06 Stanley Chang 2023-07-25  1025  		return -EINVAL;
134e6d25f6bd06 Stanley Chang 2023-07-25  1026  	}
134e6d25f6bd06 Stanley Chang 2023-07-25  1027  
134e6d25f6bd06 Stanley Chang 2023-07-25  1028  	rtk_phy = devm_kzalloc(dev, sizeof(*rtk_phy), GFP_KERNEL);
134e6d25f6bd06 Stanley Chang 2023-07-25  1029  	if (!rtk_phy)
134e6d25f6bd06 Stanley Chang 2023-07-25  1030  		return -ENOMEM;
134e6d25f6bd06 Stanley Chang 2023-07-25  1031  
134e6d25f6bd06 Stanley Chang 2023-07-25  1032  	rtk_phy->dev			= &pdev->dev;
134e6d25f6bd06 Stanley Chang 2023-07-25  1033  	rtk_phy->phy.dev		= rtk_phy->dev;
134e6d25f6bd06 Stanley Chang 2023-07-25  1034  	rtk_phy->phy.label		= "rtk-usb2phy";
134e6d25f6bd06 Stanley Chang 2023-07-25  1035  	rtk_phy->phy.notify_port_status = rtk_phy_notify_port_status;
134e6d25f6bd06 Stanley Chang 2023-07-25  1036  
134e6d25f6bd06 Stanley Chang 2023-07-25  1037  	rtk_phy->phy_cfg = devm_kzalloc(dev, sizeof(*phy_cfg), GFP_KERNEL);
134e6d25f6bd06 Stanley Chang 2023-07-25  1038  
134e6d25f6bd06 Stanley Chang 2023-07-25  1039  	memcpy(rtk_phy->phy_cfg, phy_cfg, sizeof(*phy_cfg));
134e6d25f6bd06 Stanley Chang 2023-07-25  1040  
134e6d25f6bd06 Stanley Chang 2023-07-25  1041  	rtk_phy->num_phy = phy_cfg->num_phy;
134e6d25f6bd06 Stanley Chang 2023-07-25  1042  
134e6d25f6bd06 Stanley Chang 2023-07-25  1043  	ret = parse_phy_data(rtk_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1044  	if (ret)
134e6d25f6bd06 Stanley Chang 2023-07-25  1045  		goto err;
134e6d25f6bd06 Stanley Chang 2023-07-25  1046  
134e6d25f6bd06 Stanley Chang 2023-07-25 @1047  	platform_set_drvdata(pdev, rtk_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1048  
134e6d25f6bd06 Stanley Chang 2023-07-25  1049  	generic_phy = devm_phy_create(rtk_phy->dev, NULL, &ops);
134e6d25f6bd06 Stanley Chang 2023-07-25  1050  	if (IS_ERR(generic_phy))
134e6d25f6bd06 Stanley Chang 2023-07-25  1051  		return PTR_ERR(generic_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1052  
134e6d25f6bd06 Stanley Chang 2023-07-25  1053  	phy_set_drvdata(generic_phy, rtk_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1054  
134e6d25f6bd06 Stanley Chang 2023-07-25  1055  	phy_provider = devm_of_phy_provider_register(rtk_phy->dev,
134e6d25f6bd06 Stanley Chang 2023-07-25  1056  						     of_phy_simple_xlate);
134e6d25f6bd06 Stanley Chang 2023-07-25  1057  	if (IS_ERR(phy_provider))
134e6d25f6bd06 Stanley Chang 2023-07-25  1058  		return PTR_ERR(phy_provider);
134e6d25f6bd06 Stanley Chang 2023-07-25  1059  
134e6d25f6bd06 Stanley Chang 2023-07-25  1060  	ret = usb_add_phy_dev(&rtk_phy->phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1061  	if (ret)
134e6d25f6bd06 Stanley Chang 2023-07-25  1062  		goto err;
134e6d25f6bd06 Stanley Chang 2023-07-25  1063  
134e6d25f6bd06 Stanley Chang 2023-07-25  1064  	create_debug_files(rtk_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1065  
134e6d25f6bd06 Stanley Chang 2023-07-25  1066  err:
134e6d25f6bd06 Stanley Chang 2023-07-25  1067  	return ret;
134e6d25f6bd06 Stanley Chang 2023-07-25  1068  }
134e6d25f6bd06 Stanley Chang 2023-07-25  1069  
134e6d25f6bd06 Stanley Chang 2023-07-25  1070  static void rtk_usb2phy_remove(struct platform_device *pdev)
134e6d25f6bd06 Stanley Chang 2023-07-25  1071  {
134e6d25f6bd06 Stanley Chang 2023-07-25 @1072  	struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
134e6d25f6bd06 Stanley Chang 2023-07-25  1073  
134e6d25f6bd06 Stanley Chang 2023-07-25  1074  	remove_debug_files(rtk_phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1075  
134e6d25f6bd06 Stanley Chang 2023-07-25  1076  	usb_remove_phy(&rtk_phy->phy);
134e6d25f6bd06 Stanley Chang 2023-07-25  1077  }
134e6d25f6bd06 Stanley Chang 2023-07-25  1078  

:::::: The code at line 1072 was first introduced by commit
:::::: 134e6d25f6bd06071e5aac0a7eefcea6f7713955 phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY

:::::: TO: Stanley Chang <stanley_chang@realtek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
