Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04484C64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676995726; x=1708531726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L1wxIXIKG748yoflhI1lfovQQXdLF1ADW/+farwUNDY=;
  b=AxgY+BQKFTXOAHWTeR2Tjc6ByfB0c/bzGdEDylZdS4/dR0nvXW1C3BwG
   xaNf9LMiQh9/nOxMO3bmpk0NTwQEsm5XJBdNpQDP6Pcath3z41al24d20
   SWrYKHHh4579Wc5bsd43Cm9eoLQHDFuUcLlU8oZF6WWjJ0RhmleQKsi3z
   j8AQ3UV40+yKwSsWZePHsGimUJH1gYAS/xmiQg7GehoRUfmvIafBk1ius
   zyksE/3NAyfT9VYQfQvdt3DCaC6wifiyoAD/6YOlmGwnyeCSJNtSG70w3
   oLDb5oQHYTqodVXaXM4vklMYhk5+dplUrpADKx8nAhuG9Q6/77TZextnN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="397360020"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397360020"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="665023840"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="665023840"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Feb 2023 08:08:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUVBi-000Ex0-2u;
	Tue, 21 Feb 2023 16:08:18 +0000
Date: Wed, 22 Feb 2023 00:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ng Khai Wen <khai.wen.ng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:5.10/yocto 10456/30000] drivers/media/i2c/imx390.c:439:9:
 warning: ISO C90 forbids mixed declarations and code
Message-ID: <202302212313.5nXzg1Pm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   e8844106f6fc41e1c8d5dbadbd62ac3e54030903
commit: 2def42a616c1ceec2eb739c6befb6af42f6ee22c [10456/30000] Fix compile issue
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302212313.5nXzg1Pm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/2def42a616c1ceec2eb739c6befb6af42f6ee22c
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 2def42a616c1ceec2eb739c6befb6af42f6ee22c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302212313.5nXzg1Pm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx390.c: In function 'get_hblank':
   drivers/media/i2c/imx390.c:422:13: warning: unused variable 'pixel_clk' [-Wunused-variable]
     422 |         u64 pixel_clk;
         |             ^~~~~~~~~
   drivers/media/i2c/imx390.c:421:13: warning: unused variable 'pixel_rate' [-Wunused-variable]
     421 |         u64 pixel_rate;
         |             ^~~~~~~~~~
   drivers/media/i2c/imx390.c: In function 'imx390_exposure_raw_set':
