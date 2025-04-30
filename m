Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693EA1DE4EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038895; cv=none; b=lDcmqg/aaGst3rc8z5b9tw8NmVtu08nqIoZ+HogaXR8Jvnc5vnlk8VAGyMOwbsTyBY4eVM1cWOrIiwRJo03mCqFotPkF/36yFSUWsCE7NZNV5aa0sqVjjDXYriSvoWJlSadoREBCiSTRI+s15PNEepbXLLX26o/sZ9wDBUabXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038895; c=relaxed/simple;
	bh=fe/U541MCEdP1hdFX7EYwI9X8RdcruUXT29hI6zyDvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/QBz/hBeexwSZ3AYS6m5NqgSTOd5UXAqVhfqXcKLwQ4X83wQXAoS80iJLh7wUe8ONdP68Jb/vdIwPsFp1UdnW9VlZVyh1v975gXo5L+e6Di/HD4JFAyXOf10IuSu0ifmk6UiJG9Gl6fcJsM3IR8FfVJ2/qR4gibbVRcgaB7Rag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+G+cTDs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+G+cTDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746038894; x=1777574894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fe/U541MCEdP1hdFX7EYwI9X8RdcruUXT29hI6zyDvQ=;
  b=E+G+cTDsk4+oJ7GCmQHafT2bCa/W4OA6JoN9VWkc2e3tgrHDJT6edOOR
   GGwRjsldUQkfIvSG6CYFvadBf0dpmLixDJs67iqZzMgIf0G3uoWT2Uv3S
   42bbKUHsu80DFE6o99uSnTMs3mxrurgbH22EGsW8GdxU7t+YvJ6i8CBG4
   VdIjyFKm0eY1B3lKV084PXli9U8bKzwrnSzHSITeoSaB5o7LaU9EuQY/2
   zzPHrb4i+hZzMveO+JzEcmqFgPZULmWAuW/FhwIFaA7gwAWp98mJtinqo
   u89zgQQVWIfqZcYPmMJJAadjQ5QpWnejAB8KG7LXh19nhzs9ItlRWwFZi
   Q==;
X-CSE-ConnectionGUID: TxAPv9PvR6a11dfjlC6/Uw==
X-CSE-MsgGUID: /TbBDFgxSf2ERUniie03IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47592619"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="47592619"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 11:48:10 -0700
X-CSE-ConnectionGUID: pU1cBspwQmqkWwXZXoh+iw==
X-CSE-MsgGUID: Q7ruFnipTDit5814FJMG8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="139024282"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2025 11:48:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uACTW-0003he-1p;
	Wed, 30 Apr 2025 18:48:06 +0000
Date: Thu, 1 May 2025 02:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 18/50] drivers/mfd/sec-acpm.c:346:14: warning:
 assignment to 'const struct acpm_handle *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202505010259.mRRsi5Fc-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250501/202505010259.mRRsi5Fc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010259.mRRsi5Fc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010259.mRRsi5Fc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/sec-acpm.c: In function 'sec_pmic_acpm_probe':
   drivers/mfd/sec-acpm.c:346:16: error: implicit declaration of function 'devm_acpm_get_by_node'; did you mean 'devm_acpm_get_by_phandle'? [-Werror=implicit-function-declaration]
     346 |         acpm = devm_acpm_get_by_node(dev, dev->parent->of_node);
         |                ^~~~~~~~~~~~~~~~~~~~~
         |                devm_acpm_get_by_phandle
>> drivers/mfd/sec-acpm.c:346:14: warning: assignment to 'const struct acpm_handle *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |         acpm = devm_acpm_get_by_node(dev, dev->parent->of_node);
         |              ^
   cc1: some warnings being treated as errors


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
