Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623B2595
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412359; cv=none; b=E7fLSdpK4F4fumBdlSEoGhizrPcBQXa9wMdfHAw8sc/qpMFKFVQ9wOMAkQl2Xd+pqNMl/HWSQrhqiCK//MthmNkeFM34NT/nqCtrUSyylpY50SLhBerJGY1OssnZoPr0GbnhCVH5eOnepV2dUytI4bqNm4Qf6ZmYg/dNNM0rtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412359; c=relaxed/simple;
	bh=2njkf8xFDB7DlGPUIjZTs5wO/czhLZQ/f1U24J9QMxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYtv6R2YylMp46IarObwIrFHFAAfeyyQFejGqUEDBwxHUuS2swr7ovTC+5Myh0Oy+ajnb/XODubDcUeUvsqrSBJ7WYi+l6qqGzAwPFg00A1U2s68+hhHiFoeQF8wFk/2OnINpFgEV5e3YPWzy4xfm4T8jVhr5AbZNg4LdKP2jAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVtA7tgr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVtA7tgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723412358; x=1754948358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2njkf8xFDB7DlGPUIjZTs5wO/czhLZQ/f1U24J9QMxk=;
  b=dVtA7tgrIP4Qj3wq5tCXEQYqQA9wY852rYLnG0lnIZgEIiqbuvXDeTDX
   pTrGg28QCv49G2LCpF4pKTYvgatITlzj9CTwij8yeksTdo6EO9/b3pxWY
   8xlsDDc14KvUGGZ1YaBZuwSjOSASR97SJrQtfIEMe5VGXvpNxBRCaKoGY
   1oY0HIyOUmgXr15lggrL1I7Th84HaTFWiKySA0I2IACut0n+iYoeFDueV
   tBDR1PeUrzRWk+uUc5iGUBybM4aZKdYJPOVd5wOOLcZCO4F5Oo/Ot9qIY
   Kj5BtdVNFj9qYabthoa3qjFk45+MB/A5hNrcKPZ3G6+rUm2PYJxa/XN5Y
   A==;
X-CSE-ConnectionGUID: XFG9VuYfQhG3PKt3bjpTWg==
X-CSE-MsgGUID: kmsa0hV7RXWqjJSIr0RekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21652265"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21652265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 14:39:17 -0700
X-CSE-ConnectionGUID: dn9gF83gTimsqYWI8FdPeQ==
X-CSE-MsgGUID: wppGkJaNSiG6aDpNnqRjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58014509"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Aug 2024 14:39:15 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdGHR-000B9l-1a;
	Sun, 11 Aug 2024 21:39:13 +0000
Date: Mon, 12 Aug 2024 05:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 814/1086]
 include/asm-generic/bitops/fls.h:33:undefined reference to `arch_dma_free'
Message-ID: <202408120535.Bwd55Pwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   b1958dd84c15d74ebe7cd7887c17287f480cb18e
commit: 5a5de0239cc21c0977deefc93a6a16e6538c64ee [814/1086] cache: ax45mp_cache: Add non coherent support
config: riscv-randconfig-001-20240811 (https://download.01.org/0day-ci/archive/20240812/202408120535.Bwd55Pwc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408120535.Bwd55Pwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408120535.Bwd55Pwc-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: kernel/dma/direct.o: in function `translate_phys_to_dma':
   include/linux/dma-direct.h:33:(.text+0x458): undefined reference to `arch_dma_alloc'
   riscv32-linux-ld: kernel/dma/direct.o: in function `fls':
>> include/asm-generic/bitops/fls.h:33:(.text+0x59a): undefined reference to `arch_dma_free'


vim +33 include/asm-generic/bitops/fls.h

136abb32d6b4ac Akinobu Mita   2006-03-26   4  
136abb32d6b4ac Akinobu Mita   2006-03-26   5  /**
136abb32d6b4ac Akinobu Mita   2006-03-26   6   * fls - find last (most-significant) bit set
136abb32d6b4ac Akinobu Mita   2006-03-26   7   * @x: the word to search
136abb32d6b4ac Akinobu Mita   2006-03-26   8   *
136abb32d6b4ac Akinobu Mita   2006-03-26   9   * This is defined the same way as ffs.
136abb32d6b4ac Akinobu Mita   2006-03-26  10   * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
136abb32d6b4ac Akinobu Mita   2006-03-26  11   */
136abb32d6b4ac Akinobu Mita   2006-03-26  12  
3fc2579e6f162f Matthew Wilcox 2019-01-03  13  static __always_inline int fls(unsigned int x)
136abb32d6b4ac Akinobu Mita   2006-03-26  14  {
136abb32d6b4ac Akinobu Mita   2006-03-26  15  	int r = 32;
136abb32d6b4ac Akinobu Mita   2006-03-26  16  
136abb32d6b4ac Akinobu Mita   2006-03-26  17  	if (!x)
136abb32d6b4ac Akinobu Mita   2006-03-26  18  		return 0;
136abb32d6b4ac Akinobu Mita   2006-03-26  19  	if (!(x & 0xffff0000u)) {
136abb32d6b4ac Akinobu Mita   2006-03-26  20  		x <<= 16;
136abb32d6b4ac Akinobu Mita   2006-03-26  21  		r -= 16;
136abb32d6b4ac Akinobu Mita   2006-03-26  22  	}
136abb32d6b4ac Akinobu Mita   2006-03-26  23  	if (!(x & 0xff000000u)) {
136abb32d6b4ac Akinobu Mita   2006-03-26  24  		x <<= 8;
136abb32d6b4ac Akinobu Mita   2006-03-26  25  		r -= 8;
136abb32d6b4ac Akinobu Mita   2006-03-26  26  	}
136abb32d6b4ac Akinobu Mita   2006-03-26  27  	if (!(x & 0xf0000000u)) {
136abb32d6b4ac Akinobu Mita   2006-03-26  28  		x <<= 4;
136abb32d6b4ac Akinobu Mita   2006-03-26  29  		r -= 4;
136abb32d6b4ac Akinobu Mita   2006-03-26  30  	}
136abb32d6b4ac Akinobu Mita   2006-03-26  31  	if (!(x & 0xc0000000u)) {
136abb32d6b4ac Akinobu Mita   2006-03-26  32  		x <<= 2;
136abb32d6b4ac Akinobu Mita   2006-03-26 @33  		r -= 2;
136abb32d6b4ac Akinobu Mita   2006-03-26  34  	}
136abb32d6b4ac Akinobu Mita   2006-03-26  35  	if (!(x & 0x80000000u)) {
136abb32d6b4ac Akinobu Mita   2006-03-26  36  		x <<= 1;
136abb32d6b4ac Akinobu Mita   2006-03-26  37  		r -= 1;
136abb32d6b4ac Akinobu Mita   2006-03-26  38  	}
136abb32d6b4ac Akinobu Mita   2006-03-26  39  	return r;
136abb32d6b4ac Akinobu Mita   2006-03-26  40  }
136abb32d6b4ac Akinobu Mita   2006-03-26  41  

:::::: The code at line 33 was first introduced by commit
:::::: 136abb32d6b4acf196425fb3968ebb368d84280e [PATCH] bitops: generic fls()

:::::: TO: Akinobu Mita <mita@miraclelinux.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
