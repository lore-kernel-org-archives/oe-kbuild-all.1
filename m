Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF32BCF46
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241315; cv=none; b=q+7p9W3KbQ7cl1ag/+0IvWi0lBIzPlIzSvcmWFGJfU10gjS+g1JFASTCL8NqMnTUKKw2c2IVLtCnY7nJXeIbGAKtSe51TfZVdyWXX006KXwBPIJSMhASguRrx4V+afAweTbZhDbqnoNLfdspqYSHFOE4O0I5UEmmHRKz8icu3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241315; c=relaxed/simple;
	bh=lcqfRcZnUhdZtM2v+VZSf69JMQrf1vkEY0OB5dx1RO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMTx3LZNv7S/NSkZokZc3hXAQur/Lyj69utBf87EveqUPVfQSsF2QrwQ75RJsTGJjTP7F2TAWrM1Af3KNNDCElGEdIJ6l766HYzW75YHrnzShjy2+cC1D2TXf/o4nzLfw+ei+72DX8nyz2ii0XhnhqpkAbVfWhRmxUfH61+gkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MT/3ZRRi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MT/3ZRRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241313; x=1797777313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lcqfRcZnUhdZtM2v+VZSf69JMQrf1vkEY0OB5dx1RO8=;
  b=MT/3ZRRitBPXmaJeaus+xwyJjgkTRK27QaIa0KhqkLUtRnchtURyx97o
   ucIHF42PPv3bhKwyuMqG/wM9KZ9WmflpMLMorZQiV2R5rnlgHF0gO162w
   TmQrL7LDthu0LbnGSidfhsPf7xPBdrhkasM8Y3MZ7sXp4GEqtSQ5VrFlh
   P9RxL7viOc6BrS0y1KfPE4P5i5bHjEyf4/NxuEGSLVocHBeYWHYGRqhZo
   DK7NXndM/9v3v4umCYQ768CUFYnklpPsxaFBQP88APjmmQYYXckZYBXwI
   mCygrdkGDj+C83CLgP+V7r494MtXy2oJg3sIckQMHQylPFdyzzLkD/Vau
   Q==;
X-CSE-ConnectionGUID: KNHVRJU6QTqipxTJ4W3FNw==
X-CSE-MsgGUID: 7VmygkNBSFChfA0S3WBK2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93650019"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93650019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:10 -0800
X-CSE-ConnectionGUID: lpBrIjs7QE6cywKFsDUrqQ==
X-CSE-MsgGUID: T6t0zGU8RnGO6Mtxlbp0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199023547"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eW-1HuP;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	sidhartha.kumar@oracle.com, jane.chu@oracle.com,
	Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v4 5/6] mm: cma: add cma_alloc_frozen{_compound}()
Message-ID: <202512202141.mGkUgIRF-lkp@intel.com>
References: <20251216114844.2126250-6-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216114844.2126250-6-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-debug_vm_pgtable-add-debug_vm_pgtable_free_huge_page/20251216-195027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251216114844.2126250-6-wangkefeng.wang%40huawei.com
patch subject: [PATCH v4 5/6] mm: cma: add cma_alloc_frozen{_compound}()
config: s390-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202141.mGkUgIRF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202141.mGkUgIRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202141.mGkUgIRF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb_cma.c: In function 'hugetlb_cma_alloc_folio':
>> mm/hugetlb_cma.c:44:11: warning: array subscript [0, 0] is outside array bounds of 'struct cma *[1]' [-Warray-bounds]
       page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +44 mm/hugetlb_cma.c

    28	
    29	struct folio *hugetlb_cma_alloc_folio(int order, gfp_t gfp_mask,
    30					      int nid, nodemask_t *nodemask)
    31	{
    32		int node;
    33		struct folio *folio;
    34		struct page *page = NULL;
    35	
    36		if (hugetlb_cma[nid])
    37			page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
    38	
    39		if (!page && !(gfp_mask & __GFP_THISNODE)) {
    40			for_each_node_mask(node, *nodemask) {
    41				if (node == nid || !hugetlb_cma[node])
    42					continue;
    43	
  > 44				page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
    45				if (page)
    46					break;
    47			}
    48		}
    49	
    50		if (!page)
    51			return NULL;
    52	
    53		set_page_refcounted(page);
    54		folio = page_folio(page);
    55		folio_set_hugetlb_cma(folio);
    56		return folio;
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
