Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D33C62A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxrD9G4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700179474; x=1731715474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhH7u1dVutBgChfQiLWCRnXfOfLR8ytyAeWNycBHTIQ=;
  b=KxrD9G4nzVsTf0z5aze+7AmqKqSegNxf0qMmMnn7aYKsAglA5bOHG7FB
   SeZ/pVSeww2mf27y4TqVxn+VP9uvFOo/ALDpmCGRDzqR/9LEOJI7Tkl/H
   QWUsHFRvvs2Zwdjfk2T0doygOaRIMECPJ8Ma1Cq1oW2p4W7XBGFOCDhVB
   ZDcwCYXiqWy/Ls15jcQPiG/+mDoU5tBGpNOOnixXWQTgYSFirwZjHEHl/
   cJUfNnY1faF0m36LZ+AFMniaHnXMufMm70r4iAOo+Knmhb4ghazBl5fKP
   eGGhT0WdcRAY3JHSuYh31pKE4MoXnH3OJulZZc7tmhBXUdXP2XRI7J2kw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390988271"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="390988271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="13296077"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2023 16:04:32 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3mLV-00029X-1u;
	Fri, 17 Nov 2023 00:04:29 +0000
Date: Fri, 17 Nov 2023 08:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: arch/riscv/kernel/traps.c:405:1: sparse: sparse: symbol
 '__pcpu_scope_overflow_stack' was not declared. Should it be static?
Message-ID: <202311170738.xXn02awd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475e51b87969e01a6812eac713a1c8310372e8a
commit: be97d0db5f44c0674480cb79ac6f5b0529b84c76 riscv: VMAP_STACK overflow detection thread-safe
date:   3 weeks ago
config: riscv-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231117/202311170738.xXn02awd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170738.xXn02awd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170738.xXn02awd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kernel/traps.c:405:1: sparse: sparse: symbol '__pcpu_scope_overflow_stack' was not declared. Should it be static?

vim +/__pcpu_scope_overflow_stack +405 arch/riscv/kernel/traps.c

   403	
   404	#ifdef CONFIG_VMAP_STACK
 > 405	DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
   406			overflow_stack)__aligned(16);
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
