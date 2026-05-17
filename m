Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E412EC0A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779007767; cv=none; b=RLMdTkKMj0ITzvkjhf+gz2pJG3p3XS6MiywkoserMBHxl3NndbPMh8hNbbE0Ln2L4RIBAM6guPkqUrLKxsLEvfP24aClxR38Y8jkbKDS6cyKY7x0AtlW7Cy4gc9RiQMTdIIPh4esofqUtxtP4ETvNrpdEwa9GCAx96/q+GE6A9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779007767; c=relaxed/simple;
	bh=cp+FwyFBIU3kdiGmJ34qT2ZSASnZIGKPmSJNeHLibwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OKTJIaFdILeRtnjBa18+/g7GcC93Ci2TjHsMaPlBXBBA0fkL4crOX3EnhxiE8WpHDXSplkkgu6/NzMBwwOCquOoPQ70VSZw7EJ0dho9LVjh4IZWxuLrzWepcjXj3e7jkmKPE8BNpV8BS95dq2z+oG/AwOOCfOkKelpjorn4dwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQ290ln7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQ290ln7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779007765; x=1810543765;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cp+FwyFBIU3kdiGmJ34qT2ZSASnZIGKPmSJNeHLibwM=;
  b=iQ290ln7gJ3fnBOmtVzKSWSi/RPyfVWAWr2BccOa53XfwRhaNAq8M+Td
   q/D3PvKszQlGVKv4iYYGraP4UIi5Usph188Wc3IGL5OYA2RFEfqhFljav
   +5R05hUYOHYZwGKeCsxr2JFJShOINytYr2MFSRAMlR3lM4yqlKMB+Zm+0
   pXa2OesXJxvMZBTJArgDEKkRMkyAvJXnux5yHUMJeKrtLctKzYrXTjnTO
   q8/DF1Qz6OV5r9j7UMIRlXi7sKf8pEn0F5wkWph0kDJdT+N/LhwlLcBzS
   MPIu/EwWZxZGo5CFnGQSC/EDuJRw6l6zbSVsmWS9U0b6+K8Q5Nevntl3m
   g==;
X-CSE-ConnectionGUID: RTQwy9URSMW8Pin9sM65Qg==
X-CSE-MsgGUID: KhfqYDxiQYKczABF5fa4/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79936211"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79936211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 01:49:24 -0700
X-CSE-ConnectionGUID: x31Z+/7gQYO6KGDaSQuYBA==
X-CSE-MsgGUID: FSiqrSZWSxKt+Epbed1LCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="239373703"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2026 01:49:22 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOXBX-000000001T0-3L5R;
	Sun, 17 May 2026 08:49:19 +0000
Date: Sun, 17 May 2026 16:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 39/39] kernel/time/timekeeping.c:2377
 timekeeping_adjust() warn: inconsistent indenting
Message-ID: <202605171633.0VVgWaBD-lkp@intel.com>
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
head:   72f314e9b0f01e7dcdde02534c4dcfe782c3fa62
commit: 72f314e9b0f01e7dcdde02534c4dcfe782c3fa62 [39/39] timekeeping: Drive=
 time_offset skew via mult override
