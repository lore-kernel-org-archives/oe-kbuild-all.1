Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A33976AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780097758; cv=none; b=sBVlbhaTFm6a0E8DQNWQaTlyopqIPS791OVnjwFhY+Zot6cVEEP3HBs9sXUJjsKnlln+x8oBeeMrl8NSYCpfxZRMZIooTZZnySax0zjq/roSUh78At9wR6GYWU0B29Xpwc8z55KgQgNqdt1vI8H/r9vQAokiix1me17ref3GT38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780097758; c=relaxed/simple;
	bh=7uhejLxlCeKveexN6tLHXyCcUpQBMxVPqdk8Do13euQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h09KoZn5WlRgg62pbcz4MYbaUbu4ecTTPnkwQeRbmo+O+w/E1vzTBbzsG6Wn9QbgTcD+ATJaaMKURLY9Sh6wZY4TjwED/fL2w9zx62E4td+0yhWHcWiWIq3kfQJcDz5OaDttUrMrsF7wQfO2HfjvH6CAtNBV4ViiwKAs1bTI+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKv/GMFx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKv/GMFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780097757; x=1811633757;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7uhejLxlCeKveexN6tLHXyCcUpQBMxVPqdk8Do13euQ=;
  b=MKv/GMFxfDuOLN1wgbokjuLFqNIQ0q2qlsGEruS7pHj+VeEgIV9hEmqT
   hNPXIQcIN409HtixFLz8UVZw9yBp4x0FgvKA50RvoTyI3un0pbN/doemV
   XXUeu5/tJ7/lje5SHbmcucBszD8uckIwXDfhsAVDaArW1ZWbiab5sigf2
   3/oKqV5qT86N5ALZJSSWWjrCPyzJJCW7Dw1RRy/05hPw99xzN8FlPAktQ
   LZNyZNNUMaiXkak5C+261vLZTGq0ji9HkcJDjiS9qT/qunaZy2a9D+PwK
   xo2we5dapA35DZMCJ+ZHhcZDH15+gU0OUsh92FN4/2HIX6ijFDVQdEPXn
   A==;
X-CSE-ConnectionGUID: RdNIblieQtK66CBEXRNPiA==
X-CSE-MsgGUID: hFBSqBJuTGeK9oVI79DTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81141193"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81141193"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 16:35:57 -0700
X-CSE-ConnectionGUID: 3ap1K0b2Rx6Lqb73ftdgiw==
X-CSE-MsgGUID: CZRzYizDRdmRGkC9UVJ5vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="242850516"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2026 16:35:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT6k4-000000007le-3X3D;
	Fri, 29 May 2026 23:35:52 +0000
Date: Sat, 30 May 2026 07:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 10/10]
 kernel/time/timekeeping.c:2563:undefined reference to `ntp_get_status'
Message-ID: <202605300711.V766TYki-lkp@intel.com>
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
head:   70c32e7a9e128f2579034276c19d34bcf79f4b0c
commit: 0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b [10/10] kernel/time: Add /=
dev/vmclock_host miscdev
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20260530=
/202605300711.V766TYki-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260530/202605300711.V766TYki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300711.V766TYki-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/time/timekeeping.o: in function `timekeeping_adjust':
>> kernel/time/timekeeping.c:2563:(.text+0x1eda): undefined reference to `n=
tp_get_status'
>> /usr/bin/ld: kernel/time/timekeeping.c:2564:(.text+0x1ee4): undefined re=
ference to `ntp_get_time_state'
   collect2: error: ld returned 1 exit status


vim +2563 kernel/time/timekeeping.c

  2544=09
  2545	static void timekeeping_adjust(struct timekeeper *tk, s64 offset)
  2546	{
  2547		u64 ntp_tl =3D ntp_tick_length(tk->id);
  2548		s64 skew =3D ntp_get_skew_delta(tk->id);
  2549		u32 mult;
  2550=09
  2551		/*
  2552		 * Determine the multiplier from the current NTP tick length plus
  2553		 * skew_delta. The skew biases mult so that =C2=B11 dithering can d=
eliver
  2554		 * the time_offset slew rate. Recompute when either changes.
  2555		 */
  2556		if (likely(tk->ntp_tick =3D=3D ntp_tl && tk->skew_delta =3D=3D skew=
)) {
  2557			mult =3D tk->tkr_mono.mult - tk->ntp_err_mult;
  2558		} else {
  2559			if (unlikely(!tk->cycle_interval))
  2560				return;
  2561			tk->ntp_tick =3D ntp_tl;
  2562			tk->skew_delta =3D skew;
> 2563			tk->ntp_status =3D ntp_get_status();
> 2564			tk->ntp_time_state =3D ntp_get_time_state();
  2565			mult =3D div64_u64((tk->ntp_tick + skew) >> tk->ntp_error_shift,
  2566					  tk->cycle_interval);
  2567		}
  2568=09
  2569		/*
  2570		 * If the clock is behind the NTP time, increase the multiplier by 1
  2571		 * to catch up with it. If it's ahead and there was a remainder in =
the
  2572		 * tick division, the clock will slow down. Otherwise it will stay
  2573		 * ahead until the tick length changes to a non-divisible value.
  2574		 */
  2575		tk->ntp_err_mult =3D tk->ntp_error > 0 ? 1 : 0;
  2576		mult +=3D tk->ntp_err_mult;
  2577=09
  2578		timekeeping_apply_adjustment(tk, offset, mult - tk->tkr_mono.mult);
  2579=09
  2580		if (unlikely(tk->tkr_mono.clock->maxadj &&
  2581			(abs(tk->tkr_mono.mult - tk->tkr_mono.clock->mult)
  2582				> tk->tkr_mono.clock->maxadj))) {
  2583			printk_once(KERN_WARNING
  2584				"Adjusting %s more than 11%% (%ld vs %ld)\n",
  2585				tk->tkr_mono.clock->name, (long)tk->tkr_mono.mult,
  2586				(long)tk->tkr_mono.clock->mult + tk->tkr_mono.clock->maxadj);
  2587		}
  2588=09
  2589		/*
  2590		 * It may be possible that when we entered this function, xtime_nsec
  2591		 * was very small.  Further, if we're slightly speeding the clockso=
urce
  2592		 * in the code above, its possible the required corrective factor to
  2593		 * xtime_nsec could cause it to underflow.
  2594		 *
  2595		 * Now, since we have already accumulated the second and the NTP
  2596		 * subsystem has been notified via second_overflow(), we need to sk=
ip
  2597		 * the next update.
  2598		 */
  2599		if (unlikely((s64)tk->tkr_mono.xtime_nsec < 0)) {
  2600			tk->tkr_mono.xtime_nsec +=3D (u64)NSEC_PER_SEC <<
  2601								tk->tkr_mono.shift;
  2602			tk->xtime_sec--;
  2603			tk->skip_second_overflow =3D 1;
  2604		}
  2605	}
  2606=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
