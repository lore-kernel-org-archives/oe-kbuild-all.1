Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578DC18E1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSdmYG95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698683081; x=1730219081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Hd1Suavl8irXLV5dwiCITrLgudmw7DM6XwD+5bIeqc=;
  b=ZSdmYG953wtE7jcjmsdN0C785Zmx8yWad8WEiThNlSLqPXHYBupEenc4
   DXfea086ySEz8J0uM1ke0Wi53AJua4sz73WiIKb1NacbPSsoUYsLJFF1X
   4V9FwVCOYnvb6pW9G5Jj7oUSYQ092zHVLT9Ny9HnKAfLgESuZScx1JlJ8
   ZnDXaE6C3N3WVMu7dReGXNVVYMwEjVe7Ov21X/4ASld+NtolW8BoqNHeA
   hCy82FB72nOJuQTP373oXJFwUIYThq3jhgLxiWCH++3c0MdjLdUqK7Avb
   KkATuuQKI95HjwgIJOusZtmn60X6otar669NHOWtCZ0ysDgarYnutWQwk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419224915"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="419224915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 09:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="933818179"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933818179"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2023 09:24:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxV47-000DPP-1e;
	Mon, 30 Oct 2023 16:24:35 +0000
Date: Tue, 31 Oct 2023 00:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Kolacinski <karol.kolacinski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	anthony.l.nguyen@intel.com, jesse.brandeburg@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next] ice: remove unnecessary
 discarding of timestamps
Message-ID: <202310310036.7Cgll3Lm-lkp@intel.com>
References: <20231026105955.282546-1-karol.kolacinski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026105955.282546-1-karol.kolacinski@intel.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on b57a67bab47efc24e7ea7bd626aa517ac76c4fc9]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Kolacinski/ice-remove-unnecessary-discarding-of-timestamps/20231026-192456
base:   b57a67bab47efc24e7ea7bd626aa517ac76c4fc9
patch link:    https://lore.kernel.org/r/20231026105955.282546-1-karol.kolacinski%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next] ice: remove unnecessary discarding of timestamps
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231031/202310310036.7Cgll3Lm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310036.7Cgll3Lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310036.7Cgll3Lm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_rebuild_owner':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2509:9: error: implicit declaration of function 'ice_ptp_flush_all_tx_tracker'; did you mean 'ice_ptp_flush_tx_tracker'? [-Werror=implicit-function-declaration]
    2509 |         ice_ptp_flush_all_tx_tracker(pf);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         ice_ptp_flush_tx_tracker
   cc1: some warnings being treated as errors


vim +2509 drivers/net/ethernet/intel/ice/ice_ptp.c

