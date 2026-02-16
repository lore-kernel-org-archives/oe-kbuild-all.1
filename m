Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67776330B23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771259300; cv=none; b=YPDUH3uJG8rpZ0s4roK38KEhuy+PK2THcAfOIg0GClo6PV3CPUqQGPhGN2P4zrNkbf92wFSOa/9bVS/LZP3j265mCm3Q7LqlGKJm9q4/8eLaQxsUJ9bGAMODMD/J8krDQ2+orDoF/LU/i6tul+xd/q9DFiZtba3H2BrgSbNrV5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771259300; c=relaxed/simple;
	bh=ijguHSarj4jFBFQHmXE9JfkIX+JIyYbN3djK9/G5f+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BBmJhqInfdUViGDPfpXVmV+eVPDnTK07ItVeCOXFL1YOu1cqJc6iBxCeJNJtmfDBZNfh3+ahCT7QICq7uu4hG7LW6IvbHLfMvA9N+iVrevDm1vrNFdhUCcntRTq416L3M+3pgBXST9lvhaI0Wh5n3I1W2zoy5iKfjLO5p7x5i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVanopfu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVanopfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771259298; x=1802795298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ijguHSarj4jFBFQHmXE9JfkIX+JIyYbN3djK9/G5f+4=;
  b=BVanopfuQEK+S8J2rexWVKZXLYzbk3vTqKCTeF55o5ER7LY9gfKNCjDQ
   q0NWSeJ7RemporWwbikPae6oJcZnHFUxwESoWK+0TkQd5Z+aQknDo2g6G
   j880Xm6iZMg/VUgb8MGJ4r8hK8rITOKiOKPvjJQ4yZRFMiHFQ9CWzkOek
   gjZN/jytfoMxClFiGUy+iS4nV9b7IKHrn51ZuD9yazjzDmRAB+ctzBUT0
   u1TpK1aqdcCU1f67RtChQjUtuvx36Mqu6Q9ZZvo4z32OQV+8tEvJJLlQm
   tBqHpLwVYIqkXCQjG3YdJ5qXOc5TaDVFDriiwXZPdiB8ZnHANc3wx3hlo
   A==;
X-CSE-ConnectionGUID: 6X4YOk/5QiS6w+mRWzh7cg==
X-CSE-MsgGUID: SXwvwE1ySTGsl0BIrOoUQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83064126"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83064126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 08:28:17 -0800
X-CSE-ConnectionGUID: OEOEf4flTzGm6JdYOxsf7w==
X-CSE-MsgGUID: iWNnGDvgTMOHek/DpMniWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="251324824"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2026 08:28:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs1SI-0000000104e-0e2f;
	Mon, 16 Feb 2026 16:28:14 +0000
Date: Tue, 17 Feb 2026 00:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 7/9]
 arch/powerpc/include/asm/vdso/gettimeofday.h:134:5: warning:
 '__c_kernel_clock_gettime' declared 'static' but never defined
Message-ID: <202602170002.wZEjawIa-lkp@intel.com>
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
head:   b08c091b9f1d126d4ec8f7e985f468fed0359793
commit: cb6f40f194273a9f9ccc76e6a81edca2dd429ec2 [7/9] powerpc
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/202602=
17/202602170002.wZEjawIa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260217/202602170002.wZEjawIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170002.wZEjawIa-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/vdso/datapage.h:196,
                    from arch/powerpc/include/asm/vdso_datapage.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:134:5: warning: '__c_kernel=
