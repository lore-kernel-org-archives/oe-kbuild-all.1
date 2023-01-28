Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27283D6A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674909272; x=1706445272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TbQP305ZCX2UDTnM43rvxwG4nSuQHlcKj2py5Yh2Hio=;
  b=FgpuYJTeD/n3VXLS7udjum7epLxe39/FsME4k4LIjuhmtwUO+C+wirfB
   QX4c13mNGbR0g5ALvJl9jDmIE6rq+JVSNTin5JmAJfeVUjeXi2hLqSHKj
   AqGGWnNmGimZ7G8+U6O2FGdZXEGncVexiYBkuD1hxjj3R2XKRi12kJpNv
   SEiapcoNbhJ0TorDMuGTcWkkjUemOlzdP+YrGv7zZVNSRksSI+0MiE6U7
   jNOBm8jpLSetTmmKwRYQsyOQ3+Pv3vEbyw9hf+xSFjgdv6S0UxbglVJJv
   dybwUrB2f4y64wrvcj9TJ7VUztg4cSZRpY/+jGEhE9S54Q9RB/lj401Bi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="315241210"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="315241210"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 04:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="665554568"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665554568"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 04:34:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLkPc-0000e5-0u;
	Sat, 28 Jan 2023 12:34:28 +0000
Date: Sat, 28 Jan 2023 20:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 22/24] make[4]: *** No rule to make target
 'drivers/mfd/htc-pasic3.o', needed by 'drivers/mfd/built-in.a'.
Message-ID: <202301282024.NcchLCFv-lkp@intel.com>
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
config: sparc-randconfig-r013-20230128 (https://download.01.org/0day-ci/archive/20230128/202301282024.NcchLCFv-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=ff78a86f1bb2667ded7fa326a8b81e655476af32
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout ff78a86f1bb2667ded7fa326a8b81e655476af32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'drivers/mfd/htc-pasic3.o', needed by 'drivers/mfd/built-in.a'.
   make[4]: Target 'drivers/mfd/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
