Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27B213E9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690057; cv=none; b=PbIcwwOIGdtZRLBMD18ssag4h74uW8auAieAOyYLr3xjitLmlsICqZIkaHXKRBC1qfEWIBuAX7FFKRhgFxj8ybAFbKKls+UeFQzv79tX9+cCRRfLkCsR6NCWIWULgwIypAPVSOLfCqPAT+WzX7G45ElFb/RSgyTtVDAH8P+Rlyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690057; c=relaxed/simple;
	bh=sNVYgedaeNKV36Sf5bIHXZ/6S5BWrRmg4uj/4b/8nv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv3XWb5KWThrvlqruQAd0mhsWYmqQvX4OB2Ox8J9dMkZxQb7Qh3xSCJMuqI9VbnTLRUTJ0V3f+cVcWuRCCVDlfKGsCLgFD0NJeUNuPQFao44fh6CJ/ej+SKEdL0JAqHrla/ee9CCTWsupGx26DPd6sAiKMtNCQJMG6AZHmOWX2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps4Ww8Ff; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps4Ww8Ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690056; x=1770226056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sNVYgedaeNKV36Sf5bIHXZ/6S5BWrRmg4uj/4b/8nv8=;
  b=Ps4Ww8Ff96afnrqnrs+/BvytvJRYya2bIIyPQ1PTkSng6gfalSJ45bNz
   q+E7ToyHzMQd9cNwHhu0nldwQpMqNOVnlwbkPmXSu397wo9HRtAHD5Tnf
   Oo2zKD6y+dD+pc3GsnmJhps8hf0nHu85jWAz+CzfvBrmpTmtgjv1NUjQT
   PmTxBV2pHysO76Vc3zlCf53Spkd9WbO29jl72dMXrC1D/w+3tWvLD4rzW
   3RKXvT9whg1a/XG7enF+HjmtL/qgZYz4Wdutdpo95XfrVJfhDOlJShtzY
   yw/IlJhloOfwnD8r8s8G5U/PMA9wMQvQYtjKN8bcWRCQrpEx23vbEn00/
   A==;
X-CSE-ConnectionGUID: sFct+bAsQdiSlrQ/EDxgXg==
X-CSE-MsgGUID: N3mp012iSLSricNPHW9Amg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38458622"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38458622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:27:35 -0800
X-CSE-ConnectionGUID: e2RilkjfTPyyXY9mnrqnag==
X-CSE-MsgGUID: yQkoMX+iT5qUG1eMCJhXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="110536711"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2025 09:27:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfMhv-000snX-0Z;
	Tue, 04 Feb 2025 17:27:31 +0000
Date: Wed, 5 Feb 2025 01:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] mm/damon: introduce DAMOS filter type hugepage
Message-ID: <202502050106.VysTkQFY-lkp@intel.com>
References: <20250203225604.44742-5-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203225604.44742-5-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-damon-have-damon_get_folio-return-folio-even-for-tail-pages/20250204-065901
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250203225604.44742-5-usamaarif642%40gmail.com
patch subject: [PATCH v4 4/6] mm/damon: introduce DAMOS filter type hugepage
config: s390-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050106.VysTkQFY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050106.VysTkQFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050106.VysTkQFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/damon/paddr.c: In function 'damos_pa_filter_match':
>> mm/damon/paddr.c:230:16: warning: unused variable 'folio_sz' [-Wunused-variable]
     230 |         size_t folio_sz;
         |                ^~~~~~~~


vim +/folio_sz +230 mm/damon/paddr.c

   224	
   225	static bool damos_pa_filter_match(struct damos_filter *filter,
   226			struct folio *folio)
   227	{
   228		bool matched = false;
   229		struct mem_cgroup *memcg;
 > 230		size_t folio_sz;
   231	
   232		switch (filter->type) {
   233		case DAMOS_FILTER_TYPE_ANON:
   234			matched = folio_test_anon(folio);
   235			break;
   236		case DAMOS_FILTER_TYPE_MEMCG:
   237			rcu_read_lock();
   238			memcg = folio_memcg_check(folio);
   239			if (!memcg)
   240				matched = false;
   241			else
   242				matched = filter->memcg_id == mem_cgroup_id(memcg);
   243			rcu_read_unlock();
   244			break;
   245		case DAMOS_FILTER_TYPE_YOUNG:
   246			matched = damon_folio_young(folio);
   247			if (matched)
   248				damon_folio_mkold(folio);
   249			break;
   250	#if defined(CONFIG_PGTABLE_HAS_HUGE_LEAVES)
   251		case DAMOS_FILTER_TYPE_HUGEPAGE:
   252			folio_sz = folio_size(folio);
   253			matched = filter->folio_size.min <= folio_sz && folio_sz <= filter->folio_size.max;
   254			break;
   255	#endif
   256		default:
   257			break;
   258		}
   259	
   260		return matched == filter->matching;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
