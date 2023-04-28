Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E617D8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682657600; x=1714193600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wn+IbVRlwWKaB+LaM1z9W3SS+dxpxqpz4oFBetGyJ4I=;
  b=KTpqIfeoCp0nrmV1aEqjsPJEoeoPTMC4Vyev2WZY3aRsBjseyf2WG+/O
   8JZyL26ZDVLQT1CFUCYUBAm6qpOVdlCKBW9YgSB8Fn/kPqFpPBzMjbt0m
   8jtbcRAfkV2bSCGC9ra0TOt2hSBCxbv0R9tVDeb8iPTrzEDo37M8lLZjG
   +vTIi6SqBHPFUa/eyPZ/WegNJ5RG15eG7TKD3GGSWQxxuUKUS6SbSoFvG
   7UJSAjoZUItk9AmT9RYLQVRTMu9TG/bbOZ2R65RFAvlx1PZCXS/VMdQyH
   b6yM4VNJ3P/epZxQIjyfPj3CdsDp2nFAcEe2pu72VDep3lgBqTe1AOdkj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349672117"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="349672117"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 21:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759502459"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="759502459"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2023 21:53:19 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psG6g-00007h-0X;
	Fri, 28 Apr 2023 04:53:18 +0000
Date: Fri, 28 Apr 2023 12:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 51/57] drivers/rtc/rtc-ab-eoz9.c:471:10: error:
 initializing 'const struct hwmon_channel_info **' with an expression of type
 'const struct hwmon_channel_info *const[3]' discards qualifiers
Message-ID: <202304281217.WEZ6QT1n-lkp@intel.com>
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
commit: 4c3f19ce70d7a008953a8d2e9584a20c328699c6 [51/57] rtc: ab-eoz9: constify pointers to hwmon_channel_info
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230428/202304281217.WEZ6QT1n-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=4c3f19ce70d7a008953a8d2e9584a20c328699c6
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch --no-tags abelloni rtc-next
        git checkout 4c3f19ce70d7a008953a8d2e9584a20c328699c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281217.WEZ6QT1n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-ab-eoz9.c:471:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[3]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = abeoz9_info,
                   ^~~~~~~~~~~
   1 error generated.


vim +471 drivers/rtc/rtc-ab-eoz9.c

67075b63cce26c Artem Panfilov 2019-02-17  468  
67075b63cce26c Artem Panfilov 2019-02-17  469  static const struct hwmon_chip_info abeoz9_chip_info = {
67075b63cce26c Artem Panfilov 2019-02-17  470  	.ops = &abeoz9_hwmon_ops,
67075b63cce26c Artem Panfilov 2019-02-17 @471  	.info = abeoz9_info,
67075b63cce26c Artem Panfilov 2019-02-17  472  };
67075b63cce26c Artem Panfilov 2019-02-17  473  

:::::: The code at line 471 was first introduced by commit
:::::: 67075b63cce26c9a235986f163ce890e7bb035a7 rtc: add AB-RTCMC-32.768kHz-EOZ9 RTC support

:::::: TO: Artem Panfilov <panfilov.artyom@gmail.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
