Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2B32868A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707837; cv=none; b=pzGHXZKaWAlPxnRp4XgZh0uD/uxEqNwCc3qV743ckt5S+XKY7VS3wAJamWMsXUy0wrVN2RrWgoFLoiyNh+vJQH8gRbVu6A783YODv28WhNSIMWKoFWB5OXY6Hkkq2xLKafkIzxhBy6ow6kvzoT7S5yvp/pgnsShIlMfxY/xFw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707837; c=relaxed/simple;
	bh=3ktbxB9DCE0w2E9qJB93fTQ1li53tcN8vw5j1Ly7fys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ChONKAB1eutQi5gd9dNA2HqZ5mWGWLFJhUeU4jZdXHdmrpxK6FJddEO0S6Sq05ynOmzaFtAoEsYdBMAcZ/LQUgEo6tflYhBg8iBtdjGxhltOGucXKFABaYRM1CiiSJLVtpUrzCitIub2/RcGAjm1cMzj1r5a8gD4A8yzLfTWqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxJMEtG2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxJMEtG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778707835; x=1810243835;
  h=date:from:to:cc:subject:message-id;
  bh=3ktbxB9DCE0w2E9qJB93fTQ1li53tcN8vw5j1Ly7fys=;
  b=ZxJMEtG2SwdVIUqnWLcmnIgTHz/g4yJh3T8YgCVTpZzUeHsPOye73ILk
   euvcMk/GumevV5bJiEtpRXb/p5daLc0t63u8Pf0kMbCtOJ8p2nWgDtyTV
   b5i3rxg2QdIFaEsH3Z5dxnCk8ONoyvqkZpZdda1WcEa1/pTQmRK1uPQMo
   h6YunZpOKfw+MDdB+1Tl4IYRYt5onAXDXeK7Jgl89O7KvTzMuUFZ4zTEc
   yeMOmCGj6Isb7D81SECG2mcZ+M71Gd3eiRer6by9OgtDjHHXktPB2jPij
   T1Gg4NciM6VGJjmT+q7WUjm8jDPnvT7kD6aCI4GJduHvelAml9XKTgKrm
   g==;
X-CSE-ConnectionGUID: XfOvph+4QgSZZgr5ajoF+g==
X-CSE-MsgGUID: ZRTQjRm6Q2WRWG+fEwDc7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79679783"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79679783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:30:35 -0700
X-CSE-ConnectionGUID: dA6Qgfo1STiB9N5eoPaIaA==
X-CSE-MsgGUID: BLzCrnlXSI2xj7whqBIZVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="276296917"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2026 14:30:34 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNH9z-0000000059b-0Y8h;
	Wed, 13 May 2026 21:30:31 +0000
Date: Thu, 14 May 2026 05:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmtk 36/37] kernel/time/timekeeping.c:2351:9: error:
 unknown type name '__uint128_t'; did you mean '__int128__'?
