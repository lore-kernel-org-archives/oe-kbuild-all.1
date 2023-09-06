Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872162B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 01:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693964836; x=1725500836;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TII1z0ocvoeDGXLtQhM+KI34tUd+PH4dZTRjqz9dTK4=;
  b=BC/vwp18dZ0cmlll6C5B6Oh266QX7W93t2FvOUb+4Ig6ef7a+Izc0ICE
   hIz7cZyqVaMaCsVak9S0mMTEyYsrLqkYn90kfSZyJJH9+aeu2PJt0Ie3y
   7jF463x6xvwEe2S2FKHxPKByYmrzLDgLIoJ6jepvh7OIxqFPGmttNasmH
   n/9LsagEn5k/OeNhGnT0PC8l32IYA1mxvUO8DoNGWAyTAam6osAMvN5cZ
   VMEPr+VKim6VDhP6Jlxh0j1AfK9l9P3gB48LkRhBfRS61RaJ113O9BZrS
   pCOLCLa9P2cXgkc7tRY+4NH7/XqibavP0OUa7j5VW0B/TAmfXSTnNjXGs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367162519"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="367162519"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 18:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="718059698"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="718059698"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 18:47:14 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdhdP-0002KR-32;
	Wed, 06 Sep 2023 01:47:11 +0000
Date: Wed, 6 Sep 2023 09:47:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382] ERROR: modpost:
 "phy_mipi_dphy_get_default_config_for_hsclk"
 [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!
Message-ID: <202309060942.xiuuBA4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6c7b09058d06625c8386decb5573da65e3c4ccfc
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-072-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060942.xiuuBA4a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060942.xiuuBA4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060942.xiuuBA4a-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk" [drivers/media/platform/cadence/cdns-csi2rx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
