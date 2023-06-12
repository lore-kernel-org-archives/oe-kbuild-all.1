Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC85318AE0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 22:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686608601; x=1718144601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxMUmBauQjv3CQ/O9SLADsbrUEj4OkGBAYzD2sPWYxU=;
  b=fuvlZUJMuWRknMTI1kcSnLZveLchQuAIRHHWEdiBLwGjgkFQBTxSMZrV
   fZQem2Nsp0FvaE/zaV2vr9q6VO3hR5TUOzwQjuRP8YqRZiaq6Yf9YSR/+
   9/Z0QjOyBp0a8RiCLvTnKAO5F9ADMIEb0tAqFggh2xban+yOcS23wCLeA
   Bvdrtx6s1vRtbvfksBINDknEx7/OlYQmuUjCOe+sdVe4jJITA52c0KxEi
   XSyGAUo/HbQI9yOgemUK8yHNQYCfMn+vY9ZsUYuBcmSym/buy4Qok86cz
   TgqwH7ruHLzK16rCFd8cEgiEK94lT0kUGQB1cTT/DONRXl25UpAIcFZSi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338534535"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="338534535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705550335"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="705550335"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 15:23:19 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8pwU-0000nR-1W;
	Mon, 12 Jun 2023 22:23:18 +0000
Date: Tue, 13 Jun 2023 06:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Greg KH <greg@kroah.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:core/guards2 23/59] kernel/events/core.c:11384:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202306130653.Dm0xwKCS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   d982cb15a612c31105d806c86764d72346142398
commit: 50b0f0252d75f1477582be46833594b22acd031f [23/59] perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130653.Dm0xwKCS-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=50b0f0252d75f1477582be46833594b22acd031f
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards2
        git checkout 50b0f0252d75f1477582be46833594b22acd031f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash kernel/events/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130653.Dm0xwKCS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:11384:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   11384 | const static struct attribute_group *pmu_dev_groups[] = {
         | ^~~~~


vim +/static +11384 kernel/events/core.c

 11383	
 11384	const static struct attribute_group *pmu_dev_groups[] = {
 11385		&pmu_dev_attr_group,
 11386		NULL,
 11387	};
 11388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
