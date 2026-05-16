Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CABF405C4B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947010; cv=none; b=VQLU4w/J+w1V4hT6TH0PZBxBLRd2/8l/r+r6gP6JvAUV2dWXaERcjogbwbOQnp0C/UsyTXXq+Yy6ZKQOZFYrQ5oelu/dfwFRtf5/CxsPLv8E9d5mBqlq/ZQcXny5+VzkAEFXKn4aW/b2Bq4fVvk4uAXl5HM54mMu+TY+vwo3QXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947010; c=relaxed/simple;
	bh=ZBYoBLuox0k166MiEM+1Ty8iMzJ9ipZsgUhV5qRnnXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NV0PjAKfuqB8INcglSeSIASfWNLbx5SJHziBXbtOXtN20RXEVuM/SOnd2nX5wZ53sxIHySDvSsdIPLudvycKlsgt7a1g5wUylYV1yG+7TMJWgA6sv0XcPRgRyyM8nXlntXZddiXNd7mWX5S2zZEhYy0+QowAcfo82oayUCknuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bymp4vKH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bymp4vKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778947009; x=1810483009;
  h=date:from:to:cc:subject:message-id;
  bh=ZBYoBLuox0k166MiEM+1Ty8iMzJ9ipZsgUhV5qRnnXI=;
  b=Bymp4vKH4iQ16O8VyS5pIVw56x5J1zBOaWI/TpX3j6bin4VJ1l4Kp0C5
   If0hK6Jc3E52cGDLyZKSBvKiL75ed3cevGkI77/TAtu5zqSqS3vFo8MHf
   PdCxegBtNXSjRa4ehnGTmzuAdgEsVzsYNO8TkIyxBWHj25GytAL4OT5sZ
   FXruKUVlf4tgUdJIrtaZn5tspPhWLIKXBd/lds5lewQSJu1RJo7WugebX
   GBNWXt8XoaLTnMtob608Cl7h4ShDxBW06KNG41TIErns5E+0nN/ReMJJa
   pehGWazmLNy6tx+iEQND0eYrdXp0CHGU0rXFoTC++Eb8nD/SD+Nb0R7tw
   g==;
X-CSE-ConnectionGUID: GfM4z5kiSeiaOr34ZImXpQ==
X-CSE-MsgGUID: HcxReeFtSxiDchjZtD3fNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="80043414"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="80043414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 08:56:48 -0700
X-CSE-ConnectionGUID: GOa0JciASRy5d03auRVQmw==
X-CSE-MsgGUID: 7XENtW/sQTOEesy/3SoJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="240816618"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 May 2026 08:56:45 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOHNb-000000000vu-2tHF;
	Sat, 16 May 2026 15:56:43 +0000
Date: Sat, 16 May 2026 23:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 37/39] kernel/time/timekeeping.c:2371:54:
 error: expected ',' or ';' before 'd'
Message-ID: <202605162329.rHvFUSpl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   4d04890e42f4f8a0651ffae982f1da9bc2fe2948
commit: 69d60b32e76db4c6af56882b7b3fffc843262427 [37/39] timekeeping: Add absolute reference for feed-forward clock discipline
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260516/202605162329.rHvFUSpl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162329.rHvFUSpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605162329.rHvFUSpl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/time/timekeeping.c: In function 'timekeeping_adjust':
   kernel/time/timekeeping.c:2371:25: error: unknown type name '__uint128_t'; did you mean '__int128__'?
    2371 |                         __uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
         |                         ^~~~~~~~~~~
         |                         __int128__
   kernel/time/timekeeping.c:2371:42: error: '__uint128_t' undeclared (first use in this function); did you mean '__int128__'?
    2371 |                         __uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
         |                                          ^~~~~~~~~~~
         |                                          __int128__
   kernel/time/timekeeping.c:2371:42: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/time/timekeeping.c:2371:54: error: expected ',' or ';' before 'd'
    2371 |                         __uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
         |                                                      ^
>> kernel/time/timekeeping.c:2370:29: warning: unused variable 'd' [-Wunused-variable]
    2370 |                         u64 d = tk->tkr_mono.cycle_last - tk_ref.counter_value;
         |                             ^


vim +2371 kernel/time/timekeeping.c

  2353	
  2354	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2355	{
  2356		u64 ntp_tl = ntp_tick_length(tk->id);
  2357		u32 mult;
  2358	
  2359		/*
  2360		 * Determine the multiplier from the current NTP tick length.
  2361		 * Avoid expensive division when the tick length doesn't change.
  2362		 */
  2363		if (likely(tk->ntp_tick == ntp_tl)) {
  2364			mult = tk->tkr_mono.mult - tk->ntp_err_mult;
  2365		} else {
  2366			tk->ntp_tick = ntp_tl;
  2367			mult = div64_u64(tk->ntp_tick >> tk->ntp_error_shift,
  2368					 tk->cycle_interval);
  2369			if (tk_ref_pending && tk->cs_id == tk_ref.cs_id) {
> 2370				u64 d = tk->tkr_mono.cycle_last - tk_ref.counter_value;
> 2371				__uint128_t p = (__uint128_t)d * tk_ref.period_frac_sec;
  2372				u64 rf;
  2373				s64 ref_err;
  2374	
  2375				p >>= tk_ref.period_shift;
  2376				p += tk_ref.time_frac_sec;
  2377				rf = (u64)p;
  2378				ref_err = (s64)mul_u64_u64_shr(rf,
  2379					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64) -
  2380					(s64)tk->tkr_mono.xtime_nsec;
  2381				ntp_set_time_offset(tk->id,
  2382					ref_err >> tk->tkr_mono.shift);
  2383				tk->ntp_error = 0;
  2384				tk_ref_pending = false;
  2385			}
  2386		}
  2387	
  2388		/*
  2389		 * If the clock is behind the NTP time, increase the multiplier by 1
  2390		 * to catch up with it. If it's ahead and there was a remainder in the
  2391		 * tick division, the clock will slow down. Otherwise it will stay
  2392		 * ahead until the tick length changes to a non-divisible value.
  2393		 */
  2394		tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
  2395		mult += tk->ntp_err_mult;
  2396	
  2397		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2398	
  2399		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2400			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2401				> tk->tkr_mono.clock->maxadj))) {
  2402			printk_once(KERN_WARNING
  2403				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2404				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2405				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2406		}
  2407	
  2408		/*
  2409		 * It may be possible that when we entered this function, xtime_nsec
  2410		 * was very small.  Further, if we're slightly speeding the clocksource
  2411		 * in the code above, its possible the required corrective factor to
  2412		 * xtime_nsec could cause it to underflow.
  2413		 *
  2414		 * Now, since we have already accumulated the second and the NTP
  2415		 * subsystem has been notified via second_overflow(), we need to skip
  2416		 * the next update.
  2417		 */
  2418		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2419			tk->tkr_mono.xtime_nsec += (u64)NSEC_PER_SEC <<
  2420								tk->tkr_mono.shift;
  2421			tk->xtime_sec--;
  2422			tk->skip_second_overflow = 1;
  2423		}
  2424	}
  2425	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
