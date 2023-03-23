Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0189446
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 13:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579190; x=1711115190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ybag5jqR1/Pu+uK83DbadnfqElk+O4Kml3IWqD9bRSM=;
  b=kaVt0N1R0K5XAUYAt21PkcBtCahTPcY5rsC1B49OgdaTA44+9pRy/0qS
   zrl+R6XF6lPO5niY1YKtNXBIW6bD+Lpm2c/1ZZh9aRLXzLqn1Dyo0Mljv
   lWy7q2ia80h4pdQfn3AIWxwK+zIBT1X0l4uvstD4jCpBFCBArfcvQ83os
   4yUna98iM1Lp0FShi011rsGi9dfuDE2TPwHx+Lm8f0uDevexJ0Vd7qk3l
   6ZRLLxRstJ+0IQ0vC0ZAy3mxfQzC59+IEUMsOfL5+bVwNW8EbWViStKVL
   zUkRci6LzDmsYWJIpovpuoayPG/a419koTksG8+iUCby9QyT2dZiji896
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339523424"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="339523424"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="928241272"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="928241272"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2023 06:46:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLGt-000EPo-2b;
	Thu, 23 Mar 2023 13:46:27 +0000
Date: Thu, 23 Mar 2023 21:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 4/4]
 unwind_kunit.c:(.text.test_ftrace_unwind_from_regs+0x40): undefined
 reference to `kunit_try_catch_throw'
Message-ID: <202303232112.QZBy1Sth-lkp@intel.com>
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
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230323/202303232112.QZBy1Sth-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=2aaad0e8b633791ba5d96e87bdf49cc05225d00a
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout 2aaad0e8b633791ba5d96e87bdf49cc05225d00a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232112.QZBy1Sth-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_regs':
>> unwind_kunit.c:(.text.test_ftrace_unwind_from_regs+0x40): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_nounwind':
>> unwind_kunit.c:(.text.test_fgraph_nounwind+0x6c): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_nounwind+0x70): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_nounwind+0xb0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_nounwind':
   unwind_kunit.c:(.text.test_nounwind+0x54): undefined reference to `kunit_binary_ptr_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x58): undefined reference to `kunit_binary_ptr_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x8c): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_test_init':
   unwind_kunit.c:(.text.uwd_test_init+0x34): undefined reference to `kunit_kmalloc_array'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_test_exit':
   unwind_kunit.c:(.text.uwd_test_exit+0x98): undefined reference to `kunit_kfree'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_test_exit+0x1bc): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_test_exit+0x258): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_assert_callers_present':
   unwind_kunit.c:(.text.uwd_assert_callers_present+0x74): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0x78): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.uwd_assert_callers_present+0xb8): undefined reference to `kunit_do_failed_assertion'
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
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_exit_unwind_from_caller':
>> unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller_reliable':
>> unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller':
>> unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_regs':
>> unwind_kunit.c:(.text.test_fgraph_async_unwind_from_regs+0x80): undefined reference to `kunit_try_catch_throw'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_regs+0xe4): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_regs+0x178): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller':
>> unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller+0x80): undefined reference to `kunit_try_catch_throw'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller+0xe4): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller+0x178): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_caller':
>> unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0x6c): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0x70): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0xb0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_nounwind':
   unwind_kunit.c:(.text.test_ftrace_nounwind+0x64): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_nounwind+0x68): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_nounwind+0xa8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x84): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_nounwind':
   unwind_kunit.c:(.text.test_kprobe_nounwind+0xa8): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_nounwind+0xac): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_nounwind+0xec): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_caller':
   unwind_kunit.c:(.text.test_kprobe_unwind_from_caller+0xb0): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller+0xb4): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller+0xf4): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_regs':
   unwind_kunit.c:(.text.test_kprobe_unwind_from_regs+0xb0): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_regs+0xb4): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_regs+0xf4): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_ftrace_unwind_from_caller_reliable+0x6c): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller_reliable+0x70): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller_reliable+0xb0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller_reliable+0x104): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_exit_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller_reliable+0x74): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller_reliable+0x78): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller_reliable+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller_reliable+0x10c): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xb0): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xb4): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xf4): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0x16c): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller':
   unwind_kunit.c:(.text.test_async_unwind_from_caller+0x90): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller+0x128): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller+0x1d4): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_regs':
   unwind_kunit.c:(.text.test_async_unwind_from_regs+0x90): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_regs+0x128): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_regs+0x1d4): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0x90): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0x128): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0x1d4): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0x230): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x80): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0xe4): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x178): undefined reference to `kunit_log_append'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x1d4): undefined reference to `kunit_log_append'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