>> drivers/media/i2c/imx390.c:439:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     439 |         struct imx390_reg exposure_array[] = {
         |         ^~~~~~
   drivers/media/i2c/imx390.c:429:13: warning: unused variable 'err' [-Wunused-variable]
     429 |         int err = 0;
         |             ^~~
   drivers/media/i2c/imx390.c: In function 'imx390_set_ctrl':
   drivers/media/i2c/imx390.c:502:13: warning: unused variable 'val' [-Wunused-variable]
     502 |         u32 val;
         |             ^~~
   drivers/media/i2c/imx390.c:500:13: warning: unused variable 'exposure_max' [-Wunused-variable]
     500 |         s64 exposure_max;
         |             ^~~~~~~~~~~~
   drivers/media/i2c/imx390.c: In function 'imx390_init_controls':
   drivers/media/i2c/imx390.c:542:33: warning: unused variable 'cfg' [-Wunused-variable]
     542 |         struct v4l2_ctrl_config cfg = { 0 };
         |                                 ^~~
   drivers/media/i2c/imx390.c:540:13: warning: unused variable 'exposure_max' [-Wunused-variable]
     540 |         s64 exposure_max;
         |             ^~~~~~~~~~~~
   drivers/media/i2c/imx390.c:538:28: warning: unused variable 'client' [-Wunused-variable]
     538 |         struct i2c_client *client = v4l2_get_subdevdata(&imx390->sd);
         |                            ^~~~~~
   drivers/media/i2c/imx390.c: At top level:
>> drivers/media/i2c/imx390.c:941:13: warning: no previous prototype for 'imx390_threaded_irq_fn' [-Wmissing-prototypes]
     941 | irqreturn_t imx390_threaded_irq_fn(int irq, void *dev_id)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx390.c:402:12: warning: 'imx390_update_digital_gain' defined but not used [-Wunused-function]
     402 | static int imx390_update_digital_gain(struct imx390 *imx390, u32 d_gain)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx390.c:340:12: warning: 'imx390_gain_raw_set' defined but not used [-Wunused-function]
     340 | static int imx390_gain_raw_set(struct imx390 *self, u16 gain)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx390.c: In function 'get_pixel_rate':
   drivers/media/i2c/imx390.c:411:16: warning: 'pixel_rate' is used uninitialized [-Wuninitialized]
     411 |         return pixel_rate;
         |                ^~~~~~~~~~
   drivers/media/i2c/imx390.c:410:13: note: 'pixel_rate' was declared here
     410 |         u64 pixel_rate;
         |             ^~~~~~~~~~
   drivers/media/i2c/imx390.c: In function 'get_hblank':
   drivers/media/i2c/imx390.c:424:16: warning: 'hblank' is used uninitialized [-Wuninitialized]
     424 |         return hblank;
         |                ^~~~~~
   drivers/media/i2c/imx390.c:420:13: note: 'hblank' was declared here
     420 |         u64 hblank;
         |             ^~~~~~


vim +439 drivers/media/i2c/imx390.c

1aafb1e0df5527 Ng Khai Wen 2021-07-01  426  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  427  static int imx390_exposure_raw_set(struct imx390 *self, u32 exp)
1aafb1e0df5527 Ng Khai Wen 2021-07-01  428  {
1aafb1e0df5527 Ng Khai Wen 2021-07-01  429  	int err = 0;
1aafb1e0df5527 Ng Khai Wen 2021-07-01  430  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  431  	/* This should never be called in HDR mode but we'll put check
1aafb1e0df5527 Ng Khai Wen 2021-07-01  432  	 * in to be safe.
1aafb1e0df5527 Ng Khai Wen 2021-07-01  433  	 */
1aafb1e0df5527 Ng Khai Wen 2021-07-01  434  	if (imx390_is_hdr(self))
1aafb1e0df5527 Ng Khai Wen 2021-07-01  435  		return 0;
1aafb1e0df5527 Ng Khai Wen 2021-07-01  436  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  437  	imx390_group_hold_enable(self, 1);
1aafb1e0df5527 Ng Khai Wen 2021-07-01  438  
1aafb1e0df5527 Ng Khai Wen 2021-07-01 @439  	struct imx390_reg exposure_array[] = {
1aafb1e0df5527 Ng Khai Wen 2021-07-01  440  		/* 20 bit value 0xc, 0xd, 0xe */
1aafb1e0df5527 Ng Khai Wen 2021-07-01  441  		{IMX390_REG_SHS1, exp & 0xff},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  442  		{IMX390_REG_SHS1 + 1, (exp & 0xff00) >> 8},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  443  		{IMX390_REG_SHS1 + 2, (exp & 0xf0000) >> 16},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  444  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  445  		/* 20 bit value  0x10, 0x11, 0x12 */
1aafb1e0df5527 Ng Khai Wen 2021-07-01  446  		{IMX390_REG_SHS2, exp & 0xff},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  447  		{IMX390_REG_SHS2 + 1, (exp & 0xff00) >> 8},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  448  		{IMX390_REG_SHS2 + 2, (exp & 0xf0000) >> 16},
1aafb1e0df5527 Ng Khai Wen 2021-07-01  449  	};
1aafb1e0df5527 Ng Khai Wen 2021-07-01  450  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  451  	const struct imx390_reg_list exp_list = {
1aafb1e0df5527 Ng Khai Wen 2021-07-01  452  		.num_of_regs = ARRAY_SIZE(exposure_array),
1aafb1e0df5527 Ng Khai Wen 2021-07-01  453  		.regs = exposure_array,
1aafb1e0df5527 Ng Khai Wen 2021-07-01  454  	};
1aafb1e0df5527 Ng Khai Wen 2021-07-01  455  
1aafb1e0df5527 Ng Khai Wen 2021-07-01  456  	/* True means to print the register values. This is a small
1aafb1e0df5527 Ng Khai Wen 2021-07-01  457  	 * table so it's OK.
1aafb1e0df5527 Ng Khai Wen 2021-07-01  458  	 */
1aafb1e0df5527 Ng Khai Wen 2021-07-01  459  	imx390_write_reg_list(self, &exp_list);
1aafb1e0df5527 Ng Khai Wen 2021-07-01  460  	imx390_group_hold_enable(self, 0);
1aafb1e0df5527 Ng Khai Wen 2021-07-01  461  	return 0;
1aafb1e0df5527 Ng Khai Wen 2021-07-01  462  }
1aafb1e0df5527 Ng Khai Wen 2021-07-01  463  

:::::: The code at line 439 was first introduced by commit
:::::: 1aafb1e0df5527884ad5ccb67ec95414df4d85f7 Add IPU driver

:::::: TO: Ng Khai Wen <khai.wen.ng@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
