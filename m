Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7083209
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721489250; cv=none; b=F5/CLeSuUrTdrZs0T3EhdXM6qNyuPTmMU/PT6MzHKVIW8NfBK6YLsiEJfwxB0uLmHyTzJXEA5e1lHPtNtII3xpN6/SwrXz4mQ10aPBULfcxUHOGxCi6Z1tTwx9TseFow/FBqwZs5W92NXaW2Q7NukIMUmvWvEx2ka1OSBwRt0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721489250; c=relaxed/simple;
	bh=D0sv5XZ9byz+zOnSahOJ36BQ8kaQJnq71Ez29hiYD5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aGq3aKcQtFq1MvO4urYrrXixpZ/oP2RJb3Q5QUNyyFP32l/4T4A5JF072OoTcLpFu/nzqf15KRBTN/eWHE1HjQHnaiRmb9Xdl/Owm79xTcbTtb/XMK/32xQ7hixmeRChWavifWvv6PLnFGlHrRVutPAWFae39nq3Nz/DRiiw6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CobgKquP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CobgKquP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721489248; x=1753025248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0sv5XZ9byz+zOnSahOJ36BQ8kaQJnq71Ez29hiYD5s=;
  b=CobgKquPkwvV0zHQ1+QXPiIrWxgZpaCcCgwch2TTqF1ed9CVmxRc4bnp
   fwaaEAG7urmAMkF1KDecYNn/ltOHDO7XDJp8RZhYFKZ0HRMt7/EXHuRhN
   f5yz58FEoM2Z/Qf3hQDWFGFsTehRUvv/IppxD2osOtNFe9sGotvG7Q4+B
   hT/ycffLpI7QGnyEJ7sySpYI0vJCcF23pWZHd+unthZLZaIewvkW6F+IP
   O7c6EON4/eWNzOghz8uNbXNl2YyrCiHmnZoBKUsbeZBU7aHuk2xmhJsgS
   ISf1NQXDathu07WbGUuSK6+YV8MHQ2zgjtnxkIzAkU28TYytn9tHMOfuM
   w==;
X-CSE-ConnectionGUID: fTcs7UOjSYa+5FO0WeQVHg==
X-CSE-MsgGUID: 585k4OTITJGX9yIYsjpVcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19233620"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="19233620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:27:28 -0700
X-CSE-ConnectionGUID: e1J45hqfSSu09/27EVAFMA==
X-CSE-MsgGUID: voDCteKLT0+zMahPAPTvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="56245158"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jul 2024 08:27:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBzY-000jL4-2S;
	Sat, 20 Jul 2024 15:27:24 +0000
Date: Sat, 20 Jul 2024 23:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 41/42] mm/memory.c:192:32: warning:
 initialization of 'struct ptdesc *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202407202311.iMXX4Wfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 934c05f8c50fed91942a8aa9db46a0feae38594c [41/42] use ptdesc in free_pte_range and pte_free_tlb series functions
config: i386-buildonly-randconfig-002-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202311.iMXX4Wfc-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202311.iMXX4Wfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202311.iMXX4Wfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'free_pte_range':
   mm/memory.c:192:32: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Werror=implicit-function-declaration]
     192 |         struct ptdesc *token = pmd_ptdesc(pmd);
         |                                ^~~~~~~~~~
         |                                pfn_ptdesc
>> mm/memory.c:192:32: warning: initialization of 'struct ptdesc *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +192 mm/memory.c

   184	
   185	/*
   186	 * Note: this doesn't free the actual pages themselves. That
   187	 * has been handled earlier when unmapping all the memory regions.
   188	 */
   189	static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
   190				   unsigned long addr)
   191	{
 > 192		struct ptdesc *token = pmd_ptdesc(pmd);
   193		pmd_clear(pmd);
   194		pte_free_tlb(tlb, token, addr);
   195		mm_dec_nr_ptes(tlb->mm);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
