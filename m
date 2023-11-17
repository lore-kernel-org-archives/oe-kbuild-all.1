Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED430663
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeJf50bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700229756; x=1731765756;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pHMl1guyM1Tg9dVaZxGSkTBwxEu0VA2XpsyyjKDpcJg=;
  b=JeJf50bPXQItAwVzXfnUfxfL2HX8We/pwNfmd3z0RsCXrWGiw/1ACAj3
   96vUymnS5VDWwWDd9JlRYjkPIsjCPs+L08WTxvLPT1X0Ud49OY8A4oG0K
   hSztzoVQxhjgZD9v8I4zNwCeu9Q0/wazCm1YkU0v5/r6xHi3IKQGv+EOZ
   fOswTnMCKhn6/GgoSvkM2GrNXeucZD+b74b+j2fGJNRed4gRUq5Li9ZjJ
   3Ww2/7Ven1UbRfCqHByJzfxMq72bWDGXsSYhA5mvWPT81Bmt8ifkuD5b5
   IdYBEE9Q3BlOvgf+m/Fjo28yyEQEZiFs4O52rtWvTGiuUK7GbKxS2PWYb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4449031"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4449031"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 06:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889252178"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="889252178"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 06:02:33 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3zQU-0002q3-34;
	Fri, 17 Nov 2023 14:02:31 +0000
Date: Fri, 17 Nov 2023 22:02:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 13/21] drivers/firmware/ti_sci.c:136:
 warning: Function parameter or member 'nr_wakeup_sources' not described in
 'ti_sci_info'
