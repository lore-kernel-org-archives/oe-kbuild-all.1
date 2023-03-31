Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5877410E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 01:24:37 +0000 (UTC)
Received: from dggpemm500013.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Pnhsw2xg0z17Rjl;
	Fri, 31 Mar 2023 09:05:24 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 31 Mar
 2023 09:08:41 +0800
Message-ID: <c3ad2c5e-4368-aaec-6d69-ed24228f8ad2@huawei.com>
Date: Fri, 31 Mar 2023 09:08:41 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] wchan: Fix get_wchan() when task in schedule
To: kernel test robot <lkp@intel.com>, <linux-kernel@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<bristot@redhat.com>, <vschneid@redhat.com>, <rmk+kernel@armlinux.org.uk>,
	<geert@linux-m68k.org>, <keescook@chromium.org>
References: <20230330121238.176534-1-chenzhongjin@huawei.com>
 <202303302125.7Ku9P7v5-lkp@intel.com>
Content-Language: en-US
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <202303302125.7Ku9P7v5-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected

It seems because of !CONFIG_SMP. I'll push a new version.

On 2023/3/30 21:53, kernel test robot wrote:
> Hi Chen,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on linus/master v6.3-rc4 next-20230330]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Zhongjin/wchan-Fix-get_wchan-when-task-in-schedule/20230330-201555
> patch link:    https://lore.kernel.org/r/20230330121238.176534-1-chenzhongjin%40huawei.com
> patch subject: [PATCH] wchan: Fix get_wchan() when task in schedule
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303302125.7Ku9P7v5-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/d5fd727a071ab3c2241f858e77c2ae5bb3cec6f3
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Chen-Zhongjin/wchan-Fix-get_wchan-when-task-in-schedule/20230330-201555
>          git checkout d5fd727a071ab3c2241f858e77c2ae5bb3cec6f3
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303302125.7Ku9P7v5-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     kernel/sched/core.c: In function 'get_wchan':
>>> kernel/sched/core.c:2060:28: error: 'struct task_struct' has no member named 'on_cpu'
>      2060 |             !p->on_rq && !p->on_cpu)
>           |                            ^~
>
>
> vim +2060 kernel/sched/core.c
>
>    2046	
>    2047	unsigned long get_wchan(struct task_struct *p)
>    2048	{
>    2049		unsigned long ip = 0;
>    2050		unsigned int state;
>    2051	
>    2052		if (!p || p == current)
>    2053			return 0;
>    2054	
>    2055		/* Only get wchan if task is blocked and we can keep it that way. */
>    2056		raw_spin_lock_irq(&p->pi_lock);
>    2057		state = READ_ONCE(p->__state);
>    2058		smp_rmb(); /* see try_to_wake_up() */
>    2059		if (state != TASK_RUNNING && state != TASK_WAKING &&
>> 2060		    !p->on_rq && !p->on_cpu)
>    2061			ip = __get_wchan(p);
>    2062		raw_spin_unlock_irq(&p->pi_lock);
>    2063	
>    2064		return ip;
>    2065	}
>    2066	
>
