Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A4033B6D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779215942; cv=none; b=T17wkLx8ek/Qz3kNcoeWaU9in7cPv0OweYONi+4gmhhHXPhhW/U9bEzFzZOfWy0pFP9PVGzZijl/8nanBd6shWZ1qPSUVwig0Ir1T5LLb74Anlvt3knHuCFFzxZGn3W4gBytWrzB51cI43YQS7P4Z8T9xHD+eb9goqXzq6aVtNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779215942; c=relaxed/simple;
	bh=LY3GoQOmnRNUG0Zpj4JD9HtBjPi5FdkEJARCCQRYB/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IuiTK7ZhJL1hfGt/3DgHtjizmBaOReF1K9stzL6oRPye3E7a9Lz0/HwKQyKZwinSy9V31G2wzl62iJlQ8xZ1fFCmJU4/PS4JrSvvmgP4NPUi4KlMfYAkrVVaUJZNfTWXoIQ8ktp60CLUl58OV0oXsbtGXzDstRIA106lte76DxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoylNsGv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoylNsGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779215941; x=1810751941;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LY3GoQOmnRNUG0Zpj4JD9HtBjPi5FdkEJARCCQRYB/0=;
  b=KoylNsGvLDZd+0bMqoKBumQeXbGrDpbxxqvp9OeKKF39ncWc99MdsnoN
   AIbwJOELAMLK2RLyywfRBtfEKXlcqX2+keLkXBvD8MqDdVVqSpge2kfct
   H95IsyFsCyRI2pwZGbJu8LPSkeHqwFxanU3MC+ZRf/GI5ZAiYQaJKFqo6
   7JwkEj84PGYjReRlF1FhlsT+ecBShAWDIj7DbNDsoT64Ro8T8wFHs0Hg4
   YQhM9L4Qf0Sr+tk5wuG9oVpdJ21OZ9kczKCspm8grHxrhz1nm9BC0WOMR
   6gd5eroHaSGfPa8RaCW9wjh3w8NwqDUWOjtXyl7SbjugAOHrMLgpD4oBl
   g==;
X-CSE-ConnectionGUID: CGXBf+pKRwy8esX3qrJquw==
X-CSE-MsgGUID: scXSJaqXT0aDxbuyEwcpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97536350"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97536350"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:39:00 -0700
X-CSE-ConnectionGUID: c60rvh3oTvKCfQjIp3IQYg==
X-CSE-MsgGUID: c/cCQRh6SIa1loomKdDJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238874257"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2026 11:38:59 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPPLE-000000001hN-0cO0;
	Tue, 19 May 2026 18:38:56 +0000
Date: Wed, 20 May 2026 02:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 41/43] kernel/time/timekeeping.c:2377:25:
 error: unknown type name '__uint128_t'; did you mean '__int128__'?
