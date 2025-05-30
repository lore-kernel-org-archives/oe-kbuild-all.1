Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CD224AFE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748607080; cv=none; b=SoLGXZccqzw3f7xarWhC3AH9IncwogT3RLtBgncgMVNDiDBFiIyL7D6Wd1MiZjfwIurSXvY+I3iuNpoUChtosjEg4c5UQE4OUmRa0/KxGRe7HRwG1f2Sf29cq6hhtCcPgnJtiPzBXPSrXTH9OqRa0l911L1XFhEkJYtSFc/i1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748607080; c=relaxed/simple;
	bh=x9ob60+XPhEWHScLvWaOrj3Qw2IhHGlFqEMinixYDRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=taWgxPh0DhsTeMPjZh9zZxaYkuGwWqZqxUhp5udMYDDQRLDO3dy5pgNOVmw3nnZqgb3zrwkOIdojY0pDyfu0t9K3KHZHqU5hxQ97xo+YJL0ClrfC9BnkGXGf9yOEYNQCaKi7HCO0NA1UD4vR+ridIEbZwO4sbm6gx70zxiRMGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3v724du; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3v724du"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748607078; x=1780143078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9ob60+XPhEWHScLvWaOrj3Qw2IhHGlFqEMinixYDRY=;
  b=H3v724du8CjVU8RgjSUVNWkOag0xOSKFbjn/n/x9u/TqT25w9lJzeIDo
   OUX0xhXoSBKoJu14wAFAutldx0zqheUdpqxX6ylqVLfjbK5Ad4+0Mr9Z5
   jeJKnSS5H/cp8M5i6Yxk0tmUfgRWmcCtYdlYSP34+CMYcvsE2yhiyFWsF
   CUk1xLUgomL8DY4uF1QHYh8NjZude7uoiv52nxP9efAq7ub+Kzw2CudwE
   bW7/uNChNru3xHyYMZgkC/P9NjJZpmgz1Gbo0BCHq9aznGcfv2CP9IFr1
   nrmujaGacTwHVB8Ee2wdt9kZPqlv8OdSMfhSXrWLgz2x3JNhPa8lHdhVT
   Q==;
X-CSE-ConnectionGUID: 5rM9k1kHRbmlJhh9JuKdiQ==
X-CSE-MsgGUID: jcSd+G1HQB+4ttoWhh51tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50617496"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50617496"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 05:11:14 -0700
X-CSE-ConnectionGUID: GNYtvRPlR6u9/ALv7iB5oQ==
X-CSE-MsgGUID: OriCMBqhQsi33Heeh9sAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="167050502"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2025 05:11:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKyZq-000XcW-35;
	Fri, 30 May 2025 12:11:10 +0000
Date: Fri, 30 May 2025 20:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1654/1654]
 include/linux/uaccess.h:112:17: warning: 'kmask' may be used uninitialized
