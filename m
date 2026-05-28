Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A68305695
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779985904; cv=none; b=NMNCSj/jGZz9Fz1uk8kI96kRpRWmtluA/0zWrGDEK/aBvOlvRP1I7dlwMfv5CLZVCwQmOWTS85TopBORvJCmRdypqrRpHaTxmb+AS0LFJz+sEUa2MDp3ooa9xOFNHDQwucjFIwHefVwgJNtobmdu8RYCLI3T2DjfHtd9qxzeo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779985904; c=relaxed/simple;
	bh=g4PfWYekFf3RIlpveF1WxmN46+5vYY0i1UDnwsgoz6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h2ieFG1VEJ+K9jGGeg8KMq1zSKM7ahInk3Vvd9T6tSuNyt25NePjbkhgrvvL2KuDQaERMyicalSB4uspg5pvudOpEQNY35LjsfvOaXj5rTg3meD5PyPcTwvRQYh6YKJjYJgqm/TF2VKcYOp4SX2us/zM9csvv+uDSj+7+dR8soQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heSmqKBV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heSmqKBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779985902; x=1811521902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g4PfWYekFf3RIlpveF1WxmN46+5vYY0i1UDnwsgoz6Y=;
  b=heSmqKBVIVKUhgY0u+i4TBz8Ogp6HCDN1ns+sf/iQOI76EdpU6xesR1L
   wVjMWyBOsYRusblKB7XU++dPq0P8F3KzevQBL+Gp8UuNr+fGW5BZBhtEu
   YOcMrTz2y4PvPf005WsFCVQV1FscU5tGWl9QTW91pm5SYYbVCs1NlQDQ2
   vISojJN4WDMxKP3roYcXVlFtZxXjU2tTNpZGcVxoa6SfZDSNRs6WR7ZvZ
   o/0fTr4SS1GV0dLkj/1PCKoBJTI+yFDx8nzrR3ONbPYovqXUI5paOL78d
   EDinQKrGZ4Jn+RSoDca8hQOO2z2mOfywYZIZ+QrIaBTQ7MBwQ/I9rKLTh
   g==;
X-CSE-ConnectionGUID: +SLpEHtqTt2ptqXsOExp+w==
X-CSE-MsgGUID: pxgGuhbCRoeN/Rdcm7UVVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="84721092"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84721092"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 09:31:42 -0700
X-CSE-ConnectionGUID: Tu2C01M5QIenoGzfeoDYrQ==
X-CSE-MsgGUID: GuxVVQiMRiGRiRmG57JC3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="240027399"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 09:31:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSddx-0000000069s-3993;
	Thu, 28 May 2026 16:31:37 +0000
Date: Fri, 29 May 2026 00:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-05 7/7]
 kernel/futex/core.c:4203:1: warning: alias and aliasee have different types
 'long (u32 *, int, u32, const struct old_timespec32 *, u32 *, u32)' (aka
 'long (unsigned int *, int, unsigned int, const struct old_timespec32 *,
 unsigned int *, unsigned int)') a...
