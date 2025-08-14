Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08592EA72D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755177815; cv=none; b=Boyf8j4uxfi31StKI7GmVA2fEN+7+sP9Cqv0LM/gjbQyOYAk3ZRdclsiJUp6Oc0uOrV7GiO8bl42C3jWATzKEBbeqVk4jlPaN2we9KwpQtTnJffjjJhzYUBSY1ZWPgT3wwGldnx9C+ZIPsTTwP78I7wPcErQr8Lm+y3iWXGJ67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755177815; c=relaxed/simple;
	bh=jlhCiNQYoMuLPyi9d3EsG+Utr7GMn93F8TRm84M8hbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U7ye/xH3VrfsJrfu/yY6I+7RvD9nc0xjS4DArR2RuZ7/P4dOy60GuldGMEcHdo1VTfgSjm1LfnVLq9aKrqj6iiWKjhpC93brH6OTmOF1V3x03vqDNIuhU5Drf9DbUzjHzAeFt+QcFmBwtGf6ZmG9o3SIbY6n0GV62NBFITb+fKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mqy63/AM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mqy63/AM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755177814; x=1786713814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jlhCiNQYoMuLPyi9d3EsG+Utr7GMn93F8TRm84M8hbg=;
  b=Mqy63/AMKcoDz9zFKYw/J8W/Rt3viRRz9G2jyowOJc1gUfDQxlpjuByI
   hu4VMh0OPlurzl1wZ5McTROCoMEwXQ0sc7A3DgjzzFEXhFvBfHbaBXIt2
   wlqDIP5UYGOzn8JUlAJnYoezVYCYDjxw0/xZOU7kD7628wOZaRqzvQ4Ki
   r32p6fFL+9i6JnC+65tX0QbDqWeJ983Gm7ns/t+KgETAydOD8vo787wRl
   mIt0GyOEqWbyalqXYwVdpmWCVKO3kOOJurWPujEPu/kFUGIYEXaBz/enp
   I0GCkdpTBsSALyQn5qZSlovkLKjli8PKMeTzxDBPbL4xYPTEbFgUTJdcM
   A==;
X-CSE-ConnectionGUID: tZZG/FPQTsCqirFGcq7S2w==
X-CSE-MsgGUID: bMjKQUHpSn6hILVX++SHEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57639021"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57639021"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:23:34 -0700
X-CSE-ConnectionGUID: TfWQdTXkRGe92+JwareA5g==
X-CSE-MsgGUID: MpDnsqMCTvmaBHnR7YJKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171986588"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 06:23:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umXun-000Az0-0c;
	Thu, 14 Aug 2025 13:22:53 +0000
Date: Thu, 14 Aug 2025 21:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:cpuid 4/4] arch/x86/kernel/kvm.c:899:31: sparse: sparse:
 non-ANSI function declaration of function 'kvm_para_tsc_khz'
Message-ID: <202508142107.YBvHBW1o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux cpuid
head:   09e5e1c389ad0e1f5d843d548d4239221fc96a8e
commit: 73038303178dd4d4f847ffe024b87b4a2a0930a5 [4/4] x86/kvm: Obtain TSC frequency from CPUID if present
config: x86_64-randconfig-122-20250814 (https://download.01.org/0day-ci/archive/20250814/202508142107.YBvHBW1o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142107.YBvHBW1o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142107.YBvHBW1o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/kvm.c:899:31: sparse: sparse: non-ANSI function declaration of function 'kvm_para_tsc_khz'
   arch/x86/kernel/kvm.c:72:1: sparse: sparse: symbol '__pcpu_scope_steal_time' was not declared. Should it be static?

vim +/kvm_para_tsc_khz +899 arch/x86/kernel/kvm.c

   898	
 > 899	unsigned int kvm_para_tsc_khz()
   900	{
   901		u32 base = kvm_cpuid_base();
   902	
   903		if (cpuid_eax(base) >= (base | KVM_CPUID_TIMING_INFO))
   904			return cpuid_eax(base | KVM_CPUID_TIMING_INFO);
   905	
   906		return 0;
   907	}
   908	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
