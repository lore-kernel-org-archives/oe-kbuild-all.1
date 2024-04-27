Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79EC381CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 03:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714190248; cv=none; b=P9NUpzfCOJwpMujb2kFjTzFBsQJoILgukK8j936G1XUsS98CDZXirrmjVbsn3lqhcGPg5Oc+fPKwNHPiMWSstGlFL3cdpv2dEPkYxbkRdps0hHbbKdksdrqTCXRECPRV0z2ZceP/OjxjDdBAvbx/NcNzYj5mHoGc/ZYkKWvkTHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714190248; c=relaxed/simple;
	bh=YRmiWQP+/17pF8L5yQ2vm+Ph+FwmOORL/xrdcXpC2N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m69De4juSAIiAlTlmGRno8OVvEso3Qfyp81Vh522DpllimUw9cpBxCp7a3tC7Kylc05Muvdjymqg0nJnIoNVWD3XDJt8BGdx/KyxhEskwhf5/4cS3q4/SAPRwvk5p3RWGiS8/SZQquExVxlWyZ50yB5///vAGxH29ffbdmhSWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObCQPW+o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObCQPW+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714190247; x=1745726247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRmiWQP+/17pF8L5yQ2vm+Ph+FwmOORL/xrdcXpC2N4=;
  b=ObCQPW+olc7vLbZwMTKGo3cOgGkdCwD6ZCM2+Hs1YXP9cmOMUdUuW/JF
   KEc6JqH2RfR3ALjzFuId3kz48/HJviiGLDIm+1G0HeqUEec29CVZ8CqWa
   zXEOmg3NKw5GRoB/nUapS2o+rlo6KdA5fe6fCWRVwEAbvEt5BkISc8Mf9
   Gs++/kmZaoczEioJcLB2wKU3+K+AwAQLjfeRNmyjvAotroONfSbodIZy/
   qptGB1snpcngyvRqlZ2hAL53zX7vX5arya0Spse/h1RWsVL/GmSrcDVCt
   e0VeKH4GKff0NCEMamifWXZvI1/98gunbHkq7B2YfHEOBbKU72xxPNSS5
   g==;
X-CSE-ConnectionGUID: VNkOc2S7Tx6ZXgj8eqLpXA==
X-CSE-MsgGUID: S8eBwOkYThes1TjccF7sFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13710110"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="13710110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 20:57:27 -0700
X-CSE-ConnectionGUID: 0Z5giV09RvC17vyIh9sDqg==
X-CSE-MsgGUID: nwPfgNo2QHST82wEqoGweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30408687"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Apr 2024 20:57:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0ZBg-0004dd-24;
	Sat, 27 Apr 2024 03:57:20 +0000
Date: Sat, 27 Apr 2024 11:57:15 +0800
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
Message-ID: <202404271110.2fxPtHNB-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range/20240425-164317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240425084028.3888403-2-wangkefeng.wang%40huawei.com
patch subject: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271110.2fxPtHNB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271110.2fxPtHNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271110.2fxPtHNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.c: In function 'isolate_and_unmap_hwposion_folio':
   mm/memory_hotplug.c:1786:27: error: implicit declaration of function 'hugetlb_page_mapping_lock_write'; did you mean 'hugetlb_folio_mapping_lock_write'? [-Werror=implicit-function-declaration]
    1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           hugetlb_folio_mapping_lock_write
>> mm/memory_hotplug.c:1786:25: warning: assignment to 'struct address_space *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
