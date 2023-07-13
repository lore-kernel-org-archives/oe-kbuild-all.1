Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387467C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689211513; x=1720747513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nua0dkEG6nnsa6jKbrcFs3pp2cDKAb/0SWfK7SqUnBo=;
  b=NW6jhSQcGW0uRkRdlpC/4AtpQXS3RBZaIjeWKp9SUFqjrGQHJ8aLvTjA
   1Zq4s4P30LjrvMjUE0yQeDZVfCYzW40kEse/EyoZyHNz8wKkI0qovIyhe
   Mu+qxl/WMUzazzvI6oP+IbyVRirMr/7xjkXmrQg/eZANxyYX040+v/lF0
   5CeJCU1vzXshe3tkC1qTdpervXI6346Tk7Sgm3lamzrp9Pg4zyujmfIhp
   JcwtohqYqBPZhl+zDYg/E4lDpu9M0TezKiM04kfhTUA+qrc92lWv87d+g
   fBoKiKlL5okgHkuE7HbreM/sGpt1qx4XwfqLGz2mh2PniMYNv+Qa32qlb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395853962"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="395853962"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 18:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725105268"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="725105268"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 18:25:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJl4w-00065b-18;
	Thu, 13 Jul 2023 01:25:10 +0000
Date: Thu, 13 Jul 2023 09:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 101/101]
 drivers/power/supply/twl4030_charger.c:1140:35: warning: initialization of
 'const struct of_device_id *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202307130957.NpTgMFwO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   ac7a2a5947cf0a60d9614031b509c5b65e99f87a
commit: ac7a2a5947cf0a60d9614031b509c5b65e99f87a [101/101] WIP: Remove of.h include from headers
config: arc-randconfig-r043-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130957.NpTgMFwO-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130957.NpTgMFwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130957.NpTgMFwO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/twl4030_charger.c: In function 'twl4030_bci_parse_dt':
   drivers/power/supply/twl4030_charger.c:940:13: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
     940 |         if (of_property_read_u32(np, "ti,bb-uvolt", &num) == 0)
         |             ^~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c: In function 'twl4030_bci_probe':
   drivers/power/supply/twl4030_charger.c:1021:27: error: implicit declaration of function 'of_get_compatible_child' [-Werror=implicit-function-declaration]
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c:1021:68: error: invalid use of undefined type 'struct device_node'
    1021 |                 phynode = of_get_compatible_child(bci->dev->of_node->parent,
         |                                                                    ^~
   drivers/power/supply/twl4030_charger.c:1027:25: error: implicit declaration of function 'of_node_put' [-Werror=implicit-function-declaration]
    1027 |                         of_node_put(phynode);
         |                         ^~~~~~~~~~~
   drivers/power/supply/twl4030_charger.c: At top level:
   drivers/power/supply/twl4030_charger.c:1140:35: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
    1140 |                 .of_match_table = of_match_ptr(twl_bci_of_match),
         |                                   ^~~~~~~~~~~~
>> drivers/power/supply/twl4030_charger.c:1140:35: warning: initialization of 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/power/supply/twl4030_charger.c:1140:35: note: (near initialization for 'twl4030_bci_driver.driver.of_match_table')
   drivers/power/supply/twl4030_charger.c:1140:35: error: initializer element is not constant
   drivers/power/supply/twl4030_charger.c:1140:35: note: (near initialization for 'twl4030_bci_driver.driver.of_match_table')
   cc1: some warnings being treated as errors


vim +1140 drivers/power/supply/twl4030_charger.c

ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown         2013-10-31  1134  
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1135  static struct platform_driver twl4030_bci_driver = {
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek      2015-07-30  1136  	.probe = twl4030_bci_probe,
420b2d443b7ee2a drivers/power/supply/twl4030_charger.c Dmitry Torokhov   2017-03-01  1137  	.remove	= twl4030_bci_remove,
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1138  	.driver	= {
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1139  		.name	= "twl4030_bci",
ec0b380245d7b7d drivers/power/twl4030_charger.c        NeilBrown         2013-10-31 @1140  		.of_match_table = of_match_ptr(twl_bci_of_match),
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1141  	},
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1142  };
7396f708b9f1d88 drivers/power/twl4030_charger.c        Pavel Machek      2015-07-30  1143  module_platform_driver(twl4030_bci_driver);
2e727f1787e3110 drivers/power/twl4030_charger.c        Grazvydas Ignotas 2010-09-27  1144  

:::::: The code at line 1140 was first introduced by commit
:::::: ec0b380245d7b7d4d8e4201facca780a14352cda twl4030_charger: Add devicetree support

:::::: TO: NeilBrown <neilb@suse.de>
:::::: CC: Anton Vorontsov <anton@enomsg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
