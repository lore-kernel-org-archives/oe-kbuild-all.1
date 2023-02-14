Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99810799
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676372051; x=1707908051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6/KLGJ2kysIlytFrvaH6HVfOSyJji6LXFN+xuMnfM8=;
  b=XSdc0cQGNvLzrPy/4HHe+g4UDT6STkRV6D8cCsXmvV5A617/781UPWcE
   SNU4NiyGgXpoUa/rUH2jg+4Lj82kMz48wcCwIMT2kcgXQBjqfHrVC7YwX
   FBXo7pyjPRdgODd6nyfmPjN61rFyWCshUvJiVs/O6enMvl42Xr6X6BbuV
   5MukZ1dWFhUT9ly6kdQWpHcPtt+VJ5q5mzTSsq6dkQST7VDlrndYc1X/l
   drCUDsUQKbIR2bkt4H1G1kT9T8r1wWp7amgkF99B5//c1pmOQO0A1SUoe
   GnZu/TUUQnqrLqDmoG7Hs+10H8KVnHs90goffuJoHF5MBJNMprEkPAprR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417351877"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="417351877"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 02:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669124373"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="669124373"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Feb 2023 02:54:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRswm-0008Q5-0t;
	Tue, 14 Feb 2023 10:54:04 +0000
Date: Tue, 14 Feb 2023 18:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/3]
 unwind_kunit.c:(.text.uwd_test_init+0x34): undefined reference to
 `kunit_kmalloc_array'
Message-ID: <202302141814.6xfN94HG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   249fff101e1a3a5a356947f74a3d7933583c109f
commit: 249fff101e1a3a5a356947f74a3d7933583c109f [3/3] WIP: unwind tests
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230214/202302141814.6xfN94HG-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=249fff101e1a3a5a356947f74a3d7933583c109f
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout 249fff101e1a3a5a356947f74a3d7933583c109f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141814.6xfN94HG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/unwind_kunit.c:49:5: warning: no previous prototype for 'uwd_test_init' [-Wmissing-prototypes]
      49 | int uwd_test_init(struct kunit *test)
         |     ^~~~~~~~~~~~~
   lib/unwind_kunit.c:59:6: warning: no previous prototype for 'uwd_test_exit' [-Wmissing-prototypes]
      59 | void uwd_test_exit(struct kunit *test)
         |      ^~~~~~~~~~~~~
   lib/unwind_kunit.c:67:6: warning: no previous prototype for 'uwd_save_stacktrace' [-Wmissing-prototypes]
      67 | void uwd_save_stacktrace(struct unwind_data *uwd)
         |      ^~~~~~~~~~~~~~~~~~~
   lib/unwind_kunit.c:75:6: warning: no previous prototype for 'uwd_save_stacktrace_reliable' [-Wmissing-prototypes]
      75 | void uwd_save_stacktrace_reliable(struct unwind_data *uwd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/unwind_kunit.c:83:6: warning: no previous prototype for 'uwd_save_stacktrace_regs' [-Wmissing-prototypes]
      83 | void uwd_save_stacktrace_regs(struct unwind_data *uwd, struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:374:5: warning: no previous prototype for 'gops_entry_func_nop' [-Wmissing-prototypes]
     374 | int gops_entry_func_nop(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:379:5: warning: no previous prototype for 'gops_entry_func_unwind_from_caller' [-Wmissing-prototypes]
     379 | int gops_entry_func_unwind_from_caller(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:385:5: warning: no previous prototype for 'gops_entry_func_unwind_from_caller_reliable' [-Wmissing-prototypes]
     385 | int gops_entry_func_unwind_from_caller_reliable(struct ftrace_graph_ent *trace)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:391:6: warning: no previous prototype for 'gops_return_func_nop' [-Wmissing-prototypes]
     391 | void gops_return_func_nop(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:396:6: warning: no previous prototype for 'gops_return_func_unwind_from_caller' [-Wmissing-prototypes]
     396 | void gops_return_func_unwind_from_caller(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:401:6: warning: no previous prototype for 'gops_return_func_unwind_from_caller_reliable' [-Wmissing-prototypes]
     401 | void gops_return_func_unwind_from_caller_reliable(struct ftrace_graph_ret *trace)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:433:6: warning: no previous prototype for 'test_fgraph_nounwind' [-Wmissing-prototypes]
     433 | void test_fgraph_nounwind(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:442:6: warning: no previous prototype for 'test_fgraph_entry_unwind_from_caller' [-Wmissing-prototypes]
     442 | void test_fgraph_entry_unwind_from_caller(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:454:6: warning: no previous prototype for 'test_fgraph_entry_unwind_from_caller_reliable' [-Wmissing-prototypes]
     454 | void test_fgraph_entry_unwind_from_caller_reliable(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:466:6: warning: no previous prototype for 'test_fgraph_exit_unwind_from_caller' [-Wmissing-prototypes]
     466 | void test_fgraph_exit_unwind_from_caller(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/unwind_kunit.c:478:6: warning: no previous prototype for 'test_fgraph_exit_unwind_from_caller_reliable' [-Wmissing-prototypes]
     478 | void test_fgraph_exit_unwind_from_caller_reliable(struct kunit *test)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   mips-linux-ld: lib/unwind_kunit.o: in function `uwd_test_init':
