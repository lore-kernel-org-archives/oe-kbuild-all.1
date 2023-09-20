Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3201A49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 01:36:48 +0000 (UTC)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rr1Jr55smzVjdt;
	Wed, 20 Sep 2023 09:33:48 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 20 Sep 2023 09:36:45 +0800
Subject: Re: [PATCH] arch_topology: Support SMT control on arm64
To: kernel test robot <lkp@intel.com>, Yicong Yang <yangyicong@huawei.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yangyicong@hisilicon.com>,
	<linux-kernel@vger.kernel.org>
References: <20230919123319.23785-1-yangyicong@huawei.com>
 <202309200727.CtYl75aH-lkp@intel.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <f181a417-4f5c-07c5-7f6a-e236717b84d1@huawei.com>
Date: Wed, 20 Sep 2023 09:36:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202309200727.CtYl75aH-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected

On 2023/9/20 7:30, kernel test robot wrote:
> Hi Yicong,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.6-rc2 next-20230919]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-SMT-control-on-arm64/20230919-223458
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20230919123319.23785-1-yangyicong%40huawei.com
> patch subject: [PATCH] arch_topology: Support SMT control on arm64
> config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230920/202309200727.CtYl75aH-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200727.CtYl75aH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309200727.CtYl75aH-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/cpu.c: In function 'cpuhp_get_primary_thread_mask':
>    kernel/cpu.c:660:16: error: 'cpu_primary_thread_mask' undeclared (first use in this function); did you mean 'cpuhp_get_primary_thread_mask'?
>      660 |         return cpu_primary_thread_mask;
>          |                ^~~~~~~~~~~~~~~~~~~~~~~
>          |                cpuhp_get_primary_thread_mask

cpu_primary_thread_mask is used for CONFIG_HOTPLUG_PARALLEL which is not enabled on arm64. Previous it has a dependency for
CONFIG_HOTPLUG_SMT but is later decoupled by 7a4dcb4a5de1 ("cpu/hotplug: Remove dependancy against cpu_primary_thread_mask")
which is merged after v6.6-rc1. Checked that arm64 branch doesn't contain this commit for now.

The patch builds well after v6.6-rc1.

>    kernel/cpu.c:660:16: note: each undeclared identifier is reported only once for each function it appears in
>    kernel/cpu.c: In function 'cpuhp_smt_disable':
>>> kernel/cpu.c:2629:23: error: implicit declaration of function 'cpu_down_maps_locked' [-Werror=implicit-function-declaration]
>     2629 |                 ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
>          |                       ^~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +/cpu_down_maps_locked +2629 kernel/cpu.c
> 
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2620  
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2621  int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2622  {
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2623  	int cpu, ret = 0;
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2624  
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2625  	cpu_maps_update_begin();
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2626  	for_each_online_cpu(cpu) {
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2627  		if (topology_is_primary_thread(cpu))
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2628  			continue;
> dc8d37ed304eee Arnd Bergmann 2019-12-10 @2629  		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2630  		if (ret)
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2631  			break;
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2632  		/*
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2633  		 * As this needs to hold the cpu maps lock it's impossible
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2634  		 * to call device_offline() because that ends up calling
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2635  		 * cpu_down() which takes cpu maps lock. cpu maps lock
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2636  		 * needs to be held as this might race against in kernel
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2637  		 * abusers of the hotplug machinery (thermal management).
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2638  		 *
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2639  		 * So nothing would update device:offline state. That would
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2640  		 * leave the sysfs entry stale and prevent onlining after
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2641  		 * smt control has been changed to 'off' again. This is
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2642  		 * called under the sysfs hotplug lock, so it is properly
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2643  		 * serialized against the regular offline usage.
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2644  		 */
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2645  		cpuhp_offline_cpu_device(cpu);
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2646  	}
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2647  	if (!ret)
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2648  		cpu_smt_control = ctrlval;
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2649  	cpu_maps_update_done();
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2650  	return ret;
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2651  }
> dc8d37ed304eee Arnd Bergmann 2019-12-10  2652  
> 
