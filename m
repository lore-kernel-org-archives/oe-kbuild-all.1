Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED2E125AA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 02:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783133129; cv=none; b=Ld/0We0gJQl+66d3LZoeI1fYD+SnPkpPs47L6n6gGpcV3p2VtZL6z3qQaXXOojYbk7Tu/AU252XQrYVvI9g9arcn6SIbZLwicuRkE5Y16RrHSz3N/cQLw898LRafTsGKgtaWViVlQ8liliezFMr2e+ZvAFJN0NneSbZ8QDGSYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783133129; c=relaxed/simple;
	bh=b/D8ZvUztMcQ1qyyfqUrTnvwPSvUX8x/ecV5aRTUmQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QrX64cexJG2e4LfWabDBfgdr4506s/wyKG7UeX7a8yqgWKw9DKV8fd3E8jw+hqV+zdTh0Sn+J9HyyMKqCDwzcfHGa1PYXA9nEkb4nRbELWMcZ89QAinmgr9spFKlBBxj4ud61Ilz5paHw9Ci0rd1R97CCn008UQEhSlp6I+d7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f84opxts; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f84opxts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783133128; x=1814669128;
  h=date:from:to:cc:subject:message-id;
  bh=b/D8ZvUztMcQ1qyyfqUrTnvwPSvUX8x/ecV5aRTUmQw=;
  b=f84opxtsTJ0widZjCLLo4yBAKHv2m12oZwHWtH0viv9vSoGXf8k7U46p
   QsrzFpgqa/7z8dphyBXPRlH9bjn+jkePdodNN8olkbH3PupNeHTp9rRyD
   7SkYqbGk+dNjVreR+Z2rvnqKJW2J2wA2M/1Ut25UyXqvyQrrDMOQdy64p
   QSbGMBifDIVAwqM4/pJcJikxHZTXLIPVkndRZyediYiHSMBR9SpODemqm
   MQzvn2cfppvWQIDRkTriscBSbJghOHC35ffgJBfMyksE3zjtlqrsUVhRW
   FKgo7EaHD/hmvsfrz0mvwxWCTthA2FQxY3m+yokwVGFEAglHGVKlaAFNL
   A==;
X-CSE-ConnectionGUID: vye3p+0xRROcyUDCbNmgYw==
X-CSE-MsgGUID: OcdRUM9lRy+33zUPr1O9bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87550491"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87550491"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 19:45:28 -0700
X-CSE-ConnectionGUID: yweFntlzQN6Vz6WTSvB4ig==
X-CSE-MsgGUID: aYqUoLmURMiY39fRrSinKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252763911"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jul 2026 19:45:27 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfqNg-000000001fV-1fVF;
	Sat, 04 Jul 2026 02:45:24 +0000
Date: Sat, 04 Jul 2026 04:45:11 +0200
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 13/13]
 ./include/asm-generic/pgtable-nop4d.h:46:43: error: implicit declaration of
 function 'pgd_val'; did you mean 'pgd_bad'?
Message-ID: <202607040436.rwNEeGy7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   898b37f4865d94ff198bb62dfe2517a6d1b7d44e
commit: 898b37f4865d94ff198bb62dfe2517a6d1b7d44e [13/13] mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260704/202607040436.rwNEeGy7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040436.rwNEeGy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040436.rwNEeGy7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./include/asm-generic/pgtable-nop4d.h: In function 'p4d_offset':
>> ./include/asm-generic/pgtable-nop4d.h:46:43: error: implicit declaration of function 'pgd_val'; did you mean 'pgd_bad'? [-Wimplicit-function-declaration]
      46 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
         |                                           ^~~~~~~
   ././include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   ././include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   ./include/asm-generic/pgtable-nop4d.h:46:9: note: in expansion of macro 'BUILD_BUG_ON'
      46 |         BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
         |         ^~~~~~~~~~~~


vim +46 ./include/asm-generic/pgtable-nop4d.h

    43	
    44	static __always_inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
    45	{
  > 46		BUILD_BUG_ON(__builtin_constant_p(pgd_val(*pgd)));
    47		return (p4d_t *)pgd;
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
