Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C2B7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 22:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692917872; x=1724453872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkBZYc48IcEY3PXQ7afACY8LJPGKvntGMNtFL/E4ixY=;
  b=DXxn4wPYsLylDmf3duE20Z9ElphcANSWHGJB2B0OdanhxqC2WH6eDCBN
   IP+pDFSIfgtsrIT3limnvMxfuRlmmSThc9Q/aa3D5VNizHUIktwkN5IdV
   QgIHY+7nXX+c+pLPI9GGrCSQioDkIUN0KqW4haOV+y7M/Rd5Y0mePh49a
   TI44drfHuKRXxVI14rpSMUitsFcJX5ZiO67X6EghWFqTKW8df6MvRenlM
   ns+9JrcDkrzQeAZ85YBhSl3ALeoQoU2jvfxnEZ4fUCgoOQ5m1HRRwMCPl
   LyT+GzxeZdC/bivkPdrAK8XJkLe2W0R2z8SNsgDB6aztM5X4TjRAjgmMT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="371977381"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="371977381"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880945644"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 15:57:54 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZJGv-000320-0Y;
	Thu, 24 Aug 2023 22:57:49 +0000
Date: Fri, 25 Aug 2023 06:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 10436/12477] rt5033_charger.c:undefined reference
 to `extcon_get_state'
Message-ID: <202308250617.ue4uQxWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3bd393093b04d4882152398019cbb96b0440ff
commit: 12cc585f36b8dffa68b809c2d23a9bd73ee6ffd2 [10436/12477] power: supply: rt5033_charger: Add cable detection and USB OTG supply
config: arm-randconfig-r035-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250617.ue4uQxWa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250617.ue4uQxWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250617.ue4uQxWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/power/supply/rt5033_charger.o: in function `rt5033_charger_extcon_work':
>> rt5033_charger.c:(.text+0x150): undefined reference to `extcon_get_state'
   arm-linux-gnueabi-ld: drivers/power/supply/rt5033_charger.o: in function `rt5033_charger_probe':
>> rt5033_charger.c:(.text+0x920): undefined reference to `extcon_find_edev_by_node'
>> arm-linux-gnueabi-ld: rt5033_charger.c:(.text+0x9a0): undefined reference to `devm_extcon_register_notifier_all'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
