Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25301D691
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695659437; x=1727195437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Dpxl8nzneKoGmLapRZomdk4+er8inqYj8xgRTzDNDA=;
  b=cTgmBSrG9RII9nt8oYq5TK+x5YckrjtXkz7e6y65Yt7t8rbEAyhc4aPk
   cdfwI33E0H0JIaVtQeVXQs7iK9KxU1Tr6ODFny+XZ134jqTptPTe5T8UW
   vBJ5FyzO/+17wXQsHWe9zu1yutWePtzHxJPTqdTkh6dM8LbSOI3T/k0xJ
   IjVHNHZdXi0RxNgvGlwksh+qZLcX0bjJM2MceKGPLfmbWSZO14bgpBRVZ
   G/dgyMxZL5K9nFCLLUl/fu3+DRdHhp864wkfaxRFWr5jpphslpwEFSpc0
   +Nsf6UmLJYQey78E0WfEqxN9BNVpwxQBQeQHCOhvK3bOcJoapJxwRAK2J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380168835"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="380168835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 09:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079270110"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="1079270110"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 09:30:33 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkoTf-0001mN-0Q;
	Mon, 25 Sep 2023 16:30:31 +0000
Date: Tue, 26 Sep 2023 00:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: kismet: WARNING: unmet direct dependencies detected for FIXED_PHY
 when selected by LAN743X
Message-ID: <202309260045.nVvxZdWb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6465e260f48790807eef06b583b38ca9789b6072
commit: 73c4d1b307aeb713e80ab03f90c7df9d417dc0f0 net: lan743x: select FIXED_PHY
date:   3 months ago
config: i386-kismet-CONFIG_FIXED_PHY-CONFIG_LAN743X-0-0 (https://download.01.org/0day-ci/archive/20230926/202309260045.nVvxZdWb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260045.nVvxZdWb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260045.nVvxZdWb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FIXED_PHY when selected by LAN743X
   .config:5306:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   .config:13319:warning: symbol value 'ONFIG_NR_CPUS_DEFAUL' invalid for NR_CPUS
   
   WARNING: unmet direct dependencies detected for FIXED_PHY
     Depends on [n]: NETDEVICES [=y] && PHYLIB [=n]
     Selected by [y]:
     - LAN743X [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_MICROCHIP [=y] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
