Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BD7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 06:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676443357; x=1707979357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2YHQT3ZZGPyCmqaKTuRRI+07yZgfEsfbr83agvS1Yek=;
  b=RxNMjuHiRUKh0cl+UB+IOd5GWhyPL24Zq5qkzpw9BLQYCbfzlEzEGqeJ
   jWoaHdMl43EPCBVgYTyMvnlFpWj+Oya63zAZ+cQPQxrOvEk39Ph1kJ/aF
   +KwDyGg9BL4Bo4+1xUUwUu5qptuUvYD1hpvFEoRUlyma730mBlIYsITtP
   I5APUECAj8dDpO3+OaEtR85wEj0NpLXgzIoyVi+vi3ejkk4Dbx8YxcCvs
   6JIsmGfEuHfNHl7ry2UtBjabDp4NZPs9x8exTYzBHzAI8Dzp4973yvQ2j
   rht3i9GH4amqp/tUZPltmgpSuIymqC5xJ/vJV6uY3SIpi2KpEzJ7h1OxG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311726660"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="311726660"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 22:42:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="701916992"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="701916992"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2023 22:42:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSBUw-00097x-1s;
	Wed, 15 Feb 2023 06:42:34 +0000
Date: Wed, 15 Feb 2023 14:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-5.19.y-rt-rebase 15/51] kernel/softirq.c:640:1:
 sparse: sparse: symbol '__pcpu_scope_timersd' was not declared. Should it be
 static?
Message-ID: <202302151416.qk0ZLww5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-5.19.y-rt-rebase
head:   38af424dc4ef543d1c5a458b5a816f3d04fa6ecb
commit: 7c45ac654e3ff9d9e629823c40813117bb6968ff [15/51] rcutorture: Also force sched priority to timersd on boosting test.
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230215/202302151416.qk0ZLww5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=7c45ac654e3ff9d9e629823c40813117bb6968ff
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.19.y-rt-rebase
        git checkout 7c45ac654e3ff9d9e629823c40813117bb6968ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302151416.qk0ZLww5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/softirq.c:640:1: sparse: sparse: symbol '__pcpu_scope_timersd' was not declared. Should it be static?

vim +/__pcpu_scope_timersd +640 kernel/softirq.c

   639	
 > 640	DEFINE_PER_CPU(struct task_struct *, timersd);
   641	static DEFINE_PER_CPU(unsigned long, pending_timer_softirq);
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
