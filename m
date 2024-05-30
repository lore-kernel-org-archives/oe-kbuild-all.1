Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB27143737
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717049673; cv=none; b=AlFanmjXNawpUzSeHMR55U+04bv2Q1lAVOWGwg2JS9PUtF7ReP4sTkY5lyEsackl94VX7gCk7VeSV7kgXKS3GkbCAb7TNj9pPJIqAIlMeqflGxTFJVKtKQq/2P1v3EskDTGs6D7aFEAqRWA8uoz295MWI23DuWcBUGPHCsNk1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717049673; c=relaxed/simple;
	bh=tTtXpV0h3bQe9G8QsvlUCdX22HRiw6desFyK8GPFQGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWPHwO65xKT0gtsBtGy/Tfp8xBny+o7G+eAUt0AYAuvFmR4TqiGIgrcVZMV0YMoe0FBGISphzWxOvPAhh+a+VXNknMhWUOf4XE42BHVcV3Bh46nSLlnpPWaCat+zM/iaP0ddEV6BNZMRvawbNPRspWpJlvMxfYMM6aWGY6jJB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMa+Ux6b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMa+Ux6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717049672; x=1748585672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tTtXpV0h3bQe9G8QsvlUCdX22HRiw6desFyK8GPFQGE=;
  b=aMa+Ux6brCbSknlymMbyxQ4YHpmhoUovLgSqRfK90YJnxhB2mnvwMAF1
   01aWwG1EMLlkdMFgM7QEuSSiuoFymxGzUuzLdBms5PY/s66HZafgvSECm
   Q3Dl5Hwgvu92Bidp3lMY3vtMzrM9LOmPdqsq6JVxiJHVL4V/4+BjM9XNF
   WAFVu+6kWJ5BueXBGqYRBDMPQXm1xYwRH3qlbL/K6TFmo5rlvcFkBWkJb
   wtbJBYpxG/EEI9NAF0+ua/BrPVs1PlQE9hfA+CnESsC8xp/vp8DLhs2RA
   dwvHq6U4pwkbv0A0fHFaCA12Qzt2QEw2+f17JVRiZtRZMaHRG8XVO2w8j
   A==;
X-CSE-ConnectionGUID: 5aTkGiYLTIWRTW4EkMnj8Q==
X-CSE-MsgGUID: iXuvYkjGTbiBvQwNruw5Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38894474"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="38894474"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 23:14:32 -0700
X-CSE-ConnectionGUID: /uj3kZtWQE+exZw3FJFpXQ==
X-CSE-MsgGUID: /Ggt4ZiiQEupZB6IZV7Dag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35688776"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2024 23:14:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCZ3T-000Ern-2O;
	Thu, 30 May 2024 06:14:27 +0000
Date: Thu, 30 May 2024 14:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] perf/x86: Enable NMI source reporting for perfmon
Message-ID: <202405301242.LFkK3Hcm-lkp@intel.com>
References: <20240529203325.3039243-6-jacob.jun.pan@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529203325.3039243-6-jacob.jun.pan@linux.intel.com>

Hi Jacob,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on perf-tools/perf-tools linus/master v6.10-rc1 next-20240529]
[cannot apply to tip/perf/core tip/x86/core acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Pan/x86-irq-Add-enumeration-of-NMI-source-reporting-CPU-feature/20240530-043112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240529203325.3039243-6-jacob.jun.pan%40linux.intel.com
patch subject: [PATCH 5/6] perf/x86: Enable NMI source reporting for perfmon
config: i386-randconfig-012-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301242.LFkK3Hcm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301242.LFkK3Hcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301242.LFkK3Hcm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/events/intel/core.c: In function 'intel_pmu_handle_irq':
>> arch/x86/events/intel/core.c:3096:40: error: 'apic_perfmon_ctr' undeclared (first use in this function)
    3096 |                 apic_write(APIC_LVTPC, apic_perfmon_ctr);
         |                                        ^~~~~~~~~~~~~~~~
   arch/x86/events/intel/core.c:3096:40: note: each undeclared identifier is reported only once for each function it appears in


vim +/apic_perfmon_ctr +3096 arch/x86/events/intel/core.c

  3067	
  3068	/*
  3069	 * This handler is triggered by the local APIC, so the APIC IRQ handling
  3070	 * rules apply:
  3071	 */
  3072	static int intel_pmu_handle_irq(struct pt_regs *regs)
  3073	{
  3074		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
  3075		bool late_ack = hybrid_bit(cpuc->pmu, late_ack);
  3076		bool mid_ack = hybrid_bit(cpuc->pmu, mid_ack);
  3077		int loops;
  3078		u64 status;
  3079		int handled;
  3080		int pmu_enabled;
  3081	
  3082		/*
  3083		 * Save the PMU state.
  3084		 * It needs to be restored when leaving the handler.
  3085		 */
  3086		pmu_enabled = cpuc->enabled;
  3087		/*
  3088		 * In general, the early ACK is only applied for old platforms.
  3089		 * For the big core starts from Haswell, the late ACK should be
  3090		 * applied.
  3091		 * For the small core after Tremont, we have to do the ACK right
  3092		 * before re-enabling counters, which is in the middle of the
  3093		 * NMI handler.
  3094		 */
  3095		if (!late_ack && !mid_ack)
> 3096			apic_write(APIC_LVTPC, apic_perfmon_ctr);
  3097		intel_bts_disable_local();
  3098		cpuc->enabled = 0;
  3099		__intel_pmu_disable_all(true);
  3100		handled = intel_pmu_drain_bts_buffer();
  3101		handled += intel_bts_interrupt();
  3102		status = intel_pmu_get_status();
  3103		if (!status)
  3104			goto done;
  3105	
  3106		loops = 0;
  3107	again:
  3108		intel_pmu_lbr_read();
  3109		intel_pmu_ack_status(status);
  3110		if (++loops > 100) {
  3111			static bool warned;
  3112	
  3113			if (!warned) {
  3114				WARN(1, "perfevents: irq loop stuck!\n");
  3115				perf_event_print_debug();
  3116				warned = true;
  3117			}
  3118			intel_pmu_reset();
  3119			goto done;
  3120		}
  3121	
  3122		handled += handle_pmi_common(regs, status);
  3123	
  3124		/*
  3125		 * Repeat if there is more work to be done:
  3126		 */
  3127		status = intel_pmu_get_status();
  3128		if (status)
  3129			goto again;
  3130	
  3131	done:
  3132		if (mid_ack)
  3133			apic_write(APIC_LVTPC, apic_perfmon_ctr);
  3134		/* Only restore PMU state when it's active. See x86_pmu_disable(). */
  3135		cpuc->enabled = pmu_enabled;
  3136		if (pmu_enabled)
  3137			__intel_pmu_enable_all(0, true);
  3138		intel_bts_enable_local();
  3139	
  3140		/*
  3141		 * Only unmask the NMI after the overflow counters
  3142		 * have been reset. This avoids spurious NMIs on
  3143		 * Haswell CPUs.
  3144		 */
  3145		if (late_ack)
  3146			apic_write(APIC_LVTPC, apic_perfmon_ctr);
  3147		return handled;
  3148	}
  3149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
