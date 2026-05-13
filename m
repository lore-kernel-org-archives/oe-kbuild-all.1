Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BB53FF8B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673629; cv=none; b=L70IU7T7SHMcJDTHn4AoVeOISZkCl7BI8NiPGhafaE5gDpYFx+jqdI2Yu0u2Dp1GliDf+B5DsX5cw5aWGE8D1FNnjpgRDKR8zvvFd5CHqgtjMOt4PQQeBlJ+TIeVsuRMadbrRPWueqoZNf/z1D4l91iLYh1gheG79NEFBJeRxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673629; c=relaxed/simple;
	bh=PfcEXKL6p/Sda7j5O8T2XFH5cWAQzmOXBTYZK3xJek8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKq9RM0Dwin7MeVFvO5ImY+I50O6hJj9gMKhhuYVvnrItaLJHWHeZBuKdlw/iBuAA5YceMz29oh5XaqWdJ2uCiTVOTWBYO8JcHfpJvZkuTmCELRO+lBqbCLVbfhwHf3Gc7TuC42E2O/HHjdMbRSx5MvIBpDmHc38S8GQAX6oEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEWz6xSH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEWz6xSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778673627; x=1810209627;
  h=date:from:to:cc:subject:message-id;
  bh=PfcEXKL6p/Sda7j5O8T2XFH5cWAQzmOXBTYZK3xJek8=;
  b=bEWz6xSHsa9izHRmLf5a77i2JeCp5d1t/pr4m8xq15fNsFKszwOh3ju2
   fV6BWMZSLYF1txgrdHf/dcO8KzOUPghqnI+iJxEzBtvIURhjdH6yckDYF
   erNHx26FPd9bsR8U+E9/lmU6x+MqbZlWpPz1DEudzVlOZeYhABId8jxjt
   SKbj6kHb2g3Mxdp9FljbG43ZBM26OFLVKc5jl7AlMPuB3rVuJwHEi5jiF
   zYr4wSQ0JQzcm7++nsy2+K1K+zT9AbMSqdoI1eQeESm9P8HQLUCpQzEfY
   kqMnMElOPVF2Pry4tPe9JJwume8+JJBDVFuBbz61UP00YzNhNPgxqmbmM
   w==;
X-CSE-ConnectionGUID: oRoGqkgyR9q4a0lgzKR3kg==
X-CSE-MsgGUID: zdiiJNKSSaKqvZkF+ueJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79629476"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79629476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 05:00:24 -0700
X-CSE-ConnectionGUID: cGbYNOriT8CtCvUl0JI1FQ==
X-CSE-MsgGUID: eWJC2K7+SQO/WyFAN48RWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="237966183"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2026 05:00:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN8GC-0000000042V-1l0i;
	Wed, 13 May 2026 12:00:20 +0000
Date: Wed, 13 May 2026 20:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmtk 36/37] kernel/time/vmclock_host.c:48:1: warning:
 "/*" within comment
