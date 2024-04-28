Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472B264A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 00:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714265408; cv=none; b=KclKhOtsEayqA4X+xX7cqrAryDPaAQvDujIzLkmTwSemgwmstBDJ928QgpI1r45vf3xjUZpyUSmDW6Jh7BSKBSvoRRtOv3qxIjLCxfRwbZwcYNUuIScx+12mVdewQBxWzOGvgV0pqTW1+D12alN31FflNruKASWoasCLRmVziLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714265408; c=relaxed/simple;
	bh=OuGtOZUPd0fmKQgK3YOrjLQqQHwjRNRWorBq48bDJ2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ovtHmjaERsruINTXH3DQi58spDsLddRXn2aKElBbPMAN3WcZbNMCi6JOI2sgW/KFpjcKfHsryPZOiLRiAOU56gb8yS2oimgbe0RquNFuheK3bHOIR0UIy+qM5N3ImNXRMPzDuaWnpNrROffw6Du+FwfgLHfBtpYAA/yd/C/DBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VRnqF5gYVzNv22;
	Sun, 28 Apr 2024 08:47:21 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 22172180065;
	Sun, 28 Apr 2024 08:49:57 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 08:49:56 +0800
Message-ID: <90144595-48d9-48e0-bfbb-e45f1d220a6a@huawei.com>
Date: Sun, 28 Apr 2024 08:49:55 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page
 firstly in do_migrate_range()
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <willy@infradead.org>, David Hildenbrand
	<david@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, Zi Yan
	<ziy@nvidia.com>, Hugh Dickins <hughd@google.com>, Jonathan Corbet
	<corbet@lwn.net>, Vishal Moola <vishal.moola@gmail.com>
References: <20240425084028.3888403-2-wangkefeng.wang@huawei.com>
 <202404271110.2fxPtHNB-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202404271110.2fxPtHNB-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/4/27 11:57, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range/20240425-164317
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240425084028.3888403-2-wangkefeng.wang%40huawei.com
> patch subject: [PATCH v2 01/10] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271110.2fxPtHNB-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271110.2fxPtHNB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404271110.2fxPtHNB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     mm/memory_hotplug.c: In function 'isolate_and_unmap_hwposion_folio':
>     mm/memory_hotplug.c:1786:27: error: implicit declaration of function 'hugetlb_page_mapping_lock_write'; did you mean 'hugetlb_folio_mapping_lock_write'? [-Werror=implicit-function-declaration]
>      1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
>           |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                           hugetlb_folio_mapping_lock_write
>>> mm/memory_hotplug.c:1786:25: warning: assignment to 'struct address_space *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      1786 |                 mapping = hugetlb_page_mapping_lock_write(&folio->page);
>           |                         ^
>     cc1: some warnings being treated as errors


The patch based on next-20240425, but from next-20240426 with
"mm: convert hugetlb_page_mapping_lock_write to folio", so it is easy to
fix by converting to hugetlb_folio_mapping_lock_write() api, but keep it
for a while, see if there are any new comments about this patchset.


Thanks.

> 
> 
> vim +1786 mm/memory_hotplug.c
> 
>    1774	
>    1775	static bool isolate_and_unmap_hwposion_folio(struct folio *folio)
>    1776	{
>    1777		if (WARN_ON(folio_test_lru(folio)))
>    1778			folio_isolate_lru(folio);
>    1779	
>    1780		if (!folio_mapped(folio))
>    1781			return true;
>    1782	
>    1783		if (folio_test_hugetlb(folio) && !folio_test_anon(folio)) {
>    1784			struct address_space *mapping;
>    1785	
>> 1786			mapping = hugetlb_page_mapping_lock_write(&folio->page);
>    1787			if (mapping) {
>    1788				/*
>    1789				 * In shared mappings, try_to_unmap could potentially
>    1790				 * call huge_pmd_unshare.  Because of this, take
>    1791				 * semaphore in write mode here and set TTU_RMAP_LOCKED
>    1792				 * to let lower levels know we have taken the lock.
>    1793				 */
>    1794				try_to_unmap(folio, TTU_IGNORE_MLOCK | TTU_RMAP_LOCKED);
>    1795				i_mmap_unlock_write(mapping);
>    1796			}
>    1797		} else {
>    1798			try_to_unmap(folio, TTU_IGNORE_MLOCK);
>    1799		}
>    1800	
>    1801		return folio_mapped(folio);
>    1802	}
>    1803	
> 
