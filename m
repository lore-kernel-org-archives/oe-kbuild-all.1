Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E21C2E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689753930; x=1721289930;
  h=date:from:cc:subject:message-id:mime-version;
  bh=R1zCuz3TVKZ9c0QPowY39vtpccFWu4qjgvnYhzUYIwk=;
  b=nBrVcHu46EAX5EDlSUpQcllgHccdEjKvXlxDPDx5RcVRfQ0zBPqMTrTn
   O6YjAKkeEyxFjzVuFwg7nX6PUzvm4yYK2haZHI6IASWKpq2nKhCEh9pyq
   8CqzKKHmEEki8pRJf4Mwlr6fZ37dwWYXuhuqn264bED+6XDw6EYv553Zq
   tSWGJLAZVOR+muVo7uJSWntK/KyqlEVgwzRqdVDripbQ8DsJ1bAUZSX+X
   XdAcIrmkVzjBmcx0GAGBCussuwpI1kGVX+5j+MHj9ZpBxOrMYuOT8akPg
   BcT6pbTJhRLM0ILlegcKd3bAQdWVpIXU5bKF00Iz8S6sWpSt6o3ALuEtJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369960645"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="369960645"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 01:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897827897"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="897827897"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 01:05:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM2BZ-0004Hp-1Y;
	Wed, 19 Jul 2023 08:05:25 +0000
Date: Wed, 19 Jul 2023 16:04:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y-cicd 467/1075]
 drivers/pinctrl/pinctrl-tps6594.c:(.text.pinconf_generic_dt_node_to_map_group+0x34):
 undefined reference to `pinconf_generic_dt_node_to_map'
Message-ID: <202307191540.O5NTWWu8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Esteban,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-linux-6.1.y-cicd
head:   8f34b48aa6dc9472429ce75bd16614ea69c29f56
commit: 14a4e50b95e8ae8def357ca3180355eb39dd4909 [467/1075] TI: pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: mips-randconfig-r022-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191540.O5NTWWu8-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191540.O5NTWWu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191540.O5NTWWu8-lkp@intel.com/

All errors (new ones prefixed by >>):

   mipsel-linux-ld: drivers/pinctrl/pinctrl-tps6594.o: in function `pinconf_generic_dt_node_to_map_group':
>> drivers/pinctrl/pinctrl-tps6594.c:(.text.pinconf_generic_dt_node_to_map_group+0x34): undefined reference to `pinconf_generic_dt_node_to_map'
>> mipsel-linux-ld: drivers/pinctrl/pinctrl-tps6594.o:(.rodata.tps6594_pctrl_ops+0x14): undefined reference to `pinconf_generic_dt_free_map'
   mipsel-linux-ld: drivers/hid/hid-core.o: in function `hid_add_field':
   drivers/hid/hid-core.c:(.text.hid_add_field+0x168): undefined reference to `uhid_hid_driver'
   mipsel-linux-ld: drivers/hid/hid-core.c:(.text.hid_add_field+0x170): undefined reference to `uhid_hid_driver'
   mipsel-linux-ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
   drivers/hid/hid-core.c:(.text.hid_report_raw_event+0xb8): undefined reference to `uhid_hid_driver'
   mipsel-linux-ld: drivers/hid/hid-core.c:(.text.hid_report_raw_event+0xc0): undefined reference to `uhid_hid_driver'
   mipsel-linux-ld: drivers/hid/hid-core.o: in function `hid_hw_raw_request':
   drivers/hid/hid-core.c:(.text.hid_hw_raw_request+0x4): undefined reference to `uhid_hid_driver'
   mipsel-linux-ld: drivers/hid/hid-core.o:drivers/hid/hid-core.c:(.text.hid_hw_raw_request+0x10): more undefined references to `uhid_hid_driver' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
