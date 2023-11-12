Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61ED7468
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVFtjnKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699786176; x=1731322176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xn7r3qmALG7i+CZ9rriDy1dO7h/kNC9qfns82j/prrM=;
  b=aVFtjnKDN5GJ9OoUCIfJb1FSUGgeAdbESxvM5ANC11fpQvNcXLdooKZB
   5snUeauCO1S1L1O14+7wSSCVCxXqTS4bzRCaXTo8rAozxOmgoqoRet8Fr
   KoGPFH6lIHyIewcr5jasnqPEaaUyiTgrbDQnn7qM1UmTaaARNaF0+5zQz
   ZoeTZdq//ypcuOFosIo2VbUUUv6EYIWcqAR0jYOpDfmaxi3j23PQP+lqW
   TWptml4vk80PEdfbXzQed6RmEpE3x3BpH7cMRHk07ORyfkvqQursBJliH
   k0pvI1HPSXO1rrKbhJ/y8t+/kpKSpyMqMOkyl6fEvayoDt5Kfeueqesir
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="390130549"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="390130549"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 02:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="740531718"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="740531718"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Nov 2023 02:49:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r281z-000B5y-1M;
	Sun, 12 Nov 2023 10:49:31 +0000
Date: Sun, 12 Nov 2023 18:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: arch/x86/include/asm/pgtable_32.h:68:5: warning: "PTRS_PER_PMD" is
 not defined, evaluates to 0
Message-ID: <202311121854.UxxoSqkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
date:   11 months ago
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231112/202311121854.UxxoSqkX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121854.UxxoSqkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121854.UxxoSqkX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/head_32.S:29:
>> arch/x86/include/asm/pgtable_32.h:68:5: warning: "PTRS_PER_PMD" is not defined, evaluates to 0 [-Wundef]
      68 | #if PTRS_PER_PMD > 1
         |     ^~~~~~~~~~~~


vim +/PTRS_PER_PMD +68 arch/x86/include/asm/pgtable_32.h

^1da177e4c3f41 include/asm-i386/pgtable.h        Linus Torvalds  2005-04-16  58  
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  59  /*
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  60   * This is used to calculate the .brk reservation for initial pagetables.
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  61   * Enough space is reserved to allocate pagetables sufficient to cover all
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  62   * of LOWMEM_PAGES, which is an upper bound on the size of the direct map of
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  63   * lowmem.
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  64   *
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  65   * With PAE paging (PTRS_PER_PMD > 1), we allocate PTRS_PER_PGD == 4 pages for
ea3186b9572a1b arch/x86/include/asm/pgtable_32.h Arvind Sankar   2020-10-29  66   * the PMD's in addition to the pages required for the last level pagetables.
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  67   */
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08 @68  #if PTRS_PER_PMD > 1
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  69  #define PAGE_TABLE_SIZE(pages) (((pages) / PTRS_PER_PMD) + PTRS_PER_PGD)
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  70  #else
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  71  #define PAGE_TABLE_SIZE(pages) ((pages) / PTRS_PER_PGD)
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  72  #endif
1e620f9b23e598 arch/x86/include/asm/pgtable_32.h Boris Ostrovsky 2016-12-08  73  

:::::: The code at line 68 was first introduced by commit
:::::: 1e620f9b23e598ab936ece12233e98e97930b692 x86/boot/32: Convert the 32-bit pgtable setup code from assembly to C

:::::: TO: Boris Ostrovsky <boris.ostrovsky@oracle.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
