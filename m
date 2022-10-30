Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16825184
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Oct 2022 22:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667169950; x=1698705950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ko0m3DD9wtiS3natR29P/KFmX8hRKZYu+uO7Ts3GhfA=;
  b=KKTCDRe5sTtqbew+TGIv0M1tBLu8eZqFkPYOCxwFlEx3L38uxrmAxsR6
   Ub/OPMXxkAXiuUgTsb381MZLoatlTgnonMhmbUL0ZIqQUZi4NqL98aV8z
   ao6Ph/wZBQYpz21Lz6pUh2A5l0gIEXL8kBK/frCr9cLEP7X1BjhjIoxLf
   Hv86l356BAVvosN3qglEDvaxyDpL7C7tmkV6XSlEdZbjBazvVFpHXhb2o
   jXd6Vl3fEvA6Ia89xTEaEhrTBYpEPcPl4TjXw2payrBhe9x0S0lkheUSd
   1XsCUvUfVGT/kUgH71A1xoXzQKeztZV7ydY5jDlM1TySKABw2/PqbNzZm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="370854376"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="370854376"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 15:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="611303426"
X-IronPort-AV: E=Sophos;i="5.95,226,1661842800"; 
   d="scan'208";a="611303426"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Oct 2022 15:45:46 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opH3p-000CTI-1w;
	Sun, 30 Oct 2022 22:45:45 +0000
Date: Mon, 31 Oct 2022 06:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Hackmann <ghackmann@android.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tri Vo <trong@android.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yu Zhao <yuzhao@google.com>, Sean Paul <seanpaul@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 9206/9999]
 kernel/gcov/gcc_4_7.c:162:16: error: implicit declaration of function
 'within_module'; did you mean 'init_module'?
Message-ID: <202210310602.9G4OJHmB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="i/msLgUjIuUnfIu4"
Content-Disposition: inline


