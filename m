Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC4420DE3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765665512; cv=none; b=VjGdh84sXHAkrQ7PtjNE2BrI+ZgdsudyOeq2t5jTJGWnya+Gx5vJXCRYqFShQDh2hswDQB1rZqDzpmxJwyheMOIVxX7MpqBwR+zayDRJaNm7mI9L2BM+SqQOd+gV8+MtmVe790tHoKfPFADuXKB1PTpTMSAjr89qzcxD06BF1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765665512; c=relaxed/simple;
	bh=NwCeXwstcC5KTaYpP1mWvabllHG3bp1ABbJZcyzltvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DEUtsgPv/i1x+XfuezfmACkW9YxGQFm4fMaN4bm3ULSc7tpo7tnGRkR5hs5TBaPIY6Ih75BzCPl44af+s8X212cAgU9cj47s1R82DsLWKFEjFRrd549CHRc53icoKnnoZmPccdiFjMTxiWJI4LZySms/+FvWVEKEadL24mvSeOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ek1otq2M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ek1otq2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765665511; x=1797201511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NwCeXwstcC5KTaYpP1mWvabllHG3bp1ABbJZcyzltvY=;
  b=Ek1otq2MsBLOtRf+O/6lpLIVbzTZtMtbk3NL+yb/RgTTpGeTP/srlWGr
   /A0OxT8/dkQAz2x6EOdkumWPJDBMXTpLQGHcs/bY0mRW+PtdTHx592tlu
   ys1FCw6DBSEAwPSHREBN0nVPwn60SK8mUkZv4Os6wTNzhKJyACnVBQs8+
   xYLyQd9dpdiMRiGZhVyxtESKBxMx79bhtM8anlWDTsLwwM5LRIhoWP73m
   sZKRGtt31OX2rUxfEYvT2o85oAgcDIfmPJx16jNJi5brEqlqZLqawg6D6
   mzHX7BBV8UDeyqDj/tKavZPpZeEXTQlt8LqpyUGAkkcDLBQaXq0g9DnAL
   Q==;
X-CSE-ConnectionGUID: oDiABl1WRxuBSRtXp0URfg==
X-CSE-MsgGUID: QpLjvpDxRaaFUHJIUkBEqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67584994"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67584994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:38:27 -0800
X-CSE-ConnectionGUID: Bp9NQSjoSbakwfk7j0h3dA==
X-CSE-MsgGUID: qc9SCqJsRIO0trm2X3LpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202300260"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 14:38:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYFr-000000008HG-40Br;
	Sat, 13 Dec 2025 22:38:23 +0000
Date: Sun, 14 Dec 2025 06:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:942
 litex_clk_calc_phase_normal() warn: inconsistent indenting
Message-ID: <202512140644.gN3YELGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   bf1103a7647b9e371007e1f7d02827190e619900
commit: 553f9a11b145aae5c68d5abf17e5fa38a3a93426 [14/15] LiteX: driver for MMCM
config: csky-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140644.gN3YELGj-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140644.gN3YELGj-lkp@intel.com/

smatch warnings:
drivers/clk/clk-litex.c:942 litex_clk_calc_phase_normal() warn: inconsistent indenting

vim +942 drivers/clk/clk-litex.c

   886	
   887	/*
   888	 * Calculate necessary values for setting phase in normal mode
   889	 *
   890	 * clk_hw:		hardware specific clock structure
   891	 * divider:		frequency divider value for calculating the phase
   892	 * fract_cnt:		fractional frequency divider value, if not for
   893	 *			CLKOUT0 - set 0
   894	 * phase_offset:	desired phase in angle degrees
   895	 * pointers:		function return values, used for setting desired phase
   896	 *
   897	 */
   898	static int litex_clk_calc_phase_normal(struct clk_hw *hw, u32 divider,
   899						u32 fract_cnt, u32 phase_offset,
   900						u32 *phase_mux, u32 *delay_time,
   901						u32 *phase_mux_f, u32 *period_offset)
   902	{
   903		/* ns unit */
   904		u32 global_period, clkout_period, post_glob_div_f;
   905	
   906		post_glob_div_f = litex_clk_get_real_global_frequency(hw);
   907		global_period = NS_IN_SEC / post_glob_div_f;
   908		clkout_period = global_period * divider;
   909	
   910		if (phase_offset != 0) {
   911			int synthetic_phase, delta_p, min_p;
   912			u8 d_t, p_m;
   913	
   914			*period_offset = litex_round(clkout_period * (*period_offset),
   915									10000);
   916	
   917			if (*period_offset / global_period > DELAY_TIME_MAX)
   918				return -EINVAL;
   919	
   920			min_p = INT_MAX;
   921			/* Delay_time: (0-63) */
   922			for (d_t = 0; d_t <= DELAY_TIME_MAX; d_t++) {
   923				/* phase_mux: (0-7) */
   924				for (p_m = 0; p_m <= PHASE_MUX_MAX; p_m++) {
   925					synthetic_phase = (d_t * global_period) +
   926					((p_m * ((global_period * 100) / 8) / 100));
   927	
   928					delta_p = abs(synthetic_phase - *period_offset);
   929					if (delta_p < min_p) {
   930						min_p = delta_p;
   931						*phase_mux = p_m;
   932						*delay_time = d_t;
   933					}
   934				}
   935			}
   936		} else {
   937			/* Don't change phase offset*/
   938			*phase_mux = 0;
   939			*delay_time = 0;
   940		}
   941	/* Calculating values in normal mode, fractional control bits need to be zero*/
 > 942			*phase_mux_f = 0;
   943	
   944		return 0;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
