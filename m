Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F1126ADC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777689660; cv=none; b=hsU60YyiqrLFHZcHT6mhYsYg5pkjGe5vt1GlcDbhJ9BaQAMPtMKFCKPtM8+/VJJA3fRajUIg9cY2EoeNI7na1X9rSLXMXKwWLEwFSLqAIsofCNU3eJtsU1AOV1/6z0fR1/6ytar/Ffa9nOL1jrrWt1sOrht+4qtuY4SNOfAtCNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777689660; c=relaxed/simple;
	bh=PwYSslFHsPQhZTLLv+TBvjyN+HVkndPdSWWJpWbzWUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n768jkAmJ59byZ75yQy4eyWl24wS8DoSor+3lgO2/bi5dx3QOYKsdDR2TROmlXmjjv4SBAGRtp/y5gHpLCckBtfJxYZVoGZxQaotFrDc42wvFUGzVHjleYyv7cqZXJHeh/L1f42hEandJZyb8+tUvPc81IXhYc8F7hBHQmuEdCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Co8VbLxv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Co8VbLxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777689659; x=1809225659;
  h=date:from:to:cc:subject:message-id;
  bh=PwYSslFHsPQhZTLLv+TBvjyN+HVkndPdSWWJpWbzWUk=;
  b=Co8VbLxvVqGxyK7WNRWGO9RJhVh71aXjnLo8pYhZs1ZyMSQOpMQ3u0HN
   tGIRflfu+t0Q5PJ+B3tl+e5MICp1em8ZxYz6abRumQIfoGNpAbE2csMGj
   xV5NZxoPW97nCI5mG1rDtQjwKkyCfsowA5Vjx3/icfgoxHFDggt8I40yw
   1iDBib3XQJTiJyKuEywYHJOMH9qnIRexT01vg/P40wD2dzrmEpdDJLsf0
   LohcLmnYDHlpcE9UaYKGAuo7ma1eEu+IbNEimF5iW4Ws+J5jdisSpnhu0
   iRr1594uM7FYGN7L2doN8PaElLrmOKRm10RJ9CZ095vuX9togTpHrOp1d
   g==;
X-CSE-ConnectionGUID: 2uyvzMrcS4y1wa6HBYRUcw==
X-CSE-MsgGUID: G+kSu97dThWDyXrqmUHsZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="88956894"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="88956894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 19:40:59 -0700
X-CSE-ConnectionGUID: eRKTpx7/TAStF4SrLk+Lpg==
X-CSE-MsgGUID: auNmcFI+SnmfiqXO4cZ0yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235081582"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2026 19:40:57 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ0Hm-000000005Az-43ln;
	Sat, 02 May 2026 02:40:54 +0000
Date: Sat, 02 May 2026 04:40:37 +0200
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 69/69] ../../../lib/test_xarray.c:825:24:
 error: 'PG_SHIFT' undeclared; did you mean 'PAGE_SHIFT'?
Message-ID: <202605020414.kf1N6YUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 3453a5ad954365409373c2762ba237c7e31a623b [69/69] treewide: Rename PAGE_SIZE/SHIFT/MASK to PG_* (cocci)
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260502/202605020414.kf1N6YUw-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020414.kf1N6YUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020414.kf1N6YUw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from xarray.c:11:
   ../../../lib/test_xarray.c: In function 'check_xa_multi_store_adv':
>> ../../../lib/test_xarray.c:825:24: error: 'PG_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     825 |         index = pos >> PG_SHIFT;
         |                        ^~~~~~~~
         |                        PAGE_SHIFT
   ../../../lib/test_xarray.c:825:24: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from ./linux/scatterlist.h:8,
                    from scatterlist.c:9:
   ./linux/mm.h: In function '__get_free_page':
>> ./linux/mm.h:104:38: error: 'PG_SIZE' undeclared (first use in this function); did you mean 'PAGE_SIZE'?
     104 |         return (unsigned long)malloc(PG_SIZE);
         |                                      ^~~~~~~
         |                                      PAGE_SIZE
   ./linux/mm.h:104:38: note: each undeclared identifier is reported only once for each function it appears in
   ./linux/scatterlist.h: In function 'sg_set_page':
   ./linux/scatterlist.h:161:9: error: implicit declaration of function 'VM_WARN_ON_ONCE'; did you mean 'WARN_ON_ONCE'? [-Wimplicit-function-declaration]
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PG_SIZE) / PG_SIZE));
         |         ^~~~~~~~~~~~~~~
         |         WARN_ON_ONCE
   ./linux/scatterlist.h:161:26: error: implicit declaration of function 'page_range_contiguous' [-Wimplicit-function-declaration]
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PG_SIZE) / PG_SIZE));
         |                          ^~~~~~~~~~~~~~~~~~~~~
   ./linux/scatterlist.h:161:74: error: 'PG_SIZE' undeclared (first use in this function); did you mean 'PAGE_SIZE'?
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PG_SIZE) / PG_SIZE));
         |                                                                          ^~~~~~~
   ./linux/mm.h:34:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      34 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   ./linux/mm.h:35:41: note: in expansion of macro '__ALIGN_KERNEL'
      35 | #define ALIGN(x, a)                     __ALIGN_KERNEL((x), (a))
         |                                         ^~~~~~~~~~~~~~
   ./linux/scatterlist.h:161:54: note: in expansion of macro 'ALIGN'
     161 |         VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PG_SIZE) / PG_SIZE));
         |                                                      ^~~~~
   ./linux/scatterlist.h: At top level:
   ./linux/scatterlist.h:181:64: warning: 'struct folio' declared inside parameter list will not be visible outside of this definition or declaration
     181 | static inline void sg_set_folio(struct scatterlist *sg, struct folio *folio,
         |                                                                ^~~~~
   ./linux/scatterlist.h: In function 'sg_set_folio':
   ./linux/scatterlist.h:186:34: error: invalid use of undefined type 'struct folio'
     186 |         sg_assign_page(sg, &folio->page);
         |                                  ^~
   ./linux/scatterlist.h: In function 'sg_set_buf':
   ./linux/scatterlist.h:212:52: error: implicit declaration of function 'offset_in_pg'; did you mean 'offset_in_page'? [-Wimplicit-function-declaration]
     212 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_pg(buf));
         |                                                    ^~~~~~~~~~~~
         |                                                    offset_in_page
   ./linux/scatterlist.h: In function 'sg_page_iter_page':
   ./linux/scatterlist.h:606:35: error: invalid use of undefined type 'struct page'
     606 |         return sg_page(piter->sg) + piter->sg_pgoffset;
         |                                   ^
   ./linux/scatterlist.h: In function 'sg_page_iter_dma_address':
   ./linux/scatterlist.h:618:47: error: 'PG_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
     618 |                (dma_iter->base.sg_pgoffset << PG_SHIFT);
         |                                               ^~~~~~~~
         |                                               PAGE_SHIFT
   scatterlist.c: At top level:
   scatterlist.c:12:10: fatal error: linux/bvec.h: No such file or directory
      12 | #include <linux/bvec.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
