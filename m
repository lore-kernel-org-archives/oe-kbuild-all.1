Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AE07F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 02:10:11 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QwjLw2xyvzLnhJ
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 09:51:36 +0800 (CST)
Received: from [10.174.151.185] (10.174.151.185) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 09:53:48 +0800
Subject: Re: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for
 memory_failure()
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <20230704121948.1331846-1-linmiaohe@huawei.com>
 <202307050025.piXqvNt6-lkp@intel.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <08b46d38-bf3d-a4b5-b920-797a5fe5aa4a@huawei.com>
Date: Wed, 5 Jul 2023 09:53:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202307050025.piXqvNt6-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.151.185]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected

On 2023/7/5 0:23, kernel test robot wrote:
> Hi Miaohe,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Miaohe-Lin/mm-memory-failure-add-missing-set_mce_nospec-for-memory_failure/20230704-202035
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20230704121948.1331846-1-linmiaohe%40huawei.com
> patch subject: [RFC PATCH] mm: memory-failure: add missing set_mce_nospec() for memory_failure()
> config: arm64-randconfig-r021-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050025.piXqvNt6-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050025.piXqvNt6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307050025.piXqvNt6-lkp@intel.com/

Thanks for reporting. This leads to problem too when I compiled the kernel and it's fixed in my workload but I forgot to post that change to the patch. Sorry for my careless.

	mm/memory-failure.c: In function ‘memory_failure_work_func’:
	mm/memory-failure.c:2412:9: error: suggest parentheses around operand of ‘!’ or change ‘&’ to ‘&&’ or ‘!’ to ‘~’ [-Werror=parentheses]
	 2412 |     if (!entry.flags & MF_SW_SIMULATED)
	      |         ^~~~~~~~~~~~

