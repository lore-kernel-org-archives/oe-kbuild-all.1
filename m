Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD41E0B86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034303; cv=none; b=Ka1Jc2eVCziangpDjodeKdDs+5cep+T06Mzupl2uZr/dfInLGfrQPINFsxZdIKbn1hRYyItmsmnt5u3Yry4kJoofTk+Tc6tIcl0VwvUlY2H97THYNPDNR2T4o2BEN2VY/d2etlHjTWeYvU6PAQP9m1fh/Jfwc+E8XH5yaHPhozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034303; c=relaxed/simple;
	bh=yvI/esc+pD0TavPABcaP2qWaK6zW9DmXuY8nrBwEK38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlzmPj07uKRWp5GXanHcVF2853DmbTrngEovIuxgpcgRgZobZ+q+iuYeAqc+kt4kxgF6aw5oR0VHwCHgR4jNSiQ++PYSLPs8ANbxPNBdEwXM8BugSfGjQGJarOGXQWrfItEkg3tdPR5/WGmwzypmEcUZdLPwPXYSUeL2imLoZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnG/XJlv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnG/XJlv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746034301; x=1777570301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvI/esc+pD0TavPABcaP2qWaK6zW9DmXuY8nrBwEK38=;
  b=HnG/XJlvaMUmsIkXjWXybL2ESqq8aGZj6fAwMF3qqjz9Vt3OU4Vgu37P
   RQNpf4L30uTlnVrvK27o1sYnupRFPMOI03X/NiVZsk8xi4axw6oZ7imLS
   TFbkkAtN8z0b1jaDgmi6aRwLUgGHCeyG40Dq6gsZB7GG9sVagWIPlAG4E
   WpaeTa3gbEdpDyBwxKWUkgK28BHy073QzDk31j2UEPvG3pNa8VdY0J93u
   k942sMbEnKLpkLWa8pW7T0Ypibq6u/8UTjzjq4qId8Bw5JjOZ4nx3l2pT
   ij67q9C9IorgGwu588+V4F6v9XXVOCWyLjq+R4r9YhlSsNR6thn1U3kfU
   A==;
X-CSE-ConnectionGUID: I6z3Ua8yT4uVjKWa71pNsw==
X-CSE-MsgGUID: AdrucTyIRGeZuAem2QZH6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47795032"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47795032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:31:41 -0700
X-CSE-ConnectionGUID: W7DXfTlDRNitS7CEj8xIBw==
X-CSE-MsgGUID: UOGZzn0LQsCBiWPVScpzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="135157434"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2025 10:31:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uABHV-0003en-0n;
	Wed, 30 Apr 2025 17:31:37 +0000
Date: Thu, 1 May 2025 01:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 18/50] drivers/mfd/sec-acpm.c:346:16: error:
 implicit declaration of function 'devm_acpm_get_by_node'; did you mean
 'devm_acpm_get_by_phandle'?
Message-ID: <202505010115.ssBCiBac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   566b001ca4f65878d5e9b0e9d23ba2d55bf4c630
commit: 690f145503fe1e4d31a1f0250122b3e04876ee90 [18/50] mfd: sec: Add support for S2MPG10 PMIC
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250501/202505010115.ssBCiBac-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010115.ssBCiBac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010115.ssBCiBac-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/sec-acpm.c: In function 'sec_pmic_acpm_probe':
>> drivers/mfd/sec-acpm.c:346:16: error: implicit declaration of function 'devm_acpm_get_by_node'; did you mean 'devm_acpm_get_by_phandle'? [-Wimplicit-function-declaration]
     346 |         acpm = devm_acpm_get_by_node(dev, dev->parent->of_node);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                devm_acpm_get_by_phandle
>> drivers/mfd/sec-acpm.c:346:14: error: assignment to 'const struct acpm_handle *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         acpm = devm_acpm_get_by_node(dev, dev->parent->of_node);
         |              ^


vim +346 drivers/mfd/sec-acpm.c

   332	
   333	static int sec_pmic_acpm_probe(struct platform_device *pdev)
   334	{
   335		struct regmap *regmap_common, *regmap_pmic, *regmap;
   336		const struct sec_pmic_acpm_platform_data *pdata;
   337		struct sec_pmic_acpm_shared_bus_context *shared_ctx;
   338		const struct acpm_handle *acpm;
   339		struct device *dev = &pdev->dev;
   340		int ret, irq;
   341	
   342		pdata = device_get_match_data(dev);
   343		if (!pdata)
   344			return dev_err_probe(dev, -ENODEV, "unsupported device type\n");
   345	
 > 346		acpm = devm_acpm_get_by_node(dev, dev->parent->of_node);
   347		if (IS_ERR(acpm))
   348			return dev_err_probe(dev, PTR_ERR(acpm), "failed to get acpm\n");
   349	
   350		irq = platform_get_irq(pdev, 0);
   351		if (irq < 0)
   352			return irq;
   353	
   354		shared_ctx = devm_kzalloc(dev, sizeof(*shared_ctx), GFP_KERNEL);
   355		if (!shared_ctx)
   356			return -ENOMEM;
   357	
   358		shared_ctx->acpm = acpm;
   359		shared_ctx->acpm_chan_id = pdata->acpm_chan_id;
   360		shared_ctx->speedy_channel = pdata->speedy_channel;
   361	
   362		regmap_common = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_COMMON,
   363							  pdata->regmap_cfg_common, false);
   364		if (IS_ERR(regmap_common))
   365			return PTR_ERR(regmap_common);
   366	
   367		/* Mask all interrupts from 'common' block, until successful init */
   368		ret = regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COMMON_INT_SRC);
   369		if (ret)
   370			return dev_err_probe(dev, ret, "failed to mask common block interrupts\n");
   371	
   372		regmap_pmic = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_PMIC,
   373							pdata->regmap_cfg_pmic, false);
   374		if (IS_ERR(regmap_pmic))
   375			return PTR_ERR(regmap_pmic);
   376	
   377		regmap = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_RTC,
   378						   pdata->regmap_cfg_rtc, true);
   379		if (IS_ERR(regmap))
   380			return PTR_ERR(regmap);
   381	
   382		regmap = sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_ACCESSTYPE_METER,
   383						   pdata->regmap_cfg_meter, true);
   384		if (IS_ERR(regmap))
   385			return PTR_ERR(regmap);
   386	
   387		ret = sec_pmic_probe(dev, pdata->device_type, irq, regmap_pmic, NULL);
   388		if (ret)
   389			return ret;
   390	
   391		if (device_property_read_bool(dev, "wakeup-source"))
   392			devm_device_init_wakeup(dev);
   393	
   394		/* Unmask PMIC interrupt from 'common' block, now that everything is in place. */
   395		ret = regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
   396					S2MPG10_COMMON_INT_SRC_PMIC);
   397		if (ret)
   398			return dev_err_probe(dev, ret, "failed to unmask PMIC interrupt\n");
   399	
   400		/* Mask all interrupts from 'common' block on shutdown */
   401		ret = devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs, regmap_common);
   402		if (ret)
   403			return ret;
   404	
   405		return 0;
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
