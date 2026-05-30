Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B474930E85C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 03:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780112186; cv=none; b=BrPxFqvPiOasb3B6s7F9hLtpwPVYVs1o4Zf4K3a4cFB0A6hc4ZkH0FdfK/Cl4SFvnfeL1FQqajlRBV0TMa+/2Lz6e2F9KQRTon/+ZIVowv8GS+Xwwg+Wa2uidNr0B64EYykM78XB3sL/EvSnv1UB2Jofc4N6MAkTbMXrtmbkvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780112186; c=relaxed/simple;
	bh=1SL0tNdMtGBGxDFcf495SphR5bUN2n2VEUm5B8KeVV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tKptJKAOXWfMt+dilFWz6bMsfFxi2u/H6RnRJ2ehWYLG//kTNr2BhUpcYpjy8Kl/Meup0nE3xW19jBbwEVp7gztHFxEOg1pF/N7vo6LK0dRAYpZqLyuDlRAV7XFx8E4r4nDgMrT3diZWVMLNkduGJ/FzOTMtkuPK+gly/s6L7iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpAK7GU6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpAK7GU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780112185; x=1811648185;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1SL0tNdMtGBGxDFcf495SphR5bUN2n2VEUm5B8KeVV0=;
  b=bpAK7GU6LC+GXh4RyWn1l+S5Yzup49m2s37hPS+9N/qgHUvV2mP1w3gh
   AvRsnL1JkbpxkC00II7EEzfo1yDz5hpC9fczmXIkMm8DzF/GFWjxntqfT
   HUKckuVZYJSB2HfH1KKGGFcBvCJHzmr5rr0RwXp3rJIebcCcalNB7F7sm
   Ug0D2xEg+axttC0yOez2vzwFxRtC7O9JxLmMe3nqT8V+NgElAdRzMA9SO
   OOZ1eDgdQgwiex7+RCtIWZZD8BkZUgSDSKpob+/J2MKzzPak0tEm1LYWu
   pZGuOizSJ6XWRUpDvTCE8H0O0lXhqM79FUePWt+013nds2QwjxYV3ImTO
   Q==;
X-CSE-ConnectionGUID: dvo1+5MRSiC5bfNp8f0q2g==
X-CSE-MsgGUID: XO/3QVcORQ+YD4gA75jNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91272303"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91272303"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 20:34:18 -0700
X-CSE-ConnectionGUID: +RlhTqfYSuinnWPNg1fR5w==
X-CSE-MsgGUID: bgmaY32EQ4G80vVXRLs/Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="238632808"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2026 20:34:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTASg-0000000084o-2ORb;
	Sat, 30 May 2026 03:34:10 +0000
