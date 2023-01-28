Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F15C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674911792; x=1706447792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03Vcz4Hw7Su+V7B04XM75DP7UQoLhulStW7YTaGX/NY=;
  b=i0YoP8GE2MVYqT/WUT8XkaeEoDPicEzFurQgGu+s7X2MBZmu81l6+0NF
   dQq2Mz4qdXpEWWK9+bvKzPm7lhmxU4wZnZfNrBLGUDElOjlwTW0jur5IH
   /3gW6ySwN6jU5D+qOHdKtkKn895PAXndxTT/SloV73dGgDHOMDhlVEOcp
   pVSDOtokaSH1IxAGwZ6CYbnILh9Cm8XCsuaqBqBH63IAsJHuOrqbt/Ui1
   CLMc9otjdpxO8XCbl3SNHx/uGLJ8dQtLa2SURs95PPHiK3SSgF8cpcy9E
   Wc0W1+ih//kiCJaap5OLd3QlfuLVwHYcxMnaWpzlSzU2qBtBJv7otdzyh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="329417897"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="329417897"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 05:16:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992378496"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992378496"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 05:16:30 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLl4H-0000ff-28;
	Sat, 28 Jan 2023 13:16:29 +0000
Date: Sat, 28 Jan 2023 21:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 22/24] make[4]: *** No rule to make target
 'drivers/mfd/htc-pasic3.o', needed by 'drivers/mfd/'.
Message-ID: <202301282145.jFyc2Hb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   b8fe87f4ba9b3343e0682ce191cf33daa43039e8
commit: ff78a86f1bb2667ded7fa326a8b81e655476af32 [22/24] mfd: Remove htc-pasic3 driver
config: arc-randconfig-m031-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282145.jFyc2Hb4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=ff78a86f1bb2667ded7fa326a8b81e655476af32
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout ff78a86f1bb2667ded7fa326a8b81e655476af32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/mfd/htc-pasic3.o', needed by 'drivers/mfd/'.
   make[4]: Target 'drivers/mfd/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
