Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736B2944E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579613; x=1711115613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R221u+h22HyuYT3ygACrgEsflSD/kOYs28PsSsxpwX0=;
  b=A1eiQ1Py+iODFP/DLjjGyZk6PBIX2XgNqcucntQ5knAXsMVInYcYQ0JH
   9F7AHWtwZk9t4M2Mi+IZLoTPNoK1DXEghlfdY3XO4kUQoqFBXIrDNTY8t
   1yDbBZL11DNDx8tEJOhMXHe0LwcbytGsrk+u34SqGhok56dn+8++pA2nz
   GxpViJSzkSeSP8rt0C7QD6URBXkpEhwfVuhaeWhM1eLIjcHWACHpeeVIe
   qwn0uUJNMFXpNI5CDI1RKlaMRekFxlcOdBM/L55YRwxnIE8Bym4jfl4Q9
   PUF+TOFUJhN3jrNbcFAM+jm8Vao4+aFmh3Xu19nnvaB9A93ZwHIDGAlDa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341043834"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341043834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746717841"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="746717841"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:46:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLGt-000EPq-2h;
	Thu, 23 Mar 2023 13:46:27 +0000
Date: Thu, 23 Mar 2023 21:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 4/4] unwind_kunit.c:undefined reference to
 `kunit_try_catch_throw'
Message-ID: <202303232114.23S5Iuk1-lkp@intel.com>
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
commit: 2aaad0e8b633791ba5d96e87bdf49cc05225d00a [4/4] WIP: add more unwind tests
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303232114.23S5Iuk1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=2aaad0e8b633791ba5d96e87bdf49cc05225d00a
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout 2aaad0e8b633791ba5d96e87bdf49cc05225d00a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232114.23S5Iuk1-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_nounwind':
   unwind_kunit.c:(.text+0x368): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x36c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x36c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x390): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_nounwind':
   unwind_kunit.c:(.text+0x428): undefined reference to `kunit_binary_ptr_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x42c): undefined reference to `kunit_binary_ptr_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x42c): undefined reference to `kunit_binary_ptr_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x450): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `uwd_assert_callers_present':
   unwind_kunit.c:(.text+0x6d0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x6d4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x6d4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x6f8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x720): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x724): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x724): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x748): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x770): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x774): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x774): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x798): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7ac): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7b0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7b0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7d4): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7e8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7ec): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x7ec): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x810): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_exit_unwind_from_caller':
   unwind_kunit.c:(.text+0x8c0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x8c4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x8c4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x8e8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x978): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x97c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x97c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x9a0): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller':
   unwind_kunit.c:(.text+0xa30): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xa34): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xa34): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xa58): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_regs':
   unwind_kunit.c:(.text+0xd60): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xd64): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xd64): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xd88): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_caller':
   unwind_kunit.c:(.text+0xe14): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xe18): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xe18): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xe3c): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_nounwind':
   unwind_kunit.c:(.text+0xec0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xec4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xec4): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0xee8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L138':
   unwind_kunit.c:(.text+0xf98): undefined reference to `kunit_kfree'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L133':
   unwind_kunit.c:(.text+0xff8): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `.L137':
   unwind_kunit.c:(.text+0x1040): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `uwd_test_init':
   unwind_kunit.c:(.text+0x107c): undefined reference to `kunit_kmalloc_array'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_caller':
   unwind_kunit.c:(.text+0x11d8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x11dc): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x11dc): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1200): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_regs':
   unwind_kunit.c:(.text+0x1290): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1294): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1294): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x12b8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller':
>> unwind_kunit.c:(.text+0x1344): undefined reference to `kunit_try_catch_throw'
>> loongarch64-linux-ld: unwind_kunit.c:(.text+0x13cc): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_regs':
   unwind_kunit.c:(.text+0x1448): undefined reference to `kunit_try_catch_throw'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x14d0): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x154c): undefined reference to `kunit_try_catch_throw'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x15d4): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1618): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_nounwind':
   unwind_kunit.c:(.text+0x1690): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1694): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1694): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x16b8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_regs':
   unwind_kunit.c:(.text+0x1850): undefined reference to `kunit_try_catch_throw'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x18d8): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller':
   unwind_kunit.c:(.text+0x1954): undefined reference to `kunit_try_catch_throw'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x19dc): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x1d18): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x1d90): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1d94): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1d94): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1db8): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1e0c): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_exit_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x1e9c): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1ea0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1ea0): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1ec4): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1f18): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x1fa8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1fac): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1fac): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x1fd0): undefined reference to `kunit_do_failed_assertion'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x2024): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x20b0): undefined reference to `kunit_try_catch_throw'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x2138): undefined reference to `kunit_log_append'
   loongarch64-linux-ld: unwind_kunit.c:(.text+0x217c): undefined reference to `kunit_log_append'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
