Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1835E1DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260198; cv=none; b=OXZ3HJBIHmKkLUFJaYLTel7FHzDR3iBUJgQsKPGUF1pohP1WIqKLsBGDmLECUPfJjPEbPZd8YGTa3M/uR2y8NmeNaG625cSWbhfIK1UDtevruLCPLVC987TY1nkr2KDZiH9/GWkYX4VBQcKGqycbYt/vQ6nYyFZuNbGGI3Ss13U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260198; c=relaxed/simple;
	bh=MRXOkGvRggX5TjWjGyoj/7X0pXnGrU+vae+SgZDT4HE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMhWMcX1b4jMX9PN2gPNPq9ykMqbSHOVXn5O+/q3h/hMYpdL/J1INMAiFujJat77ZnMbvq0KaXogc9VUputzaWJP7vOS++xGkZotvvZ4Lgibh014KvZAf8A/KNW/djmd+PgvBClL6MyU7V0SwocSXtX2ytmgPT142Xf782KFl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXae6l3j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXae6l3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781260197; x=1812796197;
  h=date:from:to:cc:subject:message-id;
  bh=MRXOkGvRggX5TjWjGyoj/7X0pXnGrU+vae+SgZDT4HE=;
  b=cXae6l3j1l8dFq+EhUf6iLg5NgUX3i4vjStwei7CD74xfebsd0nTRO4i
   rksOlwXYM5ygJtIUlbaG6HlzpWhG8K6EqAuZRkJ6rXUqkb9XjdHz7w/NU
   0IGFH5hW5H59Hs0faUIUewNDIDcNaNnNwn2eBrliGjOMNuFLdUhdyIelj
   OKNBDk07n1x8mIuWIYrZPf8boZzvl85LHu8iMuEcwzZpHZUdx1zSfKYGn
   pz393d3FEGQ5Ko/MYMfyz8b/1L+ChwROsEZIDXwr27VDcPd+0UAq4Ato2
   UeEo8kGPCsNGENFpYHLqAdfTgHVjQ3JMs5fIaBK678+6mIMdur8izBG72
   g==;
X-CSE-ConnectionGUID: ER0/fd4JSBKdwV/p5YFuPw==
X-CSE-MsgGUID: Mrsrsi/+SHCGR8NGg1EBCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92409614"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92409614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 03:29:56 -0700
X-CSE-ConnectionGUID: +eLpJGN6QOq7Rlo+8cn/RQ==
X-CSE-MsgGUID: 9oEz1F5bTxG+Ro32o91BUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="243853030"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2026 03:29:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXz95-00000000Ocf-3vYC;
	Fri, 12 Jun 2026 10:29:51 +0000
Date: Fri, 12 Jun 2026 18:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock6 12/36] arch/x86/kvm/x86.c:3249:1: warning:
 label 'fallback' defined but not used
Message-ID: <202606121847.WMpRF92x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock6
head:   f0cde567611e75fa2459c24c7aea06d619f07f8b
commit: 0dba225ab43627430d6b2f8be1143ea133116e96 [12/36] KVM: x86: Restructure get_kvmclock()
config: i386-buildonly-randconfig-004-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121847.WMpRF92x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121847.WMpRF92x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121847.WMpRF92x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'get_kvmclock':
>> arch/x86/kvm/x86.c:3249:1: warning: label 'fallback' defined but not used [-Wunused-label]
    3249 | fallback:
         | ^~~~~~~~
>> arch/x86/kvm/x86.c:3206:39: warning: unused variable 'hv_clock' [-Wunused-variable]
    3206 |         struct pvclock_vcpu_time_info hv_clock;
         |                                       ^~~~~~~~


vim +/fallback +3249 arch/x86/kvm/x86.c

  3202	
  3203	static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
  3204	{
  3205		struct kvm_arch *ka = &kvm->arch;
> 3206		struct pvclock_vcpu_time_info hv_clock;
  3207		unsigned int seq;
  3208	
  3209		do {
  3210			seq = read_seqcount_begin(&ka->pvclock_sc);
  3211	
  3212			data->flags = 0;
  3213	#ifdef CONFIG_X86_64
  3214			if (ka->use_master_clock) {
  3215				struct timespec64 ts;
  3216	
  3217				/*
  3218				 * The RDTSC and get_cpu_tsc_khz() must happen on
  3219				 * the same CPU.
  3220				 */
  3221				get_cpu();
  3222	
  3223				if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
  3224					data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
  3225					data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
  3226				} else {
  3227					/*
  3228					 * Clock read failed (e.g. clocksource is
  3229					 * transitioning away from TSC). Fall back to
  3230					 * the non-master-clock path rather than
  3231					 * spinning.
  3232					 */
  3233					put_cpu();
  3234					goto fallback;
  3235				}
  3236	
  3237				data->flags |= KVM_CLOCK_TSC_STABLE;
  3238				hv_clock.tsc_timestamp = ka->master_cycle_now;
  3239				hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
  3240				kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
  3241						   &hv_clock.tsc_shift,
  3242						   &hv_clock.tsc_to_system_mul);
  3243				data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
  3244	
  3245				put_cpu();
  3246			} else
  3247	#endif
  3248			{
> 3249	fallback:
  3250				data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
  3251			}
  3252		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3253	}
  3254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
