Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51319148838
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 22:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727303207; cv=none; b=tQNWlNbCw6jYjSR2ffjVBsxTgU0imqbCRg9WqozHdo5C3vqGB6rLmhKXdGfFpI4CG3xGgTYdB5vXMq2eHe1rDqPpZamldxbkOnpktJok6V7mVCoGjf8Jo6T/DWJSaavqJ6TT/GKZAdvGv2Fsao+GP50tWOGTsthVUBH1nM05a40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727303207; c=relaxed/simple;
	bh=tF0jZejooZkn6ekXu0lkiXouPMwONHS5GiS18ZFRC3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3JxswUJJc/OlzR17v1WS/bRQDk5Vxd0FWzIq5HPIglPdBpYAcHqvJo58OK6q2UcBUY5naK1dp3mxPX5PDP+IrMdCf/oeeeyS2mHwj8YbZHlzDjOneIG4y+Wkua/mxcDjTPc6H1iZQlQvpKhpCQJTMhaSiVMPQ86CR0wP53z53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVxBQUj8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVxBQUj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727303204; x=1758839204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tF0jZejooZkn6ekXu0lkiXouPMwONHS5GiS18ZFRC3w=;
  b=HVxBQUj8tAPsXhyG47b71iF86bFOUzW9KGq/NqC4yruxqazmZw8ca3gt
   C7qBpLeDBUBdJE4GPBbq84OqcOGcVuowF93JTJJfzLrEGNmR+f2ms7McV
   aS0FbtwPeb44R70bOQzT54EbaqhsJh0guWPIyqKc1LIB6whDXuzLCz20f
   xK1TcJKxKZdNuhfB9s9kRUMgZUEUxovn2zGOIH4SoZDakohal4ZauVJEj
   bOs0oDmZ4TlbrBwUzojcRU+Vyq0Nxp1j+KXbuNoBw/XaN8BaAX9ZmZk/u
   qmHfdLiwqT8HINo9Xnm8tYdGsYOTMUkMRh1cw26l9OWHo5WcIP4IzXxST
   A==;
X-CSE-ConnectionGUID: 5ZntiYCZScKf28MhI+PZPg==
X-CSE-MsgGUID: 3SQRVGMmRLa+xXJ5lOd/Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37732374"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="37732374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:26:43 -0700
X-CSE-ConnectionGUID: 99r5SewzQ72z/D69v6rH6g==
X-CSE-MsgGUID: OIfGPLkxQJCCMAS9KBgMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="95251616"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Sep 2024 15:26:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1staSz-000Jzz-32;
	Wed, 25 Sep 2024 22:26:37 +0000
Date: Thu, 26 Sep 2024 06:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 3/2443]
 drivers/net/ethernet/intel/ice/ice_ptp.c:2761:35: error: implicit
 declaration of function 'convert_art_ns_to_tsc'
Message-ID: <202409260619.Cn5af6Vu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 7d0110e49bdc1f56083058dc9f4ea82ce9ca39f9 [3/2443] ice: update E810 100g nic driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409260619.Cn5af6Vu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260619.Cn5af6Vu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260619.Cn5af6Vu-lkp@intel.com/

Note: the opencloudos/linux-5.4/lts/5.4.119-20.0009.spr HEAD 9d665359e14c559b74a94a55057e9c0fbd31a81a builds fine.
      It only hurts bisectability.

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
