Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3E1C3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686124132; x=1717660132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZtDnlUubo8/rWHoQl6dAvT2XuV+cIE4iujxcnlPNmEM=;
  b=Gue9DX9OrFR+/AVr3oYT1sK+IGN71xvooc7HnfDkJPOKeSC4bDdURNwH
   0aeJs+I4anybZXxDY/yT1NKOlHpmQ9Oa/5nihawE8xh10qg/if2OtSRF6
   csV1xi9n6tb5kJV5kvQIEVKe/xNrsLyJisXvoUIxlTUIsBHxpSi+oAvaQ
   6DhP3ER1BU2nrveI3XnypJSTKhPV1PPcdkJglul6ubwXxij8sBoRZuXxT
   ss7rHxdbYFuONV9YCV+QD0mKjOB4d+jxnNQWbLiFlxwUJxMP3asrXGENE
   GqhZ45WQZRhWUtTxO+QSQ173l1YLNF2IXsUMtpVtjpYxNL4bnAFMDsCeD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="443282152"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="443282152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 00:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659845408"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="659845408"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jun 2023 00:48:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6nuS-0006Kt-14;
	Wed, 07 Jun 2023 07:48:48 +0000
Date: Wed, 7 Jun 2023 15:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-stable 1764/2160]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: error: 'rtl819xp_ops'
 defined but not used
Message-ID: <202306071504.3W3mGNNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable
head:   cf2e1dca2069cc2209ac8aa55b2f686c80d272fe
commit: 21d58e5ac3062e931d9f5a9eb58a6caacb910856 [1764/2160] staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230607/202306071504.3W3mGNNn-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=21d58e5ac3062e931d9f5a9eb58a6caacb910856
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-stable
        git checkout 21d58e5ac3062e931d9f5a9eb58a6caacb910856
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/staging/rtl8192e/rtl8192e/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071504.3W3mGNNn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: error: 'rtl819xp_ops' defined but not used [-Werror=unused-const-variable=]
      28 | static const struct rtl819x_ops rtl819xp_ops = {
         |                                 ^~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