Message-ID: <202505302048.Z79haowV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8eff3fb546d3baa728542fd40cdbad086cd9227c
commit: b77633c8236f2383f8d994249b40ed1bd3d012c0 [1654/1654] signal: simplify set_user_sigmask/restore_user_sigmask
config: arm64-randconfig-004-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302048.Z79haowV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302048.Z79haowV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505302048.Z79haowV-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

         | ^~~~~~~~~~~
   In file included from include/asm-generic/termios.h:6,
                    from ./arch/arm64/include/generated/uapi/asm/termios.h:1,
                    from include/uapi/linux/termios.h:6,
                    from include/linux/tty.h:7,
                    from kernel/signal.c:23:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_sigaltstack' at kernel/signal.c:3635:13,
       inlined from '__se_sys_sigaltstack' at kernel/signal.c:3631:1:
   include/linux/uaccess.h:112:17: warning: 'new' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/asm-generic/bug.h:5,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from kernel/signal.c:13:
   include/linux/kasan-checks.h: In function '__se_sys_sigaltstack':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3633:17: note: 'new' declared here
    3633 |         stack_t new, old;
         |                 ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'do_compat_sigaltstack' at kernel/signal.c:3678:7:
   include/linux/uaccess.h:112:17: warning: 'uss32' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'do_compat_sigaltstack':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3677:32: note: 'uss32' declared here
    3677 |                 compat_stack_t uss32;
         |                                ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_tgsigqueueinfo' at kernel/signal.c:3496:6,
       inlined from '__se_sys_rt_tgsigqueueinfo' at kernel/signal.c:3491:1:
   include/linux/uaccess.h:112:17: warning: 'info' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__se_sys_rt_tgsigqueueinfo':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3494:19: note: 'info' declared here
    3494 |         siginfo_t info;
         |                   ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_sigqueueinfo' at kernel/signal.c:3454:6,
       inlined from '__se_sys_rt_sigqueueinfo' at kernel/signal.c:3450:1:
   include/linux/uaccess.h:112:17: warning: 'info' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__se_sys_rt_sigqueueinfo':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3453:19: note: 'info' declared here
    3453 |         siginfo_t info;
         |                   ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_sigprocmask' at kernel/signal.c:3783:7,
       inlined from '__se_sys_sigprocmask' at kernel/signal.c:3774:1:
   include/linux/uaccess.h:112:17: warning: 'new_set' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__se_sys_sigprocmask':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3777:31: note: 'new_set' declared here
    3777 |         old_sigset_t old_set, new_set;
         |                               ^~~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_sigprocmask' at kernel/signal.c:2887:7,
       inlined from '__se_sys_rt_sigprocmask' at kernel/signal.c:2874:1:
   include/linux/uaccess.h:112:17: warning: 'new_set' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__se_sys_rt_sigprocmask':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:2877:27: note: 'new_set' declared here
    2877 |         sigset_t old_set, new_set;
         |                           ^~~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'set_user_sigmask' at kernel/signal.c:2836:6:
>> include/linux/uaccess.h:112:17: warning: 'kmask' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'set_user_sigmask':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:2830:18: note: 'kmask' declared here
    2830 |         sigset_t kmask;
         |                  ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_sigtimedwait' at kernel/signal.c:3281:6,
       inlined from '__se_sys_rt_sigtimedwait' at kernel/signal.c:3268:1:
   include/linux/uaccess.h:112:17: warning: 'these' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__se_sys_rt_sigtimedwait':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3272:18: note: 'these' declared here
    3272 |         sigset_t these;
         |                  ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'copy_siginfo_from_user32' at kernel/signal.c:3125:6:
   include/linux/uaccess.h:112:17: warning: 'from' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'copy_siginfo_from_user32':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3123:31: note: 'from' declared here
    3123 |         struct compat_siginfo from;
         |                               ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'restore_altstack' at kernel/signal.c:3648:6:
   include/linux/uaccess.h:112:17: warning: 'new' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'restore_altstack':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3647:17: note: 'new' declared here
    3647 |         stack_t new;
         |                 ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_sigaction' at kernel/signal.c:3834:13,
       inlined from '__se_sys_rt_sigaction' at kernel/signal.c:3822:1,
       inlined from '__arm64_sys_rt_sigaction' at kernel/signal.c:3822:1:
   include/linux/uaccess.h:112:17: warning: 'new_sa' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__arm64_sys_rt_sigaction':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:3827:28: note: 'new_sa' declared here
    3827 |         struct k_sigaction new_sa, old_sa;
         |                            ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__do_sys_rt_sigsuspend' at kernel/signal.c:4053:6,
       inlined from '__se_sys_rt_sigsuspend' at kernel/signal.c:4045:1,
       inlined from '__arm64_sys_rt_sigsuspend' at kernel/signal.c:4045:1:
   include/linux/uaccess.h:112:17: warning: 'newset' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__arm64_sys_rt_sigsuspend':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:4047:18: note: 'newset' declared here
    4047 |         sigset_t newset;
         |                  ^~~~~~


vim +/kmask +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
