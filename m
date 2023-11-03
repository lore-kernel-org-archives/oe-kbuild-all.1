Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3A15B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 01:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs0LoF34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698975441; x=1730511441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=abtvvzHJrP0Z4ehPq7SBmOSR7NrffWBsbTW34y2LfYY=;
  b=gs0LoF34O5kLvmGvi3I4h0pPbmuEWD2D+JwGkhwUC/9pLzlIY7Lbji/G
   9A7tUWFX0cg+A96nZk6etcQvWUTw/EHhqOa7Ygi7TOFz4I7Xwia9Ir5z4
   6nNma9nQv3suLeblSlgnDVploLbyXXtMvIuqBCHkSI6lQn8QNY1r8ecJ4
   VplciusAND7UxPjgGmUtXz/KAEzpMa9OArOggV67tCTgdEMvvt4o1DBja
   EMuJrXHtqMG9zRjTQ7O6i5PvahOzzdtRGCVnMgpH1BAuq+uaZuWPRuf1e
   yv1ovr5pwc6EtA21PvDQ/HbR65wWg52QQvPBMpmV+4IEUieF0XJmrdlp8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373899282"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="373899282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 18:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9585437"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2023 18:37:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyj7d-00026F-0h;
	Fri, 03 Nov 2023 01:37:17 +0000
Date: Fri, 3 Nov 2023 09:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Arjan van de Ven <arjan@linux.intel.com>
Subject: [tglx-devel:x86/topology 20/41]
 arch/x86/kernel/cpu/mshyperv.c:308:33: error: assignment from incompatible
 pointer type
Message-ID: <202311030906.Z0TJAdH2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   7af21f666de6da397249efd280be644d06660947
commit: 710f37067ff2e83aa99770f1101546187c65f975 [20/41] x86/apic: Use u32 for wakeup_secondary_cpu[_64]()
config: x86_64-randconfig-004-20231103 (https://download.01.org/0day-ci/archive/20231103/202311030906.Z0TJAdH2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030906.Z0TJAdH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030906.Z0TJAdH2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mshyperv.c: In function 'hv_smp_prepare_cpus':
>> arch/x86/kernel/cpu/mshyperv.c:308:33: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
      apic->wakeup_secondary_cpu_64 = hv_snp_boot_ap;
                                    ^
   arch/x86/kernel/cpu/mshyperv.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-attribute-alias'
   cc1: some warnings being treated as errors


vim +308 arch/x86/kernel/cpu/mshyperv.c

333abaf5abb396 Wei Liu    2021-02-03  300  
333abaf5abb396 Wei Liu    2021-02-03  301  	native_smp_prepare_cpus(max_cpus);
333abaf5abb396 Wei Liu    2021-02-03  302  
44676bb9d566ce Tianyu Lan 2023-08-18  303  	/*
44676bb9d566ce Tianyu Lan 2023-08-18  304  	 *  Override wakeup_secondary_cpu_64 callback for SEV-SNP
44676bb9d566ce Tianyu Lan 2023-08-18  305  	 *  enlightened guest.
44676bb9d566ce Tianyu Lan 2023-08-18  306  	 */
e3131f1c81448a Dexuan Cui 2023-08-24  307  	if (!ms_hyperv.paravisor_present && hv_isolation_type_snp()) {
44676bb9d566ce Tianyu Lan 2023-08-18 @308  		apic->wakeup_secondary_cpu_64 = hv_snp_boot_ap;
44676bb9d566ce Tianyu Lan 2023-08-18  309  		return;
44676bb9d566ce Tianyu Lan 2023-08-18  310  	}
44676bb9d566ce Tianyu Lan 2023-08-18  311  

:::::: The code at line 308 was first introduced by commit
:::::: 44676bb9d566ce2bfbd132f9745eb7eb2d784476 x86/hyperv: Add smp support for SEV-SNP guest

:::::: TO: Tianyu Lan <tiala@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
