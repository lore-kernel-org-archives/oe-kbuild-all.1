Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9A1925B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814944; cv=none; b=kZGTEPjx/iKzpaPP1c5pzwHxOL5FB8hLClM9J8GwhU84fwTlJnt1/KFzrNHHw3alGQsnX8iNjZAW+yA4R5wN0dJKO6qnUsWdPRBAVHWR/DzTXL91gXr9REqdgMI0a3pJledUO+I476CaavPrfym2m0lBbXHy/M3pOiSritxMHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814944; c=relaxed/simple;
	bh=5H8N4bxzF7PcartaHTlSstPxZ9s/5hFO1krS2u6LWq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoxryoCpGFwnqUhYiMmwDeGCc25+ynYIwEoosyMc1dqU/8wqg9sUgPa/unpEEMk1nyJijeRR2zH/SwaE4hC6sB3ZVo+5pVFcUPciG5NDZ2E1GIY72sjVneeLTDyCmFR2qtKqf0nlwN2o/jULCa0cAj4SIb9JRb8v2QZRgqaeIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbpOYqT2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbpOYqT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727814943; x=1759350943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5H8N4bxzF7PcartaHTlSstPxZ9s/5hFO1krS2u6LWq0=;
  b=VbpOYqT2UKXBcgujh48b/Z70ubeH1G4m2LQVC0fLM1mkhLNsKDLxi2Hy
   Am3LdsLw3H0dDgohgpDVQHCJAF5ZqObvzJWhen4mVdO6LbD0POFxFyLMX
   h3SmwsTG3ncC1S7lY72Y1PFJiORncH5S4E82olYtCcrLPvGWQCLa7KnmL
   GJmyE6w3EV8mIgjKhieHAcGAfh4yWX+cSu8wVGxfMrB42f1M2HBlIw+X/
   DthjzLRX3I7XIeho1uKrP8tOhKlgoe4HJ22JmpLqQub6B7ihAB6FJwpMF
   VaFzCuWYau5E7tcC1/RnsaXxHRTqBoG8SU3FZb66jexcb0GiABOGfFUHI
   g==;
X-CSE-ConnectionGUID: caQtU9bnSQKYTIfR6a+6Pw==
X-CSE-MsgGUID: 7Ac3M1NiSsWLp2EzuqiDIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30677471"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30677471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:35:42 -0700
X-CSE-ConnectionGUID: k/cDUY0xSoK7DVUPSTA2dw==
X-CSE-MsgGUID: tKyUJQtNRGih2CsOpsmaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="111255043"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2024 13:35:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svjas-000R9X-1r;
	Tue, 01 Oct 2024 20:35:38 +0000
Date: Wed, 2 Oct 2024 04:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13063/20658]
 kernel/time/posix-timers.c:1254: warning: Function parameter or member 'utx'
 not described in 'sys_clock_adjtime'
Message-ID: <202410020450.lUCzqBEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   a81f127d7432274edb73f16568b5b097fca99d2a
commit: 1c1790da976fa1956d1923fe10bbe05d698d92c2 [13063/20658] CHROMIUM: create alt-syscall infrastructure
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241002/202410020450.lUCzqBEG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020450.lUCzqBEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020450.lUCzqBEG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/posix-timers.c:1254: warning: Function parameter or member 'utx' not described in 'sys_clock_adjtime'
>> kernel/time/posix-timers.c:1254: warning: expecting prototype for sys_clock_getres(). Prototype was for sys_clock_adjtime() instead