Message-ID: <202311172158.Ayv7Xepv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3d320fa61172b4a33d1c11e57374cc6880562ae0
commit: 241d614821ca8e89f972dbc95047dcabc7f82130 [13/21] firmware: ti_sci: Partial-IO support
config: arm64-randconfig-001-20231117 (https://download.01.org/0day-ci/archive/20231117/202311172158.Ayv7Xepv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172158.Ayv7Xepv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172158.Ayv7Xepv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/ti_sci.c:136: warning: Function parameter or member 'nr_wakeup_sources' not described in 'ti_sci_info'
>> drivers/firmware/ti_sci.c:136: warning: Function parameter or member 'wakeup_source_nodes' not described in 'ti_sci_info'
>> drivers/firmware/ti_sci.c:136: warning: Function parameter or member 'sys_off_handler' not described in 'ti_sci_info'
   drivers/firmware/ti_sci.c:2230: warning: Excess function parameter 'vint_irq' description in 'ti_sci_cmd_set_irq'
   drivers/firmware/ti_sci.c:2278: warning: Excess function parameter 'vint_irq' description in 'ti_sci_cmd_free_irq'
   drivers/firmware/ti_sci.c:2874: warning: Function parameter or member 'bootvector' not described in 'ti_sci_cmd_proc_set_config'
   drivers/firmware/ti_sci.c:2990: warning: Function parameter or member 'bv' not described in 'ti_sci_cmd_proc_get_status'
   drivers/firmware/ti_sci.c:2990: warning: Function parameter or member 'cfg_flags' not described in 'ti_sci_cmd_proc_get_status'
   drivers/firmware/ti_sci.c:2990: warning: Function parameter or member 'ctrl_flags' not described in 'ti_sci_cmd_proc_get_status'
   drivers/firmware/ti_sci.c:2990: warning: Function parameter or member 'sts_flags' not described in 'ti_sci_cmd_proc_get_status'
   drivers/firmware/ti_sci.c:2990: warning: expecting prototype for ti_sci_cmd_get_boot_status(). Prototype was for ti_sci_cmd_proc_get_status() instead
   drivers/firmware/ti_sci.c:3515: warning: Function parameter or member 'sub_type' not described in 'devm_ti_sci_get_resource'
   drivers/firmware/ti_sci.c:3515: warning: Excess function parameter 'suub_type' description in 'devm_ti_sci_get_resource'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +136 drivers/firmware/ti_sci.c

aa276781a64a5f Nishanth Menon            2016-10-18   90  
aa276781a64a5f Nishanth Menon            2016-10-18   91  /**
aa276781a64a5f Nishanth Menon            2016-10-18   92   * struct ti_sci_info - Structure representing a TI SCI instance
aa276781a64a5f Nishanth Menon            2016-10-18   93   * @dev:	Device pointer
aa276781a64a5f Nishanth Menon            2016-10-18   94   * @desc:	SoC description for this instance
912cffb4ed8612 Nishanth Menon            2016-10-18   95   * @nb:	Reboot Notifier block
aa276781a64a5f Nishanth Menon            2016-10-18   96   * @d:		Debugfs file entry
aa276781a64a5f Nishanth Menon            2016-10-18   97   * @debug_region: Memory region where the debug message are available
aa276781a64a5f Nishanth Menon            2016-10-18   98   * @debug_region_size: Debug region size
aa276781a64a5f Nishanth Menon            2016-10-18   99   * @debug_buffer: Buffer allocated to copy debug messages.
aa276781a64a5f Nishanth Menon            2016-10-18  100   * @handle:	Instance of TI SCI handle to send to clients.
aa276781a64a5f Nishanth Menon            2016-10-18  101   * @cl:		Mailbox Client
aa276781a64a5f Nishanth Menon            2016-10-18  102   * @chan_tx:	Transmit mailbox channel
aa276781a64a5f Nishanth Menon            2016-10-18  103   * @chan_rx:	Receive mailbox channel
aa276781a64a5f Nishanth Menon            2016-10-18  104   * @minfo:	Message info
aa276781a64a5f Nishanth Menon            2016-10-18  105   * @node:	list head
e69a35531589a2 Nishanth Menon            2018-08-28  106   * @host_id:	Host ID
6c9da258f8012f Dave Gerlach              2023-04-13  107   * @ctx_mem_addr: Low power context memory phys address
6c9da258f8012f Dave Gerlach              2023-04-13  108   * @ctx_mem_buf: Low power context memory buffer
6c9da258f8012f Dave Gerlach              2023-04-13  109   * @fw_caps:	FW/SoC low power capabilities
aa276781a64a5f Nishanth Menon            2016-10-18  110   * @users:	Number of users of this instance
aa276781a64a5f Nishanth Menon            2016-10-18  111   */
aa276781a64a5f Nishanth Menon            2016-10-18  112  struct ti_sci_info {
aa276781a64a5f Nishanth Menon            2016-10-18  113  	struct device *dev;
912cffb4ed8612 Nishanth Menon            2016-10-18  114  	struct notifier_block nb;
aa276781a64a5f Nishanth Menon            2016-10-18  115  	const struct ti_sci_desc *desc;
aa276781a64a5f Nishanth Menon            2016-10-18  116  	struct dentry *d;
aa276781a64a5f Nishanth Menon            2016-10-18  117  	void __iomem *debug_region;
aa276781a64a5f Nishanth Menon            2016-10-18  118  	char *debug_buffer;
aa276781a64a5f Nishanth Menon            2016-10-18  119  	size_t debug_region_size;
aa276781a64a5f Nishanth Menon            2016-10-18  120  	struct ti_sci_handle handle;
aa276781a64a5f Nishanth Menon            2016-10-18  121  	struct mbox_client cl;
aa276781a64a5f Nishanth Menon            2016-10-18  122  	struct mbox_chan *chan_tx;
aa276781a64a5f Nishanth Menon            2016-10-18  123  	struct mbox_chan *chan_rx;
aa276781a64a5f Nishanth Menon            2016-10-18  124  	struct ti_sci_xfers_info minfo;
aa276781a64a5f Nishanth Menon            2016-10-18  125  	struct list_head node;
e69a35531589a2 Nishanth Menon            2018-08-28  126  	u8 host_id;
6c9da258f8012f Dave Gerlach              2023-04-13  127  	dma_addr_t ctx_mem_addr;
6c9da258f8012f Dave Gerlach              2023-04-13  128  	void *ctx_mem_buf;
6c9da258f8012f Dave Gerlach              2023-04-13  129  	u64 fw_caps;
aa276781a64a5f Nishanth Menon            2016-10-18  130  	/* protected by ti_sci_list_mutex */
aa276781a64a5f Nishanth Menon            2016-10-18  131  	int users;
241d614821ca8e Markus Schneider-Pargmann 2023-11-16  132  
241d614821ca8e Markus Schneider-Pargmann 2023-11-16  133  	int nr_wakeup_sources;
241d614821ca8e Markus Schneider-Pargmann 2023-11-16  134  	struct device_node **wakeup_source_nodes;
241d614821ca8e Markus Schneider-Pargmann 2023-11-16  135  	struct sys_off_handler *sys_off_handler;
aa276781a64a5f Nishanth Menon            2016-10-18 @136  };
aa276781a64a5f Nishanth Menon            2016-10-18  137  

:::::: The code at line 136 was first introduced by commit
:::::: aa276781a64a5f15ecc21e920960c5b1f84e5fee firmware: Add basic support for TI System Control Interface (TI-SCI) protocol

:::::: TO: Nishanth Menon <nm@ti.com>
:::::: CC: Tero Kristo <t-kristo@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