_clock_gettime' declared 'static' but never defined [-Wunused-function]
     134 | int __c_kernel_clock_gettime(clockid_t clock, struct old_timespe=
c32 *ts,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:139:5: warning: '__c_kernel=
_clock_getres' declared 'static' but never defined [-Wunused-function]
     139 | int __c_kernel_clock_getres(clockid_t clock_id, struct old_times=
pec32 *res,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:145:5: warning: '__c_kernel=
_gettimeofday' declared 'static' but never defined [-Wunused-function]
     145 | int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, str=
uct timezone *tz,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:148:21: warning: '__c_kerne=
l_time' declared 'static' but never defined [-Wunused-function]
     148 | __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time,
         |                     ^~~~~~~~~~~~~~~
--
   In file included from include/vdso/datapage.h:196,
                    from arch/powerpc/include/asm/vdso_datapage.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:134:5: warning: '__c_kernel=
_clock_gettime' declared 'static' but never defined [-Wunused-function]
     134 | int __c_kernel_clock_gettime(clockid_t clock, struct old_timespe=
c32 *ts,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:139:5: warning: '__c_kernel=
_clock_getres' declared 'static' but never defined [-Wunused-function]
     139 | int __c_kernel_clock_getres(clockid_t clock_id, struct old_times=
pec32 *res,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:145:5: warning: '__c_kernel=
_gettimeofday' declared 'static' but never defined [-Wunused-function]
     145 | int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, str=
uct timezone *tz,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:148:21: warning: '__c_kerne=
l_time' declared 'static' but never defined [-Wunused-function]
     148 | __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time,
         |                     ^~~~~~~~~~~~~~~
   In file included from include/vdso/datapage.h:196,
                    from lib/vdso/getrandom.c:8,
                    from <command-line>:
>> arch/powerpc/include/asm/vdso/gettimeofday.h:134:5: warning: '__c_kernel=
_clock_gettime' declared 'static' but never defined [-Wunused-function]
     134 | int __c_kernel_clock_gettime(clockid_t clock, struct old_timespe=
c32 *ts,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:139:5: warning: '__c_kernel=
_clock_getres' declared 'static' but never defined [-Wunused-function]
     139 | int __c_kernel_clock_getres(clockid_t clock_id, struct old_times=
pec32 *res,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:145:5: warning: '__c_kernel=
_gettimeofday' declared 'static' but never defined [-Wunused-function]
     145 | int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, str=
uct timezone *tz,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/vdso/gettimeofday.h:148:21: warning: '__c_kerne=
l_time' declared 'static' but never defined [-Wunused-function]
     148 | __kernel_old_time_t __c_kernel_time(__kernel_old_time_t *time,
         |                     ^~~~~~~~~~~~~~~


vim +134 arch/powerpc/include/asm/vdso/gettimeofday.h

ce7d8056e38b77 Christophe Leroy 2020-11-27  126 =20
ce7d8056e38b77 Christophe Leroy 2020-11-27  127  #ifdef __powerpc64__
ce7d8056e38b77 Christophe Leroy 2020-11-27  128  int __c_kernel_clock_getti=
me(clockid_t clock, struct __kernel_timespec *ts,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  129  			     const struct =
vdso_time_data *vd);
ce7d8056e38b77 Christophe Leroy 2020-11-27  130  int __c_kernel_clock_getre=
s(clockid_t clock_id, struct __kernel_timespec *res,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  131  			    const struct v=
dso_time_data *vd);
ce7d8056e38b77 Christophe Leroy 2020-11-27  132  #else
cb6f40f194273a Thomas Wei=C3=9Fschuh 2026-02-16  133  __time32_symbol
ce7d8056e38b77 Christophe Leroy 2020-11-27 @134  int __c_kernel_clock_getti=
me(clockid_t clock, struct old_timespec32 *ts,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  135  			     const struct =
vdso_time_data *vd);
d0e3fc69d00d1f Christophe Leroy 2020-11-27  136  int __c_kernel_clock_getti=
me64(clockid_t clock, struct __kernel_timespec *ts,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  137  			       const struc=
t vdso_time_data *vd);
cb6f40f194273a Thomas Wei=C3=9Fschuh 2026-02-16  138  __time32_symbol
ce7d8056e38b77 Christophe Leroy 2020-11-27 @139  int __c_kernel_clock_getre=
s(clockid_t clock_id, struct old_timespec32 *res,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  140  			    const struct v=
dso_time_data *vd);
759a1f97373f25 Thomas Wei=C3=9Fschuh 2026-01-14  141  int __c_kernel_clock_=
getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
759a1f97373f25 Thomas Wei=C3=9Fschuh 2026-01-14  142  				   const struct v=
dso_time_data *vd);
ce7d8056e38b77 Christophe Leroy 2020-11-27  143  #endif
cb6f40f194273a Thomas Wei=C3=9Fschuh 2026-02-16  144  __time32_symbol
ce7d8056e38b77 Christophe Leroy 2020-11-27 @145  int __c_kernel_gettimeofda=
y(struct __kernel_old_timeval *tv, struct timezone *tz,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  146  			    const struct v=
dso_time_data *vd);
cb6f40f194273a Thomas Wei=C3=9Fschuh 2026-02-16  147  __time32_symbol
ce7d8056e38b77 Christophe Leroy 2020-11-27 @148  __kernel_old_time_t __c_ke=
rnel_time(__kernel_old_time_t *time,
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  149  				    const struct =
vdso_time_data *vd);
223970df2bff4c Thomas Wei=C3=9Fschuh 2025-02-04  150 =20

:::::: The code at line 134 was first introduced by commit
:::::: ce7d8056e38b770f070fc4499c577322b6ccb9c7 powerpc/vdso: Prepare for s=
witching VDSO to generic C implementation.

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
