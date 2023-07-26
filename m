Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D4BE5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 23:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690415261; x=1721951261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53V0XPwzR3nc5xfEbvFc3Ekg2YXBthqAdHNvwkSEZYE=;
  b=Gu7f4uxodGKcG9pkQJ4vR9AfZSBhmhXeTXdzmJijDTD1xlFoDAPEEb7H
   +DuRmcVeUmAIwOLNG3mIRV4b8DIyWSLfp7rAj2am+Q1KExbxSMkPopTBo
   JACUyXpigkN6rioyfaH5YX6p6/yETN5uDPyYxLzw/NJv/nO4honOv74ab
   5yyDCq8dkWAyyrz7WxKTjavJHEjjKv371ZRPAdsRTQeBWDCvOHgdi1gL9
   ScNX27FW6D802HwhV6m64L8iCBJcKcmk1MUcYgA5nEJ0sd8bbw3B5pSqe
   oGnKQv4weOqE9/r9ebKLKNEmDCnuRRVTJQYILWGIZuEMI0pKWOQKXoXy+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348439870"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="348439870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 16:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792084719"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="792084719"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 16:47:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOoEE-0001S3-36;
	Wed, 26 Jul 2023 23:47:39 +0000
Date: Thu, 27 Jul 2023 07:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10-gki-base 5/5]
 drivers/staging/Kconfig:121: can't open file
 "drivers/staging/dev-sw-sync/Kconfig"
Message-ID: <202307270736.F5ExrlbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10-gki-base
head:   ef6460a91e988fd1da22cb484a52ab23b7bf7bec
commit: ef6460a91e988fd1da22cb484a52ab23b7bf7bec [5/5] Remove DEV_SW_SYNC driver
config: arm-randconfig-r046-20230726 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270736.F5ExrlbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307270736.F5ExrlbO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/Kconfig:121: can't open file "drivers/staging/dev-sw-sync/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1 shuffle=3862656083
   make[1]: *** [Makefile:631: oldconfig] Error 2 shuffle=3862656083
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=3862656083
   make: Target 'oldconfig' not remade because of errors.
--
>> drivers/staging/Kconfig:121: can't open file "drivers/staging/dev-sw-sync/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1 shuffle=3862656083
   make[1]: *** [Makefile:631: olddefconfig] Error 2 shuffle=3862656083
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=3862656083
   make: Target 'olddefconfig' not remade because of errors.


vim +121 drivers/staging/Kconfig

1747938a37d1dfa Mauro Carvalho Chehab 2020-08-17  120  
48ea82ac43eed4b srok                  2021-12-07 @121  source "drivers/staging/dev-sw-sync/Kconfig"
48ea82ac43eed4b srok                  2021-12-07  122  

:::::: The code at line 121 was first introduced by commit
:::::: 48ea82ac43eed4b05156e7875d41e2f354d101bc CHROMIUM: [arcvm-kernel-v5.10] Add dev_sw_sync option

:::::: TO: srok <srok@google.com>
:::::: CC: Treehugger Robot <treehugger-gerrit@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