0c095c9988dd713 Karol Kolacinski 2023-10-25  2454  
4809671015a1bd2 Karol Kolacinski 2021-12-20  2455  /**
9ea8140e2f947cb Jacob Keller     2023-10-25  2456   * ice_ptp_rebuild_owner - Initialize PTP clock owner after reset
4809671015a1bd2 Karol Kolacinski 2021-12-20  2457   * @pf: Board private structure
9ea8140e2f947cb Jacob Keller     2023-10-25  2458   *
9ea8140e2f947cb Jacob Keller     2023-10-25  2459   * Companion function for ice_ptp_rebuild() which handles tasks that only the
9ea8140e2f947cb Jacob Keller     2023-10-25  2460   * PTP clock owner instance should perform.
4809671015a1bd2 Karol Kolacinski 2021-12-20  2461   */
9ea8140e2f947cb Jacob Keller     2023-10-25  2462  static int ice_ptp_rebuild_owner(struct ice_pf *pf)
4809671015a1bd2 Karol Kolacinski 2021-12-20  2463  {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2464  	struct ice_ptp *ptp = &pf->ptp;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2465  	struct ice_hw *hw = &pf->hw;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2466  	struct timespec64 ts;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2467  	u64 time_diff;
d695241a0a0ea02 Jacob Keller     2023-10-25  2468  	int err;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2469  
b2ee72565cd0ee2 Jacob Keller     2021-10-13  2470  	err = ice_ptp_init_phc(hw);
4809671015a1bd2 Karol Kolacinski 2021-12-20  2471  	if (err)
9ea8140e2f947cb Jacob Keller     2023-10-25  2472  		return err;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2473  
4809671015a1bd2 Karol Kolacinski 2021-12-20  2474  	/* Acquire the global hardware lock */
4809671015a1bd2 Karol Kolacinski 2021-12-20  2475  	if (!ice_ptp_lock(hw)) {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2476  		err = -EBUSY;
9ea8140e2f947cb Jacob Keller     2023-10-25  2477  		return err;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2478  	}
4809671015a1bd2 Karol Kolacinski 2021-12-20  2479  
4809671015a1bd2 Karol Kolacinski 2021-12-20  2480  	/* Write the increment time value to PHY and LAN */
78267d0c9cabf09 Jacob Keller     2021-10-13  2481  	err = ice_ptp_write_incval(hw, ice_base_incval(pf));
4809671015a1bd2 Karol Kolacinski 2021-12-20  2482  	if (err) {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2483  		ice_ptp_unlock(hw);
9ea8140e2f947cb Jacob Keller     2023-10-25  2484  		return err;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2485  	}
4809671015a1bd2 Karol Kolacinski 2021-12-20  2486  
4809671015a1bd2 Karol Kolacinski 2021-12-20  2487  	/* Write the initial Time value to PHY and LAN using the cached PHC
4809671015a1bd2 Karol Kolacinski 2021-12-20  2488  	 * time before the reset and time difference between stopping and
4809671015a1bd2 Karol Kolacinski 2021-12-20  2489  	 * starting the clock.
4809671015a1bd2 Karol Kolacinski 2021-12-20  2490  	 */
4809671015a1bd2 Karol Kolacinski 2021-12-20  2491  	if (ptp->cached_phc_time) {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2492  		time_diff = ktime_get_real_ns() - ptp->reset_time;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2493  		ts = ns_to_timespec64(ptp->cached_phc_time + time_diff);
4809671015a1bd2 Karol Kolacinski 2021-12-20  2494  	} else {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2495  		ts = ktime_to_timespec64(ktime_get_real());
4809671015a1bd2 Karol Kolacinski 2021-12-20  2496  	}
4809671015a1bd2 Karol Kolacinski 2021-12-20  2497  	err = ice_ptp_write_init(pf, &ts);
4809671015a1bd2 Karol Kolacinski 2021-12-20  2498  	if (err) {
4809671015a1bd2 Karol Kolacinski 2021-12-20  2499  		ice_ptp_unlock(hw);
9ea8140e2f947cb Jacob Keller     2023-10-25  2500  		return err;
4809671015a1bd2 Karol Kolacinski 2021-12-20  2501  	}
4809671015a1bd2 Karol Kolacinski 2021-12-20  2502  
4809671015a1bd2 Karol Kolacinski 2021-12-20  2503  	/* Release the global hardware lock */
4809671015a1bd2 Karol Kolacinski 2021-12-20  2504  	ice_ptp_unlock(hw);
4809671015a1bd2 Karol Kolacinski 2021-12-20  2505  
b57a67bab47efc2 Jacob Keller     2023-10-25  2506  	/* Flush software tracking of any outstanding timestamps since we're
b57a67bab47efc2 Jacob Keller     2023-10-25  2507  	 * about to flush the PHY timestamp block.
b57a67bab47efc2 Jacob Keller     2023-10-25  2508  	 */
b57a67bab47efc2 Jacob Keller     2023-10-25 @2509  	ice_ptp_flush_all_tx_tracker(pf);
b57a67bab47efc2 Jacob Keller     2023-10-25  2510  
3a7496234d179a7 Jacob Keller     2021-10-13  2511  	if (!ice_is_e810(hw)) {
3a7496234d179a7 Jacob Keller     2021-10-13  2512  		/* Enable quad interrupts */
d695241a0a0ea02 Jacob Keller     2023-10-25  2513  		err = ice_ptp_cfg_phy_interrupt(pf, true, 1);
9ea8140e2f947cb Jacob Keller     2023-10-25  2514  		if (err)
9ea8140e2f947cb Jacob Keller     2023-10-25  2515  			return err;
9ea8140e2f947cb Jacob Keller     2023-10-25  2516  
9ea8140e2f947cb Jacob Keller     2023-10-25  2517  		ice_ptp_restart_all_phy(pf);
9ea8140e2f947cb Jacob Keller     2023-10-25  2518  	}
9ea8140e2f947cb Jacob Keller     2023-10-25  2519  
9ea8140e2f947cb Jacob Keller     2023-10-25  2520  	return 0;
9ea8140e2f947cb Jacob Keller     2023-10-25  2521  }
9ea8140e2f947cb Jacob Keller     2023-10-25  2522  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
