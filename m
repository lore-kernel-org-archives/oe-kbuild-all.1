Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB6339863
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 23:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147791; cv=none; b=Qr0G4K1QvnLJHCzoqANVTFSRRgyP8MdEc0DW4rdpvSIJxg41IbdOa4IqMSKNQoNyg9+9CiIqtC2jz2za+/K8aaAX7pgXefMppzk1BEkV/ch/T89GkSbYAh3pUYXpljvZnRsLvpH8PWdfJeC/CEL2NKRlQWY/W0Ygf/NWvmazA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147791; c=relaxed/simple;
	bh=hWjb1o3oHfiC6DGevgb/1w52r3fVns3wMWOzvxphFnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z57g8agGchFYG3vXf0YfM2X/1toZwCQhr5EzuMOAsf7h7nm0vt62Adj8X/d6j+wfBylzFpsW13BANdbBMsHY3Gv/wVHEQpw9Bein4YT8TpJX6/Brv48LsPDHbiRSl2DxeQxpNzeqIABu7tapGiEJu4uyEXBHHvbgcCVHviqktJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAXBD3JS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAXBD3JS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779147790; x=1810683790;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hWjb1o3oHfiC6DGevgb/1w52r3fVns3wMWOzvxphFnI=;
  b=AAXBD3JSJnMx25pB5jjuNrKIsxeKhaGyWxXwyJJlKbyHjbIojYIjZl/4
   HLE1qa7Lrt6ETs+RX1rPFZfKKPIQ2Tv+Q7QwGjGOUCWsHbPwskQIlWsbk
   t4VYJCGxqhtOJVuLVBGyQzrRe8PDJeOcncprMY10IxvCNFUNft0x7YPK7
   4LO5mM6J+giEzRGQ4E8b07vrRgkkPBOncvIUulpOTbBnLeXgtDLZQGCXm
   CuTsLWrUus/RsvTcp0F7fV/tqOFuO/2u6xD4EO8UEjWO/+Pj586BNMTb+
   nbZuOfTuPkkO0Vc7JOtMX4vKT/HBldxlblV+1s5L0Fab5P/3uvuA2TGdi
   w==;
X-CSE-ConnectionGUID: QxnymoNQSuCwHOTTFMrqdQ==
X-CSE-MsgGUID: Bxyicv8hT36ZMuRkHGR1nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90710707"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="90710707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 16:43:09 -0700
X-CSE-ConnectionGUID: AiGTyzW1Ta+bnE4Cf4Ulvg==
X-CSE-MsgGUID: zSqaPt3URo+oesdQKFNsFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="277695085"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2026 16:43:07 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP7c0-00000000A01-2CLB;
	Mon, 18 May 2026 23:43:04 +0000
Date: Tue, 19 May 2026 01:42:32 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43]
 kernel/time/timekeeping.c:2374:undefined reference to `ntp_get_status'
Message-ID: <202605190131.zOxgihbr-lkp@intel.com>
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
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /=
dev/vmclock_host miscdev
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0519/202605190131.zOxgihbr-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260519/202605190131.zOxgihbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190131.zOxgihbr-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: kernel/time/timekeeping.o: in function `timekeepin=
g_adjust':
>> kernel/time/timekeeping.c:2374:(.text+0xb2c): undefined reference to `nt=
p_get_status'
>> aarch64-linux-gnu-ld: kernel/time/timekeeping.c:2375:(.text+0xb34): unde=
fined reference to `ntp_get_time_state'


vim +2374 kernel/time/timekeeping.c

  2354=09
  2355	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2356	{
  2357		u64 ntp_tl =3D ntp_tick_length(tk->id);
  2358		s64 skew =3D ntp_get_skew_delta(tk->id);
  2359		u32 mult;
  2360=09
  2361		/*
  2362		 * Determine the multiplier from the current NTP tick length plus
  2363		 * skew_delta. The skew biases mult so that =C2=B11 dithering can d=
eliver
  2364		 * the time_offset slew rate. Recompute when either changes.
  2365		 */
  2366		if (likely(tk->ntp_tick =3D=3D ntp_tl && tk->skew_delta =3D=3D skew=
 &&
  2367			   !tk_ref_pending)) {
  2368			mult =3D tk->tkr_mono.mult - tk->ntp_err_mult;
  2369		} else {
  2370			if (unlikely(!tk->cycle_interval))
  2371				return;
  2372			tk->ntp_tick =3D ntp_tl;
  2373			tk->skew_delta =3D skew;
> 2374			tk->ntp_status =3D ntp_get_status();
> 2375			tk->ntp_time_state =3D ntp_get_time_state();
  2376			mult =3D div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
  2377					  tk->cycle_interval);
  2378			if (tk_ref_pending && tk->cs_id =3D=3D tk_ref.cs_id) {
  2379				u64 d =3D tk->tkr_mono.cycle_last - tk_ref.counter_value;
  2380				__uint128_t p =3D (__uint128_t)d * tk_ref.period_frac_sec;
  2381				u64 rf;
  2382				s64 ref_err;
  2383=09
  2384				p >>=3D tk_ref.period_shift;
  2385				p +=3D tk_ref.time_frac_sec;
  2386				rf =3D (u64)p;
  2387				ref_err =3D (s64)mul_u64_u64_shr(rf,
  2388					(u64)NSEC_PER_SEC << tk->tkr_mono.shift, 64) -
  2389					(s64)tk->tkr_mono.xtime_nsec;
  2390				ntp_set_time_offset(tk->id,
  2391					ref_err >> tk->tkr_mono.shift);
  2392				tk->ntp_error =3D 0;
  2393				tk_ref_pending =3D false;
  2394			}
  2395		}
  2396=09
  2397		/*
  2398		 * If the clock is behind the NTP time, increase the multiplier by 1
  2399		 * to catch up with it. If it's ahead and there was a remainder in =
the
  2400		 * tick division, the clock will slow down. Otherwise it will stay
  2401		 * ahead until the tick length changes to a non-divisible value.
  2402		 */
  2403		tk->ntp_err_mult =3D tk->ntp_error > 0 ? 1 : 0;
  2404		mult +=3D tk->ntp_err_mult;
  2405=09
  2406		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2407=09
  2408		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2409			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2410				> tk->tkr_mono.clock->maxadj))) {
  2411			printk_once(KERN_WARNING
  2412				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2413				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2414				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2415		}
  2416=09
  2417		/*
  2418		 * It may be possible that when we entered this function, xtime_nsec
  2419		 * was very small.  Further, if we're slightly speeding the clockso=
urce
  2420		 * in the code above, its possible the required corrective factor to
  2421		 * xtime_nsec could cause it to underflow.
  2422		 *
  2423		 * Now, since we have already accumulated the second and the NTP
  2424		 * subsystem has been notified via second_overflow(), we need to sk=
ip
  2425		 * the next update.
  2426		 */
  2427		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2428			tk->tkr_mono.xtime_nsec +=3D (u64)NSEC_PER_SEC <<
  2429								tk->tkr_mono.shift;
  2430			tk->xtime_sec--;
  2431			tk->skip_second_overflow =3D 1;
  2432		}
  2433	}
  2434=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
