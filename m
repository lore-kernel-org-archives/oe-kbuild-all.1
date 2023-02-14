Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413F2CA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676410344; x=1707946344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMSfpEsz1zhAG9WloSHYgcuVtb9jwfjt7d9Iw8J3PB8=;
  b=Sf876B4m02hVj12alg3FMg1r9RtmK2jqk1DENel72WFeEBFc24FJaWXu
   AM8KnHfnLfk0Ka9j/kPytTrFnaDgybHTct5r0YeaFaSy6VkVJEWKsEQKz
   sFhfS/UOFUuAyejW4FQsQ2hds0k+xxLDlreK/BhDujPgX3owsc3D2fPMP
   QCv0L+LA4VspU0HwiHqSYeOCD2L0VFngpVLmi6r9fVDzfMfggKfbu3KTt
   f5+s+d9jMTG6CHpNUceY82u8Ax+0aNdh1EdamUCR0iMtmPRCVNrmZs7M8
   uMEmyX8CAygM/STbTh7IHQ7nIlOP6pvoSnRw33NQzlJxDz6+mYvXfxCeP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331275506"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="331275506"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 13:32:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="669359774"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="669359774"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Feb 2023 13:32:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS2uU-0008nZ-0b;
	Tue, 14 Feb 2023 21:32:22 +0000
Date: Wed, 15 Feb 2023 05:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1480/7892] ld.lld: error:
 cannot open
 /opt/cross/clang-db89896bbb/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a:
 No such file or directory
Message-ID: <202302150523.9SGiXUuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   e88b0fcae6db893ef5f2a45ad70499e02ee01a4e
commit: f14e5bfb39b776318133e00b8c066ce8a870e9ab [1480/7892] ANDROID: Makefile: add compiler-rt dependency explicitly
config: arm-randconfig-r046-20230213 (attached as .config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout f14e5bfb39b776318133e00b8c066ce8a870e9ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150523.9SGiXUuS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open /opt/cross/clang-db89896bbb/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-db89896bbb/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> ld.lld: error: cannot open /opt/cross/clang-db89896bbb/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-db89896bbb/lib/clang/17/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
