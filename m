Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B906EEAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 03:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735703552; cv=none; b=qLJMtf8kjpmE21vC3PFsuNgRxHsxjFuoqztY7PBGnOtgS0r1T4U3ApZC5Qva/KZsPfBiTXiYSC69qC07mkHtpE0uCwyJ89NTePz4qtfc03une5wmKOOelm5MHhO3zY0lwiS7wHFM2Wtx66HbJVSKtBKLlyu0TwjwnOz48C7Kr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735703552; c=relaxed/simple;
	bh=ZD2FGtUlEWkB8gAdqGQn0p7CgkR1Rf6quEoNQX0g9so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMguhhBFg77c+dQBGifIeMO0GLVw7PPszAQJ8fyQarD9Y+BPJEDKittTpmzp5fWYS6/yGBORIt8dM2rFhQIKP1xZVaxTuecuIaYZQdgSnm1szoJuc3BrMIEzj28Yw++Ntr40MpeYQIdZHtxTcKKEPK8gQmV1yCklS7P2Oi+Aa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ5ihnG3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ5ihnG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735703550; x=1767239550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD2FGtUlEWkB8gAdqGQn0p7CgkR1Rf6quEoNQX0g9so=;
  b=SQ5ihnG3LzikoEUjVUA34UT7rEZran6jfO1D2nORbl4cCWja4keQZQlA
   Ag9ByuFOYGX9/PsEPySkpwwp/k4DIFEdzzokQ/rYUf3TOvoAl6bQLBqXP
   dHyEMsBpMqmcDRPZlp40eEgJsqGSjjtJqBGNylvjRcD0iHu4WwxFEOAf0
   HyT/WhH2bsoNFvkv8lvuNc9nY8QJbEu2/DvyRqPMVWUl72iAepVTZIX1j
   RRYzHcXRBscaquXtIV2oCykoJS4w5QwUx8z39nV5MFr3lPQKHF/fgquPx
   SAg/jBGHe33C0Psn170P6y7OVSd2Mb6a1jUFCm3BuRebBG6T3qN5FUFPh
   w==;
X-CSE-ConnectionGUID: pS564vHYSCqti5pqJkJG3A==
X-CSE-MsgGUID: dHfLPSejSkW16IowxAf80g==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46456926"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46456926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 19:52:29 -0800
X-CSE-ConnectionGUID: 02MOSXL3QuOwFT740n7hhA==
X-CSE-MsgGUID: EvZtHuX8TC6o+ckI2d8ueg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105235050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Dec 2024 19:52:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSpmU-0007c7-0L;
	Wed, 01 Jan 2025 03:52:26 +0000
Date: Wed, 1 Jan 2025 11:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 19/50]
 drivers/clk/clk-rpmi.c:585:undefined reference to `mbox_free_channel'
Message-ID: <202501011115.4fymjjzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   166004bf7b7a6c52ad02638a6d9f0a8641204eaf
commit: edc9659a80dec539bc7b6fc3e5355f217ef8aff3 [19/50] clk: Add clock driver for the RISC-V RPMI clock service group
config: csky-randconfig-r071-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011115.4fymjjzq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011115.4fymjjzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011115.4fymjjzq-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/clk/clk-rpmi.o: in function `rpmi_clk_remove':
>> drivers/clk/clk-rpmi.c:585:(.text+0x26): undefined reference to `mbox_free_channel'
   csky-linux-ld: drivers/clk/clk-rpmi.o: in function `rpmi_clk_determine_rate':
   drivers/clk/clk-rpmi.c:324:(.text+0xc0): undefined reference to `mbox_free_channel'
   csky-linux-ld: drivers/clk/clk-rpmi.o: in function `rpmi_mbox_send_message.constprop.0':
>> include/linux/mailbox/riscv-rpmi-message.h:212:(.text+0xd2): undefined reference to `mbox_send_message'
>> csky-linux-ld: include/linux/mailbox/riscv-rpmi-message.h:218:(.text+0xe0): undefined reference to `mbox_client_txdone'
   csky-linux-ld: drivers/clk/clk-rpmi.o: in function `rpmi_clk_get_supported_rates':
>> drivers/clk/clk-rpmi.c:228:(.text+0x238): undefined reference to `mbox_send_message'
>> csky-linux-ld: drivers/clk/clk-rpmi.c:228:(.text+0x23c): undefined reference to `mbox_client_txdone'
   csky-linux-ld: drivers/clk/clk-rpmi.o: in function `rpmi_clk_probe':
>> drivers/clk/clk-rpmi.c:485:(.text+0x5bc): undefined reference to `mbox_request_channel'
>> csky-linux-ld: drivers/clk/clk-rpmi.c:146:(.text+0x6d0): undefined reference to `mbox_request_channel'
>> csky-linux-ld: drivers/clk/clk-rpmi.c:577:(.text+0x78a): undefined reference to `mbox_free_channel'
   csky-linux-ld: drivers/clk/clk-rpmi.c:579:(.text+0x7bc): undefined reference to `mbox_free_channel'


