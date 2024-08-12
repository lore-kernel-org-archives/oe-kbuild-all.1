Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD616E866
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723459245; cv=none; b=mstxsBrJ8PiyGfUeAzRnWHFv9F4lOni6vst45mg+4HN3ZPJZJMtk6uZGkJHIIDcT2qo3E3N7jsTc4vm9HP16iUmKEKnOBa0O7qALdTEQkpqVi3+lYgPC90N2ZiyREtoH9BY/7KcXY2/PbYlfcoGD2fIXKGaglT69wDRFTRZ4r1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723459245; c=relaxed/simple;
	bh=TTm//QIgG3G9Tw8CwOFYHMc+0SulZohOT1L5eRFwubI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5fTR8GOV9Pwi3hGX6UKx2G/yhAK19lQR+iyYuEhV9oS1OS8n70EPXCEfZiaEew8hupRJ93TIsyDuX5lcvL5/117Ad28bLVPVG+MW9ILNbvsRTPgHlSGOp8EHIxiJugtwjpX+HQwFAqPoXWDB3KWft+B+K6q+TEBB5clrCsWJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao5xIdVV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao5xIdVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723459244; x=1754995244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TTm//QIgG3G9Tw8CwOFYHMc+0SulZohOT1L5eRFwubI=;
  b=ao5xIdVVF6rP/4Aj8uB9om3R57Bgmy+fI8eb9sdpnF0OluS/W5fqszrW
   tUyTAtJC5/6sscJt8ar0zNA7QXg1ghQwCgITnV/dT7lYx4LlEjUP6qw/K
   HfVfCmRdciXwLdG1JxsNJQLBkBd4FtKZWiUKf9dDFu8JsgqE/tSdQKWT2
   xcxmNMBZWdQOUmy3kGArpFB3CF+S/hCV+fxss8qiVtniQGoB6jMcQkZj4
   bnguQsc9F4DCrlfEKxWXI8magZ7t1ONR3K5xijutVRhTRMgT+NngreoT8
   oYY+4T0tnCHh1MySqBlGxfljwbNXxY0HLBXYCZM8Wt3/Q6JlXrYZ9KAE6
   Q==;
X-CSE-ConnectionGUID: hfoux3hxSkaSqYhOrVYF5w==
X-CSE-MsgGUID: 1zyEN2+qT9m0XMtl6BB4Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21125589"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21125589"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 03:40:43 -0700
X-CSE-ConnectionGUID: YQQnh3dQTS2tnVXP6M8c2A==
X-CSE-MsgGUID: UfzTlmniQAGuJUjuiGEEfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="62349533"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2024 03:40:42 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdSTg-000BfL-04;
	Mon, 12 Aug 2024 10:40:40 +0000
Date: Mon, 12 Aug 2024 18:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Pardee <xi.pardee@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/7] platform/x86:intel/pmc: Create Intel PMC SSRAM
 Telemetry driver
Message-ID: <202408121808.75Id6SjC-lkp@intel.com>
References: <20240809204648.1124545-3-xi.pardee@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809204648.1124545-3-xi.pardee@linux.intel.com>

Hi Xi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Pardee/platform-x86-intel-pmc-Remove-SSRAM-support-from-PMC-Core/20240810-114100
base:   linus/master
patch link:    https://lore.kernel.org/r/20240809204648.1124545-3-xi.pardee%40linux.intel.com
patch subject: [PATCH 2/7] platform/x86:intel/pmc: Create Intel PMC SSRAM Telemetry driver
config: x86_64-randconfig-123-20240812 (https://download.01.org/0day-ci/archive/20240812/202408121808.75Id6SjC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121808.75Id6SjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408121808.75Id6SjC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/ssram_telemetry.c:97:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *val @@     got void [noderef] __iomem *__val @@
   drivers/platform/x86/intel/pmc/ssram_telemetry.c:97:25: sparse:     expected void const volatile *val
   drivers/platform/x86/intel/pmc/ssram_telemetry.c:97:25: sparse:     got void [noderef] __iomem *__val
   drivers/platform/x86/intel/pmc/ssram_telemetry.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +97 drivers/platform/x86/intel/pmc/ssram_telemetry.c

    70	
    71	static int pmc_ssram_telemetry_get_pmc(struct pci_dev *pdev, unsigned int pmc_idx, u32 offset)
    72	{
    73		void __iomem __free(pmc_ssram_telemetry_iounmap) * tmp_ssram = NULL;
    74		void __iomem __free(pmc_ssram_telemetry_iounmap) * ssram = NULL;
    75		u64 ssram_base, pwrm_base;
    76		u16 devid;
    77	
    78		ssram_base = pdev->resource[0].start;
    79		tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
    80	
    81		if (!tmp_ssram)
    82			return -ENOMEM;
    83	
    84		if (pmc_idx != PMC_IDX_MAIN) {
    85			/*
    86			 * The secondary PMC BARS (which are behind hidden PCI devices)
    87			 * are read from fixed offsets in MMIO of the primary PMC BAR.
    88			 */
    89			ssram_base = get_base(tmp_ssram, offset);
    90			if (!ssram_base)
    91				return -ENODEV;
    92	
    93			ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
    94			if (!ssram)
    95				return -ENOMEM;
    96		} else
  > 97			ssram = no_free_ptr(tmp_ssram);
    98	
    99		/* Find and register and PMC telemetry entries */
   100		pmc_ssram_telemetry_add_pmt(pdev, ssram_base, ssram);
   101	
   102		pwrm_base = get_base(ssram, SSRAM_PWRM_OFFSET);
   103		if (!pwrm_base)
   104			return -ENODEV;
   105		devid = readw(ssram + SSRAM_DEVID_OFFSET);
   106	
   107		pmc_ssram_telems[pmc_idx].devid = devid;
   108		pmc_ssram_telems[pmc_idx].base_addr = pwrm_base;
   109	
   110		return 0;
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
