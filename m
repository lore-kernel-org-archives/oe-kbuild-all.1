Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CA8F58
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679506672; x=1711042672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C9wfZ1hifRk76oRJlnFT7q1rnf57c5ttxFsnoG5toJM=;
  b=E7/g6WhaM2VkzG8Ut4sCZ7O2ccHrIkPx3eqe3lGxJ58HwDPOvm5w+bzX
   AcS/QMTnVKCHIm6R4YGbomPEjSP/i345YM0OwnCJCpFtPAjAegS8WYMfF
   gjcT05dQhswpxKd7ae9RDdc2RaMU7rTmch/a6QJ9s4WTrSANxuQM8oP3T
   vm4J3uP7kMcWvqfGc2mqg1esvddqX02CeVBqlLhF4JLjlA9RZRKrwHRA3
   7U8XZB7OXZkq5Hu8AV2C2vJOWrrHC2pqPIpqjlX5VyWSwKIyKtsbY/XZ2
   pb5WwGRq9cW1tVmSTB037hXxdqWGS6k7weDgIFDwVYe/xktiIUrFyI/s8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336793101"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336793101"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 10:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="927917093"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="927917093"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 10:37:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf2PE-000DWw-0G;
	Wed, 22 Mar 2023 17:37:48 +0000
Date: Thu, 23 Mar 2023 01:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org, mhiramat@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, delyank@fb.com,
	lukasz.luba@arm.com, qyousef@google.com
Subject: Re: [PATCH 3/3] schedutil: trace: Add tracing to capture filter out
 requests
Message-ID: <202303230130.BVOhzn4o-lkp@intel.com>
References: <20230322151843.14390-4-lukasz.luba@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322151843.14390-4-lukasz.luba@arm.com>

Hi Lukasz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on tip/sched/core linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Luba/sched-tp-Add-new-tracepoint-to-track-uclamp-set-from-user-space/20230322-232206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230322151843.14390-4-lukasz.luba%40arm.com
patch subject: [PATCH 3/3] schedutil: trace: Add tracing to capture filter out requests
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303230130.BVOhzn4o-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9eba04b3431f67b8e0c18ff57ea2976111673bea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lukasz-Luba/sched-tp-Add-new-tracepoint-to-track-uclamp-set-from-user-space/20230322-232206
        git checkout 9eba04b3431f67b8e0c18ff57ea2976111673bea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230130.BVOhzn4o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/schedutil.h:17,
                    from kernel/sched/cpufreq_schedutil.c:10,
                    from kernel/sched/build_utility.c:69:
>> include/trace/stages/init.h:2:23: warning: 'str__schedutil__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/str__schedutil__trace_system_name +2 include/trace/stages/init.h

af6b9668e85ffd Steven Rostedt (Google  2022-03-03 @2) #define __app__(x, y) str__##x##y
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  3) #define __app(x, y) __app__(x, y)
af6b9668e85ffd Steven Rostedt (Google  2022-03-03  4) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
