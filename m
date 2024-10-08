Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D150212D02
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 18:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728413364; cv=none; b=c0p+27s8O8jDZkL1FNkh+KhXU2MdbnpoSiLkjEvAitnP61IrIkMK30PzEnDs8EJwtwvlbJCtzEq//2pMZXR2FKYhvbExqyxenFcy+DU27oAa1qhtD73WmQmxOcadpjHnArDjKPbAXGq4Tr2lewofLN6P9sEluMWWeZekXcJnBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728413364; c=relaxed/simple;
	bh=v5LcOK77LG9FVjVbChDwRzunUvvOseqgR7b238RkxH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od0mppGhAp9FFsyMTd5lRQnVnUeLMg+00STZRTTXu0Sh8cg79ZNY5TcMT+UaI+ipFS8VN61ZElQeRyANhvMVYbMs/e0eqyHIL9zv2h+PApXa+557T3aDDg08ll6yCmxln5exXqdRINaRBLAG/WyriSoLZxAVoKuUuML+3m4D5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnsJq0UZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnsJq0UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728413363; x=1759949363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5LcOK77LG9FVjVbChDwRzunUvvOseqgR7b238RkxH0=;
  b=QnsJq0UZRhcr9H1qi1I4ZhN+4PpYyvKU8AdI7nNGR7kVfn1v/HjkDlHu
   9nVyCPiqP2rs26XXU+7QStJv5hpn5KwvcSUdXaeseF183hD4xfYQLrprY
   dEWlr5h+k7BwX4WEClqIqEuQvL7CHH+fH5F4LbLVlDhJkQLSgtYySSGZt
   +0lcNrdriSxjb3HsNWKwmnuReTpU/bsuqD9hf5cGNJMX0F6wmeP8pLiPh
   c1IWWbKxWF82eifaGXIZZmpzdcp3BL+PcXbQk6jfsIypV6K6z66HQi4vJ
   EwCWGMxKuV383+IORUYhdPCNZwhi73rHBfdV0assTHEVDfZOXmzkk6TNr
   g==;
X-CSE-ConnectionGUID: 04ON7KPLQKKTCpcIyenGlg==
X-CSE-MsgGUID: vExmaJNZRda/5gd9GmdbLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27734322"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27734322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 11:49:05 -0700
X-CSE-ConnectionGUID: 4GRXry2jQ2avy1adY+ErRA==
X-CSE-MsgGUID: vqpsZiFXRxWvxoVrhJgPaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="106707039"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Oct 2024 11:49:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syFGX-0008Gm-21;
	Tue, 08 Oct 2024 18:49:01 +0000
Date: Wed, 9 Oct 2024 02:48:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH v2 5/7] bootmem: Stop using page->index
Message-ID: <202410090224.gxQY18rm-lkp@intel.com>
References: <20241005200121.3231142-6-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005200121.3231142-6-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/locking/core tip/x86/mm dennis-percpu/for-next linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Convert-page_to_pgoff-to-page_pgoff/20241006-040239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241005200121.3231142-6-willy%40infradead.org
patch subject: [PATCH v2 5/7] bootmem: Stop using page->index
config: x86_64-randconfig-011-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090224.gxQY18rm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090224.gxQY18rm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090224.gxQY18rm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/init_64.c: In function 'free_pagetable':
>> arch/x86/mm/init_64.c:992:42: error: implicit declaration of function 'bootmem_type' [-Werror=implicit-function-declaration]
     992 |                 enum bootmem_type type = bootmem_type(page);
         |                                          ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bootmem_type +992 arch/x86/mm/init_64.c

   987	
   988	static void __meminit free_pagetable(struct page *page, int order)
   989	{
   990		/* bootmem page has reserved flag */
   991		if (PageReserved(page)) {
 > 992			enum bootmem_type type = bootmem_type(page);
   993			unsigned long nr_pages = 1 << order;
   994	
   995			if (type == SECTION_INFO || type == MIX_SECTION_INFO) {
   996				while (nr_pages--)
   997					put_page_bootmem(page++);
   998			} else
   999				while (nr_pages--)
  1000					free_reserved_page(page++);
  1001		} else
  1002			free_pages((unsigned long)page_address(page), order);
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
