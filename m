Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B22DDBF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691489877; x=1723025877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cea67l2qbOmXUpkIy5ce9lseMKdRVUVfyI6XrDZ+kbw=;
  b=gOZfYvdmq9TEhJbRzdji55sn2yjFd8SYVUvW9SaQnYKBs0KdJ2TCe4TE
   ZX7J/jjEWlSluRxjakIEskWTw8kd0o1KPOTmEP5RxzOZeTQnj+0okw2OX
   4OaRlLlluLhFfTfmNPg5qcyAedLAq8QIYfR2geoI4siewDL0r7iLL5LFn
   EtkUPFMSN/oraUI4e8/AjK+04caEQKr0q5HwkcBfSeqhUy5QbvLtTN9DM
   zsBq1ikU0dCkncocLTXT+DardPeQ5ab2du6pPH+EUNgEAZpQ3tNIdoHWE
   hguDlYII+plfeVEfQBkkfIizObBGIowPrZwklyzjAlMifGWFZioBOAwY8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369682460"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="369682460"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 03:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734474000"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="734474000"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Aug 2023 03:17:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTJml-0005Hk-09;
	Tue, 08 Aug 2023 10:17:55 +0000
Date: Tue, 8 Aug 2023 18:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sainath Grandhi <sainath.grandhi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 4157/30000]
 arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol
 'xapic_phys' was not declared. Should it be static?
Message-ID: <202308081826.nbO62JzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 1c28a7a26eb80ee913a8b71cfe24acfdd8aa00ce [4157/30000] Adding kernel parameter for forcing xapic in physical mode
config: x86_64-randconfig-r071-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081826.nbO62JzI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081826.nbO62JzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081826.nbO62JzI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol 'xapic_phys' was not declared. Should it be static?
   arch/x86/kernel/apic/apic_flat_64.c:53:6: warning: no previous prototype for 'flat_init_apic_ldr' [-Wmissing-prototypes]
      53 | void flat_init_apic_ldr(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/apic_flat_64.o: warning: objtool: physflat_acpi_madt_oem_check()+0xd7: sibling call from callable instruction with modified stack frame
   arch/x86/kernel/apic/apic_flat_64.o: warning: objtool: physflat_acpi_madt_oem_check.cold()+0x7: call without frame pointer save/setup

vim +/xapic_phys +32 arch/x86/kernel/apic/apic_flat_64.c

    31	
  > 32	int xapic_phys = 0;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
