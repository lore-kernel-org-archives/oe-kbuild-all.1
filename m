Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75139A4F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674464875; x=1706000875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivnIyLVcBdg57VbNxrgSyhc+L6FFat9bLOr8u72Fo9c=;
  b=LIoYhu04CcHbLWB6DWXpod7csb/NQ01Q+TxdmQRDWCBsr5cXu5Q9RX4D
   RRcs5NvKNUNe4eERE37t4Zh9IUtj5F5Z9QjslcE1xhF3PNC0HMy9UwJPs
   FPj3qNbI2JnihdF+G80Su8C4/miYAg6BcqDjsE0uH/1ADxERKDIYXaiUh
   A6UPpMimnyR+inD2/hlXuIldbrRCVWYQv0sPRwF/W3O/heb3m35Ic1Wg1
   prQGkL5QTGG9++Xdh6x7JrGuX4qmCOgw+cs4Pyiy8Buf23sV4F8rXPNbQ
   QV9IRINib2Q4IesxEkUQh6vttMP/eqXwpTwJYGthACOWzkuzOIX+jj+Xt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="323690799"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="323690799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 01:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="724951709"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="724951709"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 01:07:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJsn7-0005XU-3D;
	Mon, 23 Jan 2023 09:07:01 +0000
Date: Mon, 23 Jan 2023 17:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 67/72]
 drivers/dma/xilinx/xilinx_dma.c:2663:22: error: implicit declaration of
 function 'devm_platform_ioremap_resource'; did you mean
 'devm_ioremap_resource'?
Message-ID: <202301231741.GfnElWgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Radhey,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   63b7af8b6594d0f0bf80efe27747e0470b8ad027
commit: 8b8d41254a7ec46f5eeb0a22e90c82a92d28d324 [67/72] dmaengine: xilinx_dma: use devm_platform_ioremap_resource()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230123/202301231741.GfnElWgu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=8b8d41254a7ec46f5eeb0a22e90c82a92d28d324
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 8b8d41254a7ec46f5eeb0a22e90c82a92d28d324
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/dma/xilinx/xilinx_dma.c: In function 'xilinx_dma_probe':
>> drivers/dma/xilinx/xilinx_dma.c:2663:22: error: implicit declaration of function 'devm_platform_ioremap_resource'; did you mean 'devm_ioremap_resource'? [-Werror=implicit-function-declaration]
    2663 |         xdev->regs = devm_platform_ioremap_resource(pdev, 0);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      devm_ioremap_resource
>> drivers/dma/xilinx/xilinx_dma.c:2663:20: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2663 |         xdev->regs = devm_platform_ioremap_resource(pdev, 0);
         |                    ^
   cc1: some warnings being treated as errors


