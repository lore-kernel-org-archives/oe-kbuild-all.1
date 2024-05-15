Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A7155723
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715788975; cv=none; b=rUmojGVYklB2LMfqw3Tq7HCRneB6RWkULO26jFrRIbgNlqRkAbySkL46sNqgr/9aW5hyk0apdaAoMlPSy6QbYsurKURIi/pPU6aTn9vAxd62DWYcx04hu8LhdYLaZbmSue1Gv/nM6pHP4YsOo3It8nK3ZDf+ddvNoqtto9jwUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715788975; c=relaxed/simple;
	bh=zxVCBe7eHacZwprYMJXU3g19lM0C4E6luINflcn67QI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GEjVQEnvezSugmLrZsnA2u5U8A3Ho0Rt0hNlqqzqG5WQVAeDFqAoqljXOt9q62IFxV7JLkJUOBmJelFrcPfzeiQ/ZGXEsXUAaMIu9OJpNpMO9Ua1n34TFsuDI8XVqtrfFX4hIcYl0yL2fIPISP1q7DutOqXOovly25h0c5TYCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAMdgn8d; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAMdgn8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715788974; x=1747324974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxVCBe7eHacZwprYMJXU3g19lM0C4E6luINflcn67QI=;
  b=DAMdgn8dnzYyieQi0C5X/uJ8kLPozU0gR6TBRkpd+h2oiM2wOu3MpUPq
   tCM9Te+IzezPVPdmzOblGXKKN8g/eZAIcsBBFFnZ3OL9KiPyHRP9I6ZbV
   Sy/Ly27/qGASDVG4ehFiC7xaGNyXOZQ/RfmaK8gYlSZpqAKrFj8GQ+B51
   VQq/gBTNk09GhkZ8yh5+Zu3JZaghnguUbMO/UW60MdScE23xTcRpAojdY
   LU4w/PSiTul+ECjbytGu1Ei9ZP9d+w8+clhFiFnjX5PVbeyeWvQeRze+A
   OzedYCR4nLJQkYhjk+jPdfWltweJ+WxKZhfGhf09kSYHEKqMOLkz2Tcnx
   Q==;
X-CSE-ConnectionGUID: FXyTRv7sQ2aTBBRIH1ZYHg==
X-CSE-MsgGUID: Eu2yYlAZSL6njbWpQxkAiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23250782"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23250782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 09:02:52 -0700
X-CSE-ConnectionGUID: ZFJV3J1pSf2jZdRvfXzqRw==
X-CSE-MsgGUID: Ty+8ZEYQRgiy7Mwg9LYdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31681965"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 May 2024 09:02:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7H5c-000Czn-1b;
	Wed, 15 May 2024 16:02:48 +0000
Date: Thu, 16 May 2024 00:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [jic23-cxl-staging:arm-numa-fixes 5/11]
 arch/arm64/include/asm/sparsemem.h:31:36: error: redefinition of
 'memory_add_physaddr_to_nid'
Message-ID: <202405152300.qcnjSGyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/cxl-staging.git arm-numa-fixes
head:   d077bf9570e8024f6d670d5662b62778715084fc
commit: c17c987d979cab4f0118c1d025fd0c7e096c77f1 [5/11] arm64: numa: Introduce a memory_add_physaddr_to_nid()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240515/202405152300.qcnjSGyh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405152300.qcnjSGyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405152300.qcnjSGyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/page-flags-layout.h:30,
                    from include/linux/mmzone.h:20,
                    from include/linux/swap.h:7,
                    from arch/arm64/mm/init.c:12:
>> arch/arm64/include/asm/sparsemem.h:31:36: error: redefinition of 'memory_add_physaddr_to_nid'
      31 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:63:5: note: in expansion of macro 'memory_add_physaddr_to_nid'
      63 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swap.h:5:
   include/linux/numa.h:47:19: note: previous definition of 'memory_add_physaddr_to_nid' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memory_add_physaddr_to_nid +31 arch/arm64/include/asm/sparsemem.h

    28	
    29	#ifndef __ASSEMBLY__
    30	extern int memory_add_physaddr_to_nid(u64 addr);
  > 31	#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
