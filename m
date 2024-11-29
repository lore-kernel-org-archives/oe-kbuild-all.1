Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31B13C9A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732862363; cv=none; b=DypcGpR4RE8bJUmxq9sPKCiU555xaHTd0F/uHuTGNb2QfwQZqe6HvOElDVcCdW+cKMErkkErz79Xb235uz0GaZ8jVPu/F+lpfQNEshBNvbQ2U/RRReffqvnufWahCE2xCujffWeQ5BYff74+ts8NDm6Db7FSziNiS59yAAZzSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732862363; c=relaxed/simple;
	bh=z9iuJEo8i0ONCg8ne7GB/3eMYrvfdBkGPO64u9dHKLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hpd51AErsgsSMlX9H36d/X7CHYkwmiVyClbQfbd54haptJQcb3xD19+Xi2ZNL95oiqlOltgj5TP/rmBkhIViTqiXwjqSUS+L7/IQJ8V3HriMQhnr4ljBBqkb+03j1WaG5xznrnvLD+FCBdiHEdGKuj4jK+VUjcyeDsoFqrClZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTvlr6vh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTvlr6vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732862361; x=1764398361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z9iuJEo8i0ONCg8ne7GB/3eMYrvfdBkGPO64u9dHKLI=;
  b=KTvlr6vhOhZv8PdVH2koISJvhe8qNuzjcr+3xgyuUfnxFPtygCIvr4ME
   LjTZj6ghw1LJMS63SeMJyQWrDk8wuE4CXe1XfGeJ6/+jma+usWVNuN3WN
   Rf+Ju2oiw4b9d28mlRJyJ4+/6e0JirjjOJu2dxNadIQenGIrctnkaAaEi
   YaC101g0QkT/ovtjMCjdN7zniyqE0coh81M1HZNFm8bMbSLHMEXa93roX
   ALaElW7MDMBNvsSo1WOgnCcByodXkU1QMKJe+1QRhmpKPFnjLkvKKC9C+
   1x6YP3irhWBEPx7BcIJdwyc2ZUs//IMfxBrYqaOkAeroCgxcHNDAh2ZU2
   A==;
X-CSE-ConnectionGUID: 26cYaW4RRFK46sBMTwEbOg==
X-CSE-MsgGUID: f7YBLSaTRWWH7JkMTm3D2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20689011"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="20689011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:39:20 -0800
X-CSE-ConnectionGUID: dToNrm7yROeNTYD573873A==
X-CSE-MsgGUID: nj486T2GRE+2FFs1KIQmFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123370188"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 22:39:20 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGuer-000069-26;
	Fri, 29 Nov 2024 06:39:17 +0000
Date: Fri, 29 Nov 2024 14:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 1/3]
 arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from
 constant value (1000000ff becomes ff)
Message-ID: <202411291458.2ZpuyGdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   573505a89aeb5eee6f77d35893f539439cfac78b
commit: b25e2be0204d8e7095a997b52afad35a7beb057a [1/3] x86/msr: Replace __wrmsr() with native_wrmsrl()
config: x86_64-randconfig-122-20241118 (https://download.01.org/0day-ci/archive/20241129/202411291458.2ZpuyGdZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291458.2ZpuyGdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291458.2ZpuyGdZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/events/intel/uncore_snb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/events/intel/uncore_snb.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (1000000ff becomes ff)
--
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   arch/x86/events/intel/uncore_nhmex.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
>> arch/x86/include/asm/msr.h:149:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +149 arch/x86/include/asm/msr.h

   142	
   143	/* Can be uninlined because referenced by paravirt */
   144	static inline void notrace
   145	native_write_msr(unsigned int msr, u32 low, u32 high)
   146	{
   147		u64 val = (u64)high << 32 | low;
   148	
 > 149		native_wrmsrl(msr, val);
   150	
   151		if (tracepoint_enabled(write_msr))
   152			do_trace_write_msr(msr, val, 0);
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
