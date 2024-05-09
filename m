Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91442149C7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242752; cv=none; b=Qpf7JMss4sJiFsQe52PdqGJphM5Z9m6ha5n/KU1gFLB7TEbbmnwe9wcB+2C4hdGn0Qx+m946NDH4IE4b/vKW2PKJL9IPBxp/HnjmwgVCUmmuRYdYt/OWaoFudys7wRVhhA7bCPd00Wf2/EqbWYctmnlQTEuFYXP5lR2RiWUc5Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242752; c=relaxed/simple;
	bh=rfIO8lJj0lXHYo9PCZQmMJv0qnkv0F8SDNvbnW97iZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK2S1n1SN6lyJ5R+EKt4p+NVPtMSgExDqQwJejqfzK62TmVXbDTxgDmeRgxNOKIr0XoNt9D5ikaryWAJnZlrKacZSphBKhRbnisby9WTntxxgld4g28Px2Wz8ok14NTIssXdYTsmwUc2qJ8/A7+oxGRJLrb3Oa4ahAxL5ezgnbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Alo+vI7R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Alo+vI7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715242750; x=1746778750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rfIO8lJj0lXHYo9PCZQmMJv0qnkv0F8SDNvbnW97iZU=;
  b=Alo+vI7R9HOIceTZvQgih+GPyM73LMfML6BaTumsijPXqyiCsHnrh5nq
   kx0W7DTLApu2TNOSCci7H3gH7s5R31Yk2eVwScklUBOhr5qF7CFwUk1SD
   v6ul700EXFANcBLu464GPrZH19nHBh0zuwzN+M3OqdnvVFcEIBTz+mPVW
   4wAFpF8zkiv+A/VhFHB5KPpJRei/+JbOCOMWTbqXcJcFk6JdPyyigR15L
   SFGyyxMCM55sdNyIKA/fGBzqcUa2LJxdyiYLY+rQmiWpQv+P3zEiKpNjv
   BsyYdOrYwvMxtKbJl/00iCkjf9EjBRXAKrtblzbYPvbRQIh3jjjzLn/6F
   g==;
X-CSE-ConnectionGUID: JLsuBb64R/udPoOfhbwVyQ==
X-CSE-MsgGUID: 6jktJIPyTQGdxWrc9vzCzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11360643"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11360643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:19:08 -0700
X-CSE-ConnectionGUID: pIg6tOTnTZKNLnqcZF5wGg==
X-CSE-MsgGUID: DW3w5ZBcQSaNsbdunh9Wpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="60340457"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2024 01:19:05 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4yzX-0004dG-2R;
	Thu, 09 May 2024 08:19:03 +0000
Date: Thu, 9 May 2024 16:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for
 kexec FDT
Message-ID: <202405091617.IRRnTyRE-lkp@intel.com>
References: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508130558.1939304-2-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240508]
[cannot apply to powerpc/next powerpc/fixes linus/master v6.9-rc7 v6.9-rc6 v6.9-rc5 v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kexec_file-fix-extra-size-calculation-for-kexec-FDT/20240508-211003
base:   next-20240508
patch link:    https://lore.kernel.org/r/20240508130558.1939304-2-sourabhjain%40linux.ibm.com
patch subject: [PATCH 1/2] powerpc/kexec_file: fix extra size calculation for kexec FDT
config: powerpc64-randconfig-002-20240509 (https://download.01.org/0day-ci/archive/20240509/202405091617.IRRnTyRE-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405091617.IRRnTyRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405091617.IRRnTyRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kexec/file_load_64.c:852: warning: Function parameter or struct member 'rmem' not described in 'kexec_extra_fdt_size_ppc64'


vim +852 arch/powerpc/kexec/file_load_64.c

2377c92e37fe97 Hari Bathini 2021-02-04  843  
33f2cc0a2e90f7 Hari Bathini 2024-02-26  844  /**
33f2cc0a2e90f7 Hari Bathini 2024-02-26  845   * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
33f2cc0a2e90f7 Hari Bathini 2024-02-26  846   *                              setup FDT for kexec/kdump kernel.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  847   * @image:                      kexec image being loaded.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  848   *
33f2cc0a2e90f7 Hari Bathini 2024-02-26  849   * Returns the estimated extra size needed for kexec/kdump kernel FDT.
33f2cc0a2e90f7 Hari Bathini 2024-02-26  850   */
f2c160891d3206 Sourabh Jain 2024-05-08  851  unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image, struct crash_mem *rmem)
33f2cc0a2e90f7 Hari Bathini 2024-02-26 @852  {
f2c160891d3206 Sourabh Jain 2024-05-08  853  	struct device_node *dn;
f2c160891d3206 Sourabh Jain 2024-05-08  854  	unsigned int cpu_nodes, extra_size = 0;
33f2cc0a2e90f7 Hari Bathini 2024-02-26  855  
33f2cc0a2e90f7 Hari Bathini 2024-02-26  856  	// Budget some space for the password blob. There's already extra space
33f2cc0a2e90f7 Hari Bathini 2024-02-26  857  	// for the key name
33f2cc0a2e90f7 Hari Bathini 2024-02-26  858  	if (plpks_is_available())
33f2cc0a2e90f7 Hari Bathini 2024-02-26  859  		extra_size += (unsigned int)plpks_get_passwordlen();
33f2cc0a2e90f7 Hari Bathini 2024-02-26  860  
f2c160891d3206 Sourabh Jain 2024-05-08  861  	/* Get the number of CPU nodes in the current device tree */
f2c160891d3206 Sourabh Jain 2024-05-08  862  	for_each_node_by_type(dn, "cpu") {
f2c160891d3206 Sourabh Jain 2024-05-08  863  		cpu_nodes++;
f2c160891d3206 Sourabh Jain 2024-05-08  864  	}
f2c160891d3206 Sourabh Jain 2024-05-08  865  
f2c160891d3206 Sourabh Jain 2024-05-08  866  	/* Consider extra space for CPU nodes added since the boot time */
f2c160891d3206 Sourabh Jain 2024-05-08  867  	if (cpu_nodes > boot_cpu_node_count)
f2c160891d3206 Sourabh Jain 2024-05-08  868  		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
f2c160891d3206 Sourabh Jain 2024-05-08  869  
f2c160891d3206 Sourabh Jain 2024-05-08  870  	/* Consider extra space for reserved memory ranges if any */
f2c160891d3206 Sourabh Jain 2024-05-08  871  	if (rmem->nr_ranges > 0)
f2c160891d3206 Sourabh Jain 2024-05-08  872  		extra_size += sizeof(struct fdt_reserve_entry) * rmem->nr_ranges;
f2c160891d3206 Sourabh Jain 2024-05-08  873  
f2c160891d3206 Sourabh Jain 2024-05-08  874  	return extra_size + kdump_extra_fdt_size_ppc64(image, cpu_nodes);
33f2cc0a2e90f7 Hari Bathini 2024-02-26  875  }
33f2cc0a2e90f7 Hari Bathini 2024-02-26  876  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
