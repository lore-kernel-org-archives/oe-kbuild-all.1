Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AC17FFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686839417; x=1718375417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=waQ2PpAF2HAh6nSdnF9f8HRiyvWMHNLhurj5NYgEDpQ=;
  b=nTANnD72uH7ZpITttTzFh3G/LXFXSOutOZabM+24kMpRV5eRLr7oOq8L
   hE6KasrQfAkB6wSJHNpBT7Kh8ZVUwCMxABwnA//SwlYZHMA5bfZEVljEH
   diGV4AwhObxr55eG08J2DX2oThdAx5b+rlhf0NjekkKhpS5c/bLs8zzZv
   BkJ4jkFXqhvXmDCqTfUvzYEPg6DJrl2b395gECqeTy9xrSFqNiLqqudY8
   sPsjSwUxbLi8VG/R3MlVyMvn/sGdoF7bJaHPc6q4zX2Fd1As/8BNDns4X
   N9MOm49pAFGNJFhFQhR0c71icMJSgY9UvpNUJRmNwIa8/dInf26HA0oz+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361420153"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="361420153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662784514"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="662784514"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 06:32:37 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9n5Y-0001w7-2d;
	Thu, 15 Jun 2023 13:32:36 +0000
Date: Thu, 15 Jun 2023 21:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] ld.lld: error: undefined symbol:
 uhid_hid_driver
Message-ID: <202306152105.xj22YnT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e699d543bbc9d7614db3e01323c9321437304286
commit: e699d543bbc9d7614db3e01323c9321437304286 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-randconfig-r022-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152105.xj22YnT5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout e699d543bbc9d7614db3e01323c9321437304286
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152105.xj22YnT5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: uhid_hid_driver
   >>> referenced by hid-core.c:1770 (drivers/hid/hid-core.c:1770)
   >>>               hid/hid-core.o:(hid_report_raw_event) in archive drivers/built-in.a
   >>> referenced by hid-core.c:293 (drivers/hid/hid-core.c:293)
   >>>               hid/hid-core.o:(hid_add_field) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
