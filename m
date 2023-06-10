Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724FD1119
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686357904; x=1717893904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPXIBiA1lxvd1J3/4h1GNX8TE0Ul8CTDtvl8N8BFH28=;
  b=aQfDt67ixeI69tKX4FspfOM6Y3D4YpwHq/6tAv4ngg/5eW+EyW+CyRQv
   e75pT5/81lAjdrYViL1NXC0Nj4Ebet9Gt+ege4Msi+jWrF8fnQdwzFIW3
   EOJwmpVE60cXHBayQTl+14XSCuG/2OPExdKdN88QeoglyQhUA8/0GGXdk
   pl39rM0xkEv/hmEZ9VXF9AYP2a0X60tRUhvgj3IMUhH1g7St7+uGBC3ZC
   +9xlaffL8n0zAT5KL/isDc4gKlq1tbRmPeOFYUw1H1ASgtyR609bqNXi+
   FD9PWyUzhuw6pML49vDeKWgyomnIep4dhQjCl5ROhCG+0ozs1bziUepfQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="356607368"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="356607368"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823245587"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="823245587"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 17:45:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mix-0009YQ-0w;
	Sat, 10 Jun 2023 00:44:59 +0000
Date: Sat, 10 Jun 2023 08:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Hancock <robert.hancock@calian.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [stable:linux-4.19.y 1539/6240]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:283:9: error: 'ret'
 undeclared; did you mean 'net'?
