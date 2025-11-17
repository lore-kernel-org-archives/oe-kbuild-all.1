Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833CF32A3D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763377314; cv=none; b=kHyvonVcgXh5zEWEEwGft4VpsmWEKHaJpjyGcCI2aHJR4BwxPpnF24iJjwXbXOozj3fc+F2TPpZjabWXEiRK263USTwWDK3IG1hAhiGeamOkCCppUZKtHxrWh+0FV4z0AJettUtR9/iaXae4uc9JRZ/8OnakOrl1P4UkFJTf3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763377314; c=relaxed/simple;
	bh=Hse3M8/Q1jRBh46fLERzOoI/+sJzlRixdpYMCfIrUH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOJdJ65NyPi/jYBP4C0AznoLIOTOa68WQsRIbhbK3F49kEzUFexSQP8UUDk7sEmhIQFdaT1B/FUuyj6UW/XEFZQJdi2ZPLf/QjfQfuM6dMXUo2xQja3F/WVeLUUwJJYtestUR/M7Ub2v/Sol/xoJhv2ShTdGbPy0pCDfg1Oi2w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMwdYBoS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMwdYBoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763377314; x=1794913314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hse3M8/Q1jRBh46fLERzOoI/+sJzlRixdpYMCfIrUH8=;
  b=GMwdYBoSXKoQPZINWSG8Z7FRlmnPcZWbjv7GVrpHgw28cNYXzE4tc9T9
   9uv7VF26m9I9cXYPC9FjOVKO4QV71GEepRQyP6amJsCvVqaJHsKlv+Uoy
   iOapac1nqqeCkuKSfMi87U23UJc26X1ACdC60uhOayiJNVkuE91gHHOSB
   Mo4uXobvq/ZHVaayOdJruEMflmHuDcJp8ZcQZnw01yI8YilfK7+epQw9S
   oEvfIomxWc2WFAhvV2NfW7NruJJRWAr6PEmnK3cnC079EVjtGGDct7qg8
   7TtroZdIMdeXVDUvJkG9fxJfeaa+mD2AfUXz7NYbcDjd9cgyF0Jglzc7V
   A==;
X-CSE-ConnectionGUID: EHK2nf74RS2eUU11kXebMA==
X-CSE-MsgGUID: cf4HPIzmSxWGw2OEdL4+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="88020559"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="88020559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 03:01:52 -0800
X-CSE-ConnectionGUID: tD8AmtJ6T9aHdAMOJW8g2A==
X-CSE-MsgGUID: XtPIvVhUSHCY0MXVijdj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194528106"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Nov 2025 03:01:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKwzQ-0000SR-1w;
	Mon, 17 Nov 2025 11:01:44 +0000
Date: Mon, 17 Nov 2025 19:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
Message-ID: <202511171848.KXjpAtyR-lkp@intel.com>
References: <20251117-swap-table-p2-v2-18-37730e6ea6d5@tencent.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-swap-table-p2-v2-18-37730e6ea6d5@tencent.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41218ede767f6b218185af65ce919d0cade75f6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-rename-__read_swap_cache_async-to-swap_cache_alloc_folio/20251117-021532
base:   41218ede767f6b218185af65ce919d0cade75f6b
patch link:    https://lore.kernel.org/r/20251117-swap-table-p2-v2-18-37730e6ea6d5%40tencent.com
patch subject: [PATCH v2 18/19] mm, swap: drop the SWAP_HAS_CACHE flag
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20251117/202511171848.KXjpAtyR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171848.KXjpAtyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171848.KXjpAtyR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:88:19: warning: 'Unused_offset' defined but not used [-Wunused-const-variable=]
      88 | static const char Unused_offset[] = "Unused swap offset entry ";
         |                   ^~~~~~~~~~~~~


vim +/Unused_offset +88 mm/swapfile.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  84  
^1da177e4c3f415 Linus Torvalds 2005-04-16  85  static const char Bad_file[] = "Bad swap file entry ";
^1da177e4c3f415 Linus Torvalds 2005-04-16  86  static const char Unused_file[] = "Unused swap file entry ";
^1da177e4c3f415 Linus Torvalds 2005-04-16  87  static const char Bad_offset[] = "Bad swap offset entry ";
^1da177e4c3f415 Linus Torvalds 2005-04-16 @88  static const char Unused_offset[] = "Unused swap offset entry ";
^1da177e4c3f415 Linus Torvalds 2005-04-16  89  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
