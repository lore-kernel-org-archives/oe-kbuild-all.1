Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A232F46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIPi2TG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702327057; x=1733863057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJnpJHKK9Mk5DLrV4JJQqQEosL36t4IiTbDZR9+F8og=;
  b=lIPi2TG3eWwWxhDv0NzZz42+GzgAMhZna4Y66ddH6mEFQH73Gx60uBfG
   dORXQqG6ErNhsCcCxbbyZnomw9Sr+F8k4FHuPSGLcPYsCunLOhDxXjYKd
   1uCl+q9attvvJwzHxL3i7gIUPI/C1sB5NRegEqeOERusCwCvqJrWa4LS+
   aBPwIrFhVc0yOepBLjedWF5xjxIvxy42lioty8nvF5o/FMnP8p3QcAqHB
   CwTBMnfkkgtDKKlsBxChGNOTLmf6lbdyBQjdqezCb6pYWt2+0lROZsyhx
   tWwTRQUJc7dAHoUdo62ogmu+4W2lLzaOJE852HbXC7BKpR7MDY2/w4ufB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1576462"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1576462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 12:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="863935735"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="863935735"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Dec 2023 12:37:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCn1w-000ISl-30;
	Mon, 11 Dec 2023 20:37:32 +0000
Date: Tue, 12 Dec 2023 04:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 13/27] kernel/sched/rt.c:2868:12: warning:
 'sched_rt_handler' defined but not used
Message-ID: <202312120422.ERzqVrsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   5055c2d4ad6d33db237eadc3b3fd97d540b46173
commit: c7fe2f53ab846b8e16890ae9315f3cb511be363d [13/27] UPSTREAM: sched: Move rt_period/runtime sysctls to rt.c
config: i386-buildonly-randconfig-004-20231212 (https://download.01.org/0day-ci/archive/20231212/202312120422.ERzqVrsf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120422.ERzqVrsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120422.ERzqVrsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/rt.c:721:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     721 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:2868:12: warning: 'sched_rt_handler' defined but not used [-Wunused-function]
    2868 | static int sched_rt_handler(struct ctl_table *table, int write, void *buffer,
         |            ^~~~~~~~~~~~~~~~


vim +/sched_rt_handler +2868 kernel/sched/rt.c

  2867	
> 2868	static int sched_rt_handler(struct ctl_table *table, int write, void *buffer,
  2869			size_t *lenp, loff_t *ppos)
  2870	{
  2871		int old_period, old_runtime;
  2872		static DEFINE_MUTEX(mutex);
  2873		int ret;
  2874	
  2875		mutex_lock(&mutex);
  2876		old_period = sysctl_sched_rt_period;
  2877		old_runtime = sysctl_sched_rt_runtime;
  2878	
  2879		ret = proc_dointvec(table, write, buffer, lenp, ppos);
  2880	
  2881		if (!ret && write) {
  2882			ret = sched_rt_global_validate();
  2883			if (ret)
  2884				goto undo;
  2885	
  2886			ret = sched_dl_global_validate();
  2887			if (ret)
  2888				goto undo;
  2889	
  2890			ret = sched_rt_global_constraints();
  2891			if (ret)
  2892				goto undo;
  2893	
  2894			sched_rt_do_global();
  2895			sched_dl_do_global();
  2896		}
  2897		if (0) {
  2898	undo:
  2899			sysctl_sched_rt_period = old_period;
  2900			sysctl_sched_rt_runtime = old_runtime;
  2901		}
  2902		mutex_unlock(&mutex);
  2903	
  2904		return ret;
  2905	}
  2906	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