--i/msLgUjIuUnfIu4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 35be48648a6552869bd5d6c9a0d278102d23d46c [9206/9999] UPSTREAM: gcov: clang support
config: sh-randconfig-m041-20221031
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/35be48648a6552869bd5d6c9a0d278102d23d46c
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 35be48648a6552869bd5d6c9a0d278102d23d46c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash arch/sh/kernel/ arch/sh/lib/ kernel/gcov/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:10,
                    from include/linux/kallsyms.h:10,
                    from arch/sh/kernel/dumpstack.c:11:
   include/linux/atomic.h: In function 'atomic_fetch_add_unless':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:578:17: note: in expansion of macro 'if'
     578 |                 if (unlikely(c == u))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:578:21: note: in expansion of macro 'unlikely'
     578 |                 if (unlikely(c == u))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:578:17: note: in expansion of macro 'if'
     578 |                 if (unlikely(c == u))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:478:13: note: in expansion of macro 'unlikely'
     478 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:580:19: note: in expansion of macro 'atomic_try_cmpxchg'
     580 |         } while (!atomic_try_cmpxchg(v, &c, c + a));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:580:19: note: in expansion of macro 'atomic_try_cmpxchg'
     580 |         } while (!atomic_try_cmpxchg(v, &c, c + a));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic_inc_unless_negative':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:679:17: note: in expansion of macro 'if'
     679 |                 if (unlikely(c < 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:679:21: note: in expansion of macro 'unlikely'
     679 |                 if (unlikely(c < 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:679:17: note: in expansion of macro 'if'
     679 |                 if (unlikely(c < 0))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:478:13: note: in expansion of macro 'unlikely'
     478 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:681:19: note: in expansion of macro 'atomic_try_cmpxchg'
     681 |         } while (!atomic_try_cmpxchg(v, &c, c + 1));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:681:19: note: in expansion of macro 'atomic_try_cmpxchg'
     681 |         } while (!atomic_try_cmpxchg(v, &c, c + 1));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic_dec_unless_positive':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:693:17: note: in expansion of macro 'if'
     693 |                 if (unlikely(c > 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:693:21: note: in expansion of macro 'unlikely'
     693 |                 if (unlikely(c > 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:693:17: note: in expansion of macro 'if'
     693 |                 if (unlikely(c > 0))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:478:13: note: in expansion of macro 'unlikely'
     478 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:695:19: note: in expansion of macro 'atomic_try_cmpxchg'
     695 |         } while (!atomic_try_cmpxchg(v, &c, c - 1));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:695:19: note: in expansion of macro 'atomic_try_cmpxchg'
     695 |         } while (!atomic_try_cmpxchg(v, &c, c - 1));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic_dec_if_positive':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:715:17: note: in expansion of macro 'if'
     715 |                 if (unlikely(dec < 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:715:21: note: in expansion of macro 'unlikely'
     715 |                 if (unlikely(dec < 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:715:17: note: in expansion of macro 'if'
     715 |                 if (unlikely(dec < 0))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:478:13: note: in expansion of macro 'unlikely'
     478 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:717:19: note: in expansion of macro 'atomic_try_cmpxchg'
     717 |         } while (!atomic_try_cmpxchg(v, &c, dec));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:478:9: note: in expansion of macro 'if'
     478 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:483:49: note: in expansion of macro '__atomic_try_cmpxchg'
     483 | #define atomic_try_cmpxchg(_p, _po, _n)         __atomic_try_cmpxchg(, _p, _po, _n)
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:717:19: note: in expansion of macro 'atomic_try_cmpxchg'
     717 |         } while (!atomic_try_cmpxchg(v, &c, dec));
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic64_inc_unless_negative':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:1268:17: note: in expansion of macro 'if'
    1268 |                 if (unlikely(c < 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:1268:21: note: in expansion of macro 'unlikely'
    1268 |                 if (unlikely(c < 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:1268:17: note: in expansion of macro 'if'
    1268 |                 if (unlikely(c < 0))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:1135:9: note: in expansion of macro 'if'
    1135 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:1135:13: note: in expansion of macro 'unlikely'
    1135 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:1140:57: note: in expansion of macro '__atomic64_try_cmpxchg'
    1140 | #define atomic64_try_cmpxchg(_p, _po, _n)               __atomic64_try_cmpxchg(, _p, _po, _n)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:1270:19: note: in expansion of macro 'atomic64_try_cmpxchg'
    1270 |         } while (!atomic64_try_cmpxchg(v, &c, c + 1));
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:1135:9: note: in expansion of macro 'if'
    1135 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:1140:57: note: in expansion of macro '__atomic64_try_cmpxchg'
    1140 | #define atomic64_try_cmpxchg(_p, _po, _n)               __atomic64_try_cmpxchg(, _p, _po, _n)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:1270:19: note: in expansion of macro 'atomic64_try_cmpxchg'
    1270 |         } while (!atomic64_try_cmpxchg(v, &c, c + 1));
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h: In function 'atomic64_dec_unless_positive':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:1282:17: note: in expansion of macro 'if'
    1282 |                 if (unlikely(c > 0))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:1282:21: note: in expansion of macro 'unlikely'
    1282 |                 if (unlikely(c > 0))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:1282:17: note: in expansion of macro 'if'
    1282 |                 if (unlikely(c > 0))
         |                 ^~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/atomic.h:1135:9: note: in expansion of macro 'if'
    1135 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/atomic.h:1135:13: note: in expansion of macro 'unlikely'
    1135 |         if (unlikely(__r != __o))                                       \
         |             ^~~~~~~~
   include/linux/atomic.h:1140:57: note: in expansion of macro '__atomic64_try_cmpxchg'
    1140 | #define atomic64_try_cmpxchg(_p, _po, _n)               __atomic64_try_cmpxchg(, _p, _po, _n)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:1284:19: note: in expansion of macro 'atomic64_try_cmpxchg'
    1284 |         } while (!atomic64_try_cmpxchg(v, &c, c - 1));
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/atomic.h:1135:9: note: in expansion of macro 'if'
    1135 |         if (unlikely(__r != __o))                                       \
         |         ^~
   include/linux/atomic.h:1140:57: note: in expansion of macro '__atomic64_try_cmpxchg'
    1140 | #define atomic64_try_cmpxchg(_p, _po, _n)               __atomic64_try_cmpxchg(, _p, _po, _n)
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic.h:1284:19: note: in expansion of macro 'atomic64_try_cmpxchg'
    1284 |         } while (!atomic64_try_cmpxchg(v, &c, c - 1));
         |                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h: In function 'div_u64_rem':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/math64.h:90:22: note: in expansion of macro 'do_div'
      90 |         *remainder = do_div(dividend, divisor);
         |                      ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/math64.h:90:22: note: in expansion of macro 'do_div'
      90 |         *remainder = do_div(dividend, divisor);
         |                      ^~~~~~
   include/linux/math64.h: In function 'mul_u64_u32_div':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/math64.h:274:21: note: in expansion of macro 'do_div'
     274 |         rl.l.high = do_div(rh.ll, divisor);
         |                     ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/math64.h:274:21: note: in expansion of macro 'do_div'
     274 |         rl.l.high = do_div(rh.ll, divisor);
         |                     ^~~~~~
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/math64.h:277:9: note: in expansion of macro 'do_div'
     277 |         do_div(rl.ll, divisor);
         |         ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/math64.h:277:9: note: in expansion of macro 'do_div'
     277 |         do_div(rl.ll, divisor);
         |         ^~~~~~
   include/linux/thread_info.h: In function 'copy_overflow':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:134:9: note: in expansion of macro 'if'
     134 |         if (unlikely(__ret_warn_on))                                    \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:13: note: in expansion of macro 'unlikely'
     134 |         if (unlikely(__ret_warn_on))                                    \
         |             ^~~~~~~~
   include/linux/thread_info.h:134:9: note: in expansion of macro 'WARN'
     134 |         WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
         |         ^~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:134:9: note: in expansion of macro 'if'
     134 |         if (unlikely(__ret_warn_on))                                    \
         |         ^~
   include/linux/thread_info.h:134:9: note: in expansion of macro 'WARN'
     134 |         WARN(1, "Buffer overflow detected (%d < %lu)!\n", size, count);
         |         ^~~~
   include/linux/thread_info.h: In function 'check_copy_size':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/thread_info.h:141:9: note: in expansion of macro 'if'
     141 |         if (unlikely(sz >= 0 && sz < bytes)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/thread_info.h:141:13: note: in expansion of macro 'unlikely'
     141 |         if (unlikely(sz >= 0 && sz < bytes)) {
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/thread_info.h:141:9: note: in expansion of macro 'if'
     141 |         if (unlikely(sz >= 0 && sz < bytes)) {
         |         ^~
   include/linux/seqlock.h: In function '__read_seqcount_begin':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/seqlock.h:114:9: note: in expansion of macro 'if'
     114 |         if (unlikely(ret & 1)) {
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/seqlock.h:114:13: note: in expansion of macro 'unlikely'
     114 |         if (unlikely(ret & 1)) {
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/seqlock.h:114:9: note: in expansion of macro 'if'
     114 |         if (unlikely(ret & 1)) {
         |         ^~
   include/linux/mutex.h: In function 'mutex_trylock_recursive':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/mutex.h:226:9: note: in expansion of macro 'if'
     226 |         if (unlikely(__mutex_owner(lock) == current))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/mutex.h:226:13: note: in expansion of macro 'unlikely'
     226 |         if (unlikely(__mutex_owner(lock) == current))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/mutex.h:226:9: note: in expansion of macro 'if'
     226 |         if (unlikely(__mutex_owner(lock) == current))
         |         ^~
   include/linux/ktime.h: In function 'ktime_set':
>> include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/ktime.h:39:9: note: in expansion of macro 'if'
      39 |         if (unlikely(secs >= KTIME_SEC_MAX))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/ktime.h:39:13: note: in expansion of macro 'unlikely'
      39 |         if (unlikely(secs >= KTIME_SEC_MAX))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/ktime.h:39:9: note: in expansion of macro 'if'
      39 |         if (unlikely(secs >= KTIME_SEC_MAX))
         |         ^~
   include/linux/ktime.h: In function 'ktime_divns':
   include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/bug.h:61:32: note: in expansion of macro 'if'
      61 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:61:36: note: in expansion of macro 'unlikely'
      61 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   include/linux/ktime.h:153:9: note: in expansion of macro 'BUG_ON'
     153 |         BUG_ON(div < 0);
         |         ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/bug.h:61:32: note: in expansion of macro 'if'
      61 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^~
   include/linux/ktime.h:153:9: note: in expansion of macro 'BUG_ON'
     153 |         BUG_ON(div < 0);
         |         ^~~~~~
   include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:235:20: note: in expansion of macro 'likely'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                    ^~~~~~
   include/linux/ktime.h:158:17: note: in expansion of macro 'do_div'
     158 |                 do_div(tmp, div);
         |                 ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/asm-generic/div64.h:235:16: note: in expansion of macro 'if'
     235 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                ^~
   include/linux/ktime.h:158:17: note: in expansion of macro 'do_div'
     158 |                 do_div(tmp, div);
         |                 ^~~~~~
   include/linux/mmzone.h: In function 'next_zones_zonelist':
   include/linux/compiler.h:25:39: error: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Werror=attributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/mmzone.h:984:9: note: in expansion of macro 'if'
     984 |         if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/mmzone.h:984:13: note: in expansion of macro 'likely'
     984 |         if (likely(!nodes && zonelist_zone_idx(z) <= highest_zoneidx))
         |             ^~~~~~
..


vim +162 kernel/gcov/gcc_4_7.c

   152	
   153	/**
   154	 * gcov_info_within_module - check if a profiling data set belongs to a module
   155	 * @info: profiling data set
   156	 * @mod: module
   157	 *
   158	 * Returns true if profiling data belongs module, false otherwise.
   159	 */
   160	bool gcov_info_within_module(struct gcov_info *info, struct module *mod)
   161	{
 > 162		return within_module((unsigned long)info, mod);
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--i/msLgUjIuUnfIu4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/sh 4.19.69 Kernel Configuration
#

#
# Compiler: sh4-linux-gcc (GCC) 12.1.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
CONFIG_KERNEL_LZO=y
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_MAY_HAVE_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU=y
# CONFIG_IKCONFIG is not set
CONFIG_GENERIC_SCHED_CLOCK=y
# CONFIG_CGROUPS is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_CHECKPOINT_RESTORE=y
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_ANON_INODES=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
# CONFIG_PRINTK is not set
CONFIG_BUG=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_HAVE_FUTEX_CMPXCHG=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_SYSCALL is not set
CONFIG_USERFAULTFD=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
CONFIG_SUPERH=y
CONFIG_SUPERH32=y
CONFIG_ARCH_DEFCONFIG="arch/sh/configs/shx3_defconfig"
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_DMA_NONCOHERENT=y
CONFIG_PGTABLE_LEVELS=2

#
# System type
#
CONFIG_CPU_SH3=y
# CONFIG_CPU_SUBTYPE_SH7619 is not set
# CONFIG_CPU_SUBTYPE_J2 is not set
# CONFIG_CPU_SUBTYPE_SH7201 is not set
# CONFIG_CPU_SUBTYPE_SH7203 is not set
# CONFIG_CPU_SUBTYPE_SH7206 is not set
# CONFIG_CPU_SUBTYPE_SH7263 is not set
# CONFIG_CPU_SUBTYPE_SH7264 is not set
# CONFIG_CPU_SUBTYPE_SH7269 is not set
# CONFIG_CPU_SUBTYPE_MXG is not set
# CONFIG_CPU_SUBTYPE_SH7705 is not set
# CONFIG_CPU_SUBTYPE_SH7706 is not set
CONFIG_CPU_SUBTYPE_SH7707=y
# CONFIG_CPU_SUBTYPE_SH7708 is not set
# CONFIG_CPU_SUBTYPE_SH7709 is not set
# CONFIG_CPU_SUBTYPE_SH7710 is not set
# CONFIG_CPU_SUBTYPE_SH7712 is not set
# CONFIG_CPU_SUBTYPE_SH7720 is not set
# CONFIG_CPU_SUBTYPE_SH7721 is not set
# CONFIG_CPU_SUBTYPE_SH7750 is not set
# CONFIG_CPU_SUBTYPE_SH7091 is not set
# CONFIG_CPU_SUBTYPE_SH7750R is not set
# CONFIG_CPU_SUBTYPE_SH7750S is not set
# CONFIG_CPU_SUBTYPE_SH7751 is not set
# CONFIG_CPU_SUBTYPE_SH7751R is not set
# CONFIG_CPU_SUBTYPE_SH7760 is not set
# CONFIG_CPU_SUBTYPE_SH4_202 is not set
# CONFIG_CPU_SUBTYPE_SH7723 is not set
# CONFIG_CPU_SUBTYPE_SH7724 is not set
# CONFIG_CPU_SUBTYPE_SH7734 is not set
# CONFIG_CPU_SUBTYPE_SH7757 is not set
# CONFIG_CPU_SUBTYPE_SH7763 is not set
# CONFIG_CPU_SUBTYPE_SH7770 is not set
# CONFIG_CPU_SUBTYPE_SH7780 is not set
# CONFIG_CPU_SUBTYPE_SH7785 is not set
# CONFIG_CPU_SUBTYPE_SH7786 is not set
# CONFIG_CPU_SUBTYPE_SHX3 is not set
# CONFIG_CPU_SUBTYPE_SH7343 is not set
# CONFIG_CPU_SUBTYPE_SH7722 is not set
# CONFIG_CPU_SUBTYPE_SH7366 is not set

#
# Memory management options
#
CONFIG_QUICKLIST=y
CONFIG_MMU=y
CONFIG_PAGE_OFFSET=0x80000000
CONFIG_FORCE_MAX_ZONEORDER=11
CONFIG_MEMORY_START=0x08000000
CONFIG_MEMORY_SIZE=0x04000000
CONFIG_29BIT=y
CONFIG_VSYSCALL=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_UNCACHED_MAPPING=y
CONFIG_PAGE_SIZE_4KB=y

#
# Cache configuration
#
CONFIG_CACHE_WRITEBACK=y
# CONFIG_CACHE_WRITETHROUGH is not set
# CONFIG_CACHE_OFF is not set

#
# Processor features
#
CONFIG_CPU_LITTLE_ENDIAN=y
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_SH_FPU_EMU=y
CONFIG_SH_ADC=y
CONFIG_CPU_HAS_INTEVT=y
CONFIG_CPU_HAS_SR_RB=y

#
# Board support
#

#
# Timer and clock configuration
#
CONFIG_SH_PCLK_FREQ=50000000
CONFIG_SH_CLK_CPG=y
CONFIG_SH_CLK_CPG_LEGACY=y

#
# CPU Frequency scaling
#

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_BOOST=y

#
# CPU frequency scaling drivers
#
# CONFIG_SH_CPU_FREQ is not set

#
# DMA support
#
# CONFIG_SH_DMA is not set

#
# Companion Chips
#

#
# Additional SuperH Device Drivers
#
CONFIG_HEARTBEAT=y
CONFIG_PUSH_SWITCH=y

#
# Kernel features
#
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
# CONFIG_KEXEC is not set
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x08000000
CONFIG_GUSA=y
CONFIG_GUSA_RB=y

#
# SuperH / SH-Mobile Driver Options
#
CONFIG_SH_INTC=y

#
# Interrupt controller options
#
# CONFIG_INTC_USERIMASK is not set
# CONFIG_INTC_MAPPING_DEBUG is not set

#
# Boot options
#
CONFIG_ZERO_PAGE_OFFSET=0x00001000
CONFIG_BOOT_LINK_OFFSET=0x00800000
CONFIG_ENTRY_OFFSET=0x00001000

#
# Bus options
#

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_EPF_TEST is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#

#
# Power management options (EXPERIMENTAL)
#
# CONFIG_PM is not set

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y

#
# General architecture-dependent options
#
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_OLD_SIGSUSPEND=y
CONFIG_OLD_SIGACTION=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
# CONFIG_REFCOUNT_FULL is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
CONFIG_GCOV_FORMAT_4_7=y
CONFIG_PLUGIN_HOSTCC=""
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
# CONFIG_BINFMT_SCRIPT is not set
CONFIG_BINFMT_MISC=y
# CONFIG_COREDUMP is not set

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_MEMBLOCK=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_ARCH_DISCARD_MEMBLOCK=y
CONFIG_NO_BOOTMEM=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_MIGRATION=y
CONFIG_NR_QUICK=1
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_MMAP_NOEXEC_TAINT=1
CONFIG_NEED_PER_CPU_KM=y
CONFIG_CLEANCACHE=y
# CONFIG_CMA is not set
# CONFIG_ZPOOL is not set
CONFIG_ZBUD=y
# CONFIG_ZSMALLOC is not set
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_LOW_MEM_NOTIFY=y
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_BENCHMARK=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_MM_METRICS is not set
# CONFIG_NET is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y

#
# Bus devices
#
# CONFIG_QCOM_EBI2 is not set
# CONFIG_GNSS is not set
CONFIG_MTD=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
CONFIG_MTD_CMDLINE_PARTS=y
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_BCM63XX_PARTS is not set

#
# Partition parsers
#
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set

#
# User Modules And Translation Layers
#
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_PCMCIA=y
# CONFIG_MTD_PCMCIA_ANONYMOUS is not set
CONFIG_MTD_GPIO_ADDR=y
CONFIG_MTD_PLATRAM=y
# CONFIG_MTD_LATCH_ADDR is not set

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SMC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_BCH=y
CONFIG_MTD_NAND_ECC_BCH=y
CONFIG_MTD_NAND_GPIO=y
# CONFIG_MTD_NAND_OMAP2 is not set
# CONFIG_MTD_NAND_TANGO is not set
CONFIG_MTD_NAND_DISKONCHIP=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
CONFIG_MTD_NAND_DOCG4=y
# CONFIG_MTD_NAND_SHARPSL is not set
# CONFIG_MTD_NAND_ATMEL is not set
# CONFIG_MTD_NAND_MARVELL is not set
# CONFIG_MTD_NAND_SLC_LPC32XX is not set
# CONFIG_MTD_NAND_MLC_LPC32XX is not set
CONFIG_MTD_NAND_NANDSIM=y
# CONFIG_MTD_NAND_BRCMNAND is not set
CONFIG_MTD_NAND_PLATFORM=y
# CONFIG_MTD_NAND_OXNAS is not set
# CONFIG_MTD_NAND_FSL_IFC is not set
# CONFIG_MTD_NAND_VF610_NFC is not set
# CONFIG_MTD_NAND_MXC is not set
# CONFIG_MTD_NAND_SH_FLCTL is not set
# CONFIG_MTD_NAND_DAVINCI is not set
# CONFIG_MTD_NAND_TXX9NDFMC is not set
# CONFIG_MTD_NAND_NUC900 is not set
# CONFIG_MTD_NAND_JZ4740 is not set
# CONFIG_MTD_NAND_SUNXI is not set
# CONFIG_MTD_NAND_HISI504 is not set
# CONFIG_MTD_NAND_QCOM is not set
# CONFIG_MTD_NAND_MTK is not set
# CONFIG_MTD_NAND_TEGRA is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# CONFIG_MTD_SPI_NOR is not set
# CONFIG_MTD_UBI is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set

#
# NVME Support
#

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
# CONFIG_ICS932S401 is not set
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_QCOM_COINCELL is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=y
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
CONFIG_USB_SWITCH_FSA9480=y
# CONFIG_SRAM is not set
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y

#
# Texas Instruments shared transport line discipline
#
CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#

#
# SCIF Bus Driver
#

#
# VOP Bus Driver
#

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
CONFIG_ECHO=y
# CONFIG_MISC_RTSX_USB is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_HAVE_PATA_PLATFORM=y

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y
# CONFIG_INPUT_KEYRESET is not set
# CONFIG_INPUT_KEYCOMBO is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_ATKBD is not set
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_DLINK_DIR685=y
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=y
CONFIG_KEYBOARD_MATRIX=y
CONFIG_KEYBOARD_LM8323=y
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_MAX7359=y
CONFIG_KEYBOARD_MCS=y
CONFIG_KEYBOARD_MPR121=y
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_OPENCORES=y
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
CONFIG_KEYBOARD_STOWAWAY=y
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=y
# CONFIG_KEYBOARD_SH_KEYSC is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
CONFIG_KEYBOARD_XTKBD=y
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
# CONFIG_MOUSE_PS2_BYD is not set
# CONFIG_MOUSE_PS2_LOGIPS2PP is not set
CONFIG_MOUSE_PS2_SYNAPTICS=y
# CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS is not set
# CONFIG_MOUSE_PS2_CYPRESS is not set
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
# CONFIG_MOUSE_PS2_ELANTECH_SMBUS is not set
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
# CONFIG_MOUSE_PS2_FOCALTECH is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=y
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=y
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_GTCO is not set
CONFIG_TABLET_USB_HANWANG=y
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=y
# CONFIG_TOUCHSCREEN_DA9034 is not set
# CONFIG_TOUCHSCREEN_DA9052 is not set
CONFIG_TOUCHSCREEN_DYNAPRO=y
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=y
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_IPROC is not set
CONFIG_TOUCHSCREEN_S6SY761=y
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=y
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=y
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=y
CONFIG_TOUCHSCREEN_MMS114=y
CONFIG_TOUCHSCREEN_MELFAS_MIP4=y
CONFIG_TOUCHSCREEN_MTOUCH=y
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
# CONFIG_TOUCHSCREEN_TI_AM335X_TSC is not set
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
# CONFIG_TOUCHSCREEN_WM831X is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
# CONFIG_TOUCHSCREEN_USB_3M is not set
CONFIG_TOUCHSCREEN_USB_ITM=y
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
# CONFIG_TOUCHSCREEN_USB_GUNZE is not set
# CONFIG_TOUCHSCREEN_USB_DMC_TSC10 is not set
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
# CONFIG_TOUCHSCREEN_USB_JASTEC is not set
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
# CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_RM_TS=y
# CONFIG_TOUCHSCREEN_SILEAD is not set
CONFIG_TOUCHSCREEN_SIS_I2C=y
# CONFIG_TOUCHSCREEN_ST1232 is not set
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=y
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=y
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_88PM80X_ONKEY is not set
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_MAX77693_HAPTIC=y
CONFIG_INPUT_MAX8925_ONKEY=y
CONFIG_INPUT_MAX8997_HAPTIC=y
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_GP2A is not set
# CONFIG_INPUT_GPIO_BEEPER is not set
CONFIG_INPUT_GPIO_DECODER=y
CONFIG_INPUT_ATI_REMOTE2=y
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
CONFIG_INPUT_KXTJ9_POLLED_MODE=y
# CONFIG_INPUT_POWERMATE is not set
CONFIG_INPUT_YEALINK=y
CONFIG_INPUT_CM109=y
CONFIG_INPUT_REGULATOR_HAPTIC=y
CONFIG_INPUT_RETU_PWRBUTTON=y
CONFIG_INPUT_AXP20X_PEK=y
CONFIG_INPUT_UINPUT=y
CONFIG_INPUT_GPIO=y
# CONFIG_INPUT_PCF50633_PMU is not set
# CONFIG_INPUT_PCF8574 is not set
CONFIG_INPUT_PWM_BEEPER=y
CONFIG_INPUT_PWM_VIBRA=y
CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
# CONFIG_INPUT_DA9052_ONKEY is not set
# CONFIG_INPUT_DA9063_ONKEY is not set
# CONFIG_INPUT_WM831X_ON is not set
# CONFIG_INPUT_ADXL34X is not set
CONFIG_INPUT_IMS_PCU=y
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
# CONFIG_INPUT_HISI_POWERKEY is not set
# CONFIG_INPUT_SC27XX_VIBRA is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
# CONFIG_CONSOLE_TRANSLATIONS is not set
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_TRACE_ROUTER=y
CONFIG_TRACE_SINK=y
CONFIG_LDISC_AUTOLOAD=y
# CONFIG_DEVMEM is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_ATMEL is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_IMX is not set
CONFIG_SERIAL_UARTLITE=y
# CONFIG_SERIAL_UARTLITE_CONSOLE is not set
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
CONFIG_SERIAL_SCCNXP_CONSOLE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_BCM63XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_ST_ASC is not set
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_HVC_DRIVER=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_HW_RANDOM is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=y
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=y
CONFIG_TCG_TPM=y
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=y
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
# CONFIG_TCG_CR50_I2C is not set
# CONFIG_TCG_VTPM_PROXY is not set
# CONFIG_TCG_VIRTIO_VTPM is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=y
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_PINCTRL is not set
CONFIG_I2C_MUX_REG=y
CONFIG_I2C_MUX_MLXCPLD=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM_IPROC is not set
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_EFM32 is not set
# CONFIG_I2C_EMEV2 is not set
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_JZ4780 is not set
CONFIG_I2C_KEMPLD=y
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OWL is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
CONFIG_I2C_DLN2=y
CONFIG_I2C_PARPORT_LIGHT=y
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_SLAVE is not set
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
CONFIG_PINCTRL_SH_PFC=y

#
# MediaTek pinctrl drivers
#
# CONFIG_EINT_MTK is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=y
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_MB86S7X=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_ZX is not set

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
# CONFIG_GPIO_MAX732X_IRQ is not set
CONFIG_GPIO_PCA953X=y
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set

#
# MFD GPIO expanders
#
CONFIG_GPIO_ARIZONA=y
CONFIG_GPIO_DA9052=y
CONFIG_GPIO_DLN2=y
CONFIG_GPIO_KEMPLD=y
# CONFIG_GPIO_LP873X is not set
CONFIG_GPIO_MADERA=y
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_TPS65086=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_WM831X=y
CONFIG_GPIO_WM8350=y

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2431 is not set
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=y
# CONFIG_POWER_AVS is not set
# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_PDA_POWER=y
CONFIG_MAX8925_POWER=y
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_WM8350_POWER=y
CONFIG_TEST_POWER=y
CONFIG_CHARGER_ADP5061=y
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
CONFIG_BATTERY_DS2781=y
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
# CONFIG_BATTERY_DA9030 is not set
CONFIG_BATTERY_DA9052=y
# CONFIG_BATTERY_DA9150 is not set
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=y
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_PCF50633=y
# CONFIG_CHARGER_ISP1704 is not set
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
# CONFIG_CHARGER_MANAGER is not set
# CONFIG_CHARGER_LTC3651 is not set
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX8997=y
# CONFIG_CHARGER_MAX8998 is not set
CONFIG_CHARGER_BQ2415X=y
# CONFIG_CHARGER_BQ24190 is not set
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SUN4I_GPADC is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
# CONFIG_MFD_CROS_EC is not set
CONFIG_MFD_MADERA=y
# CONFIG_MFD_MADERA_I2C is not set
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
CONFIG_MFD_CS47L90=y
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_I2C=y
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=y
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
CONFIG_MFD_SMSC=y
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TI_LP873X=y
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_MFD_TPS80031=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
# CONFIG_MFD_WM8997 is not set
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_STW481X is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ANATOP=y
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_DA903X=y
CONFIG_REGULATOR_DA9052=y
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9063 is not set
CONFIG_REGULATOR_DA9210=y
# CONFIG_REGULATOR_DA9211 is not set
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MAX8998=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MT6311=y
# CONFIG_REGULATOR_MT6323 is not set
CONFIG_REGULATOR_MT6358=y
# CONFIG_REGULATOR_MT6397 is not set
# CONFIG_REGULATOR_PBIAS is not set
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_PWM=y
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_RC5T583=y
# CONFIG_REGULATOR_RT5033 is not set
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_TPS80031=y
CONFIG_REGULATOR_WM831X=y
# CONFIG_REGULATOR_WM8350 is not set
CONFIG_RC_CORE=y
CONFIG_RC_MAP=y
CONFIG_LIRC=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_HIX5HD2 is not set
CONFIG_IR_IMON=y
CONFIG_IR_IMON_RAW=y
CONFIG_IR_MCEUSB=y
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_MESON is not set
# CONFIG_IR_MTK is not set
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_REDRAT3 is not set
CONFIG_IR_STREAMZAP=y
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_IR_IGORPLUGUSB=y
CONFIG_IR_IGUANA=y
# CONFIG_IR_TTUSBIR is not set
# CONFIG_IR_RX51 is not set
# CONFIG_IR_IMG is not set
CONFIG_RC_LOOPBACK=y
# CONFIG_IR_GPIO_CIR is not set
# CONFIG_IR_GPIO_TX is not set
# CONFIG_IR_PWM_TX is not set
# CONFIG_RC_ST is not set
# CONFIG_IR_SUNXI is not set
CONFIG_IR_SERIAL=y
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SIR=y
# CONFIG_IR_TANGO is not set
# CONFIG_IR_ZX is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
# CONFIG_DRM is not set
# CONFIG_DRM_DP_CEC is not set

#
# ACP (Audio CoProcessor) Configuration
#

#
# AMD Library routines
#

#
# ARM GPU Configuration
#

#
# Frame buffer Devices
#
# CONFIG_FB is not set
CONFIG_BACKLIGHT_LCD_SUPPORT=y
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_SOUND=y
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=y
CONFIG_SND_PCM_OSS=y
CONFIG_SND_PCM_OSS_PLUGINS=y
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_VERBOSE_PRINTK=y
CONFIG_SND_DEBUG=y
# CONFIG_SND_DEBUG_VERBOSE is not set
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
# CONFIG_SND_SEQUENCER_OSS is not set
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_VIRMIDI=y
CONFIG_SND_VX_LIB=y
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=y
CONFIG_SND_ALOOP=y
CONFIG_SND_VIRMIDI=y
# CONFIG_SND_MTPAV is not set
CONFIG_SND_SERIAL_U16550=y
# CONFIG_SND_MPU401 is not set

#
# HD-Audio
#
CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_SUPERH is not set
# CONFIG_SND_USB is not set
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=y
CONFIG_SND_PDAUDIOCF=y
# CONFIG_SND_SOC is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACCUTOUCH=y
# CONFIG_HID_ACRUX is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_APPLEIR is not set
# CONFIG_HID_ASUS is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_BETOP_FF=y
# CONFIG_HID_CHERRY is not set
# CONFIG_HID_CHICONY is not set
CONFIG_HID_CORSAIR=y
CONFIG_HID_COUGAR=y
CONFIG_HID_PRODIKEYS=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELAN=y
CONFIG_HID_ELECOM=y
CONFIG_HID_ELO=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
CONFIG_HID_HOLTEK=y
CONFIG_HOLTEK_FF=y
CONFIG_HID_GT683R=y
CONFIG_HID_KEYTOUCH=y
# CONFIG_HID_KYE is not set
# CONFIG_HID_UCLOGIC is not set
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_GYRATION is not set
# CONFIG_HID_ICADE is not set
# CONFIG_HID_ITE is not set
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_HIDPP=y
# CONFIG_LOGITECH_FF is not set
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NTI=y
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=y
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
CONFIG_HID_PLANTRONICS=y
# CONFIG_HID_PRIMAX is not set
# CONFIG_HID_QUICKSTEP is not set
CONFIG_HID_RETRODE=y
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=y
# CONFIG_HID_SAMSUNG is not set
CONFIG_HID_SONY=y
# CONFIG_SONY_FF is not set
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
# CONFIG_HID_THINGM is not set
# CONFIG_HID_THRUSTMASTER is not set
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_WACOM=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG_WHITELIST=y
CONFIG_USB_OTG_BLACKLIST_HUB=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_MON=y
CONFIG_USB_WUSB=y
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_XHCI_HISTB is not set
# CONFIG_USB_XHCI_MTK is not set
# CONFIG_USB_XHCI_MVEBU is not set
# CONFIG_USB_XHCI_RCAR is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_SH=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
# CONFIG_USB_U132_HCD is not set
CONFIG_USB_SL811_HCD=y
# CONFIG_USB_SL811_HCD_ISO is not set
# CONFIG_USB_SL811_CS is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HWA_HCD=y
# CONFIG_USB_HCD_BCMA is not set
CONFIG_USB_HCD_TEST_MODE=y

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
CONFIG_USB_DWC2_HOST=y

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_DEBUG=y
# CONFIG_USB_DWC2_VERBOSE is not set
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
CONFIG_USB_DWC2_DEBUG_PERIODIC=y
CONFIG_USB_CHIPIDEA=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
# CONFIG_USB_SERIAL_CH341 is not set
CONFIG_USB_SERIAL_WHITEHEAT=y
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=y
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
CONFIG_USB_SERIAL_IPAQ=y
CONFIG_USB_SERIAL_IR=y
CONFIG_USB_SERIAL_EDGEPORT=y
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=y
# CONFIG_USB_SERIAL_IPW is not set
CONFIG_USB_SERIAL_IUU=y
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
CONFIG_USB_SERIAL_KEYSPAN=y
CONFIG_USB_SERIAL_KLSI=y
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
CONFIG_USB_SERIAL_NAVMAN=y
CONFIG_USB_SERIAL_PL2303=y
# CONFIG_USB_SERIAL_OTI6858 is not set
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=y
# CONFIG_USB_SERIAL_XIRCOM is not set
CONFIG_USB_SERIAL_WWAN=y
# CONFIG_USB_SERIAL_OPTION is not set
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
CONFIG_USB_SERIAL_UPD78F0730=y
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
CONFIG_USB_SEVSEG=y
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_SISUSBVGA_CON is not set
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
CONFIG_USB_EHSET_TEST_FIXTURE=y
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=y
# CONFIG_AM335X_PHY_USB is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_TAHVO_USB is not set
CONFIG_USB_ISP1301=y
# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_TCPCI=y
CONFIG_TYPEC_RT1711H=y
# CONFIG_TYPEC_FUSB302 is not set
CONFIG_TYPEC_UCSI=y
CONFIG_TYPEC_TPS6598X=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_PI3USB30532=y

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
CONFIG_USB_ROLE_SWITCH=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=y
CONFIG_UWB=y
CONFIG_UWB_HWA=y
CONFIG_UWB_I1480U=y
CONFIG_MMC=y
CONFIG_SDIO_UART=y
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
CONFIG_MMC_DEBUG=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_PLTFM=y
# CONFIG_MMC_SDHCI_PXAV3 is not set
# CONFIG_MMC_SDHCI_PXAV2 is not set
# CONFIG_MMC_SDHCI_IPROC is not set
# CONFIG_MMC_OMAP_HS is not set
# CONFIG_MMC_GOLDFISH is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_SDHI=y
# CONFIG_MMC_SDHI_SYS_DMAC is not set
# CONFIG_MMC_SDHI_INTERNAL_DMAC is not set
# CONFIG_MMC_DW is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_VUB300=y
CONFIG_MMC_USHC=y
CONFIG_MMC_USDHI6ROL0=y
# CONFIG_MMC_CQHCI is not set
# CONFIG_MMC_BCM2835 is not set
CONFIG_MMC_MTK=y
# CONFIG_MMC_SDHCI_XENON is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3533=y
# CONFIG_LEDS_LM3642 is not set
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=y
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=y
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_LP8788=y
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_WM831X_STATUS=y
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_DA9052=y
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_MC13783=y
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
CONFIG_LEDS_MAX8997=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_MENF21BMC is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
# CONFIG_LEDS_TRIGGER_ONESHOT is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
CONFIG_LEDS_TRIGGER_GPIO=y
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set
CONFIG_RTC_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_CHARLCD is not set
# CONFIG_UIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_WL=y

#
# Microsoft Hyper-V guest support
#
CONFIG_STAGING=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=y
CONFIG_COMEDI_CB_DAS16_CS=y
CONFIG_COMEDI_DAS08_CS=y
CONFIG_COMEDI_NI_DAQ_700_CS=y
CONFIG_COMEDI_NI_DAQ_DIO24_CS=y
CONFIG_COMEDI_NI_LABPC_CS=y
CONFIG_COMEDI_NI_MIO_CS=y
# CONFIG_COMEDI_QUATECH_DAQP_CS is not set
CONFIG_COMEDI_USB_DRIVERS=y
# CONFIG_COMEDI_DT9812 is not set
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=y
CONFIG_COMEDI_USBDUXFAST=y
CONFIG_COMEDI_USBDUXSIGMA=y
CONFIG_COMEDI_VMK80XX=y
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_LABPC=y
CONFIG_COMEDI_NI_TIO=y

#
# Speakup console speech
#
CONFIG_SPEAKUP=y
# CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
# CONFIG_SPEAKUP_SYNTH_ACNTPC is not set
CONFIG_SPEAKUP_SYNTH_APOLLO=y
# CONFIG_SPEAKUP_SYNTH_AUDPTR is not set
CONFIG_SPEAKUP_SYNTH_BNS=y
# CONFIG_SPEAKUP_SYNTH_DECTLK is not set
CONFIG_SPEAKUP_SYNTH_DECEXT=y
# CONFIG_SPEAKUP_SYNTH_DTLK is not set
# CONFIG_SPEAKUP_SYNTH_KEYPC is not set
# CONFIG_SPEAKUP_SYNTH_LTLK is not set
# CONFIG_SPEAKUP_SYNTH_SOFT is not set
# CONFIG_SPEAKUP_SYNTH_SPKOUT is not set
# CONFIG_SPEAKUP_SYNTH_TXPRT is not set
# CONFIG_SPEAKUP_SYNTH_DUMMY is not set
CONFIG_STAGING_MEDIA=y

#
# Android
#
# CONFIG_ION is not set
CONFIG_GS_FPGABOOT=y
CONFIG_UNISYSSPAR=y
# CONFIG_MOST is not set
# CONFIG_GREYBUS is not set
# CONFIG_MTK_MMC is not set

#
# Gasket devices
#
CONFIG_CHROME_PLATFORMS=y
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_MMIO=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_ATLAS7_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_PRIMA2_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
# CONFIG_CLKSRC_NPS is not set
# CONFIG_CLKSRC_MPS2 is not set
# CONFIG_ARC_TIMERS is not set
CONFIG_ARM_TIMER_SP804=y
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
CONFIG_SYS_SUPPORTS_SH_TMU=y
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_VERSATILE is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_H8300_TMR8 is not set
# CONFIG_H8300_TMR16 is not set
# CONFIG_H8300_TPU is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_ATCPIT100_TIMER is not set
# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_VIRTIO=y
# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# CONFIG_AT91_SOC_ID is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BRCMSTB is not set

#
# NXP/Freescale QorIQ SoC drivers
#

#
# i.MX SoC drivers
#

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_APR is not set
# CONFIG_SOC_RENESAS is not set
CONFIG_ROCKCHIP_GRF=y
# CONFIG_ROCKCHIP_RK3288_PANIC_HANDLER is not set
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
CONFIG_XILINX_VCU=y
# CONFIG_SOC_ZTE is not set
# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX77843=y
# CONFIG_EXTCON_MAX8997 is not set
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
CONFIG_EXTCON_SM5502=y
CONFIG_EXTCON_USB_GPIO=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_PCA9685 is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_STM32_LP is not set

#
# IRQ chip support
#
CONFIG_ARM_GIC_MAX_NR=1
# CONFIG_TS4800_IRQ is not set
# CONFIG_EZNPS_GIC is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_STM32MP157 is not set
# CONFIG_RESET_SUNXI is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set
CONFIG_FMC=y
CONFIG_FMC_FAKEDEV=y
CONFIG_FMC_TRIVIAL=y
CONFIG_FMC_WRITE_EEPROM=y
CONFIG_FMC_CHARDEV=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_QCOM_USB_HS is not set
CONFIG_PHY_QCOM_USB_HSIC=y
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_OMAP_CONTROL_PHY is not set
CONFIG_PHY_TUSB1210=y
# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_RAS is not set

#
# Android
#
CONFIG_ANDROID=y
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
# CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
CONFIG_DAX=y
# CONFIG_NVMEM is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_DUMMY is not set
CONFIG_STM_SOURCE_CONSOLE=y
# CONFIG_STM_SOURCE_HEARTBEAT is not set
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=y
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# CONFIG_FPGA is not set
# CONFIG_TEE is not set
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_LEGACY_ENERGY_MODEL_DT=y
CONFIG_PKGLIST=y
# CONFIG_PKGLIST_USE_CONFIGFS is not set
CONFIG_PKGLIST_NO_CONFIG=y
# CONFIG_INTERCONNECT is not set

#
# File systems
#
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
CONFIG_NLS_CODEPAGE_950=y
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY_PERF_EVENTS_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
# CONFIG_SECURITY_NETWORK is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
CONFIG_HARDENED_USERCOPY_PAGESPAN=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_SAFESETID=y
CONFIG_SECURITY_CHROMIUMOS_READONLY_PROC_SELF_MEM=y
# CONFIG_INTEGRITY is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_RSA=y
# CONFIG_CRYPTO_DH is not set
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_MCRYPTD is not set
# CONFIG_CRYPTO_AUTHENC is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_AEGIS128L=y
CONFIG_CRYPTO_AEGIS256=y
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
# CONFIG_CRYPTO_CRC32C is not set
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_RMD128=y
CONFIG_CRYPTO_RMD160=y
# CONFIG_CRYPTO_RMD256 is not set
CONFIG_CRYPTO_RMD320=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_WP512=y

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST6 is not set
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_KHAZAD is not set
CONFIG_CRYPTO_SALSA20=y
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
CONFIG_CRC32_SARWATE=y
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
# CONFIG_XZ_DEC_POWERPC is not set
# CONFIG_XZ_DEC_IA64 is not set
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_HAVE_GENERIC_DMA_COHERENT=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_DMA_DIRECT_OPS=y
CONFIG_DMA_NONCOHERENT_OPS=y
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_CORDIC=y
CONFIG_DDR=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_STACKDEPOT=y
# CONFIG_PARMAN is not set
CONFIG_STRING_SELFTEST=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4

#
# Compile-time checks and compiler options
#
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_UNUSED_SYMBOLS=y
CONFIG_PAGE_OWNER=y
CONFIG_DEBUG_FS=y
CONFIG_HEADERS_CHECK=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SLUB_DEBUG_ON=y
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=16000
CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_HAVE_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PI_LIST=y
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_PERF_TEST=y
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FTRACE_NMI_ENTER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_FTRACE_NMI_ENTER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
# CONFIG_FUNCTION_GRAPH_TRACER is not set
# CONFIG_PREEMPTIRQ_EVENTS is not set
CONFIG_IRQSOFF_TRACER=y
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_PROFILE_ALL_BRANCHES=y
# CONFIG_BRANCH_TRACER is not set
# CONFIG_STACK_TRACER is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_TEST_SYSCALLS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=y
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_TRACING_EVENTS_GPIO=y
# CONFIG_GCOV_PROFILE_FTRACE is not set
# CONFIG_DMA_API_DEBUG is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_TEST_LIST_SORT is not set
CONFIG_TEST_SORT=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_RBTREE_TEST=y
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=y
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
CONFIG_TEST_HASH=y
CONFIG_TEST_IDA=y
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=y
# CONFIG_TEST_UDELAY is not set
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
# CONFIG_UBSAN is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_SH_STANDARD_BIOS=y
# CONFIG_STACK_DEBUG is not set
CONFIG_4KSTACKS=y
# CONFIG_DUMP_CODE is not set
CONFIG_DWARF_UNWINDER=y
# CONFIG_SH_NO_BSS_INIT is not set
CONFIG_MCOUNT=y

--i/msLgUjIuUnfIu4--
