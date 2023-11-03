Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EF78C05
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2PF7ker"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699003408; x=1730539408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UKF4yHvLsTDHBFzDY/OehueONcmx1m7S/EbTJbzOH/Y=;
  b=n2PF7ker2Xf7B2bm+EZQ7o978/eMPl0ewAv0DtyeWdlCdKOwwTsteGeK
   stUB7xqeHINMRmMh4LJRndn1Iq6n4XAGxDHh+eRMo7eW+xjwOGdnQBmrh
   8AbPNMzHFCY8egjAKGXKzwXAMeBf0Xw0nZN47R7VckEXbGy9TTT5Yt7yQ
   qO7pPYcJ5vVFexTMP4fSv5RmZ3lEsEefvxWT1mypk88CZeMJmgRe8RciP
   1WyIhpmXhwaKOkaHsv/JU0omzuSW+3VGmJebm32zLIt71t0/oBbUmRFBy
   nxl8AdxA7fDhhsJ0AeAXBpumlywbtAu9d1ibBbBGdmmcEERO7nwFek3J2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369117559"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="369117559"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9671046"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 02:23:21 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqOd-0002PQ-0b;
	Fri, 03 Nov 2023 09:23:19 +0000
Date: Fri, 3 Nov 2023 17:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Vikram Sethi <vsethi@nvidia.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
Message-ID: <202311031706.irbBcT0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
date:   7 months ago
config: arm-kismet-CONFIG_HAVE_ARM_SMCCC_DISCOVERY-CONFIG_ARM_GIC_V3-0-0 (https://download.01.org/0day-ci/archive/20231103/202311031706.irbBcT0N-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031706.irbBcT0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031706.irbBcT0N-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY when selected by ARM_GIC_V3
   .config:7014:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   
   WARNING: unmet direct dependencies detected for HAVE_ARM_SMCCC_DISCOVERY
     Depends on [n]: ARM_PSCI_FW [=n]
     Selected by [y]:
     - ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
