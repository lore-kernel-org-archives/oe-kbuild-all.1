Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171552;
	b=M5QGGIUhd4ZyKw0yjOy2LnRiYX2K+OZxbkpoAvvpMmXar7sxy7a1q3Vyiwe5mypMoJ9v
	 BwcH6KaFv1FkZqMn4XrRqmE64OWNqpo+cK5qT1Md7ZyfKhehig/BkQ+/2U4C9CUiHyk8i
	 4tBUVWtTGJyknwXMZw3EVD9s2cAnALV8JLSlPa7jU7NpmWu+Blj8DWwv5U+Q+rZw0byUp
	 jnJt4Bctc1U/TceVX+dl29ukpF00++9oNw0iugwY4v2LodvHmAOMnF4Gvy4hXBA5mm6kR
	 vL9aNnqX4Zvdss2nNzjL8+TGK0iAJEQrliWGMdwHoPjn3eCNvsb3R8GQ8OT94jqB5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2pZZurVvEaF+OZzJRAhgQtR6cSEhygK19R2pFpnScvE=;
	b=KtvJfqKJq4O9LVEV+M1XZHE5uaQ5xrWuq2bko1ZCDzVyBDlQdqC+NranxcE2PX1zp24c
	 6QVwbaReFAGAnlAnPkYshfzB8GjwX1ep4l4/DCxOZn9Gy4rbaK78X7m1Op+EC1ayOrz+5
	 n5t7uYqD0p7OnKLbd/fGCzc/UHk9fEM7QjH2sIljp9tuBy7PbmyOuHfTdP5URg6Gq6PeO
	 ZfzeZSCuWw/+6vYSSEYlgvoN7u3j3JVSUsuK7BldgSE4m1QdBnDh8TOXLkoofD6VzOwWm
	 +93k6Oyxh5orZVQ+fVfkYlWM6+N+zyEdbFliSozoi7+weXl6svaPWpPZVlYznWFcYyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ik8LPQjw;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD877606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 07:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD877606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ik8LPQjw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793171551; x=1824707551;
  h=date:from:to:cc:subject:message-id;
  bh=epWVjquLVrwjZI1CH3k9TMuTUDDaswj3tzuf/fi6jWo=;
  b=ik8LPQjwsjb4PM1dt6wJKEwBgKoKJ8GnERLGrJHwCfut1OyKRTZDwVrD
   SH8c7l5pV31qpTIbixpXmyvdiPa8Qh50eYqiToWFC6cMLs2KRQ+EyfAEV
   wWEH+xs/Zp+/p8imANzGfSkjwMQldXJUll3/L20pxf0p3EBmB6gi7Hp+H
   ejZAQ4wLLKYrdx0uri2I7ezOHvtRSntv8piccXgrii52aVNoFmOK3Qnsz
   ANsJ1ITZ9qHvq/kFMkmvpmvnaiO4yKjAnD5I4lgj4XlOg9HjUmswLQ/K7
   1A1ki1iMksdh5cV6C4tzyRWkYItMQZ9Iqtmbyxbr61uXFYRzDzi5TLWCl
   A==;
X-CSE-ConnectionGUID: pcEefSsdSqWg0m4txMRezA==
X-CSE-MsgGUID: bsvCOH18TEypR1XANjLBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1914456"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1914456"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:12:31 -0700
X-CSE-ConnectionGUID: HAGmGqWLR9qi38y9vgPkNw==
X-CSE-MsgGUID: IRkcGMhKQo6XPttg8nsWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4807680"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 00:12:28 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLxpi-000000004nP-1zmZ;
	Wed, 28 Oct 2026 07:12:26 +0000
Date: Wed, 28 Oct 2026 08:11:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 1/1]
 drivers/pwm/pwm-atmel-tcb.c:446:23-24: Unneeded semicolon
Message-ID: <202610280858.7X9OgZQv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   2cb883efa988e481f8a853178ec792f6fe49969e
commit: 9c59c79788e89055c07e23a10e0ef431c7996850 [1/1] pwm: atmel-tcb: Cache clock rates and mark chip as atomic
config: x86_64-randconfig-2101-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280858.7X9OgZQv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280858.7X9OgZQv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-atmel-tcb.c:446:23-24: Unneeded semicolon

