Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6231865
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686281649; x=1717817649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hb581iLVTLPVSvgby8uCZQ009hOx5lAXj3+rEvruK0Y=;
  b=Xx073/VDQ4PShb9Os3Vwd2IK5vmlRTK7iglGiRrw2Kmrul2visLcC2kf
   EDpfvs7xLDiOqKTv4URi+8shs0xkUS0vxwGtyqu7yO9gZAqMWhD6ltpts
   P4vucLk9tUHMR7nAH0XUDSn4mRxuD79+4j0p9cCCzXx+kMcTzlP2Gggl5
   3GBymp3DwZO7k/E068bJei8mgGDXWZQsgfZwHnOkAzsGvQY7yxnvWcJ6S
   yeQcu6/a17upzkas9kTPxjH0Wk/BmiikUdSVywMGbkDl6mUjWzh3X3IIX
   mjAqu87CCYKM1CejupB5pjwygehbMc30tswyrb3zP7o2pnSyvS6jBcAkb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="443870729"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="443870729"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854592823"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="854592823"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2023 20:33:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SsA-0008aS-3A;
	Fri, 09 Jun 2023 03:33:10 +0000
Date: Fri, 9 Jun 2023 11:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 65/68] scripts/Makefile.clean:15:
 fs/esdfs/Makefile: No such file or directory
Message-ID: <202306091133.QoPNrw5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sarthak,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   8b8a32be3e052dfbecd62b77b478c333a8e00a0c
commit: 2184886a1a39a09e7a3665bc2823783ec0447422 [65/68] CHROMIUM: fs: drop esdfs tree
config: s390-randconfig-r044-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091133.QoPNrw5q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 2184886a1a39a09e7a3665bc2823783ec0447422
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 distclean

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091133.QoPNrw5q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/Makefile.clean:15: fs/esdfs/Makefile: No such file or directory
>> make[4]: *** No rule to make target 'fs/esdfs/Makefile'.
   scripts/Makefile.clean:15: Failed to remake makefile 'fs/esdfs/Makefile'.
   make[3]: *** [scripts/Makefile.clean:62: fs/esdfs] Error 2 shuffle=2098703268
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [scripts/Makefile.clean:62: fs] Error 2 shuffle=2098703268
   make[2]: Target '__clean' not remade because of errors.
   make[1]: *** [Makefile:2017: _clean_.] Error 2 shuffle=2098703268
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:238: __sub-make] Error 2 shuffle=2098703268
   make: Target 'distclean' not remade because of errors.


vim +15 scripts/Makefile.clean

2315c6e4227815 Sam Ravnborg    2005-07-25  12  
2a691470345a00 Sam Ravnborg    2005-07-25  13  # The filename Kbuild has precedence over Makefile
db8c1a7b2ca25f Sam Ravnborg    2005-07-27  14  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
5c8166419acf46 Masahiro Yamada 2022-02-11 @15  include $(or $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Makefile)
^1da177e4c3f41 Linus Torvalds  2005-04-16  16  

:::::: The code at line 15 was first introduced by commit
:::::: 5c8166419acf468b5bc3e48f928a040485d3e0c2 kbuild: replace $(if A,A,B) with $(or A,B)

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
