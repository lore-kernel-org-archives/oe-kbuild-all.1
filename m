Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618B210A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqrbQiQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697394404; x=1728930404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8UwJtXd/waB0mS5VNdl+b17FahHG8EiaRQI2tuOQ22Q=;
  b=BqrbQiQjTQQ/hlHeSG/BB53BFMY1XJ28L3PtNoG0AqSH+xT1Se2Os32d
   YP1v9ZR25aS8jdRg+UrsTVxbEovgPOaNw/DjIoMFT2Y2y1Q6xSZlKm+1H
   HDKQsXpt5BKMltXoeBH8fSeOA7qsrMmSYo0twB5UdMPdzEzGGPXGBgtyW
   BCdjwR8XwD1TwETvKRUgGW+9Gtef6BoevVy2juVjgWWpZ35Z1roAbJdTc
   +pawdCJmos2joC4oQqsrKc7dYLvVhy0miEb76TxxNRloA7HJWeEir66yJ
   q6H/JPFFP7/wAKF7V+Meztm581JKFbhRBXFcA7h4MncDrGKf5u1BTQ7LZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375777294"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375777294"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 11:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871807979"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="871807979"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2023 11:26:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs5p1-0007fz-2t;
	Sun, 15 Oct 2023 18:26:39 +0000
Date: Mon, 16 Oct 2023 02:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4298/15768]
 drivers/net/ethernet/freescale/fman/fman.c:2694:46: warning: variable
 'fw_fmnode' set but not used
Message-ID: <202310160251.3Xfr53rb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 706c8187d42bb7c8706d1d02bf7b811f4cca0819 [4298/15768] fsl/fman: add FMan ACPI support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160251.3Xfr53rb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160251.3Xfr53rb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160251.3Xfr53rb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fman/fman.c: In function 'read_acpi_node':
>> drivers/net/ethernet/freescale/fman/fman.c:2694:46: warning: variable 'fw_fmnode' set but not used [-Wunused-but-set-variable]
    2694 |         struct fwnode_handle *fwnode_muram, *fw_fmnode;
         |                                              ^~~~~~~~~
   drivers/net/ethernet/freescale/fman/fman.c: At top level:
>> drivers/net/ethernet/freescale/fman/fman.c:3066:36: warning: 'acpi_fman_match' defined but not used [-Wunused-const-variable=]
    3066 | static const struct acpi_device_id acpi_fman_match[] = {
         |                                    ^~~~~~~~~~~~~~~


vim +/fw_fmnode +2694 drivers/net/ethernet/freescale/fman/fman.c

  2691	
  2692	static struct fman *read_acpi_node(struct platform_device *pdev)
  2693	{
> 2694		struct fwnode_handle *fwnode_muram, *fw_fmnode;
  2695		phys_addr_t phys_base_addr;
  2696		phys_addr_t phys_end_addr;
  2697		resource_size_t mem_size;
  2698		struct resource *res;
  2699		struct fman *fman;
  2700		u32 val, range[2];
  2701		u32 io_size = 0;
  2702		const char *cp;
  2703		int err, irq;
  2704		u32 clk_rate;
  2705	
  2706		fman = kzalloc(sizeof(*fman), GFP_KERNEL);
  2707		if (!fman)
  2708			return ERR_PTR(-ENOMEM);
  2709	
  2710		fw_fmnode = fwnode_handle_get(pdev->dev.fwnode);
  2711		err = fwnode_property_read_u32(pdev->dev.fwnode,
  2712					       "cell-index", &val);
  2713	
  2714		if (err) {
  2715			dev_err(&pdev->dev, "%s: failed to read cell-index\n",
  2716				__func__);
  2717			goto fman_free;
  2718		}
  2719		fman->dts_params.id = (u8)val;
  2720	
  2721		/* Get the FM interrupt */
  2722		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
  2723		if (!res) {
  2724			dev_err(&pdev->dev, "%s: Can't get FMan IRQ resource\n",
  2725				__func__);
  2726			err = -EINVAL;
  2727			goto fman_free;
  2728		}
  2729		irq = res->start;
  2730	
  2731		/* Get the FM error interrupt */
  2732		res = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
  2733		if (!res) {
  2734			dev_err(&pdev->dev, "%s: Can't get FMan Error IRQ resource\n",
  2735				__func__);
  2736			err = -EINVAL;
  2737			goto fman_free;
  2738		}
  2739		fman->dts_params.err_irq = res->start;
  2740	
  2741		/* Get the FM address */
  2742		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  2743		if (!res) {
  2744			dev_err(&pdev->dev, "%s: Can't get FMan memory resource\n",
  2745				__func__);
  2746			err = -EINVAL;
  2747			goto fman_free;
  2748		}
  2749	
  2750		phys_base_addr = res->start;
  2751		mem_size = resource_size(res);
  2752	
  2753		err = fwnode_property_read_u32(pdev->dev.fwnode,
  2754					       "clock-frequency", &clk_rate);
  2755		if (!clk_rate) {
  2756			dev_err(&pdev->dev, "%s: Failed to determine FM%d clock rate\n",
  2757				__func__, fman->dts_params.id);
  2758			goto fman_free;
  2759		}
  2760		/* Rounding to MHz */
  2761		fman->dts_params.clk_freq = DIV_ROUND_UP(clk_rate, 1000000);
  2762	
  2763		err = fwnode_property_read_u32_array(pdev->dev.fwnode,
  2764						     "fsl,qman-channel-range",
  2765						     &range[0], 2);
  2766		if (err) {
  2767			dev_err(&pdev->dev, "%s: failed to read fsl,qman-channel-range\n",
  2768				__func__);
  2769			goto fman_free;
  2770		}
  2771		fman->dts_params.qman_channel_base = range[0];
  2772		fman->dts_params.num_of_qman_channels = range[1];
  2773	
  2774		/* Get the MURAM base address and size */
  2775		device_for_each_child_node(&pdev->dev, fwnode_muram) {
  2776			if (!fwnode_property_read_string(fwnode_muram,
  2777							 "compatible", &cp)) {
  2778				if (!strcmp(cp, "fsl,fman-muram")) {
  2779					if (fwnode_property_present(fwnode_muram, "reg")) {
  2780						fwnode_property_read_u32_array(fwnode_muram,
  2781									       "reg",
  2782									       &io_size,
  2783									       1);
  2784					}
  2785					break;
  2786				}
  2787			}
  2788		}
  2789		fman->dts_params.muram_res.start = phys_base_addr;
  2790		if (!io_size)
  2791			phys_end_addr = phys_base_addr + MRM_SIZE - 1;
  2792		else
  2793			phys_end_addr = phys_base_addr + io_size - 1;
  2794		fman->dts_params.muram_res.end   = phys_end_addr;
  2795		fman->dts_params.muram_res.flags = IORESOURCE_MEM;
  2796	
  2797		err = devm_request_irq(&pdev->dev, irq, fman_irq, IRQF_SHARED,
  2798				       "fman", fman);
  2799		if (err < 0) {
  2800			dev_err(&pdev->dev, "%s: irq %d allocation failed (error = %d)\n",
  2801				__func__, irq, err);
  2802			goto fman_free;
  2803		}
  2804	
  2805		if (fman->dts_params.err_irq != 0) {
  2806			err = devm_request_irq(&pdev->dev, fman->dts_params.err_irq,
  2807					       fman_err_irq, IRQF_SHARED,
  2808					       "fman-err", fman);
  2809			if (err < 0) {
  2810				dev_err(&pdev->dev, "%s: irq %d allocation failed (error = %d)\n",
  2811					__func__, fman->dts_params.err_irq, err);
  2812				goto fman_free;
  2813			}
  2814		}
  2815	
  2816		fman->dts_params.res = res;
  2817		if (!fman->dts_params.res) {
  2818			dev_err(&pdev->dev, "%s: platform_get_resource() failed\n",
  2819				__func__);
  2820			err = -EINVAL;
  2821			goto fman_free;
  2822		}
  2823	
  2824		fman->dts_params.base_addr =
  2825			devm_ioremap(&pdev->dev, phys_base_addr, mem_size);
  2826		if (!fman->dts_params.base_addr) {
  2827			dev_err(&pdev->dev, "%s: devm_ioremap() failed\n", __func__);
  2828			err = -ENOMEM;
  2829			goto fman_free;
  2830		}
  2831	
  2832		fman->dev = &pdev->dev;
  2833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