Message-ID: <202605200214.bexKaF0t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   252022e1ac4d1e1eef2cdf042f06b3ea08bfe9f8
commit: 8f592fb554b22bb61fc81efb283b6b2f57829b81 [41/43] timekeeping: Add a=
bsolute reference for feed-forward clock discipline
config: parisc-randconfig-001-20260519 (https://download.01.org/0day-ci/arc=
hive/20260520/202605200214.bexKaF0t-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260520/202605200214.bexKaF0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200214.bexKaF0t-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   kernel/time/timekeeping.c: In function 'timekeeping_adjust':
>> kernel/time/timekeeping.c:2377:25: error: unknown type name '__uint128_t=
'; did you mean '__int128__'?
    2377 |                         __uint128_t p =3D (__uint128_t)d * tk_re=
f.period_frac_sec;
         |                         ^~~~~~~~~~~
         |                         __int128__
>> kernel/time/timekeeping.c:2377:42: error: '__uint128_t' undeclared (firs=
t use in this function); did you mean '__int128__'?
    2377 |                         __uint128_t p =3D (__uint128_t)d * tk_re=
f.period_frac_sec;
         |                                          ^~~~~~~~~~~
         |                                          __int128__
   kernel/time/timekeeping.c:2377:42: note: each undeclared identifier is r=
eported only once for each function it appears in
>> kernel/time/timekeeping.c:2377:54: error: expected ',' or ';' before 'd'
    2377 |                         __uint128_t p =3D (__uint128_t)d * tk_re=
f.period_frac_sec;
         |                                                      ^
   kernel/time/timekeeping.c:2376:29: warning: unused variable 'd' [-Wunuse=
d-variable]
    2376 |                         u64 d =3D tk->tkr_mono.cycle_last - tk_r=
ef.counter_value;
         |                             ^


vim +2377 kernel/time/timekeeping.c

  2353=09
  2354	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2355	{
  2356		u64 ntp_tl =3D ntp_tick_length(tk->id);
  2357		s64 skew =3D ntp_get_skew_delta(tk->id);
  2358		u32 mult;
  2359=09
  2360		/*
  2361		 * Determine the multiplier from the current NTP tick length plus
  2362		 * skew_delta. The skew biases mult so that =C2=B11 dithering can d=
eliver
  2363		 * the time_offset slew rate. Recompute when either changes.
  2364		 */
  2365		if (likely(tk->ntp_tick =3D=3D ntp_tl && tk->skew_delta =3D=3D skew=
 &&
  2366			   !tk_ref_pending)) {
  2367			mult =3D tk->tkr_mono.mult - tk->ntp_err_mult;
  2368		} else {
  2369			if (unlikely(!tk->cycle_interval))
  2370				return;
  2371			tk->ntp_tick =3D ntp_tl;
  2372			tk->skew_delta =3D skew;
  2373			mult =3D div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
  2374					  tk->cycle_interval);
  2375			if (tk_ref_pending && tk->cs_id =3D=3D tk_ref.cs_id) {
  2376				u64 d =3D tk->tkr_mono.cycle_last - tk_ref.counter_value;
> 2377				__uint128_t p =3D (__uint128_t)d * tk_ref.period_frac_sec;
  2378				u64 rf;
  2379				s64 ref_err;
  2380=09
  2381				p >>=3D tk_ref.period_shift;
  2382				p +=3D tk_ref.time_frac_sec;
  2383				rf =3D (u64)p;
  2384				ref_err =3D (s64)mul_u64_u64_shr(rf,
  2385					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64) -
  2386					(s64)tk->tkr_mono.xtime_nsec;
  2387				ntp_set_time_offset(tk->id,
  2388					ref_err >> tk->tkr_mono.shift);
  2389				tk->ntp_error =3D 0;
  2390				tk_ref_pending =3D false;
  2391			}
  2392		}
  2393=09
  2394		/*
  2395		 * If the clock is behind the NTP time, increase the multiplier by 1
  2396		 * to catch up with it. If it's ahead and there was a remainder in =
the
  2397		 * tick division, the clock will slow down. Otherwise it will stay
  2398		 * ahead until the tick length changes to a non-divisible value.
  2399		 */
  2400		tk->ntp_err_mult =3D tk->ntp_error > 0 ? 1 : 0;
  2401		mult +=3D tk->ntp_err_mult;
  2402=09
  2403		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2404=09
  2405		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2406			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2407				> tk->tkr_mono.clock->maxadj))) {
  2408			printk_once(KERN_WARNING
  2409				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2410				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2411				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2412		}
  2413=09
  2414		/*
  2415		 * It may be possible that when we entered this function, xtime_nsec
  2416		 * was very small.  Further, if we're slightly speeding the clockso=
urce
  2417		 * in the code above, its possible the required corrective factor to
  2418		 * xtime_nsec could cause it to underflow.
  2419		 *
  2420		 * Now, since we have already accumulated the second and the NTP
  2421		 * subsystem has been notified via second_overflow(), we need to sk=
ip
  2422		 * the next update.
  2423		 */
  2424		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2425			tk->tkr_mono.xtime_nsec +=3D (u64)NSEC_PER_SEC <<
  2426								tk->tkr_mono.shift;
  2427			tk->xtime_sec--;
  2428			tk->skip_second_overflow =3D 1;
  2429		}
  2430	}
  2431=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
