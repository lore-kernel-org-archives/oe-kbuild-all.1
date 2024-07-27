Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072471F94D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722067001; cv=none; b=Wm1mHjHdZGvrYLI5+TKvWVR+1QmTsGBLcNBwjOIV4QhqeDMvl1L6WrFX4j6nJs4qNyca+j5iJCWT6B2ATIaQKnRcWwrO7g3t77fAnfdygTAXt+30SJVG4XTGxWiQJ47JbsLSLkSBBPa5euhCEUOQnHNayCeXUVqct6C+buLcx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722067001; c=relaxed/simple;
	bh=f9iYq2T+lRNn6oB3g5aVHWeUzEzYoXlRt0tVmcd7hxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k4ODcm+xuO1g3UU7s8F/YMiXgjDv/sFgVIH5AofadUPda1zKL1lwQgytTm5kax0O/aLO0s6ZwT+X6nHNgpKh5twAqiETRS5/zQdunKbHD1IG9a2CRXGj2RiAED7EfCJq5rOt1E7mb3SntOdoQuhurnallaaK4KqDadQmiSuHFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WWH4s0L8GzxVWC;
	Sat, 27 Jul 2024 15:56:29 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A31A1800A1;
	Sat, 27 Jul 2024 15:56:35 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 27 Jul 2024 15:56:34 +0800
Message-ID: <85eafcd2-fc3c-443f-b7be-32298fa34da1@huawei.com>
Date: Sat, 27 Jul 2024 15:56:34 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: migrate: add isolate_folio_to_list()
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, David Hildenbrand <david@redhat.com>, Oscar Salvador
	<osalvador@suse.de>, Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
	<nao.horiguchi@gmail.com>
References: <20240725011647.1306045-4-wangkefeng.wang@huawei.com>
 <202407262129.FJbkroy1-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202407262129.FJbkroy1-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf100008.china.huawei.com (7.185.36.138)



On 2024/7/26 22:21, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-memory-failure-add-unmap_posioned_folio/20240725-091923
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240725011647.1306045-4-wangkefeng.wang%40huawei.com
> patch subject: [PATCH 3/4] mm: migrate: add isolate_folio_to_list()
> config: x86_64-randconfig-004-20240726 (https://download.01.org/0day-ci/archive/20240726/202407262129.FJbkroy1-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407262129.FJbkroy1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407262129.FJbkroy1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     ld: mm/memory-failure.o: in function `mf_isolate_folio':
>>> mm/memory-failure.c:2662:(.text+0x2e8a): undefined reference to `isolate_folio_to_list'
> 
> 

OK, no CONFIG_MIGRATION, will fix in next version,

> vim +2662 mm/memory-failure.c
> 
>    2659	
>    2660	static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)

and will kill mf_ioslate_folio() too, we could directly use 
isolate_folio_to_list() in soft_offline_in_use_page().


Thanks.

>    2661	{
>> 2662		bool isolated = isolate_folio_to_list(folio, pagelist);
>    2663	
>    2664		/*
>    2665		 * If we succeed to isolate the folio, we grabbed another refcount on
>    2666		 * the folio, so we can safely drop the one we got from get_any_page().
>    2667		 * If we failed to isolate the folio, it means that we cannot go further
>    2668		 * and we will return an error, so drop the reference we got from
>    2669		 * get_any_page() as well.
>    2670		 */
>    2671		folio_put(folio);
>    2672		return isolated;
>    2673	}
>    2674	
> 
