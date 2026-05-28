Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95C371D0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956169; cv=none; b=qdHfZiirv3ET8mJ0qJ1OQDJqicLdH986DvhjxdTxsO8k1JfZJa09ao/8uEDfOLTzQQ8grGe6m0vS41RKMKgN41mNvJVk+vXTO0rxUI8gVLQvi1CNEC9bPs2JaApb5waNOBv1+JfvQWXiboC2CU0pZV74Wl2jZh3Os/zguuZEyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956169; c=relaxed/simple;
	bh=sS2f9e0EyeWi2ERuzaT2H9C/uf8YCccbrpFw08FLDNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d4K4RjT75Ke97W2HCc/E3N2foHVCXiqVDClvVLAgwaViB7vq7UF0d4gtoMx9BbSs4bUrddBiLid1hJst2m/f7qIWNPVokw9y/IzweEFRSNaHxz4k1mYk2AQ0b4S46EoGs+GJShQZoHJulzq8ofxIFfj90OpylLnhukxIEpsWbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fzyw+NLV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fzyw+NLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779956166; x=1811492166;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sS2f9e0EyeWi2ERuzaT2H9C/uf8YCccbrpFw08FLDNA=;
  b=Fzyw+NLVhxQL149+3L3D4dgySDmRjquY/IXRBLzhVPqlz3TTf69gS9HR
   Nvq3jiT83roucR/ipgWspVCSjllL9wOeaAMjLT2t05WgcJTikbykqdJm2
   W/uA72TvTJaOULdyDZUoEYkv/YHLOXP/4141y2m+5AXNyCGcJCJ8wyaU1
   x0Qv/hsnX5IkPPXL9/tYBc9FjNr5F4TZmzzXaPuZEP1jPoadEDgknZmkB
   xuxQA87uBOiWlT15tgZfe3lM/F2SZFRzXGrFVeQ3fFOAMEMHLte7jhkvw
   vX9nJEtwYsOF1JIZ0jZykSh2Z6/ar35MRPSmI9rdlAvA4Vt5g+uTsvDpK
   A==;
X-CSE-ConnectionGUID: cAcbXS4ORk+WKA/rZ0bGSA==
X-CSE-MsgGUID: 5GxlyU1JThCrcCa7DLP/vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92269234"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="92269234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 01:16:06 -0700
X-CSE-ConnectionGUID: vLvxWruTR5WWaLPtEOxz3g==
X-CSE-MsgGUID: wvrkzF19Q3a3/iB+lHWcbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241450803"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2026 01:16:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSVuL-000000005j2-3uwg;
	Thu, 28 May 2026 08:16:01 +0000
Date: Thu, 28 May 2026 16:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-04 3/3]
 kernel/futex/core.c:3562:1: warning: alias and aliasee have different types
 'long (struct robust_list_head *, size_t)' (aka 'long (struct
 robust_list_head *, unsigned int)') and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((s...
Message-ID: <202605281617.69DUY2ma-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-=
04
head:   c856a85a5323cd392811fc4607782f45293d7da1
commit: fd8a10d44c11f8f53d640db6b97486045b7e0b81 [3/3] futex: Move to kerne=
l/futex/
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260528/2=
02605281617.69DUY2ma-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260528/202605281617.69DUY2ma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281617.69DUY2ma-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.c:3562:1: warning: alias and aliasee have different ty=
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
   <scratch space>:20:1: note: expanded from here
      20 | __se_sys_set_robust_list
         | ^
>> kernel/futex/core.c:3584:1: warning: alias and aliasee have different ty=
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
   <scratch space>:39:1: note: expanded from here
      39 | __se_sys_get_robust_list
         | ^
>> kernel/futex/core.c:4022:1: warning: alias and aliasee have different ty=
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
   <scratch space>:94:1: note: expanded from here
      94 | __se_sys_futex
         | ^
   3 warnings generated.


vim +3562 kernel/futex/core.c

