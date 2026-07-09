Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627343EB0FD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584777; cv=none; b=SsWz1KUxzxlxGME8zoG95iCu0Rp27snsqWODO1aBtGa2wI+1PJMvMSW9736MOHb810ddFBMIv0j2eJOl70NGqct9ASArxFjbUXVcPvvs4Y20FrLVDtlzM9Gdt83XAqxW1IPT/iwGI5dPXFff/WulOPm2kNmikVCn/yb7GcLGuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584777; c=relaxed/simple;
	bh=69H4ncHLoG81YQD+nE9H063G+FEla5ICwz9GrC70+uM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gPqhbrifqzhpdrJxEty71s6xWVEE1y7Mg1OcJWxLXjx5CM6OflSZuRVy8yhpw53FHYP1ZaBFCbhlhLmXYzECuEYVoXqq6g8/B440WGpm9wZvjTNzm+iXJ/AIUZUqoFHYamSc0jjCe+MJbj7A7kH+P+79/9/Ygy8KMgn+C5IyMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOoAp/Nj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOoAp/Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783584774; x=1815120774;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=69H4ncHLoG81YQD+nE9H063G+FEla5ICwz9GrC70+uM=;
  b=FOoAp/NjR9vOxCbj9icth7BFomvj1cf9moE6cvPLMw8ZMtHk61oFSpyu
   EatWUpe3lf8bxSWjs5K66R+CNVrO7YgDcmiqt6qkKFIN4J9rOoRLewgSF
   fkWlljqcqG8MY5405Cmj7U4iNVfxClrW1teIkOWA8YwBdnrm8sdKRjQk5
   Uib6z4zR2LfzL2DJGd8PyBEL0j6U0i10OAlJ4YmpJK3VTEnyebdv/WCWd
   tfauMLCZwtccn8mgD9b/gZfTDlzVSc0EOHYmfqqh7c1NorINdTNs4cqK3
   uPYWxY9geyPsnj4fPCC2QhgHh2+XSGuZMz069lTKgEjnJiA3RHiEnCg4H
   A==;
X-CSE-ConnectionGUID: FVZv8N/WS6uvSOq67lSo8A==
X-CSE-MsgGUID: HEyvr2+8S/OAxqFVrvVQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84276320"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84276320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:12:53 -0700
X-CSE-ConnectionGUID: TQj7E4OjTdO2x8FUVJxC3A==
X-CSE-MsgGUID: +dV/giPMRhmtKO+qMDcxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258385843"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2026 01:12:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whjsG-00000000HRD-3YQQ;
	Thu, 09 Jul 2026 08:12:48 +0000
Date: Thu, 09 Jul 2026 16:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sysfs 3/3]
 arch/riscv/kernel/vdso/hwprobe.c:22:36: error: invalid use of undefined type
 'struct riscv_hwprobe'
Message-ID: <202607091634.SilC93xo-lkp@intel.com>
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
inux.git b4/vdso-sysfs
head:   3edf399169771e6497c35d947ff5f786819d62fd
commit: 3edf399169771e6497c35d947ff5f786819d62fd [3/3] vDSO, kbuild: Provid=
e vDSO debug variants at runtime
config: riscv-randconfig-002-20260709 (https://download.01.org/0day-ci/arch=
ive/20260709/202607091634.SilC93xo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260709/202607091634.SilC93xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091634.SilC93xo-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: 'struct riscv_hwprobe' =
declared inside parameter list will not be visible outside of this definiti=
on or declaration
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: 'struct riscv_hwprobe' =
declared inside parameter list will not be visible outside of this definiti=
on or declaration
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, si=
ze_t pair_count,
         |                                         ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_values':
>> arch/riscv/kernel/vdso/hwprobe.c:22:36: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      22 |  struct riscv_hwprobe *end =3D pairs + pair_count;
         |                                    ^
>> arch/riscv/kernel/vdso/hwprobe.c:30:38: error: 'const struct vdso_arch_d=
ata' has no member named 'homogeneous_cpus'
      30 |  if (flags !=3D 0 || (!all_cpus && !avd->homogeneous_cpus) || un=
likely(!avd->ready))
         |                                      ^~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from arch/riscv/kernel/vdso/hwprobe.c:6:
>> arch/riscv/kernel/vdso/hwprobe.c:30:74: error: 'const struct vdso_arch_d=
ata' has no member named 'ready'
      30 |  if (flags !=3D 0 || (!all_cpus && !avd->homogeneous_cpus) || un=
likely(!avd->ready))
         |                                                                 =
         ^~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
>> arch/riscv/kernel/vdso/hwprobe.c:31:24: error: passing argument 1 of 'ri=
scv_hwprobe' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
      31 |   return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flag=
s);
         |                        ^~~~~
         |                        |
         |                        struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwp=
