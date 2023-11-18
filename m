Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA73110C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRN31aE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700272548; x=1731808548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/E5k6YGpLtW63pm/TX6WPtMPYzqGnai09ma/xUhj1s=;
  b=PRN31aE89FofoAbZjy/cknguetnzh3aILgS8LL3u1Y9bEMOX29AKX+9q
   PGS1XT0MsXkVdVuoDdYdJlUm4qhSwPOy0StZoOTKZuEFFWTBAQDNMcTBD
   uNI6A3klX3xTEdIOz1oKojVowuKJshtZYmC+P78JaAG5HJ4OuBgEiKMAm
   UjdhtiJcA/V1l8RB4r/L9w3UBCF88kx0+w6dNcqMrK0witCTNhRoxF9gn
   fKX9Qft+2hd+Y/FDl/jnkRJlDg8F+BnHh4JemPmXJKaR9NKLlMwbKAGk1
   B96MM/rVbfkHSShUB+qby3KT3GJfCnT2+k+S9aljLKzkM82UIx+LbzIMp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12950329"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="12950329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 17:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="939313721"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="939313721"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 17:55:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4AYg-0003PT-2g;
	Sat, 18 Nov 2023 01:55:42 +0000
Date: Sat, 18 Nov 2023 09:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311180934.gY2s81r5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 4ec4190be4cf9cc3e0ccaf5f155a5f9066d18950 kasan, x86: don't rename memintrinsics in uninstrumented files
date:   9 months ago
config: x86_64-randconfig-123-20231118 (https://download.01.org/0day-ci/archive/20231118/202311180934.gY2s81r5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180934.gY2s81r5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180934.gY2s81r5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void const *
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     got void [noderef] __user *[addressable] ubuf
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void const *
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     got void [noderef] __user *[addressable] ubuf
>> drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void *p
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     got void [noderef] __user *[addressable] ubuf
   drivers/misc/sgi-gru/grukdump.c:129:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct gru_context_configuration_handle *ubufcch @@     got void [noderef] __user *[assigned] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:129:17: sparse:     expected struct gru_context_configuration_handle *ubufcch
   drivers/misc/sgi-gru/grukdump.c:129:17: sparse:     got void [noderef] __user *[assigned] ubuf
   drivers/misc/sgi-gru/grukdump.c:192:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *ubuf @@     got void *[addressable] [assigned] buf @@
   drivers/misc/sgi-gru/grukdump.c:192:14: sparse:     expected void [noderef] __user *ubuf
   drivers/misc/sgi-gru/grukdump.c:192:14: sparse:     got void *[addressable] [assigned] buf
   drivers/misc/sgi-gru/grukdump.c:193:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *ubufend @@     got void * @@
   drivers/misc/sgi-gru/grukdump.c:193:17: sparse:     expected void [noderef] __user *ubufend
   drivers/misc/sgi-gru/grukdump.c:193:17: sparse:     got void *

vim +60 drivers/misc/sgi-gru/grukdump.c

9cc9b056ea5160 Jack Steiner 2009-06-17  34  
9cc9b056ea5160 Jack Steiner 2009-06-17  35  static int gru_dump_context_data(void *grubase,
9cc9b056ea5160 Jack Steiner 2009-06-17  36  			struct gru_context_configuration_handle *cch,
b8229bedd1f397 Jack Steiner 2009-12-15  37  			void __user *ubuf, int ctxnum, int dsrcnt,
b8229bedd1f397 Jack Steiner 2009-12-15  38  			int flush_cbrs)
9cc9b056ea5160 Jack Steiner 2009-06-17  39  {
9cc9b056ea5160 Jack Steiner 2009-06-17  40  	void *cb, *cbe, *tfh, *gseg;
9cc9b056ea5160 Jack Steiner 2009-06-17  41  	int i, scr;
9cc9b056ea5160 Jack Steiner 2009-06-17  42  
9cc9b056ea5160 Jack Steiner 2009-06-17  43  	gseg = grubase + ctxnum * GRU_GSEG_STRIDE;
9cc9b056ea5160 Jack Steiner 2009-06-17  44  	cb = gseg + GRU_CB_BASE;
9cc9b056ea5160 Jack Steiner 2009-06-17  45  	cbe = grubase + GRU_CBE_BASE;
9cc9b056ea5160 Jack Steiner 2009-06-17  46  	tfh = grubase + GRU_TFH_BASE;
9cc9b056ea5160 Jack Steiner 2009-06-17  47  
9cc9b056ea5160 Jack Steiner 2009-06-17  48  	for_each_cbr_in_allocation_map(i, &cch->cbr_allocation_map, scr) {
b8229bedd1f397 Jack Steiner 2009-12-15  49  		if (flush_cbrs)
b8229bedd1f397 Jack Steiner 2009-12-15  50  			gru_flush_cache(cb);
9cc9b056ea5160 Jack Steiner 2009-06-17  51  		if (gru_user_copy_handle(&ubuf, cb))
9cc9b056ea5160 Jack Steiner 2009-06-17  52  			goto fail;
9cc9b056ea5160 Jack Steiner 2009-06-17  53  		if (gru_user_copy_handle(&ubuf, tfh + i * GRU_HANDLE_STRIDE))
9cc9b056ea5160 Jack Steiner 2009-06-17  54  			goto fail;
9cc9b056ea5160 Jack Steiner 2009-06-17  55  		if (gru_user_copy_handle(&ubuf, cbe + i * GRU_HANDLE_STRIDE))
9cc9b056ea5160 Jack Steiner 2009-06-17  56  			goto fail;
9cc9b056ea5160 Jack Steiner 2009-06-17  57  		cb += GRU_HANDLE_STRIDE;
9cc9b056ea5160 Jack Steiner 2009-06-17  58  	}
9cc9b056ea5160 Jack Steiner 2009-06-17  59  	if (dsrcnt)
9cc9b056ea5160 Jack Steiner 2009-06-17 @60  		memcpy(ubuf, gseg + GRU_DS_BASE, dsrcnt * GRU_HANDLE_STRIDE);
9cc9b056ea5160 Jack Steiner 2009-06-17  61  	return 0;
9cc9b056ea5160 Jack Steiner 2009-06-17  62  
9cc9b056ea5160 Jack Steiner 2009-06-17  63  fail:
9cc9b056ea5160 Jack Steiner 2009-06-17  64  	return -EFAULT;
9cc9b056ea5160 Jack Steiner 2009-06-17  65  }
9cc9b056ea5160 Jack Steiner 2009-06-17  66  

:::::: The code at line 60 was first introduced by commit
:::::: 9cc9b056ea51608788609d7e26c7db55ef81bb2e gru: dump chiplet state

:::::: TO: Jack Steiner <steiner@sgi.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
