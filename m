Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2705C1FA4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 03:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SYXt80gPNz1P8bg;
	Mon, 20 Nov 2023 11:24:16 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 20 Nov 2023 11:27:41 +0800
CC: <yangyicong@hisilicon.com>, <oe-kbuild-all@lists.linux.dev>,
	<dietmar.eggemann@arm.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
To: kernel test robot <yujie.liu@intel.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <202311151900.K9xc6Xqz-lkp@intel.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <d2454857-009c-ffd3-26fa-a77853f5622d@huawei.com>
Date: Mon, 20 Nov 2023 11:27:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311151900.K9xc6Xqz-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected

On 2023/11/16 12:59, kernel test robot wrote:
> Hi Yicong,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus arm/for-next kvmarm/next soc/for-next linus/master arm/fixes v6.7-rc1 next-20231115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yicong-Yang/arch_topology-Support-basic-SMT-control-for-the-driver/20231114-120544
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20231114040110.54590-5-yangyicong%40huawei.com
> patch subject: [PATCH v3 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
> config: arm64-randconfig-002-20231115 (https://download.01.org/0day-ci/archive/20231115/202311151900.K9xc6Xqz-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311151900.K9xc6Xqz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202311151900.K9xc6Xqz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/cpu.c: In function 'cpuhp_smt_disable':
>>> kernel/cpu.c:2687:23: error: implicit declaration of function 'cpu_down_maps_locked' [-Werror=implicit-function-declaration]
>     2687 |                 ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
>          |                       ^~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 

cpu_down_maps_locked() is introduced by CONFIG_HOTPLUG_CPU, so CONFIG_HOTPLUG_SMT will need to depend
on CONFIG_HOTPLUG_CPU. Will add it.

> 
> vim +/cpu_down_maps_locked +2687 kernel/cpu.c
> 
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2672  
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2673  int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2674  {
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2675  	int cpu, ret = 0;
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2676  
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2677  	cpu_maps_update_begin();
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2678  	for_each_online_cpu(cpu) {
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2679  		if (topology_is_primary_thread(cpu))
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2680  			continue;
> 38253464bc821d Michael Ellerman 2023-07-05  2681  		/*
> 38253464bc821d Michael Ellerman 2023-07-05  2682  		 * Disable can be called with CPU_SMT_ENABLED when changing
> 38253464bc821d Michael Ellerman 2023-07-05  2683  		 * from a higher to lower number of SMT threads per core.
> 38253464bc821d Michael Ellerman 2023-07-05  2684  		 */
> 38253464bc821d Michael Ellerman 2023-07-05  2685  		if (ctrlval == CPU_SMT_ENABLED && cpu_smt_thread_allowed(cpu))
> 38253464bc821d Michael Ellerman 2023-07-05  2686  			continue;
> dc8d37ed304eee Arnd Bergmann    2019-12-10 @2687  		ret = cpu_down_maps_locked(cpu, CPUHP_OFFLINE);
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2688  		if (ret)
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2689  			break;
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2690  		/*
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2691  		 * As this needs to hold the cpu maps lock it's impossible
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2692  		 * to call device_offline() because that ends up calling
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2693  		 * cpu_down() which takes cpu maps lock. cpu maps lock
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2694  		 * needs to be held as this might race against in kernel
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2695  		 * abusers of the hotplug machinery (thermal management).
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2696  		 *
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2697  		 * So nothing would update device:offline state. That would
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2698  		 * leave the sysfs entry stale and prevent onlining after
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2699  		 * smt control has been changed to 'off' again. This is
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2700  		 * called under the sysfs hotplug lock, so it is properly
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2701  		 * serialized against the regular offline usage.
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2702  		 */
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2703  		cpuhp_offline_cpu_device(cpu);
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2704  	}
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2705  	if (!ret)
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2706  		cpu_smt_control = ctrlval;
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2707  	cpu_maps_update_done();
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2708  	return ret;
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2709  }
> dc8d37ed304eee Arnd Bergmann    2019-12-10  2710  
> 
