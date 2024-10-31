Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E971C9B95
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398246; cv=none; b=ILaCZdxrh7LWDWTJNb8Pvn47bLwoRUM3hAs2WX3nm04RS4+e+L6onVdBLK0nNscHDKPIxMAKH6dGPwdhI3pxxaG4Gs6KjPK7s+QbptgFnNbwq0O4iSfomdPblc1k2NcHe+aKu5Eu1ogCfg4hTvNB4LUYAtvqZNPlaIjSh5+ENFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398246; c=relaxed/simple;
	bh=a7cZp6KeMus2nUtq0llMkXWyezzYfoUYI1ZLVKUc1i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcP9jWDKxUJcPi0td7yZeD08OQI6iuQoHxKTLp7NDcPMXkN/URNgqK2hA4A49wHHc0gkS59LJ4kHhRDPHE1k7/C46u/TEuUL4/FiMjGNxJZpCHNDeRDI7KhDo5S89jL4iL6IZTTyF/HAiPyRkM783tfjdJAEHh+91l0JFVcWWzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6JDxOaY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6JDxOaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730398243; x=1761934243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7cZp6KeMus2nUtq0llMkXWyezzYfoUYI1ZLVKUc1i0=;
  b=l6JDxOaYAmK3B9J5U9+fXN92Elxn0lWQHEBphlz7NtLcRaWZ1qM4S9i1
   gk8PSe3MaUqcyoAE8UlMb6ZXvt6+Q0S7r1zavgrfjB2Ev4Lc3uJqedVDA
   BaF8o1HTOuFq+6X6MedSWchVodnW627NuL+PeatnnR9Ch2cxRrbkCayRt
   JPcFubxdr5jry/GZEUPHmwJ38NKXhAgqDWS+6SjITYX+/L1/BjWSYByhY
   fbeLIa4rrczz6JVh9zPtIwHkJ/Xy6+MlM+jOjcZdix3c1JIlWP8PCfsaz
   cqn5wSZtMjvpT7Sew0dB2JzmZcrXRDgfhiY3TCMA6ev2OS5kNyLQ1V3U7
   g==;
X-CSE-ConnectionGUID: nNvZ6DUjRTKUueAQP4armQ==
X-CSE-MsgGUID: kxNpqgEnTO6C9Lt3jglFzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30109528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30109528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 11:10:43 -0700
X-CSE-ConnectionGUID: HHJ9LgYARHqc8ge+P0Kd7A==
X-CSE-MsgGUID: X0ogd0IqRfqJz7UddC6mkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82381016"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Oct 2024 11:10:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Zd1-000gao-1L;
	Thu, 31 Oct 2024 18:10:39 +0000
Date: Fri, 1 Nov 2024 02:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Roy <roypat@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/6] kvm: gmem: add flag to remove memory from
 kernel direct map
Message-ID: <202411010141.4BXlxhG3-lkp@intel.com>
References: <20241030134912.515725-3-roypat@amazon.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030134912.515725-3-roypat@amazon.co.uk>

Hi Patrick,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5cb1659f412041e4780f2e8ee49b2e03728a2ba6]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Roy/arch-introduce-set_direct_map_valid_noflush/20241030-215156
base:   5cb1659f412041e4780f2e8ee49b2e03728a2ba6
patch link:    https://lore.kernel.org/r/20241030134912.515725-3-roypat%40amazon.co.uk
patch subject: [RFC PATCH v3 2/6] kvm: gmem: add flag to remove memory from kernel direct map
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241101/202411010141.4BXlxhG3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010141.4BXlxhG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010141.4BXlxhG3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_folio_configure_direct_map':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:94:9: error: implicit declaration of function 'flush_tlb_kernel_range' [-Werror=implicit-function-declaration]
      94 |         flush_tlb_kernel_range(start, start + folio_size(folio));
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/flush_tlb_kernel_range +94 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

    35	
    36	/*
    37	 * Configure the direct map present/not present state of @folio based on
    38	 * the xarray stored in the associated inode's private data.
    39	 *
    40	 * Assumes the folio lock is held.
    41	 */
    42	static int kvm_gmem_folio_configure_direct_map(struct folio *folio)
    43	{
    44		struct inode *inode = folio_inode(folio);
    45		struct kvm_gmem_inode_private *gmem_priv = inode->i_private;
    46		bool default_state = gmem_priv->default_direct_map_state;
    47	
    48		pgoff_t start = folio_index(folio);
    49		pgoff_t last = start + folio_nr_pages(folio) - 1;
    50	
    51		struct xarray *xa = &gmem_priv->direct_map_state;
    52		unsigned long index;
    53		void *entry;
    54	
    55		pgoff_t range_start = start;
    56		unsigned long npages = 1;
    57		int r = 0;
    58	
    59		if (!kvm_gmem_test_no_direct_map(gmem_priv))
    60			goto out;
    61	
    62		r = set_direct_map_valid_noflush(folio_page(folio, 0), folio_nr_pages(folio),
    63						 default_state);
    64		if (r)
    65			goto out;
    66	
    67		if (!xa_find_after(xa, &range_start, last, XA_PRESENT))
    68			goto out_flush;
    69	
    70		xa_for_each_range(xa, index, entry, range_start, last) {
    71			++npages;
    72	
    73			if (index == range_start + npages)
    74				continue;
    75	
    76			r = set_direct_map_valid_noflush(folio_file_page(folio, range_start), npages - 1,
    77							 !default_state);
    78			if (r)
    79				goto out_flush;
    80	
    81			range_start = index;
    82			npages = 1;
    83		}
    84	
    85		r = set_direct_map_valid_noflush(folio_file_page(folio, range_start), npages,
    86						 !default_state);
    87	
    88	out_flush:
    89		/*
    90		 * Use PG_private to track that this folio has had potentially some of
    91		 * its direct map entries modified, so that we can restore them in free_folio.
    92		 */
    93		folio_set_private(folio);
  > 94		flush_tlb_kernel_range(start, start + folio_size(folio));
    95	out:
    96		return r;
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
