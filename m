Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F44F1667F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950905; cv=none; b=RiJlU9Wbj4Lbd9c33gMcrsEnhzqmElDpkCJW0ZQrzSW8gRquRnZti6elw+DaAhY7KCMolOSC52oxf2SA/s7iWjdto7YZYXCyswtUdXzX4GUPzKg63D5vz8Pgo1BDiMd7SJWX/OJ+rA2+/pNdOAoxIbHwNlilAZloWa3gfko59ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950905; c=relaxed/simple;
	bh=UqVhYX7+CqNI9WBFZ8VKzEtVLRL2JhfH0PbipTeUeKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FQ3tENnmDPorTbMc7rpbtn2rl9cH48X3vPBhEDhGQfAsOgRWLIGwhihyHMrWit2FZ8J/cRzOlmIFGDgADxOPtvewg27l0UIUYdMfD9q6VO6As/Q4mzj/IJmYc43EoALeULcyGiC0nCz8Zsdx4XNUZj410t6oB4kNH5nImcPgrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W56b95j4zzxPtp;
	Fri, 21 Jun 2024 14:17:25 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id E4038140118;
	Fri, 21 Jun 2024 14:21:39 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Jun 2024 14:21:39 +0800
Message-ID: <6e5844cc-827d-4799-9965-959e631bef40@huawei.com>
Date: Fri, 21 Jun 2024 14:21:39 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6447/7105] mm/mempolicy.c:2280:15: error:
 redefinition of 'folio_alloc_mpol_noprof'
Content-Language: en-US
To: Philip Li <philip.li@intel.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
References: <202406202319.pBcCfVar-lkp@intel.com>
 <0c35a647-caa4-4451-b74e-65c68c83f0ca@huawei.com>
 <ZnUH4B6MlKEKDM0A@rli9-mobl>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZnUH4B6MlKEKDM0A@rli9-mobl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf100008.china.huawei.com (7.185.36.138)



On 2024/6/21 12:56, Philip Li wrote:
> On Fri, Jun 21, 2024 at 11:17:05AM +0800, Kefeng Wang wrote:
>>
>>
>> On 2024/6/20 23:55, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   2102cb0d050d34d50b9642a3a50861787527e922
>>> commit: f85385e70cb4bbb569298830fdf0a3d8325de36d [6447/7105] mm: add folio_alloc_mpol()
>>> config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/config)
>>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/reproduce)
>>
>> Hi, thanks for report, I try with gcc-13 from 0day[1], but can't
>> reproduce with above config.
>>
>> [1] https://download.01.org/0day-ci/cross-package/gcc-13.2.0-nolibc
>>
...

>> The above error is strange, my change shouldn't affect them.
> 
> Hi Kefeng, sorry for confusion, usually you only need take care of the issue
> that is prefixed with >>, which is the new issue being introduced by the commit.
> Other issues exist due to existing commits.
> 
>>
>>>            |                                              ^~~~
>>>      mm/mempolicy.c: At top level:
>>>      mm/mempolicy.c:2221:14: error: redefinition of 'alloc_pages_mpol_noprof'
>>>       2221 | struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
> 
> [...]
> 
>>>            |              ^~~~~~~~~~~~~~~~~~~~~~~
>>>            |                         __count_vm_event
>>>      mm/mempolicy.c:2272:61: error: 'NUMA_INTERLEAVE_HIT' undeclared (first use in this function)
>>>       2272 |                         __count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
>>>            |                                                             ^~~~~~~~~~~~~~~~~~~
>>>      mm/mempolicy.c: At top level:
>>>>> mm/mempolicy.c:2280:15: error: redefinition of 'folio_alloc_mpol_noprof'
>>>       2280 | struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
> 
> For this report, you can check whether this issue can be reproduced or not.

mm/mempolicy.c:2280:15: error: redefinition of folio_alloc_mpol_noprof'

obj-$(CONFIG_NUMA) 	+= mempolicy.o

include/linux/gfp.h:324:29: note: previous definition of 
'folio_alloc_mpol_noprof'

but this one is under !CONFIG_NUMA, and from above config, CONFIG_NUMA
is enabled, so this should be impossible.
