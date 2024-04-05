Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5B632
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712276241; cv=none; b=kJjCVdG6HVxD1s+v3g5I2gnugO+MUcQ3jh4MBDHCezp/vE4vlWVOLgkxsDdxkxmWeUUdByk0O+d2MItjU/+5DjcYiKf25BAXysGedgY/pRtRAlNwzOCxb7k3dcT65xY4RURMObtPwj7WoaLILoeH1rXv59+McmLFZYb7Kfy6dZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712276241; c=relaxed/simple;
	bh=mZXTGLJ0Eyxwf0bG0L8OPH3/S+k/dywLs+xMCe8M4mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+ydsLfqu0Rih5xojgpHcWEfz3hls7QQour6l+j1D4q1jqIQ8wxd++fWkX5EHXO4WeImC8erSo7wqWR1ihKdhnc0xyIk6d+OTsxg5iw61uSkom+gRHrSLLBx00daB9klUjtLla7eCXgNabP1nBs5nxJmAkTpKIhw8OWhSzaiqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNqposdS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNqposdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712276240; x=1743812240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZXTGLJ0Eyxwf0bG0L8OPH3/S+k/dywLs+xMCe8M4mQ=;
  b=bNqposdSWh/ZxFy3GWGYrUcOFDOvRgZxz2lo3jb6Xe76+vazI2kFlSXu
   il+BypDViz8ZnGw9kqlCjNGMVeoshFyelG7O8odtYPwoLL7ep1eOmcz0P
   Y8aGtAuBwadgAkMKNtXQNN4Febp3eBNN9mFl1Jo7o1PWfGtt/Sj6EnEp6
   7q/z0cDzSonex3cuqHI3iYDRNTYj+hdF1BBsHXEY7aKTvN5j9XKJCudxj
   iSYI2dJPXa9wLlB5mr5Un08F/EWHXYV0E5K6Rp/7TTQjUeLsbHCQPSSW7
   ACXpXROq4KjmJGpNoVNhWL+iftc9pPPKX75z+QdaSiwYB1rtcNeFbKbC5
   Q==;
X-CSE-ConnectionGUID: bqyuhhk/RSycB0hVnZAQHw==
X-CSE-MsgGUID: qTFTiM12QQatpthngxnkbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18328086"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18328086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 17:17:19 -0700
X-CSE-ConnectionGUID: 2MrAuBDpQxiKensj/liq8g==
X-CSE-MsgGUID: jOuNoZnfSzSR7auPDU1dGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19548672"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2024 17:17:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsXGc-0001fS-1V;
	Fri, 05 Apr 2024 00:17:14 +0000
Date: Fri, 5 Apr 2024 08:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [akpm-mm:mm-unstable 43/300] arch/arc/include/asm/mmu-arcv2.h:82:9:
 error: implicit declaration of function 'write_aux_reg'
Message-ID: <202404050828.5pKgmCLu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   60b650ba203e33686b6c3aacf1556805811f8e9e
commit: 627dbcce529e56c04348944e6ffa9cdeebe9fe76 [43/300] asm-generic/io.h: kill vmalloc.h dependency
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050828.5pKgmCLu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050828.5pKgmCLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050828.5pKgmCLu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/mmu.h:21,
                    from arch/arc/include/asm/pgtable.h:14,
                    from include/linux/pgtable.h:6,
                    from include/asm-generic/io.h:1047,
                    from arch/arc/include/asm/io.h:232,
                    from include/linux/io.h:13,
                    from kernel/dma/coherent.c:6:
   arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
>> arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration of function 'write_aux_reg' [-Werror=implicit-function-declaration]
      82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
         |         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/write_aux_reg +82 arch/arc/include/asm/mmu-arcv2.h

2cc1121bc993ca Vineet Gupta 2020-10-01  79  
2cc1121bc993ca Vineet Gupta 2020-10-01  80  static inline void mmu_setup_asid(struct mm_struct *mm, unsigned long asid)
2cc1121bc993ca Vineet Gupta 2020-10-01  81  {
2cc1121bc993ca Vineet Gupta 2020-10-01 @82  	write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
2cc1121bc993ca Vineet Gupta 2020-10-01  83  }
2cc1121bc993ca Vineet Gupta 2020-10-01  84  

:::::: The code at line 82 was first introduced by commit
:::::: 2cc1121bc993ca3090cc4267bc38d3da61b68602 ARC: mm: disintegrate mmu.h (arcv2 bits out)

:::::: TO: Vineet Gupta <vgupta@kernel.org>
:::::: CC: Vineet Gupta <vgupta@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
