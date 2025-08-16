Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30C1E7C34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755324531; cv=none; b=fA5okO2EUe7bvMqAXOAGRaZzIBsplZW5VDNircnhNZaHzvSOtoyAjxqTqM8Yo2RH2LNLKG/zfdXQulIcqWqJ3w2V+QlbwwjlGONclf+MOtpplb7potzkCZI4/jL8leq8bn8lflBcHmer4yiiCe1x4b/oFvoHt5rht1yMUZKU5Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755324531; c=relaxed/simple;
	bh=qbL8O855HI0Ou1SUTpSZ0V+tPTgKUGTXO3+Jt8bd+Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozWz9oCtQQKtJek5igM2R2tGXvgdPj9rajnncgu9juFmfKpBWIH+NUZTMjIZsrCdn90/f0mrN56bhrUjACRuAZwNk0WgW6YI7nF4JksUxAHHJWih0lDzJVVPUPYbQkqVfUCXvoRWS4zxOneuca/jy1PKNvWfIHsziVp9lapGCv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4D5VkeZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4D5VkeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755324530; x=1786860530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbL8O855HI0Ou1SUTpSZ0V+tPTgKUGTXO3+Jt8bd+Vk=;
  b=a4D5VkeZ5CjFEo5ncq3Xf1XgP2cCrdBwLYosSBt3tdmIK1mrqKppnmbp
   es5Mw0dGc4PkwvbMGNtIP8wX4+2P05eT5xda7Wf8luGPu6NeSsAm70hmv
   qvLuADoPTxFaxg0RSfDkJ9rpKERqdT5jHGX392A2i5bEHBlNmIU03qdTe
   P2Hw6s/e9KvcgHEstP/LVGfJUQyCJq4v6zyvONjohk0CB0jMCo30xFaPC
   R6F72NYPv8+quq4NxK7ZLlgcsr7EAteMxuS4tVLkN4aVBuXCYad2/zXI2
   d10BPc5k5Hqmu5IMVmNsobNQjkaXeaBb7gyIc1I8SaZe72vTIonP+exZY
   g==;
X-CSE-ConnectionGUID: 3U4QPgm1RpGzUhHgMj3m2A==
X-CSE-MsgGUID: ZHknWbAGSbm9ZojCIaVRng==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57348634"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57348634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 23:08:49 -0700
X-CSE-ConnectionGUID: jcvO77pPTF20GK90scXW2A==
X-CSE-MsgGUID: UkdH731VSL+rj13Ggd5Cyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="190881227"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2025 23:08:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unA5u-000CdA-0n;
	Sat, 16 Aug 2025 06:08:46 +0000
Date: Sat, 16 Aug 2025 14:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] x86/bhyve: Detect FreeBSD Bhyve hypervisor
Message-ID: <202508161302.GCL9hvvA-lkp@intel.com>
References: <febd320e77386415b761d14fed7772b395b387bc.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <febd320e77386415b761d14fed7772b395b387bc.camel@infradead.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.17-rc1 next-20250815]
[cannot apply to bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/x86-bhyve-Detect-FreeBSD-Bhyve-hypervisor/20250815-210544
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/febd320e77386415b761d14fed7772b395b387bc.camel%40infradead.org
patch subject: [PATCH v3] x86/bhyve: Detect FreeBSD Bhyve hypervisor
config: x86_64-randconfig-073-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161302.GCL9hvvA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161302.GCL9hvvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161302.GCL9hvvA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/bhyve.c: In function 'bhyve_features':
>> arch/x86/kernel/cpu/bhyve.c:40:29: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
      40 |         if (bhyve_cpuid_max < bhyve_cpuid_base | CPUID_BHYVE_FEATURES)
         |             ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~


vim +40 arch/x86/kernel/cpu/bhyve.c

    37	
    38	static uint32_t bhyve_features(void)
    39	{
  > 40		if (bhyve_cpuid_max < bhyve_cpuid_base | CPUID_BHYVE_FEATURES)
    41			return 0;
    42	
    43		return cpuid_eax(bhyve_cpuid_base | CPUID_BHYVE_FEATURES);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
