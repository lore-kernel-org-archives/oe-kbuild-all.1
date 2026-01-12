Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F5339873
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204646; cv=none; b=rTER7knw2X3LWWXeTsh4QARMOn4gJtP3IerqAuGZ1Cn+JRNc79kT24nPkyEZZKpOM0GZmIuAjCeC0EzkmFFrNwQQfr1GnAf8F8WrqgxhHBG805yiVytTgzAm1SPinEzgv28Nrcaik+8wN8rlBKaw5RKtJdMAy7Z/JJaABALDQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204646; c=relaxed/simple;
	bh=xJsrVMye5Gxd+KJoZVkqplX/4R2uP5UbfHEvPcP7uUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPR5infYA9HanUYHOtmv7kBBNO5P3GPQ9JJS0DOM3IDCut2OEz0lBUqFeslUcLxY0+i2HwZUYzcd6Flti39CP7vJCmnApGTgfIUTDaLtbKqFNKV4bWF1gxDgKLwSOuP5powvIARd5Y/VyiydAT9PS+v/Of79YFFtHNZGopAsWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HshTIPuw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HshTIPuw"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso29651735e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768204643; x=1768809443; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHcSpt0J//n9tWUuyEeRMDpqtJxrFluPI+axYyMOc4c=;
        b=HshTIPuwAZZ3MQKSBrmZF6iZN4kjl5td552Y47dSj4rOF55OMcLaQkZfd9Dr7jkz4n
         /EBU5HJ+Ga/HHQ0M10d1f9iuxC4EoDZhMT9Cd4Xq3siXbPOr6GlNZLuBqyaXAQoM/NxX
         W4L/dOIPt+8xjwJmdMi2269SJX9sJcAnVqK6Kr3zvCoCAnBcoh0Vi2aErTTR1J+T6b6w
         S3Lz8/k6HU6D8MfEVPXmJfFlSmEO61kusTL78ma+hgacUof1HQhSXIWwr/bnHIfjriUZ
         1WHoY5mJ/04fRfBRU8Wn83eScyIR9NSpKSPpIWMzcvexf5dXr2LDtL3DHwhYBCYd3Qmm
         TGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204643; x=1768809443;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHcSpt0J//n9tWUuyEeRMDpqtJxrFluPI+axYyMOc4c=;
        b=vFFDsPr/MK0M3BOiFnd4GKBa4sjLimc4pu2PYFHv4w3tOoFD7vwWMdF0WHSXl3zqdO
         ck8l/FKTBw3aXqe4j7y28Jh5VYY3zVu1jYdeV7GbmnYlo38UUhTc+EribIPY8UgJQVE5
         02G7sCBvYi9NuZXGIogwsZ9Vfpz3ve55/x648w+thxK64s6JumEeeZ/+PZmXU7HWoFmG
         XxXF5Lc2fEsQoX5w6AqrUAExDI+SKVUfWJ1wfwkCzX8fZ3L9fO4Aws5JVOxc2NqOmWY3
         +sqk3e/JIpdM5jRSi5jc8lfF9vc+MDYApTzBbQ3B5OhuFaOMjgZVEPpN2u4RXWG5b0RJ
         pWCw==
X-Forwarded-Encrypted: i=1; AJvYcCX9MvUGmySlPrrQPBgWvzImE31xHzBxcxO+41PRNp5cNdTaP/NXNiDPONvxUowbh3ZZfnUSUmaHcACAwJji@lists.linux.dev
X-Gm-Message-State: AOJu0YzQYXLL2CmpcPJEy241foecteAKOqYeifBKG1q4yxM9pI9jn7md
	8X5vVVpRdTOlzj4Sw2p1OmGmIKOrEe1XZDZhu6rAOT/up55Ux7l6l1m2QuynL6/ok44TE95+Gkb
	s1Ea/
