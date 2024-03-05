Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6A5339E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709632006; cv=none; b=YGB5R+sSpwlWACXTTxikKl6fAaeoBsQ4H65WNEuZqdjo1dObhM8TRJjDFQ00ho+PKfWnp9bNRB16sCXqo0GV8BRqW2KlfklCqpFfdjNDJPFnTJhxnVAzPG6WOMbiaCHhy+v7poV5QRMU1GztnRgPqQL/SX4FxmjQq8KlFwBYarw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709632006; c=relaxed/simple;
	bh=GIHEvLVCZDI3FBLR/m+GNLPhfMTkP949cLdjP39w8X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SycpQXWi8aza/Gk0LkOJ7PZZ6FHYIitSqjC3ylgT2/1H/HuKAO0KERWUjxlVtSkpoLKwVhod4wu9PDCrnGnwsmvgLm0Lcqxp/afQHeA1FDGsqP9U2OXEtcHQi7VT8VaoMWHlFY1Ap+lwLpiLp/OcN4H1AY4QGGKcXRKkNkxf7O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFFNwaAe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFFNwaAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709632004; x=1741168004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIHEvLVCZDI3FBLR/m+GNLPhfMTkP949cLdjP39w8X0=;
  b=nFFNwaAeLWKz8iKou+wFHLYyymKIVGj6y6ag6H+AiuGmEplmI/kqezwg
   /thDSDONH4hQhn/lltX1wQWWZ/sN6F8BFJNnc4fE9sc26QqlJGc5nWfBR
   RS1xON7A7XHgIWQdh/H0IXmTkHG46iSPsby2xlztVAwGTGNcw6caXWzuG
   L4mWdKzQmIRr8aYeFUr7DlHAbGJWeeWTnFgr2kmmr49qTFX6tUoiLhE47
   mtDsynn67Gqrvoa3PM9/RkvqrNY0i3L+eMf5Jg7O4Em0A7Vrxu1GSIZ5l
   IvQKsfOfEMP2A7XNYQppxzfGMZUwMFrkcVahyVP6T1OWGqctRB4miWt17
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4029872"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4029872"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14000742"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 01:46:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhRNe-0003DA-0A;
	Tue, 05 Mar 2024 09:46:38 +0000
Date: Tue, 5 Mar 2024 17:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/intel/ice/ice_ptp.c:2761:35: error: implicit
 declaration of function 'convert_art_ns_to_tsc'
Message-ID: <202403051712.U4eugJQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 46afaee1d54b15e084dfe90ffec3eea5ba7d65c8 ice: update E810 100g nic driver
date:   9 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051712.U4eugJQP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051712.U4eugJQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051712.U4eugJQP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_get_syncdevicetime':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2761:35: error: implicit declaration of function 'convert_art_ns_to_tsc' [-Werror=implicit-function-declaration]
    2761 |                         *system = convert_art_ns_to_tsc(hh_ts);
         |                                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2761:35: error: incompatible types when assigning to type 'struct system_counterval_t' from type 'int'
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_funcs_e822':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:3249:13: error: implicit declaration of function 'boot_cpu_has' [-Werror=implicit-function-declaration]
    3249 |         if (boot_cpu_has(X86_FEATURE_ART) &&
         |             ^~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp.c:3249:26: error: 'X86_FEATURE_ART' undeclared (first use in this function); did you mean 'X86_FEATURE_ANY'?
    3249 |         if (boot_cpu_has(X86_FEATURE_ART) &&
         |                          ^~~~~~~~~~~~~~~
         |                          X86_FEATURE_ANY
   drivers/net/ethernet/intel/ice/ice_ptp.c:3249:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/intel/ice/ice_ptp.c:3250:26: error: 'X86_FEATURE_TSC_KNOWN_FREQ' undeclared (first use in this function)
    3250 |             boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/convert_art_ns_to_tsc +2761 drivers/net/ethernet/intel/ice/ice_ptp.c

  2745	
  2746		for (i = 0; i < MAX_HH_LOCK_TRIES; i++) {
  2747			/* Wait for sync to complete */
  2748			hh_art_ctl = rd32(hw, GLHH_ART_CTL);
  2749			if (hh_art_ctl & GLHH_ART_CTL_ACTIVE_M) {
  2750				udelay(1);
  2751				continue;
  2752			} else {
  2753				u32 hh_ts_lo, hh_ts_hi, tmr_idx;
  2754				u64 hh_ts;
  2755	
  2756				tmr_idx = hw->func_caps.ts_func_info.tmr_index_assoc;
  2757				/* Read ART time */
  2758				hh_ts_lo = rd32(hw, GLHH_ART_TIME_L);
  2759				hh_ts_hi = rd32(hw, GLHH_ART_TIME_H);
  2760				hh_ts = ((u64)hh_ts_hi << 32) | hh_ts_lo;
> 2761				*system = convert_art_ns_to_tsc(hh_ts);
  2762				/* Read Device source clock time */
  2763				hh_ts_lo = rd32(hw, GLTSYN_HHTIME_L(tmr_idx));
  2764				hh_ts_hi = rd32(hw, GLTSYN_HHTIME_H(tmr_idx));
  2765				hh_ts = ((u64)hh_ts_hi << 32) | hh_ts_lo;
  2766				*device = ns_to_ktime(hh_ts);
  2767				break;
  2768			}
  2769		}
  2770		/* Release HW lock */
  2771		hh_lock = rd32(hw, PFHH_SEM + (PFTSYN_SEM_BYTES * hw->pf_id));
  2772		hh_lock = hh_lock & ~PFHH_SEM_BUSY_M;
  2773		wr32(hw, PFHH_SEM + (PFTSYN_SEM_BYTES * hw->pf_id), hh_lock);
  2774	
  2775		if (i == MAX_HH_LOCK_TRIES)
  2776			return -ETIMEDOUT;
  2777	
  2778		return 0;
  2779	}
  2780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
