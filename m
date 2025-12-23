Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4724A04A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470781; cv=none; b=P5Jm1gzAf7a4svyrpK3EMVabS+kP1uJykr+1RLgCAFB+SMXy4F2zTm2zPvLqQ5OClnP9m/3T0/U409lF2E2DW0ojq3XuGovnxfDZ2P6nNUXcc+GWMRRrUYUn8+oBpiiv5kPRbiEKLYH/ChvnfuVzpBj6SjB9ytctVgqFbDnIh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470781; c=relaxed/simple;
	bh=BaMV7bdPPthpi+1OUNMkbjHpwGJEs2UBQWlHtChAdps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPiU7SBRcnygRqLGKze9CyRfOGfJ1oRPDad/RK6GfpCLnNj7qV2uVJ5uT4gd4uQYfvBZaV3uxDyaPIynsM5lpubrlxL5jb8l1klXzSf85xklXqJzrvWNjhU6fcBNRBnlVXCtG9+e06+KRsqlS9G+nnGqjuJ+v9i7OSD1gaSFJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi2+7r5v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi2+7r5v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766470779; x=1798006779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaMV7bdPPthpi+1OUNMkbjHpwGJEs2UBQWlHtChAdps=;
  b=Gi2+7r5vyqearz6u5K/1ExPGdBccm2hkvLj3R5RXolM+hqd3bk6YCWeE
   a4cWHMo0RmphHKoGEqVhsEyRKCo3ES4rW5DpLS/8wv2ct8YWC0vCKYkeI
   rYeaMakm9IVH17q3kLPWCktFXE7yYi24F/jRVgnX6Qojo6ut7aq1nmZNn
   G2WMDFr6m9coV389IO5oq9KBZL9HaeLndihlRcC6K5iihnJnNRAxGZrQI
   P4xfOlzxJocMrwxOzx8HVz+IsTLET69Tl1AeQTzbv6LN8AFZDujjCbIg2
   +sk1a6OjY+1MZH1nBIiUYCyISASUsynSJemc9fkQ6PV124TO+RqwKxY9d
   A==;
X-CSE-ConnectionGUID: ErAhTuJkQv+eU4O7ulX/3A==
X-CSE-MsgGUID: aqxNHUmeTjy5lULbUXCDBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79040036"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79040036"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 22:19:38 -0800
X-CSE-ConnectionGUID: kgkdRrM7Q2yz1Zki6NPd8w==
X-CSE-MsgGUID: Fu3XNmlSRlG7flx+OPvX4A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 22:19:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXvk6-000000005rU-39SM;
	Tue, 23 Dec 2025 06:19:34 +0000
Date: Tue, 23 Dec 2025 07:19:13 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [nolibc:nolibc-next 16/16] tools/include/nolibc/time.h:42:9: error:
 static assertion failed: ""
Message-ID: <202512230745.3Pf5PjxX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git nolibc-next
head:   8ff88a71dbebaec137085fd3e45b7ba650a54820
commit: 8ff88a71dbebaec137085fd3e45b7ba650a54820 [16/16] selftests/nolibc: add static assertions around time types handling
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251223/202512230745.3Pf5PjxX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230745.3Pf5PjxX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230745.3Pf5PjxX-lkp@intel.com/

Note: the nolibc/nolibc-next HEAD 8ff88a71dbebaec137085fd3e45b7ba650a54820 builds fine.
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
