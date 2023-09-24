Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3C263F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695552981; x=1727088981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUAsandOyrChLgQbIJdBHAthbFDWeQ2bD05z4zgu2zI=;
  b=aenim9I9incwlTYZIHhmg7s+ZcDFYVQwcgUC9uAJ59sdRtx91UhcqJEQ
   EflNCrNwrdmF2rUhMi5XuJwWTvLDgOoj0uRCjz591NufwghcwDQG1etS3
   JSSaLbqJMA4RJ6CJ/awHVRT5bIKferR/JddAym4pgnDUf7cI+4ROzmOrc
   r6A0HWPHihJIeduMPTLbzyOiewqbhVX9sfvN0oodHIsOgbqLTk4D6+Hml
   YmiYvWgWv52kdyH7bADtsMjQ6fH82H6USghF8b05EQDYc+N/SRNqTON9g
   iI2R6gozBawG3pOWsCQ2lBNpcMGnoW5fFR7Z6R+994Lup3OZqL5zq4j6B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="384921381"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="384921381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 03:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838284015"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="838284015"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2023 03:56:20 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkMmf-0003X3-2Y;
	Sun, 24 Sep 2023 10:56:17 +0000
Date: Sun, 24 Sep 2023 18:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 20829/30000]
 arm-linux-gnueabi-gcc: error: unrecognized command line option
 '-ftrivial-auto-var-init=pattern'
Message-ID: <202309241848.dmD84Rz5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi glider,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   ad961d38d460347804a760cc363da844582a8190
commit: a7eda6eddca559c1c3a897a35692f9d49d46c9dd [20829/30000] BACKPORT: security: allow using Clang's zero initialization for stack variables
config: arm-randconfig-r002-20230824 (https://download.01.org/0day-ci/archive/20230924/202309241848.dmD84Rz5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241848.dmD84Rz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241848.dmD84Rz5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-gcc: error: unrecognized command line option '-ftrivial-auto-var-init=pattern'
   make[2]: *** [./Kbuild:22: kernel/bounds.s] Error 1 shuffle=4018795418
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1213: prepare0] Error 2 shuffle=4018795418
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=4018795418
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