vim +585 drivers/clk/clk-rpmi.c

   460	
   461	static int rpmi_clk_probe(struct platform_device *pdev)
   462	{
   463		struct device *dev = &pdev->dev;
   464		struct clk_hw_onecell_data *clk_data;
   465		struct rpmi_clk_context *context;
   466		struct rpmi_mbox_message msg;
   467		int ret, num_clocks, i;
   468		struct clk_hw *hw_ptr;
   469	
   470		/* Allocate RPMI clock context */
   471		context = devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
   472		if (!context)
   473			return -ENOMEM;
   474		context->dev = dev;
   475		platform_set_drvdata(pdev, context);
   476	
   477		/* Setup mailbox client */
   478		context->client.dev		= context->dev;
   479		context->client.rx_callback	= rpmi_clk_receive_message;
   480		context->client.tx_block	= false;
   481		context->client.knows_txdone	= true;
   482		context->client.tx_tout		= 0;
   483	
   484		/* Request mailbox channel */
 > 485		context->chan = mbox_request_channel(&context->client, 0);
   486		if (IS_ERR(context->chan))
   487			return PTR_ERR(context->chan);
   488	
   489		/* Validate RPMI specification version */
   490		rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
   491		ret = rpmi_mbox_send_message(context->chan, &msg);
   492		if (ret) {
   493			dev_err_probe(dev, ret, "Failed to get spec version\n");
   494			goto fail_free_channel;
   495		}
   496		if (msg.attr.value < RPMI_MKVER(1, 0)) {
   497			ret = dev_err_probe(dev, -EINVAL,
   498					    "msg protocol version mismatch, expected 0x%x, found 0x%x\n",
   499					    RPMI_MKVER(1, 0), msg.attr.value);
   500			goto fail_free_channel;
   501		}
   502	
   503		/* Validate clock service group ID */
   504		rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_ID);
   505		ret = rpmi_mbox_send_message(context->chan, &msg);
   506		if (ret) {
   507			dev_err_probe(dev, ret, "Failed to get service group ID\n");
   508			goto fail_free_channel;
   509		}
   510		if (msg.attr.value != RPMI_SRVGRP_CLOCK) {
   511			ret = dev_err_probe(dev, -EINVAL,
   512					    "service group match failed, expected 0x%x, found 0x%x\n",
   513					    RPMI_SRVGRP_CLOCK, msg.attr.value);
   514			goto fail_free_channel;
   515		}
   516	
   517		/* Validate clock service group version */
   518		rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
   519		ret = rpmi_mbox_send_message(context->chan, &msg);
   520		if (ret) {
   521			dev_err_probe(dev, ret, "Failed to get service group version\n");
   522			goto fail_free_channel;
   523		}
   524		if (msg.attr.value < RPMI_MKVER(1, 0)) {
   525			ret = dev_err_probe(dev, -EINVAL,
   526					    "service group version failed, expected 0x%x, found 0x%x\n",
   527					    RPMI_MKVER(1, 0), msg.attr.value);
   528			goto fail_free_channel;
   529		}
   530	
   531		/* Save the maximum message data size of mailbox channel */
   532		rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE);
   533		ret = rpmi_mbox_send_message(context->chan, &msg);
   534		if (ret) {
   535			dev_err_probe(dev, ret, "Failed to get max message data size\n");
   536			goto fail_free_channel;
   537		}
   538		context->max_msg_data_size = msg.attr.value;
   539	
   540		/* Find-out number of clocks */
   541		num_clocks = rpmi_clk_get_num_clocks(context);
   542		if (!num_clocks) {
   543			ret = dev_err_probe(dev, -ENODEV, "No clocks found\n");
   544			goto fail_free_channel;
   545		}
   546	
   547		/* Allocate clock data */
   548		clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, num_clocks),
   549					GFP_KERNEL);
   550		if (!clk_data) {
   551			ret = -ENOMEM;
   552			goto fail_free_channel;
   553		}
   554		clk_data->num = num_clocks;
   555	
   556		/* Setup clock data */
   557		for (i = 0; i < clk_data->num; i++) {
   558			hw_ptr = rpmi_clk_enumerate(context, i);
   559			if (IS_ERR(hw_ptr)) {
   560				ret = dev_err_probe(dev, PTR_ERR(hw_ptr),
   561						    "failed to register clk-%d\n", i);
   562				goto fail_free_channel;
   563			}
   564			clk_data->hws[i] = hw_ptr;
   565		}
   566	
   567		/* Register clock HW provider */
   568		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
   569		if (ret) {
   570			dev_err_probe(dev, ret, "failed to register clock HW provider\n");
   571			goto fail_free_channel;
   572		}
   573	
   574		return 0;
   575	
   576	fail_free_channel:
 > 577		mbox_free_channel(context->chan);
   578		return ret;
   579	}
   580	
   581	static void rpmi_clk_remove(struct platform_device *pdev)
   582	{
   583		struct rpmi_clk_context *context = platform_get_drvdata(pdev);
   584	
 > 585		mbox_free_channel(context->chan);
   586	}
   587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