vim +1254 kernel/time/posix-timers.c

  1178	
  1179	/**
  1180	 * sys_clock_getres - Get the resolution of a clock
  1181	 * @which_clock:	The clock to get the resolution for
  1182	 * @tp:			Pointer to a a user space timespec64 for storage
  1183	 *
  1184	 * POSIX defines:
  1185	 *
  1186	 * "The clock_getres() function shall return the resolution of any
  1187	 * clock. Clock resolutions are implementation-defined and cannot be set by
  1188	 * a process. If the argument res is not NULL, the resolution of the
  1189	 * specified clock shall be stored in the location pointed to by res. If
  1190	 * res is NULL, the clock resolution is not returned. If the time argument
  1191	 * of clock_settime() is not a multiple of res, then the value is truncated
  1192	 * to a multiple of res."
  1193	 *
  1194	 * Due to the various hardware constraints the real resolution can vary
  1195	 * wildly and even change during runtime when the underlying devices are
  1196	 * replaced. The kernel also can use hardware devices with different
  1197	 * resolutions for reading the time and for arming timers.
  1198	 *
  1199	 * The kernel therefore deviates from the POSIX spec in various aspects:
  1200	 *
  1201	 * 1) The resolution returned to user space
  1202	 *
  1203	 *    For CLOCK_REALTIME, CLOCK_MONOTONIC, CLOCK_BOOTTIME, CLOCK_TAI,
  1204	 *    CLOCK_REALTIME_ALARM, CLOCK_BOOTTIME_ALAREM and CLOCK_MONOTONIC_RAW
  1205	 *    the kernel differentiates only two cases:
  1206	 *
  1207	 *    I)  Low resolution mode:
  1208	 *
  1209	 *	  When high resolution timers are disabled at compile or runtime
  1210	 *	  the resolution returned is nanoseconds per tick, which represents
  1211	 *	  the precision at which timers expire.
  1212	 *
  1213	 *    II) High resolution mode:
  1214	 *
  1215	 *	  When high resolution timers are enabled the resolution returned
  1216	 *	  is always one nanosecond independent of the actual resolution of
  1217	 *	  the underlying hardware devices.
  1218	 *
  1219	 *	  For CLOCK_*_ALARM the actual resolution depends on system
  1220	 *	  state. When system is running the resolution is the same as the
  1221	 *	  resolution of the other clocks. During suspend the actual
  1222	 *	  resolution is the resolution of the underlying RTC device which
  1223	 *	  might be way less precise than the clockevent device used during
  1224	 *	  running state.
  1225	 *
  1226	 *   For CLOCK_REALTIME_COARSE and CLOCK_MONOTONIC_COARSE the resolution
  1227	 *   returned is always nanoseconds per tick.
  1228	 *
  1229	 *   For CLOCK_PROCESS_CPUTIME and CLOCK_THREAD_CPUTIME the resolution
  1230	 *   returned is always one nanosecond under the assumption that the
  1231	 *   underlying scheduler clock has a better resolution than nanoseconds
  1232	 *   per tick.
  1233	 *
  1234	 *   For dynamic POSIX clocks (PTP devices) the resolution returned is
  1235	 *   always one nanosecond.
  1236	 *
  1237	 * 2) Affect on sys_clock_settime()
  1238	 *
  1239	 *    The kernel does not truncate the time which is handed in to
  1240	 *    sys_clock_settime(). The kernel internal timekeeping is always using
  1241	 *    nanoseconds precision independent of the clocksource device which is
  1242	 *    used to read the time from. The resolution of that device only
  1243	 *    affects the presicion of the time returned by sys_clock_gettime().
  1244	 *
  1245	 * Returns:
  1246	 *	0		Success. @tp contains the resolution
  1247	 *	-EINVAL		@which_clock is not a valid clock ID
  1248	 *	-EFAULT		Copying the resolution to @tp faulted
  1249	 *	-ENODEV		Dynamic POSIX clock is not backed by a device
  1250	 *	-EOPNOTSUPP	Dynamic POSIX clock does not support getres()
  1251	 */
  1252	SYSCALL_DEFINE2(clock_adjtime, const clockid_t, which_clock,
  1253			struct __kernel_timex __user *, utx)
> 1254	{
  1255		return ksys_clock_adjtime(which_clock, utx);
  1256	}
  1257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
