Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669B8C11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKSXAmRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699097812; x=1730633812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgNmG6QoRL9gNamXdWgGb/TBVbekOwyvAbGOW8xPsQ0=;
  b=dKSXAmRzWnwFT2LLNZET6bkj2dgzutDSlRgiUR4iYTO5JG+wRd8Fdg9g
   iM9cmKf4y93sq6n9FjZdiTHI+IagvlqBZw1PC60SiAzUTdSQBOTBeRs6a
   tpP09j7Zk1nQWafO4Yda1iTXnUAsYSDe7idleU6mphua4+RGSX0pfcKjj
   voa57Vtn5JQk10s9Mmc4AwLLFMPDDOXNz8eo8xpsCid6XFvpxnAGdDbmX
   HmEV99OKOfyv1zP++0Aaq0LHYPhkSdZMl1H+W43+j4Nnt4gXDcRAq0FFV
   +9QlNiAag4HxjDy41IKhvMYZ0HVTGeHu0Dda8sStZhNtLznJazKQ5MX4B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="391948532"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="391948532"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905608007"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="905608007"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 04:36:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzExM-0004AW-1L;
	Sat, 04 Nov 2023 11:36:48 +0000
Date: Sat, 4 Nov 2023 19:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 8/18]
 include/linux/atomic_seqcount.h:64:2: error: #error "raw_atomic_seqcount_t
 does not support such large CONFIG_NR_CPUS"
Message-ID: <202311041902.6fGFeH3R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   d9a3c96499542e9a98d83a44b896e1431f5c928e
commit: e7155be62b1ddc92a917939acc17579d8be155cb [8/18] mm/rmap_id: track MMs that map a partially-mappable folio using rmap IDs
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231104/202311041902.6fGFeH3R-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041902.6fGFeH3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041902.6fGFeH3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:10:
>> include/linux/atomic_seqcount.h:64:2: error: #error "raw_atomic_seqcount_t does not support such large CONFIG_NR_CPUS"
      64 | #error "raw_atomic_seqcount_t does not support such large CONFIG_NR_CPUS"
         |  ^~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +64 include/linux/atomic_seqcount.h

8dce88b90ad3c5 David Hildenbrand 2023-10-24  62  
8dce88b90ad3c5 David Hildenbrand 2023-10-24  63  #if CONFIG_NR_CPUS >= ATOMIC_SEQCOUNT_SHARED_WRITERS_OVERFLOW
8dce88b90ad3c5 David Hildenbrand 2023-10-24 @64  #error "raw_atomic_seqcount_t does not support such large CONFIG_NR_CPUS"
8dce88b90ad3c5 David Hildenbrand 2023-10-24  65  #endif
8dce88b90ad3c5 David Hildenbrand 2023-10-24  66  

:::::: The code at line 64 was first introduced by commit
:::::: 8dce88b90ad3c5d041e1c3a99c03c2676c9ba490 atomic_seqcount: new atomic seqcount to support concurrent writers

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: David Hildenbrand <david@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
