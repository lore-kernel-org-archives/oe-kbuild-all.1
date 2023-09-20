Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A2125AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695202913; x=1726738913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8F+HyRxAwxfyuu+PlSvim7L3Z2n/dK25DbGS8m1Whpw=;
  b=H9ZvPFL32t3wVvUBfvq+GuBo6ENh2lVqgxeTyGGM5p3GHrhYrH4fqUcg
   HhyomYKpOX+jhftyvG+LOYk9aSsAw3V50Z44w+C/qJgVMsm/p90XopP0n
   cvUYigHWvy3+Zb9XXT6qtgsZbPz1qZYNQeN4hEBgP5H6F/GYlGBCsANXK
   /ri5CX4qrI+ZZJvTynpFM+WxLZru9pXN/28t76W7+wr+91upwgQD5lVpo
   p/sitLC0mh30yEx2C2wfyUpNagphhRFWsb85FDmewco0UCBLI6cJzZ+Or
   AxeMQF0GpsazDaHIo/sW1RSKgJtRz9uA6IU+RzuCWWYU83+q6HZtY95KM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411118955"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="411118955"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775925060"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="775925060"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2023 02:41:51 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitiP-0008aq-0H;
	Wed, 20 Sep 2023 09:41:49 +0000
Date: Wed, 20 Sep 2023 17:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 41/48] make[4]: *** No rule to make
 target
 'arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtbo',
 needed by 'arch/arm64/boot/dts/ti/k3-j721e-evm.dtb'.
Message-ID: <202309201728.7uyEE1IB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: d19fe0148d5dc4012824f5fd851f2ac2407c2e2a [41/48] arm64: dts: ti: Add k3-j721e-common-proc-board-infotainment.dtso
config: arm64-randconfig-003-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201728.7uyEE1IB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201728.7uyEE1IB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201728.7uyEE1IB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j721e-common-proc-board-infotainment.dtbo', needed by 'arch/arm64/boot/dts/ti/k3-j721e-evm.dtb'.
   make[4]: Target 'arch/arm64/boot/dts/ti/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