vim +446 drivers/pwm/pwm-atmel-tcb.c

   382	
   383	static int atmel_tcb_pwm_probe(struct platform_device *pdev)
   384	{
   385		struct pwm_chip *chip;
   386		const struct of_device_id *match;
   387		struct atmel_tcb_pwm_chip *tcbpwmc;
   388		const struct atmel_tcb_config *config;
   389		struct device_node *np = pdev->dev.of_node;
   390		char clk_name[] = "t0_clk";
   391		int err;
   392		int channel;
   393	
   394		chip = devm_pwmchip_alloc(&pdev->dev, NPWM, sizeof(*tcbpwmc));
   395		if (IS_ERR(chip))
   396			return PTR_ERR(chip);
   397		tcbpwmc = to_tcb_chip(chip);
   398	
   399		err = of_property_read_u32(np, "reg", &channel);
   400		if (err < 0) {
   401			dev_err(&pdev->dev,
   402				"failed to get Timer Counter Block channel from device tree (error: %d)\n",
   403				err);
   404			return err;
   405		}
   406	
   407		tcbpwmc->regmap = syscon_node_to_regmap(np->parent);
   408		if (IS_ERR(tcbpwmc->regmap))
   409			return PTR_ERR(tcbpwmc->regmap);
   410	
   411		tcbpwmc->slow_clk = of_clk_get_by_name(np->parent, "slow_clk");
   412		if (IS_ERR(tcbpwmc->slow_clk))
   413			return PTR_ERR(tcbpwmc->slow_clk);
   414	
   415		clk_name[1] += channel;
   416		tcbpwmc->clk = of_clk_get_by_name(np->parent, clk_name);
   417		if (IS_ERR(tcbpwmc->clk))
   418			tcbpwmc->clk = of_clk_get_by_name(np->parent, "t0_clk");
   419		if (IS_ERR(tcbpwmc->clk)) {
   420			err = PTR_ERR(tcbpwmc->clk);
   421			goto err_slow_clk;
   422		}
   423	
   424		match = of_match_node(atmel_tcb_of_match, np->parent);
   425		config = match->data;
   426	
   427		if (config->has_gclk) {
   428			tcbpwmc->gclk = of_clk_get_by_name(np->parent, "gclk");
   429			if (IS_ERR(tcbpwmc->gclk)) {
   430				err = PTR_ERR(tcbpwmc->gclk);
   431				goto err_clk;
   432			}
   433		}
   434	
   435		chip->ops = &atmel_tcb_pwm_ops;
   436		chip->atomic = true;
   437		tcbpwmc->channel = channel;
   438		tcbpwmc->width = config->counter_width;
   439	
   440		err = clk_prepare_enable(tcbpwmc->clk);
   441		if (err)
   442			goto err_gclk;
   443	
   444		err = clk_prepare_enable(tcbpwmc->slow_clk);
   445		if (err)
 > 446			goto err_disable_clk;;
   447	
   448		err = clk_rate_exclusive_get(tcbpwmc->clk);
   449		if (err)
   450			goto err_disable_slow_clk;
   451	
   452		err = clk_rate_exclusive_get(tcbpwmc->slow_clk);
   453		if (err)
   454			goto err_clk_unlock;
   455	
   456		tcbpwmc->rate = clk_get_rate(tcbpwmc->clk);
   457		tcbpwmc->slow_rate = clk_get_rate(tcbpwmc->slow_clk);
   458	
   459		spin_lock_init(&tcbpwmc->lock);
   460	
   461		err = pwmchip_add(chip);
   462		if (err < 0)
   463			goto err_slow_clk_unlock;
   464	
   465		platform_set_drvdata(pdev, chip);
   466	
   467		return 0;
   468	
   469	err_slow_clk_unlock:
   470		clk_rate_exclusive_put(tcbpwmc->slow_clk);
   471	
   472	err_clk_unlock:
   473		clk_rate_exclusive_put(tcbpwmc->clk);
   474	
   475	err_disable_clk:
   476		clk_disable_unprepare(tcbpwmc->clk);
   477	
   478	err_disable_slow_clk:
   479		clk_disable_unprepare(tcbpwmc->slow_clk);
   480	
   481	err_gclk:
   482		clk_put(tcbpwmc->gclk);
   483	
   484	err_clk:
   485		clk_put(tcbpwmc->clk);
   486	
   487	err_slow_clk:
   488		clk_put(tcbpwmc->slow_clk);
   489	
   490		return err;
   491	}
   492	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
