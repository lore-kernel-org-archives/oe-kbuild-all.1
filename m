Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B97475
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679076498; x=1710612498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXO2TNDe2Y0UfGLHCDkc624zArbTsFBgI+ncQU5dl+U=;
  b=IHggMptEqvaxX90bXevcloroYJllgqrE365bA760xQ9j59ZbVh0fPUtF
   FrmB0EIZ1y+OhvK4lWy8qxQmXmS/zgFgC5V6AsIkIV0PzNoSSh1ys/ZP7
   dZ4pj2giVXWTvAN7tZeKU5Xfk46CsyUl+rZG8v+Nq6c8RovkbLdaGLC2Q
   xW+Iw7pViQo/miFGiToKpCPgQmZWkAcFiqxwcduJwHVopD1orJRxYgUBN
   QE8iVMO5+T1jgZe2jb/4KlAcVoEipEfO0ohPYWzyku21P0TcZPNfkyGyv
   dGQVzGi4FHoC/pn7lHxhwbQ7psVWTWcXJT+JNTJseZg5SqVmXXv/qXfLL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340684884"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="340684884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 11:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790827429"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="790827429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 11:08:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdEUx-0009WA-2g;
	Fri, 17 Mar 2023 18:08:15 +0000
Date: Sat, 18 Mar 2023 02:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] usercopy_kunit.c:undefined reference
 to `insert_vm_struct'
Message-ID: <202303180207.edqtP01s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   bcab174e50dd95f92848c50fdfec65390e201a4b
commit: ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6 [1/4] lib: test copy_{to,from}_user()
config: sh-randconfig-r014-20230312 (https://download.01.org/0day-ci/archive/20230318/202303180207.edqtP01s-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/uaccess/fixes
        git checkout ec0cb0c84a9b083ec60a9d601f96fdf1eac85bb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180207.edqtP01s-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: lib/usercopy_kunit.o: in function `usercopy_test_init':
>> usercopy_kunit.c:(.text+0x5dc): undefined reference to `insert_vm_struct'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
