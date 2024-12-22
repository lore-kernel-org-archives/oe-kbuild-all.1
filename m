Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C752B9B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 05:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734845552; cv=none; b=RifgfImsMPGYkaRd9ym0vJrvxdwlUKovFvBM+ZE1wPbCLVbkbUR5Sz14weKz8Lef+vX1MCDlff8v5W0HoOIzpWhZvQdd8Pr9WuVYZaXvHcVfUeyzbS5vCFkR73SMVBllFFjICABTASgw6Xye+zuEUsnxQrWGabb1BsB/Sz7Pjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734845552; c=relaxed/simple;
	bh=pqKaG+JuqIBx8G5TsWpLLGKH2Lx1xIFFZ8G835gNtns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fl3osDUC2MKuRfehStYb3xXYi6NrueWuw37xYdGgswLXKAC1v2nDd6dzqaK911ox07lOURy3+hbia/hAo6IZ9gzuNw5y/wa6KJvuJUZjBc9+Y6OEY/2yvQRfAqCnev1tcTWTRZPeTxkxGgoqxT1vI7gs67bx4wD1U4ZDuN6sOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEQMxusy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEQMxusy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734845551; x=1766381551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqKaG+JuqIBx8G5TsWpLLGKH2Lx1xIFFZ8G835gNtns=;
  b=fEQMxusy3Wz5nNO4UZIz0hCwfoVaG3eABOofRlyLIMkXNPMxy1k46fbp
   cl+02/q7vSR7Ixx615hjsS8ftrBHAdWnlaNwZmmU4MgAjl1I8Rn7eKO11
   LhP83yV1puoJ+ZKG7VYkGAFgDFgiijTKuJuw7GuWZWTcOz05aH96fZHdV
   LnBaO6/eHAGFPqnBxXRp13u9cA/NfXIIHPR5holVvEV/gJGEgC+zLV0uI
   oDlQmXhWsR331Hv/UfMwitt61YRTdOA8cx7OWqaNb9jl8WEUhJTfC3JK8
   FHYgyB+e1iLDJjtMHKuZDkQ7gP5iZ4CdrU51Xtkq0vmmFcb8SeYORXxQO
   A==;
X-CSE-ConnectionGUID: 7MmgY461RuSrOw8J2YrYZw==
X-CSE-MsgGUID: pWqgm0A+RISZQLXajY3seA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39283569"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39283569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 21:32:28 -0800
X-CSE-ConnectionGUID: pl8Z9CXqQpe2Dq6ULSaKfg==
X-CSE-MsgGUID: DVvMVURMRVOdKukFLp4zYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98777524"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 21:32:27 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPEZk-0002kV-27;
	Sun, 22 Dec 2024 05:32:24 +0000
Date: Sun, 22 Dec 2024 13:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christopher Hall <christopher.s.hall@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.12/linux 905/1030]
 drivers/ptp/ptp-intel-pmc-tgpio.c:744:36: warning: 'intel_pmc_acpi_match'
 defined but not used
Message-ID: <202412221334.TfPILqSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: b46963784ab6c43803287df41706dd5492e23e22 [905/1030] drivers/ptp: Add support for PMC Time-Aware GPIO Driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241222/202412221334.TfPILqSy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221334.TfPILqSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221334.TfPILqSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp-intel-pmc-tgpio.c:759:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     759 |         .remove         = intel_pmc_tgpio_remove,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp-intel-pmc-tgpio.c:759:27: note: (near initialization for 'intel_pmc_tgpio_driver.<anonymous>.remove')
>> drivers/ptp/ptp-intel-pmc-tgpio.c:744:36: warning: 'intel_pmc_acpi_match' defined but not used [-Wunused-const-variable=]
     744 | static const struct acpi_device_id intel_pmc_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/intel_pmc_acpi_match +744 drivers/ptp/ptp-intel-pmc-tgpio.c

   743	
 > 744	static const struct acpi_device_id intel_pmc_acpi_match[] = {
   745		{ "INTC1021", 0 }, /* EHL */
   746		{ "INTC1022", 0 }, /* EHL */
   747		{ "INTC1023", 0 }, /* TGL */
   748		{ "INTC1024", 0 }, /* TGL */
   749		{  },
   750	};
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
