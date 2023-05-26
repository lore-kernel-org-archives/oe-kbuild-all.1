Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0C156C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 12:00:09 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QSNKJ47RvzTkSH;
	Fri, 26 May 2023 19:40:52 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 19:40:54 +0800
Message-ID: <847b9b8a-d9d5-3ee9-41f3-1171a4f73434@huawei.com>
Date: Fri, 26 May 2023 19:40:54 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH -next] memblock: unify memblock dump and debugfs show
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Mike Rapoport <rppt@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <tsahu@linux.ibm.com>,
	<anshuman.khandual@arm.com>, <ssawgyw@gmail.com>
References: <20230525115856.124507-1-wangkefeng.wang@huawei.com>
 <202305261822.ZFRYZVQk-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202305261822.ZFRYZVQk-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected



On 2023/5/26 19:09, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20230525]
> 
Thank, I will drop __initdata_memblock .

> 
> 
> vim +1910 mm/memblock.c
> 
>    1909	
>> 1910	static const char * const flagname[] __initdata_memblock = {
>    1911		[ilog2(MEMBLOCK_HOTPLUG)]		= "HOTPLUG",
>    1912		[ilog2(MEMBLOCK_MIRROR)]		= "MIRROR",
>    1913		[ilog2(MEMBLOCK_NOMAP)]			= "NOMAP",
>    1914		[ilog2(MEMBLOCK_DRIVER_MANAGED)]	= "DRV_MNG",
>    1915		[ilog2(MEMBLOCK_MAX_UNKNOWN)]		= "UNKNOWN",
>    1916	};
>    1917	
> 