Message-ID: <202605290036.BHMuWBsX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-=
05
head:   661c276466eca251d9f8b1313356fc1c1d9c3e81
commit: fd8a10d44c11f8f53d640db6b97486045b7e0b81 [7/7] futex: Move to kerne=
l/futex/
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260529/202=
605290036.BHMuWBsX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260529/202605290036.BHMuWBsX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290036.BHMuWBsX-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/futex/core.c:3562:1: warning: alias and aliasee have different ty=
pes 'long (struct robust_list_head *, size_t)' (aka 'long (struct robust_li=
st_head *, unsigned int)') and 'long (typeof (__builtin_choose_expr((__buil=
tin_types_compatible_p(typeof ((struct robust_list_head *)0), typeof (0LL))=
 || __builtin_types_compatible_p(typeof ((struct robust_list_head *)0), typ=
eof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((size_t)0), typeof (0LL)) || __builtin_types_compatible_p=
(typeof ((size_t)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long)')=
 [-Wattribute-alias]
    3562 | SYSCALL_DEFINE2(set_robust_list, struct robust_list_head __user =
*, head,
         | ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     217 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:242:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     242 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/futex/core.c:3562:1: note: aliasee is declared here
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     217 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     246 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:235:1: note: expanded from here
     235 | __se_sys_set_robust_list
         | ^
   kernel/futex/core.c:3584:1: warning: alias and aliasee have different ty=
pes 'long (int, struct robust_list_head **, size_t *)' (aka 'long (int, str=
uct robust_list_head **, unsigned int *)') and 'long (typeof (__builtin_cho=
ose_expr((__builtin_types_compatible_p(typeof ((int)0), typeof (0LL)) || __=
builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typ=
eof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((struct ro=
bust_list_head **)0), typeof (0LL)) || __builtin_types_compatible_p(typeof =
((struct robust_list_head **)0), typeof (0ULL))), 0LL, 0L)), typeof (__buil=
tin_choose_expr((__builtin_types_compatible_p(typeof ((size_t *)0), typeof =
(0LL)) || __builtin_types_compatible_p(typeof ((size_t *)0), typeof (0ULL))=
), 0LL, 0L)))' (aka 'long (long, long, long)') [-Wattribute-alias]
    3584 | SYSCALL_DEFINE3(get_robust_list, int, pid,
         | ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     218 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:242:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     242 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/futex/core.c:3584:1: note: aliasee is declared here
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     218 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     246 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:254:1: note: expanded from here
     254 | __se_sys_get_robust_list
         | ^
   kernel/futex/core.c:4022:1: warning: alias and aliasee have different ty=
pes 'long (u32 *, int, u32, const struct __kernel_timespec *, u32 *, u32)' =
(aka 'long (unsigned int *, int, unsigned int, const struct __kernel_timesp=
ec *, unsigned int *, unsigned int)') and 'long (typeof (__builtin_choose_e=
xpr((__builtin_types_compatible_p(typeof ((u32 *)0), typeof (0LL)) || __bui=
ltin_types_compatible_p(typeof ((u32 *)0), typeof (0ULL))), 0LL, 0L)), type=
of (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0), ty=
peof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))=
), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(t=
ypeof ((u32)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((u32)=
0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_ty=
pes_compatible_p(typeof ((const struct __kernel_timespec *)0), typeof (0LL)=
) || __builtin_types_compatible_p(typeof ((const struct __kernel_timespec *=
)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_t=
ypes_compatible_p(typeof ((u32 *)0), typeof (0LL)) || __builtin_types_compa=
tible_p(typeof ((u32 *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_ch=
oose_expr((__builtin_types_compatible_p(typeof ((u32)0), typeof (0LL)) || _=
_builtin_types_compatible_p(typeof ((u32)0), typeof (0ULL))), 0LL, 0L)))' (=
aka 'long (long, long, long, long, long, long)') [-Wattribute-alias]
    4022 | SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int, op, u32, val,
         | ^
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     221 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:242:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     242 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/futex/core.c:4022:1: note: aliasee is declared here
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     221 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     246 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:103:1: note: expanded from here
     103 | __se_sys_futex
         | ^
>> kernel/futex/core.c:4203:1: warning: alias and aliasee have different ty=
pes 'long (u32 *, int, u32, const struct old_timespec32 *, u32 *, u32)' (ak=
a 'long (unsigned int *, int, unsigned int, const struct old_timespec32 *, =
unsigned int *, unsigned int)') and 'long (typeof (__builtin_choose_expr((_=
_builtin_types_compatible_p(typeof ((u32 *)0), typeof (0LL)) || __builtin_t=
ypes_compatible_p(typeof ((u32 *)0), typeof (0ULL))), 0LL, 0L)), typeof (__=
builtin_choose_expr((__builtin_types_compatible_p(typeof ((int)0), typeof (=
0LL)) || __builtin_types_compatible_p(typeof ((int)0), typeof (0ULL))), 0LL=
, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof =
((u32)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((u32)0), ty=
peof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_co=
mpatible_p(typeof ((const struct old_timespec32 *)0), typeof (0LL)) || __bu=
iltin_types_compatible_p(typeof ((const struct old_timespec32 *)0), typeof =
(0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compati=
ble_p(typeof ((u32 *)0), typeof (0LL)) || __builtin_types_compatible_p(type=
of ((u32 *)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((_=
_builtin_types_compatible_p(typeof ((u32)0), typeof (0LL)) || __builtin_typ=
es_compatible_p(typeof ((u32)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (l=
ong, long, long, long, long, long)') [-Wattribute-alias]
    4203 | SYSCALL_DEFINE6(futex_time32, u32 __user *, uaddr, int, op, u32,=
 val,
         | ^
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     221 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:242:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     242 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/futex/core.c:4203:1: note: aliasee is declared here
   include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DEFI=
NE6'
     221 | #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:227:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     227 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:246:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     246 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:122:1: note: expanded from here
     122 | __se_sys_futex_time32
         | ^
   4 warnings generated.


vim +4203 kernel/futex/core.c

04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4201 =20
bec2f7cbb73ead kernel/futex.c Arnd Bergmann     2018-04-17  4202  #ifdef CO=
NFIG_COMPAT_32BIT_TIME
8dabe7245bbc13 kernel/futex.c Arnd Bergmann     2019-01-07 @4203  SYSCALL_D=
EFINE6(futex_time32, u32 __user *, uaddr, int, op, u32, val,
1ce53e2c2ac069 kernel/futex.c Alejandro Colomar 2020-11-28  4204  		const s=
truct old_timespec32 __user *, utime, u32 __user *, uaddr2,
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4205  		u32, va=
l3)
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4206  {
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4207  	int ret,=
 cmd =3D op & FUTEX_CMD_MASK;
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4208  	ktime_t =
t, *tp =3D NULL;
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4209  	struct t=
imespec64 ts;
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4210 =20
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4211  	if (utim=
e && futex_cmd_has_timeout(cmd)) {
bec2f7cbb73ead kernel/futex.c Arnd Bergmann     2018-04-17  4212  		if (get=
_old_timespec32(&ts, utime))
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4213  			return=
 -EFAULT;
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4214  		ret =3D =
futex_init_timeout(cmd, op, &ts, &t);
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4215  		if (ret)
51cf94d16860a3 kernel/futex.c Thomas Gleixner   2021-04-22  4216  			return=
 ret;
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4217  		tp =3D =
&t;
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4218  	}
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4219 =20
b097d5ed335615 kernel/futex.c Thomas Gleixner   2021-04-22  4220  	return d=
o_futex(uaddr, op, val, tp, uaddr2, (unsigned long)utime, val3);
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4221  }
bec2f7cbb73ead kernel/futex.c Arnd Bergmann     2018-04-17  4222  #endif /*=
 CONFIG_COMPAT_32BIT_TIME */
04e7712f446058 kernel/futex.c Arnd Bergmann     2018-04-17  4223 =20

:::::: The code at line 4203 was first introduced by commit
:::::: 8dabe7245bbc134f2cfcc12cde75c019dab924cc y2038: syscalls: rename y20=
38 compat syscalls

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