vim +2663 drivers/dma/xilinx/xilinx_dma.c

  2623	
  2624	/**
  2625	 * xilinx_dma_probe - Driver probe function
  2626	 * @pdev: Pointer to the platform_device structure
  2627	 *
  2628	 * Return: '0' on success and failure value on error
  2629	 */
  2630	static int xilinx_dma_probe(struct platform_device *pdev)
  2631	{
  2632		int (*clk_init)(struct platform_device *, struct clk **, struct clk **,
  2633				struct clk **, struct clk **, struct clk **)
  2634						= axivdma_clk_init;
  2635		struct device_node *node = pdev->dev.of_node;
  2636		struct xilinx_dma_device *xdev;
  2637		struct device_node *child, *np = pdev->dev.of_node;
  2638		u32 num_frames, addr_width, len_width;
  2639		int i, err;
  2640	
  2641		/* Allocate and initialize the DMA engine structure */
  2642		xdev = devm_kzalloc(&pdev->dev, sizeof(*xdev), GFP_KERNEL);
  2643		if (!xdev)
  2644			return -ENOMEM;
  2645	
  2646		xdev->dev = &pdev->dev;
  2647		if (np) {
  2648			const struct of_device_id *match;
  2649	
  2650			match = of_match_node(xilinx_dma_of_ids, np);
  2651			if (match && match->data) {
  2652				xdev->dma_config = match->data;
  2653				clk_init = xdev->dma_config->clk_init;
  2654			}
  2655		}
  2656	
  2657		err = clk_init(pdev, &xdev->axi_clk, &xdev->tx_clk, &xdev->txs_clk,
  2658			       &xdev->rx_clk, &xdev->rxs_clk);
  2659		if (err)
  2660			return err;
  2661	
  2662		/* Request and map I/O memory */
> 2663		xdev->regs = devm_platform_ioremap_resource(pdev, 0);
  2664		if (IS_ERR(xdev->regs))
  2665			return PTR_ERR(xdev->regs);
  2666	
  2667		/* Retrieve the DMA engine properties from the device tree */
  2668		xdev->has_sg = of_property_read_bool(node, "xlnx,include-sg");
  2669		xdev->max_buffer_len = GENMASK(XILINX_DMA_MAX_TRANS_LEN_MAX - 1, 0);
  2670	
  2671		if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
  2672			xdev->mcdma = of_property_read_bool(node, "xlnx,mcdma");
  2673			if (!of_property_read_u32(node, "xlnx,sg-length-width",
  2674						  &len_width)) {
  2675				if (len_width < XILINX_DMA_MAX_TRANS_LEN_MIN ||
  2676				    len_width > XILINX_DMA_V2_MAX_TRANS_LEN_MAX) {
  2677					dev_warn(xdev->dev,
  2678						 "invalid xlnx,sg-length-width property value. Using default width\n");
  2679				} else {
  2680					if (len_width > XILINX_DMA_MAX_TRANS_LEN_MAX)
  2681						dev_warn(xdev->dev, "Please ensure that IP supports buffer length > 23 bits\n");
  2682					xdev->max_buffer_len =
  2683						GENMASK(len_width - 1, 0);
  2684				}
  2685			}
  2686		}
  2687	
  2688		if (xdev->dma_config->dmatype == XDMA_TYPE_VDMA) {
  2689			err = of_property_read_u32(node, "xlnx,num-fstores",
  2690						   &num_frames);
  2691			if (err < 0) {
  2692				dev_err(xdev->dev,
  2693					"missing xlnx,num-fstores property\n");
  2694				goto disable_clks;
  2695			}
  2696	
  2697			err = of_property_read_u32(node, "xlnx,flush-fsync",
  2698						   &xdev->flush_on_fsync);
  2699			if (err < 0)
  2700				dev_warn(xdev->dev,
  2701					 "missing xlnx,flush-fsync property\n");
  2702		}
  2703	
  2704		err = of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
  2705		if (err < 0)
  2706			dev_warn(xdev->dev, "missing xlnx,addrwidth property\n");
  2707	
  2708		if (addr_width > 32)
  2709			xdev->ext_addr = true;
  2710		else
  2711			xdev->ext_addr = false;
  2712	
  2713		/* Set the dma mask bits */
  2714		err = dma_set_mask_and_coherent(xdev->dev, DMA_BIT_MASK(addr_width));
  2715		if (err < 0) {
  2716			dev_err(xdev->dev, "DMA mask error %d\n", err);
  2717			goto disable_clks;
  2718		}
  2719	
  2720		/* Initialize the DMA engine */
  2721		xdev->common.dev = &pdev->dev;
  2722	
  2723		INIT_LIST_HEAD(&xdev->common.channels);
  2724		if (!(xdev->dma_config->dmatype == XDMA_TYPE_CDMA)) {
  2725			dma_cap_set(DMA_SLAVE, xdev->common.cap_mask);
  2726			dma_cap_set(DMA_PRIVATE, xdev->common.cap_mask);
  2727		}
  2728	
  2729		xdev->common.device_alloc_chan_resources =
  2730					xilinx_dma_alloc_chan_resources;
  2731		xdev->common.device_free_chan_resources =
  2732					xilinx_dma_free_chan_resources;
  2733		xdev->common.device_terminate_all = xilinx_dma_terminate_all;
  2734		xdev->common.device_tx_status = xilinx_dma_tx_status;
  2735		xdev->common.device_issue_pending = xilinx_dma_issue_pending;
  2736		if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
  2737			dma_cap_set(DMA_CYCLIC, xdev->common.cap_mask);
  2738			xdev->common.device_prep_slave_sg = xilinx_dma_prep_slave_sg;
  2739			xdev->common.device_prep_dma_cyclic =
  2740						  xilinx_dma_prep_dma_cyclic;
  2741			xdev->common.device_prep_interleaved_dma =
  2742						xilinx_dma_prep_interleaved;
  2743			/* Residue calculation is supported by only AXI DMA */
  2744			xdev->common.residue_granularity =
  2745						  DMA_RESIDUE_GRANULARITY_SEGMENT;
  2746		} else if (xdev->dma_config->dmatype == XDMA_TYPE_CDMA) {
  2747			dma_cap_set(DMA_MEMCPY, xdev->common.cap_mask);
  2748			xdev->common.device_prep_dma_memcpy = xilinx_cdma_prep_memcpy;
  2749		} else {
  2750			xdev->common.device_prep_interleaved_dma =
  2751					xilinx_vdma_dma_prep_interleaved;
  2752		}
  2753	
  2754		platform_set_drvdata(pdev, xdev);
  2755	
  2756		/* Initialize the channels */
  2757		for_each_child_of_node(node, child) {
  2758			err = xilinx_dma_child_probe(xdev, child);
  2759			if (err < 0)
  2760				goto disable_clks;
  2761		}
  2762	
  2763		if (xdev->dma_config->dmatype == XDMA_TYPE_VDMA) {
  2764			for (i = 0; i < xdev->nr_channels; i++)
  2765				if (xdev->chan[i])
  2766					xdev->chan[i]->num_frms = num_frames;
  2767		}
  2768	
  2769		/* Register the DMA engine with the core */
  2770		err = dma_async_device_register(&xdev->common);
  2771		if (err) {
  2772			dev_err(xdev->dev, "failed to register the dma device\n");
  2773			goto error;
  2774		}
  2775	
  2776		err = of_dma_controller_register(node, of_dma_xilinx_xlate,
  2777						 xdev);
  2778		if (err < 0) {
  2779			dev_err(&pdev->dev, "Unable to register DMA to DT\n");
  2780			dma_async_device_unregister(&xdev->common);
  2781			goto error;
  2782		}
  2783	
  2784		if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA)
  2785			dev_info(&pdev->dev, "Xilinx AXI DMA Engine Driver Probed!!\n");
  2786		else if (xdev->dma_config->dmatype == XDMA_TYPE_CDMA)
  2787			dev_info(&pdev->dev, "Xilinx AXI CDMA Engine Driver Probed!!\n");
  2788		else
  2789			dev_info(&pdev->dev, "Xilinx AXI VDMA Engine Driver Probed!!\n");
  2790	
  2791		return 0;
  2792	
  2793	disable_clks:
  2794		xdma_disable_allclks(xdev);
  2795	error:
  2796		for (i = 0; i < xdev->nr_channels; i++)
  2797			if (xdev->chan[i])
  2798				xilinx_dma_chan_remove(xdev->chan[i]);
  2799	
  2800		return err;
  2801	}
  2802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
