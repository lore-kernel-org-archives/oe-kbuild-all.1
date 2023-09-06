Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FEC10953
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694023611; x=1725559611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/w4euWGfAKwGVALa4YgsTewf0rt1bxAsB3mMlFP/+o=;
  b=bUNA73vqZVj6ULYzTE2DHySMV7yg985JVb6FIVHxGOk0NJgNxLBVyDP5
   w4H5k5zOpCWb5xaWcJ4mClnQX9Gmxjh+mIx+uSTuNmjt7cNLJq4ML+FNL
   xAJ2b6JaYrWzQPwbvKqWPAkAwazZ5Tq2g4gw9Rdi2c0oFAj9vePqJui3q
   dI5RNpaIq3RNsjUZVgDbBs1dsee4W7ONFYVFGRafbG3Vv6cCERW+Bg4sL
   bDzKwM7vjR3dJkrqC6oGzeOA2Rq410hm8v1EKIUI+YMT0N1QXEAfNKQR1
   ETrh4qh5fXK0y1uHh2E6+y9iCreJG+8M5PNiXEwlix26dWd/mk3HvJdYO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377055207"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="377055207"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856562875"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="856562875"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 11:06:49 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdwvP-0000Tf-0E;
	Wed, 06 Sep 2023 18:06:47 +0000
Date: Thu, 7 Sep 2023 02:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 69/69]
 drivers/phy/realtek/phy-rtk-usb2.c:1016:28: error: dereferencing pointer to
 incomplete type 'struct platform_device'