Message-ID: <202605140552.GyF3DlR9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux vmtk
head:   f3b2e27904ff7b3ad3551c83fcd234281b5b8142
commit: 4b13ac5bbca55428330930343b92cdecd6a601f4 [36/37] timekeeping: Add absolute reference for feed-forward clock discipline
config: powerpc-mpc832x_rdb_defconfig (https://download.01.org/0day-ci/archive/20260514/202605140552.GyF3DlR9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140552.GyF3DlR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140552.GyF3DlR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/timekeeping.c: In function 'timekeeping_ref_ahead':
>> kernel/time/timekeeping.c:2351:9: error: unknown type name '__uint128_t'; did you mean '__int128__'?
    2351 |         __uint128_t product;
         |         ^~~~~~~~~~~
         |         __int128__
>> kernel/time/timekeeping.c:2356:20: error: '__uint128_t' undeclared (first use in this function); did you mean '__int128__'?
    2356 |         product = (__uint128_t)delta * tk_ref.period_frac_sec;
         |                    ^~~~~~~~~~~
         |                    __int128__
   kernel/time/timekeeping.c:2356:20: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/time/timekeeping.c:2356:32: error: expected ';' before 'delta'
    2356 |         product = (__uint128_t)delta * tk_ref.period_frac_sec;
         |                                ^~~~~
         |                                ;
   kernel/time/timekeeping.c:2359:51: warning: right shift count >= width of type [-Wshift-count-overflow]
    2359 |         ref_sec = tk_ref.time_sec + (u64)(product >> 64);
         |                                                   ^~
   kernel/time/timekeeping.c:2350:13: warning: variable 'delta' set but not used [-Wunused-but-set-variable]
    2350 |         u64 delta, ref_frac, ref_sec, ref_shifted_ns;
         |             ^~~~~


vim +2351 kernel/time/timekeeping.c

  2347	
  2348	bool timekeeping_ref_ahead(struct timekeeper *tk)
  2349	{
  2350		u64 delta, ref_frac, ref_sec, ref_shifted_ns;
> 2351		__uint128_t product;
  2352	
  2353		if (tk->cs_id != tk_ref.cs_id)
  2354			return false;
  2355		delta = tk->tkr_mono.cycle_last - tk_ref.counter_value;
> 2356		product = (__uint128_t)delta * tk_ref.period_frac_sec;
  2357		product >>= tk_ref.period_shift;
  2358		product += tk_ref.time_frac_sec;
  2359		ref_sec = tk_ref.time_sec + (u64)(product >> 64);
  2360		ref_frac = (u64)product;
  2361		ref_shifted_ns = mul_u64_u64_shr(ref_frac,
  2362					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64);
  2363		if (tk->xtime_sec > ref_sec)
  2364			return true;
  2365		if (tk->xtime_sec == ref_sec &&
  2366		    tk->tkr_mono.xtime_nsec > ref_shifted_ns)
  2367			return true;
  2368		return false;
  2369	}
  2370	/*
  2371	 * Adjust the timekeeper's multiplier to the correct frequency
  2372	 * and also to reduce the accumulated error value.
  2373	
  2374	 */
  2375	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2376	{
  2377		u64 ntp_tl = ntp_tick_length(tk->id);
  2378		u32 mult;
  2379	
  2380		/*
  2381		 * Determine the multiplier from the current NTP tick length.
  2382		 * Avoid expensive division when the tick length doesn't change.
  2383		 */
  2384		if (likely(tk->ntp_tick == ntp_tl)) {
  2385			mult = tk->tkr_mono.mult - tk->ntp_err_mult;
  2386		} else {
  2387			tk->ntp_tick = ntp_tl;
  2388			mult = div64_u64((tk->ntp_tick >> tk->ntp_error_shift) -
  2389					 tk->xtime_remainder, tk->cycle_interval);
  2390		}
  2391	
  2392		vmclock_host_update(tk);
  2393	
  2394		/*
  2395		 * If the clock is behind the NTP time, increase the multiplier by 1
  2396		 * to catch up with it. If it's ahead and there was a remainder in the
  2397		 * tick division, the clock will slow down. Otherwise it will stay
  2398		 * ahead until the tick length changes to a non-divisible value.
  2399		 */
  2400		if (timekeeping_has_reference())
  2401			tk->ntp_err_mult = timekeeping_ref_ahead(tk) ? 0 : 1;
  2402		else
  2403			tk->ntp_err_mult = tk->ntp_error > 0 ? 1 : 0;
  2404		mult += tk->ntp_err_mult;
  2405	
  2406		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2407	
  2408		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2409			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2410				> tk->tkr_mono.clock->maxadj))) {
  2411			printk_once(KERN_WARNING
  2412				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2413				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2414				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2415		}
  2416	
  2417		/*
  2418		 * It may be possible that when we entered this function, xtime_nsec
  2419		 * was very small.  Further, if we're slightly speeding the clocksource
  2420		 * in the code above, its possible the required corrective factor to
  2421		 * xtime_nsec could cause it to underflow.
  2422		 *
  2423		 * Now, since we have already accumulated the second and the NTP
  2424		 * subsystem has been notified via second_overflow(), we need to skip
  2425		 * the next update.
  2426		 */
  2427		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2428			tk->tkr_mono.xtime_nsec += (u64)NSEC_PER_SEC <<
  2429								tk->tkr_mono.shift;
  2430			tk->xtime_sec--;
  2431			tk->skip_second_overflow = 1;
  2432		}
  2433	}
  2434	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
