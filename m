Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FAD4F404A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677863; cv=none; b=V3uNnhhnHiHCOZ6E8+lunMbIOhFow3AuQALl4QozcAmK/uwcxtiFDXXyDXSK2vpoBAy66g1DmPz9opX6BKpLoxENrWo7/QZr3cvj1/Zod/MWsyovwHGYehCzU5IuTHvDw83ZI6qCBmqMPgXZIZ0flrQ0sh1F08ThJzUIMx3bMg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677863; c=relaxed/simple;
	bh=u0V9TIJovIyzywtKT8j6y9LZpQnGV+edFXGophSurDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GISX5lNIKKSCysa/SDjvKqWz6lGizbD4CRDu9MMkuRk0snDsQXKhSXNnc/vnYFOWUWWxKEmqVf8eZ7lw9njxKFMF4xMz4E8LVf9C8CPwdLjt6Rfp5RNM9UyN+qko6y0dotUo7y9Zvdy9FNGnPY+15GSJf1HuyV2f4/D/SAxAE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvWTqOPV; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvWTqOPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789677858; x=1821213858;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u0V9TIJovIyzywtKT8j6y9LZpQnGV+edFXGophSurDc=;
  b=EvWTqOPV6QAllx2VVckv0akUYVSHZs7/pPG2/re3Pvg5wisMeZw5gTA5
   ITJrCWKidyF9DYYBkCQnUJBOjQ0trsexbzdzMoaJAewlT8N2YZ0brFvw7
   W9rJ4U/9jMTkr3A3eQfY9wdcvCHB/3tQ1rfi/QfxMJwCo9zTDeMCd9qJI
   q2CSRkrLGUFf4G3weVudpZR4HXSLI4vFrRzwY09wfxg6tGmHtf73wPoIk
   /XL0lbCnBMHF7Pu58s4OnYMQKNrHjhPAqGwNhdOBz52KhEPcRxYdXn/ma
   FoF3uEZ9kBUi9mdbXYrtzdDVpo/ym8002sfcehujxuBysqHCwbAtkCho5
   g==;
X-CSE-ConnectionGUID: M1f9dIj5QUyI+/uPc/Qorw==
X-CSE-MsgGUID: TDtvn5mbSYqJt3x2OIaPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="653731"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="653731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 13:44:11 -0700
X-CSE-ConnectionGUID: rjJtNBtxSA2k/YZgI0N1tg==
X-CSE-MsgGUID: b/gCBYz1RXGBObQ1Fp+nHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275985908"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2026 13:44:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Ixi-000000008UD-3iL6;
	Thu, 17 Sep 2026 20:44:06 +0000
