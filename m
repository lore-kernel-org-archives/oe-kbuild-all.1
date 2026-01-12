Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A12346E5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209278; cv=none; b=agYM62mSG00DQOHxHgvbEPEpZzanNBeoo69hx0AW+KdGSMh2N+S14ylQxPIEA+5iOdOL+enNqwd28pGm2yHiiBlpUSQg5yYyR+VIKVOoEq0CCBwyZMZIF2MifQhn51xh8DGMpXx4Ib5Lbf4QWfYEfDyxHdeKNpfFfm+G3jWsjCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209278; c=relaxed/simple;
	bh=RxwLyIaMfAwoLPBEdFTew/XpXRZXf62EvZioemTpKWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NY24EwKeDWEpHJ+oOTQp4uhwh/x2mkFCI1ubsG5HeNUTMluIV+N3Zsh3oclsD2AqNct+oNLvXunW+IRY84A5wQY/dAOkXYpmQglN8MlUg/DGYhXRACsOq4c3Wc0WrDriRs+q06qYn0/ENvI1pI48CMdthxWbHxPsjTzW+r8Kseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NR8VJHMo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR8VJHMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768209277; x=1799745277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RxwLyIaMfAwoLPBEdFTew/XpXRZXf62EvZioemTpKWI=;
  b=NR8VJHMoxwDXqWsAfw/sfHZbusALQTjbjD4w1DyYaUrO+DSNjWJYJd+R
   rIvq06d2IRIaa7m51ZanwnozfF7vQABKbk7dfpXKq0bG9ciXKKb77auO3
   LiDkiAb9+azfOQwIAxhnlrpnRk+gvxNZkLFWa4U26Cb+SPqosHsfaLzgA
   tUG9kG5nyjQiKwf4btsbI2ahU7bIo7vHaAwla+K1pkmvGbCpggeQkP4dM
   FVAS+KUNMLLvzEZWeuT3HKI2pPfUOoDnZF17EVVAQ+tWs1EHzyhrkgFxa
   SeIDB4b2f+WtDMQEHtbI9KXZ9+ks5bbCsDrEHbfk4sTV3IztEZP0QYsWT
   Q==;
X-CSE-ConnectionGUID: 6qcEydAETKiqofI6XmAT2w==
X-CSE-MsgGUID: ftO6+ip2Qr+fvD8DQmi3WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="94957544"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="94957544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:14:36 -0800
X-CSE-ConnectionGUID: rdNZ37DFSoqCasu7KY4lCA==
X-CSE-MsgGUID: 5uk/HrYjT8GKdAev/IifqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208194009"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 01:14:35 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfE0O-000000000rV-01B4;
	Mon, 12 Jan 2026 09:14:32 +0000
Date: Mon, 12 Jan 2026 10:14:16 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [thomas-weissschuh:b4/nolibc-warnings 16/27]
 tools/include/nolibc/time.h:42:9: error: static assertion failed: ""
Message-ID: <202601121047.KK9S4DFQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/nolibc-warnings
head:   86fb92e6ec2c53a7e240650aa8a7043341b4ee5d
commit: f3ed932644a671038b31f7f536a066eeef6803b0 [16/27] selftests/nolibc: add static assertions around time types handling
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260112/202601121047.KK9S4DFQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121047.KK9S4DFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121047.KK9S4DFQ-lkp@intel.com/

Note: the thomas-weissschuh/b4/nolibc-warnings HEAD 86fb92e6ec2c53a7e240650aa8a7043341b4ee5d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/stdio.h:8,
                    from nolibc-test.c:12:
   tools/include/nolibc/arch.h:32:2: error: #error Unsupported Architecture
      32 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/crt.h:12,
                    from tools/include/nolibc/sys/auxv.h:15,
                    from tools/include/nolibc/nolibc.h:99:
   tools/include/nolibc/time.h: In function 'sys_clock_getres':
>> tools/include/nolibc/time.h:42:9: error: static assertion failed: ""
      42 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_gettime':
   tools/include/nolibc/time.h:60:9: error: static assertion failed: ""
      60 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_settime':
   tools/include/nolibc/time.h:78:9: error: static assertion failed: ""
      78 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_nanosleep':
   tools/include/nolibc/time.h:97:9: error: static assertion failed: ""
      97 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_timer_gettime':
   tools/include/nolibc/time.h:174:9: error: static assertion failed: ""
     174 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_timer_settime':
   tools/include/nolibc/time.h:193:9: error: static assertion failed: ""
     193 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/sys/timerfd.h: In function 'sys_timerfd_gettime':
>> tools/include/nolibc/sys/timerfd.h:39:9: error: static assertion failed: ""
      39 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/sys/timerfd.h: In function 'sys_timerfd_settime':
   tools/include/nolibc/sys/timerfd.h:59:9: error: static assertion failed: ""
      59 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/errno.h:8,
                    from nolibc-test-linkage.c:5:
   tools/include/nolibc/arch.h:32:2: error: #error Unsupported Architecture
      32 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/crt.h:12,
                    from tools/include/nolibc/sys/auxv.h:15,
                    from tools/include/nolibc/nolibc.h:99:
   tools/include/nolibc/time.h: In function 'sys_clock_getres':
>> tools/include/nolibc/time.h:42:9: error: static assertion failed: ""
      42 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_gettime':
   tools/include/nolibc/time.h:60:9: error: static assertion failed: ""
      60 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_settime':
   tools/include/nolibc/time.h:78:9: error: static assertion failed: ""
      78 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_clock_nanosleep':
   tools/include/nolibc/time.h:97:9: error: static assertion failed: ""
      97 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_timer_gettime':
   tools/include/nolibc/time.h:174:9: error: static assertion failed: ""
     174 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/time.h: In function 'sys_timer_settime':
   tools/include/nolibc/time.h:193:9: error: static assertion failed: ""
     193 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/sys/timerfd.h: In function 'sys_timerfd_gettime':
>> tools/include/nolibc/sys/timerfd.h:39:9: error: static assertion failed: ""
      39 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/include/nolibc/sys/timerfd.h: In function 'sys_timerfd_settime':
   tools/include/nolibc/sys/timerfd.h:59:9: error: static assertion failed: ""
      59 |         __nolibc_assert_native_time64();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +42 tools/include/nolibc/time.h

    20	
    21	#define __nolibc_assert_time64_type(t) \
    22		__nolibc_static_assert(sizeof(t) == 8)
    23	
    24	#define __nolibc_assert_native_time64() \
    25		__nolibc_assert_time64_type(__kernel_old_time_t)
    26	
    27	/*
    28	 * int clock_getres(clockid_t clockid, struct timespec *res);
    29	 * int clock_gettime(clockid_t clockid, struct timespec *tp);
    30	 * int clock_settime(clockid_t clockid, const struct timespec *tp);
    31	 * int clock_nanosleep(clockid_t clockid, int flags, const struct timespec *rqtp,
    32	 *                     struct timespec *rmtp)
    33	 */
    34	
    35	static __attribute__((unused))
    36	int sys_clock_getres(clockid_t clockid, struct timespec *res)
    37	{
    38	#if defined(__NR_clock_getres_time64)
    39		__nolibc_assert_time64_type(res->tv_sec);
    40		return my_syscall2(__NR_clock_getres_time64, clockid, res);
    41	#else
  > 42		__nolibc_assert_native_time64();
    43		return my_syscall2(__NR_clock_getres, clockid, res);
    44	#endif
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
