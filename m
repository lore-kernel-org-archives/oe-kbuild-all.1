Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9061C5F13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 05:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190926; cv=none; b=bXUf2kNo45bIf37BMbUdx3cgpAfpoN44y5EjXGHH097Apin9Glipd0ZJY5bmeVQByOgsAM2z/cVX3WmiF4CZg8U7g5hu/vaUr3QY2r29Wy2eY/R+Q9A9BMXn6QiS9j+ToB6/zwFiDIdaoONqTfO5RyUJ/SyRr9pIpA2uNjeZB9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190926; c=relaxed/simple;
	bh=acemllHM3lwEkt0FFCJpU+ThIYPlDG0x9ref8y6Eyx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ElXpJyPh9vPxWisE4yZYvlsBwM2golirNxhaXOLgN686GnQ6vnE0sXDzyR0ijOMV5ftPao4ZyN42njISo0WcTtjgw9MKwSmT4tsYv2AFIx9gKjn7afgvYrjijSA93xkiXYaPEYXXFg79G7/owsgCrtLpVhItz+7CCibkNZu+qJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pbxb/WRa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pbxb/WRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782190925; x=1813726925;
  h=date:from:to:cc:subject:message-id;
  bh=acemllHM3lwEkt0FFCJpU+ThIYPlDG0x9ref8y6Eyx4=;
  b=Pbxb/WRayM/1tvTIiG74O7udaxv2YnFdATNv6IvBM3p7o+YNNQSIV7Uu
   4ndL4TQz1/vOFGNEMDa+WCK90v51wXlpQAqN+nsEcf+nccMNPYMaYpnVK
   +z8tvV2Vgl/4X283G2SmBGdhrXged24O2Zlxj9milMen9SXn0R3M8w8Lz
   nF7/ryviOJipEbUZNEKxKtR6Qbxq+kO0M4yerg/E41vIuugVddl7CGKL0
   3StGlgGgMddNtEJXfvNSM8S779gVX0ZmxtxYLCLuWWIOkM/cmdO+4WjzV
   85T9qhME0Tp18bgd6aBBeNDn7d9RpSY+vND9j8k57BhZt6gczrMfQ0wLO
   w==;
X-CSE-ConnectionGUID: RNikTVgWS2mzF/xgRhATbg==
X-CSE-MsgGUID: nZHEseFKSDymQtsTz5TaMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100353312"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100353312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 22:02:04 -0700
X-CSE-ConnectionGUID: SFEuksUMRmW37dFLpUXpNQ==
X-CSE-MsgGUID: +SG5MtJ4T3OfR4sIJDEB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273471602"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 22:02:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbtGq-000000002GJ-15kb;
	Tue, 23 Jun 2026 05:02:00 +0000
Date: Tue, 23 Jun 2026 13:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 1/36] arch/x86/lib/msr.c:128:9: error:
 implicit declaration of function 'rdmsr_on_cpu'; did you mean
 'rdmsr_on_cpus'?
Message-ID: <202606231205.kjltsK1d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 9fabca1c1950dd3416833e171d8106ce9c1d6cca [1/36] x86: Cleanup include recursion hell
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260623/202606231205.kjltsK1d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231205.kjltsK1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231205.kjltsK1d-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/msr.c: In function 'rdmsr_on_cpus':
>> arch/x86/lib/msr.c:128:9: error: implicit declaration of function 'rdmsr_on_cpu'; did you mean 'rdmsr_on_cpus'? [-Wimplicit-function-declaration]
     128 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |         ^~~~~~~~~~~~
         |         rdmsr_on_cpus
   arch/x86/lib/msr.c: In function 'wrmsr_on_cpus':
>> arch/x86/lib/msr.c:134:9: error: implicit declaration of function 'wrmsr_on_cpu'; did you mean 'wrmsr_on_cpus'? [-Wimplicit-function-declaration]
     134 |         wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
         |         ^~~~~~~~~~~~
         |         wrmsr_on_cpus


vim +128 arch/x86/lib/msr.c

   124	
   125	#ifndef CONFIG_SMP
   126	void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no, struct msr __percpu *msrs)
   127	{
 > 128		rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
   129	}
   130	EXPORT_SYMBOL(rdmsr_on_cpus);
   131	
   132	void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no, struct msr __percpu *msrs)
   133	{
 > 134		wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
   135	}
   136	EXPORT_SYMBOL(wrmsr_on_cpus);
   137	#endif
   138	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
