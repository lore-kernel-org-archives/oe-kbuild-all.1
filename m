Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402B181
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 02:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688437907; x=1719973907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fj4oMDFuwaq4F+Ae3c5h636j1McmEotsQCpKVVFiiCg=;
  b=kRfz1u8uXCkj5b2+CNRf0xsTHpoH1NMgxh9vXI+c3aeU1Mu0u1UcP6JN
   x+AnkfMc2A2Qvpn3Re4fX5N4j8uXcC+ilkane3ULJambPI/cKYkTFegTV
   gChPPMvUOBF+9oXgvPPG5XhNey5iWRkPAS4DxS4GWYtngrwxZoYjLgmC8
   ekorcCYIP6G9v47fVBJMrlzEgDTAb1wdq6IxmaI/1mAfRpVxuaodP0X4n
   HvqYRkc/+TuVGd8GYoucBkmGNSySLK+mgQULEObTbP0uvApbW2Aqkm0p8
   KIceVzlbMd7d2pX41Nrn18ptY2wfXXMULauON6svkQU6r+D+fFE+72K/A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342601747"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="342601747"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 19:31:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="668914710"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="668914710"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jul 2023 19:31:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGVpB-000Ho6-2O;
	Tue, 04 Jul 2023 02:31:29 +0000
Date: Tue, 4 Jul 2023 10:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] arm64: properly define SOFT_DIRTY for arm64
Message-ID: <202307041014.1YFuFmew-lkp@intel.com>
References: <20230703135526.930004-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703135526.930004-1-npache@redhat.com>

Hi Nico,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.4 next-20230703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/arm64-properly-define-SOFT_DIRTY-for-arm64/20230703-220825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230703135526.930004-1-npache%40redhat.com
patch subject: [RFC] arm64: properly define SOFT_DIRTY for arm64
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230704/202307041014.1YFuFmew-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041014.1YFuFmew-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041014.1YFuFmew-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/acpi/acpi_io.h:5,
                    from include/linux/acpi.h:37,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/pgtable.h: In function 'pte_clear_soft_dirty':
>> arch/arm64/include/asm/pgtable.h:1110:13: error: implicit declaration of function 'arch_faults_on_old_pte' [-Werror=implicit-function-declaration]
    1110 |         if (arch_faults_on_old_pte())
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/arch_faults_on_old_pte +1110 arch/arm64/include/asm/pgtable.h

  1099	
  1100	#ifdef CONFIG_ARM64_HW_AFDBM
  1101	/*
  1102	 * if we have the DBM bit we can utilize the software dirty bit as
  1103	 * a mechanism to introduce the soft_dirty functionality; however, without
  1104	 * it this bit is crucial to determining if a entry is dirty and we cannot
  1105	 * clear it via software. DBM can also be disabled or broken on some early
  1106	 * armv8 devices, so check its availability before modifying it.
  1107	 */
  1108	static inline pte_t pte_clear_soft_dirty(pte_t pte)
  1109	{
> 1110		if (arch_faults_on_old_pte())
  1111			return pte;
  1112	
  1113		return clear_pte_bit(pte, __pgprot(PTE_DIRTY));
  1114	}
  1115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
