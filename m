Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BAA443A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685961542; x=1717497542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XZVyZmygCPS8YXp1qfo09Uyshftc8oJpJqevtz4tVIc=;
  b=fZgqi2Xs3h2evISQ+icIEZYXa9IeYrRakAUu4wcnVi3njHNQyqdAAXyO
   s2YYUXXbZpd831LuTG735O3jCM8u0wiVi+flNZhE4Hr5ZKjPxDAkqBi2V
   nzwh5pyJ8xstbcN54955a+Xlm/+iIg6dYYmjXFi+TI/P4kuHsHpje/7VJ
   8AJ9br7biA/0j5hun5Nowg193B4mnwwRcxSM+nrflAYLl55+lWl/gLGtS
   V78Pce0c/jm/bBfjAiaXFgwhPYj+Z3A94hdySBehk1dgJ5gZD2/P++UXL
   zll/IokUq08aHTHk5gmTSIcn6CCc409IYjOVi4mB+QmlTTs4lfkuCgQPB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358783673"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358783673"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 03:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="832756800"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="832756800"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 03:39:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q67c3-00046t-0c;
	Mon, 05 Jun 2023 10:38:59 +0000
Date: Mon, 5 Jun 2023 18:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [stable:linux-5.10.y 813/9999]
 /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/handy.h:125:23: error: cast from
 function call of type 'STRLEN' {aka 'long unsigned int'} to non-matching
 type '_Bool'