Message-ID: <202306100819.Q0MtdhZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   7625843c7c86dd2d5d4bcbbc06da8cba49d09a5b
commit: 8b8ad8a7ac24905937c3975b54c4594b93b66ebb [1539/6240] net: axienet: Wait for PhyRstCmplt after core reset
config: microblaze-randconfig-c043-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100819.Q0MtdhZ6-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=8b8ad8a7ac24905937c3975b54c4594b93b66ebb
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 8b8ad8a7ac24905937c3975b54c4594b93b66ebb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/net/ethernet/xilinx/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100819.Q0MtdhZ6-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                         ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/if_vlan.h:584:25: note: in expansion of macro 'if'
     584 |                         if (unlikely(!vh || !--parse_depth))
         |                         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/if_vlan.h:584:29: note: in expansion of macro 'unlikely'
     584 |                         if (unlikely(!vh || !--parse_depth))
         |                             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/if_vlan.h:584:25: note: in expansion of macro 'if'
     584 |                         if (unlikely(!vh || !--parse_depth))
         |                         ^~
   include/linux/if_vlan.h: In function 'skb_vlan_tagged':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/if_vlan.h:667:9: note: in expansion of macro 'if'
     667 |         if (!skb_vlan_tag_present(skb) &&
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/if_vlan.h:668:13: note: in expansion of macro 'likely'
     668 |             likely(!eth_type_vlan(skb->protocol)))
         |             ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/if_vlan.h:667:9: note: in expansion of macro 'if'
     667 |         if (!skb_vlan_tag_present(skb) &&
         |         ^~
   include/linux/if_vlan.h: In function 'skb_vlan_tagged_multi':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/if_vlan.h:688:17: note: in expansion of macro 'if'
     688 |                 if (likely(!eth_type_vlan(protocol)))
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/if_vlan.h:688:21: note: in expansion of macro 'likely'
     688 |                 if (likely(!eth_type_vlan(protocol)))
         |                     ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/if_vlan.h:688:17: note: in expansion of macro 'if'
     688 |                 if (likely(!eth_type_vlan(protocol)))
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/if_vlan.h:691:17: note: in expansion of macro 'if'
     691 |                 if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN)))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/if_vlan.h:691:21: note: in expansion of macro 'unlikely'
     691 |                 if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN)))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/if_vlan.h:691:17: note: in expansion of macro 'if'
     691 |                 if (unlikely(!pskb_may_pull(skb, VLAN_ETH_HLEN)))
         |                 ^~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_dma_bd_init':
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:283:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     283 |         ret = read_poll_timeout(axienet_ior, value,
         |         ^~~
         |         net
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:283:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:283:15: error: implicit declaration of function 'read_poll_timeout' [-Werror=implicit-function-declaration]
     283 |         ret = read_poll_timeout(axienet_ior, value,
         |               ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:283:46: error: 'value' undeclared (first use in this function)
     283 |         ret = read_poll_timeout(axienet_ior, value,
         |                                              ^~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_open':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:134:9: note: in expansion of macro 'if'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:118:9: note: in expansion of macro 'unlikely'
     118 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:134:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1461:9: note: in expansion of macro 'dynamic_dev_dbg'
    1461 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:941:9: note: in expansion of macro 'dev_dbg'
     941 |         dev_dbg(&ndev->dev, "axienet_open()\n");
         |         ^~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:134:9: note: in expansion of macro 'if'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/device.h:1461:9: note: in expansion of macro 'dynamic_dev_dbg'
    1461 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:941:9: note: in expansion of macro 'dev_dbg'
     941 |         dev_dbg(&ndev->dev, "axienet_open()\n");
         |         ^~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c: In function 'axienet_stop':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:134:9: note: in expansion of macro 'if'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:118:9: note: in expansion of macro 'unlikely'
     118 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT)
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:134:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:1461:9: note: in expansion of macro 'dynamic_dev_dbg'
    1461 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1011:9: note: in expansion of macro 'dev_dbg'
    1011 |         dev_dbg(&ndev->dev, "axienet_close()\n");
         |         ^~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:134:9: note: in expansion of macro 'if'
     134 |         if (DYNAMIC_DEBUG_BRANCH(descriptor))                   \
         |         ^~
   include/linux/device.h:1461:9: note: in expansion of macro 'dynamic_dev_dbg'
    1461 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1011:9: note: in expansion of macro 'dev_dbg'
    1011 |         dev_dbg(&ndev->dev, "axienet_close()\n");
         |         ^~~~~~~
   cc1: some warnings being treated as errors


vim +283 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

   178	
   179	/**
   180	 * axienet_dma_bd_init - Setup buffer descriptor rings for Axi DMA
   181	 * @ndev:	Pointer to the net_device structure
   182	 *
   183	 * Return: 0, on success -ENOMEM, on failure
   184	 *
   185	 * This function is called to initialize the Rx and Tx DMA descriptor
   186	 * rings. This initializes the descriptors with required default values
   187	 * and is called when Axi Ethernet driver reset is called.
   188	 */
   189	static int axienet_dma_bd_init(struct net_device *ndev)
   190	{
   191		u32 cr;
   192		int i;
   193		struct sk_buff *skb;
   194		struct axienet_local *lp = netdev_priv(ndev);
   195	
   196		/* Reset the indexes which are used for accessing the BDs */
   197		lp->tx_bd_ci = 0;
   198		lp->tx_bd_tail = 0;
   199		lp->rx_bd_ci = 0;
   200	
   201		/* Allocate the Tx and Rx buffer descriptors. */
   202		lp->tx_bd_v = dma_zalloc_coherent(ndev->dev.parent,
   203						  sizeof(*lp->tx_bd_v) * TX_BD_NUM,
   204						  &lp->tx_bd_p, GFP_KERNEL);
   205		if (!lp->tx_bd_v)
   206			goto out;
   207	
   208		lp->rx_bd_v = dma_zalloc_coherent(ndev->dev.parent,
   209						  sizeof(*lp->rx_bd_v) * RX_BD_NUM,
   210						  &lp->rx_bd_p, GFP_KERNEL);
   211		if (!lp->rx_bd_v)
   212			goto out;
   213	
   214		for (i = 0; i < TX_BD_NUM; i++) {
   215			lp->tx_bd_v[i].next = lp->tx_bd_p +
   216					      sizeof(*lp->tx_bd_v) *
   217					      ((i + 1) % TX_BD_NUM);
   218		}
   219	
   220		for (i = 0; i < RX_BD_NUM; i++) {
   221			lp->rx_bd_v[i].next = lp->rx_bd_p +
   222					      sizeof(*lp->rx_bd_v) *
   223					      ((i + 1) % RX_BD_NUM);
   224	
   225			skb = netdev_alloc_skb_ip_align(ndev, lp->max_frm_size);
   226			if (!skb)
   227				goto out;
   228	
   229			lp->rx_bd_v[i].sw_id_offset = (u32) skb;
   230			lp->rx_bd_v[i].phys = dma_map_single(ndev->dev.parent,
   231							     skb->data,
   232							     lp->max_frm_size,
   233							     DMA_FROM_DEVICE);
   234			lp->rx_bd_v[i].cntrl = lp->max_frm_size;
   235		}
   236	
   237		/* Start updating the Rx channel control register */
   238		cr = axienet_dma_in32(lp, XAXIDMA_RX_CR_OFFSET);
   239		/* Update the interrupt coalesce count */
   240		cr = ((cr & ~XAXIDMA_COALESCE_MASK) |
   241		      ((lp->coalesce_count_rx) << XAXIDMA_COALESCE_SHIFT));
   242		/* Update the delay timer count */
   243		cr = ((cr & ~XAXIDMA_DELAY_MASK) |
   244		      (XAXIDMA_DFT_RX_WAITBOUND << XAXIDMA_DELAY_SHIFT));
   245		/* Enable coalesce, delay timer and error interrupts */
   246		cr |= XAXIDMA_IRQ_ALL_MASK;
   247		/* Write to the Rx channel control register */
   248		axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET, cr);
   249	
   250		/* Start updating the Tx channel control register */
   251		cr = axienet_dma_in32(lp, XAXIDMA_TX_CR_OFFSET);
   252		/* Update the interrupt coalesce count */
   253		cr = (((cr & ~XAXIDMA_COALESCE_MASK)) |
   254		      ((lp->coalesce_count_tx) << XAXIDMA_COALESCE_SHIFT));
   255		/* Update the delay timer count */
   256		cr = (((cr & ~XAXIDMA_DELAY_MASK)) |
   257		      (XAXIDMA_DFT_TX_WAITBOUND << XAXIDMA_DELAY_SHIFT));
   258		/* Enable coalesce, delay timer and error interrupts */
   259		cr |= XAXIDMA_IRQ_ALL_MASK;
   260		/* Write to the Tx channel control register */
   261		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, cr);
   262	
   263		/* Populate the tail pointer and bring the Rx Axi DMA engine out of
   264		 * halted state. This will make the Rx side ready for reception.
   265		 */
   266		axienet_dma_out32(lp, XAXIDMA_RX_CDESC_OFFSET, lp->rx_bd_p);
   267		cr = axienet_dma_in32(lp, XAXIDMA_RX_CR_OFFSET);
   268		axienet_dma_out32(lp, XAXIDMA_RX_CR_OFFSET,
   269				  cr | XAXIDMA_CR_RUNSTOP_MASK);
   270		axienet_dma_out32(lp, XAXIDMA_RX_TDESC_OFFSET, lp->rx_bd_p +
   271				  (sizeof(*lp->rx_bd_v) * (RX_BD_NUM - 1)));
   272	
   273		/* Write to the RS (Run-stop) bit in the Tx channel control register.
   274		 * Tx channel is now ready to run. But only after we write to the
   275		 * tail pointer register that the Tx channel will start transmitting.
   276		 */
   277		axienet_dma_out32(lp, XAXIDMA_TX_CDESC_OFFSET, lp->tx_bd_p);
   278		cr = axienet_dma_in32(lp, XAXIDMA_TX_CR_OFFSET);
   279		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET,
   280				  cr | XAXIDMA_CR_RUNSTOP_MASK);
   281	
   282		/* Wait for PhyRstCmplt bit to be set, indicating the PHY reset has finished */
 > 283		ret = read_poll_timeout(axienet_ior, value,
   284					value & XAE_INT_PHYRSTCMPLT_MASK,
   285					DELAY_OF_ONE_MILLISEC, 50000, false, lp,
   286					XAE_IS_OFFSET);
   287		if (ret) {
   288			dev_err(lp->dev, "%s: timeout waiting for PhyRstCmplt\n", __func__);
   289			return ret;
   290		}
   291	
   292		return 0;
   293	out:
   294		axienet_dma_bd_release(ndev);
   295		return -ENOMEM;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