X-Gm-Gg: AY/fxX4A8dNMcD1g63+hrvZlPaC/dU4GqAG1uH1DI2juT/uivi5fbq5h2++HqCQTLAp
	riPoOnsP3Mo8dMLPu7a7qDbBwTZLtlnoZZP4lDeTGZlnPu7+O4qFL53CAFS4ZVDuurmkp89nTFN
	s2CHJhfj81kl4Kvw73gZ/QHknJTMq3bCW0/yAWcJG4qv7Ee6aEneTSV8VhZwIK1ecZhGwlcMwAu
	tyuZI09mR+rhgx0MC4sLsESmlIwuZAUiYeMbz2IZRnfqbuHuvFu0zklu3wwMZYf9kRZ78FCLAId
	iHxfHTS59duML1pmLQ7Z+eRb4KGWCz9G3NUZlx73G2lfFn9WXnc5etQC/Z9rPcCW9+d62fGn4z/
	FBl/TTLj/qkbctDswFaOdGMg7BnLnSJyYSbUu24KrpDL8+uALVzeSpKLZuxTXpBap5pPS6yiMNr
	Z52YM+Ww1SxK8sYKr1
X-Google-Smtp-Source: AGHT+IHVU3uwgmuYvSLIBEuChOaTGJ1itV2wYM6ORLIdCQZS9BFIJGw3/RWBYiCCesKrugKb6K7gZA==
X-Received: by 2002:a05:600c:45d3:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-47d84b21188mr198858515e9.12.1768204643000;
        Sun, 11 Jan 2026 23:57:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm37420251f8f.36.2026.01.11.23.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:57:22 -0800 (PST)
Date: Mon, 12 Jan 2026 10:57:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn:
 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.
Message-ID: <202601111406.ZVV3YaiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 390c01073f5d0bd64db37926ddb232f33b83620d soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
config: m68k-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111406.ZVV3YaiU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/

smatch warnings:
drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn: 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.

vim +143 drivers/soc/imx/soc-imx8m.c

390c01073f5d0b Peng Fan 2025-04-23  119  static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
390c01073f5d0b Peng Fan 2025-04-23  120  {
390c01073f5d0b Peng Fan 2025-04-23  121  	struct device_node *np __free(device_node) =
390c01073f5d0b Peng Fan 2025-04-23  122  		of_find_compatible_node(NULL, NULL, ocotp_compatible);
390c01073f5d0b Peng Fan 2025-04-23  123  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
390c01073f5d0b Peng Fan 2025-04-23  124  	int ret = 0;
390c01073f5d0b Peng Fan 2025-04-23  125  
390c01073f5d0b Peng Fan 2025-04-23  126  	if (!np)
390c01073f5d0b Peng Fan 2025-04-23  127  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  128  
390c01073f5d0b Peng Fan 2025-04-23  129  	drvdata->ocotp_base = of_iomap(np, 0);
390c01073f5d0b Peng Fan 2025-04-23  130  	if (!drvdata->ocotp_base)
390c01073f5d0b Peng Fan 2025-04-23  131  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  132  
390c01073f5d0b Peng Fan 2025-04-23  133  	drvdata->clk = of_clk_get_by_name(np, NULL);
390c01073f5d0b Peng Fan 2025-04-23  134  	if (IS_ERR(drvdata->clk)) {
390c01073f5d0b Peng Fan 2025-04-23  135  		ret = PTR_ERR(drvdata->clk);
390c01073f5d0b Peng Fan 2025-04-23  136  		goto err_clk;
390c01073f5d0b Peng Fan 2025-04-23  137  	}
390c01073f5d0b Peng Fan 2025-04-23  138  
390c01073f5d0b Peng Fan 2025-04-23  139  	return clk_prepare_enable(drvdata->clk);

Call iounmap() if clk_prepare_enable() fails?

390c01073f5d0b Peng Fan 2025-04-23  140  
390c01073f5d0b Peng Fan 2025-04-23  141  err_clk:
390c01073f5d0b Peng Fan 2025-04-23  142  	iounmap(drvdata->ocotp_base);
390c01073f5d0b Peng Fan 2025-04-23 @143  	return ret;
390c01073f5d0b Peng Fan 2025-04-23  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

