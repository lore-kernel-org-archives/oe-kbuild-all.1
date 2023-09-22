Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304F9168AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695386601; x=1726922601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97cV5qFPzKwBDHpG8DBE1AVeQRPgIv4n1CK1toPCQr8=;
  b=XWK1gH7awBJJQZ/fBYv0sZ6y51hLAdht/NOi0T5ns0HkHR0ImLHletq2
   z3CqyMNSukOMWtV65V1T4l6+sBZoTulyaKOqoZqoG9NB/lAG4HDOS3IZF
   Mj8BpjsahdVmrN/QBk/SCYay11wp6V7I5WlmOnBaHXdoN/CPf4TQStwb5
   9eUEo2Z9kazhlrEgquSiSN+Vl4IooiRwb17iweSwYd3g8O5K44JaQCWWc
   ZEKPxxVmQMFkQbzmRI6wGzTbnntfjhimeosGpMP/JyAEUPjN4u6g800j1
   GlaRSruiHIFM4dsl++PurJoukOW3WIlvQ1os22Q+mYndTAAj+TAerN9z9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="444913833"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="444913833"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 05:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741088557"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741088557"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 22 Sep 2023 05:43:19 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjfV7-0000iX-23;
	Fri, 22 Sep 2023 12:43:17 +0000
Date: Fri, 22 Sep 2023 20:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup
 controller
Message-ID: <202309222015.R8wLQyHs-lkp@intel.com>
References: <20230922112846.4265-5-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922112846.4265-5-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Fix-missed-rcu-read-lock-in-bpf_task_under_cgroup/20230922-193148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230922112846.4265-5-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 4/8] bpf: Add new kfuncs support for cgroup controller
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309222015.R8wLQyHs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222015.R8wLQyHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309222015.R8wLQyHs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2254: warning: expecting prototype for bpf_cgroup_id_from_task_within_controller(). Prototype was for bpf_cgroup_ancestor_id_from_task_within_controller() instead


vim +2254 kernel/bpf/helpers.c

  2244	
  2245	/**
  2246	 * bpf_cgroup_id_from_task_within_controller - To get the associated cgroup_id from
  2247	 * a task within a specific cgroup controller.
  2248	 * @task: The target task
  2249	 * @ssid: The id of cgroup subsystem, e.g. cpu_cgrp_id, memory_cgrp_id and etc.
  2250	 * @level: The level of ancestor to look up
  2251	 */
  2252	__bpf_kfunc u64 bpf_cgroup_ancestor_id_from_task_within_controller(struct task_struct *task,
  2253									   int ssid, int level)
> 2254	{
  2255		struct cgroup *cgrp, *ancestor;
  2256		int id = 0;
  2257	
  2258		rcu_read_lock();
  2259		cgrp = task_cgroup(task, ssid);
  2260		if (!cgrp)
  2261			goto out;
  2262		ancestor = cgroup_ancestor(cgrp, level);
  2263		if (ancestor)
  2264			id = cgroup_id(ancestor);
  2265	
  2266	out:
  2267		rcu_read_unlock();
  2268		return id;
  2269	}
  2270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
