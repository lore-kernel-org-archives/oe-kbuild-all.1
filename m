Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BBD63DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 03:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695784086; x=1727320086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QDd+32FprjQsJFSJKfUjZgJ+Hmm0kmJfuXdwni+O0Gg=;
  b=h+pmchwWlZtctx+NxAuu5eof+lgFCC1vFLA7MhPFK5WVPJJQe2vg3VBy
   COfO0zU8pc+t8lG1J/4HoCoonCeFsqrGHujUSv2NWGW4IG0ZPW0Tr5lLw
   /cuhsFtFk6/JMdnxBsVNrv9SYRap55V7j9K7uMRLVgthrse9OGq+tDoTM
   CdSXhvt+xOTml+RgcudYvb17opbMCmawrVnyPzNrrKj3ch1pYPWITnQR+
   uh/N048GDpcWEwqJVCI4JwXsBE7YU9aYP6QZ3sHBRTHyDWh8VARDmU1yD
   dCmlBpQ1ChkKMKu0i2ENkRX9KC0Ccu5zb5FeSh0J7Gdq80zLkcaOTnud8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361098557"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="361098557"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 20:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="749029258"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="749029258"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 26 Sep 2023 20:08:04 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlKtE-0003fa-0q;
	Wed, 27 Sep 2023 03:07:31 +0000
Date: Wed, 27 Sep 2023 11:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sh4-linux-gcc: error: -pg and -fomit-frame-pointer are incompatible
Message-ID: <202309271150.F7XFcO2K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e945134b680040b8613e962f586d91b6d40292d
commit: 2a61f4747eeaa85ce26ca9fbd81421b15facd018 stack-protector: test compiler capability in Kconfig and drop AUTO mode
date:   5 years ago
config: sh-randconfig-r082-20230815 (https://download.01.org/0day-ci/archive/20230927/202309271150.F7XFcO2K-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309271150.F7XFcO2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309271150.F7XFcO2K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sh4-linux-gcc: error: -pg and -fomit-frame-pointer are incompatible
   make[2]: *** [./Kbuild:21: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1086: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
