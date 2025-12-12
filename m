Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD33296BA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765563920; cv=none; b=C9XNPK8wKOPQ7tUFCAW+BdV2Mb+439GtLuVNUSTfFoQ9FyBtNjbSqv33gXIqbpiS0tQ86zopPPUll0Qyi7teQwVYkCftXZK1PMJZwSMXQpBQlF8/KccZ2cBoSj0pREIIcBgZzFCNRvOcl5oR8ppxpUo8vk+HJo1ej0b4laEShZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765563920; c=relaxed/simple;
	bh=tHml/SJavCwz8yD84uRQ6SBdkXeVOuUEfdL8ihkK/Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAaYdnGJtOGVyYdpcF156lLxECCoKqBxFyUvshJvVMVrdX9+aUDx8of0NzSvg4Yf6M+1LJJ4w8uA9YKdEEvchVypVGXfyfsSfA5+3mMJTmv03aQNQjz4/qWZlROPbvBTJeKECot53xxmAtXe935KftP4ciYyh/RqrMKeaiI8+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3nRhpmF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3nRhpmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765563918; x=1797099918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHml/SJavCwz8yD84uRQ6SBdkXeVOuUEfdL8ihkK/Y4=;
  b=b3nRhpmFopdsK5sorTvMwXGHM3Kyb0q77B/qiP6YeOTLUoXOM/JnEqCh
   TCgRMrdBDBFl369+/0e1aoFlEf1akvWD2brwIBZOr5dVi/vLx/PZI1P4X
   i+pf9tokM+/DHTuNegTtLNNr5xaZY/gyM/HDzR+SLT4mzQZfuVaNul2/v
   R8nS2aLS5m7zVyH+tGXVIZRuvrwFWZPKg/oCpFFHUrVAd8Fnt6aYeALsj
   ztpLAnmUy0AczIUF9B+7Tb9dKIz2XAWvfUCZ/KRTaD6U30UKY9aifhPPL
   hD72tKIQDncatCDI/f60BSi7D4X4xAe7Z6EG9SJQlSoOWr5u+Z3zY8/hC
   w==;
X-CSE-ConnectionGUID: ERdahCkKSe+CJxXVVGCc+g==
X-CSE-MsgGUID: bEMgQul1Q1Gs2tT2pWuoAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67321712"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67321712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 10:25:18 -0800
X-CSE-ConnectionGUID: G0/UVGEERrqK6le7YIUrEQ==
X-CSE-MsgGUID: 6bj9Q4Y8RVKgK2ZMoXMMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196760510"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 10:25:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7pK-000000001mi-3XKS;
	Fri, 12 Dec 2025 18:25:14 +0000
Date: Fri, 12 Dec 2025 19:24:25 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] mm/page_alloc.c:3005:
 warning: Function parameter or member 'mt' not described in
 '__putback_isolated_page'
Message-ID: <202512121956.obyBPboz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 91bac2310ae7eca9d9869222c96fcc3d02851eea [1941/1941] mm: add function __putback_isolated_page
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121956.obyBPboz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121956.obyBPboz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121956.obyBPboz-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                         ^
   mm/page_alloc.c:7269:9: note: in expansion of macro 'adj_init_size'
    7269 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7271:9: note: in expansion of macro 'adj_init_size'
    7271 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7271:9: note: in expansion of macro 'adj_init_size'
    7271 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7271:9: note: in expansion of macro 'adj_init_size'
    7271 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7271:9: note: in expansion of macro 'adj_init_size'
    7271 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7272:9: note: in expansion of macro 'adj_init_size'
    7272 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7272:9: note: in expansion of macro 'adj_init_size'
    7272 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7272:9: note: in expansion of macro 'adj_init_size'
    7272 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7272:9: note: in expansion of macro 'adj_init_size'
    7272 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7273:9: note: in expansion of macro 'adj_init_size'
    7273 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7273:9: note: in expansion of macro 'adj_init_size'
    7273 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7273:9: note: in expansion of macro 'adj_init_size'
    7273 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7273:9: note: in expansion of macro 'adj_init_size'
    7273 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7274:9: note: in expansion of macro 'adj_init_size'
    7274 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7274:9: note: in expansion of macro 'adj_init_size'
    7274 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: warning: comparison between two arrays [-Warray-compare]
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7274:9: note: in expansion of macro 'adj_init_size'
    7274 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7265:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7265 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7274:9: note: in expansion of macro 'adj_init_size'
    7274 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
>> mm/page_alloc.c:3005: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'


vim +3005 mm/page_alloc.c

  2995	
  2996	/**
  2997	 * __putback_isolated_page - Return a now-isolated page back where we got it
  2998	 * @page: Page that was isolated
  2999	 * @order: Order of the isolated page
  3000	 *
  3001	 * This function is meant to return a page pulled from the free lists via
  3002	 * __isolate_free_page back to the free lists they were pulled from.
  3003	 */
  3004	void __putback_isolated_page(struct page *page, unsigned int order, int mt)
> 3005	{
  3006		struct zone *zone = page_zone(page);
  3007	
  3008		/* zone lock should be held when this function is called */
  3009		lockdep_assert_held(&zone->lock);
  3010	
  3011		/* Return isolated page to tail of freelist. */
  3012		__free_one_page(page, page_to_pfn(page), zone, order, mt);
  3013	}
  3014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
