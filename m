Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6B632
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Apr 2023 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682255412; x=1713791412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEeT4Lr/EMRAS6taXQOv+UrQfw44pWXmHsQOrTuHV7E=;
  b=U2HzdqJoB3iJiqVS63Fg0C3j9d4Ysd6lTqlTvtdr3skuqAuxnyOMyWTx
   80C1dDxHUDii5gOYW++rMvu2gay2NwhI2no+JDieu4WY4pYxhqncO9lHd
   iVI6svd/7WRk8pWIyriKHvvBtE9ijZ0640KCNVVQCzO4pvXCOPGCGYF52
   q23rwMz7tV7MbLaYi4xaHWpcoYIyhtPGu26QARh/mRx5qHrgm3X35itdl
   wZ7rCyp+AQvbmTkchKFqQ+eucBTEGjgTtuGZIKBmD47uP5oRZ36tcqqep
   S6dD1jazFcHE1XI/oDbsLIQXnK8Jlbjd7ZmLHOWMiD57wmGHua3CDUyJm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348191352"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="348191352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 06:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="816946904"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="816946904"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2023 06:10:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqZTl-000huK-0t;
	Sun, 23 Apr 2023 13:10:09 +0000
Date: Sun, 23 Apr 2023 21:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Gow <davidgow@google.com>
Subject: lib/fortify_kunit.c:28:9: sparse: sparse: incompatible types for
 operation (==):
Message-ID: <202304232034.zAYM3qkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   622322f53c6d9ddd3c2a4aad852b3e1adbd56da7
commit: 875bfd5276f31d09e811d31fca638b9f4d1205e8 fortify: Add KUnit test for FORTIFY_SOURCE internals
date:   8 months ago
config: s390-randconfig-s051-20230423 (https://download.01.org/0day-ci/archive/20230423/202304232034.zAYM3qkH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=875bfd5276f31d09e811d31fca638b9f4d1205e8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 875bfd5276f31d09e811d31fca638b9f4d1205e8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304232034.zAYM3qkH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/fortify_kunit.c:28:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:28:9: sparse: sparse: undefined identifier '__compiletime_strlen'
>> lib/fortify_kunit.c:28:9: sparse: sparse: incompatible types for operation (==):
>> lib/fortify_kunit.c:28:9: sparse:    bad type const __left
>> lib/fortify_kunit.c:28:9: sparse:    int const __right
   lib/fortify_kunit.c:29:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:29:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:29:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:29:9: sparse:    bad type const __left
   lib/fortify_kunit.c:29:9: sparse:    int const __right
   lib/fortify_kunit.c:30:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:30:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:30:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:30:9: sparse:    bad type const __left
   lib/fortify_kunit.c:30:9: sparse:    int const __right
   lib/fortify_kunit.c:32:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:32:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:32:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:32:9: sparse:    bad type const __left
>> lib/fortify_kunit.c:32:9: sparse:    unsigned long const __right
   lib/fortify_kunit.c:34:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:34:9: sparse: sparse: undefined identifier '__compiletime_strlen'
   lib/fortify_kunit.c:34:9: sparse: sparse: incompatible types for operation (==):
   lib/fortify_kunit.c:34:9: sparse:    bad type const __left
   lib/fortify_kunit.c:34:9: sparse:    unsigned long const __right
   lib/fortify_kunit.c:56:16: sparse: sparse: undefined identifier '__compiletime_strlen'

vim +28 lib/fortify_kunit.c

    25	
    26	static void known_sizes_test(struct kunit *test)
    27	{
  > 28		KUNIT_EXPECT_EQ(test, __compiletime_strlen("88888888"), 8);
    29		KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_of_10), 10);
    30		KUNIT_EXPECT_EQ(test, __compiletime_strlen(ptr_of_11), 11);
    31	
  > 32		KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_unknown), SIZE_MAX);
    33		/* Externally defined and dynamically sized string pointer: */
    34		KUNIT_EXPECT_EQ(test, __compiletime_strlen(saved_command_line), SIZE_MAX);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
