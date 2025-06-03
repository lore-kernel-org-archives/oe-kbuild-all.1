Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801218E1F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 08:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938850; cv=none; b=rgL/+v4K1Jz3QlIcKDp42Sdj/Wr79ysJ8aYlcUHEB1myi2aVRIPOTYY2XGRQav1OO6iZP/c2CxKu9i19Hd18jazTWerrScUPwT1d2OmOsHgaN98aa6EugT0j8QgTOg6Ath7hW1lHKzIzu+bus4XbPS7Qk2eXjqlEVx2/EtOj5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938850; c=relaxed/simple;
	bh=/tuDEZh5mLdPSvhFKf8gH9mmd7J2csAJVwfa1FlYr+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOe4uKN3dxakkp6ww4Hk1+CSCoZOvMvc1AcRC1+39coXpsPnZMqFy340lY4pejrHPQwikdPZJeF8ppm5zfyqODpr2a7PlRalpwHwfSepuvMLImWAT3v1mGOFZYjri9byhKWp5oryQhBEj9eKnNwjs6WzDNEuz8OYZLUArO9I9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnKwoHPZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnKwoHPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748938848; x=1780474848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/tuDEZh5mLdPSvhFKf8gH9mmd7J2csAJVwfa1FlYr+k=;
  b=GnKwoHPZPDdcCnSHxJbDrYIvbTPNva9Z8rFQuOo4O4ACw+ZO5BHs7pJA
   gnCWZloIovYd/TSipe5j5QQLaLd3jEodCnayyFro91jMHaSev68lotM7z
   NGuQx1HGGnj6F/YHMyrONNS4IuPT7SbtJlJeQFI/y6NKhiwp2IEa3lQYX
   GdAF/k0/6t+PF0eiDLzABN8Q7W/igCqKFiJEqXArW7dp0gsdstwiQKFNV
   9uOOKPqRgYIN5LKH11zeRBXyN2jv/kAu/OWIK6QJTGNsC6ueaj3fhipgT
   veNy2wVINMqJg75dlNSXE46MS8u6sl66LNty9ttBobIKJjEufYoZkxQcG
   Q==;
X-CSE-ConnectionGUID: O9fQKGk+Q5SIhR49M0NfEQ==
X-CSE-MsgGUID: GEe8Z3dpTh+sLy2WJBMukg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51069616"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="51069616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 01:20:47 -0700
X-CSE-ConnectionGUID: ggqKJh4UQU2CjeGFIk+Fbg==
X-CSE-MsgGUID: C0ruJaSiSlq7DTi0HKYp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="145114863"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2025 01:20:46 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMMt2-0001SM-1l;
	Tue, 03 Jun 2025 08:20:44 +0000
Date: Tue, 3 Jun 2025 16:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for
 'kx7000_uncore_cpu_init'
Message-ID: <202506031655.e9KhPxkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97c2d1a4aa1430a6305c949fa1f72efe454c946d
commit: 25fd62f6e8c9636272009dfcbe04fb1a260cbf8d [2195/2195] perf/x86/zhaoxin/uncore: update KX-7000 support
config: x86_64-buildonly-randconfig-2002-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031655.e9KhPxkV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031655.e9KhPxkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031655.e9KhPxkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/zhaoxin/uncore.c:2798:6: warning: no previous prototype for 'kx5000_uncore_cpu_init' [-Wmissing-prototypes]
    2798 | void kx5000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2807:6: warning: no previous prototype for 'kh40000_uncore_cpu_init' [-Wmissing-prototypes]
    2807 | void kh40000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/zhaoxin/uncore.c:2812:5: warning: no previous prototype for 'kh40000_uncore_pci_init' [-Wmissing-prototypes]
    2812 | int kh40000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2828:6: warning: no previous prototype for 'kx7000_uncore_cpu_init' [-Wmissing-prototypes]
    2828 | void kx7000_uncore_cpu_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2843:5: warning: no previous prototype for 'kx7000_uncore_pci_init' [-Wmissing-prototypes]
    2843 | int kx7000_uncore_pci_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/events/zhaoxin/uncore.c:2851:6: warning: no previous prototype for 'kx7000_uncore_mmio_init' [-Wmissing-prototypes]
    2851 | void kx7000_uncore_mmio_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kx7000_uncore_cpu_init +2828 arch/x86/events/zhaoxin/uncore.c

  2827	
> 2828	void kx7000_uncore_cpu_init(void)
  2829	{
  2830		u64 val;
  2831		int cpu;
  2832	
  2833		uncore_msr_uncores = kx7000_msr_uncores;
  2834	
  2835		/* clear bit 16 of MSR 0x1877 so that HIF can work normally */
  2836		for_each_present_cpu(cpu) {
  2837			rdmsrl_on_cpu(cpu, 0x1877, &val);
  2838			val = val & 0xfffffffffffeffffULL;
  2839			wrmsrl_on_cpu(cpu, 0x1877, val);
  2840		}
  2841	}
  2842	
> 2843	int kx7000_uncore_pci_init(void)
  2844	{
  2845		uncore_pci_uncores = kx7000_pci_uncores;
  2846		uncore_pci_driver = &kx7000_uncore_pci_driver;
  2847	
  2848		return 0;
  2849	}
  2850	
> 2851	void kx7000_uncore_mmio_init(void)
  2852	{
  2853		uncore_mmio_uncores = kx7000_mmio_uncores;
  2854	}
  2855	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
