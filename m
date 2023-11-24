Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84CD1EB4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0lt9hLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826456; x=1732362456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJq3Goz2QqTYji6GbFCD2g62Cp3HeHc+BLwZFMxWzek=;
  b=E0lt9hLQd8QTkik5XqjWyDyJXcZdOh/1Xch1RcxcWrPT0oBcJrCCLKoh
   nhCl7QWWUWP8UG3O7IMz7rij9WTqkDDql7H+/wvgKZwNonbTjvgoM2naI
   EyDX67uH0pyM1JSvDGpgO4VwBo3BwXV2tytfPCNwrfqmL0+Vhb/hnqau6
   FMAI2DyUkCdnLWXwox7rYAyXuUSZrtM/tX5RvM7yWwT3YR1QQrCxS7K6p
   acDA00ZVJxIyRvOdkVW/dfHDHu+06awNv2eQkMIozOuSkqlbKOpepAZaX
   KVU8xDNuocrPvA2Qo5ppZTPMgT7ttKGH/c1htLIghTQQcaiNedPMWA8NS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395227080"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395227080"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771236110"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="771236110"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Nov 2023 03:47:35 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Uej-0002i7-0G;
	Fri, 24 Nov 2023 11:47:33 +0000
Date: Fri, 24 Nov 2023 19:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 05/27] mm: page_alloc: Add an arch hook to allow
 prep_new_page() to fail
Message-ID: <202311241432.JzkJ8cZz-lkp@intel.com>
References: <20231119165721.9849-6-alexandru.elisei@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231119165721.9849-6-alexandru.elisei@arm.com>

Hi Alexandru,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Elisei/arm64-mte-Rework-naming-for-tag-manipulation-functions/20231120-010227
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/20231119165721.9849-6-alexandru.elisei%40arm.com
patch subject: [PATCH RFC v2 05/27] mm: page_alloc: Add an arch hook to allow prep_new_page() to fail
config: arm-randconfig-002-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241432.JzkJ8cZz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241432.JzkJ8cZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241432.JzkJ8cZz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'prep_new_page':
>> mm/page_alloc.c:1546:15: error: implicit declaration of function 'arch_prep_new_page'; did you mean 'prep_new_page'? [-Werror=implicit-function-declaration]
    1546 |         ret = arch_prep_new_page(page, order, gfp_flags);
         |               ^~~~~~~~~~~~~~~~~~
         |               prep_new_page
   cc1: some warnings being treated as errors


vim +1546 mm/page_alloc.c

  1540	
  1541	static int prep_new_page(struct page *page, unsigned int order, gfp_t gfp_flags,
  1542								unsigned int alloc_flags)
  1543	{
  1544		int ret;
  1545	
> 1546		ret = arch_prep_new_page(page, order, gfp_flags);
  1547		if (unlikely(ret))
  1548			return ret;
  1549	
  1550		post_alloc_hook(page, order, gfp_flags);
  1551	
  1552		if (order && (gfp_flags & __GFP_COMP))
  1553			prep_compound_page(page, order);
  1554	
  1555		/*
  1556		 * page is set pfmemalloc when ALLOC_NO_WATERMARKS was necessary to
  1557		 * allocate the page. The expectation is that the caller is taking
  1558		 * steps that will free more memory. The caller should avoid the page
  1559		 * being used for !PFMEMALLOC purposes.
  1560		 */
  1561		if (alloc_flags & ALLOC_NO_WATERMARKS)
  1562			set_page_pfmemalloc(page);
  1563		else
  1564			clear_page_pfmemalloc(page);
  1565	
  1566		return 0;
  1567	}
  1568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
