Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52F2749FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541598; cv=none; b=WjgbzhKr8UdSMpjCLCxRnKgBvIFGxnYtki0VU6zsJnaDo6ko9ByUPUYPRRTX0lFpXayfeVKRjtwpJAuq72HZWpSSkPwowUI2CnM//2v51aDnZyP6n3v7hmWLcP97CKgndQF5gDjrzwe0C3TW6XNejTJsS1vQm33CU1VDhNx98E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541598; c=relaxed/simple;
	bh=B4Fe3DqUfiDpJ1WI/N/z6gTv7rDpRrfqL9D8ynaBxIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsxP3QZiIU+9ccCGdp/+qM5leBN84Pd0S98QUiuQGoLQci1UpwtOWU2rRG53UpYxh0oWkMKvAjx9IXPuLvfzMKDfGQA/ZQHNdNeD6vCBaJvMxf41sjvdoA0oIo3OeXLoYkBu0A8rNlmNuY54kkBOCMzKIIkeUo97YhMRcBU+Lio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxzVnFCQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxzVnFCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765541595; x=1797077595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4Fe3DqUfiDpJ1WI/N/z6gTv7rDpRrfqL9D8ynaBxIA=;
  b=QxzVnFCQPncfsmEQZlp93zOpTNWT8RTiMoihoex7PRWMoKFXwHboC2/6
   7Ivy7ORAd3n1HrdR9azR2Esb+o9MEqS5GOzMlKJYGkmgYxR+NbqK8oddm
   CxUCS4Co9BRJJJ4WbUnxdzyTo/hWYFYfzetGMuoacoZSD+zXswl31XCEk
   3vbui3ZLBD5axibbWOLFVaRAtmbmusC2n/t6rOCQC8vCjEQuHc2tGhPLw
   OkwvbEYlAZ1CY38U1XrZ8S9Z/SYvCYkk4YVBfyi81ksWKgafAvLlTbZmO
   QyrXiF9RQ19bGA9Pn1mIGkl2hjH6cVgCnDJSXy/AtcupFLHLiit3U518F
   Q==;
X-CSE-ConnectionGUID: o89X3ALARQmS/uoYIoGY0w==
X-CSE-MsgGUID: yg58tHniTZ+8zwpDSH3B9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67500666"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67500666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:13:15 -0800
X-CSE-ConnectionGUID: IVAQSS7aQjiLXQavRfAe3g==
X-CSE-MsgGUID: kZtGJKhuSIaYicGXCZ8yLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201560576"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 04:13:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU21G-000000001he-3aUF;
	Fri, 12 Dec 2025 12:13:10 +0000
Date: Fri, 12 Dec 2025 13:12:11 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype
 for '__kernel_clock_gettime'
Message-ID: <202512121347.W2YjDC5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: f43f336031282e8ea7e5f7f887c5a6ff7b9c99b0 [1941/1941] arm64:vdso: Rewrite gettimeofday into C.
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121347.W2YjDC5J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121347.W2YjDC5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121347.W2YjDC5J-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/vdso/gettimeofday.c:268:13: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
     268 | notrace int __kernel_clock_gettime(clockid_t clock, struct timespec *ts)
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/gettimeofday.c:302:13: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
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
 > 302	notrace int __kernel_gettimeofday(struct timeval *tv, struct timezone *tz)
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
