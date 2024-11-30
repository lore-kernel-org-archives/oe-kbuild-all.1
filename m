Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28742AA4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732980660; cv=none; b=EmFhegR10zSWHTbboCESZQ3WmiY1jGx3Sj9s9qpPGdQ/5ywS4uPA46fxDcbrF6nCWdaTnGa1unD1q2ar+lo8gZbmsto03SlPbSOZmqivE2FMyyh2XFLLHwqK9mtd1xQglvRJxGKMx+/8OKGXrxn5R+ZqbRzYlfKtrEQvzrvewr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732980660; c=relaxed/simple;
	bh=oT9waIkIkkIDDtu1EVOfYovXOkkXNe9r1HZSd1PMIAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/wjOuvW31I9578z2L0jVaFLwrTjrvv2q55J0QHRtfe0jm2pS0xJt6MKXBGTher1AGsBjIs4TuULUFHf70hA+6EqaRxb0YIte0bW6TMNhyqDdputgJ4VDvzcc72t/dJdb2YjaW4ms45V7ondnjO7n5F+g61PLV3Qy8lUObPIbfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIHhUyPS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIHhUyPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732980658; x=1764516658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oT9waIkIkkIDDtu1EVOfYovXOkkXNe9r1HZSd1PMIAs=;
  b=HIHhUyPSDAca8n3W/u0PM7Us4lcYBqtvy7PW3ZiPhCPUdKG4bGo8FBJ8
   fIQBgpkvp2TFj7RoUvhz+Kv28xMYH+j2FMNN5nZMNEF+83HQG/R4JSDrI
   APWwGdSpe2n5fFM3CjEB6QFWqDR0JFhL/2mFV/QMHW3hRcOcKHJ3L8Yx7
   JBZ/7K3923ZQlpCUg/8iGCoqjH+NeyvGmiK9I8r4QIFEkzitdIX77qiR0
   mLbuMw+p4bd3za/R5UGouLuonOtAc71k1f3vVVDWHwBTGuwqanDC2hRUT
   OZN2PDF3PZfqeWysa2uo5ec7In0XMMI+mmDnqjHzjk7nKIZf7e7PHGe4G
   Q==;
X-CSE-ConnectionGUID: SIexvQ6vQJKYz52jTRr3ug==
X-CSE-MsgGUID: Wmx1sQepQsa4gvaCaKMrTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33048558"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="33048558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 07:30:57 -0800
X-CSE-ConnectionGUID: o8ncxb24QtenWfIRPjtkgw==
X-CSE-MsgGUID: Qx7ZPBjWSM6HW9rfPLEh6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="93173849"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 Nov 2024 07:30:56 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHPQ0-0000lK-1y;
	Sat, 30 Nov 2024 15:30:13 +0000
Date: Sat, 30 Nov 2024 23:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: error: ABI 'o32' is not supported on CPU 'mips4'
Message-ID: <202411302320.drPYfjqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiaxun,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: bfc0a330c1b4526b88f6f9e711484b342cb00fb5 MIPS: Fallback CPU -march flag to ISA level if unsupported
date:   9 months ago
config: mips-randconfig-r112-20241007 (https://download.01.org/0day-ci/archive/20241130/202411302320.drPYfjqR-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411302320.drPYfjqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411302320.drPYfjqR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: ABI 'o32' is not supported on CPU 'mips4'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: ABI 'o32' is not supported on CPU 'mips4'
>> error: ABI 'o32' is not supported on CPU 'mips4'
   make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1198: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
