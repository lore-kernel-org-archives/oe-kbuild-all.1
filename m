Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0D19F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679568683; x=1711104683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CxCXye+j8XtvIZmVPy11LBLnIZJQw49LE2BQ6CM2HmA=;
  b=b1uvHp/8fFeDbh6qLoKHnEmtli1NjQSvQF+U+K7gw/YtWAU8yVu4Q+MM
   DG5wxl67LfXC8mHzG3vs/TmbnryX0xh1KZxRJos7pzajk7xsSbEO30CH9
   vatg/9+5yBlL3QY+7xnM9HOAqsNvFYtgCItjgOXQtyi8ubHKk1Y9BDzOO
   7e2KqMzRKdSIGdYgbNCo5uMYlbm36aKoABd36ipIRxYAiaSuEhg3yzxqP
   mCTGwumHDnZSStDmoTybw6xrDscc8A+E1PAggWHlXwxUpj5N48MqmjMQ1
   3kcuSyLj6eTaCr1fMiWWvC06eSLaU7Sq3tCuXL5jbqZX+GM0i4mEqfE6s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319842746"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319842746"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746674192"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="746674192"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 03:51:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIXR-000EG6-2b;
	Thu, 23 Mar 2023 10:51:21 +0000
Date: Thu, 23 Mar 2023 18:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4] unwind_kunit.c:undefined reference to
 `kunit_binary_ptr_assert_format'
Message-ID: <202303231822.UMYqfXYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   2aaad0e8b633791ba5d96e87bdf49cc05225d00a
commit: fac0c3411c9aacc9f7954eab7e0e8792b1fb15f6 [3/4] lib: add basic unwind tests
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231822.UMYqfXYi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=fac0c3411c9aacc9f7954eab7e0e8792b1fb15f6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout fac0c3411c9aacc9f7954eab7e0e8792b1fb15f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231822.UMYqfXYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_nounwind':
>> unwind_kunit.c:(.text+0x104): undefined reference to `kunit_binary_ptr_assert_format'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x108): undefined reference to `kunit_binary_ptr_assert_format'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x108): undefined reference to `kunit_binary_ptr_assert_format'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x12c): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `uwd_assert_callers_present':
>> unwind_kunit.c:(.text+0x2f8): undefined reference to `kunit_binary_assert_format'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x2fc): undefined reference to `kunit_binary_assert_format'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x2fc): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x320): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x348): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x34c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x34c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x370): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x398): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x39c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x39c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x3c0): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x3d4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x3d8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x3d8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x3fc): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x410): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x414): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x414): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x438): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
>> unwind_kunit.c:(.text+0x4f8): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L55':
>> unwind_kunit.c:(.text+0x638): undefined reference to `kunit_kfree'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L50':
   unwind_kunit.c:(.text+0x698): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L54':
   unwind_kunit.c:(.text+0x6e0): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `uwd_test_init':
>> unwind_kunit.c:(.text+0x71c): undefined reference to `kunit_kmalloc_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
