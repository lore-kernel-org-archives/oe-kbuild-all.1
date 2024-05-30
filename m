Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A9F1078B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717066775; cv=none; b=Hu5dmhi++dIR9OLYcZUtguoF8hMszWRyCY+808Tjl716iMOrKZxAZ1OjxDn0QM7EzbuiDnasst0X1QHCngy70FMeE2KZDNgHfyKalfzZKecJpjYL3cysrWluLngrkUIYLo/m4k8hY0RKi1uDN3A0Fgu42dFiXUv5XHthsIBR66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717066775; c=relaxed/simple;
	bh=zkGFf7BciGBAFc3xVoS0J6KhlXNzUA8OhcNmI7OYl4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAGyDflQ8KfcVnSv+KBb/Y3rNBOeLn6/Hhvr1MYidPX9c94oPP8HKoEXKP8tvWUd6gWdONNQcLJt1NdwxMQLfc5aMUVpFUJccnbhk4q9Cxgyl3IFnlfjRqcJaASUaidKte8dSBhepwg78O41+0sp2qebhAhxDbDgaPoDsxRvTig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJ9s4MV+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJ9s4MV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717066773; x=1748602773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zkGFf7BciGBAFc3xVoS0J6KhlXNzUA8OhcNmI7OYl4M=;
  b=HJ9s4MV+8pXvCxowZCCZs5+21cK5eXSoJFGVo0ByPQvrfrBegALlLePS
   SgirP8R2kR4TBzOpCc8VTnAemzpyDUKDEleryTXw9aLgUR6EnDIBa2T/1
   DMBVaIAKJd0p2zp43J4MnWG9TRNC1Kzoa3NAFqIiGbMvAcygOTjfPuT70
   D3sXobOzQvdlXVFe6ua4N2/8ILCP/2AnXwHjrcoWfOsCqa8dXGMjM5r9O
   01lk7vTYzvChkid7qMZ0DE1aJxf6p7ExpO6tx/td+RUhbx5usaJrD4L+N
   L2/FirSv0onJyOSWEbVEEsOdDDATv91xeFdXkX7131OogYrLKl2chZ0ks
   Q==;
X-CSE-ConnectionGUID: +4rTIvXOSeeV5oWt1QFq3g==
X-CSE-MsgGUID: nzVQA6ABRdy+ry+QYNZSAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31061281"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31061281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:59:33 -0700
X-CSE-ConnectionGUID: AOgRtLypSwyim5dCdDgRRw==
X-CSE-MsgGUID: DQ4T4F7QTvqbUiGIGSX+Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35719958"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:59:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCdVJ-000FCl-0L;
	Thu, 30 May 2024 10:59:29 +0000
Date: Thu, 30 May 2024 18:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] perf/x86: Enable NMI source reporting for perfmon
Message-ID: <202405301804.X6sdnktq-lkp@intel.com>
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
config: i386-randconfig-051-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301804.X6sdnktq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301804.X6sdnktq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301804.X6sdnktq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/core.c:3096:26: error: use of undeclared identifier 'apic_perfmon_ctr'
    3096 |                 apic_write(APIC_LVTPC, apic_perfmon_ctr);
         |                                        ^
   arch/x86/events/intel/core.c:3133:26: error: use of undeclared identifier 'apic_perfmon_ctr'
    3133 |                 apic_write(APIC_LVTPC, apic_perfmon_ctr);
         |                                        ^
   arch/x86/events/intel/core.c:3146:26: error: use of undeclared identifier 'apic_perfmon_ctr'
    3146 |                 apic_write(APIC_LVTPC, apic_perfmon_ctr);
         |                                        ^
   3 errors generated.


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
