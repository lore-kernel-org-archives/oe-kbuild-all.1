Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0021B4F1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765676984; cv=none; b=ZvCBZXaQ9HATwq47yzAriyAkRBREp2SJEzCPy+hfnkVIZ35MILBQ/v0LfOIspoxQ26BgGBCD8SqLl3QqbxiKTQoudzfUiY9OuRlPwdTQJRAY4dTQ8Zc1y43SEOqxCa3DHOp629ADEtLia2jlDvzkDzBnTIQGn83e9zv3bFowCeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765676984; c=relaxed/simple;
	bh=4wsKSzZTOavYfswotUat6vRPWDWanr3PMIeFdqYMY9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5HKRy+pNyx6sWPdMmCVXtH4cMExAFeB1O+NSkPdlRTFC8C4Vhh48Byk7+TF7uhwlTPHOa2o/hb3cT1ttTTbPRwOXLT/VzhbTB4Q+3MZ5uRfnMut9xf72Qabx7aEgTU7VBWByt6jiTttik12Vmrp+usaaNSntC4leqqjuOODHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOElFETV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOElFETV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765676982; x=1797212982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wsKSzZTOavYfswotUat6vRPWDWanr3PMIeFdqYMY9U=;
  b=FOElFETV7eIzQtirj/+gLi6zR+MSbwM/jLyUw/awc7noTItXK5pU2N4L
   /a+YRUblHzkHcTMG7dbqle6yYntv99sUnygBpshTUBZQRtDyO2wRVvRRd
   gg/8Zmzkq7+ikNrCONkFFA4+/o5LddfX7SMNUmfRfZfT5DYwIkzn6AeVV
   Kd7nOve0Vw0tsTNZXZGwrPAN2/PaJblNRoDh2yXxLCe4aFnsL69ocOpfX
   o62y8AJ1j1OxpSNzMBF7Lqfb7pj4U9ZvLFBa1T0SD/p3pHKfwtQbl6HL7
   KtosufG+nBmPJDtAf2T9G6f5Pucw85b7EL7uHKHEArOVrwVru3G3Sx/0J
   A==;
X-CSE-ConnectionGUID: IFPFY+laRh6cGj4NCYu8dg==
X-CSE-MsgGUID: osnLwesoSOevHs23Q58xHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70209654"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70209654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 17:49:40 -0800
X-CSE-ConnectionGUID: M3M8+0hIT5C65NXhV/6dpQ==
X-CSE-MsgGUID: FRcs0HTXSjOZoddsQQknOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197180545"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 17:49:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbEt-000000008RP-3m0x;
	Sun, 14 Dec 2025 01:49:35 +0000
Date: Sun, 14 Dec 2025 09:49:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype
 for '__kernel_clock_gettime'
Message-ID: <202512140916.VwvjFYEj-lkp@intel.com>
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
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: f43f336031282e8ea7e5f7f887c5a6ff7b9c99b0 [1942/1942] arm64:vdso: Rewrite gettimeofday into C.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512140916.VwvjFYEj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140916.VwvjFYEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140916.VwvjFYEj-lkp@intel.com/

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
