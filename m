Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011D6AB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677506145; x=1709042145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=poqUoZz8mG1PpjtOU2X9Hsz6upc4WDPwmMco8VYCgYo=;
  b=ditdQNe3zsQt7PiJo7SPRfxZ5ULcOzTmjEkiNz3/UdYTNeP2Ak5ZqM/s
   cFRQibmcy8Pm5u8RA87s5iehd2qc1GTMsvlCwWKGjve9z4tE5geZyzDgd
   gj0UmsPf3zHxWD1hx6OxEQZboQNQcjbSuFH52w0Lv0JiwxOf+8XWQo/DQ
   Z+8dij57NkovcXrtnfsBuuQ4/ddycLC5r9UQWnxXkMjq1xUAi9d8fNFXo
   ebY+Ck3WVjNSykpFZ3RXsiCLsSCbi5iYVHq6OoHkW8MCXVhJvW696fbfS
   qlPR6e3TjhnUAr4d47k+qV3KTJMY896sy/lBuOEqleMD6gupbkry9joMn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313532280"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="313532280"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 05:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1002777614"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="1002777614"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 05:55:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWdyh-0004TP-0v;
	Mon, 27 Feb 2023 13:55:43 +0000
Date: Mon, 27 Feb 2023 21:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 562/583]
 drivers/media/i2c/imx290.c:1361:35: warning: variable 'xclk_freq' is
 uninitialized when used here
Message-ID: <202302272105.hRZJl9OD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: b3902de8338d7f37f99f1c9a7b1634656f2a67f6 [562/583] media: i2c: imx290: Add support for 74.25MHz external clock
config: i386-randconfig-a004-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272105.hRZJl9OD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/b3902de8338d7f37f99f1c9a7b1634656f2a67f6
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout b3902de8338d7f37f99f1c9a7b1634656f2a67f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272105.hRZJl9OD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx290.c:1361:35: warning: variable 'xclk_freq' is uninitialized when used here [-Wuninitialized]
           ret = clk_set_rate(imx290->xclk, xclk_freq);
                                            ^~~~~~~~~
   drivers/media/i2c/imx290.c:1344:15: note: initialize the variable 'xclk_freq' to silence this warning
           u32 xclk_freq;
                        ^
                         = 0
>> drivers/media/i2c/imx290.c:293:35: warning: unused variable 'imx290_37_125mhz_clock' [-Wunused-const-variable]
   static const struct imx290_regval imx290_37_125mhz_clock[] = {
                                     ^
>> drivers/media/i2c/imx290.c:298:35: warning: unused variable 'imx290_74_25mhz_clock' [-Wunused-const-variable]
   static const struct imx290_regval imx290_74_25mhz_clock[] = {
                                     ^
   3 warnings generated.


vim +/xclk_freq +1361 drivers/media/i2c/imx290.c

7e3ecb0a837f24 Dave Stevenson   2023-01-16  1341  
157a556b41b81e Laurent Pinchart 2023-01-16  1342  static int imx290_init_clk(struct imx290 *imx290)
157a556b41b81e Laurent Pinchart 2023-01-16  1343  {
157a556b41b81e Laurent Pinchart 2023-01-16  1344  	u32 xclk_freq;
157a556b41b81e Laurent Pinchart 2023-01-16  1345  	int ret;
157a556b41b81e Laurent Pinchart 2023-01-16  1346  
157a556b41b81e Laurent Pinchart 2023-01-16  1347  	ret = fwnode_property_read_u32(dev_fwnode(imx290->dev),
b3902de8338d7f Dave Stevenson   2023-01-17  1348  				       "clock-frequency", &imx290->xclk_freq);
157a556b41b81e Laurent Pinchart 2023-01-16  1349  	if (ret) {
157a556b41b81e Laurent Pinchart 2023-01-16  1350  		dev_err(imx290->dev, "Could not get xclk frequency\n");
157a556b41b81e Laurent Pinchart 2023-01-16  1351  		return ret;
157a556b41b81e Laurent Pinchart 2023-01-16  1352  	}
157a556b41b81e Laurent Pinchart 2023-01-16  1353  
b3902de8338d7f Dave Stevenson   2023-01-17  1354  	/* external clock must be 37.125 MHz or 74.25MHz */
b3902de8338d7f Dave Stevenson   2023-01-17  1355  	if (imx290->xclk_freq != 37125000 && imx290->xclk_freq != 74250000) {
157a556b41b81e Laurent Pinchart 2023-01-16  1356  		dev_err(imx290->dev, "External clock frequency %u is not supported\n",
157a556b41b81e Laurent Pinchart 2023-01-16  1357  			xclk_freq);
157a556b41b81e Laurent Pinchart 2023-01-16  1358  		return -EINVAL;
157a556b41b81e Laurent Pinchart 2023-01-16  1359  	}
157a556b41b81e Laurent Pinchart 2023-01-16  1360  
157a556b41b81e Laurent Pinchart 2023-01-16 @1361  	ret = clk_set_rate(imx290->xclk, xclk_freq);
157a556b41b81e Laurent Pinchart 2023-01-16  1362  	if (ret) {
157a556b41b81e Laurent Pinchart 2023-01-16  1363  		dev_err(imx290->dev, "Could not set xclk frequency\n");
157a556b41b81e Laurent Pinchart 2023-01-16  1364  		return ret;
157a556b41b81e Laurent Pinchart 2023-01-16  1365  	}
157a556b41b81e Laurent Pinchart 2023-01-16  1366  
157a556b41b81e Laurent Pinchart 2023-01-16  1367  	return 0;
157a556b41b81e Laurent Pinchart 2023-01-16  1368  }
157a556b41b81e Laurent Pinchart 2023-01-16  1369  

:::::: The code at line 1361 was first introduced by commit
:::::: 157a556b41b81e0c27bbc7547056631a9c0d7d98 media: i2c: imx290: Factor out clock initialization to separate function

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Dom Cobley <popcornmix@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