robe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:35:7: error: implicit declaration of fu=
nction 'riscv_hwprobe_key_is_valid' [-Werror=3Dimplicit-function-declaratio=
n]
      35 |   if (riscv_hwprobe_key_is_valid(p->key)) {
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:35:35: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      35 |   if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                   ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:5: error: invalid use of undefined t=
ype 'struct riscv_hwprobe'
      36 |    p->value =3D avd->all_cpu_hwprobe_values[p->key];
         |     ^~
>> arch/riscv/kernel/vdso/hwprobe.c:36:18: error: 'const struct vdso_arch_d=
ata' has no member named 'all_cpu_hwprobe_values'
      36 |    p->value =3D avd->all_cpu_hwprobe_values[p->key];
         |                  ^~
   arch/riscv/kernel/vdso/hwprobe.c:36:44: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      36 |    p->value =3D avd->all_cpu_hwprobe_values[p->key];
         |                                            ^~
   arch/riscv/kernel/vdso/hwprobe.c:39:5: error: invalid use of undefined t=
ype 'struct riscv_hwprobe'
      39 |    p->key =3D -1;
         |     ^~
   arch/riscv/kernel/vdso/hwprobe.c:40:5: error: invalid use of undefined t=
ype 'struct riscv_hwprobe'
      40 |    p->value =3D 0;
         |     ^~
>> arch/riscv/kernel/vdso/hwprobe.c:43:4: error: increment of pointer to an=
 incomplete type 'struct riscv_hwprobe'
      43 |   p++;
         |    ^~
   arch/riscv/kernel/vdso/hwprobe.c: At top level:
   arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: 'struct riscv_hwprobe' =
declared inside parameter list will not be visible outside of this definiti=
on or declaration
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size=
_t pair_count,
         |                                       ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function 'riscv_vdso_get_cpus':
   arch/riscv/kernel/vdso/hwprobe.c:55:36: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      55 |  struct riscv_hwprobe *end =3D pairs + pair_count;
         |                                    ^
>> arch/riscv/kernel/vdso/hwprobe.c:71:29: error: 'RISCV_HWPROBE_WHICH_CPUS=
' undeclared (first use in this function)
      71 |  if (empty_cpus || flags !=3D RISCV_HWPROBE_WHICH_CPUS || !avd->=
homogeneous_cpus)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:71:29: note: each undeclared identifier=
 is reported only once for each function it appears in
   arch/riscv/kernel/vdso/hwprobe.c:71:61: error: 'const struct vdso_arch_d=
ata' has no member named 'homogeneous_cpus'
      71 |  if (empty_cpus || flags !=3D RISCV_HWPROBE_WHICH_CPUS || !avd->=
homogeneous_cpus)
         |                                                             ^~
   arch/riscv/kernel/vdso/hwprobe.c:72:24: error: passing argument 1 of 'ri=
scv_hwprobe' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
      72 |   return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flag=
s);
         |                        ^~~~~
         |                        |
         |                        struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:11:48: note: expected 'struct riscv_hwp=
