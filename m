Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE522DCBFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748083128; cv=none; b=qXBQoG3ZeVnIA2wSloHED6DiMD0OI5j5dqL+7C+zBFFJ28pISgaZpXBNwxfhiu+NNd5tPGiY44eEQcNAnvv/sIHm1fxWpFTldRcVFKNcq5EqXF314bxdK6KFurcFAcB0fRwKmnWF/s822UDQwrzQYlGM88nxzUlB8q0SQ37Z+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748083128; c=relaxed/simple;
	bh=AVxoQ/zEeyAc69VejbYbWGa+y6eoYjH7q6Y5yttg6T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7xwlpWHP4kzO5S/218pfYTiRoKxTptJn8k0F1o4Hb9dEgv+LBfbkiYWLN5qYEVLcB14mNyxs2U5r+4SeB53Pgp7QV5pfv7tSG0blpmd+BKby6uNaXXIR2drVFWm8IK4tjDnz4Mj+bYxIcXnf/Sy6GoGlKosvPLhxBbeSV+pgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnuYUDbd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnuYUDbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748083127; x=1779619127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVxoQ/zEeyAc69VejbYbWGa+y6eoYjH7q6Y5yttg6T8=;
  b=mnuYUDbdBsxTCP8uHGZPGK3PntIOHsp/1fy5vKLROoauYiHiMJNdKEEr
   FJMEDEsJGr+DREGssOVrY4dWHhrnW9Sad3Kcy4D+WnNcbr0zkEFq3DZKx
   fDBCW0x/EMwRSKpeptu+TV6+zG69kTWXR0/CIJXV3Beie4ziNKQAmlTHJ
   e1JaFpALfS+NXbjKJtWtCpLmYe8XRwAoeszQv6dFedQP2UTPKLLoCzYrL
   3G8WiNVqxlP2NoVbn1RQdoQp5Md4Ouc8egADhwdEi2qqLbmCrJoe9UAfQ
   E57TfbypoZGEOK3TTBPQES4kZmE/LmYLNy0sJGV3/4W9ZCtLZycegsyI2
   Q==;
X-CSE-ConnectionGUID: 29We/2v5TYexcdXrY/DzrA==
X-CSE-MsgGUID: xKVOL4Y8SMiDsZKoZZJnQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72652023"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="72652023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 03:38:46 -0700
X-CSE-ConnectionGUID: L+3YX7bOQY6T59+KDI7oiA==
X-CSE-MsgGUID: FRj7EQUNRbucZWaPvmH07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146712943"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2025 03:38:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uImH4-000R7h-19;
	Sat, 24 May 2025 10:38:42 +0000
Date: Sat, 24 May 2025 18:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Khalid Aziz <khalid.aziz@oracle.com>
Subject: [jlayton:uek-localio 2105/2262] mm/madvise.c:40:24: error:
 'MADV_DOEXEC' undeclared here (not in a function); did you mean 'MADV_FREE'?
Message-ID: <202505241856.mhrziT8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: b8a7c9a5a584f5317230c28782d4fe94f78730ff [2105/2262] mm: madv_doexec_flag sysctl
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505241856.mhrziT8K-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241856.mhrziT8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241856.mhrziT8K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pagemap.h:11,
                    from mm/madvise.c:10:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:9: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Wimplicit-function-declaration]
     265 |         clear_user_page_uncached(addr, vaddr, page);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         clear_user_highpage_uncached
   mm/madvise.c: At top level:
>> mm/madvise.c:40:24: error: 'MADV_DOEXEC' undeclared here (not in a function); did you mean 'MADV_FREE'?
      40 | int madv_doexec_flag = MADV_DOEXEC;
         |                        ^~~~~~~~~~~
         |                        MADV_FREE
   mm/madvise.c: In function 'madvise_vma_behavior':
   mm/madvise.c:1322:14: error: 'MADV_DONTEXEC' undeclared (first use in this function); did you mean 'MADV_DONTNEED'?
    1322 |         case MADV_DONTEXEC:
         |              ^~~~~~~~~~~~~
         |              MADV_DONTNEED
   mm/madvise.c:1322:14: note: each undeclared identifier is reported only once for each function it appears in
   mm/madvise.c: In function 'madvise_behavior_valid':
   mm/madvise.c:1463:14: error: 'MADV_DONTEXEC' undeclared (first use in this function); did you mean 'MADV_DONTNEED'?
    1463 |         case MADV_DONTEXEC:
         |              ^~~~~~~~~~~~~
         |              MADV_DONTNEED


vim +40 mm/madvise.c

    39	
  > 40	int madv_doexec_flag = MADV_DOEXEC;
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
