Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6A1119C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jun 2023 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687990078; x=1719526078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeY+8Yxymz1KXtDg5QU/PzrB+RvBHaPET4J0a2Xb/+g=;
  b=Iu+CVOnbID65pNA4OMgKhUQrmZoGrS7YzbHi3/SOE8tEPZ0sJvLUGFAh
   nAmwmA9pD64uEpupYgdoyp26OzjycmJ+7SyxRhQBFT38jAYP0+rxSH9Sk
   TmpBioaupvfhAUE2gnKTdSjPm9oKktDvbq7B20kZvC0K3QYvyqGUSMt0n
   ulNR8KYKSoiiilBa6exGSj2LauBxX2Ds+9YOSn3VR2xcflCw48XLzFeIW
   lilU0k+75mVQKFeWK5ivRPMDkS4p94ZHZUq0/yGbsVgwgNcRgQML174m5
   QV+bUnAo8FwxsJ/Ws+7k+4m8qGMGAiX9yo9roV5IGJJ7MOqKN/80Wfz2m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360819613"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="360819613"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 15:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963776771"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="963776771"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 15:07:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEdKO-000DXP-0K;
	Wed, 28 Jun 2023 22:07:56 +0000
Date: Thu, 29 Jun 2023 06:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/main 284/450] kernel/sched/cputime.c:256:31: error:
 'paravirt_steal_enabled' undeclared
Message-ID: <202306290631.GNnHD3Pz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.4/main
head:   b7a3f28f08a1e3dfd5659c6be6d4581900471a52
commit: fa51a210dd580901cb9fde19d3d268b3dc9cd597 [284/450] sched/alt: Headers cleanup
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230629/202306290631.GNnHD3Pz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290631.GNnHD3Pz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290631.GNnHD3Pz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:56:
   kernel/sched/cputime.c: In function 'steal_account_process_time':
>> kernel/sched/cputime.c:256:31: error: 'paravirt_steal_enabled' undeclared (first use in this function)
     256 |         if (static_key_false(&paravirt_steal_enabled)) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/cputime.c:256:31: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/cputime.c:259:25: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
     259 |                 steal = paravirt_steal_clock(smp_processor_id());
         |                         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/paravirt_steal_enabled +256 kernel/sched/cputime.c

1fcf54deb767d4 Josh Don            2022-06-29  247  
03cbc732639ddc Wanpeng Li          2016-08-17  248  /*
03cbc732639ddc Wanpeng Li          2016-08-17  249   * When a guest is interrupted for a longer amount of time, missed clock
03cbc732639ddc Wanpeng Li          2016-08-17  250   * ticks are not redelivered later. Due to that, this function may on
03cbc732639ddc Wanpeng Li          2016-08-17  251   * occasion account more time than the calling functions think elapsed.
03cbc732639ddc Wanpeng Li          2016-08-17  252   */
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  253  static __always_inline u64 steal_account_process_time(u64 maxtime)
73fbec604432e1 Frederic Weisbecker 2012-06-16  254  {
73fbec604432e1 Frederic Weisbecker 2012-06-16  255  #ifdef CONFIG_PARAVIRT
73fbec604432e1 Frederic Weisbecker 2012-06-16 @256  	if (static_key_false(&paravirt_steal_enabled)) {
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  257  		u64 steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  258  
73fbec604432e1 Frederic Weisbecker 2012-06-16 @259  		steal = paravirt_steal_clock(smp_processor_id());
73fbec604432e1 Frederic Weisbecker 2012-06-16  260  		steal -= this_rq()->prev_steal_time;
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  261  		steal = min(steal, maxtime);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  262  		account_steal_time(steal);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  263  		this_rq()->prev_steal_time += steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  264  
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  265  		return steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  266  	}
73fbec604432e1 Frederic Weisbecker 2012-06-16  267  #endif
807e5b80687c06 Wanpeng Li          2016-06-13  268  	return 0;
73fbec604432e1 Frederic Weisbecker 2012-06-16  269  }
73fbec604432e1 Frederic Weisbecker 2012-06-16  270  

:::::: The code at line 256 was first introduced by commit
:::::: 73fbec604432e1fbfeb1bc59a110dac1f98160f6 sched: Move cputime code to its own file

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
