Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF827F18F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771349580; cv=none; b=Nn+e9eDZOthEp5NJTqXPeMphm8MZTOblHQY155roYRnmjtkbZ2aTSwwtZ655rAGVZmA1SI7FD3PtAMppBoY7yN7wKXo2JcBaqOMxQJUDEsRKj4fNmxyRWom6teB/6r9cQoSSqsm97QhSU80pvr946t2Jicp5Z5Si28K8cUXVvjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771349580; c=relaxed/simple;
	bh=QqLMLlQvKvdOsVp1cKC/XtNNJ5W8MtMw7iyAsfwDpJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MooBLI0e01QdJgaLNCaIg0nq5C9jav3uyjouEz76NnMvz/94w1tzAVEOqJodiUGUC+y0uiytfHH+LelIo9vllh1fiBCKhtAxqc/0/osV5qBulJkkNDhlKTahOd/ZZwas8aCvkxrnLK/vK91JIdbZB+3zSzXX8XZ4wnR1ujWEdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sbw5aEac; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sbw5aEac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771349578; x=1802885578;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QqLMLlQvKvdOsVp1cKC/XtNNJ5W8MtMw7iyAsfwDpJA=;
  b=Sbw5aEacxCTNcxRTLFxSYaw//ZrY9yr2KZH2E7fL6XnxKqey1PYIhADW
   FH6/HlDjtQteydMervrsF6aTsArWHQO1U9NKCAvpof/J7T97r20xRHmDV
   rwFz81vKEKoGaj6/W5vN5ncwgUE9u6lau3+cqOp+J4pGFMh6NJf94J1ew
   TlVhtnYRBw0emWPJ2Slm4JXn1XZU0etaFUTzoSkQm1nf2hwbuMWPKNo5A
   9NSjC23xmzOfRg/hG2T/Q5CnF0S5aj8pqynK5/IXEK0ZOrqeUwKM2AolX
   oVX08W0henH0QJQizTb5aeKDCQQusWW2rRZT15ymrUync33tc5xiKn31N
   w==;
X-CSE-ConnectionGUID: /2KjABf9RzKl+DPOHsc9YA==
X-CSE-MsgGUID: IXALKWnDTjeRku7btIADlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="59991554"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="59991554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:32:57 -0800
X-CSE-ConnectionGUID: kudjefdjS3aPjr5Bpm+Yjg==
X-CSE-MsgGUID: /LvkIMWjT4adENMetKx3xQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2026 09:32:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsOwP-000000011EK-2QVc;
	Tue, 17 Feb 2026 17:32:53 +0000
Date: Wed, 18 Feb 2026 01:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 20/27]
 arch/x86/include/asm/vdso/gettimeofday.h:149:34: error: 'VDSO_CLOCKMODE_TSC'
 undeclared; did you mean 'VDSO_CLOCKMODE_MAX'?
Message-ID: <202602180123.EDVGm0uR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-compat_32bit_time
head:   e2c69e96cd498c7b99d45f1d7e0afbac22dc3e38
commit: 48df0c19b71f01f91e328dc35501e0b5a1b84bf2 [20/27] guard
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260218/2=
02602180123.EDVGm0uR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260218/202602180123.EDVGm0uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180123.EDVGm0uR-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/hyperv/hvhdk_mini.h:8,
                    from include/hyperv/hvhdk.h:10,
                    from include/clocksource/hyperv_timer.h:18,
                    from arch/x86/include/asm/vdso/gettimeofday.h:20,
                    from include/vdso/gettime.h:7,
                    from arch/x86/um/vdso/um_vdso.c:12:
>> include/hyperv/hvgdk_mini.h:1443:36: error: field 'msi_entry' has incomp=
lete type
    1443 |                 union hv_msi_entry msi_entry;
         |                                    ^~~~~~~~~
>> arch/x86/include/asm/vdso/gettimeofday.h:147:54: warning: 'struct vdso_t=
ime_data' declared inside parameter list will not be visible outside of thi=
s definition or declaration
     147 |                                         const struct vdso_time_d=
ata *vd)
         |                                                      ^~~~~~~~~~~=
~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from arch/x86/include/asm/msr-index.h:5,
                    from arch/x86/include/asm/msr.h:5,
                    from arch/x86/include/asm/vdso/gettimeofday.h:18:
   arch/x86/include/asm/vdso/gettimeofday.h: In function '__arch_get_hw_cou=
