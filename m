Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD42381AEC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803338; cv=none; b=WThzBlQWCH3dUP0h806G8QGWTViKHFAqpzoxtJTDHeLLBdFURmlnl5yD/QEUtzZWs1NBnG08IANNBFS1s9NqtqDClkl/QbG61geR4ppuVuilv6dC39yhiqPh97O3MJL3fzhjt7yJj9GrEmRGs9BbAtKjQibbu76wi5wltc/kyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803338; c=relaxed/simple;
	bh=uDIHAIk7rYzdUnlSlwkheXGdxL9bohMrFQI/ITTk0fY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/qeozL0y5hNfGn3KCuHbfsbcrPrEfqmbESkEBggxBDlY/WOFuyNdes+WrLCLW491S3SRVvrmHzMPgBzpi4AiGw1+QpuxwAdLVZFdRtFFxPX/C4qpALmB/h4esKiwjUZSNC5w9UhV5ep2b33Kyn9I/vCllkYqIJqcVuYWoBVXoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OewqOqj6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OewqOqj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782803337; x=1814339337;
  h=date:from:to:cc:subject:message-id;
  bh=uDIHAIk7rYzdUnlSlwkheXGdxL9bohMrFQI/ITTk0fY=;
  b=OewqOqj6faFq7u9quapiE7jI1OgMGcGsyXTDU9eoezSkhpsbnbbAmsFs
   L5xD8HIP5eFBjjs44XlcP9tj1EKPizbQYDEfMOd9gKUQDg+FJORdmYDVj
   6Z1S1+ZmAd+j0amws9yjZMqNu6FpV+uc4ToTK6A3d3Fe0sklNAirV0Bfi
   WsoYJGemQdzkis3qXFtUqnNfrPpzIYToe3Xk+zEbeWWftOk00IpmSkRkc
   v2tTtDdzfP5Sra9PW2Tf+9wD0Xc7ZqxNGhhb80076vkk7OVKAzrUuY7Qs
   QCve9Y5ZhkS5W0uVdfqyEZWQ/OR/LRSZcYnD+KLI2uBFIarKX0Q+foeiM
   g==;
X-CSE-ConnectionGUID: hg/yCUKiTJarsvwg+ZAmTw==
X-CSE-MsgGUID: PliBlkmBQcirI8a8or/+0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94891313"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="94891313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 00:08:54 -0700
X-CSE-ConnectionGUID: +DkslVcYRa+Jo4AKbJOH+A==
X-CSE-MsgGUID: LqN0vgLkS9e1e3BcOYCzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="255780362"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 00:08:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weSaP-0000000084V-3SUo;
	Tue, 30 Jun 2026 07:08:49 +0000
Date: Tue, 30 Jun 2026 15:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [remoteproc:rproc-next 1/7]
 arch/s390/include/asm/io.h:30:22: error: implicit declaration of function
 'ioremap_prot'; did you mean 'ioremap_np'?
Message-ID: <202606301559.w8eorNQ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
head:   70cfc11cfcfb07ca8eeed1f667cc0eec9e82aa71
commit: 50227acbf4e5173db0f05ed95414512e7783889f [1/7] remoteproc: Add common wc-ioremap carveout callbacks
config: s390-randconfig-r134-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301559.w8eorNQ2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301559.w8eorNQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301559.w8eorNQ2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/remoteproc/remoteproc_core.c:22:
   drivers/remoteproc/remoteproc_internal.h: In function 'rproc_mem_entry_ioremap_wc':
>> arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Werror=implicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:2: note: in expansion of macro 'ioremap_prot'
      36 |  ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |  ^~~~~~~~~~~~
   drivers/remoteproc/remoteproc_internal.h:131:7: note: in expansion of macro 'ioremap_wc'
     131 |  va = ioremap_wc(mem->dma, mem->len);
         |       ^~~~~~~~~~
   In file included from drivers/remoteproc/remoteproc_core.c:39:
>> drivers/remoteproc/remoteproc_internal.h:131:5: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     131 |  va = ioremap_wc(mem->dma, mem->len);
         |     ^
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/remoteproc/remoteproc_core.c:22:
   drivers/remoteproc/remoteproc_internal.h: In function 'rproc_mem_entry_iounmap':
>> arch/s390/include/asm/io.h:31:17: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
      31 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/remoteproc/remoteproc_internal.h:146:2: note: in expansion of macro 'iounmap'
     146 |  iounmap((__force __iomem void *)mem->va);
         |  ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/devcoredump.h:12,
                    from drivers/remoteproc/remoteproc_coredump.c:9:
   drivers/remoteproc/remoteproc_internal.h: In function 'rproc_mem_entry_ioremap_wc':
>> arch/s390/include/asm/io.h:30:22: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_np'? [-Werror=implicit-function-declaration]
      30 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/s390/include/asm/io.h:36:2: note: in expansion of macro 'ioremap_prot'
      36 |  ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |  ^~~~~~~~~~~~
   drivers/remoteproc/remoteproc_internal.h:131:7: note: in expansion of macro 'ioremap_wc'
     131 |  va = ioremap_wc(mem->dma, mem->len);
         |       ^~~~~~~~~~
   In file included from drivers/remoteproc/remoteproc_coredump.c:13:
>> drivers/remoteproc/remoteproc_internal.h:131:5: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     131 |  va = ioremap_wc(mem->dma, mem->len);
         |     ^
   In file included from include/linux/scatterlist.h:9,
                    from include/linux/devcoredump.h:12,
                    from drivers/remoteproc/remoteproc_coredump.c:9:
   drivers/remoteproc/remoteproc_internal.h: In function 'rproc_mem_entry_iounmap':
   arch/s390/include/asm/io.h:31:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
      31 | #define iounmap iounmap
         |                 ^~~~~~~
   drivers/remoteproc/remoteproc_internal.h:146:2: note: in expansion of macro 'iounmap'
     146 |  iounmap((__force __iomem void *)mem->va);
         |  ^~~~~~~
   cc1: some warnings being treated as errors


vim +30 arch/s390/include/asm/io.h

cd24834130ac655 Jan Glauber 2012-11-29  26  
b43b3fff042d08a Baoquan He  2023-07-06  27  /*
b43b3fff042d08a Baoquan He  2023-07-06  28   * I/O memory mapping functions.
b43b3fff042d08a Baoquan He  2023-07-06  29   */
b43b3fff042d08a Baoquan He  2023-07-06 @30  #define ioremap_prot ioremap_prot
b43b3fff042d08a Baoquan He  2023-07-06 @31  #define iounmap iounmap
b43b3fff042d08a Baoquan He  2023-07-06  32  

:::::: The code at line 30 was first introduced by commit
:::::: b43b3fff042d08a0bcc0a6d87c3216b44860298e s390: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
