Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B277E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674311908; x=1705847908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14RTUHjYcRjF1AL9jRREpzo8gp6dk51pz1zZcnb5PJ8=;
  b=WWAB9xIKW7VzEQLnCe6f+rfSmOwZXlIPHbwo5SbY0nfdBsBfCIET8HuR
   qky9RsxzMBvwX41UjXmXLjUhqPA54+3T2GPtlsJT6tt2Gh10P+xlwVxoz
   AsYeptcH28e5s90YBUp/iH4DCsERYVuF174oH6NCZlBMdt4hGlw+SmWQb
   fokpthB0ncWCBLqQL+s8KJL4VsiSbLNm6DNXKZEz1T0DvsPFxdM82W/MX
   GSZVrKsjZv4kpwnL+1iAV1S7mQgxtBFR7SzPFyP3FiQaDbLqF5JpRe5tn
   tQs5uu6SYJYvvVF6v4F8du6zzyF8FAVe7oiXn/gllDukBzSiplztJQUlX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305457406"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="305457406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691376967"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="691376967"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jan 2023 06:38:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJF0j-0004Ac-1c;
	Sat, 21 Jan 2023 14:38:25 +0000
Date: Sat, 21 Jan 2023 22:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 4/5] ERROR: modpost: "local_clock"
 [drivers/gpu/drm/i915/i915.ko] undefined!
Message-ID: <202301212218.IvVXGEE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 01eee81c7fec26ca0a3ea93f3793d0772266fa8b [4/5] sched/clock: Make local_clock() noinstr
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230121/202301212218.IvVXGEE7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 01eee81c7fec26ca0a3ea93f3793d0772266fa8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "local_clock" [drivers/gpu/drm/i915/i915.ko] undefined!
>> ERROR: modpost: "local_clock" [drivers/vhost/vhost_net.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
