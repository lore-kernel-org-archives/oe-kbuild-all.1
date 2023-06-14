Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B061548A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686784155; x=1718320155;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zFl77UvUSPI2bo1pG65ty+vKamQm9GIyBL0rWrVcsWA=;
  b=C0hfZ8u9qru3/932kBVFPEH/bEev7tdnAg/xCVdxTIG1srWOkasxqrSA
   AhAEEEi3EGYjMLEpTt+vAgs+0JY49m3tVXpGKnqiUM5d0cbDNiIvaFadV
   mPywjvYOKUPLwab4IvoFKUmbjsRGvwF0QunDVBQY4iDUxTITfPOJmdsyv
   CtWT4SzEiI7F+87i4iPJX19e8Aq5KokDrhd7QSYVS4GyXG8Z3fdwBugNa
   FSbb+VIwm2dMNi25/I3qzO/tyG+Bhj5jwjqOdmBPeLHjGTMeDj+RhZ95o
   A2ESQV7gNtA2MdSLQjcU/kvGn70HfoLZXXbr9g5qqRTb6+2bHSbLlxiD3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="357639644"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="357639644"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 16:08:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782274212"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="782274212"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2023 16:08:33 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ZbM-00019j-1S;
	Wed, 14 Jun 2023 23:08:32 +0000
Date: Thu, 15 Jun 2023 07:08:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/preempt-rt 4654/30000]
 drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype
 for function 'aty_st_lcd'
Message-ID: <202306150737.Hqwo7Imk-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   3ac1bd25f960eb6f98d69d28d53e3fddd1e6f88a
commit: f11431c81837b0819854ee10da218949d4c7e2f1 [4654/30000] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
config: i386-randconfig-i015-20230613 (https://download.01.org/0day-ci/archive/20230615/202306150737.Hqwo7Imk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/f11431c81837b0819854ee10da218949d4c7e2f1
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout f11431c81837b0819854ee10da218949d4c7e2f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/thunderbolt/ drivers/video/fbdev/aty/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150737.Hqwo7Imk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/aty/atyfb_base.c:180:6: warning: no previous prototype for function 'aty_st_lcd' [-Wmissing-prototypes]
   void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
        ^
   drivers/video/fbdev/aty/atyfb_base.c:180:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
   ^
   static 
>> drivers/video/fbdev/aty/atyfb_base.c:183:5: warning: no previous prototype for function 'aty_ld_lcd' [-Wmissing-prototypes]
   u32 aty_ld_lcd(int index, const struct atyfb_par *par)
       ^
   drivers/video/fbdev/aty/atyfb_base.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 aty_ld_lcd(int index, const struct atyfb_par *par)
   ^
   static 
   2 warnings generated.


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
