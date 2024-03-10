Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70BB3B782
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710109215; cv=none; b=j7D6p+dDCTrLdkuUu76sB2YmDIoKAbhC9BY1dyweyXQahkHqp2i4+i6yYw6CAOeUvIHag4DS9zKQU5Ii+iV5nlOvR0wniURDzpDkp3hCja2Tp8bVacujUjwCCqP05IYwNqfTBB2PY+UlN6XDYUXomQt8uLd+08L8M2TYV8NnBiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710109215; c=relaxed/simple;
	bh=QTsyRhKp4GyIq4rO/QaG4fNuSWfL7urRpObTe3E7m4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSLrhlgVBB3hdolCVMQzmFYUwDwNLzL2Uf+i20TQRPU8n2t5I2SthQ5Sh+xB+jTnMfuYuXnJeL6PQ7ycziKFRX82Q528JeeLTv7eJT7z96YcMQAbUTV69CMSeplAahWG19YJvztIKLBZXiuSE96HCKx02YDisI7h+PHRJSjhYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAkKoUIm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAkKoUIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710109213; x=1741645213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QTsyRhKp4GyIq4rO/QaG4fNuSWfL7urRpObTe3E7m4g=;
  b=nAkKoUImrcvmPVXL8gkJlJub5M/2uAB6t+RfIXGVL/WV+tK+kaWUdvzG
   n9KMHUNGpIlPw7AY2lzhdRbzYpHXpaYQXI/t/uSehHwbFOGT1l+KqKi2Q
   FR6UTsW0S/VH1KzT2d2N6s+ra1DznK7Hurngeq12VCGUfeqKvaha7RN9j
   khRSsH2Dt7XdTeL8xZKZhPWzJ0exnvnuJNAqrN3Axa2B4vJXdLxwLLYvf
   1cvlynTmPJQBODTaEmjIK2yaXmd+HZNRms5WCxpcpuKXUPpgB3Sr0JUwv
   peg/Rh/9Mmk8mYSxp+FtMHeaY6eCSrjCVKcuY35DzizhJURPgo8Yu1qzk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8578827"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="8578827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 15:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="10882147"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2024 15:20:10 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjRWZ-0008eb-1S;
	Sun, 10 Mar 2024 22:20:07 +0000
Date: Mon, 11 Mar 2024 06:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13375/21829]
 include/linux/uaccess.h:112:17: warning: 'kbrep' may be used uninitialized
Message-ID: <202403110630.3gj4ph83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bf1b7dd5d431b4248d92755c06e76094bbe2b7b4
commit: c20f651cb5a90254b561f218b967e04ff626853e [13375/21829] vt: vt_ioctl: remove unnecessary console allocation checks
config: arm64-randconfig-003-20240308 (https://download.01.org/0day-ci/archive/20240311/202403110630.3gj4ph83-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110630.3gj4ph83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110630.3gj4ph83-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/termios.h:6,
                    from ./arch/arm64/include/generated/uapi/asm/termios.h:1,
                    from include/uapi/linux/termios.h:6,
                    from include/linux/tty.h:7,
                    from drivers/tty/vt/vt_ioctl.c:15:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_event_wait_ioctl' at drivers/tty/vt/vt_ioctl.c:187:6:
   include/linux/uaccess.h:112:17: warning: 'vw' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/sched/signal.h:6,
                    from drivers/tty/vt/vt_ioctl.c:14:
   include/linux/kasan-checks.h: In function 'vt_event_wait_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:185:30: note: 'vw' declared here
     185 |         struct vt_event_wait vw;
         |                              ^~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:450:7:
>> include/linux/uaccess.h:112:17: warning: 'kbrep' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:445:35: note: 'kbrep' declared here
     445 |                 struct kbd_repeat kbrep;
         |                                   ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:605:7:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:601:32: note: 'tmp' declared here
     601 |                 struct vt_mode tmp;
         |                                ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:703:7:
>> include/linux/uaccess.h:112:17: warning: 'vsa' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:698:39: note: 'vsa' declared here
     698 |                 struct vt_setactivate vsa;
         |                                       ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:859:7:
   include/linux/uaccess.h:112:17: warning: 'v' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:856:35: note: 'v' declared here
     856 |                 struct vt_consize v;
         |                                   ^
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'do_fontx_ioctl' at drivers/tty/vt/vt_ioctl.c:246:6,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:936:9:
   include/linux/uaccess.h:112:17: warning: 'cfdarg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:243:32: note: 'cfdarg' declared here
     243 |         struct consolefontdesc cfdarg;
         |                                ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:965:7:
   include/linux/uaccess.h:112:17: warning: 'op' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:352:32: note: 'op' declared here
     352 |         struct console_font_op op;      /* used in multiple places here */
         |                                ^~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'do_unimap_ioctl' at drivers/tty/vt/vt_ioctl.c:285:6,
       inlined from 'vt_ioctl' at drivers/tty/vt/vt_ioctl.c:1009:9:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:283:27: note: 'tmp' declared here
     283 |         struct unimapdesc tmp;
         |                           ^~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_fontx_ioctl' at drivers/tty/vt/vt_ioctl.c:1090:6,
       inlined from 'vt_compat_ioctl' at drivers/tty/vt/vt_ioctl.c:1202:9:
   include/linux/uaccess.h:112:17: warning: 'cfdarg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_compat_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:1087:39: note: 'cfdarg' declared here
    1087 |         struct compat_consolefontdesc cfdarg;
         |                                       ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_kdfontop_ioctl' at drivers/tty/vt/vt_ioctl.c:1137:6,
       inlined from 'vt_compat_ioctl' at drivers/tty/vt/vt_ioctl.c:1206:9:
   include/linux/uaccess.h:112:17: warning: 'op' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_compat_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/tty/vt/vt_ioctl.c:1183:32: note: 'op' declared here
    1183 |         struct console_font_op op;      /* used in multiple places here */
         |                                ^~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_unimap_ioctl' at drivers/tty/vt/vt_ioctl.c:1163:6,
       inlined from 'vt_compat_ioctl' at drivers/tty/vt/vt_ioctl.c:1211:9:
   include/linux/uaccess.h:112:17: warning: 'tmp' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'vt_compat_ioctl':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here


vim +/kbrep +112 include/linux/uaccess.h

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
