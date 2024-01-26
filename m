Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B131DDF8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290029; cv=none; b=nmbhCZi7htQPCdt6omSn1ZUlA8ZLv2SmkJQ1t57n50SrihIpzFVLGMef9xq6vIbFEp2RIgX2HVNGlspYdk+Y9o7yHUmvFBPzsfRMWQZzKVF0KYiYqITTYF6YXb+tlSW2O8FhXb60nJlkLQxV4nlzdG+MgM3krBf1zqV1kNPn9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290029; c=relaxed/simple;
	bh=uyul8LlKsMY4RBj6Vzo/INLVuEPza5fmyncwF738Gj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YG+moKLzYZzrf+H2jYnPn+ToLJvgHowzzwdsxfn/tBXSTn0h+fm3AVoO4Vz1uOKzRdC0jv2S0tk57Y8CIZVmb1fdP9Q9pFeb/YRjCKXVrRYVAchcOddOLPlJ1CBcHENJOhHYpWd04bhOmdhZXkiZP0z6YjhbnecnYx7PWRF7rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZpGfjRY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZpGfjRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706290026; x=1737826026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uyul8LlKsMY4RBj6Vzo/INLVuEPza5fmyncwF738Gj0=;
  b=hZpGfjRYCAsWlHvgpgZETdb+4KmOX5UxzdqANhp5sExo0eTyMBl9mdZ4
   zg+BJF6MQjKLfKncFDCgAGdposliwjIkBI5l8Ij38QgXhd/DRahWirPoi
   iqEnMeuZPhIRDFjzSOfHlXP+X+sTJeLJsuTz++L4AfRHhj6+e1jbPfbQ8
   yphFHUD9uqY96g/APKyxp7Uo3PziqEHowmM11iV5qYMn1Dy657TsSpkwi
   elOEumDWE+wn4CI0Y/lTi1ALjsNFKNt81MMFC+vaDDXGMxNJIoFQ3NOr1
   JDPoK+pIusHxZs/mw6SxsYiI8pWXjZZBtfDBSfdXklKYZeNExCqWzMRIx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="21067721"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="21067721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 09:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2813316"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2024 09:27:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTPyo-0001Ey-1N;
	Fri, 26 Jan 2024 17:27:02 +0000
Date: Sat, 27 Jan 2024 01:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13850/21577]
 arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared
Message-ID: <202401270152.apkuohJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   992b5fc139d3aa14b25613b06adee4bb9c110b28
commit: fdda68feeca82610ccbcdcbda7250623a6d187d2 [13850/21577] arm64/ascend: Set mem_sleep_current to PM_SUSPEND_ON for ascend platform
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240127/202401270152.apkuohJO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270152.apkuohJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270152.apkuohJO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_setup':
>> arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared (first use in this function)
     784 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:784:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mem_sleep_current +784 arch/arm64/mm/init.c

   770	
   771	#ifdef CONFIG_ASCEND_FEATURES
   772	static int __init ascend_enable_setup(char *__unused)
   773	{
   774		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   775			enable_mmap_dvpp = 1;
   776	
   777		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   778			enable_iopf_hipri = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   781			enable_charge_mighp = 1;
   782	
   783		if (IS_ENABLED(CONFIG_SUSPEND))
 > 784			mem_sleep_current = PM_SUSPEND_ON;
   785	
   786		return 1;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
