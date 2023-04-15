Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C137EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 00:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681519443; x=1713055443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCLFTLOebVlzDuDzKEMueePnCMxdgluHyRkS/WevcxQ=;
  b=GCYYjMutBFfdrm5AQFRtqgEnQESm5MfY4vGmNvwcV+pqsYU4yWOdCbPe
   R2YwphIep73jgmdTB+nEifYTQesMUEtP0THpvXJW9jdpIAVOH6/LILfbT
   kF4eWhLNN9KkGtdw1R4LqsKBRW55FhScefFK0R8rQfsTly3hXNqJmb0xH
   iRw/tpj+3jBhBgwbdZhTxjNqwR4CR03hmYc7F7QhXpISQR8YL01ZstELs
   m8bfv2zJL+VWGoVfKm03M2+ESLxBTCRTpekKIS7W5oML2XhkJZPu0ohGD
   SKb1l7+BrhXv1pHDWRMNqZvq9UcG+hd33TMs5U9wrqi8mhQ3efhD6Vg4N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344595910"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="344595910"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 17:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="692620221"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="692620221"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2023 17:44:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnU1H-000aB9-2J;
	Sat, 15 Apr 2023 00:43:59 +0000
Date: Sat, 15 Apr 2023 08:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@arm.com>,
	Chris Redpath <chris.redpath@arm.com>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 1440/9999]
 kernel/sched/fair.c:3581:5: warning: no previous declaration for
 'update_rt_rq_load_avg'
Message-ID: <202304150849.oxU9QXjx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: e284a318713dc92d96569658af16bddb9c17cd7d [1440/9999] FROMLIST: sched/rt: add utilization tracking
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230415/202304150849.oxU9QXjx-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/e284a318713dc92d96569658af16bddb9c17cd7d
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout e284a318713dc92d96569658af16bddb9c17cd7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/ kernel/sched/ lib/lzo/ net/ipv6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150849.oxU9QXjx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:3581:5: warning: no previous declaration for 'update_rt_rq_load_avg' [-Wmissing-declarations]
    int update_rt_rq_load_avg(u64 now, int cpu, struct rt_rq *rt_rq, int running)
        ^~~~~~~~~~~~~~~~~~~~~


vim +/update_rt_rq_load_avg +3581 kernel/sched/fair.c

  3580	
> 3581	int update_rt_rq_load_avg(u64 now, int cpu, struct rt_rq *rt_rq, int running)
  3582	{
  3583		return 0;
  3584	}
  3585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
