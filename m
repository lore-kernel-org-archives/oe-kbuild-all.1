Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9836965EB1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 14:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlpKYcdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701786442; x=1733322442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o6PR/KDTdOQe4s6XsXXP30X/LSXNLm8Dng4KViM6Y5s=;
  b=mlpKYcdfy+Esr1VSTnzGC2/aP1TbNNud6hzjbNRGX4qIwa1wDRyW5bBY
   mfPEUsG06DuaTAebLL4fwjow2890Rn/n8IJthK1f3nEznP1cE2AjYLFaV
   uxMQ3MpnhBJalLsn3UOShW8mvLc38CsH7GoNRS/7Lqabrba3fua/Bnjhf
   fKXgIrrGK3F7nEulAaXcTFdQu1k4IaEkR7ZTK5DH8NLVTjX01UzW+KXq2
   AT/mA1vdxY3x9r02cRjoXiqsEfT97Otaddbliuhh76bfWI0IdjXrTznIA
   wN8fWquZnWMRKe37GDlHzfoLl5XA33ruZ8yR7sgwgKMXq+lBeu8lX5yYD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7199631"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7199631"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764341790"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="764341790"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 06:27:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAWOL-0009AG-2L;
	Tue, 05 Dec 2023 14:27:17 +0000
Date: Tue, 5 Dec 2023 22:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] pm_qos: Rename freq to interval constraint
Message-ID: <202312052205.smINapGy-lkp@intel.com>
References: <20231201190757.144741-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201190757.144741-1-daniel.lezcano@linaro.org>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/acpi-bus rafael-pm/thermal linus/master rafael-pm/devprop v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/PM-QoS-Add-a-performance-QoS/20231202-031119
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231201190757.144741-1-daniel.lezcano%40linaro.org
patch subject: [RFC PATCH 1/2] pm_qos: Rename freq to interval constraint
config: i386-buildonly-randconfig-001-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052205.smINapGy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052205.smINapGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052205.smINapGy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cpufreq/intel_pstate.c:45:
   include/acpi/processor.h:240:33: error: field 'perflib_req' has incomplete type
     240 |         struct freq_qos_request perflib_req;
         |                                 ^~~~~~~~~~~
   include/acpi/processor.h:241:33: error: field 'thermal_req' has incomplete type
     241 |         struct freq_qos_request thermal_req;
         |                                 ^~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:1323:37: warning: 'enum freq_qos_req_type' declared inside parameter list will not be visible outside of this definition or declaration
    1323 | static void update_qos_request(enum freq_qos_req_type type)
         |                                     ^~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:1323:55: error: parameter 1 ('type') has incomplete type
    1323 | static void update_qos_request(enum freq_qos_req_type type)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/cpufreq/intel_pstate.c:1323:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
    1323 | static void update_qos_request(enum freq_qos_req_type type)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c: In function 'update_qos_request':
   drivers/cpufreq/intel_pstate.c:1349:28: error: increment of pointer to an incomplete type 'struct freq_qos_request'
    1349 |                         req++;
         |                            ^~
   drivers/cpufreq/intel_pstate.c:1355:45: error: passing argument 1 of 'freq_qos_update_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1355 |                 if (freq_qos_update_request(req, freq) < 0)
         |                                             ^~~
         |                                             |
         |                                             struct freq_qos_request *
   In file included from include/linux/cpufreq.h:19,
                    from drivers/cpufreq/intel_pstate.c:21:
   include/linux/pm_qos.h:308:58: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     308 | int freq_qos_update_request(struct interval_qos_request *req, s32 new_value);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/cpufreq/intel_pstate.c: In function 'intel_cpufreq_cpu_init':
