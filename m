Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE62C031E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781129642; cv=none; b=fhlPyuaYb0dfsUhIVTjh7moq35i8MB3JADNKRy84tmXWxDqkA0797aRY23/Q2XRzM+qeRLd0EVF0pL1Jo096JFrKgVBhWYrw7PeMMBPD5H7H0FOTtDle0TIkZ0dCROLnGPYEAWwQgEbw67VJqdgnB77GSzl5dyxKg2Q3K2Rm1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781129642; c=relaxed/simple;
	bh=jwtqbhEDlRV/I7vziFFafN67qGO+fZansX3zzS1IjXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LUh2DY3b5wVl15rLQ2GFWYHYulSvsNqRBZw4JEfIq6NwC6HBGJcqpSRBLBFP4XBSD8cIj0nY4eAoYZ0/w/9jL8subMI761B25mwWyB+XJYKfdO6wTYTmhMPoT0PFxECsn8Hf0MfPO1VgPyxHL/0m7AcwLaSAVe4xOCBweez0PJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PP4kQU88; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PP4kQU88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781129641; x=1812665641;
  h=date:from:to:cc:subject:message-id;
  bh=jwtqbhEDlRV/I7vziFFafN67qGO+fZansX3zzS1IjXA=;
  b=PP4kQU88pYEQZXmwgCCH/qraTfjvjJAPeuvVF9ni98q6d0lFu05d94Dh
   ZxCfauCCqDUCGzYX0sMg7dac7XfqdRfKIVMUspoHz88jlda5XAmNmR5Bp
   gxBYT5qoLPSS0C7pORdbvwAOF4k/IOqeFcvYD+IEGL6wVJrCRnc9udqXh
   e/WRizAwmWCMCuVNcyJcRLS5jSLWD1cLD1yEAy6mWiqesB/TzOBxgTNIx
   NAfTfxI+CvEclpq5/sPlGAyVpkH5uUMHoSjhjDkIULCytv/vLrU8JvK1T
   h3YuNWwmiKvjWtNMNqJ/LBbQhO+hXA1HCanywbDVQiujfAUUlItoy25Vp
   w==;
X-CSE-ConnectionGUID: eRyLwwHeSb+dOx7xoM8l/w==
X-CSE-MsgGUID: rqaz8MkLTgOA/shaOgVvUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81841749"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81841749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 15:14:00 -0700
X-CSE-ConnectionGUID: 51CRudeKRvSk0BWLuSvBhw==
X-CSE-MsgGUID: YQKdhZLyR3yO/k8ljx9PtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="276500380"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jun 2026 15:13:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXRBM-00000000LxO-3SKv;
	Wed, 10 Jun 2026 22:13:56 +0000
Date: Thu, 11 Jun 2026 06:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 10/51]
 arch/x86/coco/tdx/tdx.c:1210:68: error: expected ';' before '}' token
Message-ID: <202606110642.OEVHppWj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   03e00f8b41e58b5dd5ceef21940a62e5d8e08766
commit: 744956b9c18116e3ae2e098633a6a5ee1e144591 [10/51] x86/tdx: Force TSC frequency with CPUID-based info provided by the TDX-Module
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260611/202606110642.OEVHppWj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110642.OEVHppWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110642.OEVHppWj-lkp@intel.com/

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
