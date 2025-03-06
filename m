Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D22907
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 20:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741294221; cv=none; b=S41N0LNwaUV4dqe9pA4wr0E0HTIQJgtIMqIyRGpkU6dN1ABw68ojlr2x2tqAG/84xiFER26kI8o9CuAL9NWzZ8ImEAhsPYmKhFHLIqgXj2zrKLhm2JrrFMDmAB6JLZIK90M1emDLEC8YWJ52IArLvWpITaX9U0XlGqwt47f0r6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741294221; c=relaxed/simple;
	bh=3tNRHJ4Pr6HVjy7wXrWjL5/pC4QrmOkJg86XRD13UsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls4bfyDyyHCkbAb6JhmSby9dITRA32AXScCUCOTDdeMFH/4nt1RqxeuP/XhG16M/e9hFgbmqqkyggFZjeFybloudDSFYgiS9srpNNRBGpPiHAkSfQJxNr3Lzxg2nhtVImbJBulzV/leoDmvhwuuwe24Xqkx+BwpZcQYQ5cWR+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkBQlDAD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkBQlDAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741294220; x=1772830220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3tNRHJ4Pr6HVjy7wXrWjL5/pC4QrmOkJg86XRD13UsI=;
  b=RkBQlDADng4c4os5mt30eBs8Vlm65MgFOhib0aivB70XuoYZ71OchANy
   9+womBwCDB4XqdMtOrcMUbLE1wnfb8nd49a5PeEoyVN5gvnwQd9CIGs8N
   uTms8vb1l0bfNF7H7mhSFo1OD5XLY5V8Ud0jC3lYvOCtSpPikK2dxuX+C
   W7ACKsBqtR9cUL4XYnUyyr2nS1WoSOCn7+kuvwCEKUkbqmGYGbDkNbZKm
   di8l1CSdUJ4JPvOoko9pdb4+wWoRRWa4PNqE3/6+Id0MP8UYsVaVZ0W8a
   kQWQkP+dSqunZ7d7XDE2aqudUEdn9aCgIT+T6E9lNDEH4m1b8zFW/hFTU
   w==;
X-CSE-ConnectionGUID: BjWSLLZuSFOITeuxOFetaw==
X-CSE-MsgGUID: Ez2T4NV0Rgy30UbFkQOozw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41502035"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="41502035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:50:19 -0800
X-CSE-ConnectionGUID: TudPdwhRQ36B4Q8l5rS9qA==
X-CSE-MsgGUID: +eKc9vHyQBqbYlpuqDcKcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119052139"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2025 12:50:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqIAQ-000NbU-35;
	Thu, 06 Mar 2025 20:50:06 +0000
Date: Fri, 7 Mar 2025 04:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 05/14] KVM: arm64: Use a cpucap to determine if system
 supports FEAT_PMUv3
Message-ID: <202503070411.qUPIzPzm-lkp@intel.com>
References: <20250305202641.428114-6-oliver.upton@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305202641.428114-6-oliver.upton@linux.dev>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ad2507d5d93f39619fc42372c347d6006b64319]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Upton/drivers-perf-apple_m1-Refactor-event-select-filter-configuration/20250306-043329
base:   0ad2507d5d93f39619fc42372c347d6006b64319
patch link:    https://lore.kernel.org/r/20250305202641.428114-6-oliver.upton%40linux.dev
patch subject: [PATCH v3 05/14] KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250307/202503070411.qUPIzPzm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070411.qUPIzPzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070411.qUPIzPzm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:1901:13: warning: 'has_pmuv3' defined but not used [-Wunused-function]
    1901 | static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
         |             ^~~~~~~~~


vim +/has_pmuv3 +1901 arch/arm64/kernel/cpufeature.c

  1900	
> 1901	static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
  1902	{
  1903		u64 dfr0 = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
  1904		unsigned int pmuver;
  1905	
  1906		/*
  1907		 * PMUVer follows the standard ID scheme for an unsigned field with the
  1908		 * exception of 0xF (IMP_DEF) which is treated specially and implies
  1909		 * FEAT_PMUv3 is not implemented.
  1910		 *
  1911		 * See DDI0487L.a D24.1.3.2 for more details.
  1912		 */
  1913		pmuver = cpuid_feature_extract_unsigned_field(dfr0,
  1914							      ID_AA64DFR0_EL1_PMUVer_SHIFT);
  1915		if (pmuver == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
  1916			return false;
  1917	
  1918		return pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP;
  1919	}
  1920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
