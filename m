Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92022199FA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734962235; cv=none; b=JA9ThyA6E9vTVfVu/I308Cb1a8VYHZyrx3cXJtm5IZ3NoCFQYJ/kzWV9AjjcStGwJ5DSJLeqAF4uEnsQWzCVfu0d28KiRwyVg1luNeWMeoaMKcyId9TWeKrdHoKYK82RN0oC3MrbbY2s6DwtfZ0SkGgTKaVJsqQZvZbmo01jGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734962235; c=relaxed/simple;
	bh=Igz8YYmz3h+yfD37If1IP7PyLU60cClhdjb/or+wRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPoIWKzZ1Rz6IEgXonSgsNbGqI2ofgWqh3G4yDVm2RInyMr8wtctthYoiqB4hUT7M1wSf6Xi4ao0bbWFnkf0WQuDF5eTPgsPyoNLkeCsI1hDkxiaD2RcwGhPNwgdz0dkF0Ag5Nz8eSqRt3oSmrfMDLtzWSoGrffGapBCXCYPVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9aQnxtE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9aQnxtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734962233; x=1766498233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Igz8YYmz3h+yfD37If1IP7PyLU60cClhdjb/or+wRRs=;
  b=U9aQnxtEX39PpKTyv1o/F4/xuScFGLoncISnLnBZHpRc6ZBwULmKrBqj
   TaGATd724KpjueZsExVNLFAYlK/cP+o0GoqA8JW3G5nk/gI+VA65pVFCq
   3WKTWK2md2y5Cc44GeOqRna8yA2TbIS8pMs9CMJiv9fF0NWSaA/hE1lnn
   d+RQ2gtu2cCj61kB+tnAvr9PUHq1E5N0xp+2VhlvQtq+guA8+07xHaGiZ
   8K7kdDXgv2rIlkipv9c2A0mDIGjQavHx1O5L4WkYInq9CUI7PCt4E1xxB
   x/tUjW41J6pziDnpCDSJJDz97lS0eMn0dTMu9qbYk4t/DdLRnignzi6hJ
   w==;
X-CSE-ConnectionGUID: 4CdOxgemT4i7OXL491khBg==
X-CSE-MsgGUID: VYC6WjyzQzipWVBHfBHp2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="34737405"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="34737405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 05:57:13 -0800
X-CSE-ConnectionGUID: xxyf5MhDR8K4b5LrBwD9Fw==
X-CSE-MsgGUID: f18S/RWORwiGLntBLASRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="104195083"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2024 05:57:11 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPivl-0003f9-01;
	Mon, 23 Dec 2024 13:57:09 +0000
Date: Mon, 23 Dec 2024 21:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Marco Elver <elver@google.com>
Subject: drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202412232152.PiRThU4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   7 months ago
config: x86_64-randconfig-r111-20241223 (https://download.01.org/0day-ci/archive/20241223/202412232152.PiRThU4w-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412232152.PiRThU4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412232152.PiRThU4w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void const *
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     got void [noderef] __user *[addressable] ubuf
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void const *
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     got void [noderef] __user *[addressable] ubuf
>> drivers/misc/sgi-gru/grukdump.c:60:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __user *[addressable] ubuf @@
   drivers/misc/sgi-gru/grukdump.c:60:17: sparse:     expected void *
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

9cc9b056ea51608 Jack Steiner 2009-06-17  34  
9cc9b056ea51608 Jack Steiner 2009-06-17  35  static int gru_dump_context_data(void *grubase,
9cc9b056ea51608 Jack Steiner 2009-06-17  36  			struct gru_context_configuration_handle *cch,
b8229bedd1f3979 Jack Steiner 2009-12-15  37  			void __user *ubuf, int ctxnum, int dsrcnt,
b8229bedd1f3979 Jack Steiner 2009-12-15  38  			int flush_cbrs)
9cc9b056ea51608 Jack Steiner 2009-06-17  39  {
9cc9b056ea51608 Jack Steiner 2009-06-17  40  	void *cb, *cbe, *tfh, *gseg;
9cc9b056ea51608 Jack Steiner 2009-06-17  41  	int i, scr;
9cc9b056ea51608 Jack Steiner 2009-06-17  42  
9cc9b056ea51608 Jack Steiner 2009-06-17  43  	gseg = grubase + ctxnum * GRU_GSEG_STRIDE;
9cc9b056ea51608 Jack Steiner 2009-06-17  44  	cb = gseg + GRU_CB_BASE;
9cc9b056ea51608 Jack Steiner 2009-06-17  45  	cbe = grubase + GRU_CBE_BASE;
9cc9b056ea51608 Jack Steiner 2009-06-17  46  	tfh = grubase + GRU_TFH_BASE;
9cc9b056ea51608 Jack Steiner 2009-06-17  47  
9cc9b056ea51608 Jack Steiner 2009-06-17  48  	for_each_cbr_in_allocation_map(i, &cch->cbr_allocation_map, scr) {
b8229bedd1f3979 Jack Steiner 2009-12-15  49  		if (flush_cbrs)
b8229bedd1f3979 Jack Steiner 2009-12-15  50  			gru_flush_cache(cb);
9cc9b056ea51608 Jack Steiner 2009-06-17  51  		if (gru_user_copy_handle(&ubuf, cb))
9cc9b056ea51608 Jack Steiner 2009-06-17  52  			goto fail;
9cc9b056ea51608 Jack Steiner 2009-06-17  53  		if (gru_user_copy_handle(&ubuf, tfh + i * GRU_HANDLE_STRIDE))
9cc9b056ea51608 Jack Steiner 2009-06-17  54  			goto fail;
9cc9b056ea51608 Jack Steiner 2009-06-17  55  		if (gru_user_copy_handle(&ubuf, cbe + i * GRU_HANDLE_STRIDE))
9cc9b056ea51608 Jack Steiner 2009-06-17  56  			goto fail;
9cc9b056ea51608 Jack Steiner 2009-06-17  57  		cb += GRU_HANDLE_STRIDE;
9cc9b056ea51608 Jack Steiner 2009-06-17  58  	}
9cc9b056ea51608 Jack Steiner 2009-06-17  59  	if (dsrcnt)
9cc9b056ea51608 Jack Steiner 2009-06-17 @60  		memcpy(ubuf, gseg + GRU_DS_BASE, dsrcnt * GRU_HANDLE_STRIDE);
9cc9b056ea51608 Jack Steiner 2009-06-17  61  	return 0;
9cc9b056ea51608 Jack Steiner 2009-06-17  62  
9cc9b056ea51608 Jack Steiner 2009-06-17  63  fail:
9cc9b056ea51608 Jack Steiner 2009-06-17  64  	return -EFAULT;
9cc9b056ea51608 Jack Steiner 2009-06-17  65  }
9cc9b056ea51608 Jack Steiner 2009-06-17  66  

:::::: The code at line 60 was first introduced by commit
:::::: 9cc9b056ea51608788609d7e26c7db55ef81bb2e gru: dump chiplet state

:::::: TO: Jack Steiner <steiner@sgi.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
