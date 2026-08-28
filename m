Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1023A564
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888100; cv=none; b=D25T1Y5xK+4oOTBJHS8/JPKmBBij8aahDWrRrG5K6cqmL2y3I8ALsyzXWTeaHl8XDmUwgF5jI/0tY1eOgF120R554JuKtvcKB78VRR4wou+EMkInzKD/NtGYkZukJwLkCykCT50uYAsT/xtxhx9SA2qaFkxH2BgOFM0pspG/4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888100; c=relaxed/simple;
	bh=QkjKb17vnfJWdfUOCEuDfWu4ylVQ4LaYwObMKPZPXAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WnxYz5WyYJvAWe9sn7jdXzcsMfWrG6EbYaW4MHnhlo129+HlORUmY9jh/jqu5mLdwbO2GXj9tRAmTFfZyi6Foi5Etu4AfbgSblYx+mcpDMzxL7Dm0C/fMVsgY7FyFFX+W6LMIp9Lri39opPYeph6HvDnkj7mpbyZcVvRwahDVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvET8Gsb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvET8Gsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787888098; x=1819424098;
  h=date:from:to:cc:subject:message-id;
  bh=QkjKb17vnfJWdfUOCEuDfWu4ylVQ4LaYwObMKPZPXAU=;
  b=DvET8GsbHWN6QIQrC+9XQEpnXzz7dxbo8ZO3Vp2VsKFoP6ZOr4sXX2t1
   Xwpfdhd6P+OzKeBbpcqLCypX5xCJgfu1t6WxrHiOJ1koN9vdqndNAkC9t
   bakgHmZJ/zDVV+NQF8VkUyDDeoIPswVoHatrW4JVSpxPKrZ5in3GG+yHf
   xYu6S/oUz6dCUTu3iAF5mCI4Y5kBF5ct47xToXIYNkjR3dsa1J513mJoN
   cIGxDL+sV9CcQsCHFYLdsLaHQq1tcPgsKkUU9wBmZDBW4grdvNkFbozlT
   RmjORPNGsAD/jROr/GhK/gzIRQeZOoxh5GAs0kY6PCFOh96NTcBkrtr4B
   A==;
X-CSE-ConnectionGUID: ldSYO2dIRpCotCzyPB5Q9w==
X-CSE-MsgGUID: OhDihf63RZ2bfPyj5m4Zjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88519337"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88519337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 20:34:56 -0700
X-CSE-ConnectionGUID: Tb5LrqwKQ4Si71R5vC76IA==
X-CSE-MsgGUID: Fro1YovdQ56gEmKQDEuGKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="268615230"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2026 20:34:56 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wznMj-00000000AJ5-0kCd;
	Fri, 28 Aug 2026 03:34:53 +0000
Date: Fri, 28 Aug 2026 11:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-mm-ro-pmds-puds 2/2]
 arch/arm64/include/asm/pgtable.h:984:30: error: no member named 'p4d' in
 'p4d_t'
Message-ID: <202608281105.Cffss7UO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-mm-ro-pmds-puds
head:   94ed97bda114e544f5563b31ac9babc7508ac535
commit: 94ed97bda114e544f5563b31ac9babc7508ac535 [2/2] WIP
config: arm64-randconfig-r051-20260828 (https://download.01.org/0day-ci/archive/20260828/202608281105.Cffss7UO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281105.Cffss7UO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281105.Cffss7UO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:13:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:984:30: error: no member named 'p4d' in 'p4d_t'
     984 |                 set_readonly_ptval(pa, p4d.p4d);
         |                                        ~~~ ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:185: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1414: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +984 arch/arm64/include/asm/pgtable.h

   978	
   979	static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
   980	{
   981		u64 pa;
   982	
   983		if (in_kernel_rodata_lmalias(p4dp, &pa)) {
 > 984			set_readonly_ptval(pa, p4d.p4d);
   985			return;
   986		}
   987	
   988		WRITE_ONCE(*p4dp, p4d);
   989		queue_pte_barriers();
   990	}
   991	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
