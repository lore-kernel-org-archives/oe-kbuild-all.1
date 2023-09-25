Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C3821113
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695664448; x=1727200448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpZ85geHuTmogAXAMaWZYJDrModGKN8tlBc6tynaJj8=;
  b=bmCYPfpwXul/+x6qtugGDaOZIK7Mk7Ihygb7tUd1oJOjZ5xnFp3obEui
   ok0Fry298R396NlnvPFgUqFbfkqRZaWuteHUnvoBCnJfYbAiGXCZh64N4
   tc8qWCuBPRe9RxLPf4hFS0LOZIJNwURSqz//TrkroIDliQKmFoWC3ecXC
   mmHsZ4dqI8gPv/34tkC7Uy21su/0LcCKcxMeBh3fUcmkpDM8+J+gZ8G1t
   IonhqVnMocoYnbnc3qJ6v2EqqOHI6f7RfBhDsW85++YikSQVe+oxW3ycj
   GfoNJJAvg5+UsFdpbaCWD/3olAbqBq5KA2jX7p8yo1dJvJ6fh0yvQyJhl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445437475"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="445437475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 10:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891780338"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="891780338"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2023 10:53:03 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkpmV-0001t0-1t;
	Mon, 25 Sep 2023 17:54:03 +0000
Date: Tue, 26 Sep 2023 01:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Arjan van de Ven <arjan@linux.intel.com>
Subject: [tglx-devel:x86/topology 20/41]
 arch/x86/kernel/cpu/mshyperv.c:308:47: error: assignment to 'int (*)(u32,
  long unsigned int)' {aka 'int (*)(unsigned int,  long unsigned int)'} from
 incompatible pointer type 'int (*)(int,  long unsigned int)'
Message-ID: <202309260153.A0tCVgy6-lkp@intel.com>
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
config: x86_64-randconfig-012-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260153.A0tCVgy6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260153.A0tCVgy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260153.A0tCVgy6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mshyperv.c: In function 'hv_smp_prepare_cpus':
>> arch/x86/kernel/cpu/mshyperv.c:308:47: error: assignment to 'int (*)(u32,  long unsigned int)' {aka 'int (*)(unsigned int,  long unsigned int)'} from incompatible pointer type 'int (*)(int,  long unsigned int)' [-Werror=incompatible-pointer-types]
     308 |                 apic->wakeup_secondary_cpu_64 = hv_snp_boot_ap;
         |                                               ^
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