Message-ID: <202605131930.F7TVmRuX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux vmtk
head:   f3b2e27904ff7b3ad3551c83fcd234281b5b8142
commit: 4b13ac5bbca55428330930343b92cdecd6a601f4 [36/37] timekeeping: Add absolute reference for feed-forward clock discipline
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260513/202605131930.F7TVmRuX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131930.F7TVmRuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131930.F7TVmRuX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/vmclock_host.c:48:1: warning: "/*" within comment [-Wcomment]
      48 | /*
   kernel/time/vmclock_host.c: In function 'vmclock_compute_period':
>> kernel/time/vmclock_host.c:65:26: warning: unused variable 'need' [-Wunused-variable]
      65 |         int bits_so_far, need;
         |                          ^~~~


vim +48 kernel/time/vmclock_host.c

b141c5e36cc2fad David Woodhouse 2026-05-12   38  
b141c5e36cc2fad David Woodhouse 2026-05-12   39  /*
b141c5e36cc2fad David Woodhouse 2026-05-12   40   * Compute counter_period_frac_sec from ntp_tick and cycle_interval.
b141c5e36cc2fad David Woodhouse 2026-05-12   41   *
b141c5e36cc2fad David Woodhouse 2026-05-12   42   * ntp_tick is ns_per_tick << 32.
b141c5e36cc2fad David Woodhouse 2026-05-12   43   * cycle_interval is counter cycles per tick.
b141c5e36cc2fad David Woodhouse 2026-05-12   44   *
b141c5e36cc2fad David Woodhouse 2026-05-12   45   * vmclock wants: period = frac_sec / 2^(64 + shift) in seconds.
b141c5e36cc2fad David Woodhouse 2026-05-12   46   *
b141c5e36cc2fad David Woodhouse 2026-05-12   47   * ns_per_cycle = ntp_tick / cycle_interval (in <<32 fixed point)
b141c5e36cc2fad David Woodhouse 2026-05-12  @48  /*
b141c5e36cc2fad David Woodhouse 2026-05-12   49   * Compute counter_period_frac_sec from ntp_tick and cycle_interval.
b141c5e36cc2fad David Woodhouse 2026-05-12   50   *
b141c5e36cc2fad David Woodhouse 2026-05-12   51   * period = ntp_tick / (cycle_interval * 10^9 * 2^32) seconds/cycle
b141c5e36cc2fad David Woodhouse 2026-05-12   52   * frac_sec = ntp_tick * 2^(32+shift) / (cycle_interval * 10^9)
b141c5e36cc2fad David Woodhouse 2026-05-12   53   *
b141c5e36cc2fad David Woodhouse 2026-05-12   54   * Use div64_u64 with maximum pre-shift for precision.
b141c5e36cc2fad David Woodhouse 2026-05-12   55   * The key: do TWO divisions to get 64 bits of quotient.
b141c5e36cc2fad David Woodhouse 2026-05-12   56   */
b141c5e36cc2fad David Woodhouse 2026-05-12   57  static void vmclock_compute_period(struct timekeeper *tk,
b141c5e36cc2fad David Woodhouse 2026-05-12   58  				   u64 *period_frac, u8 *period_shift)
b141c5e36cc2fad David Woodhouse 2026-05-12   59  {
b141c5e36cc2fad David Woodhouse 2026-05-12   60  	u64 ntp_tick = tk->ntp_tick;
b141c5e36cc2fad David Woodhouse 2026-05-12   61  	u64 cycle_interval = tk->cycle_interval;
b141c5e36cc2fad David Woodhouse 2026-05-12   62  	u64 divisor = cycle_interval * 1000000000ULL;
b141c5e36cc2fad David Woodhouse 2026-05-12   63  	int headroom = __builtin_clzll(ntp_tick);
b141c5e36cc2fad David Woodhouse 2026-05-12   64  	u64 rem, result;
b141c5e36cc2fad David Woodhouse 2026-05-12  @65  	int bits_so_far, need;
b141c5e36cc2fad David Woodhouse 2026-05-12   66  
b141c5e36cc2fad David Woodhouse 2026-05-12   67  	/*
b141c5e36cc2fad David Woodhouse 2026-05-12   68  	 * Compute ntp_tick * 2^(headroom + N) / divisor with 64 bits
b141c5e36cc2fad David Woodhouse 2026-05-12   69  	 * of precision, using iterative 32-bit chunk divisions.
b141c5e36cc2fad David Woodhouse 2026-05-12   70  	 *
b141c5e36cc2fad David Woodhouse 2026-05-12   71  	 * First division: ntp_tick << headroom / divisor
b141c5e36cc2fad David Woodhouse 2026-05-12   72  	 */
b141c5e36cc2fad David Woodhouse 2026-05-12   73  	result = div64_u64_rem(ntp_tick << headroom, divisor, &rem);
b141c5e36cc2fad David Woodhouse 2026-05-12   74  	bits_so_far = 64 - __builtin_clzll(result ?: 1);
b141c5e36cc2fad David Woodhouse 2026-05-12   75  
b141c5e36cc2fad David Woodhouse 2026-05-12   76  	/* Fill remaining bits 32 at a time from the remainder */
b141c5e36cc2fad David Woodhouse 2026-05-12   77  	while (bits_so_far < 64 && rem) {
b141c5e36cc2fad David Woodhouse 2026-05-12   78  		int chunk = min(32, 64 - bits_so_far);
b141c5e36cc2fad David Woodhouse 2026-05-12   79  		int rem_headroom = __builtin_clzll(rem);
b141c5e36cc2fad David Woodhouse 2026-05-12   80  		u64 extra;
b141c5e36cc2fad David Woodhouse 2026-05-12   81  
b141c5e36cc2fad David Woodhouse 2026-05-12   82  		if (rem_headroom < chunk)
b141c5e36cc2fad David Woodhouse 2026-05-12   83  			chunk = rem_headroom;
b141c5e36cc2fad David Woodhouse 2026-05-12   84  
b141c5e36cc2fad David Woodhouse 2026-05-12   85  		extra = div64_u64_rem(rem << chunk, divisor, &rem);
b141c5e36cc2fad David Woodhouse 2026-05-12   86  		result = (result << chunk) | extra;
b141c5e36cc2fad David Woodhouse 2026-05-12   87  		bits_so_far += chunk;
b141c5e36cc2fad David Woodhouse 2026-05-12   88  		headroom += chunk;
b141c5e36cc2fad David Woodhouse 2026-05-12   89  	}
b141c5e36cc2fad David Woodhouse 2026-05-12   90  
b141c5e36cc2fad David Woodhouse 2026-05-12   91  	/* Pad with zeros if we ran out of remainder */
b141c5e36cc2fad David Woodhouse 2026-05-12   92  	if (bits_so_far < 64) {
b141c5e36cc2fad David Woodhouse 2026-05-12   93  		result <<= (64 - bits_so_far);
b141c5e36cc2fad David Woodhouse 2026-05-12   94  		headroom += (64 - bits_so_far);
b141c5e36cc2fad David Woodhouse 2026-05-12   95  	}
b141c5e36cc2fad David Woodhouse 2026-05-12   96  
b141c5e36cc2fad David Woodhouse 2026-05-12   97  	/*
b141c5e36cc2fad David Woodhouse 2026-05-12   98  	 * result = ntp_tick * 2^headroom / divisor
b141c5e36cc2fad David Woodhouse 2026-05-12   99  	 *        = (ntp_tick / (cycle_interval * 10^9)) * 2^headroom
b141c5e36cc2fad David Woodhouse 2026-05-12  100  	 *        = period_seconds * 2^32 * 2^headroom
b141c5e36cc2fad David Woodhouse 2026-05-12  101  	 *        = period_seconds * 2^(32 + headroom)
b141c5e36cc2fad David Woodhouse 2026-05-12  102  	 *
b141c5e36cc2fad David Woodhouse 2026-05-12  103  	 * vmclock: frac_sec / 2^(64 + shift) = period_seconds
b141c5e36cc2fad David Woodhouse 2026-05-12  104  	 * So: shift = 32 + headroom - 64 = headroom - 32
b141c5e36cc2fad David Woodhouse 2026-05-12  105  	 */
b141c5e36cc2fad David Woodhouse 2026-05-12  106  	*period_frac = result;
b141c5e36cc2fad David Woodhouse 2026-05-12  107  	*period_shift = (u8)(headroom - 32);
b141c5e36cc2fad David Woodhouse 2026-05-12  108  }
b141c5e36cc2fad David Woodhouse 2026-05-12  109  

:::::: The code at line 48 was first introduced by commit
:::::: b141c5e36cc2fad478846e0ea83e6dc3852e967c WIP: kernel/time: Add /dev/vmclock_host miscdev

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