52400ba946759af kernel/futex.c Darren Hart     2009-04-03  3541 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3542  /*
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3543   * Support=
 for robust futexes: the kernel cleans up held futexes at
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3544   * thread =
exit time.
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3545   *
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3546   * Impleme=
ntation: user-space maintains a per-thread list of locks it
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3547   * is hold=
ing. Upon do_exit(), the kernel carefully walks this list,
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3548   * and mar=
ks all locks that are owned by this thread with the
c87e2837be82df4 kernel/futex.c Ingo Molnar     2006-06-27  3549   * FUTEX_O=
WNER_DIED bit, and wakes up a waiter (if any). The list is
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3550   * always =
manipulated with the lock held, so the list is private and
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3551   * per-thr=
ead. Userspace also maintains a per-thread 'list_op_pending'
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3552   * field, =
to allow the kernel to clean up if the thread dies after
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3553   * acquiri=
ng the lock, but just before it could have added itself to
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3554   * the lis=
t. There can only be one such pending lock.
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3555   */
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3556 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3557  /**
d96ee56ce058296 kernel/futex.c Darren Hart     2009-09-21  3558   * sys_set=
_robust_list() - Set the robust-futex list head of a task
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3559   * @head:	=
pointer to the list-head
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3560   * @len:	l=
ength of the list-head, as userspace expects
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3561   */
836f92adf121f80 kernel/futex.c Heiko Carstens  2009-01-14 @3562  SYSCALL_DE=
FINE2(set_robust_list, struct robust_list_head __user *, head,
836f92adf121f80 kernel/futex.c Heiko Carstens  2009-01-14  3563  		size_t, =
len)
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3564  {
a0c1e9073ef7428 kernel/futex.c Thomas Gleixner 2008-02-23  3565  	if (!fute=
x_cmpxchg_enabled)
a0c1e9073ef7428 kernel/futex.c Thomas Gleixner 2008-02-23  3566  		return -=
ENOSYS;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3567  	/*
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3568  	 * The ke=
rnel knows only one size for now:
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3569  	 */
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3570  	if (unlik=
ely(len !=3D sizeof(*head)))
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3571  		return -=
EINVAL;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3572 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3573  	current->=
robust_list =3D head;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3574 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3575  	return 0;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3576  }
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3577 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3578  /**
d96ee56ce058296 kernel/futex.c Darren Hart     2009-09-21  3579   * sys_get=
_robust_list() - Get the robust-futex list head of a task
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3580   * @pid:	p=
id of the process [zero for current task]
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3581   * @head_p=
tr:	pointer to a list-head pointer, the kernel fills it in
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3582   * @len_pt=
r:	pointer to a length field, the kernel fills in the header size
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3583   */
836f92adf121f80 kernel/futex.c Heiko Carstens  2009-01-14 @3584  SYSCALL_DE=
FINE3(get_robust_list, int, pid,
836f92adf121f80 kernel/futex.c Heiko Carstens  2009-01-14  3585  		struct r=
obust_list_head __user * __user *, head_ptr,
836f92adf121f80 kernel/futex.c Heiko Carstens  2009-01-14  3586  		size_t _=
_user *, len_ptr)
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3587  {
ba46df984b8e811 kernel/futex.c Al Viro         2006-10-10  3588  	struct ro=
bust_list_head __user *head;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3589  	unsigned =
long ret;
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3590  	struct ta=
sk_struct *p;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3591 =20
a0c1e9073ef7428 kernel/futex.c Thomas Gleixner 2008-02-23  3592  	if (!fute=
x_cmpxchg_enabled)
a0c1e9073ef7428 kernel/futex.c Thomas Gleixner 2008-02-23  3593  		return -=
ENOSYS;
a0c1e9073ef7428 kernel/futex.c Thomas Gleixner 2008-02-23  3594 =20
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3595  	rcu_read_=
lock();
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3596 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3597  	ret =3D -=
ESRCH;
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3598  	if (!pid)
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3599  		p =3D cu=
rrent;
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3600  	else {
228ebcbe634a30a kernel/futex.c Pavel Emelyanov 2007-10-18  3601  		p =3D fi=
nd_task_by_vpid(pid);
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3602  		if (!p)
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3603  			goto er=
r_unlock;
b0e77598f871070 kernel/futex.c Serge E. Hallyn 2011-03-23  3604  	}
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3605 =20
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3606  	ret =3D -=
EPERM;
caaee6234d05a58 kernel/futex.c Jann Horn       2016-01-20  3607  	if (!ptra=
ce_may_access(p, PTRACE_MODE_READ_REALCREDS))
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3608  		goto err=
_unlock;
bdbb776f882f5ad kernel/futex.c Kees Cook       2012-03-19  3609 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3610  	head =3D =
p->robust_list;
aaa2a97eb9c0e91 kernel/futex.c Oleg Nesterov   2006-09-29  3611  	rcu_read_=
unlock();
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3612 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3613  	if (put_u=
ser(sizeof(*head), len_ptr))
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3614  		return -=
EFAULT;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3615  	return pu=
t_user(head, head_ptr);
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3616 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3617  err_unlock:
aaa2a97eb9c0e91 kernel/futex.c Oleg Nesterov   2006-09-29  3618  	rcu_read_=
unlock();
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3619 =20
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3620  	return re=
t;
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3621  }
0771dfefc9e538f kernel/futex.c Ingo Molnar     2006-03-27  3622 =20

:::::: The code at line 3562 was first introduced by commit
:::::: 836f92adf121f806e9beb5b6b88bd5c9c4ea3f24 [CVE-2009-0029] System call=
 wrappers part 31

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Heiko Carstens <heiko.carstens@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
