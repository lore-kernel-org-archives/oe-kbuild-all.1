Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE04C2D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963631; x=1719499631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0TW8rORFbvHsvw57ZLLsdr8StY03qMWB1yRd8wqTDj4=;
  b=dlJoP7ecrWIwSWBn1QqUpkOV+Atz9X0gG9fIFKjdVErz3Hf6X7B6JVlY
   vPIXwFY6u3jK+mAEwsVcpO2AmkU3M2q0afQXLR361fGqUzQH6RhX/lTgU
   L38BXeqjmwUWbmjkEekcKAooUWcT586IYcktVzVqvxMm8XwXjpm9cU4HO
   uOkhd/OuSll9gSVvXWI8CabgejkE6nc1QRnqLpswVGFFAtfGFy91X1dBv
   id3kAQgXGNgR6y4tK8ERudjoMxcd5qlNUttpQch/R4GT9tknTpHywWAA0
   gIe+NtizGAxHy+BQ6vSpkJbxLW9LcnOdcU33IAMzDOffys3AlIFTz8us0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="342200188"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="342200188"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 07:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="806941940"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="806941940"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2023 07:45:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEWQS-000DJN-0I;
	Wed, 28 Jun 2023 14:45:44 +0000
Date: Wed, 28 Jun 2023 22:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: arch/riscv/mm/kasan_init.c:28:7: sparse: sparse: symbol 'tmp_pud'
 was not declared. Should it be static?
Message-ID: <202306282202.bODptiGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6aeadf7896bff4ca230702daba8788455e6b866e
commit: 96f9d4daf745205fe869e9e5ac23199ef11c5448 riscv: Rework kasan population functions
date:   2 months ago
config: riscv-randconfig-r083-20230628 (https://download.01.org/0day-ci/archive/20230628/202306282202.bODptiGE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306282202.bODptiGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306282202.bODptiGE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zicbom_zihintpause'
   arch/riscv/mm/kasan_init.c:27:7: sparse: sparse: symbol 'tmp_p4d' was not declared. Should it be static?
>> arch/riscv/mm/kasan_init.c:28:7: sparse: sparse: symbol 'tmp_pud' was not declared. Should it be static?

vim +/tmp_pud +28 arch/riscv/mm/kasan_init.c

    13	
    14	/*
    15	 * Kasan shadow region must lie at a fixed address across sv39, sv48 and sv57
    16	 * which is right before the kernel.
    17	 *
    18	 * For sv39, the region is aligned on PGDIR_SIZE so we only need to populate
    19	 * the page global directory with kasan_early_shadow_pmd.
    20	 *
    21	 * For sv48 and sv57, the region start is aligned on PGDIR_SIZE whereas the end
    22	 * region is not and then we have to go down to the PUD level.
    23	 */
    24	
    25	extern pgd_t early_pg_dir[PTRS_PER_PGD];
    26	pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
    27	p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
  > 28	pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
