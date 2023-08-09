Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F01FA4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 05:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691557825; x=1723093825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctZansBwQGdUWEauEWf9IzJSKSn1O/dOH4MGa5P0DI4=;
  b=mfwkmQhcAE8OmVVOxZgzeiHkrzM4vCkzzXBl1rStODokVLozuwCE5etx
   GRODirM0wrrKsPCxDDy0PeK8iH0Qea46CzChJrE3yMocV6FNSFOouO1/p
   vbG93OajcZV+5me8vxJNH3tL6qear8WElltQ2THwvBJWd2rDKsR57aDfq
   inbzPTBi9J5aMtdhHvuts3VLYcSBcGkgEpixfRnNxBCXcHK7/NRPHq+w3
   tTnmNN9qANu7R6U1r7QOLIvoyqr1RvOCIpPcWi2DyS0N3FDsmNlkh2cMg
   qzQpnBaV7fWn1woe62VnF6iRpIVU8zN7eDKP/+x7n++7vqakwt0tZy93f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361147727"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="361147727"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 22:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978238267"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="978238267"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 22:10:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTbSf-0005oe-2v;
	Wed, 09 Aug 2023 05:10:21 +0000
Date: Wed, 9 Aug 2023 13:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 54/67]
 net/llc/sysctl_net_llc.c:54:38: error: invalid initializer
Message-ID: <202308091247.2TDB6Wte-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   8958c484809b25f8d552560d679fcb6bdd441c88
commit: 8ab9c9bf315ce95177e9a7cac46d7aa95d3fec7b [54/67] networking: rm sentinel element from ctl_table array
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308091247.2TDB6Wte-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091247.2TDB6Wte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091247.2TDB6Wte-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/llc/sysctl_net_llc.c: In function 'llc_sysctl_init':
>> net/llc/sysctl_net_llc.c:54:38: error: invalid initializer
      54 |         struct ctl_table empty[1] = {0};
         |                                      ^
   net/llc/sysctl_net_llc.c:54:38: note: (near initialization for 'empty[0].<anonymous>')


vim +54 net/llc/sysctl_net_llc.c

    51	
    52	int __init llc_sysctl_init(void)
    53	{
  > 54		struct ctl_table empty[1] = {0};
    55		llc2_timeout_header = register_net_sysctl(&init_net, "net/llc/llc2/timeout", llc2_timeout_table);
    56		llc_station_header = __register_sysctl_table(&init_net.sysctls,
    57							     "net/llc/station", empty, 0);
    58	
    59		if (!llc2_timeout_header || !llc_station_header) {
    60			llc_sysctl_exit();
    61			return -ENOMEM;
    62		}
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
