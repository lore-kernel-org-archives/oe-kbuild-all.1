Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F343621
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 02:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681612742; x=1713148742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RqUHwildSnWNlztZyzAjnUszVxNeZ41Mq1HPzPWUZ1Y=;
  b=Zicm62y2rts7nWB9y9DD1w1je3j+b4QBBOis2W31ibN8UHedE5Efg4mr
   JJj1+cOPFIqHnYWJz1LNXPtIEx3G5aK1Xuhk5YrPraLjswY5fgublRUv2
   Q46LiGTlcqmCDw4yWGtuwWt90rCN88SMUT9WGkljwVm9OV0hVnAH4weSq
   /FnC+oLger7c8qVFVpGO0kLycDfumEsNLV07SiHTl8h2DsfwaVzUdYzFt
   42ZZjypnN8DdPXc3LYkrb2XKwU63DXqT2krQ6wiQcPqJ4JsS/ywK3P5OE
   03Op/x+xlUlLntNsZyC4KWiLT1qeiFnUum7veZSjBf0tK13v1MAElhoK9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="328852806"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="328852806"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 19:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="801669871"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="801669871"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2023 19:39:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnsI7-000bUB-0e;
	Sun, 16 Apr 2023 02:38:59 +0000
Date: Sun, 16 Apr 2023 10:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4298/9838]
 drivers/net/ethernet/freescale/fman/fman.c:2694:46: warning: variable
 'fw_fmnode' set but not used
Message-ID: <202304161036.1ma1ms19-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 706c8187d42bb7c8706d1d02bf7b811f4cca0819 [4298/9838] fsl/fman: add FMan ACPI support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304161036.1ma1ms19-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/706c8187d42bb7c8706d1d02bf7b811f4cca0819
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 706c8187d42bb7c8706d1d02bf7b811f4cca0819
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/platform/ drivers/net/dsa/ocelot/ drivers/net/ethernet/freescale/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304161036.1ma1ms19-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fman/fman.c: In function 'read_acpi_node':
>> drivers/net/ethernet/freescale/fman/fman.c:2694:46: warning: variable 'fw_fmnode' set but not used [-Wunused-but-set-variable]
    2694 |         struct fwnode_handle *fwnode_muram, *fw_fmnode;
         |                                              ^~~~~~~~~
   drivers/net/ethernet/freescale/fman/fman.c: At top level:
   drivers/net/ethernet/freescale/fman/fman.c:3066:36: warning: 'acpi_fman_match' defined but not used [-Wunused-const-variable=]
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
https://github.com/intel/lkp-tests
