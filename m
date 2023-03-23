Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8213C04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679566163; x=1711102163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5dxpuYbJEv7m8np84hU7kHXjKAXONjMz8G/akDXli4=;
  b=bjQD01CD9yNZQ7BEBTQocnS68eQB3WLcahpyzkO8eOzHkqIk/qxVMEQV
   f+PnkV21r6RHP7t5pvThNCcgadEdNWaC/4i7NFD5upUtkRfe9hRxM2OhX
   VYPB7aC0Qc8XvnrCHSAy6LQ/PG8+bscMgNaNi6okiRbaMwe7mfcqz0F7f
   2KA0+cqVa9EhI7QMzrOuPF3cXfub1u43SKg3dqrR3yqEp2z6xoIOL5cPc
   OrPnQ0Bt9oM3GAWvLyFR9dV3+Niyca4F5u2a2imbQ3pJM+X13k+wVki0m
   jFCQvxp/rpCRH/RurG9v/FnMP3H1rc5MsW9mMiBu+A7OPdPvRSW7N/R7g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323293901"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="323293901"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684657223"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="684657223"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 03:09:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfHsn-000EEy-04;
	Thu, 23 Mar 2023 10:09:21 +0000
Date: Thu, 23 Mar 2023 18:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4]
 unwind_kunit.c:(.text.test_nounwind+0x54): undefined reference to
 `kunit_binary_ptr_assert_format'
Message-ID: <202303231811.ceoylpFv-lkp@intel.com>
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
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303231811.ceoylpFv-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=fac0c3411c9aacc9f7954eab7e0e8792b1fb15f6
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout fac0c3411c9aacc9f7954eab7e0e8792b1fb15f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231811.ceoylpFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: lib/unwind_kunit.o: in function `test_nounwind':
>> unwind_kunit.c:(.text.test_nounwind+0x54): undefined reference to `kunit_binary_ptr_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x58): undefined reference to `kunit_binary_ptr_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x8c): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_test_init':
>> unwind_kunit.c:(.text.uwd_test_init+0x34): undefined reference to `kunit_kmalloc_array'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_test_exit':
>> unwind_kunit.c:(.text.uwd_test_exit+0x98): undefined reference to `kunit_kfree'
>> mips-linux-ld: unwind_kunit.c:(.text.uwd_test_exit+0x1bc): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_test_exit+0x258): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_assert_callers_present':
>> unwind_kunit.c:(.text.uwd_assert_callers_present+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0xf8): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0xfc): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x13c): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x17c): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x180): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x1c0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x1f0): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x1f4): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x238): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x268): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x26c): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x2b0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
>> unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x84): undefined reference to `kunit_log_append'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
