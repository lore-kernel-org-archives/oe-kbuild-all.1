Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35815C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 03:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679456839; x=1710992839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Qx8FlvzNHHlgWRW4V7LLgEkErNpSgGrzQJdEa45mTk=;
  b=Q4V1WIoALYqZ6qzrxDhk48gLuNxMJaiNdePDLef93C9BKiYvgaT36NO8
   ZENfi75bNW2nBU/qK0hG8TKlEPSd/JpmSNysZWQYJw7lMt1J7ZdbD943S
   rgEJfU/J033d3jPg81wm8OBTflhkbXcUbEvy3Wi+FNuW2+hcJIsNkfa41
   aB3dNaH1q2+BrDnxOfyhbqZQRdjUB2PjHWQVNfLhWgc/Y10r+0h1WrULR
   y1J4PLetPoyM+RFZYDHxkHWKVUg6mzNM+ki092FToqCBXvC5qwBJpY0+A
   lE+hnFAFLVsKUyHqkU6ai6gR5cf5OR+qP1dlL8LDHkXUKddFKKY+biuNb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340655839"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="340655839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825227596"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="825227596"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 20:47:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pepRS-000Cpy-2M;
	Wed, 22 Mar 2023 03:47:14 +0000
Date: Wed, 22 Mar 2023 11:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Ross Zwisler <zwisler@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH] tracing: Trace instrumentation begin and end
Message-ID: <202303221157.uDnuxtAh-lkp@intel.com>
References: <20230321215121.71b339c5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321215121.71b339c5@gandalf.local.home>

Hi Steven,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
patch link:    https://lore.kernel.org/r/20230321215121.71b339c5%40gandalf.local.home
patch subject: [PATCH] tracing: Trace instrumentation begin and end
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221157.uDnuxtAh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
        git checkout 1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221157.uDnuxtAh-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/asm-generic/bug.h:6,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/linux/thread_info.h: In function 'check_copy_size':
>> include/linux/instrumentation.h:87:65: error: '_THIS_IP_' undeclared (first use in this function)
      87 | # define instrumentation_begin() do_trace_instrumentation_begin(_THIS_IP_, _RET_IP_);
         |                                                                 ^~~~~~~~~
   include/asm-generic/bug.h:96:17: note: in expansion of macro 'instrumentation_begin'
      96 |                 instrumentation_begin();                                \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:94:33: note: in expansion of macro '__WARN_printf'
      94 | #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
         |                                 ^~~~~~~~~~~~~
   include/asm-generic/bug.h:124:17: note: in expansion of macro '__WARN'
     124 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN_ON'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:147:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     147 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   include/linux/instrumentation.h:87:65: note: each undeclared identifier is reported only once for each function it appears in
      87 | # define instrumentation_begin() do_trace_instrumentation_begin(_THIS_IP_, _RET_IP_);
         |                                                                 ^~~~~~~~~
   include/asm-generic/bug.h:96:17: note: in expansion of macro 'instrumentation_begin'
      96 |                 instrumentation_begin();                                \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:94:33: note: in expansion of macro '__WARN_printf'
      94 | #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
         |                                 ^~~~~~~~~~~~~
   include/asm-generic/bug.h:124:17: note: in expansion of macro '__WARN'
     124 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN_ON'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:147:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     147 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
>> include/linux/instrumentation.h:87:76: error: '_RET_IP_' undeclared (first use in this function)
      87 | # define instrumentation_begin() do_trace_instrumentation_begin(_THIS_IP_, _RET_IP_);
         |                                                                            ^~~~~~~~
   include/asm-generic/bug.h:96:17: note: in expansion of macro 'instrumentation_begin'
      96 |                 instrumentation_begin();                                \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:94:33: note: in expansion of macro '__WARN_printf'
      94 | #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
         |                                 ^~~~~~~~~~~~~
   include/asm-generic/bug.h:124:17: note: in expansion of macro '__WARN'
     124 |                 __WARN();                                               \
         |                 ^~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN_ON'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:147:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     147 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
         |         ^~~~~~~~~~~~~~~
   include/linux/thread_info.h:249:13: note: in expansion of macro 'WARN_ON_ONCE'
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:114: arch/m68k/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/_THIS_IP_ +87 include/linux/instrumentation.h

    46	
    47	/*
    48	 * Because instrumentation_{begin,end}() can nest, objtool validation considers
    49	 * _begin() a +1 and _end() a -1 and computes a sum over the instructions.
    50	 * When the value is greater than 0, we consider instrumentation allowed.
    51	 *
    52	 * There is a problem with code like:
    53	 *
    54	 * noinstr void foo()
    55	 * {
    56	 *	instrumentation_begin();
    57	 *	...
    58	 *	if (cond) {
    59	 *		instrumentation_begin();
    60	 *		...
    61	 *		instrumentation_end();
    62	 *	}
    63	 *	bar();
    64	 *	instrumentation_end();
    65	 * }
    66	 *
    67	 * If instrumentation_end() would be an empty label, like all the other
    68	 * annotations, the inner _end(), which is at the end of a conditional block,
    69	 * would land on the instruction after the block.
    70	 *
    71	 * If we then consider the sum of the !cond path, we'll see that the call to
    72	 * bar() is with a 0-value, even though, we meant it to happen with a positive
    73	 * value.
    74	 *
    75	 * To avoid this, have _end() be a NOP instruction, this ensures it will be
    76	 * part of the condition block and does not escape.
    77	 */
    78	#define __instrumentation_end(c) ({					\
    79		do_trace_instrumentation_end(_THIS_IP_, _RET_IP_);		\
    80		asm volatile(__stringify(c) ": nop\n\t"				\
    81			     ".pushsection .discard.instr_end\n\t"		\
    82			     ".long " __stringify(c) "b - .\n\t"		\
    83			     ".popsection\n\t" : : "i" (c));			\
    84	})
    85	#define instrumentation_end() __instrumentation_end(__COUNTER__)
    86	#else /* !CONFIG_NOINSTR_VALIDATION */
  > 87	# define instrumentation_begin() do_trace_instrumentation_begin(_THIS_IP_, _RET_IP_);
    88	# define instrumentation_end()	 do_trace_instrumentation_end(_THIS_IP_, _RET_IP_);
    89	#endif /* CONFIG_NOINSTR_VALIDATION */
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
