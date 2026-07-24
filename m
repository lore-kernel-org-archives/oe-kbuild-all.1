Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB5432E72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900051; cv=none; b=qfR48CyBrrm3ByV/l0eDMqISga+3RZk2Yl7Dbf03Or6n/3izlstZ0SxS1TiK6WnOnooDxiQ6EUmk0qhjUjBrrms6xnSNMUq6pauIKpTxLNXKhXKSqWs6tNdSmnWh5lOWThPgG7wlTGKTSilQUBfo9Q+lnvJoXu0q2TLEBpbavxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900051; c=relaxed/simple;
	bh=HCi4xO+oZO+F1vmtPFTVqw36/Cr9j3p5ty+lqMpqkjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LSO5fSk+IUqS3DFMRT+YWWz+gKo5sVqgAHgaAXmGadCPDM/OtZnhgLw87DLlmYiYXSvlgohNncXiRCAFCfne21+Njc72kue7h35RFNNuxFWMUIak5zIFe5dgJZYRbWEkTYXmCGr2Wu/6Zz5fhsDR/riZQqd6GxZRnCGgaEMaos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVA0z4UI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVA0z4UI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784900050; x=1816436050;
  h=date:from:to:cc:subject:message-id;
  bh=HCi4xO+oZO+F1vmtPFTVqw36/Cr9j3p5ty+lqMpqkjU=;
  b=lVA0z4UIbqIFnUX1wXnth5ofiqwgVQeMV2BsrAfqt9wZojKcThndanzI
   etwDNNh9/gnsJUeJ1qqC3JNR6QZYwqCdzAnTkDx0Pvv1quCIhNTpDekfw
   9FEndPCFu4ooZJmLdRU7Rpd2L/BAd3FsXFdHN8Eb/uYVJxwrtbLeksdi3
   ItwOF2UoFtCs0aWBsv+PUGLl+Fd+D5JjKwDRP65HOUp+jLp7cCUb/sXGj
   VsiM/vXRt5xDdWOqs6aW2jfIGa2YHTNaCRI0XS3eQRwVbErZiRuEY3iNh
   o1W6I0opRuXQ02pyVts0MohC0DZR0Nf0xuU5b6JXDfqTbkcxsO+GubKta
   Q==;
X-CSE-ConnectionGUID: kBVTXk8nT4qKj/LG0SL6Dw==
X-CSE-MsgGUID: ++gXEwg7QSasiDZm4D3qRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89455824"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="89455824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 06:34:09 -0700
X-CSE-ConnectionGUID: 8yJCjbu3R+imxNNkEgibFg==
X-CSE-MsgGUID: vx2i6CJeRiWRKF1Kh5dX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="259368202"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Jul 2026 06:34:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnG2P-00000000apb-0AIu;
	Fri, 24 Jul 2026 13:34:05 +0000
Date: Fri, 24 Jul 2026 21:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Law <objecting@objecting.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/mips/boot/compressed/decompress.c:undefined reference
 to `__ashldi3'
Message-ID: <202607242144.ZsfAPGBh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
date:   4 months ago
config: mips-randconfig-r134-20260724 (https://download.01.org/0day-ci/archive/20260724/202607242144.ZsfAPGBh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607242144.ZsfAPGBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607242144.ZsfAPGBh-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `$L13':
>> arch/mips/boot/compressed/decompress.c:(.text+0xfc): undefined reference to `__ashldi3'
   mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `$L12':
   arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
