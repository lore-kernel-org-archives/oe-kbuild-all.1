Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA76B1C860B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 04:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802899; cv=none; b=thauZTI3UZMUslsmUdhoqeqFMUVyd/qGjISWyMCl0jaI+sIFuVACNOtkAuW69bmcfbrtwLhFkY+ual63/R6Z/7Gc3fwzz6HB5hP2IucaeDw0rTK7dzmNMod9mPWm7NJlfIb7NX12LkPQZt2EmIUFGOIR3jQ5+jvb/iAyk1CRHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802899; c=relaxed/simple;
	bh=gUsNh2/pXAFoKQc9jNhu0Vb12b/RcJfrCG+ITAUcIWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTLKxnw6G6kVUaaaDNLv0O8Vn5LA27B+r0HIo8lUVenne4SGJnsqsycqR0nu0/PCrmUulxd9Ksm+gr0bx/xpIdl+/ifsqTlXPfX8w1Qcv79UmC8/khegS4m6aisJcXjqB5TI5d7pt4M6ZCbjs22YQhtppOW1DDQIys5Dwdb+LT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H54Wx9kP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H54Wx9kP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747802898; x=1779338898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUsNh2/pXAFoKQc9jNhu0Vb12b/RcJfrCG+ITAUcIWo=;
  b=H54Wx9kPfSbgzxacpKxoot+8oId8OtAe2VhTVg9FykbdWrRZCuLCgWgE
   UaPJp3ir4J+uSFzEacCK8TL+LXX0Gx4oeAYDqsPtnhynTHi7C01iZ/war
   qr4Pp+g1hrdfjqqXaSW3sm8SGSQy3dBB04IwaZjCCd9OGwQAhPOaNDk10
   AQ1XeljqZSqYsxeKtGpyWTeYMA/9e+4r2LJJFeosV9tTT5FC/WqhPAknT
   94M1b3QhXoDdKB+joupVFfyxP1gf+2WvebPXGX+fGbqCNH++pOS3QPQNC
   ooq8nwfx79eIt+D5xhhWW5oB128i8B/rOEBU+GffOfi3ud6f7xyauOugW
   g==;
X-CSE-ConnectionGUID: YBS+rKrwRv6pkdjp42VRRA==
X-CSE-MsgGUID: x6yOylrOTEuFhQ3XAN7iPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49022983"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49022983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 21:48:17 -0700
X-CSE-ConnectionGUID: JrhOtdVFQU6EXR4lrDzp3A==
X-CSE-MsgGUID: n4kXt5QfRPmpASRn8ES1BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144639208"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 21:48:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHbNF-000Ns2-0Y;
	Wed, 21 May 2025 04:48:13 +0000
Date: Wed, 21 May 2025 12:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1]
 arch/x86/kernel/cpu/common.c:2128: undefined reference to
 `amd_check_microcode'
Message-ID: <202505211232.lS5X9tIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Borislav,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   19c222d1fa1b012550595ea81fc039b4b57d933e
commit: 00363ef30797211c247605464dc3daaa988531a2 [0/1] x86/cpu/amd: Add a Zenbleed fix
config: x86_64-randconfig-121-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211232.lS5X9tIn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211232.lS5X9tIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211232.lS5X9tIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/common.o: in function `microcode_check':
>> arch/x86/kernel/cpu/common.c:2128: undefined reference to `amd_check_microcode'


vim +2128 arch/x86/kernel/cpu/common.c

  2116	
  2117	/*
  2118	 * The microcode loader calls this upon late microcode load to recheck features,
  2119	 * only when microcode has been updated. Caller holds microcode_mutex and CPU
  2120	 * hotplug lock.
  2121	 */
  2122	void microcode_check(void)
  2123	{
  2124		struct cpuinfo_x86 info;
  2125	
  2126		perf_check_microcode();
  2127	
> 2128		amd_check_microcode();
  2129	
  2130		/* Reload CPUID max function as it might've changed. */
  2131		info.cpuid_level = cpuid_eax(0);
  2132	
  2133		/*
  2134		 * Copy all capability leafs to pick up the synthetic ones so that
  2135		 * memcmp() below doesn't fail on that. The ones coming from CPUID will
  2136		 * get overwritten in get_cpu_cap().
  2137		 */
  2138		memcpy(&info.x86_capability, &boot_cpu_data.x86_capability, sizeof(info.x86_capability));
  2139	
  2140		get_cpu_cap(&info);
  2141	
  2142		if (!memcmp(&info.x86_capability, &boot_cpu_data.x86_capability, sizeof(info.x86_capability)))
  2143			return;
  2144	
  2145		pr_warn("x86/CPU: CPU features have changed after loading microcode, but might not take effect.\n");
  2146		pr_warn("x86/CPU: Please consider either early loading through initrd/built-in or a potential BIOS update.\n");
  2147	}
  2148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
