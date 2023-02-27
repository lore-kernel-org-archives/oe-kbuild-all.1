Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AA2FB2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677500322; x=1709036322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvljIlfaCenbEw/C+Pc+9/5w/RlW03AdREidemEr4xo=;
  b=WTGRk8ZT52DlRYxp5ja5RsjRad4xteLVe/i2VqtyDG7RspmZffdL0i8E
   wAoyP6npgPrhGgAuWkOhPtrDiYO2lgkRytOUN34iIrcq01ppvJWFC8Q5L
   ZT2jJVKthyXE3ciPoZfTMV+/p3Ta/Ac/FFgSXIh/bpzivfbkFrdzaXabV
   0sMexz7djszXEcjOdbrdhXArDxbZhj4S5nuZH1gENag9fJ24LVRA0ySIA
   XE6r0vZCzwTDl3wrSsGPXkSpIsSwTI0XoGMQ7pYnEEDxaDYvA3SeXPkbs
   skne4NFzj0po3quMGcGTltTNgu06ZRppem/Tel1SO3E3NX+dZHtb4eTfV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398617962"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="398617962"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 04:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="667009166"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="667009166"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Feb 2023 04:18:41 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWcSm-0004OV-1L;
	Mon, 27 Feb 2023 12:18:40 +0000
Date: Mon, 27 Feb 2023 20:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 360/583]
 drivers/staging/fbtft/fb_st7789v.c:418:5: warning: no previous prototype for
 function 'variant_minipitft13'
Message-ID: <202302272037.dem1junz-lkp@intel.com>
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
commit: 182e7c31deae6bddfa476bacb751203fab0e65a0 [360/583] staging: fbtft: Add minipitft13 variant
config: i386-randconfig-r035-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272037.dem1junz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/182e7c31deae6bddfa476bacb751203fab0e65a0
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout 182e7c31deae6bddfa476bacb751203fab0e65a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/fbtft/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272037.dem1junz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/fbtft/fb_st7789v.c:418:5: warning: no previous prototype for function 'variant_minipitft13' [-Wmissing-prototypes]
   int variant_minipitft13(struct fbtft_display *display)
       ^
   drivers/staging/fbtft/fb_st7789v.c:418:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int variant_minipitft13(struct fbtft_display *display)
   ^
   static 
   1 warning generated.


vim +/variant_minipitft13 +418 drivers/staging/fbtft/fb_st7789v.c

   417	
 > 418	int variant_minipitft13(struct fbtft_display *display)
   419	{
   420		display->fbtftops.set_addr_win = minipitft13_set_addr_win;
   421		return 0;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
