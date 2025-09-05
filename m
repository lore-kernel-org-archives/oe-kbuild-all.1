Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9A371E83
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082212; cv=none; b=b7sI8RUOt5NANfrVSjYWcHKlrpS3lXLn049iis6/e9WpXS19hGP+QmAK8iRs857UTVgqX7nDhL301Y45WdkV99jFLaY8SpqhzcnN2AT+RyU9+h4Ana7CB5cgYJMEwqjU+K+q5HJ3ldvTksGuHiG9FdAH7OdHys4+gcHrfOfPhhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082212; c=relaxed/simple;
	bh=Ly1A1t8zkl1UDjDmh1rwf+3iMany95fQ+o+inhdQpTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyFfpKM8aOnocVvqz6KzMSkkAPA6f9JwDHxFT0nMMK4rWIr+aRx0t17A9zAbNn22+kMJZfIHfizSgp2hA1CQanKYDkqF4+IWP+zvNte7X/cz7T3fUoRQnKEaQRGs8HALO1jcBPsZqBILOf5SVTvtuc5sSiPCUuaYJCIYZUv6//0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tprr2NSt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tprr2NSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757082211; x=1788618211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ly1A1t8zkl1UDjDmh1rwf+3iMany95fQ+o+inhdQpTM=;
  b=Tprr2NStlVHiGl8+w7y7zJ1SPBfu8+gKSaeVnUPasaquv3nJFEwIiuvT
   lj/HEd20RYbfWXjz615cwCfIJWTDyfDhyeo0ohXyfWvIP7HklA5McPJf4
   Dlf/LEf9+e2j1Y3JWEk559VY97I7coi/X6TEl2BQuLiGHJc25AHGtb3+b
   Bxl5Tz6nEDJ5RfzJC9s6jjpJ26aFKcwUf8l4mY58ebX1PTgTTciNFXA43
   1tbPXCsfWOt8hifmQUBO38WslES7r/Rt3RntgPmrXBV8yBs70fugYy/63
   vQp6DeNh8X7qY8UsQXeLsJkyYlPiwAirO3vLm5G1ELT0wcvMmjnzPeJ+5
   A==;
X-CSE-ConnectionGUID: bIdmwxuVQWW4Ne47EZuRDQ==
X-CSE-MsgGUID: IBfPf4CLTLSgk28uTvpQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="84870607"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="84870607"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 07:23:25 -0700
X-CSE-ConnectionGUID: 96JjQF4cQleGatjBOlysKg==
X-CSE-MsgGUID: /CWSAJoIT8a9uzcDYukCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="172050926"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2025 07:23:24 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuXLV-0000VD-21;
	Fri, 05 Sep 2025 14:23:21 +0000
Date: Fri, 5 Sep 2025 22:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 332/339] include/linux/huge_mm.h:591:16: error:
 unused variable 'folio'
Message-ID: <202509052234.q4rNraUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   0d1fe06d55b12fa3b8907412d97541b2b7eff16e
commit: c0b55300a1dec35aa8bad62ba520e368c9b1f041 [332/339] huge_memory: return -EINVAL in folio split functions when THP is disabled
config: nios2-randconfig-001-20250905 (https://download.01.org/0day-ci/archive/20250905/202509052234.q4rNraUm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509052234.q4rNraUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509052234.q4rNraUm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/nios2/include/uapi/asm/elf.h:24,
                    from arch/nios2/include/asm/elf.h:9,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from lib/test_bitops.c:10:
   include/linux/huge_mm.h: In function 'split_huge_page_to_list_to_order':
>> include/linux/huge_mm.h:591:16: error: unused variable 'folio' [-Werror=unused-variable]
     591 |  struct folio *folio = page_folio(page);
         |                ^~~~~
   include/linux/huge_mm.h: In function 'split_huge_page':
   include/linux/huge_mm.h:598:16: error: unused variable 'folio' [-Werror=unused-variable]
     598 |  struct folio *folio = page_folio(page);
         |                ^~~~~
   cc1: all warnings being treated as errors


vim +/folio +591 include/linux/huge_mm.h

   581	
   582	static inline bool
   583	can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins)
   584	{
   585		return false;
   586	}
   587	static inline int
   588	split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
   589			unsigned int new_order)
   590	{
 > 591		struct folio *folio = page_folio(page);
   592	
   593		VM_WARN_ON_ONCE_FOLIO(1, folio);
   594		return -EINVAL;
   595	}
   596	static inline int split_huge_page(struct page *page)
   597	{
   598		struct folio *folio = page_folio(page);
   599	
   600		VM_WARN_ON_ONCE_FOLIO(1, folio);
   601		return -EINVAL;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
