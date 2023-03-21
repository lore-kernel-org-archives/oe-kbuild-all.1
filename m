Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E08C952
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 16:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679415198; x=1710951198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7n1aS0uTQiladsK5x4ggym0Yh3ncWq2fDYU0c99o+OA=;
  b=eEZbrFBU1K3hxslhW/Wm3/Qv+II4LSic/wNAeYu55/bW8Nad7Svz3iht
   tgpYYD0kFSI1APrsFZ80w4u1FEaAzAK4D620mtrC/ieLnE3QuLj6lp5za
   lnIUMakeuc0ll4EjSc7C7EUCfTvUADG+wN/zUckFf/D06huXjwFLr1oC3
   67OEQtTQ7uAGGntOXJlfiSmQ7qY+cwbl+RLanVQj+na6r00YsXmVZioll
   RCTlZEEXCZLafHnFTZZv8bgYuGoH/nm/vIgOt+6NLaVqNZXCDlZhAr0qH
   bACgtdUWCcrcWMo1vDoUXtSuxY7lBo4RIxI67SUxpGmnC0e6ajd6d7nUn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336489416"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336489416"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="683935561"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="683935561"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 09:09:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peeYM-000C7q-0R;
	Tue, 21 Mar 2023 16:09:38 +0000
Date: Wed, 22 Mar 2023 00:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2/4] ld.lld: error:
 arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is
 not available
Message-ID: <202303220051.cdBsdzum-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   68e69330918a5955c8c9904adf310c46070be0e7
commit: c9ff7eb7e9555026f4ce95f06ef7c13395468d51 [2/4] BACKPORT: lib/crypto: blake2s: include as built-in
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230322/202303220051.cdBsdzum-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout c9ff7eb7e9555026f4ce95f06ef7c13395468d51
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220051.cdBsdzum-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available
>> ld.lld: error: arch/x86/crypto/blake2s-shash.o: contains a compressed section, but zlib is not available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
