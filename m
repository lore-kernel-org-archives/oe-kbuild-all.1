Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B2256D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 09:29:55 +0000 (UTC)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N9kXg61sPzHw3N
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 17:29:23 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:29:52 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:29:52 +0800
Subject: Re: [PATCH v7 5/6] doc: Document CONFIG_RCU_CPU_STALL_CPUTIME=y stall
 information
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <20221111130709.247-6-thunder.leizhen@huawei.com>
 <202211130627.0qfD08wi-lkp@intel.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <90d7154b-04d7-4423-e07e-8829eb6cd630@huawei.com>
Date: Mon, 14 Nov 2022 17:29:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211130627.0qfD08wi-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected



On 2022/11/13 6:52, kernel test robot wrote:
> Hi Zhen,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on paulmck-rcu/dev]
> [also build test WARNING on tip/sched/core linus/master v6.1-rc4 next-20221111]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Zhen-Lei/rcu-Add-RCU-stall-diagnosis-information/20221111-211035
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
> patch link:    https://lore.kernel.org/r/20221111130709.247-6-thunder.leizhen%40huawei.com
> patch subject: [PATCH v7 5/6] doc: Document CONFIG_RCU_CPU_STALL_CPUTIME=y stall information
> reproduce:
>         # https://github.com/intel-lab-lkp/linux/commit/062a824ff2c71185d19ff8d39fef18fda82e474f
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Zhen-Lei/rcu-Add-RCU-stall-diagnosis-information/20221111-211035
>         git checkout 062a824ff2c71185d19ff8d39fef18fda82e474f
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/RCU/stallwarn.rst:415: WARNING: Undefined substitution referenced: "<------------first timeout---------->|<-----second timeout----->".
>>> Documentation/RCU/stallwarn.rst:415: WARNING: Undefined substitution referenced: "<--half timeout-->|<--half timeout-->".
>>> Documentation/RCU/stallwarn.rst:415: WARNING: Undefined substitution referenced: "<--first period-->".
>>> Documentation/RCU/stallwarn.rst:415: WARNING: Undefined substitution referenced: "<-----------second sampling period---------->".

Well, thanks. Replacing '|' with ":' solves the problem. Fortunately, they look alike.

> 
> vim +415 Documentation/RCU/stallwarn.rst
> 
>    414	
>  > 415	The sampling period is shown as follows:
>    416	|<------------first timeout---------->|<-----second timeout----->|
>    417	|<--half timeout-->|<--half timeout-->|                          |
>    418	|                  |<--first period-->|                          |
>    419	|                  |<-----------second sampling period---------->|
>    420	|                  |                  |                          |
>    421	|          sampling time point    1st-stall                  2nd-stall
>    422	
>    423	
> 

-- 
Regards,
  Zhen Lei
