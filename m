Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011BA925
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692954465; x=1724490465;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LFCtDsNlOvLxVf/CNIJMiosp5TNYTG2s1cx9Tl/zV0M=;
  b=TtHeuFKVn73+KMP7+Nu9t4z8bsfKlTLk11w+kfM2B4vklAYenMgZUWpz
   MZV7pchcfjtBRJFDQ0Uwu5t/ydbQQOh48p+827uJCCeec85ro5m1oPP/G
   rZI3wwose/1stwsTmnEhsJMZgt2qfNFF4Jy5rrlmkj1A4hEm2n7pxrwqc
   /uAo5H4BPourMim7hA9ZcMRknl1DHn5saaHNwzVC492qcO/ozwY2g6UTd
   ek8o0f/D1H/xJHhAEpebQU+VJm8EH77A/uXVoQXWiCyF6UyZrL7SZJyht
   D0o8cYyMTl7r9HPZTDuJmEfATFaLe5GKjF/wfkO2evoQ5wI9rDXnAbLGJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441017218"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="441017218"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 02:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="984042472"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="984042472"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 02:07:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZSn8-0003Ng-12;
	Fri, 25 Aug 2023 09:07:42 +0000
Date: Fri, 25 Aug 2023 17:07:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 56/79] ld:
 drivers/pinctrl/pinctrl-tps6594.o:undefined reference to
 `pinconf_generic_dt_free_map'
Message-ID: <202308251708.OeemC3sS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 7cda4826851d6659c41427fe84be1084c5aa15c1 [56/79] pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: i386-randconfig-r022-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251708.OeemC3sS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251708.OeemC3sS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251708.OeemC3sS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt_node_to_map_group':
   include/linux/pinctrl/pinconf-generic.h:203: undefined reference to `pinconf_generic_dt_node_to_map'
>> ld: drivers/pinctrl/pinctrl-tps6594.o:(.rodata+0x14): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
