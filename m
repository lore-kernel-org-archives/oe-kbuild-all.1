Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06DB3BCD1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081555; cv=none; b=EurgvLNQLjO0ZSg+cigMg0Mzbo3VgXv+GLlHV0tRkhnVkzKYqax+xNCyeOxEapfSoG4vWdACZqT3QEOKUqYVvX9pU1zEsSZPpZ80HJrfcTZoBloAGkgV4FozDsYkJBBX7Xa8FCPdwcSAIPu/F112a/thkqmBxMRvNB5gIIxhe/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081555; c=relaxed/simple;
	bh=Z35Odu81Axaukv1esulKnruFTRIv+EPCKk3BS2/OukU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hsiFv+U3iwzM3fDE5TfBdFJKj9er5c/U7xraZuL4KqB8mLBh4L71FoqFO0VaBw6IkdLwJDGAoESeO0bDORVHKlGkzBygKKDTXz0kniQRxwHr4CSQ4+Z28Z1hILqYhGgBVOr5S9/u08A3kDN7u8XG60ounraulRV1sX5fyL1mIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gda99KFI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gda99KFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781081554; x=1812617554;
  h=date:from:to:cc:subject:message-id;
  bh=Z35Odu81Axaukv1esulKnruFTRIv+EPCKk3BS2/OukU=;
  b=gda99KFIDOZQWoWjQuJDehMftbx2d8r2U6E6oPJxW3S1GNV1A48fgJls
   tFeeop6388E51JOAkP0/towP4AtVNcOdtnQGGizgB0QSXIDePE3Kyk8SL
   Lde+7z/oScTl9JWE2SesYAmCiGYLMXw/9vtZ7JwP+lO5iALL+cVjdIxot
   fV/NVSzK00dvRD2jJ2tFLsXX9OnNWv4HCr2hf4MMXI3W7O2Wlxs96niv7
   Uc4t/OTCmt79RQ7M6zSX4iCGf8Syx0Q+kjbdB1E8jz1nb4697lHi/izO9
   kV0q8nzeZUlYgWqC+9TOg0gXpf9qjyUIkpOkcY0EZVxhjeE4Q1faghcgk
   w==;
X-CSE-ConnectionGUID: T4Kmtfo1SrKzxQgB8YQqCQ==
X-CSE-MsgGUID: joYAd9wVRniPT4yVogyCDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="80885283"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="80885283"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:52:33 -0700
X-CSE-ConnectionGUID: CAK2q+5ITPK4BajsuLgoqQ==
X-CSE-MsgGUID: KIIZ+OerTu+J1BqpHFGqVQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2026 01:52:32 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXEfl-000000003en-4BC1;
	Wed, 10 Jun 2026 08:52:29 +0000
Date: Wed, 10 Jun 2026 10:52:04 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 10/51]
 arch/x86/coco/tdx/tdx.c:1210:68: error: expected ';' before '}' token
Message-ID: <202606101015.4bd77SEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   03e00f8b41e58b5dd5ceef21940a62e5d8e08766
commit: 744956b9c18116e3ae2e098633a6a5ee1e144591 [10/51] x86/tdx: Force TSC frequency with CPUID-based info provided by the TDX-Module
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260610/202606101015.4bd77SEJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101015.4bd77SEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101015.4bd77SEJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/tdx/tdx.c: In function 'tdx_tsc_init':
>> arch/x86/coco/tdx/tdx.c:1210:68: error: expected ';' before '}' token
    1210 |         return info.crystal_khz * info.numerator / info.denominator
         |                                                                    ^
         |                                                                    ;
    1211 | }
         | ~                                                                   


vim +1210 arch/x86/coco/tdx/tdx.c

  1196	
  1197	unsigned int __init tdx_tsc_init(void)
  1198	{
  1199		struct cpuid_tsc_info info;
  1200	
  1201		if (WARN_ON_ONCE(cpuid_get_tsc_info(&info) || !info.crystal_khz))
  1202			return 0;
  1203	
  1204		apic_set_timer_period_khz(info.crystal_khz, "TDX-Module via CPUID");
  1205	
  1206		/* TSC is the only reliable clock in TDX guest */
  1207		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
  1208		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
  1209	
> 1210		return info.crystal_khz * info.numerator / info.denominator

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
