Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B852B11187
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710058265; cv=none; b=CvE24HmjH1tdijQLHr4BnCzxYfEmywyaZrmpwuTkp0uPdD3X9hlSOd2vFjp6ybBN9d3VW5SSQHOqYMP+zs0bxXCY4eAmbGp9LbzYN1zl2cMndVZHZj5KVMgY++NKc6hl8ehusxJCx8NDpWYVfblxPKHpbqLPUAHft+dS11epVOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710058265; c=relaxed/simple;
	bh=NyobS59p51ZvkD17Zlmw1nLsnnE4sWF0oUiTWFM15VM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJeapWY2R8LYvz4Hsy3man6UersIYTXzjNDT/f6kioAsYTpkt0jLBBB/1D/i0df80CM3XOFwTCkFuoN3U3d4mJLKP29ZRYSwIx09d/ktRBtJvGIoPoSLFxtOaiNaQvF6QAq9UVHOXUAxy+cyHe4eDra2gzF6aAFQw8TquVvqm4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjqdJJRD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjqdJJRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710058262; x=1741594262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyobS59p51ZvkD17Zlmw1nLsnnE4sWF0oUiTWFM15VM=;
  b=HjqdJJRDAPcjZPcHvr9qTpwUYFP+XjzAX0/sloro9FN6dasE+c0CN4d+
   MNASMfnzIbBiGSiAiizO0dU7aZGTHKV42vOdM1dn+uKRnqgY4tYSJsJmt
   lfAa2WhSoTOIdz6GjZVr27h6Blqkj/dyBQ3EWsDns99Y7XzRpkZ0DnEDl
   LPAIB+B8kFPRqNGegCk5Cv9p6jxYmW6aYMyJ9nqbacM/s+82xgOkdUkmm
   tZgb6gHQe0qwg/+x8EUbHCoXS64gLd5AddOh4HdeVzVaE9U2WIJydfTdp
   /jD7BrscDIr2bREpAe8My2jFAzLtgRkZXn1w0gQ5O3grAjGDvQZICS8VZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="16143948"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="16143948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 00:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10754308"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2024 00:11:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjEGn-00085f-2H;
	Sun, 10 Mar 2024 08:10:57 +0000
Date: Sun, 10 Mar 2024 16:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <202403101607.a42gaLOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 924bd6a8c96767a05323d575bdefd664631dce73 [12265/12944] mm/x86: drop two unnecessary pud_leaf() definitions
config: arm64-randconfig-r031-20230409 (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:13,
                    from include/acpi/acpi_io.h:5,
                    from include/linux/acpi.h:39,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of function 'pud_leaf'; did you mean 'pmd_leaf'? [-Werror=implicit-function-declaration]
     904 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                ^~~~~~~~
         |                pmd_leaf
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1199: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +904 arch/arm64/include/asm/pgtable.h

ed928a3402d8a2 Tong Tiangen 2022-05-17  901  
ed928a3402d8a2 Tong Tiangen 2022-05-17  902  static inline bool pud_user_accessible_page(pud_t pud)
ed928a3402d8a2 Tong Tiangen 2022-05-17  903  {
730a11f982e61a Liu Shixin   2022-11-22 @904  	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
ed928a3402d8a2 Tong Tiangen 2022-05-17  905  }
ed928a3402d8a2 Tong Tiangen 2022-05-17  906  #endif
ed928a3402d8a2 Tong Tiangen 2022-05-17  907  

:::::: The code at line 904 was first introduced by commit
:::::: 730a11f982e61aaef758ab552dfb7c30de79e99b arm64/mm: add pud_user_exec() check in pud_user_accessible_page()

:::::: TO: Liu Shixin <liushixin2@huawei.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
