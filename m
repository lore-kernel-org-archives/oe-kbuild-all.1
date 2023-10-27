Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE053D3B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL1aSoY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698431939; x=1729967939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rfTV7fW5gKjZQKtJuxH2JY/OrmY4+1jcnMI1v2wl1A=;
  b=hL1aSoY3x5TsVQEDz0APYmLwX/wjYQh+HVYvALNjOLwfAIPr0bhU8Ayt
   zv1l3OT6wWtAU1v7tMzli6oJhiDjNGUpgxlYL97Cq98xO/GT6Ys3jEqnR
   wrupaa3/aDZESmV+5sAZpVZMnvJ5oxpE6EKYr0/rmjK3OyUtULYAtgF8Q
   KUZGhOjwidkliM1W+d7Tm0PogADGXZ+rwuDsz4HPfD11w4AcHDiW2a6Dr
   AYUXGsjekEvfadrEDAId4+BLdhhNVQaSVLUhgLM35/oTd0UzxvuiAoEZb
   EwTWwy3DVZ+oB7ex8ZHHWVtzlyWlP6H0lHJQsakRKZVP40BNuS026thE7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="387644128"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="387644128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 11:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="867292"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2023 11:38:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwRjQ-000B83-0V;
	Fri, 27 Oct 2023 18:38:52 +0000
Date: Sat, 28 Oct 2023 02:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, suleiman@google.com,
	briannorris@google.com, Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] PM: sleep: Expose last succeeded resumed timestamp in
 sysfs
Message-ID: <202310280256.JJlmxwDy-lkp@intel.com>
References: <169841470363.1307628.18049455026067747896.stgit@mhiramat.roam.corp.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169841470363.1307628.18049455026067747896.stgit@mhiramat.roam.corp.google.com>

Hi Masami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc7 next-20231027]
[cannot apply to pavel-leds/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/PM-sleep-Expose-last-succeeded-resumed-timestamp-in-sysfs/20231027-215311
base:   linus/master
patch link:    https://lore.kernel.org/r/169841470363.1307628.18049455026067747896.stgit%40mhiramat.roam.corp.google.com
patch subject: [PATCH] PM: sleep: Expose last succeeded resumed timestamp in sysfs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310280256.JJlmxwDy-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280256.JJlmxwDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280256.JJlmxwDy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/main.c: In function 'last_success_resume_time_show':
>> kernel/power/main.c:427:32: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time64_t' {aka 'long long int'} [-Wformat=]
     427 |         return sprintf(buf, "%lu.%lu\n",
         |                              ~~^
         |                                |
         |                                long unsigned int
         |                              %llu
     428 |                        suspend_stats.last_success_resume_time.tv_sec,
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                              |
         |                                                              time64_t {aka long long int}
   kernel/power/main.c: In function 'suspend_stats_show':
   kernel/power/main.c:528:58: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'time64_t' {aka 'long long int'} [-Wformat=]
     528 |         seq_printf(s,   "  last_success_resume_time:\t%-lu.%lu\n",
         |                                                       ~~~^
         |                                                          |
         |                                                          long unsigned int
         |                                                       %-llu
     529 |                    suspend_stats.last_success_resume_time.tv_sec,
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                          |
         |                                                          time64_t {aka long long int}


vim +427 kernel/power/main.c

   423	
   424	static ssize_t last_success_resume_time_show(struct kobject *kobj,
   425			struct kobj_attribute *attr, char *buf)
   426	{
 > 427		return sprintf(buf, "%lu.%lu\n",
   428			       suspend_stats.last_success_resume_time.tv_sec,
   429			       suspend_stats.last_success_resume_time.tv_nsec);
   430	}
   431	static struct kobj_attribute last_success_resume_time =
   432				__ATTR_RO(last_success_resume_time);
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
