Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605EB7F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 01:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686015400; x=1717551400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9ylF0h3zActarzs80TbSAsRoOEQrejwobbcT19/0dY=;
  b=VZfKuY/6lWlccplLfnyMknSm4E+jP9D5CrhJoyqlNZX98jW/aCHireHO
   q/OwT6RVnHzKlBr1GAxR0I/Ab1LsxNJ7/wAd6uBkLEhrpsQz11wpaj2kw
   NU7JtDJbKhBUa6Lh3fnbgHqXHMjCeD6Os2uNYgd/wPI66RuDUiEbAoYd7
   UIPU17KkHeKekN2XlN/nKgLpzQXVIBeQ53mqnzYQrznF211tARDXoYvde
   nPdcooDPEc2GXo8/xSAGMF3oOmS0Ui7JBmMixjdBvVdq5TX+dKSRTKOr9
   QwX4uKSgGh4NhzjYTmfzXkHwTolyLYtxGIcyaJUcwkADi+8s2BqoZ8n/S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420079861"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="420079861"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 18:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738570130"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738570130"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 18:36:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Lcj-0004fB-0H;
	Tue, 06 Jun 2023 01:36:37 +0000
Date: Tue, 6 Jun 2023 09:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [stable:linux-5.4.y 2501/8640] util/annotate.c:1752:9: error: too
 few arguments to function 'init_disassemble_info'
Message-ID: <202306060905.R5jKGRBH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   cf0b1e5482eaeb4db15c9e703267483dba88b575
commit: aca7e5b6a5008dcf551516490b0ba4510e073d08 [2501/8640] libsubcmd: Fix use-after-free for realloc(..., 0)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=aca7e5b6a5008dcf551516490b0ba4510e073d08
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout aca7e5b6a5008dcf551516490b0ba4510e073d08
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060905.R5jKGRBH-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/fscrypt.h' differs from latest version at 'include/uapi/linux/fscrypt.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs from latest version at 'include/uapi/linux/sched.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/unistd.h' differs from latest version at 'arch/x86/include/uapi/asm/unistd.h'
   Warning: Kernel ABI header at 'tools/arch/powerpc/include/uapi/asm/errno.h' differs from latest version at 'arch/powerpc/include/uapi/asm/errno.h'
   Warning: Kernel ABI header at 'tools/arch/x86/lib/memcpy_64.S' differs from latest version at 'arch/x86/lib/memcpy_64.S'
   Warning: Kernel ABI header at 'tools/arch/x86/lib/memset_64.S' differs from latest version at 'arch/x86/lib/memset_64.S'
   Makefile.config:644: No libcrypto.h found, disables jitted code injection, please install openssl-devel or libssl-dev
   Makefile.config:677: GTK2 not found, disables GTK2 support. Please install gtk2-devel or libgtk2.0-dev
     PERF_VERSION = 5.4.180.gaca7e5b6a500
   In file included from tools/include/linux/refcount.h:42,
                    from tools/perf/lib/include/internal/cpumap.h:5,
                    from util/cpumap.h:7,
                    from builtin-sched.c:6:
   builtin-sched.c: In function 'create_tasks':
   tools/include/linux/kernel.h:45:24: error: comparison of distinct pointer types lacks a cast [-Werror]
      45 |         (void) (&_max1 == &_max2);              \
         |                        ^~
   builtin-sched.c:669:34: note: in expansion of macro 'max'
     669 |                         (size_t) max(16 * 1024, PTHREAD_STACK_MIN));
         |                                  ^~~
   util/annotate.c: In function 'symbol__disassemble_bpf':
>> util/annotate.c:1752:9: error: too few arguments to function 'init_disassemble_info'
    1752 |         init_disassemble_info(&info, s,
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from util/annotate.c:1709:
   /usr/include/dis-asm.h:480:13: note: declared here
     480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
         |             ^~~~~~~~~~~~~~~~~~~~~
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
   make[6]: *** [tools/build/Makefile.build:97: tools/perf/util/annotate.o] Error 1
   make[5]: *** [tools/build/Makefile.build:139: util] Error 2
   make[5]: *** Waiting for unfinished jobs....
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
   In function 'topdown_filter_events',
       inlined from 'add_default_attributes' at builtin-stat.c:1337:7:
>> builtin-stat.c:1118:23: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
    1118 |                 s[-1] = 0;
         |                 ~~~~~~^~~
   builtin-stat.c:1099:16: note: at offset -1 into destination object of size [0, 2147483647] allocated by 'malloc'
    1099 |         *str = malloc(len + 1 + 2);
         |                ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:96: tools/perf/builtin-stat.o] Error 1
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:96: tools/perf/builtin-sched.o] Error 1
   make[4]: *** [Makefile.perf:593: tools/perf/perf-in.o] Error 2
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile.perf:217: sub-make] Error 2
   make[2]: *** [Makefile:70: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
