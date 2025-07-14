Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED58E253F1B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501014; cv=none; b=YG+s/NHSIjEBF0Z/DH28MmfFX1RSZG86n/j3bzRzRlnsp8zsIN/ZqxyXZhyVbiXq2pC93GNV1iKpPljzsR+IyVcD1y62ergtF0mJNvzYDklirp1mhbykBbPP0zDHeP2x2nqUQ0K/DlJATBdmWe4zN6Th99kz2anFtIvDVi5zAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501014; c=relaxed/simple;
	bh=Xjp3x+4cJ5I8IZ3tOdJq1iARVBXN0H42eMzIyBy1cfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVaXYZBnspeP/NHlaT5qWk1b0ZMeVEJmXGaaa16iU0f/VuM4QNwAG+FSpz4Rs/61QxgNGu4ezc6BLX5TCjtoDGBIjh3X7szVrkYsV3fKSibxSd/wofd//X6N21G2Iwl6W1dQFDSVhisRnASFCbIDM/IFFY94lkvPAAOiTAA7Uhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEeDUYbX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEeDUYbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752501014; x=1784037014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xjp3x+4cJ5I8IZ3tOdJq1iARVBXN0H42eMzIyBy1cfk=;
  b=XEeDUYbXDZ9ktYfpNb4mlbLJmWI57RGhW1L4zocGRMk7uEynIKCizKyE
   FHeVCnFoAoTNhAVLZLLhgNNngadfqIvxjbjvs5JiZHp6RD6/1jEhBPefS
   vPDwtV8OR0jKvJy85/96OPWG096OXPOh/coxj1REcF8hHCURzQJH+2x62
   z/8Tp5PlzIQWdFcE6knPCjDfl9uF5qjap7TT6u6d+n+bdZg6/XN1+doLz
   deIaVX36AcwycasgFOkjok8cIE7HBGELsVn7U7CWYtKjFAlBzAS6WXPdM
   T7xSsIqAvNB40MPXNmP2nFv6AZKxAOpj37GxCz+LFIQB+PNxyasWz12Ri
   w==;
X-CSE-ConnectionGUID: zwQvRw4EQkGHXO97CWnrkg==
X-CSE-MsgGUID: ttrLp4jJQQWiOcNLf+3yEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54549870"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="54549870"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 06:50:13 -0700
X-CSE-ConnectionGUID: DImYRdBCTmmBfpQ2ggCcrw==
X-CSE-MsgGUID: G5BDbrKsQeWlbtUr8d+fgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="157279433"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2025 06:50:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubJZJ-0008vv-02;
	Mon, 14 Jul 2025 13:50:09 +0000
Date: Mon, 14 Jul 2025 21:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-has-macros 6/7]
 include/linux/page-flags-layout.h:36:44: error: expected ',' before ')'
 token
Message-ID: <202507142145.8N2vzhLY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-has-macros
head:   51063ab687181b4aec3cfdb1def38e50381918b8
commit: 11faa0849428a557f3c0b638da0c7452871efb9b [6/7] DELETEME
config: arc-randconfig-001-20250714 (https://download.01.org/0day-ci/archive/20250714/202507142145.8N2vzhLY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507142145.8N2vzhLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507142145.8N2vzhLY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:20,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/page-flags-layout.h:36:44: error: expected ',' before ')' token
    _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
                                               ^
   In file included from include/linux/mm_types.h:12,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/maple_tree.h:27:44: error: expected ',' before ')' token
    _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
                                               ^
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/mmzone.h:1122:44: error: expected ',' before ')' token
    _Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
                                               ^
   make[3]: *** [scripts/Makefile.build:182: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=1322854876
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=1322854876
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1322854876
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1322854876
   make: Target 'prepare' not remade because of errors.


vim +36 include/linux/page-flags-layout.h

    35	
  > 36	_Static_assert(!IS_ENABLED(BUILD_VDSO32_64));
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
