Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4E1FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677861080; x=1709397080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwNOQ9L0kxHGv6sGc4ni8KDiqa3xtJ7c6EQGPNGM4y0=;
  b=Jo0VnBFzX0EM5RWLTFUuHtib/fWIPwtJi+/oHfeEVWPWnhBbBGm0n5Y4
   mP304HZB6ehljzax33YErbCB7tl3aL4DAh0zbQGPyiO0Y6DuldN6hrGjh
   dFFXUbarz8g3XDOfcvLuhfn/0sKcxTfSjbCluF7Xm9d/x8sMvsMksiRUy
   HKWaUMXMa7rTrAzSmLVXxMJ68LLnHFb4ZcSTp8UKvaPOszO7EaUhJsQAe
   +VGJpNFgupcneXT+M4IuH6bQDBcPdC4Sbztkdri/A6SlTvbmgOMydacFJ
   uXUqGJgkzu2nEZw185R0vRrWB9j/nbbQN3ZkgwzXtvDdSMiNvsA/2N7H+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="335110416"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="335110416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="764486813"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="764486813"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Mar 2023 08:31:19 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8JS-0001Xw-0Y;
	Fri, 03 Mar 2023 16:31:18 +0000
Date: Sat, 4 Mar 2023 00:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/eevdf 4/10] fair.c:undefined reference to
 `__udivdi3'
Message-ID: <202303040056.1Tu5U9nc-lkp@intel.com>
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
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230304/202303040056.1Tu5U9nc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=bc9954a8f79988472545aa668a0be0dc5a0cddf3
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout bc9954a8f79988472545aa668a0be0dc5a0cddf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040056.1Tu5U9nc-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/sched/fair.o: in function `calc_latency_offset':
>> fair.c:(.text+0xb28): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