robe *' but argument is of type 'struct riscv_hwprobe *'
      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:75:35: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      75 |   if (riscv_hwprobe_key_is_valid(p->key)) {
         |                                   ^~
>> arch/riscv/kernel/vdso/hwprobe.c:76:11: error: variable 't' has initiali=
zer but incomplete type
      76 |    struct riscv_hwprobe t =3D {
         |           ^~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:77:6: error: 'struct riscv_hwprobe' has=
 no member named 'key'
      77 |     .key =3D p->key,
         |      ^~~
   arch/riscv/kernel/vdso/hwprobe.c:77:13: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      77 |     .key =3D p->key,
         |             ^~
>> arch/riscv/kernel/vdso/hwprobe.c:77:12: warning: excess elements in stru=
ct initializer
      77 |     .key =3D p->key,
         |            ^
   arch/riscv/kernel/vdso/hwprobe.c:77:12: note: (near initialization for '=
t')
>> arch/riscv/kernel/vdso/hwprobe.c:78:6: error: 'struct riscv_hwprobe' has=
 no member named 'value'
      78 |     .value =3D avd->all_cpu_hwprobe_values[p->key],
         |      ^~~~~
   arch/riscv/kernel/vdso/hwprobe.c:78:17: error: 'const struct vdso_arch_d=
ata' has no member named 'all_cpu_hwprobe_values'
      78 |     .value =3D avd->all_cpu_hwprobe_values[p->key],
         |                 ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:43: error: invalid use of undefined =
type 'struct riscv_hwprobe'
      78 |     .value =3D avd->all_cpu_hwprobe_values[p->key],
         |                                           ^~
   arch/riscv/kernel/vdso/hwprobe.c:78:14: warning: excess elements in stru=
ct initializer
      78 |     .value =3D avd->all_cpu_hwprobe_values[p->key],
         |              ^~~
   arch/riscv/kernel/vdso/hwprobe.c:78:14: note: (near initialization for '=
t')
>> arch/riscv/kernel/vdso/hwprobe.c:76:25: error: storage size of 't' isn't=
 known
      76 |    struct riscv_hwprobe t =3D {
         |                         ^
>> arch/riscv/kernel/vdso/hwprobe.c:81:9: error: implicit declaration of fu=
nction 'riscv_hwprobe_pair_cmp' [-Werror=3Dimplicit-function-declaration]
      81 |    if (!riscv_hwprobe_pair_cmp(&t, p))
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:76:25: warning: unused variable 't' [-W=
unused-variable]
      76 |    struct riscv_hwprobe t =3D {
         |                         ^
   arch/riscv/kernel/vdso/hwprobe.c:85:5: error: invalid use of undefined t=
ype 'struct riscv_hwprobe'
      85 |    p->key =3D -1;
         |     ^~
   arch/riscv/kernel/vdso/hwprobe.c:86:5: error: invalid use of undefined t=
ype 'struct riscv_hwprobe'
      86 |    p->value =3D 0;
         |     ^~
   arch/riscv/kernel/vdso/hwprobe.c:88:4: error: increment of pointer to an=
 incomplete type 'struct riscv_hwprobe'
      88 |   p++;
         |    ^~
   arch/riscv/kernel/vdso/hwprobe.c: At top level:
   arch/riscv/kernel/vdso/hwprobe.c:100:33: warning: 'struct riscv_hwprobe'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |                                 ^~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:104:33: warning: 'struct riscv_hwprobe'=
 declared inside parameter list will not be visible outside of this definit=
ion or declaration
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |                                 ^~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:104:5: error: conflicting types for '__=
vdso_riscv_hwprobe'
     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c:100:5: note: previous declaration of '_=
_vdso_riscv_hwprobe' was here
     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pai=
r_count,
         |     ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/vdso/hwprobe.c: In function '__vdso_riscv_hwprobe':
   arch/riscv/kernel/vdso/hwprobe.c:108:14: error: 'RISCV_HWPROBE_WHICH_CPU=
S' undeclared (first use in this function)
     108 |  if (flags & RISCV_HWPROBE_WHICH_CPUS)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:109:30: error: passing argument 1 of 'r=
iscv_vdso_get_cpus' from incompatible pointer type [-Werror=3Dincompatible-=
pointer-types]
     109 |   return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
         |                              ^~~~~
         |                              |
         |                              struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:49:54: note: expected 'struct riscv_hwp=
robe *' but argument is of type 'struct riscv_hwprobe *'
      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size=
_t pair_count,
         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> arch/riscv/kernel/vdso/hwprobe.c:112:31: error: passing argument 1 of 'r=
iscv_vdso_get_values' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
     112 |  return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
         |                               ^~~~~
         |                               |
         |                               struct riscv_hwprobe *
   arch/riscv/kernel/vdso/hwprobe.c:15:56: note: expected 'struct riscv_hwp=
robe *' but argument is of type 'struct riscv_hwprobe *'
      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, si=
ze_t pair_count,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:289: arch/riscv/kernel/vdso/hwprobe=
.o] Error 1 shuffle=3D275821313
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_clock_gettim=
e':
   arch/riscv/kernel/vdso/vgettimeofday.c:15:9: error: implicit declaration=
 of function '__cvdso_clock_gettime'; did you mean '__vdso_clock_gettime'? =
[-Werror=3Dimplicit-function-declaration]
      15 |  return __cvdso_clock_gettime(clock, ts);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         __vdso_clock_gettime
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_gettimeofday=
':
   arch/riscv/kernel/vdso/vgettimeofday.c:20:9: error: implicit declaration=
 of function '__cvdso_gettimeofday'; did you mean '__vdso_gettimeofday'? [-=
Werror=3Dimplicit-function-declaration]
      20 |  return __cvdso_gettimeofday(tv, tz);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         __vdso_gettimeofday
   arch/riscv/kernel/vdso/vgettimeofday.c: In function '__vdso_clock_getres=
':
   arch/riscv/kernel/vdso/vgettimeofday.c:25:9: error: implicit declaration=
 of function '__cvdso_clock_getres'; did you mean '__vdso_clock_getres'? [-=
Werror=3Dimplicit-function-declaration]
      25 |  return __cvdso_clock_getres(clock_id, res);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         __vdso_clock_getres
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:289: arch/riscv/kernel/vdso/vgettim=
eofday.o] Error 1 shuffle=3D275821313
   make[3]: Target 'arch/riscv/kernel/vdso/vdso.so.dbg' not remade because =
of errors.
   make[2]: *** [Makefile:1551: arch/riscv/kernel/vdso/vdso.so.dbg] Error 2=
 shuffle=3D275821313
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D275821313
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D275821313
   make: Target 'prepare' not remade because of errors.


vim +22 arch/riscv/kernel/vdso/hwprobe.c

aa5af0aa90bad3 Evan Green       2023-04-07   10 =20
aa5af0aa90bad3 Evan Green       2023-04-07  @11  extern int riscv_hwprobe(s=
truct riscv_hwprobe *pairs, size_t pair_count,
36d842d654beba Andrew Jones     2023-11-22   12  			 size_t cpusetsize, uns=
igned long *cpus,
aa5af0aa90bad3 Evan Green       2023-04-07   13  			 unsigned int flags);
aa5af0aa90bad3 Evan Green       2023-04-07   14 =20
e178bf146e4b8c Andrew Jones     2023-11-22   15  static int riscv_vdso_get_=
values(struct riscv_hwprobe *pairs, size_t pair_count,
36d842d654beba Andrew Jones     2023-11-22   16  				 size_t cpusetsize, un=
signed long *cpus,
aa5af0aa90bad3 Evan Green       2023-04-07   17  				 unsigned int flags)
aa5af0aa90bad3 Evan Green       2023-04-07   18  {
46fe55b204bfb0 Thomas Wei=C3=9Fschuh 2025-02-04   19  	const struct vdso_ar=
ch_data *avd =3D &vdso_u_arch_data;
36d842d654beba Andrew Jones     2023-11-22   20  	bool all_cpus =3D !cpuset=
size && !cpus;
aa5af0aa90bad3 Evan Green       2023-04-07   21  	struct riscv_hwprobe *p =
=3D pairs;
aa5af0aa90bad3 Evan Green       2023-04-07  @22  	struct riscv_hwprobe *end=
 =3D pairs + pair_count;
aa5af0aa90bad3 Evan Green       2023-04-07   23 =20
aa5af0aa90bad3 Evan Green       2023-04-07   24  	/*
aa5af0aa90bad3 Evan Green       2023-04-07   25  	 * Defer to the syscall f=
or exotic requests. The vdso has answers
aa5af0aa90bad3 Evan Green       2023-04-07   26  	 * stashed away only for =
the "all cpus" case. If all CPUs are
aa5af0aa90bad3 Evan Green       2023-04-07   27  	 * homogeneous, then this=
 function can handle requests for arbitrary
aa5af0aa90bad3 Evan Green       2023-04-07   28  	 * masks.
aa5af0aa90bad3 Evan Green       2023-04-07   29  	 */
5d15d2ad36b0f7 Jingwei Wang     2025-08-11  @30  	if (flags !=3D 0 || (!all=
_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
36d842d654beba Andrew Jones     2023-11-22  @31  		return riscv_hwprobe(pai=
rs, pair_count, cpusetsize, cpus, flags);
aa5af0aa90bad3 Evan Green       2023-04-07   32 =20
aa5af0aa90bad3 Evan Green       2023-04-07   33  	/* This is something we c=
an handle, fill out the pairs. */
aa5af0aa90bad3 Evan Green       2023-04-07   34  	while (p < end) {
e1c05b3bf80f82 Andrew Jones     2023-10-10  @35  		if (riscv_hwprobe_key_is=
_valid(p->key)) {
aa5af0aa90bad3 Evan Green       2023-04-07  @36  			p->value =3D avd->all_c=
pu_hwprobe_values[p->key];
aa5af0aa90bad3 Evan Green       2023-04-07   37 =20
aa5af0aa90bad3 Evan Green       2023-04-07   38  		} else {
aa5af0aa90bad3 Evan Green       2023-04-07   39  			p->key =3D -1;
aa5af0aa90bad3 Evan Green       2023-04-07   40  			p->value =3D 0;
aa5af0aa90bad3 Evan Green       2023-04-07   41  		}
aa5af0aa90bad3 Evan Green       2023-04-07   42 =20
aa5af0aa90bad3 Evan Green       2023-04-07  @43  		p++;
aa5af0aa90bad3 Evan Green       2023-04-07   44  	}
aa5af0aa90bad3 Evan Green       2023-04-07   45 =20
aa5af0aa90bad3 Evan Green       2023-04-07   46  	return 0;
aa5af0aa90bad3 Evan Green       2023-04-07   47  }
e178bf146e4b8c Andrew Jones     2023-11-22   48 =20
e178bf146e4b8c Andrew Jones     2023-11-22   49  static int riscv_vdso_get_=
cpus(struct riscv_hwprobe *pairs, size_t pair_count,
e178bf146e4b8c Andrew Jones     2023-11-22   50  			       size_t cpusetsiz=
e, unsigned long *cpus,
e178bf146e4b8c Andrew Jones     2023-11-22   51  			       unsigned int fla=
gs)
e178bf146e4b8c Andrew Jones     2023-11-22   52  {
46fe55b204bfb0 Thomas Wei=C3=9Fschuh 2025-02-04   53  	const struct vdso_ar=
ch_data *avd =3D &vdso_u_arch_data;
e178bf146e4b8c Andrew Jones     2023-11-22   54  	struct riscv_hwprobe *p =
=3D pairs;
e178bf146e4b8c Andrew Jones     2023-11-22   55  	struct riscv_hwprobe *end=
 =3D pairs + pair_count;
e178bf146e4b8c Andrew Jones     2023-11-22   56  	unsigned char *c =3D (uns=
igned char *)cpus;
e178bf146e4b8c Andrew Jones     2023-11-22   57  	bool empty_cpus =3D true;
e178bf146e4b8c Andrew Jones     2023-11-22   58  	bool clear_all =3D false;
e178bf146e4b8c Andrew Jones     2023-11-22   59  	int i;
e178bf146e4b8c Andrew Jones     2023-11-22   60 =20
e178bf146e4b8c Andrew Jones     2023-11-22   61  	if (!cpusetsize || !cpus)
e178bf146e4b8c Andrew Jones     2023-11-22   62  		return -EINVAL;
e178bf146e4b8c Andrew Jones     2023-11-22   63 =20
e178bf146e4b8c Andrew Jones     2023-11-22   64  	for (i =3D 0; i < cpusets=
ize; i++) {
e178bf146e4b8c Andrew Jones     2023-11-22   65  		if (c[i]) {
e178bf146e4b8c Andrew Jones     2023-11-22   66  			empty_cpus =3D false;
e178bf146e4b8c Andrew Jones     2023-11-22   67  			break;
e178bf146e4b8c Andrew Jones     2023-11-22   68  		}
e178bf146e4b8c Andrew Jones     2023-11-22   69  	}
e178bf146e4b8c Andrew Jones     2023-11-22   70 =20
e178bf146e4b8c Andrew Jones     2023-11-22  @71  	if (empty_cpus || flags !=
=3D RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
e178bf146e4b8c Andrew Jones     2023-11-22   72  		return riscv_hwprobe(pai=
rs, pair_count, cpusetsize, cpus, flags);
e178bf146e4b8c Andrew Jones     2023-11-22   73 =20
e178bf146e4b8c Andrew Jones     2023-11-22   74  	while (p < end) {
e178bf146e4b8c Andrew Jones     2023-11-22   75  		if (riscv_hwprobe_key_is=
_valid(p->key)) {
e178bf146e4b8c Andrew Jones     2023-11-22  @76  			struct riscv_hwprobe t =
=3D {
e178bf146e4b8c Andrew Jones     2023-11-22  @77  				.key =3D p->key,
e178bf146e4b8c Andrew Jones     2023-11-22  @78  				.value =3D avd->all_cp=
u_hwprobe_values[p->key],
e178bf146e4b8c Andrew Jones     2023-11-22   79  			};
e178bf146e4b8c Andrew Jones     2023-11-22   80 =20
e178bf146e4b8c Andrew Jones     2023-11-22  @81  			if (!riscv_hwprobe_pair=
_cmp(&t, p))
e178bf146e4b8c Andrew Jones     2023-11-22   82  				clear_all =3D true;
e178bf146e4b8c Andrew Jones     2023-11-22   83  		} else {
e178bf146e4b8c Andrew Jones     2023-11-22   84  			clear_all =3D true;
e178bf146e4b8c Andrew Jones     2023-11-22   85  			p->key =3D -1;
e178bf146e4b8c Andrew Jones     2023-11-22   86  			p->value =3D 0;
e178bf146e4b8c Andrew Jones     2023-11-22   87  		}
e178bf146e4b8c Andrew Jones     2023-11-22   88  		p++;
e178bf146e4b8c Andrew Jones     2023-11-22   89  	}
e178bf146e4b8c Andrew Jones     2023-11-22   90 =20
e178bf146e4b8c Andrew Jones     2023-11-22   91  	if (clear_all) {
e178bf146e4b8c Andrew Jones     2023-11-22   92  		for (i =3D 0; i < cpuset=
size; i++)
e178bf146e4b8c Andrew Jones     2023-11-22   93  			c[i] =3D 0;
e178bf146e4b8c Andrew Jones     2023-11-22   94  	}
e178bf146e4b8c Andrew Jones     2023-11-22   95 =20
e178bf146e4b8c Andrew Jones     2023-11-22   96  	return 0;
e178bf146e4b8c Andrew Jones     2023-11-22   97  }
e178bf146e4b8c Andrew Jones     2023-11-22   98 =20
e178bf146e4b8c Andrew Jones     2023-11-22   99  /* Add a prototype to avoi=
d -Wmissing-prototypes warning. */
e178bf146e4b8c Andrew Jones     2023-11-22  100  int __vdso_riscv_hwprobe(s=
truct riscv_hwprobe *pairs, size_t pair_count,
e178bf146e4b8c Andrew Jones     2023-11-22  101  			 size_t cpusetsize, uns=
igned long *cpus,
e178bf146e4b8c Andrew Jones     2023-11-22  102  			 unsigned int flags);
e178bf146e4b8c Andrew Jones     2023-11-22  103 =20
e178bf146e4b8c Andrew Jones     2023-11-22 @104  int __vdso_riscv_hwprobe(s=
truct riscv_hwprobe *pairs, size_t pair_count,
e178bf146e4b8c Andrew Jones     2023-11-22  105  			 size_t cpusetsize, uns=
igned long *cpus,
e178bf146e4b8c Andrew Jones     2023-11-22  106  			 unsigned int flags)
e178bf146e4b8c Andrew Jones     2023-11-22  107  {
e178bf146e4b8c Andrew Jones     2023-11-22  108  	if (flags & RISCV_HWPROBE=
_WHICH_CPUS)
e178bf146e4b8c Andrew Jones     2023-11-22 @109  		return riscv_vdso_get_cp=
us(pairs, pair_count, cpusetsize,
e178bf146e4b8c Andrew Jones     2023-11-22  110  					   cpus, flags);
e178bf146e4b8c Andrew Jones     2023-11-22  111 =20
e178bf146e4b8c Andrew Jones     2023-11-22 @112  	return riscv_vdso_get_val=
ues(pairs, pair_count, cpusetsize,

:::::: The code at line 22 was first introduced by commit
:::::: aa5af0aa90bad3f1cad5a90ee5eecd92ac9f3096 RISC-V: Add hwprobe vDSO fu=
nction and data

:::::: TO: Evan Green <evan@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