nter':
>> arch/x86/include/asm/vdso/gettimeofday.h:149:34: error: 'VDSO_CLOCKMODE_=
TSC' undeclared (first use in this function); did you mean 'VDSO_CLOCKMODE_=
MAX'?
     149 |         if (likely(clock_mode =3D=3D VDSO_CLOCKMODE_TSC))
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/x86/include/asm/vdso/gettimeofday.h:149:34: note: each undeclared i=
dentifier is reported only once for each function it appears in
     149 |         if (likely(clock_mode =3D=3D VDSO_CLOCKMODE_TSC))
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
>> arch/x86/include/asm/vdso/gettimeofday.h:150:29: error: implicit declara=
tion of function 'rdtsc_ordered' [-Wimplicit-function-declaration]
     150 |                 return (u64)rdtsc_ordered() & S64_MAX;
         |                             ^~~~~~~~~~~~~
   arch/x86/include/asm/vdso/gettimeofday.h: At top level:
>> arch/x86/include/asm/vdso/gettimeofday.h:172:58: warning: 'struct vdso_c=
lock' declared inside parameter list will not be visible outside of this de=
finition or declaration
     172 | static inline bool arch_vdso_clocksource_ok(const struct vdso_cl=
ock *vc)
         |                                                          ^~~~~~~=
~~~
   arch/x86/include/asm/vdso/gettimeofday.h:211:54: warning: 'struct vdso_c=
lock' declared inside parameter list will not be visible outside of this de=
finition or declaration
     211 | static __always_inline u64 vdso_calc_ns(const struct vdso_clock =
*vc, u64 cycles, u64 base)
         |                                                      ^~~~~~~~~~
   arch/x86/include/asm/vdso/gettimeofday.h: In function 'vdso_calc_ns':
