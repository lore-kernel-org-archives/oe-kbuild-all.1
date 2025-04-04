Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4674059
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766221; cv=none; b=WDEG1JFu30ESfnAIQ9091c1ywsWyk3tJS66W/v32zYHtxWQd+2LG3Bwv9m3rifQQnAQr8xurvapAcSTXf3cYkbI+9FWwwVulo0nyzWyLTE/2aaWBEG09VaYKbLnDMfIrL8LfWdNpJdzEd7P3aSCGC9cNMYTGkVC8Uz9Mfb3QvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766221; c=relaxed/simple;
	bh=nIrxCDv+2eoSZhlwME3C3SL/bMSMj+ZVqBZ9zXR+nvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGMM5lYDVrnqfgG8YqbhJUZjf/lURHwpx2MpComgM1a/Rv2v6YihdBGzayorblsFAVJjG/esx2TMReWmmEd8a60VALmxqN8S2qXBKS8KId8JmlWhRf5K4LgIlsJu/3zclDVbKFwPimVsKDFKo32CYyNcwfVF3/SiAZqVwdGSX8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/JBwQKx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/JBwQKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743766220; x=1775302220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nIrxCDv+2eoSZhlwME3C3SL/bMSMj+ZVqBZ9zXR+nvE=;
  b=F/JBwQKx/Q8JJ6g9pHlvuSTpCpXiLw2AIuDI0FX14fBQN8KecFJJAQ1C
   WcbTi6YKN4RnOrM/yMnyhCiqLBNkV4AHqRURmoHr0TOv6GAFtM2ySTI0w
   6VgMkz02/G4uDLhdqhyzF64PW9UECexqG97keuKEcDogAPpdB64Jhr38d
   Fvuh5GEzYW6F12Ipl70PAPVZde0Ly/BsElXuX3KtH9cEdQ+6vj9KwtQ2V
   XA1yylJCkn1mOMHq5YW4ItvbRqOllKEq3J/6wB5ocaHf2NevnDAmBX4Hq
   eiFzXC4+jbAvWzAw8ME+wxqkPHXARRGpsMM7mP9jngslK+Fk/izEU+vKg
   g==;
X-CSE-ConnectionGUID: F6848X0DQv6uhguLWWvsrA==
X-CSE-MsgGUID: e0fIM5lTQ3ODGlKXnEr/PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45377050"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="45377050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 04:30:17 -0700
X-CSE-ConnectionGUID: d5Zl4Wm0T+Co9qI0Dx6Wnw==
X-CSE-MsgGUID: hcw75VElSAeVVQb9Bh/IlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="150497354"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2025 04:30:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0fFV-0001CJ-2y;
	Fri, 04 Apr 2025 11:30:13 +0000
Date: Fri, 4 Apr 2025 19:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU
 page cache pages
Message-ID: <202504041959.ivEq3JFZ-lkp@intel.com>
References: <20250403141032.22743-1-donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403141032.22743-1-donettom@linux.ibm.com>

Hi Donet,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/mm-swap-c-Enable-promotion-of-unmapped-MGLRU-page-cache-pages/20250403-221222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250403141032.22743-1-donettom%40linux.ibm.com
patch subject: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU page cache pages
config: i386-buildonly-randconfig-003-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041959.ivEq3JFZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041959.ivEq3JFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041959.ivEq3JFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/swap.c: In function 'lru_gen_inc_refs':
>> mm/swap.c:401:36: error: 'sysctl_numa_balancing_mode' undeclared (first use in this function)
     401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap.c:401:36: note: each undeclared identifier is reported only once for each function it appears in
>> mm/swap.c:401:65: error: 'NUMA_BALANCING_MEMORY_TIERING' undeclared (first use in this function)
     401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swap.c:402:36: error: 'numa_pagecache_promotion_enabled' undeclared (first use in this function)
     402 |                                    numa_pagecache_promotion_enabled) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/swap.c:403:33: error: implicit declaration of function 'promotion_candidate' [-Werror=implicit-function-declaration]
     403 |                                 promotion_candidate(folio);
         |                                 ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sysctl_numa_balancing_mode +401 mm/swap.c

   382	
   383	static void lru_gen_inc_refs(struct folio *folio)
   384	{
   385		unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
   386	
   387		if (folio_test_unevictable(folio))
   388			return;
   389	
   390		/* see the comment on LRU_REFS_FLAGS */
   391		if (!folio_test_referenced(folio)) {
   392			set_mask_bits(&folio->flags, LRU_REFS_MASK, BIT(PG_referenced));
   393			return;
   394		}
   395	
   396		do {
   397			if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
   398				if (!folio_test_workingset(folio)) {
   399					folio_set_workingset(folio);
   400				} else if (!folio_test_isolated(folio) &&
 > 401					  (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
 > 402					   numa_pagecache_promotion_enabled) {
 > 403					promotion_candidate(folio);
   404				}
   405				return;
   406			}
   407	
   408			new_flags = old_flags + BIT(LRU_REFS_PGOFF);
   409		} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
