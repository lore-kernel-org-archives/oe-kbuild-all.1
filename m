Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF627816C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898655; cv=none; b=oN1reZbBntNzVpWCnNfq7kJQgn9Tf5DwAuq55ZjxJ4y4Y0OvuKb0eytAo8Kj9kaGN94zhFoZh50q2mi0pJkh2LU69AQLJyFv7beB7TtYDTRpBYBbagFZKfPGRZyuwMlm/QfqZ34rfU5Nxw6SnVeTqbFTU+3djus950np+XIGc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898655; c=relaxed/simple;
	bh=cCfU+9iviEIDmQ73+CVN673eWvvmowvaOpt6XGC7d+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nTYQvrba7k0i8Og5dVwLmmjR31oBlCiTr+4HRSLo6AqWN/5XCcwyPWSOJqLkP8bQITzZoA0/ouOOfbhF0QGx1Cn4Nl+gXMV2sSwkC8iXaVtarqOkOvfo4KtR4etU1ASYbMEd0eAlM4dWY1OTenNRhTMMntA/v1hEGe9e0jKqFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4OFQsqu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4OFQsqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782898654; x=1814434654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cCfU+9iviEIDmQ73+CVN673eWvvmowvaOpt6XGC7d+0=;
  b=E4OFQsqud5451S9gwiJxSYBrpZoEpCf4zgyyAt3vREKf3v4UsUpc8yZz
   juMi1BiW4Q/6YM15jXWAgEJqIzfjd92zPWuo1j9XtU81w/vbclUhJPg/P
   tyWAAGeFzctf2ojFJs5HbFNt3//JopfI+e2HyjYDVp3fHcSwOL3PdtCd3
   S06/PwmC/meLHOvnN2hlwntrJLdLdUZJHOzZ9Yd4zXIB4S9ai4F6uJ5OU
   38gvs3Z/pG8b80/V/iTK5Ee6EhHW8FPzkT8nGegW/sIuNG7igtjmw5Z2y
   +mLD/hbSk0fwaKuns8MeWVuPpyDQC/f2Ue3WSc81eAnZAO04jeaJJxKkD
   Q==;
X-CSE-ConnectionGUID: QAzfSYiORQKe0CPHb/RtBg==
X-CSE-MsgGUID: 4HkRube1QdOKM9Zw+6JxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="71151220"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="71151220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:37:34 -0700
X-CSE-ConnectionGUID: er+fntgXR8Se4IGI6/Yasg==
X-CSE-MsgGUID: /JnnlzgfRZiyWDSoQCv6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="251475226"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 02:37:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1werNW-0000000099n-35eb;
	Wed, 01 Jul 2026 09:37:15 +0000
Date: Wed, 01 Jul 2026 17:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/hrtimer-header-dependencies 6/6]
 kernel/time/tick-internal.h:180:14: error: 'HRTIMER_BASE_REALTIME' undeclared
Message-ID: <202607011700.zFoqyGs3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/hrtimer-header-dependencies
head:   0e0dec10cf362a392e4fe54d84f43509556d903e
commit: 0e0dec10cf362a392e4fe54d84f43509556d903e [6/6] hrtimer: Remove inclusion of hrtimer_bases.h remove from hrtimer.h
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260701/202607011700.zFoqyGs3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011700.zFoqyGs3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011700.zFoqyGs3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from arch/x86/include/asm/percpu.h:26,
                    from arch/x86/include/asm/current.h:11,
                    from include/linux/sched.h:12,
                    from include/linux/audit.h:12,
                    from kernel/time/timekeeping.c:6:
   kernel/time/timekeeping.c: In function 'do_settimeofday64':
>> kernel/time/tick-internal.h:180:14: error: 'HRTIMER_BASE_REALTIME' undeclared (first use in this function)
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1684:23: note: in expansion of macro 'CLOCK_SET_WALL'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/tick-internal.h:180:14: note: each undeclared identifier is reported only once for each function it appears in
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1684:23: note: in expansion of macro 'CLOCK_SET_WALL'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:180:43: error: 'HRTIMER_BASE_REALTIME_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1684:23: note: in expansion of macro 'CLOCK_SET_WALL'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:14: error: 'HRTIMER_BASE_TAI' undeclared (first use in this function)
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1684:23: note: in expansion of macro 'CLOCK_SET_WALL'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:38: error: 'HRTIMER_BASE_TAI_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1684:23: note: in expansion of macro 'CLOCK_SET_WALL'
    1684 |         clock_was_set(CLOCK_SET_WALL);
         |                       ^~~~~~~~~~~~~~
   kernel/time/timekeeping.c: In function 'timekeeping_inject_offset':
>> kernel/time/tick-internal.h:180:14: error: 'HRTIMER_BASE_REALTIME' undeclared (first use in this function)
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1755:31: note: in expansion of macro 'CLOCK_SET_WALL'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:180:43: error: 'HRTIMER_BASE_REALTIME_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1755:31: note: in expansion of macro 'CLOCK_SET_WALL'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:14: error: 'HRTIMER_BASE_TAI' undeclared (first use in this function)
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1755:31: note: in expansion of macro 'CLOCK_SET_WALL'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:38: error: 'HRTIMER_BASE_TAI_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:1755:31: note: in expansion of macro 'CLOCK_SET_WALL'
    1755 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
   kernel/time/timekeeping.c: In function 'do_adjtimex':
>> kernel/time/tick-internal.h:180:14: error: 'HRTIMER_BASE_REALTIME' undeclared (first use in this function)
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:3006:31: note: in expansion of macro 'CLOCK_SET_WALL'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:180:43: error: 'HRTIMER_BASE_REALTIME_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     180 |         (BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) | \
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:3006:31: note: in expansion of macro 'CLOCK_SET_WALL'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:14: error: 'HRTIMER_BASE_TAI' undeclared (first use in this function)
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |              ^~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:3006:31: note: in expansion of macro 'CLOCK_SET_WALL'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~
>> kernel/time/tick-internal.h:181:38: error: 'HRTIMER_BASE_TAI_SOFT' undeclared (first use in this function); did you mean 'HRTIMER_MODE_REL_SOFT'?
     181 |          BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
         |                                      ^~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   kernel/time/timekeeping.c:3006:31: note: in expansion of macro 'CLOCK_SET_WALL'
    3006 |                 clock_was_set(CLOCK_SET_WALL);
         |                               ^~~~~~~~~~~~~~


vim +/HRTIMER_BASE_REALTIME +180 kernel/time/tick-internal.h

8c3b5e6ec0fee1 Thomas Gleixner 2021-07-13  178  
17a1b8826b451c Thomas Gleixner 2021-07-13  179  #define CLOCK_SET_WALL							\
17a1b8826b451c Thomas Gleixner 2021-07-13 @180  	(BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) |	\
17a1b8826b451c Thomas Gleixner 2021-07-13 @181  	 BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
17a1b8826b451c Thomas Gleixner 2021-07-13  182  

:::::: The code at line 180 was first introduced by commit
:::::: 17a1b8826b451c80e7999a7c68e06b70579b2b8f hrtimer: Add bases argument to clock_was_set()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
