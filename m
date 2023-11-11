Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B4146B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 04:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AM9tWCSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699678617; x=1731214617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fB4of8Uc5QVel4j/5Efd20PibuJAOcIpepweOglEqSI=;
  b=AM9tWCSj4q/v78n/9qZ2yOwYkYx10kDYTQwlwViYKqwA/vjcB/O6SlJd
   DYO8fPSqCKYEeD7m1Ii6B/jCc64kJ8eDmThPBMWtd7Ex0iXEf8kOhSLxJ
   j84vn4CNLqDYJI1Zx99LmpRwMIrF9aXa6Jw+5l3e5eu9Ecjy6SrSmrt5X
   ksYOso/45KfObaew5HfKxLNEqpGGX5SeW6ENEWZB4o+B34p1oNc+6NcEO
   EtkDQgeRpwzYLV64a1w8rNSMk/t/MGhBuItiMBF22kHN0pnLJbqaCV5Sj
   YrW3vQvsJ5tatOPjQ3Mo4yQyTUauxZnuFtu+jxkLrBu+483k3Lo+vNX8Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="370460277"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="370460277"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 20:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="854541876"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="854541876"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2023 20:56:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1g3B-000ADY-0A;
	Sat, 11 Nov 2023 04:56:53 +0000
Date: Sat, 11 Nov 2023 12:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:more-default-warnings 23/47]
 kernel/trace/trace_osnoise.c:1999:8: warning: 'main' is usually a function
Message-ID: <202311111234.FEYPmd8T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git more-default-warnings
head:   b86302da264f77971112b4be0b16eeb591026cbc
commit: 00e0c1d8a43a259e001163ce28c5d5813643eab2 [23/47] [SUBMITTED 20230811] extrawarn: do not disable -Wmain at W=1 level
config: x86_64-randconfig-076-20231111 (https://download.01.org/0day-ci/archive/20231111/202311111234.FEYPmd8T-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111234.FEYPmd8T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111234.FEYPmd8T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_osnoise.c: In function 'start_kthread':
>> kernel/trace/trace_osnoise.c:1999:8: warning: 'main' is usually a function [-Wmain]
     void *main = osnoise_main;
           ^~~~


vim +/main +1999 kernel/trace/trace_osnoise.c

c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1992  
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1993  /*
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1994   * start_kthread - Start a workload tread
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1995   */
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1996  static int start_kthread(unsigned int cpu)
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1997  {
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  1998  	struct task_struct *kthread;
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22 @1999  	void *main = osnoise_main;
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  2000  	char comm[24];
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2001  
ccb6754495ef25 Daniel Bristot de Oliveira 2021-10-31  2002  	if (timerlat_enabled()) {
a955d7eac1779b Daniel Bristot de Oliveira 2021-06-22  2003  		snprintf(comm, 24, "timerlat/%d", cpu);
a955d7eac1779b Daniel Bristot de Oliveira 2021-06-22  2004  		main = timerlat_main;
a955d7eac1779b Daniel Bristot de Oliveira 2021-06-22  2005  	} else {
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2006  		/* if no workload, just return */
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2007  		if (!test_bit(OSN_WORKLOAD, &osnoise_options)) {
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2008  			per_cpu(per_cpu_osnoise_var, cpu).sampling = true;
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2009  			barrier();
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2010  			return 0;
30838fcd81078d Daniel Bristot de Oliveira 2022-11-17  2011  		}
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2012  		snprintf(comm, 24, "osnoise/%d", cpu);
a955d7eac1779b Daniel Bristot de Oliveira 2021-06-22  2013  	}
ccb6754495ef25 Daniel Bristot de Oliveira 2021-10-31  2014  
11e4e3523da98c Cai Huoqing                2022-01-14  2015  	kthread = kthread_run_on_cpu(main, NULL, cpu, comm);
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2016  
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2017  	if (IS_ERR(kthread)) {
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2018  		pr_err(BANNER "could not start sampling thread\n");
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2019  		stop_per_cpu_kthreads();
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2020  		return -ENOMEM;
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2021  	}
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2022  
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  2023  	per_cpu(per_cpu_osnoise_var, cpu).kthread = kthread;
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  2024  
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  2025  	return 0;
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  2026  }
c8895e271f7994 Daniel Bristot de Oliveira 2021-06-22  2027  

:::::: The code at line 1999 was first introduced by commit
:::::: c8895e271f7994a3ecb13b8a280e39aa53879545 trace/osnoise: Support hotplug operations

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
