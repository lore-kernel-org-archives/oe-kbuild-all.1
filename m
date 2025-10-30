Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8B33F39D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819225; cv=none; b=jeKJ3ZOKXq2iCp7SNJeBlbEO15d/oCHapd4qyHdoll2wDke7ExyE7cCSPuI8Cj84LSuhU2M/67jR6o/Z1ttgVIob6bnXu1IsGL+NmeKwslWcktGcvjjt+HY343ClHlj/47NKhi3x2+d7UEGPOXQSyMqytL4xBzE1MeXfqaXNktM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819225; c=relaxed/simple;
	bh=khFHcHM6BMW4ak4wtz5/K13ZKcuV9yLkr8J2CesSst4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=VZgWoZKIuaiZZfF2tX0N8M2iRTEQZXegAhVbNfP0lWy8AsJ2MgwESScDyFz77eG4jGYWfqFxUTO948TIyAKX8qbbsD2nzTXZtomsVgcdGl+OcjGoywcMDv6/usSjPG5kiahm9qMlXId0a6iK+0JaXnwqY4EakDv7tFvK8ntN/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=foAOHo5Y; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="foAOHo5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t01BAnea+d9hOFt+MZUOQqNA8GCr8lj+TYZ3J7/yU+w=;
  b=foAOHo5YeEtLMVa5E3VDz9Ke77nsi4eNP0+RzfgRls7EMXq6Lh0AkHt/
   P+goszbBd1oU+KDwQAtH1KL3YxMsPHBO+wRt7zl/YNu5Qc4j2azOyFZVY
   CNkpjnC/vJ9YaWRc2OtcfMJTbIyzZisNSApa+WorzmOnOTd5iUYK3AddF
   Y=;
X-CSE-ConnectionGUID: EL4vGBzkRA+HJKbJHSsaLA==
X-CSE-MsgGUID: f377ETMDQ+GSDizyXTaRuA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.19,266,1754949600"; 
   d="scan'208";a="129482316"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 11:13:34 +0100
Date: Thu, 30 Oct 2025 11:13:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/pwm/pwm-mediatek.c:380:16-17: WARNING: Use struct_size
 (fwd)
Message-ID: <1c14c197-4615-8065-b440-4a10975f8c93@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1426919892-1761819214=:3629"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1426919892-1761819214=:3629
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



---------- Forwarded message ----------
Date: Thu, 30 Oct 2025 17:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pwm/pwm-mediatek.c:380:16-17: WARNING: Use struct_size

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: ed5902a2464834656f94f1c23fa61f99ea38f328 pwm: mediatek: Lock and cache clock rate
date:   6 weeks ago
:::::: branch date: 32 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510301753.iqGmTwae-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301753.iqGmTwae-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-mediatek.c:380:16-17: WARNING: Use struct_size

vim +380 drivers/pwm/pwm-mediatek.c

