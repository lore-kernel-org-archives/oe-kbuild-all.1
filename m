Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9412F24
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637139; cv=none; b=oPvehNTR/IdY2ygXHb9jY3NIZBzkD0b0dk6ob2D1WQY8dWxGebay+W0IePNrRYz3hwAtg4LBPfE3EhEbpE0xPNKUofQ12meeFv9QWoiBbWvcfAEPNW6W7XxOFG6Z4ncg6NLJjli2Dptmkx6TCxLmYXLo/H6mnNNWFNmeI6zd4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637139; c=relaxed/simple;
	bh=gPLtyc7H1rdGc5dPcVlNYVK1hKdO+PwsYEKtVvgSbh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r3QfUkAJArozxbszI+0XynMI+m6+X0ywnydT4K+q0886DZ+3C0oKX8FOtZ959PQ8C8AKIFjCWw9tIZev8ED0tzaeg7/emgJERyqkfmfI7Xl4U76FyVd5ctruMVMkEpdwmFh9dlvv/mugG25iP8t+TVul+brOzS765lJi0EKfRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WsYXL2jtqzhYQw;
	Mon, 26 Aug 2024 09:50:10 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 29C4D1402CA;
	Mon, 26 Aug 2024 09:52:13 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 09:52:12 +0800
Message-ID: <27e2d62b-ec0b-4737-92a5-242c6651bdc0@huawei.com>
Date: Mon, 26 Aug 2024 09:52:12 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6060/6439] mm/memory_hotplug.c:1811:33: error:
 implicit declaration of function 'unmap_posioned_folio'; did you mean
 'unmap_poisoned_folio'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
References: <202408260054.ka3zWBLH-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202408260054.ka3zWBLH-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100008.china.huawei.com (7.185.36.138)


Andrew has two typo fix, should I resend all patch with fix-patch squashed?

+ mm-memory-failure-add-unmap_posioned_folio-fix.patch added to 
mm-unstable branch
+ 
mm-memory_hotplug-check-hwpoisoned-page-firstly-in-do_migrate_range-fix.patch 
added to mm-unstable branch

