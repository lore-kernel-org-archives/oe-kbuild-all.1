Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CE5695
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 13:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688476680; x=1720012680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QorN18xI/emvJUZzanZIdwYDLzaGGu3Aqx9WfoJtjOU=;
  b=UhkhHlMH0rBe3YoSDHjZAvsP2mha68nI8SxyY4nqvPrkkOFB4MK8CRLO
   wT4mWPdhtysK7KsKA4OfLFJZ1CfwLl7aPqCBl+JfIo426bqvnC7MARilw
   aOdrC7UwLg8KJBEs0i7ao1TEKaEH66kR2aTVFzPy3S9RIxQX2XKhoDyXI
   J6fJwvGHl4kJenlaxipz7hP3NUakthTPfrNGTrO1oGfqxRtQVaTSe8N8T
   UoL16qvZZ8qaA96DQ8en2nb5PT/a763CEL8hMN94YqOthcd9xrtzuwPzX
   +RlChllWzDHxrLNW2yoQ5t801H+HHbG9GUfd5uuKsfrv312L734xguDw1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360598385"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="360598385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 06:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="669091776"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="669091776"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Jul 2023 06:17:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGfui-000IGl-2v;
	Tue, 04 Jul 2023 13:17:52 +0000
Date: Tue, 4 Jul 2023 21:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 37/37] arch/x86/kernel/process.c:907:13:
 error: called object is not a function or function pointer
Message-ID: <202307042109.06aUl7Am-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   53cee0c91c9944ef2e6b784edaea5df7d6ba5648
commit: 53cee0c91c9944ef2e6b784edaea5df7d6ba5648 [37/37] x86/cpu: Get rid of smt_max_siblings
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230704/202307042109.06aUl7Am-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042109.06aUl7Am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042109.06aUl7Am-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/process.c: In function 'select_idle_routine':
>> arch/x86/kernel/process.c:907:13: error: called object is not a function or function pointer
     907 |             boot_cpu_data.topo.max_smt_siblings() > 1)
         |             ^~~~~~~~~~~~~


vim +907 arch/x86/kernel/process.c

   903	
   904	void select_idle_routine(const struct cpuinfo_x86 *c)
   905	{
   906		if (IS_ENABLED(CONFIG_SMP) && boot_option_idle_override == IDLE_POLL &&
 > 907		    boot_cpu_data.topo.max_smt_siblings() > 1)
   908			pr_warn_once("WARNING: polling idle and HT enabled, performance may degrade\n");
   909	
   910		if (x86_idle_set() || boot_option_idle_override == IDLE_POLL)
   911			return;
   912	
   913		if (boot_cpu_has_bug(X86_BUG_AMD_E400)) {
   914			pr_info("using AMD E400 aware idle routine\n");
   915			static_call_update(x86_idle, amd_e400_idle);
   916		} else if (prefer_mwait_c1_over_halt(c)) {
   917			pr_info("using mwait in idle threads\n");
   918			static_call_update(x86_idle, mwait_idle);
   919		} else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
   920			pr_info("using TDX aware idle routine\n");
   921			static_call_update(x86_idle, tdx_safe_halt);
   922		} else
   923			static_call_update(x86_idle, default_idle);
   924	}
   925	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
