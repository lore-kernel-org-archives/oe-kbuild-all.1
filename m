Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05528313D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757158059; cv=none; b=NZ3Q+cSalgCnwLn4TRu6EC7+XLpgrwbGPl61tXmRQz5VSwGJcR7qX+FnHcILVNdHRDpsmjFJRkSl9clWSDjQtOkD58CneU9x2umFbbqgkQdRq4rQKUh8c/v81ZH+burONekCbxIJeEwXL9f9L8nY0SmHhA+bmTvcF3A424SLB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757158059; c=relaxed/simple;
	bh=nNyyxz5teSsZVy98bopezwuTf+YuNuxAAoFh+juTuE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9+OAxNudu4JYRV+oFaD4xht7cU/Adeb54OU9yZFmTB42lk5xDJ0NPX64hjAKFCDIDhxI7unyTFYXnVb4DnVQiJ0wFjNdjl2lF9J0y+0vIgFgFbaeu2Yj088S2w4pv+B6Sgz6wNeZcExuRD+o+oC3LWynHn0NHPsO2H6UBlx2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBIswp9r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBIswp9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757158057; x=1788694057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nNyyxz5teSsZVy98bopezwuTf+YuNuxAAoFh+juTuE0=;
  b=cBIswp9rnL8VPUwuSPvOrkmwKDHrwYarkPgGqjpeWkaJOo8G+MLJQ7/u
   i+4icHSEv4It7PraUMiOWaMGMQYzhsUX7esVZ/yGdSY92G9kYY2ioNXDW
   m0ayIkpAdYeJ4r2XCLXrVcgVr/uXfo0AKCmd7WgekVZfxaQKW4QiosmMB
   Q0pfbzTyxHb5wobzWoxzknbX+bdI8n4AJqMn1k+35U7+2MXhyEG9nicSX
   WSzFggjoInz/E5Zyho69yMlVr+u8HGbAgNtym5KPGiUyW8bo6icD/7F7m
   /uAiyo3pIyTad2tpWYfHsKDOJuaOEac8zDD47Rvlb2aNH9/l8lKxCzEKd
   g==;
X-CSE-ConnectionGUID: 3kA7UfE/Tse/4ChjLtGZnA==
X-CSE-MsgGUID: /nEfPbLBSxil8PwOWMDbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58525545"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58525545"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:27:37 -0700
X-CSE-ConnectionGUID: Lu/Ds58qQh6MbyY54Dg1mA==
X-CSE-MsgGUID: 31zn5WzDQsC/K+BFuq9usg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="177626332"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2025 04:27:30 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uur4p-0001O5-1B;
	Sat, 06 Sep 2025 11:27:27 +0000
Date: Sat, 6 Sep 2025 19:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>,
	"Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v5 4/6] PM / devfreq: Use scope-based cleanup helper
Message-ID: <202509061926.9xYK0G2k-lkp@intel.com>
References: <20250905132413.1376220-5-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905132413.1376220-5-zhangzihuan@kylinos.cn>

Hi Zihuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master chanwoo/devfreq-testing v6.17-rc4 next-20250905]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/arm64-topology-Use-scope-based-cleanup-helper/20250905-212630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250905132413.1376220-5-zhangzihuan%40kylinos.cn
patch subject: [PATCH v5 4/6] PM / devfreq: Use scope-based cleanup helper
config: arc-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061926.9xYK0G2k-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061926.9xYK0G2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061926.9xYK0G2k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/devfreq/governor_passive.c: In function 'cpufreq_passive_register_notifier':
>> drivers/devfreq/governor_passive.c:308:61: warning: value computed is not used [-Wunused-value]
     308 |                 list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
>> drivers/devfreq/governor_passive.c:308:31: error: lvalue required as unary '&' operand
     308 |                 list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
         |                               ^
>> drivers/devfreq/governor_passive.c:309:48: error: expected ')' before ';' token
     309 |                         &p_data->cpu_data_list);
         |                                                ^
         |                                                )
   drivers/devfreq/governor_passive.c:308:30: note: to match this '('
     308 |                 list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
         |                              ^