Date: Sat, 30 May 2026 11:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 10/18] kernel/sys.c:2878:1: warning: alias
 and aliasee have different types 'long (unsigned int 
 __attribute__((btf_type_tag("user")))*, unsigned int 
 __attribute__((btf_type_tag("user")))*, void 
 __attribute__((btf_type_tag("user")))*)' (aka 'long (unsigned int...
Message-ID: <202605301150.1I5lIDzd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
vdso
head:   034779fb06aba5bc45faf366922bd77e4d36543a
commit: 7158fc54b2c6f124eec0d7cd13bff69da0172e59 [10/18] vdso: Remove struc=
t getcpu_cache
config: loongarch-randconfig-r073-20260530 (https://download.01.org/0day-ci=
/archive/20260530/202605301150.1I5lIDzd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260530/202605301150.1I5lIDzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301150.1I5lIDzd-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   kernel/sys.c:1793:1: warning: alias and aliasee have different types 'lo=
ng (unsigned int, struct rlimit  __attribute__((btf_type_tag("user")))*)' (=
aka 'long (unsigned int, struct rlimit *)') and 'long (typeof (__builtin_ch=
oose_expr((__builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0=
LL)) || __builtin_types_compatible_p(typeof ((unsigned int)0), typeof (0ULL=
))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p=
(typeof ((struct rlimit  __attribute__((btf_type_tag("user")))*)0), typeof =
(0LL)) || __builtin_types_compatible_p(typeof ((struct rlimit  __attribute_=
_((btf_type_tag("user")))*)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (lon=
g, long)') [-Wattribute-alias]
    1793 | SYSCALL_DEFINE2(setrlimit, unsigned int, resource, struct rlimit=
 __user *, rlim)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:1793:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:157:1: note: expanded from here
     157 | __se_sys_setrlimit
         | ^
   kernel/sys.c:1933:1: warning: alias and aliasee have different types 'lo=
ng (int, struct rusage  __attribute__((btf_type_tag("user")))*)' (aka 'long=
 (int, struct rusage *)') and 'long (typeof (__builtin_choose_expr((__built=
in_types_compatible_p(typeof ((int)0), typeof (0LL)) || __builtin_types_com=
patible_p(typeof ((int)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_ch=
oose_expr((__builtin_types_compatible_p(typeof ((struct rusage  __attribute=
__((btf_type_tag("user")))*)0), typeof (0LL)) || __builtin_types_compatible=
_p(typeof ((struct rusage  __attribute__((btf_type_tag("user")))*)0), typeo=
f (0ULL))), 0LL, 0L)))' (aka 'long (long, long)') [-Wattribute-alias]
    1933 | SYSCALL_DEFINE2(getrusage, int, who, struct rusage __user *, ru)
         | ^
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:1933:1: note: aliasee is declared here
   include/linux/syscalls.h:226:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
     226 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:21:1: note: expanded from here
      21 | __se_sys_getrusage
         | ^
   kernel/sys.c:1959:1: warning: alias and aliasee have different types 'lo=
ng (int)' and 'long (typeof (__builtin_choose_expr((__builtin_types_compati=
ble_p(typeof ((int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof=
 ((int)0), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long)') [-Wattribute-al=
ias]
    1959 | SYSCALL_DEFINE1(umask, int, mask)
         | ^
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:1959:1: note: aliasee is declared here
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:50:1: note: expanded from here
      50 | __se_sys_umask
         | ^
   kernel/sys.c:2517:1: warning: alias and aliasee have different types 'lo=
ng (int, unsigned long, unsigned long, unsigned long, unsigned long)' and '=
long (typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((=
int)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((int)0), type=
of (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_compat=
ible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__bui=
ltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), t=
ypeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), typ=
eof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_com=
patible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_compa=
tible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__bu=
iltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0), =
typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), ty=
peof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long, long)') [-Wa=
ttribute-alias]
    2517 | SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigne=
d long, arg3,
         | ^
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:2517:1: note: aliasee is declared here
   include/linux/syscalls.h:229:36: note: expanded from macro 'SYSCALL_DEFI=
NE5'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:113:1: note: expanded from here
     113 | __se_sys_prctl
         | ^
>> kernel/sys.c:2878:1: warning: alias and aliasee have different types 'lo=
ng (unsigned int  __attribute__((btf_type_tag("user")))*, unsigned int  __a=
ttribute__((btf_type_tag("user")))*, void  __attribute__((btf_type_tag("use=
r")))*)' (aka 'long (unsigned int *, unsigned int *, void *)') and 'long (t=
ypeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((unsigne=
d int  __attribute__((btf_type_tag("user")))*)0), typeof (0LL)) || __builti=
n_types_compatible_p(typeof ((unsigned int  __attribute__((btf_type_tag("us=
er")))*)0), typeof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__bu=
iltin_types_compatible_p(typeof ((unsigned int  __attribute__((btf_type_tag=
("user")))*)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsi=
gned int  __attribute__((btf_type_tag("user")))*)0), typeof (0ULL))), 0LL, =
0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((=
void  __attribute__((btf_type_tag("user")))*)0), typeof (0LL)) || __builtin=
_types_compatible_p(typeof ((void  __attribute__((btf_type_tag("user")))*)0=
), typeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long)') [-Wattribut=
e-alias]
    2878 | SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user=
 *, nodep, void __user *, unused)
         | ^
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:2878:1: note: aliasee is declared here
   include/linux/syscalls.h:227:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
     227 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:31:1: note: expanded from here
      31 | __se_sys_getcpu
         | ^
   kernel/sys.c:2957:1: warning: alias and aliasee have different types 'lo=
ng (struct sysinfo  __attribute__((btf_type_tag("user")))*)' (aka 'long (st=
ruct sysinfo *)') and 'long (typeof (__builtin_choose_expr((__builtin_types=
_compatible_p(typeof ((struct sysinfo  __attribute__((btf_type_tag("user"))=
)*)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((struct sysinf=
o  __attribute__((btf_type_tag("user")))*)0), typeof (0ULL))), 0LL, 0L)))' =
(aka 'long (long)') [-Wattribute-alias]
    2957 | SYSCALL_DEFINE1(sysinfo, struct sysinfo __user *, info)
         | ^
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/sys.c:2957:1: note: aliasee is declared here
   include/linux/syscalls.h:225:36: note: expanded from macro 'SYSCALL_DEFI=
NE1'
     225 | #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:170:1: note: expanded from here
     170 | __se_sys_sysinfo
         | ^
   27 warnings generated.


vim +2878 kernel/sys.c

  2877=09
> 2878	SYSCALL_DEFINE3(getcpu, unsigned __user *, cpup, unsigned __user *, =
nodep, void __user *, unused)
  2879	{
  2880		int err =3D 0;
  2881		int cpu =3D raw_smp_processor_id();
  2882=09
  2883		if (cpup)
  2884			err |=3D put_user(cpu, cpup);
  2885		if (nodep)
  2886			err |=3D put_user(cpu_to_node(cpu), nodep);
  2887		return err ? -EFAULT : 0;
  2888	}
  2889=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