Message-ID: <202306051843.qe20olbi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   c7992b6c7f0e2b0a87dd8e3f488250557b077c20
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [813/9999] libsubcmd: Fix use-after-free for realloc(..., 0)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051843.qe20olbi-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/stat.h' differs from latest version at 'include/uapi/linux/stat.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
   Warning: Kernel ABI header at 'tools/arch/powerpc/include/uapi/asm/errno.h' differs from latest version at 'arch/powerpc/include/uapi/asm/errno.h'
   Warning: Kernel ABI header at 'tools/include/linux/build_bug.h' differs from latest version at 'include/linux/build_bug.h'
   Makefile.config:695: No libcrypto.h found, disables jitted code injection, please install openssl-devel or libssl-dev
   pmu-events/jevents.c:72:22: warning: no previous prototype for 'convert' [-Wmissing-prototypes]
      72 | enum aggr_mode_class convert(const char *aggr_mode)
         |                      ^~~~~~~
     PERF_VERSION = 5.10.101.g50f3b00d4c7b
   In file included from tools/include/linux/refcount.h:42,
                    from tools/lib/perf/include/internal/cpumap.h:5,
                    from util/cpumap.h:7,
                    from builtin-sched.c:6:
   builtin-sched.c: In function 'create_tasks':
   tools/include/linux/kernel.h:43:24: error: comparison of distinct pointer types lacks a cast [-Werror]
      43 |         (void) (&_max1 == &_max2);              \
         |                        ^~
   builtin-sched.c:673:34: note: in expansion of macro 'max'
     673 |                         (size_t) max(16 * 1024, PTHREAD_STACK_MIN));
         |                                  ^~~
   util/annotate.c: In function 'symbol__disassemble_bpf':
   util/annotate.c:1729:9: error: too few arguments to function 'init_disassemble_info'
    1729 |         init_disassemble_info(&info, s,
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from util/annotate.c:1686:
   /usr/include/dis-asm.h:480:13: note: declared here
     480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
         |             ^~~~~~~~~~~~~~~~~~~~~
   make[6]: *** [tools/build/Makefile.build:97: tools/perf/util/annotate.o] Error 1
   make[6]: *** Waiting for unfinished jobs....
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:2999,
                    from Context.xs:8:
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/inline.h: In function 'Perl_is_utf8_valid_partial_char_flags':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/handy.h:125:23: error: cast from function call of type 'STRLEN' {aka 'long unsigned int'} to non-matching type '_Bool' [-Werror=bad-function-cast]
     125 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/inline.h:2363:12: note: in expansion of macro 'cBOOL'
    2363 |     return cBOOL(is_utf8_char_helper_(s0, e, flags));
         |            ^~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:7242:
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/inline.h: In function 'Perl_cop_file_avn':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/inline.h:3489:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    3489 |     const char *file = CopFILE(cop);
         |     ^~~~~
   In file included from /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:7243:
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/sv_inline.h: In function 'Perl_newSV_type':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/sv_inline.h:376:5: error: enumeration value 'SVt_LAST' not handled in switch [-Werror=switch-enum]
     376 |     switch (type) {
         |     ^~~~~~
   Context.c: In function 'XS_Perf__Trace__Context_common_pc':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/handy.h:125:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     125 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3867:62: note: in definition of macro 'EXPECT'
    3867 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3887:52: note: in expansion of macro 'cBOOL'
    3887 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:411:13: note: in expansion of macro 'LIKELY'
     411 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:906:34: note: in expansion of macro 'cBOOL'
     906 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:413:28: note: in expansion of macro 'TAINT_get'
     413 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:476:38: note: in expansion of macro 'TARGi'
     476 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:60:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_flags':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/handy.h:125:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     125 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3867:62: note: in definition of macro 'EXPECT'
    3867 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3887:52: note: in expansion of macro 'cBOOL'
    3887 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:411:13: note: in expansion of macro 'LIKELY'
     411 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:906:34: note: in expansion of macro 'cBOOL'
     906 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:413:28: note: in expansion of macro 'TAINT_get'
     413 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:476:38: note: in expansion of macro 'TARGi'
     476 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:83:13: note: in expansion of macro 'PUSHi'
   Context.c: In function 'XS_Perf__Trace__Context_common_lock_depth':
>> /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/handy.h:125:23: error: cast from function call of type 'long int' to non-matching type '_Bool' [-Werror=bad-function-cast]
     125 | #define cBOOL(cbool) ((bool) (cbool))
         |                       ^
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3867:62: note: in definition of macro 'EXPECT'
    3867 | #  define EXPECT(expr,val)                  __builtin_expect(expr,val)
         |                                                              ^~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:3887:52: note: in expansion of macro 'cBOOL'
    3887 | #define LIKELY(cond)                        EXPECT(cBOOL(cond),TRUE)
         |                                                    ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:411:13: note: in expansion of macro 'LIKELY'
     411 |         if (LIKELY(                                                     \
         |             ^~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/perl.h:906:34: note: in expansion of macro 'cBOOL'
     906 | #   define TAINT_get            (cBOOL(UNLIKELY(PL_tainted)))    /* Is something tainted? */
         |                                  ^~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:413:28: note: in expansion of macro 'TAINT_get'
     413 |             & (do_taint ? !TAINT_get : 1)))                             \
         |                            ^~~~~~~~~
   /usr/lib/x86_64-linux-gnu/perl/5.36/CORE/pp.h:476:38: note: in expansion of macro 'TARGi'
     476 | #define PUSHi(i)        STMT_START { TARGi(i,1); PUSHs(TARG); } STMT_END
         |                                      ^~~~~
   Context.c:106:13: note: in expansion of macro 'PUSHi'
   cc1: all warnings being treated as errors
   make[7]: *** [tools/build/Makefile.build:97: tools/perf/scripts/perl/Perf-Trace-Util/Context.o] Error 1
   make[6]: *** [tools/build/Makefile.build:139: perl/Perf-Trace-Util] Error 2
   make[5]: *** [tools/build/Makefile.build:139: scripts] Error 2
   make[5]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:96: tools/perf/builtin-sched.o] Error 1
   make[5]: *** [tools/build/Makefile.build:139: util] Error 2
   make[4]: *** [Makefile.perf:643: tools/perf/perf-in.o] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile.perf:229: sub-make] Error 2
   make[2]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
