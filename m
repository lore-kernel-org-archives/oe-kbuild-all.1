Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15320459A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766326945; cv=none; b=eytsCgZ9XRYZV3SHygeQJ38o8Kpp8Xxm8iNQom9cm1If2PaptbCkbfClWGz9e2u74tUVwrqUTVkbGLsQxQ56z1VFxhsYcLj+IzZL/KCqsrmw5APyhiDBJR755K8CyYsBQQ4sRCILxWuHgxRLXs2AQ+gh0l+gztIYgB/DqIXOUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766326945; c=relaxed/simple;
	bh=s8PNLfnTdNXIjeHaEWkOdnenR4Ibe/pwO1z3YMi9NUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvp6QPXD9kg786ijnPzK8rU39sYPPsTzI9FVvlQGl0hmWcA1LvNs7mei7D2o6rv5rF9lz5wi0J75b2ALBIY4RxD2D0c/tGOerSIL8fkTj/93imbcJNex/cRtsLyod3E83fGfTkOVP/xLZwL1JAb3IkAiW2l9/Fn/8bPtUOE9oz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAUGiu6e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAUGiu6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766326942; x=1797862942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8PNLfnTdNXIjeHaEWkOdnenR4Ibe/pwO1z3YMi9NUg=;
  b=SAUGiu6ecrvqmbZ/tavWQRAV6p0cfJa141ruShLje892GyJSXQd5qmKP
   NXgIB4ZHmmR/w7IWNTt5tmwin/gWD9jemzW4MVIXGlV9iyZRDmPGJYwnN
   i37yhd6cs2JRw2VRzvX+DnJd6ywhCHB+xBE6moXIvoN8UEIaD8QlNj3j8
   SrqaEkSjwekmkPG39jtmOMWHTGnUazZByXxRa2PsoPLw0F54uXtKjeHm8
   X7sj9wtgqBetOvaP9cZa3t2ObHh+YKxpekAXhr1LJ++LcgPJeDoMXUsDJ
   fI88xZLXI8lisYxCe7o1V8hGANAfYAllYJmL0LNfW4a4lxH/or3sY6p78
   A==;
X-CSE-ConnectionGUID: PjK10L7cT8mW5Ip20ZDGmQ==
X-CSE-MsgGUID: XPpI9ynQRJ6DWAkvHxiCgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78845602"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78845602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 06:22:22 -0800
X-CSE-ConnectionGUID: sGzIxBZNSa2UKNvPttIhoA==
X-CSE-MsgGUID: kqnKtY9bRw6+b8rB4Pu5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204379679"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 06:22:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXKK9-000000005jh-2ZYK;
	Sun, 21 Dec 2025 14:22:17 +0000
Date: Sun, 21 Dec 2025 22:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype
 for '__kernel_clock_gettime'
Message-ID: <202512212208.f4EG9uym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: f43f336031282e8ea7e5f7f887c5a6ff7b9c99b0 [1942/1942] arm64:vdso: Rewrite gettimeofday into C.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251221/202512212208.f4EG9uym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212208.f4EG9uym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212208.f4EG9uym-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
     268 | notrace int __kernel_clock_gettime(clockid_t clock, struct timespec *ts)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/gettimeofday.c:302:13: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
     302 | notrace int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/gettimeofday.c:325:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
     325 | int __kernel_clock_getres(clockid_t clock_id, struct timespec *res)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
     268 | notrace int __kernel_clock_gettime(clockid_t clock, struct timespec *ts)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/gettimeofday.c:302:13: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
     302 | notrace int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/gettimeofday.c:325:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
     325 | int __kernel_clock_getres(clockid_t clock_id, struct timespec *res)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/__kernel_clock_gettime +268 arch/arm64/kernel/vdso/gettimeofday.c

   267	
 > 268	notrace int __kernel_clock_gettime(clockid_t clock, struct timespec *ts)
   269	{
   270		const struct vdso_data *vd = &_vdso_data;
   271	
   272		switch (clock) {
   273		case CLOCK_REALTIME:
   274			if (do_realtime(vd, ts))
   275				goto fallback;
   276			break;
   277		case CLOCK_MONOTONIC:
   278			if (do_monotonic(vd, ts))
   279				goto fallback;
   280			break;
   281		case CLOCK_MONOTONIC_RAW:
   282			if (do_monotonic_raw(vd, ts))
   283				goto fallback;
   284			break;
   285		case CLOCK_REALTIME_COARSE:
   286			do_realtime_coarse(vd, ts);
   287			break;
   288		case CLOCK_MONOTONIC_COARSE:
   289			do_monotonic_coarse(vd, ts);
   290			break;
   291		default:
   292			goto fallback;
   293		}
   294	
   295		return 0;
   296	fallback:
   297		return clock_gettime_fallback(clock, ts);
   298	}
   299	
   300	
   301	
   302	notrace int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz)
   303	{
   304		const struct vdso_data *vd = &_vdso_data;
   305	
   306		if (likely(tv != NULL)) {
   307			struct timespec ts;
   308	
   309			if (do_realtime(vd, &ts))
   310				return gettimeofday_fallback(tv, tz);
   311	
   312			tv->tv_sec = ts.tv_sec;
   313			tv->tv_usec = ts.tv_nsec / 1000;
   314		}
   315	
   316		if (unlikely(tz != NULL)) {
   317			tz->tz_minuteswest = vd->tz_minuteswest;
   318			tz->tz_dsttime = vd->tz_dsttime;
   319		}
   320	
   321		return 0;
   322	}
   323	
   324	
 > 325	int __kernel_clock_getres(clockid_t clock_id, struct timespec *res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
