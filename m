Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D0EC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690170575; x=1721706575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqAhhNXEEufm10llJTcmqUpJV53scmmYAALX0P2t7BQ=;
  b=cPqE+GzF6LBlbvS+/kd6tXL1dHp9nBtUcsvEA9ykb6Qy2E0iLBIbHMHH
   UXuIQYaxXr1vz2kBeHuLjkOT1JYQqL+muSMKJ/JgtPh0E8fJfm3Zk8f0d
   vgYXlSRPdK/By8RLvSts8tv2oa8LLPj9iLG2u79qBRIKMH67CcDzR/DRk
   ofFOZAH8sx3ym8BFBzKLtHCCxDYZ5LSRmuBVajNqfZjQMY07y0WAkIUR0
   4BWswT3avQBQ+AG/90E9o+wUGVtSRw3Yb0vYSL59ntBWX8NDJPciNEkj4
   4BYVdv1n1dSwfiNPUG154lMzMh0V/AT0Sc2f9eLSnBNYYKL44GFmKoZTV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="364799091"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="364799091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 20:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="760629385"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="760629385"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Jul 2023 20:49:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNmZb-0009T8-0t;
	Mon, 24 Jul 2023 03:49:27 +0000
Date: Mon, 24 Jul 2023 11:48:22 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 59/75] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0()
 instead
Message-ID: <202307241119.qMwOhq9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   67e2a22c34a5e14f77710f1276401e483e14bfaa
commit: 5efef1df18dc5d4fab4fd31850e37eb6eb1925c6 [59/75] usb: cdns3: starfive: Initialize JH7100 host mode
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230724/202307241119.qMwOhq9Q-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241119.qMwOhq9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307241119.qMwOhq9Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0() instead


vim +23 drivers/usb/cdns3/cdns3-starfive.c

    22	
  > 23	#define JH7100_USB0			0x20
    24	#define JH7100_USB0_MODE_STRAP_MASK	GENMASK(2, 0)
    25	#define JH7100_USB0_MODE_STRAP_HOST	2
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
