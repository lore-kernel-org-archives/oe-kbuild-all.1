Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4D14F6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695374761; x=1726910761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJxNMs6leX9yPPHruYqFso3LB1WZbu07e94JRfjBR8g=;
  b=O/dWVgM+BAlgGEcSUGVCZu9hKX2gkk70v7rIgUKLwTa1K5j5hT2zjaq4
   E8Yc30rLp/JH0Tim8YxnrMi3fsyF+gXfZVaXyQmFyP0GtRlL0sMZTee/Q
   mnwFR+QaaF7i5d3av3Z2SA1Xc63OwrZBVawzAQ5TKbfdRDrUekmDWyjT1
   IR40RvPeAqzEZal4hSTSvcvdnfTFs94x9hjOlkfy78D9F67h7CBE1OYW5
   CpDXL9stSkAD6f+Pb9XcHSgTEzkaNA+wgBRRydFE/qP6amsMFNKxNrRzB
   wHRoD7rg41E+unUjihUHt0xYF/g283ef6tYOaSVPT7+vuYWuK2/vNxhsR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365841166"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="365841166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 02:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862878346"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="862878346"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2023 02:25:54 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjcQ4-0000TH-2C;
	Fri, 22 Sep 2023 09:25:52 +0000
Date: Fri, 22 Sep 2023 17:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Steen Hegelund <steen.hegelund@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8:
 Unneeded variable: "err". Return "  - ENOENT" on line 1450
Message-ID: <202309221718.XOjvU63U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: e1d597ecbe5c5d7128630d4c9ec27c42018613ed net: microchip: sparx5: Add TC template support
date:   7 months ago
config: csky-randconfig-r051-20230812 (https://download.01.org/0day-ci/archive/20230922/202309221718.XOjvU63U-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309221718.XOjvU63U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221718.XOjvU63U-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/microchip/sparx5/sparx5_tc_flower.c:1435:5-8: Unneeded variable: "err". Return "  - ENOENT" on line 1450

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