Message-ID: <202309070231.ii0aLBfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   0b72818a9f751fb3306e404a3ba972e86ec135ad
commit: 0b72818a9f751fb3306e404a3ba972e86ec135ad [69/69] of: header cleanups
config: x86_64-randconfig-016-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070231.ii0aLBfZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070231.ii0aLBfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070231.ii0aLBfZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/realtek/phy-rtk-usb2.c: In function 'rtk_usb2phy_probe':
>> drivers/phy/realtek/phy-rtk-usb2.c:1016:28: error: dereferencing pointer to incomplete type 'struct platform_device'
     struct device *dev = &pdev->dev;
                               ^~
   drivers/phy/realtek/phy-rtk-usb2.c:1047:2: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'regulator_set_drvdata'? [-Werror=implicit-function-declaration]
     platform_set_drvdata(pdev, rtk_phy);
     ^~~~~~~~~~~~~~~~~~~~
     regulator_set_drvdata
   drivers/phy/realtek/phy-rtk-usb2.c: In function 'rtk_usb2phy_remove':
   drivers/phy/realtek/phy-rtk-usb2.c:1072:28: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'regulator_get_drvdata'? [-Werror=implicit-function-declaration]
     struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                               ^~~~~~~~~~~~~~~~~~~~
                               regulator_get_drvdata
   drivers/phy/realtek/phy-rtk-usb2.c:1072:28: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/phy/realtek/phy-rtk-usb2.c: At top level:
   drivers/phy/realtek/phy-rtk-usb2.c:1317:15: error: variable 'rtk_usb2phy_driver' has initializer but incomplete type
    static struct platform_driver rtk_usb2phy_driver = {
                  ^~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1318:3: error: 'struct platform_driver' has no member named 'probe'
     .probe  = rtk_usb2phy_probe,
      ^~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1318:12: warning: excess elements in struct initializer
     .probe  = rtk_usb2phy_probe,
               ^~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1318:12: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1319:3: error: 'struct platform_driver' has no member named 'remove_new'
     .remove_new = rtk_usb2phy_remove,
      ^~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1319:16: warning: excess elements in struct initializer
     .remove_new = rtk_usb2phy_remove,
                   ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1319:16: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1320:3: error: 'struct platform_driver' has no member named 'driver'
     .driver  = {
      ^~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1320:13: error: extra brace group at end of initializer
     .driver  = {
                ^
   drivers/phy/realtek/phy-rtk-usb2.c:1320:13: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1320:13: warning: excess elements in struct initializer
   drivers/phy/realtek/phy-rtk-usb2.c:1320:13: note: (near initialization for 'rtk_usb2phy_driver')
   drivers/phy/realtek/phy-rtk-usb2.c:1326:1: warning: data definition has no type or storage class
    module_platform_driver(rtk_usb2phy_driver);
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1326:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
   drivers/phy/realtek/phy-rtk-usb2.c:1326:1: warning: parameter names (without types) in function declaration
   drivers/phy/realtek/phy-rtk-usb2.c:1317:31: error: storage size of 'rtk_usb2phy_driver' isn't known
    static struct platform_driver rtk_usb2phy_driver = {
                                  ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb2.c:1317:31: warning: 'rtk_usb2phy_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors
--
   drivers/phy/realtek/phy-rtk-usb3.c: In function 'rtk_usb3phy_probe':
>> drivers/phy/realtek/phy-rtk-usb3.c:570:28: error: dereferencing pointer to incomplete type 'struct platform_device'
     struct device *dev = &pdev->dev;
                               ^~
   drivers/phy/realtek/phy-rtk-usb3.c:601:2: error: implicit declaration of function 'platform_set_drvdata'; did you mean 'regulator_set_drvdata'? [-Werror=implicit-function-declaration]
     platform_set_drvdata(pdev, rtk_phy);
     ^~~~~~~~~~~~~~~~~~~~
     regulator_set_drvdata
   drivers/phy/realtek/phy-rtk-usb3.c: In function 'rtk_usb3phy_remove':
   drivers/phy/realtek/phy-rtk-usb3.c:625:28: error: implicit declaration of function 'platform_get_drvdata'; did you mean 'regulator_get_drvdata'? [-Werror=implicit-function-declaration]
     struct rtk_phy *rtk_phy = platform_get_drvdata(pdev);
                               ^~~~~~~~~~~~~~~~~~~~
                               regulator_get_drvdata
   drivers/phy/realtek/phy-rtk-usb3.c:625:28: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   drivers/phy/realtek/phy-rtk-usb3.c: At top level:
   drivers/phy/realtek/phy-rtk-usb3.c:753:15: error: variable 'rtk_usb3phy_driver' has initializer but incomplete type
    static struct platform_driver rtk_usb3phy_driver = {
                  ^~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:754:3: error: 'struct platform_driver' has no member named 'probe'
     .probe  = rtk_usb3phy_probe,
      ^~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:754:12: warning: excess elements in struct initializer
     .probe  = rtk_usb3phy_probe,
               ^~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:754:12: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:755:3: error: 'struct platform_driver' has no member named 'remove_new'
     .remove_new = rtk_usb3phy_remove,
      ^~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:755:16: warning: excess elements in struct initializer
     .remove_new = rtk_usb3phy_remove,
                   ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:755:16: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:756:3: error: 'struct platform_driver' has no member named 'driver'
     .driver  = {
      ^~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:756:13: error: extra brace group at end of initializer
     .driver  = {
                ^
   drivers/phy/realtek/phy-rtk-usb3.c:756:13: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:756:13: warning: excess elements in struct initializer
   drivers/phy/realtek/phy-rtk-usb3.c:756:13: note: (near initialization for 'rtk_usb3phy_driver')
   drivers/phy/realtek/phy-rtk-usb3.c:762:1: warning: data definition has no type or storage class
    module_platform_driver(rtk_usb3phy_driver);
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:762:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
   drivers/phy/realtek/phy-rtk-usb3.c:762:1: warning: parameter names (without types) in function declaration
   drivers/phy/realtek/phy-rtk-usb3.c:753:31: error: storage size of 'rtk_usb3phy_driver' isn't known
    static struct platform_driver rtk_usb3phy_driver = {
                                  ^~~~~~~~~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-usb3.c:753:31: warning: 'rtk_usb3phy_driver' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +1016 drivers/phy/realtek/phy-rtk-usb2.c

134e6d25f6bd06 Stanley Chang 2023-07-25  1012  
134e6d25f6bd06 Stanley Chang 2023-07-25  1013  static int rtk_usb2phy_probe(struct platform_device *pdev)
134e6d25f6bd06 Stanley Chang 2023-07-25  1014  {
134e6d25f6bd06 Stanley Chang 2023-07-25  1015  	struct rtk_phy *rtk_phy;
134e6d25f6bd06 Stanley Chang 2023-07-25 @1016  	struct device *dev = &pdev->dev;
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
134e6d25f6bd06 Stanley Chang 2023-07-25  1047  	platform_set_drvdata(pdev, rtk_phy);
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

:::::: The code at line 1016 was first introduced by commit
:::::: 134e6d25f6bd06071e5aac0a7eefcea6f7713955 phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY

:::::: TO: Stanley Chang <stanley_chang@realtek.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
