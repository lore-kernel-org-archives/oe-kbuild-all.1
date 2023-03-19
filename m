Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151E7EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 04:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679200865; x=1710736865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEq0f/dE5UjDupld5VHJ7yd0DUY3jfeXEkBgOcJpdaA=;
  b=EKYEusdo8HxRaL1H7Qwt8NwaA4epiBK950ZWy/KUAYjIzpFc3QD9/nVq
   sWBgyJMpjKlpUg/0WjAofXh5VipC/Kj9kIm5bTY7QQtyggRVk1PCNMtB4
   IlsXlISEbBYU5Ywn/SsgF8t4V/Hjdac266hvK2q42gLgGGdAjw0QXtYfb
   mzH3A+3KCyNZekn4kcZgobOFA1qaqot90CJ0VbbxedXKGfpw6DaIX5Qnb
   T/Wxx05L17NzGQEBvsex3ohvjcRbICKTgZTFy4xCM5pnkYA31EsQencS7
   AHkPB1WZX4BeQh/t89yxwDY/ZKToOUCqYNYm1MdW3BRtwZ/TJCFMKO70O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401056486"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401056486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 21:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="744972930"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="744972930"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2023 21:41:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdkqq-000AOd-38;
	Sun, 19 Mar 2023 04:41:00 +0000
Date: Sun, 19 Mar 2023 12:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Gow <davidgow@google.com>
Subject: lib/fortify_kunit.c:28:9: sparse: sparse: incompatible types for
 operation (==):
Message-ID: <202303191230.4hAT1iek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 875bfd5276f31d09e811d31fca638b9f4d1205e8 fortify: Add KUnit test for FORTIFY_SOURCE internals
date:   6 months ago
config: s390-randconfig-s032-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191230.4hAT1iek-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303191230.4hAT1iek-lkp@intel.com/

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
  > 30		KUNIT_EXPECT_EQ(test, __compiletime_strlen(ptr_of_11), 11);
    31	
  > 32		KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_unknown), SIZE_MAX);
    33		/* Externally defined and dynamically sized string pointer: */
    34		KUNIT_EXPECT_EQ(test, __compiletime_strlen(saved_command_line), SIZE_MAX);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