Date: Fri, 18 Sep 2026 04:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-01 2/2]
 kernel/futex/core.c:3562:1: warning: alias and aliasee have different types
 'long (struct robust_list_head *, size_t)' (aka 'long (struct
 robust_list_head *, unsigned int)') and 'long (typeof
 (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((s...
Message-ID: <202609180400.naodon8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-=
01
head:   44f129f9db919b90cfb6ff8603efb59ae9e7ca72
commit: fd8a10d44c11f8f53d640db6b97486045b7e0b81 [2/2] futex: Move to kerne=
l/futex/
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260918/2=
02609180400.naodon8q-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 725=
2edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260918/202609180400.naodon8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180400.naodon8q-lkp@i=
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

52400ba946759a kernel/futex.c Darren Hart     2009-04-03  3541 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3542  /*
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3543   * Support =
for robust futexes: the kernel cleans up held futexes at
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3544   * thread e=
xit time.
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3545   *
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3546   * Implemen=
tation: user-space maintains a per-thread list of locks it
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3547   * is holdi=
ng. Upon do_exit(), the kernel carefully walks this list,
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3548   * and mark=
s all locks that are owned by this thread with the
c87e2837be82df kernel/futex.c Ingo Molnar     2006-06-27  3549   * FUTEX_OW=
NER_DIED bit, and wakes up a waiter (if any). The list is
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3550   * always m=
anipulated with the lock held, so the list is private and
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3551   * per-thre=
ad. Userspace also maintains a per-thread 'list_op_pending'
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3552   * field, t=
o allow the kernel to clean up if the thread dies after
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3553   * acquirin=
g the lock, but just before it could have added itself to
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3554   * the list=
. There can only be one such pending lock.
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3555   */
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3556 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3557  /**
d96ee56ce05829 kernel/futex.c Darren Hart     2009-09-21  3558   * sys_set_=
robust_list() - Set the robust-futex list head of a task
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3559   * @head:	p=
ointer to the list-head
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3560   * @len:	le=
ngth of the list-head, as userspace expects
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3561   */
836f92adf121f8 kernel/futex.c Heiko Carstens  2009-01-14 @3562  SYSCALL_DEF=
INE2(set_robust_list, struct robust_list_head __user *, head,
836f92adf121f8 kernel/futex.c Heiko Carstens  2009-01-14  3563  		size_t, l=
en)
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3564  {
a0c1e9073ef742 kernel/futex.c Thomas Gleixner 2008-02-23  3565  	if (!futex=
_cmpxchg_enabled)
a0c1e9073ef742 kernel/futex.c Thomas Gleixner 2008-02-23  3566  		return -E=
NOSYS;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3567  	/*
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3568  	 * The ker=
nel knows only one size for now:
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3569  	 */
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3570  	if (unlike=
ly(len !=3D sizeof(*head)))
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3571  		return -E=
INVAL;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3572 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3573  	current->r=
obust_list =3D head;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3574 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3575  	return 0;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3576  }
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3577 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3578  /**
d96ee56ce05829 kernel/futex.c Darren Hart     2009-09-21  3579   * sys_get_=
robust_list() - Get the robust-futex list head of a task
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3580   * @pid:	pi=
d of the process [zero for current task]
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3581   * @head_pt=
r:	pointer to a list-head pointer, the kernel fills it in
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3582   * @len_ptr=
:	pointer to a length field, the kernel fills in the header size
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3583   */
836f92adf121f8 kernel/futex.c Heiko Carstens  2009-01-14 @3584  SYSCALL_DEF=
INE3(get_robust_list, int, pid,
836f92adf121f8 kernel/futex.c Heiko Carstens  2009-01-14  3585  		struct ro=
bust_list_head __user * __user *, head_ptr,
836f92adf121f8 kernel/futex.c Heiko Carstens  2009-01-14  3586  		size_t __=
user *, len_ptr)
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3587  {
ba46df984b8e81 kernel/futex.c Al Viro         2006-10-10  3588  	struct rob=
ust_list_head __user *head;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3589  	unsigned l=
ong ret;
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3590  	struct tas=
k_struct *p;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3591 =20
a0c1e9073ef742 kernel/futex.c Thomas Gleixner 2008-02-23  3592  	if (!futex=
_cmpxchg_enabled)
a0c1e9073ef742 kernel/futex.c Thomas Gleixner 2008-02-23  3593  		return -E=
NOSYS;
a0c1e9073ef742 kernel/futex.c Thomas Gleixner 2008-02-23  3594 =20
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3595  	rcu_read_l=
ock();
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3596 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3597  	ret =3D -E=
SRCH;
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3598  	if (!pid)
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3599  		p =3D cur=
rent;
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3600  	else {
228ebcbe634a30 kernel/futex.c Pavel Emelyanov 2007-10-18  3601  		p =3D fin=
d_task_by_vpid(pid);
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3602  		if (!p)
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3603  			goto err=
_unlock;
b0e77598f87107 kernel/futex.c Serge E. Hallyn 2011-03-23  3604  	}
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3605 =20
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3606  	ret =3D -E=
PERM;
caaee6234d05a5 kernel/futex.c Jann Horn       2016-01-20  3607  	if (!ptrac=
e_may_access(p, PTRACE_MODE_READ_REALCREDS))
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3608  		goto err_=
unlock;
bdbb776f882f5a kernel/futex.c Kees Cook       2012-03-19  3609 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3610  	head =3D p=
->robust_list;
aaa2a97eb9c0e9 kernel/futex.c Oleg Nesterov   2006-09-29  3611  	rcu_read_u=
nlock();
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3612 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3613  	if (put_us=
er(sizeof(*head), len_ptr))
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3614  		return -E=
FAULT;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3615  	return put=
_user(head, head_ptr);
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3616 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3617  err_unlock:
aaa2a97eb9c0e9 kernel/futex.c Oleg Nesterov   2006-09-29  3618  	rcu_read_u=
nlock();
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3619 =20
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3620  	return ret;
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3621  }
0771dfefc9e538 kernel/futex.c Ingo Molnar     2006-03-27  3622 =20

:::::: The code at line 3562 was first introduced by commit
:::::: 836f92adf121f806e9beb5b6b88bd5c9c4ea3f24 [CVE-2009-0029] System call=
 wrappers part 31

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Heiko Carstens <heiko.carstens@de.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
