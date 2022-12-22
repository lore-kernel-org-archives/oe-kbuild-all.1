Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2BF15A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 02:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671676132; x=1703212132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76/VkurjuvIBKByD3ypW98ReLq16yEpy8QgQ7rhexn0=;
  b=knypdKS1oBWejpzUyheUhgElyevaPyvaitiPKqP3oyBeq+tlcxjo3aDs
   xz169giq01Qgo7lR5gYMdZcy/c0TnTsxe0PXMuX0gRSoJ3duhpNmGCzJP
   5dAN5ZyBnTLdKNOlka76nSJU9MKcguqyQm1gOTf/jJ4GWYKaKxVEfpC3/
   v8ootcykpLFquq6oWVTrWR+SqXu9WvaExyjXTLFmGHxeVIg0v3MVwAhjf
   Iq0awcrOd8Lwy/983D46YTAPG0io4y/I8utUM1pEFVLls5nVtWOv0nOTJ
   rgE9/dbXCsrE6nuMBb98CVi+W0LYoVZAoMB+uce3DC7eRq26RPRCKZsL9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="347161846"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="347161846"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 18:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="740380095"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="740380095"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2022 18:28:51 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8BKE-000B8K-1y;
	Thu, 22 Dec 2022 02:28:50 +0000
Date: Thu, 22 Dec 2022 10:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1480/7889] ld.lld: error:
 cannot open
 /opt/cross/clang-98b13979fb/lib/clang/16/lib/linux/libclang_rt.builtins-x86_64.a:
 No such file or directory
Message-ID: <202212221059.BwuU2N10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   360f068dadbea1c60ecb5ccbf196d9166f47cc5e
commit: f14e5bfb39b776318133e00b8c066ce8a870e9ab [1480/7889] ANDROID: Makefile: add compiler-rt dependency explicitly
config: arm-randconfig-r046-20221218 (attached as .config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98b13979fb05f3ed288a900deb843e7b27589e58)
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

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open /opt/cross/clang-98b13979fb/lib/clang/16/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-98b13979fb/lib/clang/16/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> ld.lld: error: cannot open /opt/cross/clang-98b13979fb/lib/clang/16/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
>> ld.lld: error: cannot open /opt/cross/clang-98b13979fb/lib/clang/16/lib/linux/libclang_rt.builtins-x86_64.a: No such file or directory
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
   make[2]: *** [scripts/Makefile.host:95: scripts/basic/fixdep] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:540: scripts_basic] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
