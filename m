Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD153C0A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbWfFuoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704097321; x=1735633321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzB/D+ilBC63TPbBqyRQI28ib8yc9VwqBVOUwI2V6D0=;
  b=fbWfFuoy/TYGSHMwTfTjrn1mrhl/j4vbNoUQnG2VuY0xLQiUhbMVWj6P
   pPwpHiVBpdd/vNsjf6VB3S9cZtHNOwgtgptJJrnfDQmEo4aQGBsZtG3GH
   OT4cs4pwS/DB89ii0gWDMZb41F6UbIEjJHQKvPdJ50h+iTnzW/y3eAaZT
   fzg//GQN0odY3VPSYsdCb4M72hSie0jK2sus9WoOnnMV3DtakwWKiD+i/
   5VJN4T8QRRTFo/1NQRNcqlDrTxIUI/7S84pwutJ91t9wG/5MU6Tg6HU9p
   ic5CnZcuSjydrCtNEZlAEriKq7eeKalAUkdIqSzTfr2LDK4b+kvfbNrv9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="18322018"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="18322018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 00:21:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1110745786"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="1110745786"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jan 2024 00:21:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKDYX-000K5q-16;
	Mon, 01 Jan 2024 08:21:53 +0000
Date: Mon, 1 Jan 2024 16:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/13]
 drivers/cpufreq/intel_pstate.c:2250:1: error: expected expression before '}'
 token
Message-ID: <202401011640.jDXlOSOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   a1540fef55aeb1d872b6ecdc983a73b1be14e2f3
commit: 4baf9e0d1d48fa7e06937741dfd72635c3db5dfb [9/13] sched: Make iowait boost per task
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240101/202401011640.jDXlOSOT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401011640.jDXlOSOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401011640.jDXlOSOT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/intel_pstate.c: In function 'intel_pstate_adjust_pstate':
>> drivers/cpufreq/intel_pstate.c:2250:1: error: expected expression before '}' token
    2250 | }
         | ^
>> drivers/cpufreq/intel_pstate.c:2249:40: error: expected ';' before '}' token
    2249 |                 get_avg_frequency(cpu),
         |                                        ^
         |                                        ;
    2250 | }
         | ~                                       
   drivers/cpufreq/intel_pstate.c: In function 'intel_cpufreq_trace':
   drivers/cpufreq/intel_pstate.c:2758:1: error: expected expression before '}' token
    2758 | }
         | ^
   drivers/cpufreq/intel_pstate.c:2757:40: error: expected ';' before '}' token
    2757 |                 get_avg_frequency(cpu),
         |                                        ^
         |                                        ;
    2758 | }
         | ~                                       


vim +2250 drivers/cpufreq/intel_pstate.c

fdfdb2b1301670 Rafael J. Wysocki   2016-03-18  2227  
a891283e563625 Rafael J. Wysocki   2017-08-10  2228  static void intel_pstate_adjust_pstate(struct cpudata *cpu)
93f0822dff5dae Dirk Brandewie      2013-02-06  2229  {
67dd9bf4416305 Rafael J. Wysocki   2017-03-28  2230  	int from = cpu->pstate.current_pstate;
4055fad34086dc Doug Smythies       2015-04-11  2231  	struct sample *sample;
a891283e563625 Rafael J. Wysocki   2017-08-10  2232  	int target_pstate;
4055fad34086dc Doug Smythies       2015-04-11  2233  
001c76f05b01cc Rafael J. Wysocki   2016-11-17  2234  	update_turbo_state();
001c76f05b01cc Rafael J. Wysocki   2016-11-17  2235  
d77d4888cb8458 Rafael J. Wysocki   2017-08-10  2236  	target_pstate = get_target_pstate(cpu);
6407829901f074 Rafael J. Wysocki   2017-03-03  2237  	target_pstate = intel_pstate_prepare_request(cpu, target_pstate);
6407829901f074 Rafael J. Wysocki   2017-03-03  2238  	trace_cpu_frequency(target_pstate * cpu->pstate.scaling, cpu->cpu);
fdfdb2b1301670 Rafael J. Wysocki   2016-03-18  2239  	intel_pstate_update_pstate(cpu, target_pstate);
4055fad34086dc Doug Smythies       2015-04-11  2240  
4055fad34086dc Doug Smythies       2015-04-11  2241  	sample = &cpu->sample;
a1c9787dc38097 Rafael J. Wysocki   2016-05-11  2242  	trace_pstate_sample(mul_ext_fp(100, sample->core_avg_perf),
157386b6fc1465 Philippe Longepe    2015-12-04  2243  		fp_toint(sample->busy_scaled),
4055fad34086dc Doug Smythies       2015-04-11  2244  		from,
4055fad34086dc Doug Smythies       2015-04-11  2245  		cpu->pstate.current_pstate,
4055fad34086dc Doug Smythies       2015-04-11  2246  		sample->mperf,
4055fad34086dc Doug Smythies       2015-04-11  2247  		sample->aperf,
4055fad34086dc Doug Smythies       2015-04-11  2248  		sample->tsc,
3ba7bcaa3657f5 Srinivas Pandruvada 2016-09-13 @2249  		get_avg_frequency(cpu),
93f0822dff5dae Dirk Brandewie      2013-02-06 @2250  }
93f0822dff5dae Dirk Brandewie      2013-02-06  2251  

:::::: The code at line 2250 was first introduced by commit
:::::: 93f0822dff5dae2f0a2645f16300c14af41ca777 cpufreq/x86: Add P-state driver for sandy bridge.

:::::: TO: Dirk Brandewie <dirk.brandewie@gmail.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