>> drivers/cpufreq/intel_pstate.c:3004:32: error: invalid application of 'sizeof' to incomplete type 'struct freq_qos_request'
    3004 |         req = kcalloc(2, sizeof(*req), GFP_KERNEL);
         |                                ^
   drivers/cpufreq/intel_pstate.c:3029:58: error: passing argument 2 of 'freq_qos_add_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3029 |         ret = freq_qos_add_request(&policy->constraints, req, FREQ_QOS_MIN,
         |                                                          ^~~
         |                                                          |
         |                                                          struct freq_qos_request *
   include/linux/pm_qos.h:306:55: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     306 |                          struct interval_qos_request *req,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/cpufreq/intel_pstate.c:3038:62: error: invalid use of undefined type 'struct freq_qos_request'
    3038 |         ret = freq_qos_add_request(&policy->constraints, req + 1, FREQ_QOS_MAX,
         |                                                              ^
   drivers/cpufreq/intel_pstate.c:3038:62: error: passing argument 2 of 'freq_qos_add_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3038 |         ret = freq_qos_add_request(&policy->constraints, req + 1, FREQ_QOS_MAX,
         |                                                          ~~~~^~~
         |                                                              |
         |                                                              struct freq_qos_request *
   include/linux/pm_qos.h:306:55: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     306 |                          struct interval_qos_request *req,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/cpufreq/intel_pstate.c:3050:33: error: passing argument 1 of 'freq_qos_remove_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3050 |         freq_qos_remove_request(req);
         |                                 ^~~
         |                                 |
         |                                 struct freq_qos_request *
   include/linux/pm_qos.h:309:58: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     309 | int freq_qos_remove_request(struct interval_qos_request *req);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/cpufreq/intel_pstate.c: In function 'intel_cpufreq_cpu_exit':
   drivers/cpufreq/intel_pstate.c:3065:37: error: invalid use of undefined type 'struct freq_qos_request'
    3065 |         freq_qos_remove_request(req + 1);
         |                                     ^
   drivers/cpufreq/intel_pstate.c:3065:37: error: passing argument 1 of 'freq_qos_remove_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3065 |         freq_qos_remove_request(req + 1);
         |                                 ~~~~^~~
         |                                     |
         |                                     struct freq_qos_request *
   include/linux/pm_qos.h:309:58: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     309 | int freq_qos_remove_request(struct interval_qos_request *req);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/cpufreq/intel_pstate.c:3066:33: error: passing argument 1 of 'freq_qos_remove_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3066 |         freq_qos_remove_request(req);
         |                                 ^~~
         |                                 |
         |                                 struct freq_qos_request *
   include/linux/pm_qos.h:309:58: note: expected 'struct interval_qos_request *' but argument is of type 'struct freq_qos_request *'
     309 | int freq_qos_remove_request(struct interval_qos_request *req);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +3004 drivers/cpufreq/intel_pstate.c

a365ab6b9dfbaf8 Rafael J. Wysocki 2020-12-14  2984  
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2985  static int intel_cpufreq_cpu_init(struct cpufreq_policy *policy)
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2986  {
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  2987  	struct freq_qos_request *req;
da5c504c7aae96d Viresh Kumar      2019-08-09  2988  	struct cpudata *cpu;
da5c504c7aae96d Viresh Kumar      2019-08-09  2989  	struct device *dev;
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  2990  	int ret, freq;
da5c504c7aae96d Viresh Kumar      2019-08-09  2991  
da5c504c7aae96d Viresh Kumar      2019-08-09  2992  	dev = get_cpu_device(policy->cpu);
da5c504c7aae96d Viresh Kumar      2019-08-09  2993  	if (!dev)
da5c504c7aae96d Viresh Kumar      2019-08-09  2994  		return -ENODEV;
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2995  
da5c504c7aae96d Viresh Kumar      2019-08-09  2996  	ret = __intel_pstate_cpu_init(policy);
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2997  	if (ret)
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2998  		return ret;
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  2999  
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  3000  	policy->cpuinfo.transition_latency = INTEL_CPUFREQ_TRANSITION_LATENCY;
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  3001  	/* This reflects the intel_pstate_get_cpu_pstates() setting. */
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  3002  	policy->cur = policy->cpuinfo.min_freq;
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  3003  
da5c504c7aae96d Viresh Kumar      2019-08-09 @3004  	req = kcalloc(2, sizeof(*req), GFP_KERNEL);
da5c504c7aae96d Viresh Kumar      2019-08-09  3005  	if (!req) {
da5c504c7aae96d Viresh Kumar      2019-08-09  3006  		ret = -ENOMEM;
da5c504c7aae96d Viresh Kumar      2019-08-09  3007  		goto pstate_exit;
da5c504c7aae96d Viresh Kumar      2019-08-09  3008  	}
da5c504c7aae96d Viresh Kumar      2019-08-09  3009  
da5c504c7aae96d Viresh Kumar      2019-08-09  3010  	cpu = all_cpu_data[policy->cpu];
da5c504c7aae96d Viresh Kumar      2019-08-09  3011  
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3012  	if (hwp_active) {
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3013  		u64 value;
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3014  
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3015  		policy->transition_delay_us = INTEL_CPUFREQ_TRANSITION_DELAY_HWP;
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3016  
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3017  		intel_pstate_get_hwp_cap(cpu);
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3018  
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3019  		rdmsrl_on_cpu(cpu->cpu, MSR_HWP_REQUEST, &value);
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3020  		WRITE_ONCE(cpu->hwp_req_cached, value);
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3021  
c27a0ccc3c715c5 Rafael J. Wysocki 2020-08-27  3022  		cpu->epp_cached = intel_pstate_get_epp(cpu, value);
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3023  	} else {
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3024  		policy->transition_delay_us = INTEL_CPUFREQ_TRANSITION_DELAY;
f6ebbcf08f37b01 Rafael J. Wysocki 2020-08-06  3025  	}
da5c504c7aae96d Viresh Kumar      2019-08-09  3026  
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3027  	freq = DIV_ROUND_UP(cpu->pstate.turbo_freq * global.min_perf_pct, 100);
da5c504c7aae96d Viresh Kumar      2019-08-09  3028  
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  3029  	ret = freq_qos_add_request(&policy->constraints, req, FREQ_QOS_MIN,
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3030  				   freq);
da5c504c7aae96d Viresh Kumar      2019-08-09  3031  	if (ret < 0) {
da5c504c7aae96d Viresh Kumar      2019-08-09  3032  		dev_err(dev, "Failed to add min-freq constraint (%d)\n", ret);
da5c504c7aae96d Viresh Kumar      2019-08-09  3033  		goto free_req;
da5c504c7aae96d Viresh Kumar      2019-08-09  3034  	}
da5c504c7aae96d Viresh Kumar      2019-08-09  3035  
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3036  	freq = DIV_ROUND_UP(cpu->pstate.turbo_freq * global.max_perf_pct, 100);
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3037  
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  3038  	ret = freq_qos_add_request(&policy->constraints, req + 1, FREQ_QOS_MAX,
de5bcf404acee62 Rafael J. Wysocki 2021-03-16  3039  				   freq);
da5c504c7aae96d Viresh Kumar      2019-08-09  3040  	if (ret < 0) {
da5c504c7aae96d Viresh Kumar      2019-08-09  3041  		dev_err(dev, "Failed to add max-freq constraint (%d)\n", ret);
da5c504c7aae96d Viresh Kumar      2019-08-09  3042  		goto remove_min_req;
da5c504c7aae96d Viresh Kumar      2019-08-09  3043  	}
da5c504c7aae96d Viresh Kumar      2019-08-09  3044  
da5c504c7aae96d Viresh Kumar      2019-08-09  3045  	policy->driver_data = req;
da5c504c7aae96d Viresh Kumar      2019-08-09  3046  
001c76f05b01cc8 Rafael J. Wysocki 2016-11-17  3047  	return 0;
da5c504c7aae96d Viresh Kumar      2019-08-09  3048  
da5c504c7aae96d Viresh Kumar      2019-08-09  3049  remove_min_req:
3000ce3c52f8b8d Rafael J. Wysocki 2019-10-16  3050  	freq_qos_remove_request(req);
da5c504c7aae96d Viresh Kumar      2019-08-09  3051  free_req:
da5c504c7aae96d Viresh Kumar      2019-08-09  3052  	kfree(req);
da5c504c7aae96d Viresh Kumar      2019-08-09  3053  pstate_exit:
da5c504c7aae96d Viresh Kumar      2019-08-09  3054  	intel_pstate_exit_perf_limits(policy);
da5c504c7aae96d Viresh Kumar      2019-08-09  3055  
da5c504c7aae96d Viresh Kumar      2019-08-09  3056  	return ret;
da5c504c7aae96d Viresh Kumar      2019-08-09  3057  }
da5c504c7aae96d Viresh Kumar      2019-08-09  3058  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
