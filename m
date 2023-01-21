Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD76C29AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 23:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674343191; x=1705879191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrCzGHOHQyzxdOLMxKtsv/ct0AqgcyEmwShMvqUKNy0=;
  b=Ih/SQLJ1BicwxA0dvdwWBL17FD9PH4vslJ6liiaQxCbEsqBTZHtJJrZ2
   YCAomkeqttjZe1asHHrMg3v8er/41GjUudToIrNO9bY3kkx1o4pu0a6av
   B7Ut2mV+DNUIiyEi1hyCoVo3BuA2sFj/Hay2I3pSExwm6ic9TfvparLzy
   X1iwFb4Qa3QmzDLvMyIycBsMxb7tOIkcJEahOOR4XO4AG7n9nontTK9Vl
   1rhs4l6DgGh1XmEzpAvJLx45TCj9lR/tu1xJrf34l5BnqyuPov5Zehg/H
   EvBmG4FsML/Lhg24QJ3DR2XtMUHqzNpDxveYshwXMuI+JnBCqw5VieAPC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324532023"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324532023"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 15:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="906364192"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="906364192"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jan 2023 15:19:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJN9I-0004ZE-2B;
	Sat, 21 Jan 2023 23:19:48 +0000
Date: Sun, 22 Jan 2023 07:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2022.2/base 564/740]
 drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:190:19: error: 'struct
 axienet_local' has no member named 'timer_priv'
Message-ID: <202301220756.rnaPy382-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pranavi,

