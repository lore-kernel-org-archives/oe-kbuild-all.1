Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797E13AEA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 10:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKWiemzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701860013; x=1733396013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DX9N3J4DCWgp9Y391/BGMLca4ggPh8x1LGgeXNLcQk=;
  b=RKWiemzIEzcxaEqggtDfXdZbXQS5RX2hIjjBrDoKs1M0I5H98Lz97lR4
   Gm5UVBPHva2hyWeGb2xKze0cOYk8MghF4/xpx01L2YTBPImZfN3wmii5m
   11blB0FLS/zrXX4a011RxF3S9j2tfZ+HdGmpngmE9WB+6i3e5+2YvJmOf
   Q+29/yGnhnaBkcuifFVP2mHp3TKERmfSa/UqKR8YeD3SUkkQ2gW2YVtnK
   LgKN8wP8I8T/kEESHu6oa7GOc1Vs7MFMm+mpQHJmfJB7Jkv1VhgqgI7oL
   YZl4IDugLJzk1U8z3E1ZvXWpuVRs2SfW7idy56jJRwLtgxUUHfKscCD7r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397929541"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="397929541"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 02:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764677936"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="764677936"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2023 02:53:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rApWy-000Af0-2r;
	Wed, 06 Dec 2023 10:53:28 +0000
Date: Wed, 6 Dec 2023 18:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4732/5273] arch/sh/kernel/crash_dump.c:23:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202312061837.tbKWaozM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   577a4ee0b96fb043c9cf4a533c550ff587e526cf
commit: 590dd59b60f446af09df274d7650307415dd617a [4732/5273] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: sh-randconfig-r112-20231206 (https://download.01.org/0day-ci/archive/20231206/202312061837.tbKWaozM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061837.tbKWaozM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061837.tbKWaozM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/sh/kernel/crash_dump.c:23:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void [noderef] __iomem * @@
   arch/sh/kernel/crash_dump.c:23:36: sparse:     expected void const *addr
   arch/sh/kernel/crash_dump.c:23:36: sparse:     got void [noderef] __iomem *

vim +23 arch/sh/kernel/crash_dump.c

4d5ade5b29c618e Paul Mundt              2007-04-27  13  
5d8de293c224896 Matthew Wilcox (Oracle  2022-04-29  14) ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
5d8de293c224896 Matthew Wilcox (Oracle  2022-04-29  15) 			 size_t csize, unsigned long offset)
4d5ade5b29c618e Paul Mundt              2007-04-27  16  {
12285ff8667bf06 Yejune Deng             2020-12-10  17  	void  __iomem *vaddr;
4d5ade5b29c618e Paul Mundt              2007-04-27  18  
4d5ade5b29c618e Paul Mundt              2007-04-27  19  	if (!csize)
4d5ade5b29c618e Paul Mundt              2007-04-27  20  		return 0;
4d5ade5b29c618e Paul Mundt              2007-04-27  21  
4d5ade5b29c618e Paul Mundt              2007-04-27  22  	vaddr = ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
5d8de293c224896 Matthew Wilcox (Oracle  2022-04-29 @23) 	csize = copy_to_iter(vaddr + offset, csize, iter);

:::::: The code at line 23 was first introduced by commit
:::::: 5d8de293c224896a4da99763fce4f9794308caf4 vmcore: convert copy_oldmem_page() to take an iov_iter

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
