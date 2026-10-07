Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B704B515E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379755; cv=none; b=QVb5Q7BJETe3FkHyqwBDT/ihy0xyHFC8ovg7RyO8mfH5pb+SnuRniH+O70DU25fWBskHg/1dOuum1qvkeHbQK1k41m/w7RQ9DqQ9PIF19OX2T8yCF3wupyItiikOaWiYnw1yzv/6N3pA3vZM6DNPeApIHt2sNycrEZPx40/1u74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379755; c=relaxed/simple;
	bh=HmrYqLlz/iFOT1qIwq+oFd7wxoG3X9eBwkkqkSQqhgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/dqqG4VHANbR6UkaoT0SHAvSGwc+fn9ECyGoDceEAA7zLFHaCItfZNuBTf7yjnPH/RtV98BlC5ENspAk0/R1kdTYleTftxq3Bi7yVq0hLPhXq5mhZDtmYANbpkR23g7D3HIXa6eS20foZMwzru0/Wy4K6xChJYeUQrsUd4VUg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv6unbJu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv6unbJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379737; x=1822915737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmrYqLlz/iFOT1qIwq+oFd7wxoG3X9eBwkkqkSQqhgo=;
  b=Qv6unbJuDlMYyKdqpLvidPAWtyxgBDiJAIZ+EMz4FaYxFN8l0JZFYK9n
   RUBcTyUzz12UMiRjqDRuIY9Imxws37MF/6Spnzv92cmCLB/iwiuLRjYWV
   meVF437tRMigh8NC7vfQvuzMMgw9yLTTkwsabZbVGEXMOd52EaJ2ZVryZ
   ZaL0hQlvVhPQ+U5G7cSR0mYjCmmBXnBCnj+idJ9BcLZwxE9h9w1SUhA5Q
   WqrFl0xcqEAIbxS2WHkD3+ibwRH1n4PLq46cXc8rdMJyLi/JDNcSi+1F0
   NjGN0x/XOTR8CpejBZCuvdyX78MGOc6GM6YtpsANhV15tBHH5v+IubqOY
   A==;
X-CSE-ConnectionGUID: 7TgetX6qTqShW17vslQ5pA==
X-CSE-MsgGUID: T/rTKszMSN69RJXD8PAeHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="22919"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="22919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:28:34 -0700
X-CSE-ConnectionGUID: PvxnDQ/bQe+MNMIKDrBmYg==
X-CSE-MsgGUID: s5qIULmlTNGOtPi87J9xkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="281200455"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2026 06:28:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xERh8-0000000031o-0Abr;
	Wed, 07 Oct 2026 13:28:30 +0000
Date: Wed, 7 Oct 2026 21:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nikolai Semendiaev <agent00791@gmail.com>, ath12k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	jjohnson@kernel.org, wabsie@gmail.com
Subject: Re: [PATCH 2/2] wifi: ath12k: use private page-frag caches for RXDMA
 rings
Message-ID: <202610072103.1v2wWX3z-lkp@intel.com>
References: <7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791@gmail.com>

Hi Nikolai,

kernel test robot noticed the following build errors:

[auto build test ERROR on 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikolai-Semendiaev/wifi-ath12k-make-external-IRQ-control-idempotent/20261006-154146
base:   388d3c42e8aba1cfc3c6d2c52877a46d8cf740db
patch link:    https://lore.kernel.org/r/7bb1b30324eea87b53a8c585566842a1a0ec7d06.1791279304.git.agent00791%40gmail.com
patch subject: [PATCH 2/2] wifi: ath12k: use private page-frag caches for RXDMA rings
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261007/202610072103.1v2wWX3z-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072103.1v2wWX3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072103.1v2wWX3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/dp.c:7:
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_align':
>> include/linux/page_frag_cache.h:49:9: error: implicit declaration of function 'WARN_ON_ONCE' [-Wimplicit-function-declaration]
      49 |         WARN_ON_ONCE(!is_power_of_2(align));
         |         ^~~~~~~~~~~~


vim +/WARN_ON_ONCE +49 include/linux/page_frag_cache.h

3d18dfe69ce46f Yunsheng Lin 2024-10-28  39  
65941f10caf2c0 Yunsheng Lin 2024-10-28  40  void page_frag_cache_drain(struct page_frag_cache *nc);
65941f10caf2c0 Yunsheng Lin 2024-10-28  41  void __page_frag_cache_drain(struct page *page, unsigned int count);
65941f10caf2c0 Yunsheng Lin 2024-10-28  42  void *__page_frag_alloc_align(struct page_frag_cache *nc, unsigned int fragsz,
65941f10caf2c0 Yunsheng Lin 2024-10-28  43  			      gfp_t gfp_mask, unsigned int align_mask);
65941f10caf2c0 Yunsheng Lin 2024-10-28  44  
65941f10caf2c0 Yunsheng Lin 2024-10-28  45  static inline void *page_frag_alloc_align(struct page_frag_cache *nc,
65941f10caf2c0 Yunsheng Lin 2024-10-28  46  					  unsigned int fragsz, gfp_t gfp_mask,
65941f10caf2c0 Yunsheng Lin 2024-10-28  47  					  unsigned int align)
65941f10caf2c0 Yunsheng Lin 2024-10-28  48  {
65941f10caf2c0 Yunsheng Lin 2024-10-28 @49  	WARN_ON_ONCE(!is_power_of_2(align));
65941f10caf2c0 Yunsheng Lin 2024-10-28  50  	return __page_frag_alloc_align(nc, fragsz, gfp_mask, -align);
65941f10caf2c0 Yunsheng Lin 2024-10-28  51  }
65941f10caf2c0 Yunsheng Lin 2024-10-28  52  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
