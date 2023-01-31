Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E4A94F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675201408; x=1706737408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fu8IreGAh2stIOP+e6x02YO9G8YDtlqww/FNpcUO/hI=;
  b=OgjLsA7bhNVwCUCodLMPckx7DZIGCk7bMpSJ9Sm46Z6cMY1cP37HWcV+
   QESCkGQZ7C61wM7I74tx5Kyp/KF7YC1v2IUnWomZSqp7GwuK44et0ozFP
   s7M041JsQj9oDYtIu+skILFw3kbEr30GtdDv0/cfKlpiJMxxX9KYrBIX5
   e/nP5rct7W2oUlIm5nGRSYN4FdKy87WU3SzfKB9VdpH9PNXrK6PLPgODn
   yKXR1afyrlEyb6yTCaFIiLDDk/xvU7r3RGjgK9mIM8vfN0y9AcpbF1G4g
   njRJQCMhHSjh2YCDLEOZrCu/z4XzU+G7FNTXM8N/yRVAojJwZ/hEPKei0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414178671"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="414178671"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 13:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="614608312"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="614608312"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2023 13:43:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMyPV-0004j4-2Q;
	Tue, 31 Jan 2023 21:43:25 +0000
Date: Wed, 1 Feb 2023 05:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 2/3] kernel/sched/rt.c:1322:9: error:
 'rt_rq' undeclared
Message-ID: <202302010559.aEwlZsBQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   43445d190f0aaee241b3ba09ae5f196d54d0f1b5
commit: c9c5078dcd7dfce0cc79f320335f7dc345570981 [2/3] sched/rt: Track the number of immediate running rt_se
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230201/202302010559.aEwlZsBQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c9c5078dcd7dfce0cc79f320335f7dc345570981
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout c9c5078dcd7dfce0cc79f320335f7dc345570981
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function '__delist_rt_entity':
>> kernel/sched/rt.c:1322:9: error: 'rt_rq' undeclared (first use in this function)
    1322 |         rt_rq->rt_se_running--;
         |         ^~~~~
   kernel/sched/rt.c:1322:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/rt_rq +1322 kernel/sched/rt.c

  1314	
  1315	static void __delist_rt_entity(struct sched_rt_entity *rt_se, struct rt_prio_array *array)
  1316	{
  1317		list_del_init(&rt_se->run_list);
  1318	
  1319		if (list_empty(array->queue + rt_se_prio(rt_se)))
  1320			__clear_bit(rt_se_prio(rt_se), array->bitmap);
  1321	
> 1322		rt_rq->rt_se_running--;
  1323		rt_se->on_list = 0;
  1324	}
  1325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
