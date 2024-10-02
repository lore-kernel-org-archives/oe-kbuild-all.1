Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B529CE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727877159; cv=none; b=QlkjYvPMqiv4HdtgMEhOfG2J627h39lJ2grdJARHhPnV6roBsujqU4HNwHKrdJEbN2PKTA2IXZnbIFkXCruVgKa8nGt2fMF9lSXsX5I+R8Yk8d/N5N5/HPlLnGDnbDxcxP+zLdKn9T0BXepGy+91ELeNdMlcbb6jJgp344yxmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727877159; c=relaxed/simple;
	bh=G/F+5iy9XACTP9zM8C7yRqcrqQctDIN6NzKaU9D6gkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPwYMTS1JYzAgMQXekvHwzFL1QK//bE7JVQZ8pmQ91eJfrl4BEDKVyU1kA+xKvEwKnEX81MlUvFvJ4YAMLr6R3bYo3+gD16TDvdqrVgY74hJj8pP+OLpvdlU35BbJfATCtUSLJcvCPGnPCUUKY7ES/xwkMRl65Beknbe9opGXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXg96EWb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXg96EWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727877157; x=1759413157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/F+5iy9XACTP9zM8C7yRqcrqQctDIN6NzKaU9D6gkg=;
  b=SXg96EWbhd3ErAkD9XN2M+TZ23nvuFMCYJsayn1zD3PdGzrf97jfqa3v
   0TprcpDdnLx4x5B+7zGJ6vV9ok+wBpQT7ykxsJIRGIf2OTTEox6OjxauS
   8uVM1aBNAPaG65awcO6TNOKJ0u1/LAD4LfLmLzx9Yu+aeM+n67Q0H+RIr
   dzdjuCzVqRGU4zNsZymhq3ej9m6vgYsBRNRU0YZ7nqlTigbn2KZI6MW/U
   /itntK4ElypGvI3EK4y0tn2Y1O2J+1XZ6VPEGqRgyKQialWnU8TWxey/D
   zK/JRqjnX4Cefs66fWRdrHjddOZynXca6KMZG1ADlqFGaayUt4uhowkoY
   A==;
X-CSE-ConnectionGUID: m0/Q7O19Rce2YGDwayTQCg==
X-CSE-MsgGUID: A7XZ1wkVQX6L8uGz6Bw/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27214945"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27214945"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:52:36 -0700
X-CSE-ConnectionGUID: W4DrwXe3TYSe+AdMGZ9whg==
X-CSE-MsgGUID: Gn5hR7HuTPO+izbbnAHnfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78429256"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Oct 2024 06:52:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svzmL-000Sjh-1X;
	Wed, 02 Oct 2024 13:52:33 +0000
Date: Wed, 2 Oct 2024 21:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4691/16788]
 drivers/net/ethernet/freescale/fman/fman.c:2695:46: warning: variable
 'fw_fmnode' set but not used
Message-ID: <202410022132.i9eaA9LN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: c423e1ef9f457209c9390ea233247cac851fa2ba [4691/16788] fsl/fman: add FMan ACPI support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410022132.i9eaA9LN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022132.i9eaA9LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022132.i9eaA9LN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fman/fman.c: In function 'read_acpi_node':
>> drivers/net/ethernet/freescale/fman/fman.c:2695:46: warning: variable 'fw_fmnode' set but not used [-Wunused-but-set-variable]
    2695 |         struct fwnode_handle *fwnode_muram, *fw_fmnode;
         |                                              ^~~~~~~~~


