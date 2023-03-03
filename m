Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F21FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677861740; x=1709397740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0ZHlMgv35nPXyTcoUJa6be6eE2cAjYNfuIF8JiWutw=;
  b=MleeW+z2EztpGOJq1EiOj2VLJxOxqDuZJ3jkbcNzOBLLgMKy9ghlakvF
   EWlK95kwkaAOAsKtbjASZ2AHzs/8w7F1hWXbnu8Q37WDQA6wS3D4J0me9
   TExmdbSvBWd0sIpySnq31Ih+RJKjac84tndD6j+WKDEFPrxVqI5gi5LKP
   CzVNtYA9N1jOsFlax3PACJeJZfM1JrpLQmu/mseOwv575Nz2/JBTVfP2L
   l1kwY0VB/+6q5U6hqnxNWI9J9eV2pe63EeX4WjrdePRj3hhQlUM8lOfC3
   CiQwbZw4Hh0iv1WJZ1mgj/mxmMyusRjh/kHgJmGEjrrN+nDmFviARzPcL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="397675343"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="397675343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="668722532"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="668722532"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2023 08:42:19 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8U6-0001YG-1Y;
	Fri, 03 Mar 2023 16:42:18 +0000
Date: Sat, 4 Mar 2023 00:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/eevdf 4/10] kernel/sched/fair.c:711: undefined
 reference to `__udivdi3'
Message-ID: <202303040023.GGyvAAAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   bc35f40661d8d25ce8cde6e26d5956237a3e61ae
commit: bc9954a8f79988472545aa668a0be0dc5a0cddf3 [4/10] sched/fair: Add latency_offset
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230304/202303040023.GGyvAAAo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=bc9954a8f79988472545aa668a0be0dc5a0cddf3
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout bc9954a8f79988472545aa668a0be0dc5a0cddf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040023.GGyvAAAo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/sched/fair.o: in function `calc_latency_offset':
>> kernel/sched/fair.c:711: undefined reference to `__udivdi3'


vim +711 kernel/sched/fair.c

   705	
   706	long calc_latency_offset(int prio)
   707	{
   708		u32 weight = sched_prio_to_weight[prio];
   709		u64 base = sysctl_sched_min_granularity;
   710	
 > 711		return (base << SCHED_FIXEDPOINT_SHIFT) / weight;
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
