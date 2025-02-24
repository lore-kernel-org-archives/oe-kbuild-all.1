Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE923263C66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416370; cv=none; b=REtpG9/6imcrK8FkjfIaZNeUDNTzh/w6NJuGZ4crEWrumjmuV1BTtzFjhAPtLwCRe9KJtQ50YFzCbnsHTMoHhS3qk1+sUEXvbfeXLfrVx2wKnfKTR0fFhVxbGIoSgzWEJUhAyzgZOXqD4Ceyj+cHvqu2GBIukr03QO+Nexeshsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416370; c=relaxed/simple;
	bh=iDsYe6yJZYKaB/YSKdeCLOwIrFe8SjoFRi2Tq4+cw8Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtLg8lNx5jKcAobhHbTYtTxeHdT/zJd4drANODuRk7pQEEjghgq1nhxtt3GRogkrPgLQNAcrck6smuvVyVTxXlzIazq0RZF20QdZa3xhHZ6gVTg3jbJ8veKCoT7T6Gk0KcdgWB3bPBTmRyxq+URRHMNn0K6v+dXyk1Pb2YdNqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDkGEkrm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDkGEkrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740416368; x=1771952368;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iDsYe6yJZYKaB/YSKdeCLOwIrFe8SjoFRi2Tq4+cw8Y=;
  b=hDkGEkrmwsrguUcl+vwFaKU/Eja/OZVPbT+D8b6+ZnnFFtYjI6LBzx1/
   IKyXGWAMSt8wHI5P09irm7C+lY+PNsKbnbZPQLJbXKOXKEqd5YPZO9wpU
   pukx2HIjKD0mrnp4Dvx95lno60V8Rkz+waohHBDNvABWue3WoJudCsbo4
   w75QKZwCw+m63tRjUaH4oYkQsSb2vaZpi5s/hBgS7j9a5cu5rUxe93gOI
   cmZ8R5x2ZjpB/JC0uktLVLs1SOb873j6SUJPnf0E5XGSkKQ6Ho77IN6Bg
   CtM0Q8NIYnX081QAkP0ds10IRb9b0PAWZXn+JhJGJbyGEsx2I+fJRSvMG
   A==;
X-CSE-ConnectionGUID: DGqhCeOWRmit2qCmliMo4w==
X-CSE-MsgGUID: XY+mgRW6Q12dtM/r0Flvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52586170"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="52586170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 08:59:28 -0800
X-CSE-ConnectionGUID: Fc16okUaQsCJdzFi0OQdxw==
X-CSE-MsgGUID: WdDHLZ7JTZuPnJm5bLijPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116603548"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2025 08:59:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmbnh-000939-0V
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 16:59:25 +0000
Date: Tue, 25 Feb 2025 00:59:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/67 1/1] include/linux/uaccess.h:112:17: warning:
 'old_tv' may be used uninitialized
Message-ID: <202502250050.Nc5OsROT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/67
head:   d4d762eeb80852805ab03951a26b1625f7702e74
commit: a9beb86ae6e55bd92f38453c8623de60b8e5a308 [1/1] sock: Add SO_RCVTIMEO_NEW and SO_SNDTIMEO_NEW
config: arm64-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250050.Nc5OsROT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250050.Nc5OsROT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250050.Nc5OsROT-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   net/core/sock.c: In function 'sock_setsockopt':
   net/core/sock.c:914:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
     914 |                 sock_set_flag(sk, SOCK_TSTAMP_NEW);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/sock.c:915:9: note: here
     915 |         case SO_TIMESTAMPING_OLD:
         |         ^~~~
   In file included from include/linux/crypto.h:26,
                    from include/crypto/hash.h:16,
                    from include/linux/uio.h:14,
                    from include/linux/socket.h:8,
                    from include/linux/skbuff.h:23,
                    from include/linux/ip.h:20,
                    from include/net/ip.h:26,
                    from include/linux/errqueue.h:6,
                    from net/core/sock.c:97:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'sock_set_timeout' at net/core/sock.c:390:7:
>> include/linux/uaccess.h:112:17: warning: 'old_tv' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/uapi/linux/swab.h:6,
                    from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:13,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/unaligned.h:9,
                    from ./arch/arm64/include/generated/asm/unaligned.h:1,
                    from net/core/sock.c:94:
   include/linux/kasan-checks.h: In function 'sock_set_timeout':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/core/sock.c:386:45: note: 'old_tv' declared here
     386 |                 struct __kernel_old_timeval old_tv;
         |                                             ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'sock_set_timeout' at net/core/sock.c:397:7:
   include/linux/uaccess.h:112:17: warning: 'tv' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'sock_set_timeout':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   net/core/sock.c:373:38: note: 'tv' declared here
     373 |         struct __kernel_sock_timeval tv;
         |                                      ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: COMPAT [=n]
   Selected by [y]:
   - ARCH_MXC [=y]
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: COMPAT [=n]
   Selected by [y]:
   - ARCH_MXC [=y]


vim +/old_tv +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
96d4f267e40f95 Linus Torvalds 2019-01-03  111  	if (likely(access_ok(from, n))) {
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
96d4f267e40f95 Linus Torvalds 2019-01-03  129  	if (access_ok(to, n)) {
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
