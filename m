Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71363C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 06:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685427613; x=1716963613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AkWJCWU4Kng67BTiJg9ERwodUID9nIDgrcDyaML5RRs=;
  b=V2tLWGwR+mgjnsgCTTywqrZ503cw1DB0BXG1czq6QtwsKVFZ6AjQs0pu
   1UoL9gaWbX807Jan3IvZvqsbr6A13UD45QdzwdXKy8jMB76pve/Qd3Tgl
   3UpV5dx1s+zOh71c81e0OgSn66uh4P/FvBpJhdSMuOrb1gbjLFNwttsOM
   WgH8+msKx+9e7Oy342Q3zvkx6m5dtm1lBGesWTRyS4qm42ti7faWa94q5
   E7A4TvUwRoPxhL1bLTKVxzxqlSo0u8THRqCPetIswuGGhFoq2QSHOEUFU
   O4wvm4J9/kN8ZnDia/af4GFKvaTKsaqoDfiMlYYWvU+Qyf13NqJgFI1OT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="353672069"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="353672069"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 23:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="776171628"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="776171628"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 May 2023 23:20:11 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3siI-0000Aa-2t;
	Tue, 30 May 2023 06:20:10 +0000
Date: Tue, 30 May 2023 14:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 3567/3741]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: warning: 'rtl819xp_ops'
 defined but not used
Message-ID: <202305301459.GR9VPGsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   aa17ef53676edbc7f175ea14fe2b68a9ad013130
commit: ec310591cf839653a5b2c1fcf6b8a110c3f2485c [3567/3741] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230530/202305301459.GR9VPGsZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=ec310591cf839653a5b2c1fcf6b8a110c3f2485c
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout ec310591cf839653a5b2c1fcf6b8a110c3f2485c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/rtl8192e/rtl8192e/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301459.GR9VPGsZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: warning: 'rtl819xp_ops' defined but not used [-Wunused-const-variable=]
      28 | static const struct rtl819x_ops rtl819xp_ops = {
         |                                 ^~~~~~~~~~~~


vim +/rtl819xp_ops +28 drivers/staging/rtl8192e/rtl8192e/rtl_core.c

94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  27  
1c099ed63f8363 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Julia Lawall       2016-09-11 @28  static const struct rtl819x_ops rtl819xp_ops = {
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  29  	.nic_type			= NIC_8192E,
b095be37004f91 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  30  	.get_eeprom_size		= rtl92e_get_eeprom_size,
df85a1313fee7d drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  31  	.init_adapter_variable		= rtl92e_init_variables,
460266292de1c3 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  32  	.initialize_adapter		= rtl92e_start_adapter,
b974b289c4cb8a drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  33  	.link_change			= rtl92e_link_change,
072b3948d473f8 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  34  	.tx_fill_descriptor		= rtl92e_fill_tx_desc,
63b544a17c63c0 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  35  	.tx_fill_cmd_descriptor		= rtl92e_fill_tx_cmd_desc,
7897285ceb2864 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  36  	.rx_query_status_descriptor	= rtl92e_get_rx_stats,
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  37  	.rx_command_packet_handler = NULL,
fe99c77b44e41c drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  38  	.stop_adapter			= rtl92e_stop_adapter,
575d48c5753246 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  39  	.update_ratr_table		= rtl92e_update_ratr_table,
6d99c68e6f5024 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  40  	.irq_enable			= rtl92e_enable_irq,
baadea565daae4 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  41  	.irq_disable			= rtl92e_disable_irq,
dc578b417facae drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  42  	.irq_clear			= rtl92e_clear_irq,
78c352b2b22348 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  43  	.rx_enable			= rtl92e_enable_rx,
6af7a8b662f6bb drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  44  	.tx_enable			= rtl92e_enable_tx,
a57165d15dae6f drivers/staging/rtl8192e/rtl8192e/rtl_core.c Mateusz Kulikowski 2015-07-19  45  	.interrupt_recognized		= rtl92e_ack_irq,
254d6fca9d38f9 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Philipp Hortmann   2022-08-24  46  	.tx_check_stuck_handler	= rtl92e_is_tx_stuck,
254d6fca9d38f9 drivers/staging/rtl8192e/rtl8192e/rtl_core.c Philipp Hortmann   2022-08-24  47  	.rx_check_stuck_handler	= rtl92e_is_rx_stuck,
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  48  };
94a799425eee82 drivers/staging/rtl8192e/rtl_core.c          Larry Finger       2011-08-23  49  

:::::: The code at line 28 was first introduced by commit
:::::: 1c099ed63f8363228a0b075a25511c9feb90e03f staging: rtl8192e: constify local structures

:::::: TO: Julia Lawall <Julia.Lawall@lip6.fr>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
