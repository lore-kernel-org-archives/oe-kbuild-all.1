Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CF1B85CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 05:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727155205; cv=none; b=jtwcfeg5n72U7KqfQD57KQ2/WikZI5UJFWkK8yXOXOERHQVoA3kquQz8XXJGKMp6lg0IR9vfXsn8AEPpB1h3+G7QKzFj0nQWSUD+GYs03gSk9GJV8NDJ7wWKEgH8+OWApYgF3quQrNfH9ayDV7zTB+fRiktyluZzNRE8yhHssiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727155205; c=relaxed/simple;
	bh=ekX8wiviidj7vkQX2eOI+cxKRfzRxzY8/ERJGrAGXtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SaMBYoq7s/y23kpCA6hUu36F8Z88reRAFDwNWoeGMRV8GkaiZXGwijuBcHo5pTjT7rnChb6ednEHtSEEMVeNUoh05GTTxb+x1Ycyti0t1WphHxkfh7mCFcf1ws6uoNYOLSml4BDzRuKbhcMv/3Fs29abm/oJB091964u2dwCkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgICXIWq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgICXIWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727155203; x=1758691203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekX8wiviidj7vkQX2eOI+cxKRfzRxzY8/ERJGrAGXtI=;
  b=EgICXIWq/D7ew6aSRz48bITekVrrCUoCVWuyAMMZIvELEzWQP9SscF50
   y2m5oalNV7B+InL1fRP/RUaOcdQNcag+PLuv2//p3V+7yZ3ynXItL0iYE
   6v//unElQVFlQ/7/KmtdlC6yAvyQSDYU6TyiEki/hLG2JnpNbUtYF4MKd
   Lfr7/3CkYQfjTfdnZo/5CgDq4tb2HX7BXsUmQMINt2DDI5ZVMvzAzki/q
   G/VvqTC5tDPsEY7pt5Ok6aFe1rMQSX1nv0/HkzyAkS6YDw5bXrTwt+Mxc
   g3rUGcPNeFKRzgeaa1HKxKd3NgIAPm6GtTMAulURT5y1C57RHVImg70yA
   A==;
X-CSE-ConnectionGUID: KYScaKgWQg+NA+IPUd22hg==
X-CSE-MsgGUID: VrHYW/kPTN2UNVjFu6+nrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43649208"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="43649208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 22:20:03 -0700
X-CSE-ConnectionGUID: l+nyt0NsTNSnd8ttRmkxWQ==
X-CSE-MsgGUID: aXE23nN+R9OJg+eV2FhBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71620745"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Sep 2024 22:20:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssxxv-000HyB-14;
	Tue, 24 Sep 2024 05:19:59 +0000
Date: Tue, 24 Sep 2024 13:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/main 285/2981] kernel/sched/cputime.c:256:31: error:
 'paravirt_steal_enabled' undeclared
Message-ID: <202409241330.IOls6PVz-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.10/main
head:   14cddf41a02f74b2d2a6727fe33914a57b4432f6
commit: d423eb552e8d9ccb6577937f3cf762b783679f8e [285/2981] sched/alt: Headers cleanup
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409241330.IOls6PVz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241330.IOls6PVz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241330.IOls6PVz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:56:
   kernel/sched/cputime.c: In function 'steal_account_process_time':
>> kernel/sched/cputime.c:256:31: error: 'paravirt_steal_enabled' undeclared (first use in this function)
     256 |         if (static_key_false(&paravirt_steal_enabled)) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/cputime.c:256:31: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/cputime.c:259:25: error: implicit declaration of function 'paravirt_steal_clock' [-Wimplicit-function-declaration]
     259 |                 steal = paravirt_steal_clock(smp_processor_id());
         |                         ^~~~~~~~~~~~~~~~~~~~


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
