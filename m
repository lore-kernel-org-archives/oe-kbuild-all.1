Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F6FBE4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+/8psGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697004193; x=1728540193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+aFsqdT7zUgX/gFyU6EpDMlHC5OqVJQcUBakYkaTSE0=;
  b=j+/8psGT3L3Sh/iQm8Kmrl5+Eohpl1+vvPoiA70y2LEJsEXcF+Azq53g
   e2aBeii1g9XIM3sLBpshWPjtyRiTjpJ+sGYuUEID5nUvfUgDxijQtmx9o
   41HnKEpKadAAOIamDf1qizV7/SOPVWw25WAOAWWiR7Ri0eHeLLj10848Y
   qFKMyoHSyCPnENXgHhpjsiYT9qW62L35Un11bb3QFv56S8+nEGp6jb5r1
   1m/RE1mG1IccvwFp0PbWmuKNt70wQjyBfUHZydgVhDu7qEeeKoUf2RUgb
   V2MAjt/ICok66Y8JpZ0FqU9Bz7Xqdz54fo9khTjTuzHccecfJrB6ijiFx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363945678"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="363945678"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 23:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897506883"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="897506883"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 23:01:22 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqSJE-0001nx-1H;
	Wed, 11 Oct 2023 06:03:04 +0000
Date: Wed, 11 Oct 2023 14:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Yin Fengwei <fengwei.yin@intel.com>,
	David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <shy828301@gmail.com>,
	"Huang, Ying" <ying.huang@intel.com>, Zi Yan <ziy@nvidia.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Itaru Kitayama <itaru.kitayama@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	John Hubbard <jhubbard@nvidia.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, Hugh Dickins <hughd@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 4/9] mm: thp: Introduce anon_orders and
 anon_always_mask sysfs files
Message-ID: <202310111302.ahYvNKX4-lkp@intel.com>
References: <20230929114421.3761121-5-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929114421.3761121-5-ryan.roberts@arm.com>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master v6.6-rc5]
[cannot apply to akpm-mm/mm-everything tj-cgroup/for-next next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/mm-Allow-deferred-splitting-of-arbitrary-anon-large-folios/20230929-194541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230929114421.3761121-5-ryan.roberts%40arm.com
patch subject: [PATCH v6 4/9] mm: thp: Introduce anon_orders and anon_always_mask sysfs files
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231011/202310111302.ahYvNKX4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310111302.ahYvNKX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310111302.ahYvNKX4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/huge_memory.c:8:
>> include/vdso/bits.h:7:33: error: initializer element is not constant
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   mm/huge_memory.c:73:47: note: in expansion of macro 'BIT'
      73 | unsigned int huge_anon_orders __read_mostly = BIT(PMD_ORDER);
         |                                               ^~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
