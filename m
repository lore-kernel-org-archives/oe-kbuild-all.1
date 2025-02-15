Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3BB1624E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739636651; cv=none; b=sYP1O1MMcm0K6QBDC1Vlqfwz8BCIYLtcEvqH2Im209h02bLkYO5IWYqrrHv12op7ym4A2XVv8cr2xIdm4wX4PgViEjWRvpqOGAWdQW0jc9s4lXIVfNHwW3K86GvZA+DSrWvdriwCHG409TS4ZbnSjDAuy/D8SuNHKhcqXtU7ndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739636651; c=relaxed/simple;
	bh=/nCKI9UOk6Uuxr3vrfPOn+EQvro/Ww66U99JBGRShe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0r5sli65mZAHq0zLT19hAvH/r+7yWhd7caI8dhAjTOGdIckh4eM8wCxjvjPBQkcXr3VQmAc9Tv71mRi06Iw/YcoOZ62rXBUq3AnHUQE0M8vxG8sbbSfUjPSEc8KltegYDCXVtv03ZDXnk26KDkpCPTpRYHBkvHQPb50rteEyWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IczBe84X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IczBe84X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739636649; x=1771172649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/nCKI9UOk6Uuxr3vrfPOn+EQvro/Ww66U99JBGRShe0=;
  b=IczBe84Xi3LinDOTzHp0MXN3qasaBD4mQLjsYoH4yeZ+Q8Db8vYNlWYo
   h1Fgo53vmsJ16iynIkIgDy+0+QICshq2EyeEJM2gmMVwFTDflDkDAiz0b
   4lrTBeFJLY9woU2tSnuVgqoduLcCBtag2If8d/OANgA2YtaCLAC9K6dgY
   28Y9bAqcxvMdL1YFKEra13Ldes+oiFk9GQzaUZsPg/x2XxAKsfUY8AzhL
   8NE7Anx7mBAG+cz6665Ff0QfUv028dusTU9pVTIifDVXGBQ1Fn7x2cFrZ
   XLjyXc80bszjNawd6CHNsWgiUpOSMeOwILAsrierrabLnPf+XZq3VdUq7
   A==;
X-CSE-ConnectionGUID: 32L5eiPPT7O6ao2Ab5LcRg==
X-CSE-MsgGUID: oFOUNsGmTyeQozLa6f1xIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40401726"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="40401726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 08:24:08 -0800
X-CSE-ConnectionGUID: ZiNTWekRRyC/rhq/V9IL3A==
X-CSE-MsgGUID: zGAB0hZQRK+oG7Ks0uikxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144648362"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 08:24:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjKxW-001Ayp-2T;
	Sat, 15 Feb 2025 16:24:02 +0000
Date: Sun, 16 Feb 2025 00:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Barry Song <v-songbaohua@oppo.com>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Kalesh Singh <kaleshsingh@google.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 6/7] mm, swap: remove swap slot cache
Message-ID: <202502160045.CBhqtRFf-lkp@intel.com>
References: <20250214175709.76029-7-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214175709.76029-7-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-avoid-reclaiming-irrelevant-swap-cache/20250215-020239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250214175709.76029-7-ryncsn%40gmail.com
patch subject: [PATCH 6/7] mm, swap: remove swap slot cache
config: x86_64-buildonly-randconfig-003-20250215 (https://download.01.org/0day-ci/archive/20250216/202502160045.CBhqtRFf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160045.CBhqtRFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160045.CBhqtRFf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:2589:13: warning: '__has_usable_swap' defined but not used [-Wunused-function]
    2589 | static bool __has_usable_swap(void)
         |             ^~~~~~~~~~~~~~~~~


vim +/__has_usable_swap +2589 mm/swapfile.c

40531542e28324 Cesar Eduardo Barros 2011-03-22  2588  
80e75021486bd2 Kefeng Wang          2024-04-18 @2589  static bool __has_usable_swap(void)
80e75021486bd2 Kefeng Wang          2024-04-18  2590  {
80e75021486bd2 Kefeng Wang          2024-04-18  2591  	return !plist_head_empty(&swap_active_head);
80e75021486bd2 Kefeng Wang          2024-04-18  2592  }
80e75021486bd2 Kefeng Wang          2024-04-18  2593  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
