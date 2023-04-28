Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F415CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682650156; x=1714186156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSmaQm7jqtexBTRC879b6X2nU69sZ0tTw7CJM1txSkc=;
  b=Zv3nqhytgn7Dn63Ler3L+pt9CnnOHMq73TvMWtrLtLL9i2w/WwSKRDCE
   9TdXdE04gCZmLV3UHZe2Er79Vq2iTtRTfc3pKWB+X/Xtlt7wBP6LuZJ1e
   x7vHmhTrv7VS23snSa2D2duQsVumkReNwp0e5l5hVgckEPmTtE4NON3vo
   y2YMFaPMJaCEK2jjTEpH7WGUsbHyCh07nIIRDLqzQ9WviCqAAAD2u3Sg/
   CtXuIHxGOkK4I1hSt4Hp99kaKIAHAUf0Ul1v0FXXEFwbcCGBJbhMtIR68
   zwUZizfPq+ScZrMgixMtF4NUON1vd+oHIx8qL5+t5qydhKMU40g3UTiQP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="347656916"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="347656916"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 19:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727376221"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727376221"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 19:49:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEAc-00002M-0j;
	Fri, 28 Apr 2023 02:49:14 +0000
Date: Fri, 28 Apr 2023 10:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 52/57] drivers/rtc/rtc-ds3232.c:375:17: warning:
 initialization discards 'const' qualifier from pointer target type
Message-ID: <202304281017.MYM0hP59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   2c1afd03f007ce89de38d7ca355f05330c6038f0
commit: e4133995fe80251ad2abb0261745ea27ab97c2e7 [52/57] rtc: ds3232: constify pointers to hwmon_channel_info
config: sparc-randconfig-r034-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281017.MYM0hP59-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=e4133995fe80251ad2abb0261745ea27ab97c2e7
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch --no-tags abelloni rtc-next
        git checkout e4133995fe80251ad2abb0261745ea27ab97c2e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281017.MYM0hP59-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ds3232.c:375:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     375 |         .info = ds3232_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~


vim +/const +375 drivers/rtc/rtc-ds3232.c

c35c4195f919a0 Kirill Esipov 2017-06-28  372  
c35c4195f919a0 Kirill Esipov 2017-06-28  373  static const struct hwmon_chip_info ds3232_hwmon_chip_info = {
c35c4195f919a0 Kirill Esipov 2017-06-28  374  	.ops = &ds3232_hwmon_hwmon_ops,
c35c4195f919a0 Kirill Esipov 2017-06-28 @375  	.info = ds3232_hwmon_info,
c35c4195f919a0 Kirill Esipov 2017-06-28  376  };
c35c4195f919a0 Kirill Esipov 2017-06-28  377  

:::::: The code at line 375 was first introduced by commit
:::::: c35c4195f919a077ce106ec84cfcecbb0b67db30 rtc: ds3232: add temperature support

:::::: TO: Kirill Esipov <yesipov@gmail.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
