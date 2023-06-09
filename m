Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E0408D0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 23:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686352615; x=1717888615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwEIODTfoHeaiGdvqT8JtJUuHv9n4k9aiwdj0/1vGdg=;
  b=ihXM6pIUsP4zcgcHIuujKKhIuJI/pzr8Px1pahpEFalnoCmWdlWtS1Dl
   y4PrqD5l0zef346ik+9FvNtn8bz6H+Tc8/QrMp2t5xnPR6XVeUzpEEDMA
   bs5xWrkEdoogBTxCbDcoyOqJGt6kkTkL6FR2inoPIkCpi3NIviXlZzcOh
   gsUnPzIWEAPog4j5JHRPRg6d5MOnggMZSzLYNcrwph9JSCQDDsveYNclg
   9N/hrkCQsUGCE29cei6C3D0V9GYj/S6j5eEFkl5bOO1Ji4KolLUn37ZqJ
   nEE984IEYKyGssPLuRJFD7FKI3vn102pYTvxk1BgzQLKtsLg0vpfj15bU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="357704648"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="357704648"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 16:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800374544"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="800374544"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2023 16:16:53 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7lLg-0009UH-2m;
	Fri, 09 Jun 2023 23:16:52 +0000
Date: Sat, 10 Jun 2023 07:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 111/120]
 drivers/iommu/io-pgtable-arm.c:1287:19: warning: stack frame size (1032)
 exceeds limit (1024) in 'arm_lpae_do_selftests'
Message-ID: <202306100736.nWWMzocV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   9b16d612bf4f096520aca2a89654edcf39f4cf2e
commit: 8326170bb6a02c97289689a4efda7062e991285f [111/120] ANDROID: GKI: Add OEM data to mutex/rwsem
config: arm-randconfig-r046-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100736.nWWMzocV-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 8326170bb6a02c97289689a4efda7062e991285f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/iommu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100736.nWWMzocV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm.c:1287:19: warning: stack frame size (1032) exceeds limit (1024) in 'arm_lpae_do_selftests' [-Wframe-larger-than]
   static int __init arm_lpae_do_selftests(void)
                     ^
   1 warning generated.


vim +/arm_lpae_do_selftests +1287 drivers/iommu/io-pgtable-arm.c

fe4b991dcd84e0 Will Deacon 2014-11-17  1286  
fe4b991dcd84e0 Will Deacon 2014-11-17 @1287  static int __init arm_lpae_do_selftests(void)

:::::: The code at line 1287 was first introduced by commit
:::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consistency tests to ARM LPAE IO page table allocator

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