vim +/fw_fmnode +2695 drivers/net/ethernet/freescale/fman/fman.c

  2692	
  2693	static struct fman *read_acpi_node(struct platform_device *pdev)
  2694	{
> 2695		struct fwnode_handle *fwnode_muram, *fw_fmnode;
  2696		phys_addr_t phys_base_addr;
  2697		phys_addr_t phys_end_addr;
  2698		resource_size_t mem_size;
  2699		struct resource *res;
  2700		struct fman *fman;
  2701		u32 val, range[2];
  2702		u32 io_size = 0;
  2703		const char *cp;
  2704		int err, irq;
  2705		u32 clk_rate;
  2706	
  2707		fman = kzalloc(sizeof(*fman), GFP_KERNEL);
  2708		if (!fman)
  2709			return ERR_PTR(-ENOMEM);
  2710	
  2711		fw_fmnode = fwnode_handle_get(pdev->dev.fwnode);
  2712		err = fwnode_property_read_u32(pdev->dev.fwnode,
  2713					       "cell-index", &val);
  2714	
  2715		if (err) {
  2716			dev_err(&pdev->dev, "%s: failed to read cell-index\n",
  2717				__func__);
  2718			goto fman_free;
  2719		}
  2720		fman->dts_params.id = (u8)val;
  2721	
  2722		/* Get the FM interrupt */
  2723		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
  2724		if (!res) {
  2725			dev_err(&pdev->dev, "%s: Can't get FMan IRQ resource\n",
  2726				__func__);
  2727			err = -EINVAL;
  2728			goto fman_free;
  2729		}
  2730		irq = res->start;
  2731	
  2732		/* Get the FM error interrupt */
  2733		res = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
  2734		if (!res) {
  2735			dev_err(&pdev->dev, "%s: Can't get FMan Error IRQ resource\n",
  2736				__func__);
  2737			err = -EINVAL;
  2738			goto fman_free;
  2739		}
  2740		fman->dts_params.err_irq = res->start;
  2741	
  2742		/* Get the FM address */
  2743		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  2744		if (!res) {
  2745			dev_err(&pdev->dev, "%s: Can't get FMan memory resource\n",
  2746				__func__);
  2747			err = -EINVAL;
  2748			goto fman_free;
  2749		}
  2750	
  2751		phys_base_addr = res->start;
  2752		mem_size = resource_size(res);
  2753	
  2754		err = fwnode_property_read_u32(pdev->dev.fwnode,
  2755					       "clock-frequency", &clk_rate);
  2756		if (!clk_rate) {
  2757			dev_err(&pdev->dev, "%s: Failed to determine FM%d clock rate\n",
  2758				__func__, fman->dts_params.id);
  2759			goto fman_free;
  2760		}
  2761		/* Rounding to MHz */
  2762		fman->dts_params.clk_freq = DIV_ROUND_UP(clk_rate, 1000000);
  2763	
  2764		err = fwnode_property_read_u32_array(pdev->dev.fwnode,
  2765						     "fsl,qman-channel-range",
  2766						     &range[0], 2);
  2767		if (err) {
  2768			dev_err(&pdev->dev, "%s: failed to read fsl,qman-channel-range\n",
  2769				__func__);
  2770			goto fman_free;
  2771		}
  2772		fman->dts_params.qman_channel_base = range[0];
  2773		fman->dts_params.num_of_qman_channels = range[1];
  2774	
  2775		/* Get the MURAM base address and size */
  2776		device_for_each_child_node(&pdev->dev, fwnode_muram) {
  2777			if (!fwnode_property_read_string(fwnode_muram,
  2778							 "compatible", &cp)) {
  2779				if (!strcmp(cp, "fsl,fman-muram")) {
  2780					if (fwnode_property_present(fwnode_muram, "reg")) {
  2781						fwnode_property_read_u32_array(fwnode_muram,
  2782									       "reg",
  2783									       &io_size,
  2784									       1);
  2785					}
  2786					break;
  2787				}
  2788			}
  2789		}
  2790		fman->dts_params.muram_res.start = phys_base_addr;
  2791		if (!io_size)
  2792			phys_end_addr = phys_base_addr + MRM_SIZE - 1;
  2793		else
  2794			phys_end_addr = phys_base_addr + io_size - 1;
  2795		fman->dts_params.muram_res.end   = phys_end_addr;
  2796		fman->dts_params.muram_res.flags = IORESOURCE_MEM;
  2797	
  2798		err = devm_request_irq(&pdev->dev, irq, fman_irq, IRQF_SHARED,
  2799				       "fman", fman);
  2800		if (err < 0) {
  2801			dev_err(&pdev->dev, "%s: irq %d allocation failed (error = %d)\n",
  2802				__func__, irq, err);
  2803			goto fman_free;
  2804		}
  2805	
  2806		if (fman->dts_params.err_irq != 0) {
  2807			err = devm_request_irq(&pdev->dev, fman->dts_params.err_irq,
  2808					       fman_err_irq, IRQF_SHARED,
  2809					       "fman-err", fman);
  2810			if (err < 0) {
  2811				dev_err(&pdev->dev, "%s: irq %d allocation failed (error = %d)\n",
  2812					__func__, fman->dts_params.err_irq, err);
  2813				goto fman_free;
  2814			}
  2815		}
  2816	
  2817		fman->dts_params.res = res;
  2818		if (!fman->dts_params.res) {
  2819			dev_err(&pdev->dev, "%s: platform_get_resource() failed\n",
  2820				__func__);
  2821			err = -EINVAL;
  2822			goto fman_free;
  2823		}
  2824	
  2825		fman->dts_params.base_addr =
  2826			devm_ioremap(&pdev->dev, phys_base_addr, mem_size);
  2827		if (!fman->dts_params.base_addr) {
  2828			dev_err(&pdev->dev, "%s: devm_ioremap() failed\n", __func__);
  2829			err = -ENOMEM;
  2830			goto fman_free;
  2831		}
  2832	
  2833		fman->dev = &pdev->dev;
  2834	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
