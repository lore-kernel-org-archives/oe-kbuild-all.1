Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D171392
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739078103; cv=none; b=Eiefoq8AfkZdxrLWlsxDapRkQsafkDkSGupHAJlFf2nU++S660yqv9GAXqx4MFe3vFsT64k9abUHR/GzksVeiO6OxYOohuW22y/+MYznRT/l3Go9bvapUx68sEUz8VEso6x5iXdf41UNVXKD7JU3jwH5YVGVBRen4pO1EgRmLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739078103; c=relaxed/simple;
	bh=gXD0EcQJk5QgeVVZ2C79c//PIjeAuIk1PBTdoJIbMlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzgaC6jHIWGOo93StHr4SDJf9u2DQxS9jUXlj7tUIcm+W8yBKH80Q4NPiUcAK9YCjK8OOFiN15Sz0jDSRoy1v8Zy8LGUjEAchwO59R3TEVCEUlcU9nRXwfVwbB1prm15M1zKnrANUEuLyFv475PqWavlilxxd2o7kKAOhJQzYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAti82NG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAti82NG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739078100; x=1770614100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXD0EcQJk5QgeVVZ2C79c//PIjeAuIk1PBTdoJIbMlk=;
  b=OAti82NGqmE98f1hGhIQfoClPkx3FOmWeFcoqYOGg5qotPByBv/zl1dM
   mOwXezji+Ki0qvmzgZF00wCJRxANYGgTclV7EEQr566UTithsF5Ipx7Ab
   mzoyoY38cbwABkPHCaXjdTGywitfrEGb/0gBw8GvezqZCd6YFRDMwdoqy
   J2/y8A5m8kjSi4oXjrqxzipyuTGab5F1D9DwXTWdoKTQYr+/zNpGiQFFG
   3zQosc/0T50iGzQvVVI2U/3/1+SQDj1mPotJt+S87J97w+Si4pz6RviP0
   I0jIJqsqOfzD/Z+zt48H9med2jQIAG3i+UuM7zCcnGJpz/UMDdf2jJf4S
   g==;
X-CSE-ConnectionGUID: 5d0OZ9xVSt2htNnH4/BJrA==
X-CSE-MsgGUID: o2WL5NKqTSyeQpvHQ1IfyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39807458"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="39807458"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 21:14:59 -0800
X-CSE-ConnectionGUID: NG6QRTwbR4CWJ67SgXYz5A==
X-CSE-MsgGUID: tDxfCjQ8RCa7QrZwcW4VIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112772164"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 21:14:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgzei-00116l-0s;
	Sun, 09 Feb 2025 05:14:56 +0000
Date: Sun, 9 Feb 2025 13:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1420/1420]
 include/linux/uaccess.h:112:17: warning: 'kmask' may be used uninitialized
Message-ID: <202502091307.JeeYzeRI-lkp@intel.com>
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
head:   cc7cb040bd0afe96f1da94c9f21eda5a986510a5
commit: b77633c8236f2383f8d994249b40ed1bd3d012c0 [1420/1420] signal: simplify set_user_sigmask/restore_user_sigmask
config: arm64-randconfig-r131-20250208 (https://download.01.org/0day-ci/archive/20250209/202502091307.JeeYzeRI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502091307.JeeYzeRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091307.JeeYzeRI-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   include/linux/compat.h:499:9: note: here
     499 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |         ^~~~
   include/linux/compat.h:499:58: warning: this statement may fall through [-Wimplicit-fallthrough=]
     499 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compat.h:500:9: note: here
     500 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |         ^~~~
   include/linux/compat.h:500:58: warning: this statement may fall through [-Wimplicit-fallthrough=]
     500 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compat.h:501:9: note: here
     501 |         case 1: v.sig[1] = (set->sig[0] >> 32); v.sig[0] = set->sig[0];
         |         ^~~~
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
       inlined from '__do_sys_rt_sigprocmask' at kernel/signal.c:2887:7,
       inlined from '__se_sys_rt_sigprocmask' at kernel/signal.c:2874:1,
       inlined from '__arm64_sys_rt_sigprocmask' at kernel/signal.c:2874:1:
   include/linux/uaccess.h:112:17: warning: 'new_set' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__arm64_sys_rt_sigprocmask':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   kernel/signal.c:2877:27: note: 'new_set' declared here
    2877 |         sigset_t old_set, new_set;
         |                           ^~~~~~~
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
d597580d373774 Al Viro        2017-03-20  124  #ifdef INLINE_COPY_TO_USER
d597580d373774 Al Viro        2017-03-20  125  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  126  _copy_to_user(void __user *to, const void *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  127  {
9c5f6908de03a4 Al Viro        2017-06-29  128  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  129  	if (access_ok(to, n)) {
9c5f6908de03a4 Al Viro        2017-06-29  130  		kasan_check_read(from, n);
d597580d373774 Al Viro        2017-03-20  131  		n = raw_copy_to_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  132  	}
d597580d373774 Al Viro        2017-03-20  133  	return n;
d597580d373774 Al Viro        2017-03-20  134  }
d597580d373774 Al Viro        2017-03-20  135  #else
d597580d373774 Al Viro        2017-03-20  136  extern unsigned long
d597580d373774 Al Viro        2017-03-20  137  _copy_to_user(void __user *, const void *, unsigned long);
d597580d373774 Al Viro        2017-03-20  138  #endif
d597580d373774 Al Viro        2017-03-20  139  
d597580d373774 Al Viro        2017-03-20  140  static __always_inline unsigned long __must_check
d597580d373774 Al Viro        2017-03-20  141  copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  142  {
b0377fedb65280 Al Viro        2017-06-29  143  	if (likely(check_copy_size(to, n, false)))
d597580d373774 Al Viro        2017-03-20 @144  		n = _copy_from_user(to, from, n);
d597580d373774 Al Viro        2017-03-20  145  	return n;
d597580d373774 Al Viro        2017-03-20  146  }
d597580d373774 Al Viro        2017-03-20  147  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