FYI, the error/warning still remains.

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: c2de8522c83296eaceb32cef3e0cb22e23259c98 [564/740] staging: xilinx-tsn: initialize timer_priv struct in axienet_local
config: xtensa-randconfig-p002-20230122 (https://download.01.org/0day-ci/archive/20230122/202301220756.rnaPy382-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout c2de8522c83296eaceb32cef3e0cb22e23259c98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/staging/xilinx-tsn/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c: In function 'axienet_tsn_select_queue':
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:84:24: warning: unused variable 'hdr' [-Wunused-variable]
      84 |         struct ethhdr *hdr = (struct ethhdr *)skb->data;
         |                        ^~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c: In function 'axienet_tsn_probe':
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:171:11: error: 'struct axienet_local' has no member named 'current_rx_filter'
     171 |         lp->current_rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
         |           ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:173:11: error: 'struct axienet_local' has no member named 'ptp_rx_irq'
     173 |         lp->ptp_rx_irq = platform_get_irq_byname(pdev, irq_name);
         |           ^~
   In file included from include/linux/kernel.h:19,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:19:
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:175:42: error: 'struct axienet_local' has no member named 'ptp_rx_irq'
     175 |         pr_info("ptp RX irq: %d %s\n", lp->ptp_rx_irq, irq_name);
         |                                          ^~
   include/linux/printk.h:418:33: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:519:9: note: in expansion of macro 'printk'
     519 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:175:9: note: in expansion of macro 'pr_info'
     175 |         pr_info("ptp RX irq: %d %s\n", lp->ptp_rx_irq, irq_name);
         |         ^~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:177:11: error: 'struct axienet_local' has no member named 'ptp_tx_irq'
     177 |         lp->ptp_tx_irq = platform_get_irq_byname(pdev, irq_name);
         |           ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:178:42: error: 'struct axienet_local' has no member named 'ptp_tx_irq'
     178 |         pr_info("ptp TX irq: %d %s\n", lp->ptp_tx_irq, irq_name);
         |                                          ^~
   include/linux/printk.h:418:33: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:519:9: note: in expansion of macro 'printk'
     519 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:178:9: note: in expansion of macro 'pr_info'
     178 |         pr_info("ptp TX irq: %d %s\n", lp->ptp_tx_irq, irq_name);
         |         ^~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:181:11: error: 'struct axienet_local' has no member named 'qbv_irq'
     181 |         lp->qbv_irq = platform_get_irq_byname(pdev, irq_name);
         |           ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:184:15: error: 'struct axienet_local' has no member named 'qbv_irq'
     184 |         if (lp->qbv_irq > 0)
         |               ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:185:47: error: 'struct axienet_local' has no member named 'qbv_irq'
     185 |                 pr_info("qbv_irq: %d %s\n", lp->qbv_irq, irq_name);
         |                                               ^~
   include/linux/printk.h:418:33: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:519:9: note: in expansion of macro 'printk'
     519 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:185:17: note: in expansion of macro 'pr_info'
     185 |                 pr_info("qbv_irq: %d %s\n", lp->qbv_irq, irq_name);
         |                 ^~~~~~~
>> drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:190:19: error: 'struct axienet_local' has no member named 'timer_priv'
     190 |                 lp->timer_priv = axienet_ptp_timer_probe((lp->regs + XAE_RTC_OFFSET), pdev);
         |                   ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:190:34: error: implicit declaration of function 'axienet_ptp_timer_probe'; did you mean 'axienet_tadma_probe'? [-Werror=implicit-function-declaration]
     190 |                 lp->timer_priv = axienet_ptp_timer_probe((lp->regs + XAE_RTC_OFFSET), pdev);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
         |                                  axienet_tadma_probe
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:190:70: error: 'XAE_RTC_OFFSET' undeclared (first use in this function); did you mean 'XAE_TC_OFFSET'?
     190 |                 lp->timer_priv = axienet_ptp_timer_probe((lp->regs + XAE_RTC_OFFSET), pdev);
         |                                                                      ^~~~~~~~~~~~~~
         |                                                                      XAE_TC_OFFSET
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:190:70: note: each undeclared identifier is reported only once for each function it appears in
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:158:23: warning: unused variable 'qbv_size' [-Wunused-variable]
     158 |         u32 qbv_addr, qbv_size;
         |                       ^~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:158:13: warning: unused variable 'qbv_addr' [-Wunused-variable]
     158 |         u32 qbv_addr, qbv_size;
         |             ^~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14:
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c: In function 'axienet_tsn_open':
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:22: error: 'struct axienet_local' has no member named 'tx_tstamp_work'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                      ^~
   include/linux/workqueue.h:228:30: note: in definition of macro '__INIT_WORK'
     228 |                 __init_work((_work), _onstack);                         \
         |                              ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:22: error: 'struct axienet_local' has no member named 'tx_tstamp_work'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                      ^~
   include/linux/workqueue.h:229:18: note: in definition of macro '__INIT_WORK'
     229 |                 (_work)->data = (atomic_long_t) WORK_DATA_INIT();       \
         |                  ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:22: error: 'struct axienet_local' has no member named 'tx_tstamp_work'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                      ^~
   include/linux/workqueue.h:230:36: note: in definition of macro '__INIT_WORK'
     230 |                 lockdep_init_map(&(_work)->lockdep_map, "(work_completion)"#_work, &__key, 0); \
         |                                    ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:22: error: 'struct axienet_local' has no member named 'tx_tstamp_work'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                      ^~
   include/linux/workqueue.h:231:34: note: in definition of macro '__INIT_WORK'
     231 |                 INIT_LIST_HEAD(&(_work)->entry);                        \
         |                                  ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:22: error: 'struct axienet_local' has no member named 'tx_tstamp_work'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                      ^~
   include/linux/workqueue.h:232:18: note: in definition of macro '__INIT_WORK'
     232 |                 (_work)->func = (_func);                                \
         |                  ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:40: error: 'axienet_tx_tstamp' undeclared (first use in this function); did you mean 'axienet_tsn_stop'?
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |                                        ^~~~~~~~~~~~~~~~~
   include/linux/workqueue.h:232:34: note: in definition of macro '__INIT_WORK'
     232 |                 (_work)->func = (_func);                                \
         |                                  ^~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:340:9: note: in expansion of macro 'INIT_WORK'
     340 |         INIT_WORK(&lp->tx_tstamp_work, axienet_tx_tstamp);
         |         ^~~~~~~~~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:341:32: error: 'struct axienet_local' has no member named 'ptp_txq'
     341 |         skb_queue_head_init(&lp->ptp_txq);
         |                                ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:343:11: error: 'struct axienet_local' has no member named 'ptp_rx_hw_pointer'
     343 |         lp->ptp_rx_hw_pointer = 0;
         |           ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:344:11: error: 'struct axienet_local' has no member named 'ptp_rx_sw_pointer'
     344 |         lp->ptp_rx_sw_pointer = 0xff;
         |           ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:346:25: error: 'PTP_RX_CONTROL_OFFSET' undeclared (first use in this function); did you mean 'PSFP_CONTROL_OFFSET'?
     346 |         axienet_iow(lp, PTP_RX_CONTROL_OFFSET, PTP_RX_PACKET_CLEAR);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         PSFP_CONTROL_OFFSET
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:346:48: error: 'PTP_RX_PACKET_CLEAR' undeclared (first use in this function); did you mean 'PTR_TO_PACKET_END'?
     346 |         axienet_iow(lp, PTP_RX_CONTROL_OFFSET, PTP_RX_PACKET_CLEAR);
         |                                                ^~~~~~~~~~~~~~~~~~~
         |                                                PTR_TO_PACKET_END
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:348:29: error: 'struct axienet_local' has no member named 'ptp_rx_irq'
     348 |         ret = request_irq(lp->ptp_rx_irq, axienet_ptp_rx_irq,
         |                             ^~
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:348:43: error: 'axienet_ptp_rx_irq' undeclared (first use in this function); did you mean 'axienet_rx_irq'?
     348 |         ret = request_irq(lp->ptp_rx_irq, axienet_ptp_rx_irq,
         |                                           ^~~~~~~~~~~~~~~~~~
         |                                           axienet_rx_irq
   drivers/staging/xilinx-tsn/xilinx_tsn_ip.c:353:29: error: 'struct axienet_local' has no member named 'ptp_tx_irq'


vim +190 drivers/staging/xilinx-tsn/xilinx_tsn_ip.c

   138	
   139	/**
   140	 * axienet_tsn_probe - TSN mac probe function.
   141	 * @pdev:	Pointer to platform device structure.
   142	 * @lp:		Pointer to axienet local structure
   143	 * @ndev:	Pointer to net_device structure.
   144	 *
   145	 * Return: 0, on success
   146	 *	    Non-zero error value on failure.
   147	 *
   148	 * This is the probe for TSN mac nodes.
   149	 */
   150	int axienet_tsn_probe(struct platform_device *pdev,
   151			      struct axienet_local *lp,
   152			      struct net_device *ndev)
   153	{
   154		int ret = 0;
   155		char irq_name[32];
   156		bool slave = false;
   157		u8     temac_no;
   158		u32 qbv_addr, qbv_size;
   159		struct device_node *ep_node;
   160		struct axienet_local *ep_lp;
   161	
   162		slave = of_property_read_bool(pdev->dev.of_node,
   163					      "xlnx,tsn-slave");
   164		if (slave) {
   165			temac_no = XAE_TEMAC2;
   166			lp->switch_prt = PORT_MAC2;
   167		} else {
   168			temac_no = XAE_TEMAC1;
   169			lp->switch_prt = PORT_MAC1;
   170		}
   171		lp->current_rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
   172		sprintf(irq_name, "interrupt_ptp_rx_%d", temac_no + 1);
   173		lp->ptp_rx_irq = platform_get_irq_byname(pdev, irq_name);
   174	
   175		pr_info("ptp RX irq: %d %s\n", lp->ptp_rx_irq, irq_name);
   176		sprintf(irq_name, "interrupt_ptp_tx_%d", temac_no + 1);
   177		lp->ptp_tx_irq = platform_get_irq_byname(pdev, irq_name);
   178		pr_info("ptp TX irq: %d %s\n", lp->ptp_tx_irq, irq_name);
   179	
   180		sprintf(irq_name, "tsn_switch_scheduler_irq_%d", temac_no + 1);
   181		lp->qbv_irq = platform_get_irq_byname(pdev, irq_name);
   182	
   183		/*Ignoring if the qbv_irq is not exist*/
   184		if (lp->qbv_irq > 0)
   185			pr_info("qbv_irq: %d %s\n", lp->qbv_irq, irq_name);
   186	
   187		spin_lock_init(&lp->ptp_tx_lock);
   188	
   189		if (temac_no == XAE_TEMAC1)
 > 190			lp->timer_priv = axienet_ptp_timer_probe((lp->regs + XAE_RTC_OFFSET), pdev);
   191	
   192		/* enable VLAN */
   193		lp->options |= XAE_OPTION_VLAN;
   194		axienet_setoptions_tsn(lp->ndev, lp->options);
   195	
   196		/* get the ep device */
   197		ep_node = of_parse_phandle(pdev->dev.of_node, "tsn,endpoint", 0);
   198	
   199		if (ep_node)
   200			lp->master = of_find_net_device_by_node(ep_node);
   201	
   202		lp->abl_reg = axienet_ior(lp, XAE_TSN_ABL_OFFSET);
   203	
   204		/* in ep only case tie the data path to eth1 */
   205		if (lp->abl_reg & TSN_BRIDGEEP_EPONLY && temac_no == XAE_TEMAC1) {
   206			axienet_get_pcp_mask(lp, lp->num_tc);
   207			ret = tsn_mcdma_probe(pdev, lp, ndev);
   208			if (ret) {
   209				dev_err(&pdev->dev, "Getting MCDMA resource failed\n");
   210				goto err_1;
   211			}
   212	#ifdef CONFIG_AXIENET_HAS_TADMA
   213			ret = axienet_tadma_probe(pdev, ndev);
   214			if (ret) {
   215				dev_err(&pdev->dev, "Getting TADMA resource failed\n");
   216				goto err_1;
   217			}
   218	#endif
   219		}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
