Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07507194A45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745153505; cv=none; b=ekmaCbzeTObjv/6+MBOM9hw4qwtCnK+Bx4pQKCyfC20OhrSMp7yaViZvXSxpWGQM20wpg6Ux0QvZU3CYuRLPyhIHDKpVmt3DWloDxLENW6B0V17BpIKufqSQnO48x9h0JDrqNypWo6dmIuFiF5F07Hjx/TkIoWLwWu2ALCIO7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745153505; c=relaxed/simple;
	bh=C8Af2N0kBPrIub1qvHJO8R8Bka0eB17pKxNjzjbOrVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qh8khEg7SCIW/0Q1X3D6rP+gbTgloe7ct3T4xPqGz8z/64y4C0VpMjldpeXav7eRArHEHw6B/1bLGTJ0/TuuvCtGl4nWbq58WZ0bTn1skI17ss8J8ipT/k1Wcu/avuYJF0J8B+v0K+UbmbPZJ+YDOrIcsplloooLzJjdddvzynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKjUVx4G; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKjUVx4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745153504; x=1776689504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8Af2N0kBPrIub1qvHJO8R8Bka0eB17pKxNjzjbOrVw=;
  b=eKjUVx4GFDP55ax9PtKgiD4F1KGJki5loPIYdKZqHPLPT3TQhpSOxxqB
   vwdjhw/T7cAuDOMeqH3wuEQB7bAD2JGk7zsMM3yTi+m8AbCNtZuyWqXmN
   VL5pvT/45IzQfTscGCGgrphOkxpC/plL5sqBk5Ht0IO4VZyNhOrTq0Pf6
   69jTE5rMfnPn1siO7qqzFOzPcMGb9yspP3Qu/ZJdvnSZ9T0z3WLs+kb1e
   PgsusCB3/lUpt2ahon4jMbGBleHuOZ61zvO81aBoPcxe7EHCfYlWsPnn9
   3gqjWq/QM3iVa/hAYHnj2HTkd+bXyZjSg1GVRaqJJDmpEN532rxooZKtD
   Q==;
X-CSE-ConnectionGUID: IV840ZWGTTS0YVfpxG6Zag==
X-CSE-MsgGUID: Fdr2qZpESDCufA+TAle6oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58089026"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="58089026"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 05:51:43 -0700
X-CSE-ConnectionGUID: 15K1UcijR0mGM96mPEs7jw==
X-CSE-MsgGUID: HZrENyffTd+oBde7vtLGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="132380837"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Apr 2025 05:51:42 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6U96-0004do-1A;
	Sun, 20 Apr 2025 12:51:40 +0000
Date: Sun, 20 Apr 2025 20:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/e820 20/20] arch/x86/kernel/e820.c:689
 e820_search_gap() warn: always true condition '(--idx >= 0) => (0-u32max >=
 0)'
Message-ID: <202504202009.7Aa0Hjhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/e820
head:   00188fb1706a5b13228b766cb47dcda740319a86
commit: 00188fb1706a5b13228b766cb47dcda740319a86 [20/20] x86/boot/e820: Standardize e820 table index variable types under 'u32'
config: x86_64-randconfig-161-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202009.7Aa0Hjhv-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202009.7Aa0Hjhv-lkp@intel.com/

smatch warnings:
arch/x86/kernel/e820.c:689 e820_search_gap() warn: always true condition '(--idx >= 0) => (0-u32max >= 0)'
arch/x86/kernel/e820.c:689 e820_search_gap() warn: always true condition '(--idx >= 0) => (0-u32max >= 0)'

vim +689 arch/x86/kernel/e820.c

640e1b38b00550 Ingo Molnar  2017-01-28  679  
b79cd8f1268bab Yinghai Lu   2008-05-11  680  /*
640e1b38b00550 Ingo Molnar  2017-01-28  681   * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
b79cd8f1268bab Yinghai Lu   2008-05-11  682   */
640e1b38b00550 Ingo Molnar  2017-01-28  683  static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsize)
b79cd8f1268bab Yinghai Lu   2008-05-11  684  {
5eb2ac088742dc Ingo Molnar  2025-04-19  685  	u64 last = MAX_GAP_END;
00188fb1706a5b Ingo Molnar  2025-04-20  686  	u32 idx = e820_table->nr_entries;
b79cd8f1268bab Yinghai Lu   2008-05-11  687  	int found = 0;
b79cd8f1268bab Yinghai Lu   2008-05-11  688  
11e964fb08717c Ingo Molnar  2025-04-20 @689  	while (--idx >= 0) {
11e964fb08717c Ingo Molnar  2025-04-20  690  		u64 start = e820_table->entries[idx].addr;
11e964fb08717c Ingo Molnar  2025-04-20  691  		u64 end = start + e820_table->entries[idx].size;
b79cd8f1268bab Yinghai Lu   2008-05-11  692  
b79cd8f1268bab Yinghai Lu   2008-05-11  693  		/*
b79cd8f1268bab Yinghai Lu   2008-05-11  694  		 * Since "last" is at most 4GB, we know we'll
640e1b38b00550 Ingo Molnar  2017-01-28  695  		 * fit in 32 bits if this condition is true:
b79cd8f1268bab Yinghai Lu   2008-05-11  696  		 */
b79cd8f1268bab Yinghai Lu   2008-05-11  697  		if (last > end) {
b79cd8f1268bab Yinghai Lu   2008-05-11  698  			unsigned long gap = last - end;
b79cd8f1268bab Yinghai Lu   2008-05-11  699  
3381959da5a00a Alok Kataria 2008-06-24  700  			if (gap >= *gapsize) {
3381959da5a00a Alok Kataria 2008-06-24  701  				*gapsize = gap;
3381959da5a00a Alok Kataria 2008-06-24  702  				*gapstart = end;
b79cd8f1268bab Yinghai Lu   2008-05-11  703  				found = 1;
b79cd8f1268bab Yinghai Lu   2008-05-11  704  			}
b79cd8f1268bab Yinghai Lu   2008-05-11  705  		}
b79cd8f1268bab Yinghai Lu   2008-05-11  706  		if (start < last)
b79cd8f1268bab Yinghai Lu   2008-05-11  707  			last = start;
b79cd8f1268bab Yinghai Lu   2008-05-11  708  	}
3381959da5a00a Alok Kataria 2008-06-24  709  	return found;
3381959da5a00a Alok Kataria 2008-06-24  710  }
3381959da5a00a Alok Kataria 2008-06-24  711  

:::::: The code at line 689 was first introduced by commit
:::::: 11e964fb08717cc43248f60723a55672cb0f2624 x86/boot/e820: Standardize e820 table index variable names under 'idx'

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
