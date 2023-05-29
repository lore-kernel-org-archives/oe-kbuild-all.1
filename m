Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD11D365
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 00:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685319686; x=1716855686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FrKLAS13+/VNQRhyPEohz8/TxVP+Rc5bD4UznjpzEMk=;
  b=JCuIQtu0bEqWTOR7w2dc9xX8+gi7yqKcdx3bNGXWlSXsmQoZVY7PDCri
   AH2JN+8ArqlKrgAfgv7920JqgF6ymyhV6M+OcjJp8W0aWU8bm0Zz6g4xY
   +HpgVkzCuyrhA1idzuPrcl/G/f3IhQfjK+AKWHTBgyZT443hlR7U6Kxmm
   yGAWJr+TbCZ9XdAcCDWIVmBOqOdQpR3SMbj/Nv8wdLwtpSgQteCtIAPPz
   bAaPHHCTBoPvFn/drQXW6P4to706yV7wCXQ86tgPxO2DbpAjZalSUnHIg
   hbnqhLh0j6qyhkFHrnnBvNUuy+QqjqFXdfgbCsYTx7YcaMXNnhBd0wEvr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="418060164"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="418060164"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 17:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="818227499"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; 
   d="scan'208";a="818227499"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 May 2023 17:21:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3QdY-000Ko2-0E;
	Mon, 29 May 2023 00:21:24 +0000
Date: Mon, 29 May 2023 08:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool:
 sja1105_fast_age() falls through to next function
 sja1105_mgmt_xmit.constprop.0.isra.0.cold()
Message-ID: <202305290847.9YCDpIU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7877cb91f1081754a1487c144d85dc0d2e2e7fc4
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   4 months ago
config: x86_64-randconfig-x056-20230529 (https://download.01.org/0day-ci/archive/20230529/202305290847.9YCDpIU4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c27cd083cfb9d392f304657ed00fcde1136704e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c27cd083cfb9d392f304657ed00fcde1136704e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290847.9YCDpIU4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105_main.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_mgmt_xmit.constprop.0.isra.0.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
