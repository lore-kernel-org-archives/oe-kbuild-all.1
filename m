Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F61C26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 05:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677130764; x=1708666764;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Pjfs+0tlpuuUNOaNV5+JtbQgu/ORC53msBn8Liullnk=;
  b=LoCNHRAxSNJyAZEjcE1JAukUcwuzUHihoFoI11APEQ7aMb9IpTadVFLE
   QNKqCa9XBKAVYF4nXoiChCkoITyaGolHFVGk+uV2+B9+GgW2PCEV7mWLa
   NoBM1WbK9K3zlc3EWgDM3gOzC/sCqv0XjoDzAF5xAdOI3j9ivYugPJJqh
   k0Fe3toUULDrDk8p5kbAyaO8llxd4kWkMHyVZm5W8/+5aPenDFd1WhwZ7
   NCvNSAEv/ODd50SlTk/p7zQZF9LezlcSjW1d23tenDlbDALxpanFcB4E8
   x7Bzpbx2wHzqOhotWpgOsug3ButzRYUuzw7hIyIFpyjgzdHYpM+a1bPhi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360609210"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="360609210"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 21:39:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="917852551"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917852551"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Feb 2023 21:38:50 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV4Jd-00015g-1S;
	Thu, 23 Feb 2023 05:38:49 +0000
Date: Thu, 23 Feb 2023 13:38:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-android-linux-5.10.y 15/19] error: option '-mrecord-mcount'
 cannot be specified without '-mfentry'
Message-ID: <202302231336.NJzf2ftz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-5.10.y
head:   7719cd0b7e86f706a1467a15a115cabb56f78d6e
commit: a42e14577f5f344ce9615317d27986c46208a058 [15/19] ANDROID: arm64: merge fixes
config: s390-randconfig-r011-20230222 (https://download.01.org/0day-ci/archive/20230223/202302231336.NJzf2ftz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-android-linux-5.10.y
        git checkout a42e14577f5f344ce9615317d27986c46208a058
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231336.NJzf2ftz-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: the flag '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang' has been deprecated and will be ignored [-Wunused-command-line-argument]
   clang: warning: the flag '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang' has been deprecated and will be ignored [-Wunused-command-line-argument]
>> error: option '-mrecord-mcount' cannot be specified without '-mfentry'
   1 error generated.
   make[2]: *** [scripts/Makefile.build:122: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1317: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
