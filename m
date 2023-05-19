Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108E3D399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684485545; x=1716021545;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Llwp8SQ7YUs6i2j7dpuDnae15uZwb1oJrH+XOd9HMa8=;
  b=Kc72+WxLqSKcWRw5NtJmQ/IUIrec0/bkyrSwiYRWNtf8VIqmK1frebdM
   9MP5NNwcFbyXRdONajNYNgq/8BKI2Wd2ssXtfdpHfF4qV4gAUl7pJkPpz
   lkh7VtPEX+anfDcn3czkimp1cCbvdj6dFvURQ6QXsA7+6egtkxHi1cLqY
   blC834XzJ4ejUbH9z1Pki3lo9ENjt1FFkGVZTlwbdzrUM2DZ3E8cHZvNB
   TPmPncj9Ih2rcgFzUzUDElsaqDONmo+h9KMAuqaZUGEbJLzCs+cYLwaxx
   eoZvpPeyqT0NJIsolRfOLrPNwRZUla3lTBeJ+LBztgS55E6caaXeXqe/X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354670803"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="354670803"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="1032540074"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="1032540074"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 May 2023 01:39:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzvdf-000AiY-2Y;
	Fri, 19 May 2023 08:39:03 +0000
Date: Fri, 19 May 2023 16:38:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/yocto 4912/30000]
 drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype
 for 'aty_st_lcd'
Message-ID: <202305191630.V7KmKRpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Randy,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   37a4db0e223afb2dcefa8dedf2107011e9bf447c
commit: f11431c81837b0819854ee10da218949d4c7e2f1 [4912/30000] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
config: ia64-randconfig-r031-20230517 (https://download.01.org/0day-ci/archive/20230519/202305191630.V7KmKRpy-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/f11431c81837b0819854ee10da218949d4c7e2f1
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout f11431c81837b0819854ee10da218949d4c7e2f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/video/fbdev/aty/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191630.V7KmKRpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype for 'aty_st_lcd' [-Wmissing-prototypes]
     180 | void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
         |      ^~~~~~~~~~
>> drivers/video/fbdev/aty/atyfb_base.c:183:5: warning: no previous prototype for 'aty_ld_lcd' [-Wmissing-prototypes]
     183 | u32 aty_ld_lcd(int index, const struct atyfb_par *par)
         |     ^~~~~~~~~~


vim +/aty_st_lcd +180 drivers/video/fbdev/aty/atyfb_base.c

   163	
   164	u32 aty_ld_lcd(int index, const struct atyfb_par *par)
   165	{
   166		if (M64_HAS(LT_LCD_REGS)) {
   167			return aty_ld_le32(lt_lcd_regs[index], par);
   168		} else {
   169			unsigned long temp;
   170	
   171			/* write addr byte */
   172			temp = aty_ld_le32(LCD_INDEX, par);
   173			aty_st_le32(LCD_INDEX, (temp & ~LCD_INDEX_MASK) | index, par);
   174			/* read the register value */
   175			return aty_ld_le32(LCD_DATA, par);
   176		}
   177	}
   178	#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACKLIGHT) \
   179		 defined(CONFIG_FB_ATY_GENERIC_LCD) */
 > 180	void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
   181	{ }
   182	
 > 183	u32 aty_ld_lcd(int index, const struct atyfb_par *par)
   184	{
   185		return 0;
   186	}
   187	#endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
