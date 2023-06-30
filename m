Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1ACED5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 00:55:25 +0000 (UTC)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QscL003GJzqTTn;
	Fri, 30 Jun 2023 08:55:04 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 08:55:22 +0800
Message-ID: <71073ef2-8646-7cdb-d301-af72b4997751@huawei.com>
Date: Fri, 30 Jun 2023 08:55:22 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] mm: make show_free_areas() static
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20230629104357.35455-2-wangkefeng.wang@huawei.com>
 <202306292240.Rj0DlHfI-lkp@intel.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <202306292240.Rj0DlHfI-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected

Thanks,

On 2023/6/29 23:00, kernel test robot wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-make-show_free_areas-static/20230629-182958
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20230629104357.35455-2-wangkefeng.wang%40huawei.com
> patch subject: [PATCH 2/2] mm: make show_free_areas() static
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230629/202306292240.Rj0DlHfI-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230629/202306292240.Rj0DlHfI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306292240.Rj0DlHfI-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     mm/nommu.c: In function 'do_mmap':
>>> mm/nommu.c:1239:9: error: implicit declaration of function 'show_free_areas' [-Werror=implicit-function-declaration]
>      1239 |         show_free_areas(0, NULL);
>           |         ^~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> 

Missing this one in patch-1, will update

> vim +/show_free_areas +1239 mm/nommu.c
> 
