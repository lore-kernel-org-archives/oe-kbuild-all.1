Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D4198E7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747457107; cv=none; b=ZvVIiHF1M/Bs0uDRVUXXvSj/n/Ge2IfF6BzBbfUJHrMaW0vFGCIeX8oYq6+VkDQ7lu/EQxzBbuA9AvVDBnxdHROGEvAt9jqLII7fmzgV4OC4epwWhAoZ7lUiuy2nDoHGLamKQvXqOA5BSaGKURgkLE+94VETW051oqMD0DPOPZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747457107; c=relaxed/simple;
	bh=AADRiBeV8B1tsvKaeQz7lDiCK5eB0B24qYkhqNMn9YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVN8GYWFU8nCM7ZTvOyaZpddtzNy0LPurrO2zPPvaivHmSd2r1QE/j+CEw7TIfshLKupIVT9np29eBV0RW3JFA6RqGxnOnNLai0IFN2fSN3CsQ0VYGHfLysYk2srhl+/GA9E14a47q5inFJWzLEAQEzTUixf/r4B4ulpFfxBRrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2kWttQA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2kWttQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747457105; x=1778993105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AADRiBeV8B1tsvKaeQz7lDiCK5eB0B24qYkhqNMn9YM=;
  b=C2kWttQAKRDAwFldacfyfZTsG7KmLVZH+wQUuAozLdT/uQ5Nkyg1eBc2
   cTRQ6xMG5Nn8wtGKP7eATTIrBDar6Qg5RSj00+ziNhvOzj3OOBb4EsV8v
   t6AQzNV/f6IzCoJiA8IlNYQ9VeEIFvfwLthPk+uV/iE0o3NmxPyx2QIyE
   7LAK6L1By/G8oBzKMvxZuYxQ0g/kBWC6vh+7EAdIgAdS6/EWF4ZrKnDEC
   uqW7Tkp5xKgVPP4inIayqu7/VrGE/P4b6KX0deCSAoieg7D3E3kEj+qpL
   cC5JkN8ZM/A/SSkiTtDBnTZM4VqgvZLgXTUiMQtz8Z4bcCDqr0Q0HTR5l
   Q==;
X-CSE-ConnectionGUID: /1QYM58RS76JnNsqfUMzmA==
X-CSE-MsgGUID: 4dw0DAR0RIWbzSZhp6T+Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53252057"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="53252057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 21:45:05 -0700
X-CSE-ConnectionGUID: HoseE2wkTZqhXxcZoPndWg==
X-CSE-MsgGUID: eK+ddwPNR1uBIK4XHHLe5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="139401647"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2025 21:45:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG9Pw-000Jw3-1V;
	Sat, 17 May 2025 04:45:00 +0000
Date: Sat, 17 May 2025 12:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wenjie Xu <xuwenjie04@baidu.com>, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Wenjie Xu <xuwenjie04@baidu.com>,
	Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH] hugetlb: two-phase hugepage allocation when reservation
 is high
Message-ID: <202505171227.2rpT5Nx7-lkp@intel.com>
References: <20250516113552.17648-1-xuwenjie04@baidu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516113552.17648-1-xuwenjie04@baidu.com>

Hi Wenjie,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenjie-Xu/hugetlb-two-phase-hugepage-allocation-when-reservation-is-high/20250516-193732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250516113552.17648-1-xuwenjie04%40baidu.com
patch subject: [PATCH] hugetlb: two-phase hugepage allocation when reservation is high
config: i386-buildonly-randconfig-006-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171227.2rpT5Nx7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171227.2rpT5Nx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171227.2rpT5Nx7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/hugetlb.o: in function `hugetlb_hstate_alloc_pages.constprop.0':
>> hugetlb.c:(.init.text+0xac2): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