config: um-randconfig-r071-20260517 (https://download.01.org/0day-ci/archiv=
e/20260517/202605171633.0VVgWaBD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171633.0VVgWaBD-lkp@i=
ntel.com/

smatch warnings:
kernel/time/timekeeping.c:2377 timekeeping_adjust() warn: inconsistent inde=
nting

vim +2377 kernel/time/timekeeping.c

69d60b32e76db4c David Woodhouse  2026-05-15  2353 =20
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2354  static void timekeeping_=
adjust(struct timekeeper *tk, s64 offset)
dc491596f639438 John Stultz      2013-12-06  2355  {
5ffa25f573cf524 Thomas Gleixner  2025-05-19  2356  	u64 ntp_tl =3D ntp_tick=
_length(tk->id);
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2357  	u32 mult;
dc491596f639438 John Stultz      2013-12-06  2358 =20
ec02b076ceab63f John Stultz      2015-12-03  2359  	/*
72f314e9b0f01e7 David Woodhouse  2026-05-16  2360  	 * Determine the multip=
lier from the current NTP tick length plus
72f314e9b0f01e7 David Woodhouse  2026-05-16  2361  	 * skew_delta. The skew=
 biases mult so that =C2=B11 dithering can deliver
72f314e9b0f01e7 David Woodhouse  2026-05-16  2362  	 * the time_offset slew=
 rate. Recompute when either changes.
ec02b076ceab63f John Stultz      2015-12-03  2363  	 */
72f314e9b0f01e7 David Woodhouse  2026-05-16  2364  	{
72f314e9b0f01e7 David Woodhouse  2026-05-16  2365  		s64 skew =3D ntp_get_s=
kew_delta(tk->id);
72f314e9b0f01e7 David Woodhouse  2026-05-16  2366 =20
72f314e9b0f01e7 David Woodhouse  2026-05-16  2367  		if (likely(tk->ntp_tic=
k =3D=3D ntp_tl && tk->skew_delta =3D=3D skew)) {
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2368  			mult =3D tk->tkr_mono=
.mult - tk->ntp_err_mult;
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2369  		} else {
14f1e3b3dfc7fc8 Thomas Gleixner  2024-10-09  2370  			tk->ntp_tick =3D ntp_=
tl;
72f314e9b0f01e7 David Woodhouse  2026-05-16  2371  			tk->skew_delta =3D sk=
ew;
72f314e9b0f01e7 David Woodhouse  2026-05-16  2372  			mult =3D tk->cycle_in=
terval ?
72f314e9b0f01e7 David Woodhouse  2026-05-16  2373  				div64_u64((tk->ntp_t=
ick + skew) >>
72f314e9b0f01e7 David Woodhouse  2026-05-16  2374  					  tk->ntp_error_shi=
ft,
72f314e9b0f01e7 David Woodhouse  2026-05-16  2375  					  tk->cycle_interva=
l) :
72f314e9b0f01e7 David Woodhouse  2026-05-16  2376  				tk->tkr_mono.mult;
69d60b32e76db4c David Woodhouse  2026-05-15 @2377  		if (tk_ref_pending && =
tk->cs_id =3D=3D tk_ref.cs_id) {
69d60b32e76db4c David Woodhouse  2026-05-15  2378  			u64 d =3D tk->tkr_mon=
o.cycle_last - tk_ref.counter_value;
69d60b32e76db4c David Woodhouse  2026-05-15  2379  			__uint128_t p =3D (__=
uint128_t)d * tk_ref.period_frac_sec;
69d60b32e76db4c David Woodhouse  2026-05-15  2380  			u64 rf;
69d60b32e76db4c David Woodhouse  2026-05-15  2381  			s64 ref_err;
69d60b32e76db4c David Woodhouse  2026-05-15  2382 =20
69d60b32e76db4c David Woodhouse  2026-05-15  2383  			p >>=3D tk_ref.period=
_shift;
69d60b32e76db4c David Woodhouse  2026-05-15  2384  			p +=3D tk_ref.time_fr=
ac_sec;
69d60b32e76db4c David Woodhouse  2026-05-15  2385  			rf =3D (u64)p;
69d60b32e76db4c David Woodhouse  2026-05-15  2386  			ref_err =3D (s64)mul_=
u64_u64_shr(rf,
69d60b32e76db4c David Woodhouse  2026-05-15  2387  				(u64)NSEC_PER_SEC <<=
 tk->tkr_mono.shift, 64) -
69d60b32e76db4c David Woodhouse  2026-05-15  2388  				(s64)tk->tkr_mono.xt=
ime_nsec;
69d60b32e76db4c David Woodhouse  2026-05-15  2389  			ntp_set_time_offset(t=
k->id,
69d60b32e76db4c David Woodhouse  2026-05-15  2390  				ref_err >> tk->tkr_m=
ono.shift);
69d60b32e76db4c David Woodhouse  2026-05-15  2391  			tk->ntp_error =3D 0;
69d60b32e76db4c David Woodhouse  2026-05-15  2392  			tk_ref_pending =3D fa=
lse;
69d60b32e76db4c David Woodhouse  2026-05-15  2393  		}
dc491596f639438 John Stultz      2013-12-06  2394  		}
72f314e9b0f01e7 David Woodhouse  2026-05-16  2395  	}
dc491596f639438 John Stultz      2013-12-06  2396 =20
dc491596f639438 John Stultz      2013-12-06  2397  	/*
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2398  	 * If the clock is behi=
nd the NTP time, increase the multiplier by 1
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2399  	 * to catch up with it.=
 If it's ahead and there was a remainder in the
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2400  	 * tick division, the c=
lock will slow down. Otherwise it will stay
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2401  	 * ahead until the tick=
 length changes to a non-divisible value.
dc491596f639438 John Stultz      2013-12-06  2402  	 */
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2403  	tk->ntp_err_mult =3D tk=
->ntp_error > 0 ? 1 : 0;
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2404  	mult +=3D tk->ntp_err_m=
ult;
dc491596f639438 John Stultz      2013-12-06  2405 =20
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2406  	timekeeping_apply_adjus=
tment(tk, offset, mult - tk->tkr_mono.mult);
dc491596f639438 John Stultz      2013-12-06  2407 =20
876e78818def298 Peter Zijlstra   2015-03-19  2408  	if (unlikely(tk->tkr_mo=
no.clock->maxadj &&
876e78818def298 Peter Zijlstra   2015-03-19  2409  		(abs(tk->tkr_mono.mult=
 - tk->tkr_mono.clock->mult)
876e78818def298 Peter Zijlstra   2015-03-19  2410  			> tk->tkr_mono.clock-=
>maxadj))) {
dc491596f639438 John Stultz      2013-12-06  2411  		printk_once(KERN_WARNI=
NG
dc491596f639438 John Stultz      2013-12-06  2412  			"Adjusting %s more th=
an 11%% (%ld vs %ld)\n",
876e78818def298 Peter Zijlstra   2015-03-19  2413  			tk->tkr_mono.clock->n=
ame, (long)tk->tkr_mono.mult,
876e78818def298 Peter Zijlstra   2015-03-19  2414  			(long)tk->tkr_mono.cl=
ock->mult + tk->tkr_mono.clock->maxadj);
dc491596f639438 John Stultz      2013-12-06  2415  	}
2a8c0883c3cfffc John Stultz      2012-07-13  2416 =20
2a8c0883c3cfffc John Stultz      2012-07-13  2417  	/*
2a8c0883c3cfffc John Stultz      2012-07-13  2418  	 * It may be possible t=
hat when we entered this function, xtime_nsec
2a8c0883c3cfffc John Stultz      2012-07-13  2419  	 * was very small.  Fur=
ther, if we're slightly speeding the clocksource
2a8c0883c3cfffc John Stultz      2012-07-13  2420  	 * in the code above, i=
ts possible the required corrective factor to
2a8c0883c3cfffc John Stultz      2012-07-13  2421  	 * xtime_nsec could cau=
se it to underflow.
2a8c0883c3cfffc John Stultz      2012-07-13  2422  	 *
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2423  	 * Now, since we have a=
lready accumulated the second and the NTP
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2424  	 * subsystem has been n=
otified via second_overflow(), we need to skip
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2425  	 * the next update.
2a8c0883c3cfffc John Stultz      2012-07-13  2426  	 */
876e78818def298 Peter Zijlstra   2015-03-19  2427  	if (unlikely((s64)tk->t=
kr_mono.xtime_nsec < 0)) {
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2428  		tk->tkr_mono.xtime_nse=
c +=3D (u64)NSEC_PER_SEC <<
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2429  							tk->tkr_mono.shif=
t;
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2430  		tk->xtime_sec--;
78b98e3c5a66d56 Miroslav Lichvar 2018-03-09  2431  		tk->skip_second_overfl=
ow =3D 1;
2a8c0883c3cfffc John Stultz      2012-07-13  2432  	}
8524070b7982d76 John Stultz      2007-05-08  2433  }
8524070b7982d76 John Stultz      2007-05-08  2434 =20

:::::: The code at line 2377 was first introduced by commit
:::::: 69d60b32e76db4c6af56882b7b3fffc843262427 timekeeping: Add absolute r=
eference for feed-forward clock discipline

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
