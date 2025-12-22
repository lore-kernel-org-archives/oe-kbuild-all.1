Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418B3C0C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 01:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766368027; cv=none; b=FkEbKnJwjPGaSfyhpbDbwiQ4AcF8iaaZHWLJUVMitaSQ4vWdSu38x8QeZHU5a1bgpwmirz/IARAQvbt/MkcmyJi98kwjZOPuztEVQcL/2qmYtljcp5f8rgnTIUV+iadRLt9npZBrtKunQJf1ZwL1Ba8uB+u/bfs/cBppBMg5MXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766368027; c=relaxed/simple;
	bh=Y8gMJRS51QMXwcZwKcV47RvpfGhr5eyz4YBxVEmySoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N0ldGXRNOI+0O+o1PB6hl2pz7bvtdsa6Lsn82K87BbloS+a+qgqD1LI6EwwhViTFhN/8JqFlYrV/aGJKQq5AQhlGrLPXeiHbAHG8UCeG/Illp9KyRDQe1tV8FQ8hC4xMK2y7tkBYMV1N1wHMRdBgZwhFFACopFV8M1noeSizpNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=lYRbuysm; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="lYRbuysm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rSMZmesBLFgpq+A0LYpVko4h+lt0AEEuH7RX7GEQVlo=;
	b=lYRbuysmu5FfGITGv6TYTLp3eumslNXWu5jf/XWdplckklCgTmhi4Ys0azd9VS900rj2hSeix
	vxLPDzJJo0lXa4MbcXWl26NzKCdGbjZFQXzmlDjSTnDVJ8Q8Q+/CGkZQGQlaUPE5ESZWJgdGZ0X
	Y8ULjA2ipNdsiZc7Y9MgRjo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dZLX74R6xz1K98D;
	Mon, 22 Dec 2025 09:43:51 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 1C2A040539;
	Mon, 22 Dec 2025 09:46:55 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Dec 2025 09:46:54 +0800
Message-ID: <2f528a53-5acb-4e2b-9346-231f882ecb6a@huawei.com>
Date: Mon, 22 Dec 2025 09:46:53 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] mm: cma: add cma_alloc_frozen{_compound}()
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Oscar
 Salvador <osalvador@suse.de>, Muchun Song <muchun.song@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <sidhartha.kumar@oracle.com>, <jane.chu@oracle.com>, Zi
 Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>, Brendan Jackman
	<jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox
	<willy@infradead.org>
References: <20251216114844.2126250-6-wangkefeng.wang@huawei.com>
 <202512202141.mGkUgIRF-lkp@intel.com>
Content-Language: en-US
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202512202141.mGkUgIRF-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf100008.china.huawei.com (7.185.36.138)



On 2025/12/20 22:34, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-debug_vm_pgtable-add-debug_vm_pgtable_free_huge_page/20251216-195027
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251216114844.2126250-6-wangkefeng.wang%40huawei.com
> patch subject: [PATCH v4 5/6] mm: cma: add cma_alloc_frozen{_compound}()
> config: s390-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202141.mGkUgIRF-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202141.mGkUgIRF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512202141.mGkUgIRF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     mm/hugetlb_cma.c: In function 'hugetlb_cma_alloc_folio':
>>> mm/hugetlb_cma.c:44:11: warning: array subscript [0, 0] is outside array bounds of 'struct cma *[1]' [-Warray-bounds]
>         page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for CAN_DEV
>     Depends on [n]: NETDEVICES [=n] && CAN [=m]
>     Selected by [m]:
>     - CAN [=m] && NET [=y]
> 
> 
> vim +44 mm/hugetlb_cma.c
> 
>      28	
>      29	struct folio *hugetlb_cma_alloc_folio(int order, gfp_t gfp_mask,
>      30					      int nid, nodemask_t *nodemask)
>      31	{
>      32		int node;
>      33		struct folio *folio;
>      34		struct page *page = NULL;
>      35	
>      36		if (hugetlb_cma[nid])
>      37			page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);
>      38	
>      39		if (!page && !(gfp_mask & __GFP_THISNODE)) {
>      40			for_each_node_mask(node, *nodemask) {
>      41				if (node == nid || !hugetlb_cma[node])
>      42					continue;
>      43	
>    > 44				page = cma_alloc_frozen_compound(hugetlb_cma[nid], order);

Oh, it should be hugetlb_cma[node] in the fallback path, thanks for the 
reporting.

