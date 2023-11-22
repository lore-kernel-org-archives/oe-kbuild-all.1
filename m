Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C2210E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ3Dbf4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640539; x=1732176539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weGDwJYweG6VVKu/QhBiuscsSjDoxoxPg55UngumhmY=;
  b=cJ3Dbf4UIeuf2BYJuy1aTqKRBA4O/AEdYJPTDmp434FSU0aks/ZMfxOk
   2Q+ifxJzFYzGfLeDN4EOBakB1m2LyoqLaueyRrKfFpLCE7LOFyeChl81h
   UkcQqZyfTZgvmcYLU7MOIuWugPvxiVAKyXv0tlmCZMXY4qFwuGj8WB/VX
   hEjyHBSDrQS31JnbYroYc+rSbvLCxjh0Qr+M+OPyZcBmwJFPdyJsU10FO
   YVxo+apb2MI1EN61RUiYVIZ2bySU/fRuMEqYTrmCPK5JlzWiKjg4Qdve/
   xsWs4yKgO1GSCTKlrL7QI/JysYVCAkw55ZnR94iDM2RR62ZBZ0nkboybw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="10670213"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="10670213"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="743319821"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="743319821"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Nov 2023 00:08:56 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5iI2-0000Fj-0X;
	Wed, 22 Nov 2023 08:08:54 +0000
Date: Wed, 22 Nov 2023 16:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/prjc 328/451] kernel/sched/cputime.c:256:31: error:
 'paravirt_steal_enabled' undeclared
Message-ID: <202311221510.QQoO23kJ-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.6/prjc
head:   cd5cdcc083d7742287cac8eccee909e4b5a5c9e0
commit: d13019a47dac67a56620a6406b7639ed0ce74a4e [328/451] sched/alt: Headers cleanup
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221510.QQoO23kJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221510.QQoO23kJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221510.QQoO23kJ-lkp@intel.com/

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
