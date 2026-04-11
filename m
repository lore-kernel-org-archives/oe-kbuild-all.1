Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC41E8332
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 03:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775877663; cv=none; b=XMBs//OOpLJ21K6oXOp/ST/qzzebzqbSVepo6O1+cPoBlzu7Zl3rmSWfgHRYLjh24zF4m7KbBcF5q1WjAUX9nFonBaVH3xFtAO2p/AMNqMscPEDspjp5g/Dmlyxnt2wsnLwT2o5ukyqb7/p6IX2kGP20Sjn3z12p1gD8r+EUiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775877663; c=relaxed/simple;
	bh=MoGY3jN3exDtCumehS41GMsipL6UH5BcDYjNsPVoM2I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RIm4jTnLiHnAYjSR/0eq+W85tkF7Zq8SUsaQfRiynu8JYcdMC9/DUUcrRbB3sG3ZyaDGqNH52PdSfd4sbuhS+Y/Hv1TQxKfZoGrTGAz0q7x15IkQxhP4l81qmvxbKTc5wfkUWz6Tb1FJzAapNsgQkt8kRHYJ51UcGn+/Y30LKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlJ5nJlo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlJ5nJlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775877662; x=1807413662;
  h=date:from:to:cc:subject:message-id;
  bh=MoGY3jN3exDtCumehS41GMsipL6UH5BcDYjNsPVoM2I=;
  b=FlJ5nJloo3Gb6MtmsFcqGp6czE6Yya89cI4917/3kz5zCcgLOP/J88y4
   MNRVanSxgOBKy4Kz8zGf89ctAwlCp4QPACU+UCnGCP+G+YwYYiCmItKpt
   3cbyofJDCbn/3xPnFoY2LwswZTwS4UQvOGXfe1W1lclhFe83ZlZyfdNCF
   QVCrpFIvJzndaWceHMvXdExUhJwr2noPuvdwbLA5Z4G+bHoEEwCigsEnE
   YlDpGL0dmAUC6HnvVJ20OX46x0MA9RO7zreElkCJDd/C6DC7T1tzQI+WP
   xuya3sFLcFqMIvb7W0DO8bz+E5iiOn3bJQxC/zvrF8Y+p44H4XQ32AdFY
   A==;
X-CSE-ConnectionGUID: QXDhVvlHTDuEN3ejTw13Kg==
X-CSE-MsgGUID: 1erEmFm/RraQtNJr36z8Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76775773"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76775773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 20:20:59 -0700
X-CSE-ConnectionGUID: yhTNHsIpS6GNc5aeyXFPaQ==
X-CSE-MsgGUID: CHu4m9UYQueFhNgnY4OGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259733489"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 20:20:57 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBOty-000000000gZ-2Pdc;
	Sat, 11 Apr 2026 03:20:54 +0000
Date: Sat, 11 Apr 2026 11:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 15/38] drivers/ptp/ptp_vmclock.c:78:18:
 error: '__int128' is not supported on this target
Message-ID: <202604111120.tefC2mVN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: 7fb0a26394a1f8378dcf335ea5ad47d32621e080 [15/38] ptp: ptp_vmclock: Replace get_cycles() usage
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111120.tefC2mVN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111120.tefC2mVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111120.tefC2mVN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'mul_u64_u64_shr_add_u64':
>> drivers/ptp/ptp_vmclock.c:78:18: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                  ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:78:43: error: '__int128' is not supported on this target
      78 |         unsigned __int128 res = (unsigned __int128)delta * period;
         |                                           ^~~~~~~~
>> drivers/ptp/ptp_vmclock.c:82:23: warning: right shift count >= width of type [-Wshift-count-overflow]
      82 |         *res_hi = res >> 64;
         |                       ^~


vim +/__int128 +78 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse 2024-10-06  62  
20503272422693 David Woodhouse 2024-10-06  63  #define VMCLOCK_FIELD_PRESENT(_c, _f)			  \
20503272422693 David Woodhouse 2024-10-06  64  	(le32_to_cpu((_c)->size) >= (offsetof(struct vmclock_abi, _f) +	\
20503272422693 David Woodhouse 2024-10-06  65  				     sizeof((_c)->_f)))
20503272422693 David Woodhouse 2024-10-06  66  
20503272422693 David Woodhouse 2024-10-06  67  /*
20503272422693 David Woodhouse 2024-10-06  68   * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
20503272422693 David Woodhouse 2024-10-06  69   * and add the fractional second part of the reference time.
20503272422693 David Woodhouse 2024-10-06  70   *
20503272422693 David Woodhouse 2024-10-06  71   * The result is a 128-bit value, the top 64 bits of which are seconds, and
20503272422693 David Woodhouse 2024-10-06  72   * the low 64 bits are (seconds >> 64).
20503272422693 David Woodhouse 2024-10-06  73   */
20503272422693 David Woodhouse 2024-10-06  74  static uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
20503272422693 David Woodhouse 2024-10-06  75  					uint64_t period, uint8_t shift,
20503272422693 David Woodhouse 2024-10-06  76  					uint64_t frac_sec)
20503272422693 David Woodhouse 2024-10-06  77  {
20503272422693 David Woodhouse 2024-10-06 @78  	unsigned __int128 res = (unsigned __int128)delta * period;
20503272422693 David Woodhouse 2024-10-06  79  
20503272422693 David Woodhouse 2024-10-06  80  	res >>= shift;
20503272422693 David Woodhouse 2024-10-06  81  	res += frac_sec;
20503272422693 David Woodhouse 2024-10-06 @82  	*res_hi = res >> 64;
20503272422693 David Woodhouse 2024-10-06  83  	return (uint64_t)res;
20503272422693 David Woodhouse 2024-10-06  84  }
20503272422693 David Woodhouse 2024-10-06  85  

:::::: The code at line 78 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AMZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