a911f15745fd4a9 Uwe Kleine-König           2025-07-25  368
2503781c97fa66f Sam Shih                   2019-09-20  369  static int pwm_mediatek_probe(struct platform_device *pdev)
caf065f8fd583b4 John Crispin               2017-01-23  370  {
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  371  	struct pwm_chip *chip;
2503781c97fa66f Sam Shih                   2019-09-20  372  	struct pwm_mediatek_chip *pc;
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  373  	const struct pwm_mediatek_of_data *soc;
caf065f8fd583b4 John Crispin               2017-01-23  374  	unsigned int i;
caf065f8fd583b4 John Crispin               2017-01-23  375  	int ret;
caf065f8fd583b4 John Crispin               2017-01-23  376
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  377  	soc = of_device_get_match_data(&pdev->dev);
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  378
ed5902a24648346 Uwe Kleine-König           2025-07-25  379  	chip = devm_pwmchip_alloc(&pdev->dev, soc->num_pwms,
ed5902a24648346 Uwe Kleine-König           2025-07-25 @380  				  sizeof(*pc) + soc->num_pwms * sizeof(*pc->clk_pwms));
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  381  	if (IS_ERR(chip))
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  382  		return PTR_ERR(chip);
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  383  	pc = to_pwm_mediatek_chip(chip);
caf065f8fd583b4 John Crispin               2017-01-23  384
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  385  	pc->soc = soc;
424268c7494c2ae Zhi Mao                    2017-10-25  386
7681c2bd2ab2dd1 Yangtao Li                 2019-12-29  387  	pc->regs = devm_platform_ioremap_resource(pdev, 0);
caf065f8fd583b4 John Crispin               2017-01-23  388  	if (IS_ERR(pc->regs))
caf065f8fd583b4 John Crispin               2017-01-23  389  		return PTR_ERR(pc->regs);
caf065f8fd583b4 John Crispin               2017-01-23  390
efecdeb82f21d41 Sam Shih                   2019-09-20  391  	pc->clk_top = devm_clk_get(&pdev->dev, "top");
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  392  	if (IS_ERR(pc->clk_top))
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  393  		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  394  				     "Failed to get top clock\n");
efecdeb82f21d41 Sam Shih                   2019-09-20  395
efecdeb82f21d41 Sam Shih                   2019-09-20  396  	pc->clk_main = devm_clk_get(&pdev->dev, "main");
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  397  	if (IS_ERR(pc->clk_main))
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  398  		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_main),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  399  				     "Failed to get main clock\n");
efecdeb82f21d41 Sam Shih                   2019-09-20  400
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  401  	for (i = 0; i < soc->num_pwms; i++) {
efecdeb82f21d41 Sam Shih                   2019-09-20  402  		char name[8];
efecdeb82f21d41 Sam Shih                   2019-09-20  403
efecdeb82f21d41 Sam Shih                   2019-09-20  404  		snprintf(name, sizeof(name), "pwm%d", i + 1);
efecdeb82f21d41 Sam Shih                   2019-09-20  405
ed5902a24648346 Uwe Kleine-König           2025-07-25  406  		pc->clk_pwms[i].clk = devm_clk_get(&pdev->dev, name);
ed5902a24648346 Uwe Kleine-König           2025-07-25  407  		if (IS_ERR(pc->clk_pwms[i].clk))
ed5902a24648346 Uwe Kleine-König           2025-07-25  408  			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i].clk),
4d690e508a69f42 AngeloGioacchino Del Regno 2022-02-14  409  					     "Failed to get %s clock\n", name);
ed5902a24648346 Uwe Kleine-König           2025-07-25  410
ed5902a24648346 Uwe Kleine-König           2025-07-25  411  		ret = devm_clk_rate_exclusive_get(&pdev->dev, pc->clk_pwms[i].clk);
ed5902a24648346 Uwe Kleine-König           2025-07-25  412  		if (ret)
ed5902a24648346 Uwe Kleine-König           2025-07-25  413  			return dev_err_probe(&pdev->dev, ret,
ed5902a24648346 Uwe Kleine-König           2025-07-25  414  					     "Failed to lock clock rate for %s\n", name);
424268c7494c2ae Zhi Mao                    2017-10-25  415  	}
caf065f8fd583b4 John Crispin               2017-01-23  416
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  417  	ret = pwm_mediatek_init_used_clks(pc);
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  418  	if (ret)
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  419  		return dev_err_probe(&pdev->dev, ret, "Failed to initialize used clocks\n");
a911f15745fd4a9 Uwe Kleine-König           2025-07-25  420
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  421  	chip->ops = &pwm_mediatek_ops;
caf065f8fd583b4 John Crispin               2017-01-23  422
1c8090d7b3babd2 Uwe Kleine-König           2024-02-14  423  	ret = devm_pwmchip_add(&pdev->dev, chip);
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  424  	if (ret < 0)
5264e8ca762bb1b AngeloGioacchino Del Regno 2022-02-14  425  		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
caf065f8fd583b4 John Crispin               2017-01-23  426
caf065f8fd583b4 John Crispin               2017-01-23  427  	return 0;
caf065f8fd583b4 John Crispin               2017-01-23  428  }
caf065f8fd583b4 John Crispin               2017-01-23  429

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-1426919892-1761819214=:3629--
