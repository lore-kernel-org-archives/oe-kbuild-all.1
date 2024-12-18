Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0E1B042C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538147; cv=none; b=rFkoI8bhjpWnPv4n+u0hlO5kTHyr93JhsqAmHVGa7DPSxJjHEKrHb/+Ep5OFpy79AQ0NL2lXibupG3ssHNrqn1WbhTenr5vXbM0+w3JKrpXHJUCMJMrr6lurlBuoea558PT3DaaE5QZKBWPJFkoeTI/8PFEHriSrWBxsr7akB0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538147; c=relaxed/simple;
	bh=Hu6a8uyPHXOAb9trG8pTZHSuRoJwnaC72BOQB+Fa9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quTdxU0OQF/9Q5rl3eAioXxL6MKe/kiTie4Ji+AfDQhZknYBmamqyCjP0UxxuXa47P4sDFIcJ3ikD594eEzZsdqNy2ShAOedJ9zsEiVqHgjZUZTdP/3mqdjPt7/hILhXborb9GwNoVXuNUpo5Rgjg+Ek26YLFAmXpz7ddTtV6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaBoAAuy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaBoAAuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734538145; x=1766074145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu6a8uyPHXOAb9trG8pTZHSuRoJwnaC72BOQB+Fa9+s=;
  b=KaBoAAuys+e0VEsBFXc32w1yxn11LOCc5NzZGnT3sYy3PsfgVs8ncSb/
   a5tN7woVLCaBrhbO+8Kjptwck7B4RrBsMFm8YJgor+jxrn7CNCNvqAIyV
   CjBtNluCyndOmBXlZMwvuMl/JUhKDtwf93SmluLWnpdLKEtMsk0okeJ0H
   SNQVnFqlH8l8CgNseAiuu4QBP0XYem3akcXJXCBvLG7l9mOTB0cmQhCbq
   wosKi73eU1l+CIbfFbuT1CdlnuDPyMlBEwTSjndzpsz225iMYGBLb/BWe
   pA9sgJc4wxgOnZz8UttxArSTuzIc18VY5mBaR0QymBYiBfNelcDQZe7Ut
   A==;
X-CSE-ConnectionGUID: Xcdlf7lzQTiUNV0EXZon4A==
X-CSE-MsgGUID: RS0xjPQTTiqBUF9yz+VEzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34903169"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34903169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 08:09:05 -0800
X-CSE-ConnectionGUID: kZE4xsx+R7qId2siqCb7qQ==
X-CSE-MsgGUID: tcYGgiIRTbibMDfKv5E8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="97740078"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Dec 2024 08:09:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNwbd-000GSy-0M;
	Wed, 18 Dec 2024 16:09:01 +0000
Date: Thu, 19 Dec 2024 00:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:p4d_pgd_cdtor 9/10] arch/nios2/mm/pgtable.c:57:15:
 error: implicit declaration of function '__pgd_alloc'; did you mean
 '__pmd_alloc'?
Message-ID: <202412190003.aQzptLta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git p4d_pgd_cdtor
head:   5453d8f69ac04a3a31ea973f98de9e0c58248a42
commit: e6431575bf2a3fe883edca4d6d647886a37e3811 [9/10] asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
config: nios2-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190003.aQzptLta-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190003.aQzptLta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190003.aQzptLta-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/nios2/mm/pgtable.c:53:8: warning: no previous prototype for 'pgd_alloc' [-Wmissing-prototypes]
      53 | pgd_t *pgd_alloc(struct mm_struct *mm)
         |        ^~~~~~~~~
   arch/nios2/mm/pgtable.c: In function 'pgd_alloc':
>> arch/nios2/mm/pgtable.c:57:15: error: implicit declaration of function '__pgd_alloc'; did you mean '__pmd_alloc'? [-Wimplicit-function-declaration]
      57 |         ret = __pgd_alloc(mm, 0);
         |               ^~~~~~~~~~~
         |               __pmd_alloc
>> arch/nios2/mm/pgtable.c:57:13: error: assignment to 'pgd_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      57 |         ret = __pgd_alloc(mm, 0);
         |             ^
   arch/nios2/mm/pgtable.c: At top level:
   arch/nios2/mm/pgtable.c:68:13: warning: no previous prototype for 'pagetable_init' [-Wmissing-prototypes]
      68 | void __init pagetable_init(void)
         |             ^~~~~~~~~~~~~~


vim +57 arch/nios2/mm/pgtable.c

    52	
    53	pgd_t *pgd_alloc(struct mm_struct *mm)
    54	{
    55		pgd_t *ret, *init;
    56	
  > 57		ret = __pgd_alloc(mm, 0);
    58		if (ret) {
    59			init = pgd_offset(&init_mm, 0UL);
    60			pgd_init(ret);
    61			memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
    62			       (PTRS_PER_PGD - USER_PTRS_PER_PGD) * sizeof(pgd_t));
    63		}
    64	
    65		return ret;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