>> arch/x86/include/asm/vdso/gettimeofday.h:213:32: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     213 |         u64 delta =3D cycles - vc->cycle_last;
         |                                ^~
   arch/x86/include/asm/vdso/gettimeofday.h:225:32: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     225 |         if (unlikely(delta > vc->max_cycles)) {
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/x86/include/asm/vdso/gettimeofday.h:232:42: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     232 |                         return base >> vc->shift;
         |                                          ^~
   arch/x86/include/asm/vdso/gettimeofday.h:235:67: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     235 |                 return mul_u64_u32_add_u64_shr(delta & S64_MAX, =
vc->mult, base, vc->shift);
         |                                                                 =
  ^~
   arch/x86/include/asm/vdso/gettimeofday.h:235:83: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     235 |                 return mul_u64_u32_add_u64_shr(delta & S64_MAX, =
vc->mult, base, vc->shift);
         |                                                                 =
                  ^~
   arch/x86/include/asm/vdso/gettimeofday.h:238:28: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     238 |         return ((delta * vc->mult) + base) >> vc->shift;
         |                            ^~
   arch/x86/include/asm/vdso/gettimeofday.h:238:49: error: invalid use of u=
ndefined type 'const struct vdso_clock'
     238 |         return ((delta * vc->mult) + base) >> vc->shift;
         |                                                 ^~


vim +149 arch/x86/include/asm/vdso/gettimeofday.h

7ac8707479886c Vincenzo Frascino  2019-06-21   14 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   15  #include <uapi/linux/tim=
e.h>
7ac8707479886c Vincenzo Frascino  2019-06-21   16  #include <asm/vgtod.h>
7ac8707479886c Vincenzo Frascino  2019-06-21   17  #include <asm/unistd.h>
7ac8707479886c Vincenzo Frascino  2019-06-21   18  #include <asm/msr.h>
7ac8707479886c Vincenzo Frascino  2019-06-21   19  #include <asm/pvclock.h>
dd2cb348613b44 Michael Kelley     2019-07-01  @20  #include <clocksource/hy=
perv_timer.h>
a0636d4c3ad0da H. Peter Anvin     2025-12-16   21  #include <asm/vdso/sys_c=
all.h>
7ac8707479886c Vincenzo Frascino  2019-06-21   22 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   23  #define VDSO_HAS_TIME 1
7ac8707479886c Vincenzo Frascino  2019-06-21   24 =20
f66501dc53e720 Vincenzo Frascino  2019-06-21   25  #define VDSO_HAS_CLOCK_G=
ETRES 1
f66501dc53e720 Vincenzo Frascino  2019-06-21   26 =20
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   27  /*
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   28   * Declare the memory-ma=
pped vclock data pages.  These come from hypervisors.
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   29   * If we ever reintroduc=
e something like direct access to an MMIO clock like
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   30   * the HPET again, it wi=
ll go here as well.
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   31   *
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   32   * A load from any of th=
ese pages will segfault if the clock in question is
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   33   * disabled, so appropri=
ate compiler barriers and checks need to be used
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   34   * to prevent stray load=
s.
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   35   *
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   36   * These declarations MU=
ST NOT be const.  The compiler will assume that
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   37   * an extern const varia=
ble has genuinely constant contents, and the
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   38   * resulting code won't =
work, since the whole point is that these pages
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   39   * change over time, pos=
sibly while we're accessing them.
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   40   */
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   41 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   42  #ifdef CONFIG_PARAVIRT_C=
LOCK
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   43  /*
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   44   * This is the vCPU 0 pv=
clock page.  We only use pvclock from the vDSO
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   45   * if the hypervisor tel=
ls us that all vCPUs can get valid data from the
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   46   * vCPU 0 page.
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   47   */
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   48  extern struct pvclock_vs=
yscall_time_info pvclock_page
7ac8707479886c Vincenzo Frascino  2019-06-21   49  	__attribute__((visibili=
ty("hidden")));
7ac8707479886c Vincenzo Frascino  2019-06-21   50  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21   51 =20
3e2d94535adb2d Vitaly Kuznetsov   2019-08-22   52  #ifdef CONFIG_HYPERV_TIM=
ER
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   53  extern struct ms_hyperv_=
tsc_page hvclock_page
7ac8707479886c Vincenzo Frascino  2019-06-21   54  	__attribute__((visibili=
ty("hidden")));
7ac8707479886c Vincenzo Frascino  2019-06-21   55  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21   56 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   57  static __always_inline
7ac8707479886c Vincenzo Frascino  2019-06-21   58  long clock_gettime_fallb=
ack(clockid_t _clkid, struct __kernel_timespec *_ts)
7ac8707479886c Vincenzo Frascino  2019-06-21   59  {
a0636d4c3ad0da H. Peter Anvin     2025-12-16   60  	return VDSO_SYSCALL2(cl=
ock_gettime,64,_clkid,_ts);
7ac8707479886c Vincenzo Frascino  2019-06-21   61  }
7ac8707479886c Vincenzo Frascino  2019-06-21   62 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   63  static __always_inline
7ac8707479886c Vincenzo Frascino  2019-06-21   64  long gettimeofday_fallba=
ck(struct __kernel_old_timeval *_tv,
7ac8707479886c Vincenzo Frascino  2019-06-21   65  			   struct timezone *_=
tz)
7ac8707479886c Vincenzo Frascino  2019-06-21   66  {
a0636d4c3ad0da H. Peter Anvin     2025-12-16   67  	return VDSO_SYSCALL2(ge=
ttimeofday,,_tv,_tz);
7ac8707479886c Vincenzo Frascino  2019-06-21   68  }
7ac8707479886c Vincenzo Frascino  2019-06-21   69 =20
f66501dc53e720 Vincenzo Frascino  2019-06-21   70  static __always_inline
f66501dc53e720 Vincenzo Frascino  2019-06-21   71  long clock_getres_fallba=
ck(clockid_t _clkid, struct __kernel_timespec *_ts)
f66501dc53e720 Vincenzo Frascino  2019-06-21   72  {
a0636d4c3ad0da H. Peter Anvin     2025-12-16   73  	return VDSO_SYSCALL2(cl=
ock_getres,_time64,_clkid,_ts);
f66501dc53e720 Vincenzo Frascino  2019-06-21   74  }
f66501dc53e720 Vincenzo Frascino  2019-06-21   75 =20
a0636d4c3ad0da H. Peter Anvin     2025-12-16   76  #ifndef CONFIG_X86_64
7ac8707479886c Vincenzo Frascino  2019-06-21   77 =20
d2f5d3fa261961 Thomas Gleixner    2019-07-28   78  static __always_inline
d2f5d3fa261961 Thomas Gleixner    2019-07-28   79  long clock_gettime32_fal=
lback(clockid_t _clkid, struct old_timespec32 *_ts)
d2f5d3fa261961 Thomas Gleixner    2019-07-28   80  {
a0636d4c3ad0da H. Peter Anvin     2025-12-16   81  	return VDSO_SYSCALL2(cl=
ock_gettime,,_clkid,_ts);
7ac8707479886c Vincenzo Frascino  2019-06-21   82  }
7ac8707479886c Vincenzo Frascino  2019-06-21   83 =20
f66501dc53e720 Vincenzo Frascino  2019-06-21   84  static __always_inline l=
ong
a0636d4c3ad0da H. Peter Anvin     2025-12-16   85  clock_getres32_fallback(=
clockid_t _clkid, struct old_timespec32 *_ts)
d2f5d3fa261961 Thomas Gleixner    2019-07-28   86  {
a0636d4c3ad0da H. Peter Anvin     2025-12-16   87  	return VDSO_SYSCALL2(cl=
ock_getres,,_clkid,_ts);
d2f5d3fa261961 Thomas Gleixner    2019-07-28   88  }
d2f5d3fa261961 Thomas Gleixner    2019-07-28   89 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   90  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21   91 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   92  #ifdef CONFIG_PARAVIRT_C=
LOCK
7ac8707479886c Vincenzo Frascino  2019-06-21   93  static u64 vread_pvclock=
(void)
7ac8707479886c Vincenzo Frascino  2019-06-21   94  {
ecf9db3d1f1a8f Andy Lutomirski    2019-06-22   95  	const struct pvclock_vc=
pu_time_info *pvti =3D &pvclock_page.pvti;
7ac8707479886c Vincenzo Frascino  2019-06-21   96  	u32 version;
7ac8707479886c Vincenzo Frascino  2019-06-21   97  	u64 ret;
7ac8707479886c Vincenzo Frascino  2019-06-21   98 =20
7ac8707479886c Vincenzo Frascino  2019-06-21   99  	/*
7ac8707479886c Vincenzo Frascino  2019-06-21  100  	 * Note: The kernel and=
 hypervisor must guarantee that cpu ID
7ac8707479886c Vincenzo Frascino  2019-06-21  101  	 * number maps 1:1 to p=
er-CPU pvclock time info.
7ac8707479886c Vincenzo Frascino  2019-06-21  102  	 *
7ac8707479886c Vincenzo Frascino  2019-06-21  103  	 * Because the hypervis=
or is entirely unaware of guest userspace
7ac8707479886c Vincenzo Frascino  2019-06-21  104  	 * preemption, it canno=
t guarantee that per-CPU pvclock time
7ac8707479886c Vincenzo Frascino  2019-06-21  105  	 * info is updated if t=
he underlying CPU changes or that that
7ac8707479886c Vincenzo Frascino  2019-06-21  106  	 * version is increased=
 whenever underlying CPU changes.
7ac8707479886c Vincenzo Frascino  2019-06-21  107  	 *
7ac8707479886c Vincenzo Frascino  2019-06-21  108  	 * On KVM, we are guara=
nteed that pvti updates for any vCPU are
7ac8707479886c Vincenzo Frascino  2019-06-21  109  	 * atomic as seen by *a=
ll* vCPUs.  This is an even stronger
7ac8707479886c Vincenzo Frascino  2019-06-21  110  	 * guarantee than we ge=
t with a normal seqlock.
7ac8707479886c Vincenzo Frascino  2019-06-21  111  	 *
7ac8707479886c Vincenzo Frascino  2019-06-21  112  	 * On Xen, we don't app=
ear to have that guarantee, but Xen still
7ac8707479886c Vincenzo Frascino  2019-06-21  113  	 * supplies a valid seq=
lock using the version field.
7ac8707479886c Vincenzo Frascino  2019-06-21  114  	 *
7ac8707479886c Vincenzo Frascino  2019-06-21  115  	 * We only do pvclock v=
dso timing at all if
7ac8707479886c Vincenzo Frascino  2019-06-21  116  	 * PVCLOCK_TSC_STABLE_B=
IT is set, and we interpret that bit to
7ac8707479886c Vincenzo Frascino  2019-06-21  117  	 * mean that all vCPUs =
have matching pvti and that the TSC is
7ac8707479886c Vincenzo Frascino  2019-06-21  118  	 * synced, so we can ju=
st look at vCPU 0's pvti.
7ac8707479886c Vincenzo Frascino  2019-06-21  119  	 */
7ac8707479886c Vincenzo Frascino  2019-06-21  120 =20
7ac8707479886c Vincenzo Frascino  2019-06-21  121  	do {
7ac8707479886c Vincenzo Frascino  2019-06-21  122  		version =3D pvclock_re=
ad_begin(pvti);
7ac8707479886c Vincenzo Frascino  2019-06-21  123 =20
7ac8707479886c Vincenzo Frascino  2019-06-21  124  		if (unlikely(!(pvti->f=
lags & PVCLOCK_TSC_STABLE_BIT)))
7ac8707479886c Vincenzo Frascino  2019-06-21  125  			return U64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  126 =20
7ac8707479886c Vincenzo Frascino  2019-06-21  127  		ret =3D __pvclock_read=
_cycles(pvti, rdtsc_ordered());
7ac8707479886c Vincenzo Frascino  2019-06-21  128  	} while (pvclock_read_r=
etry(pvti, version));
7ac8707479886c Vincenzo Frascino  2019-06-21  129 =20
77750f78b0b324 Peter Zijlstra     2023-05-19  130  	return ret & S64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  131  }
7ac8707479886c Vincenzo Frascino  2019-06-21  132  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21  133 =20
3e2d94535adb2d Vitaly Kuznetsov   2019-08-22  134  #ifdef CONFIG_HYPERV_TIM=
ER
7ac8707479886c Vincenzo Frascino  2019-06-21  135  static u64 vread_hvclock=
(void)
7ac8707479886c Vincenzo Frascino  2019-06-21  136  {
9397fa2ea3e763 Peter Zijlstra     2023-05-19  137  	u64 tsc, time;
9397fa2ea3e763 Peter Zijlstra     2023-05-19  138 =20
9397fa2ea3e763 Peter Zijlstra     2023-05-19  139  	if (hv_read_tsc_page_ts=
c(&hvclock_page, &tsc, &time))
9397fa2ea3e763 Peter Zijlstra     2023-05-19  140  		return time & S64_MAX;
9397fa2ea3e763 Peter Zijlstra     2023-05-19  141 =20
9397fa2ea3e763 Peter Zijlstra     2023-05-19  142  	return U64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  143  }
7ac8707479886c Vincenzo Frascino  2019-06-21  144  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21  145 =20
4c5a116ada953b Thomas Gleixner    2020-08-04  146  static inline u64 __arch=
_get_hw_counter(s32 clock_mode,
dafde29605ebf2 Thomas Wei=C3=9Fschuh   2025-02-04 @147  					const struct v=
dso_time_data *vd)
7ac8707479886c Vincenzo Frascino  2019-06-21  148  {
b95a8a27c300d1 Thomas Gleixner    2020-02-07 @149  	if (likely(clock_mode =
=3D=3D VDSO_CLOCKMODE_TSC))
77750f78b0b324 Peter Zijlstra     2023-05-19 @150  		return (u64)rdtsc_orde=
red() & S64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  151  	/*
7ac8707479886c Vincenzo Frascino  2019-06-21  152  	 * For any memory-mappe=
d vclock type, we need to make sure that gcc
7ac8707479886c Vincenzo Frascino  2019-06-21  153  	 * doesn't cleverly hoi=
st a load before the mode check.  Otherwise we
7ac8707479886c Vincenzo Frascino  2019-06-21  154  	 * might end up touchin=
g the memory-mapped page even if the vclock in
7ac8707479886c Vincenzo Frascino  2019-06-21  155  	 * question isn't enabl=
ed, which will segfault.  Hence the barriers.
7ac8707479886c Vincenzo Frascino  2019-06-21  156  	 */
7ac8707479886c Vincenzo Frascino  2019-06-21  157  #ifdef CONFIG_PARAVIRT_C=
LOCK
b95a8a27c300d1 Thomas Gleixner    2020-02-07  158  	if (clock_mode =3D=3D V=
DSO_CLOCKMODE_PVCLOCK) {
7ac8707479886c Vincenzo Frascino  2019-06-21  159  		barrier();
7ac8707479886c Vincenzo Frascino  2019-06-21  160  		return vread_pvclock();
7ac8707479886c Vincenzo Frascino  2019-06-21  161  	}
7ac8707479886c Vincenzo Frascino  2019-06-21  162  #endif
3e2d94535adb2d Vitaly Kuznetsov   2019-08-22  163  #ifdef CONFIG_HYPERV_TIM=
ER
b95a8a27c300d1 Thomas Gleixner    2020-02-07  164  	if (clock_mode =3D=3D V=
DSO_CLOCKMODE_HVCLOCK) {
7ac8707479886c Vincenzo Frascino  2019-06-21  165  		barrier();
7ac8707479886c Vincenzo Frascino  2019-06-21  166  		return vread_hvclock();
7ac8707479886c Vincenzo Frascino  2019-06-21  167  	}
7ac8707479886c Vincenzo Frascino  2019-06-21  168  #endif
7ac8707479886c Vincenzo Frascino  2019-06-21  169  	return U64_MAX;
7ac8707479886c Vincenzo Frascino  2019-06-21  170  }
7ac8707479886c Vincenzo Frascino  2019-06-21  171 =20
bf0eff816e467f Anna-Maria Behnsen 2025-03-03 @172  static inline bool arch_=
vdso_clocksource_ok(const struct vdso_clock *vc)
7778d8417b74ad Thomas Gleixner    2020-06-06  173  {
7778d8417b74ad Thomas Gleixner    2020-06-06  174  	return true;
7778d8417b74ad Thomas Gleixner    2020-06-06  175  }
7778d8417b74ad Thomas Gleixner    2020-06-06  176  #define vdso_clocksource=
_ok arch_vdso_clocksource_ok
7778d8417b74ad Thomas Gleixner    2020-06-06  177 =20
7778d8417b74ad Thomas Gleixner    2020-06-06  178  /*
7778d8417b74ad Thomas Gleixner    2020-06-06  179   * Clocksource read valu=
e validation to handle PV and HyperV clocksources
7778d8417b74ad Thomas Gleixner    2020-06-06  180   * which can be invalida=
ted asynchronously and indicate invalidation by
7778d8417b74ad Thomas Gleixner    2020-06-06  181   * returning U64_MAX, wh=
ich can be effectively tested by checking for a
7778d8417b74ad Thomas Gleixner    2020-06-06  182   * negative value after =
casting it to s64.
77750f78b0b324 Peter Zijlstra     2023-05-19  183   *
77750f78b0b324 Peter Zijlstra     2023-05-19  184   * This effectively forc=
es a S64_MAX mask on the calculations, unlike the
77750f78b0b324 Peter Zijlstra     2023-05-19  185   * U64_MAX mask normally=
 used by x86 clocksources.
7778d8417b74ad Thomas Gleixner    2020-06-06  186   */
7778d8417b74ad Thomas Gleixner    2020-06-06  187  static inline bool arch_=
vdso_cycles_ok(u64 cycles)
7778d8417b74ad Thomas Gleixner    2020-06-06  188  {
7778d8417b74ad Thomas Gleixner    2020-06-06  189  	return (s64)cycles >=3D =
0;
7778d8417b74ad Thomas Gleixner    2020-06-06  190  }
7778d8417b74ad Thomas Gleixner    2020-06-06  191  #define vdso_cycles_ok a=
rch_vdso_cycles_ok
7778d8417b74ad Thomas Gleixner    2020-06-06  192 =20
9d90b93bf325e0 Thomas Gleixner    2019-06-26  193  /*
5b26ef660a690e Adrian Hunter      2024-03-25  194   * x86 specific calculat=
ion of nanoseconds for the current cycle count
9d90b93bf325e0 Thomas Gleixner    2019-06-26  195   *
9d90b93bf325e0 Thomas Gleixner    2019-06-26  196   * The regular implement=
ation assumes that clocksource reads are globally
9d90b93bf325e0 Thomas Gleixner    2019-06-26  197   * monotonic. The TSC ca=
n be slightly off across sockets which can cause
9d90b93bf325e0 Thomas Gleixner    2019-06-26  198   * the regular delta cal=
culation (@cycles - @last) to return a huge time
9d90b93bf325e0 Thomas Gleixner    2019-06-26  199   * jump.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  200   *
9d90b93bf325e0 Thomas Gleixner    2019-06-26  201   * Therefore it needs to=
 be verified that @cycles are greater than
5b26ef660a690e Adrian Hunter      2024-03-25  202   * @vd->cycles_last. If =
not then use @vd->cycles_last, which is the base
5b26ef660a690e Adrian Hunter      2024-03-25  203   * time of the current c=
onversion period.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  204   *
77750f78b0b324 Peter Zijlstra     2023-05-19  205   * This variant also use=
s a custom mask because while the clocksource mask of
77750f78b0b324 Peter Zijlstra     2023-05-19  206   * all the VDSO capable =
clocksources on x86 is U64_MAX, the above code uses
77750f78b0b324 Peter Zijlstra     2023-05-19  207   * U64_MASK as an except=
ion value, additionally arch_vdso_cycles_ok() above
77750f78b0b324 Peter Zijlstra     2023-05-19  208   * declares everything w=
ith the MSB/Sign-bit set as invalid. Therefore the
77750f78b0b324 Peter Zijlstra     2023-05-19  209   * effective mask is S64=
_MAX.
9d90b93bf325e0 Thomas Gleixner    2019-06-26  210   */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  211  static __always_inline u=
64 vdso_calc_ns(const struct vdso_clock *vc, u64 cycles, u64 base)
9d90b93bf325e0 Thomas Gleixner    2019-06-26  212  {
bf0eff816e467f Anna-Maria Behnsen 2025-03-03 @213  	u64 delta =3D cycles - =
vc->cycle_last;
7e90ffb716d289 Adrian Hunter      2024-03-25  214 =20
77750f78b0b324 Peter Zijlstra     2023-05-19  215  	/*
7e90ffb716d289 Adrian Hunter      2024-03-25  216  	 * Negative motion and =
deltas which can cause multiplication
7e90ffb716d289 Adrian Hunter      2024-03-25  217  	 * overflow require spe=
cial treatment. This check covers both as
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  218  	 * negative motion is g=
uaranteed to be greater than @vc::max_cycles
7e90ffb716d289 Adrian Hunter      2024-03-25  219  	 * due to unsigned comp=
arison.
7e90ffb716d289 Adrian Hunter      2024-03-25  220  	 *
54aa699e8094ef Bjorn Helgaas      2024-01-02  221  	 * Due to the MSB/Sign-=
bit being used as invalid marker (see
7239ae7f8349fb Anna-Maria Behnsen 2024-07-01  222  	 * arch_vdso_cycles_ok(=
) above), the effective mask is S64_MAX, but that
7239ae7f8349fb Anna-Maria Behnsen 2024-07-01  223  	 * case is also unlikel=
y and will also take the unlikely path here.
77750f78b0b324 Peter Zijlstra     2023-05-19  224  	 */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  225  	if (unlikely(delta > vc=
->max_cycles)) {
77750f78b0b324 Peter Zijlstra     2023-05-19  226  		/*
7e90ffb716d289 Adrian Hunter      2024-03-25  227  		 * Due to the above me=
ntioned TSC wobbles, filter out
7e90ffb716d289 Adrian Hunter      2024-03-25  228  		 * negative motion.  P=
er the above masking, the effective
7e90ffb716d289 Adrian Hunter      2024-03-25  229  		 * sign bit is now bit=
 62.
77750f78b0b324 Peter Zijlstra     2023-05-19  230  		 */
7e90ffb716d289 Adrian Hunter      2024-03-25  231  		if (delta & (1ULL << 6=
2))
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  232  			return base >> vc->sh=
ift;
77750f78b0b324 Peter Zijlstra     2023-05-19  233 =20
7e90ffb716d289 Adrian Hunter      2024-03-25  234  		/* Handle multiplicati=
on overflow gracefully */
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  235  		return mul_u64_u32_add=
_u64_shr(delta & S64_MAX, vc->mult, base, vc->shift);
7e90ffb716d289 Adrian Hunter      2024-03-25  236  	}
7e90ffb716d289 Adrian Hunter      2024-03-25  237 =20
bf0eff816e467f Anna-Maria Behnsen 2025-03-03  238  	return ((delta * vc->mu=
lt) + base) >> vc->shift;
9d90b93bf325e0 Thomas Gleixner    2019-06-26  239  }
5b26ef660a690e Adrian Hunter      2024-03-25  240  #define vdso_calc_ns vds=
o_calc_ns
9d90b93bf325e0 Thomas Gleixner    2019-06-26  241 =20

:::::: The code at line 149 was first introduced by commit
:::::: b95a8a27c300d1a39a4e36f63a518ef36e4b966c x86/vdso: Use generic VDSO =
clock mode storage

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
