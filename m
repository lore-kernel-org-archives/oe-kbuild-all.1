Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791433217
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681148859; x=1712684859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CtzgvNNcevbwojA9fRb5EEO7tm1MaVDJ8aaNxLd5SpQ=;
  b=n5QNO6b/kvpfSiy0xERqJLkjV58eZPusu7KByF1hLNctoXJ0bZ2k6xr3
   +NV/Dm6LFVj8tKXTQ4jKviDQFRuNqCI8eR8tFkMiqv5G1DpvCZTIpy75v
   TLzstKyFjMu2+BhdtGS4n+e0/zOE8GuZuJqJPTpamdZE3AdkyOUtiTj4j
   GUVu4wv5fjXh6/lM6Lm4kYKOEwbX9mRgne55MknIiMOU43iiEHKLruY5u
   7B2SxmgrcLUtaKAHs1ZYROsRSA8fKRmr2+GTuRa26C3ikJfoINtk4MC50
   tCyP6yvrbsBeF1ht+OR6IMsTOMlUzg2fkylbm/KvhJJyEetwqGNm0QFqX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="332092016"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="332092016"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 10:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862556985"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="862556985"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 10:47:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plvc3-000VYV-3C;
	Mon, 10 Apr 2023 17:47:31 +0000
Date: Tue, 11 Apr 2023 01:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:t602x/bringup 118/125] drivers/soc/apple/rtkit.c:950:19:
 error: 'apple_rtkit_get_dram_mask' undeclared here (not in a function); did
 you mean 'apple_rtkit_dram_mask'?
Message-ID: <202304110122.EbS8Elpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux t602x/bringup
head:   595f97705c505e843b8e264e9daa5710474237dc
commit: 4c253fc7806a5e80352baf95ff6d5d8ac1f92f9a [118/125] soc: apple: rtkit: Add support for an ASC DRAM offset
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304110122.EbS8Elpd-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/4c253fc7806a5e80352baf95ff6d5d8ac1f92f9a
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux t602x/bringup
        git checkout 4c253fc7806a5e80352baf95ff6d5d8ac1f92f9a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110122.EbS8Elpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/soc/apple/rtkit-internal.h:12,
                    from drivers/soc/apple/rtkit.c:7:
>> drivers/soc/apple/rtkit.c:950:19: error: 'apple_rtkit_get_dram_mask' undeclared here (not in a function); did you mean 'apple_rtkit_dram_mask'?
     950 | EXPORT_SYMBOL_GPL(apple_rtkit_get_dram_mask);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:87:23: note: in definition of macro '___EXPORT_SYMBOL'
      87 |         extern typeof(sym) sym;                                                 \
         |                       ^~~
   include/linux/export.h:147:41: note: in expansion of macro '__EXPORT_SYMBOL'
     147 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:151:41: note: in expansion of macro '_EXPORT_SYMBOL'
     151 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   drivers/soc/apple/rtkit.c:950:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     950 | EXPORT_SYMBOL_GPL(apple_rtkit_get_dram_mask);
         | ^~~~~~~~~~~~~~~~~


vim +950 drivers/soc/apple/rtkit.c

   945	
   946	u64 apple_rtkit_dram_mask(struct apple_rtkit *rtk)
   947	{
   948		return rtk->dram_mask;
   949	}
 > 950	EXPORT_SYMBOL_GPL(apple_rtkit_get_dram_mask);
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