>> unwind_kunit.c:(.text.uwd_test_init+0x34): undefined reference to `kunit_kmalloc_array'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_nounwind':
>> unwind_kunit.c:(.text.test_nounwind+0x54): undefined reference to `kunit_binary_ptr_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x58): undefined reference to `kunit_binary_ptr_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_nounwind+0x8c): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_nounwind':
>> unwind_kunit.c:(.text.test_fgraph_nounwind+0x6c): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_nounwind+0x70): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_nounwind+0xb0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_regs':
   unwind_kunit.c:(.text.test_ftrace_unwind_from_regs+0x40): undefined reference to `kunit_try_catch_throw'
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
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller':
>> unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_entry_unwind_from_caller_reliable':
>> unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0x78): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_entry_unwind_from_caller_reliable+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_exit_unwind_from_caller':
>> unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0x74): undefined reference to `kunit_binary_assert_format'
>> mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0x78): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_exit_unwind_from_caller+0xb8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_regs':
   unwind_kunit.c:(.text.test_fgraph_async_unwind_from_regs+0x88): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_regs+0x110): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller':
   unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller+0x88): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller+0x110): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_unwind_from_caller':
   unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0x6c): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0x70): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_unwind_from_caller+0xb0): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_ftrace_nounwind':
   unwind_kunit.c:(.text.test_ftrace_nounwind+0x64): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_nounwind+0x68): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_ftrace_nounwind+0xa8): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x84): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller':
   unwind_kunit.c:(.text.test_async_unwind_from_caller+0xcc): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_regs':
   unwind_kunit.c:(.text.test_async_unwind_from_regs+0xcc): undefined reference to `kunit_try_catch_throw'
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
   mips-linux-ld: lib/unwind_kunit.o: in function `test_kprobe_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xb0): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xb4): undefined reference to `kunit_binary_assert_format'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0xf4): undefined reference to `kunit_do_failed_assertion'
   mips-linux-ld: unwind_kunit.c:(.text.test_kprobe_unwind_from_caller_reliable+0x16c): undefined reference to `kunit_log_append'
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
   mips-linux-ld: lib/unwind_kunit.o: in function `test_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0xcc): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_async_unwind_from_caller_reliable+0x138): undefined reference to `kunit_log_append'
   mips-linux-ld: lib/unwind_kunit.o: in function `test_fgraph_async_unwind_from_caller_reliable':
   unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x88): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x110): undefined reference to `kunit_try_catch_throw'
   mips-linux-ld: unwind_kunit.c:(.text.test_fgraph_async_unwind_from_caller_reliable+0x164): undefined reference to `kunit_log_append'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
