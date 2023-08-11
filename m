Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E200A3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691722171; x=1723258171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfMGuU8tsLoPYLKXycSKSzC0Ogu5IC5LyU5oyn8XEZE=;
  b=WUOE9n166mIvhqIZLprZO2TNk/DV4y75hm2b0y4Zux+ZQ+h4HOqeLJ1i
   rCeIUPvAbFlasLPaDCxkyJk2dflwgxlucbp2uvFigzPgDkB0L+SfRtrxF
   OVz3DAKkw27cmD8Ct8+It4D+VAMu3t8dN+tL+2ev7QW8eJp3+SdBqyxKi
   p1Ryi0MAUR9oa7aAy1WJ+42CIm76cUlvF1WJ4cinX5TJubsORBx7xEl0H
   fIIxZBNZqdwoQwPQqcW7FkbJaFSjGzDDls8oWp/n44+FDVzx49zEaVgLY
   qUTEsFS0pSWGvmVh9ogf9j/0o8BPxHMsVfYvQMug4tYRjHo/wOaoaTj5E
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="375290708"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="375290708"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979076203"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="979076203"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2023 19:49:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUIDO-0007RI-2g;
	Fri, 11 Aug 2023 02:49:26 +0000
Date: Fri, 11 Aug 2023 10:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Michael Kelley <mikelley@microsoft.com>
Subject: [lantianyu:test 16/17] arch/x86/kernel/cpu/mshyperv.c:303:49: error:
 'hv_snp_boot_ap' undeclared
Message-ID: <202308111006.VraHp0Ax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   270445ff219a23bda92bf6aa95bb0afabe263791
commit: ddcd3dc1f1669f634afe0be928d4559541a89bec [16/17] x86/hyperv: Add smp support for SEV-SNP guest
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230811/202308111006.VraHp0Ax-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111006.VraHp0Ax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111006.VraHp0Ax-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mshyperv.c:24:
   arch/x86/include/asm/mshyperv.h:249:1: error: version control conflict marker in file
     249 | <<<<<<< ours
         | ^~~~~~~
   arch/x86/include/asm/mshyperv.h:251:1: error: version control conflict marker in file
     251 | =======
         | ^~~~~~~
   arch/x86/include/asm/mshyperv.h:254:1: error: version control conflict marker in file
     254 | >>>>>>> theirs
         | ^~~~~~~
   arch/x86/kernel/cpu/mshyperv.c: In function 'hv_smp_prepare_cpus':
>> arch/x86/kernel/cpu/mshyperv.c:303:49: error: 'hv_snp_boot_ap' undeclared (first use in this function)
     303 |                 apic->wakeup_secondary_cpu_64 = hv_snp_boot_ap;
         |                                                 ^~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mshyperv.c:303:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/hv_snp_boot_ap +303 arch/x86/kernel/cpu/mshyperv.c

   295	
   296		native_smp_prepare_cpus(max_cpus);
   297	
   298		/*
   299		 *  Override wakeup_secondary_cpu_64 callback for SEV-SNP
   300		 *  enlightened guest.
   301		 */
   302		if (hv_isolation_type_en_snp())
 > 303			apic->wakeup_secondary_cpu_64 = hv_snp_boot_ap;
   304	
   305		if (!hv_root_partition)
   306			return;
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