>> drivers/devfreq/governor_passive.c:308:17: error: too few arguments to function 'list_add_tail'
     308 |                 list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
         |                 ^~~~~~~~~~~~~
   In file included from include/linux/module.h:12,
                    from drivers/devfreq/governor_passive.c:10:
   include/linux/list.h:181:20: note: declared here
     181 | static inline void list_add_tail(struct list_head *new, struct list_head *head)
         |                    ^~~~~~~~~~~~~
>> drivers/devfreq/governor_passive.c:309:49: error: expected ';' before '}' token
     309 |                         &p_data->cpu_data_list);
         |                                                 ^
         |                                                 ;
     310 |         }
         |         ~                                        
>> drivers/devfreq/governor_passive.c:267:17: error: label 'err' used but not defined
     267 |                 goto err;
         |                 ^~~~


vim +308 drivers/devfreq/governor_passive.c

   248	
   249	static int cpufreq_passive_register_notifier(struct devfreq *devfreq)
   250	{
   251		struct devfreq_passive_data *p_data
   252				= (struct devfreq_passive_data *)devfreq->data;
   253		struct device *dev = devfreq->dev.parent;
   254		struct opp_table *opp_table = NULL;
   255		struct device *cpu_dev;
   256		unsigned int cpu;
   257		int ret;
   258	
   259		p_data->cpu_data_list
   260			= (struct list_head)LIST_HEAD_INIT(p_data->cpu_data_list);
   261	
   262		p_data->nb.notifier_call = cpufreq_passive_notifier_call;
   263		ret = cpufreq_register_notifier(&p_data->nb, CPUFREQ_TRANSITION_NOTIFIER);
   264		if (ret) {
   265			dev_err(dev, "failed to register cpufreq notifier\n");
   266			p_data->nb.notifier_call = NULL;
 > 267			goto err;
   268		}
   269	
   270		for_each_possible_cpu(cpu) {
   271			struct cpufreq_policy *policy __free(put_cpufreq_policy) =
   272				cpufreq_cpu_get(cpu);
   273	
   274			if (!policy)
   275				return -EPROBE_DEFER;
   276	
   277			struct devfreq_cpu_data *initial_parent_cpu_data =
   278				get_parent_cpu_data(p_data, policy);
   279	
   280			if (initial_parent_cpu_data)
   281				continue;
   282	
   283			struct devfreq_cpu_data *parent_cpu_data __free(kfree) =
   284				kzalloc(sizeof(*parent_cpu_data), GFP_KERNEL);
   285	
   286			if (!parent_cpu_data)
   287				return -ENOMEM;
   288	
   289			cpu_dev = get_cpu_device(cpu);
   290			if (!cpu_dev) {
   291				dev_err(dev, "failed to get cpu device\n");
   292				return -ENODEV;
   293			}
   294	
   295			opp_table = dev_pm_opp_get_opp_table(cpu_dev);
   296			if (IS_ERR(opp_table)) {
   297				dev_err(dev, "failed to get opp_table of cpu%d\n", cpu);
   298				return PTR_ERR(opp_table);
   299			}
   300	
   301			parent_cpu_data->dev = cpu_dev;
   302			parent_cpu_data->opp_table = opp_table;
   303			parent_cpu_data->first_cpu = cpumask_first(policy->related_cpus);
   304			parent_cpu_data->cur_freq = policy->cur;
   305			parent_cpu_data->min_freq = policy->cpuinfo.min_freq;
   306			parent_cpu_data->max_freq = policy->cpuinfo.max_freq;
   307	
 > 308			list_add_tail(&(no_free_ptr(parent_cpu_data)->node,
 > 309				&p_data->cpu_data_list);
   310		}
   311	
   312		mutex_lock(&devfreq->lock);
   313		ret = devfreq_update_target(devfreq, 0L);
   314		mutex_unlock(&devfreq->lock);
   315		if (ret)
   316			dev_err(dev, "failed to update the frequency\n");
   317	
   318		return ret;
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
