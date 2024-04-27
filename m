Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4D3F8ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 05:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714196489; cv=none; b=qE8VaPO70NctIY/nSPWB5EfmS3VB19lC1EO0wSD5D+6bEXkaAVZx4RX8qOo0tedLgYWCtC4kqUBJWZO/IL8cpo3o3LXrUPnCmrXo/M61LPwzX8ix6vLdHbGOUmXdQRLJeQnydP2USUU40VVFV58nMP2gzRKUSr2YoyqgXHbqAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714196489; c=relaxed/simple;
	bh=4KBaPVg/vl6HBGT4GRii3ZWIOagFbgU6fOXx9FQTPKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoQirvGxx3ZDbYDo9HerXUMKQwJez/azbNSLDvsninRHpdxC54N4ZBXhD4bvSouz/ePlhAYOX/bUvDJ5KipsfFYSrQKeBw5AMHkCGXF27OvYldjG2OmPg8Dh6PSx1RJ8uzVWPQ5szUl3COGbPW/a34hhmisfme5hh3MqGO4TvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtn1Dq5X; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtn1Dq5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714196488; x=1745732488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4KBaPVg/vl6HBGT4GRii3ZWIOagFbgU6fOXx9FQTPKU=;
  b=dtn1Dq5XwXnIFeBlIPxDz6+RbIcEA1cvGOu6mrPY1ieA39x4qXDBMUhp
   VzaYdWZn4L4K1pFwOiZjdxpBo19xoCyGQD9ueHUhOiSDx5wK+3cRSCZmm
   arhZz+RGrQRvjOc0Ml2lBtHELezvJQWK0CM7xhcad5qgNbbVU214mc3ip
   zxf9skuXvXo1p9bBDDlsHTdmmnTTj54vKmqSRtH8LbScwtwwvdirrRd+7
   s7VH0jD0w/tR8E93TBzHwg5GoX2thCgjhwUYFY3tIPe/u6UJeDvNwc8FE
   4JfkjzL8KCg8cGEfDv4qtaSUSwljVXAbXUIc2kYWhiyX0LgszFk3eUw5R
   A==;
X-CSE-ConnectionGUID: QMTh/BKkSFCO/UgBstiNtg==
X-CSE-MsgGUID: dCW0UYMQSfeBdJrAtxSBOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20491386"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="20491386"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 22:41:27 -0700
X-CSE-ConnectionGUID: t/KA0GRaS2yezDm8TQbvHQ==
X-CSE-MsgGUID: iZvErTFwSdW6esmKv95/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30064688"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2024 22:41:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0aoM-0004gg-0M;
	Sat, 27 Apr 2024 05:41:22 +0000
Date: Sat, 27 Apr 2024 13:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	willy@infradead.org, David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Vishal Moola <vishal.moola@gmail.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page
 firstly in do_migrate_range()
Message-ID: <202404271311.KpDy4akD-lkp@intel.com>
References: <20240425084028.3888403-2-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425084028.3888403-2-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range/20240425-164317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240425084028.3888403-2-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271311.KpDy4akD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271311.KpDy4akD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271311.KpDy4akD-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory_hotplug.c: In function 'isolate_and_unmap_hwposion_folio':
>> mm/memory_hotplug.c:1786:27: error: implicit declaration of function 'hugetlb_page_mapping_lock_write'; did you mean 'hugetlb_folio_mapping_lock_write'? [-Werror=implicit-function-declaration]
    1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           hugetlb_folio_mapping_lock_write
   mm/memory_hotplug.c:1786:25: warning: assignment to 'struct address_space *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
         |                         ^
   cc1: some warnings being treated as errors


vim +1786 mm/memory_hotplug.c

  1774	
  1775	static bool isolate_and_unmap_hwposion_folio(struct folio *folio)
  1776	{
  1777		if (WARN_ON(folio_test_lru(folio)))
  1778			folio_isolate_lru(folio);
  1779	
  1780		if (!folio_mapped(folio))
  1781			return true;
  1782	
  1783		if (folio_test_hugetlb(folio) && !folio_test_anon(folio)) {
  1784			struct address_space *mapping;
  1785	
> 1786			mapping = hugetlb_page_mapping_lock_write(&folio->page);
  1787			if (mapping) {
  1788				/*
  1789				 * In shared mappings, try_to_unmap could potentially
  1790				 * call huge_pmd_unshare.  Because of this, take
  1791				 * semaphore in write mode here and set TTU_RMAP_LOCKED
  1792				 * to let lower levels know we have taken the lock.
  1793				 */
  1794				try_to_unmap(folio, TTU_IGNORE_MLOCK | TTU_RMAP_LOCKED);
  1795				i_mmap_unlock_write(mapping);
  1796			}
  1797		} else {
  1798			try_to_unmap(folio, TTU_IGNORE_MLOCK);
  1799		}
  1800	
  1801		return folio_mapped(folio);
  1802	}
  1803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
