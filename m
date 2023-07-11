Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E417FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 20:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689105801; x=1720641801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmBGZOe+XekFKzwGa9oUrApxKgG2/6/do0yfo6f6cEQ=;
  b=A1Nox5bFDI1VOD3V/USWvRePcXuzlYHpfY5naMowoPUaizLcaapQszGF
   X2/ZmVU6czeSsL738/Y2MA4597vS0Qm8/aJf19iZPP017a98aQwjoIbND
   i9J3g3KvAvaALPfGktCkA83RAdbtU/rcngYp6iGBiRb7S6vdmsQIwoEzH
   wJZSzograz0EqRv6r4PyThDouJqoKfX6eVRltEnLO4dAa+cibpOQz/3z2
   LPgI3DusXtVpLz66nwOTnAKwzue55k9W8x/hiGF9iIqNotCmyMyCpUVPM
   Upz+pBI0fLWARAfuH8Hszks+hzW2ye0tsiwZ7mq7myjVRGWh32GBV/elL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367341567"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="367341567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 13:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791340465"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="791340465"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2023 13:03:19 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJJZu-00055B-2M;
	Tue, 11 Jul 2023 20:03:18 +0000
Date: Wed, 12 Jul 2023 04:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/core 21/22] include/linux/ftrace.h:47:47: warning:
 'struct fgraph_ret_regs' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202307120334.Fn8EEmph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   46b77ea28faeed56f1d1b63f9049c40b9eb3cbf5
commit: 55803539764e831c4e642de1c6634f8f645a10aa [21/22] tracing: arm64: Avoid missing-prototype warnings
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230712/202307120334.Fn8EEmph-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120334.Fn8EEmph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120334.Fn8EEmph-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from arch/x86/entry/syscall_32.c:7:
>> include/linux/ftrace.h:47:47: warning: 'struct fgraph_ret_regs' declared inside parameter list will not be visible outside of this definition or declaration
      47 | unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
         |                                               ^~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:52,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/entry/common.c:13:
>> include/linux/ftrace.h:47:47: warning: 'struct fgraph_ret_regs' declared inside parameter list will not be visible outside of this definition or declaration
      47 | unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
         |                                               ^~~~~~~~~~~~~~~
   arch/x86/entry/common.c:119:24: warning: no previous prototype for 'do_int80_syscall_32' [-Wmissing-prototypes]
     119 | __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:186:24: warning: no previous prototype for 'do_fast_syscall_32' [-Wmissing-prototypes]
     186 | __visible noinstr long do_fast_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:238:24: warning: no previous prototype for 'do_SYSENTER_32' [-Wmissing-prototypes]
     238 | __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~


vim +47 include/linux/ftrace.h

    45	
    46	#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
  > 47	unsigned long ftrace_return_to_handler(struct fgraph_ret_regs *ret_regs);
    48	#else
    49	unsigned long ftrace_return_to_handler(unsigned long frame_pointer);
    50	#endif
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