On 2024/8/26 0:48, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c79c85875f1af04040fe4492ed94ce37ad729c4d
> commit: fb3b45758493a2451a9fdcf7f8c034d614d85939 [6060/6439] mm: memory_hotplug: check hwpoisoned page firstly in do_migrate_range()
> config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20240826/202408260054.ka3zWBLH-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408260054.ka3zWBLH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408260054.ka3zWBLH-lkp@intel.com/
> 
> Note: the linux-next/master HEAD c79c85875f1af04040fe4492ed94ce37ad729c4d builds fine.
>        It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>     mm/memory_hotplug.c: In function 'do_migrate_range':
>>> mm/memory_hotplug.c:1811:33: error: implicit declaration of function 'unmap_posioned_folio'; did you mean 'unmap_poisoned_folio'? [-Werror=implicit-function-declaration]
>      1811 |                                 unmap_posioned_folio(folio, TTU_IGNORE_MLOCK);
>           |                                 ^~~~~~~~~~~~~~~~~~~~
>           |                                 unmap_poisoned_folio
>     cc1: some warnings being treated as errors
> 
> 
> vim +1811 mm/memory_hotplug.c
> 
>    1772	
>    1773	static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
>    1774	{
>    1775		unsigned long pfn;
>    1776		struct page *page;
>    1777		LIST_HEAD(source);
>    1778		static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
>    1779					      DEFAULT_RATELIMIT_BURST);
>    1780	
>    1781		for (pfn = start_pfn; pfn < end_pfn; pfn++) {
>    1782			struct folio *folio;
>    1783			bool isolated;
>    1784	
>    1785			if (!pfn_valid(pfn))
>    1786				continue;
>    1787			page = pfn_to_page(pfn);
>    1788			folio = page_folio(page);
>    1789	
>    1790			/*
>    1791			 * No reference or lock is held on the folio, so it might
>    1792			 * be modified concurrently (e.g. split).  As such,
>    1793			 * folio_nr_pages() may read garbage.  This is fine as the outer
>    1794			 * loop will revisit the split folio later.
>    1795			 */
>    1796			if (folio_test_large(folio))
>    1797				pfn = folio_pfn(folio) + folio_nr_pages(folio) - 1;
>    1798	
>    1799			/*
>    1800			 * HWPoison pages have elevated reference counts so the migration would
>    1801			 * fail on them. It also doesn't make any sense to migrate them in the
>    1802			 * first place. Still try to unmap such a page in case it is still mapped
>    1803			 * (e.g. current hwpoison implementation doesn't unmap KSM pages but keep
>    1804			 * the unmap as the catch all safety net).
>    1805			 */
>    1806			if (folio_test_hwpoison(folio) ||
>    1807			    (folio_test_large(folio) && folio_test_has_hwpoisoned(folio))) {
>    1808				if (WARN_ON(folio_test_lru(folio)))
>    1809					folio_isolate_lru(folio);
>    1810				if (folio_mapped(folio))
>> 1811					unmap_posioned_folio(folio, TTU_IGNORE_MLOCK);
>    1812				continue;
>    1813			}
>    1814	
>    1815			if (folio_test_hugetlb(folio)) {
>    1816				isolate_hugetlb(folio, &source);
>    1817				continue;
>    1818			}
>    1819	
>    1820			if (!get_page_unless_zero(page))
>    1821				continue;
>    1822			/*
>    1823			 * We can skip free pages. And we can deal with pages on
>    1824			 * LRU and non-lru movable pages.
>    1825			 */
>    1826			if (PageLRU(page))
>    1827				isolated = isolate_lru_page(page);
>    1828			else
>    1829				isolated = isolate_movable_page(page, ISOLATE_UNEVICTABLE);
>    1830			if (isolated) {
>    1831				list_add_tail(&page->lru, &source);
>    1832				if (!__PageMovable(page))
>    1833					inc_node_page_state(page, NR_ISOLATED_ANON +
>    1834							    page_is_file_lru(page));
>    1835	
>    1836			} else {
>    1837				if (__ratelimit(&migrate_rs)) {
>    1838					pr_warn("failed to isolate pfn %lx\n", pfn);
>    1839					dump_page(page, "isolation failed");
>    1840				}
>    1841			}
>    1842			put_page(page);
>    1843		}
>    1844		if (!list_empty(&source)) {
>    1845			nodemask_t nmask = node_states[N_MEMORY];
>    1846			struct migration_target_control mtc = {
>    1847				.nmask = &nmask,
>    1848				.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
>    1849				.reason = MR_MEMORY_HOTPLUG,
>    1850			};
>    1851			int ret;
>    1852	
>    1853			/*
>    1854			 * We have checked that migration range is on a single zone so
>    1855			 * we can use the nid of the first page to all the others.
>    1856			 */
>    1857			mtc.nid = page_to_nid(list_first_entry(&source, struct page, lru));
>    1858	
>    1859			/*
>    1860			 * try to allocate from a different node but reuse this node
>    1861			 * if there are no other online nodes to be used (e.g. we are
>    1862			 * offlining a part of the only existing node)
>    1863			 */
>    1864			node_clear(mtc.nid, nmask);
>    1865			if (nodes_empty(nmask))
>    1866				node_set(mtc.nid, nmask);
>    1867			ret = migrate_pages(&source, alloc_migration_target, NULL,
>    1868				(unsigned long)&mtc, MIGRATE_SYNC, MR_MEMORY_HOTPLUG, NULL);
>    1869			if (ret) {
>    1870				list_for_each_entry(page, &source, lru) {
>    1871					if (__ratelimit(&migrate_rs)) {
>    1872						pr_warn("migrating pfn %lx failed ret:%d\n",
>    1873							page_to_pfn(page), ret);
>    1874						dump_page(page, "migration failure");
>    1875					}
>    1876				}
>    1877				putback_movable_pages(&source);
>    1878			}
>    1879		}
>    1880	}
>    1881	
> 
