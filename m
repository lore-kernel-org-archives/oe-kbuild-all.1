Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6BF1DC985
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161159; cv=none; b=Hoih4lqGL4SfnEU/BVlTvfmdbXGp0kkj2BIKbl4vZtwWF22s5obfau8rza+FACKwQH9Ve9xw4PvckuYRPBbaErLfyfVzpij2TLoyTmz+2+uoeRyjuHIpXsgNu2H9DtVVZWU9jej5ompnVV3PZUK3TKV8w1kFsxOGAHHmdSVQu8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161159; c=relaxed/simple;
	bh=ErVrTjQTnrcJ4QgCkFLOVLncHkcN82/+t7EHdJX6nj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cA8Ty5DMBMd+cFIlBopvTZCmwhhrv8M4/1r45qdrWkT7rxo3yQZz9KaC9NTP8GfXpZE08jdu357c8au8yhx93feYnlpDx8qigT/Nvz4B85Ye7+GpGCqbDtV6j+0O9n4y7LLbob1C4Z4QDSbjlol0/GW77ff/dQP6wwcBSczyuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfFlhUg4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfFlhUg4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38637614567so6429574f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 02:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161155; x=1736765955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGHpVK1pgwjXUnuBrtM7o2RIlNaOXIumSPhdbcQwh8w=;
        b=LfFlhUg4Wbkx+ZQNVKOMrf6jc9CJqEjq5Z95uN7pNwWl9mj0b8bdBcA1mQTCv6ppx+
         EE+TMRp6N5nQCwS+3h9YHhrPUIKau2QlZRX1P9MOKYYkxJAyLEvzr9XFmOenqFBV/KDg
         tApRDxTZZFH5k/lSa2ThpSrnhFr9GyZ30oqBIPGSh9EQm2vKeswYEJUbQ9KihmRmwPS+
         LRlFl85pStGo28daJiaED9Kemig320WkMf89wuqwwRDN5J1E+zYZpBN1sFv/Ol6qlCYp
         5qRU+rTb97eJqFOscOgDUHJ3N5qwF+5gYNwNWoQnEY0lGRu4NZXFeJKMChgWEX6+oYp2
         pQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161155; x=1736765955;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGHpVK1pgwjXUnuBrtM7o2RIlNaOXIumSPhdbcQwh8w=;
        b=e1q/wz/9R4XNqyrfli8wm0Uu/naycRLkZZDraSED1vGP1/Hfsi3RUpvgV4u9dQOm9k
         Y3czW4cxmA4LrgChZELK4CUwURQIF85WXSSPRIG9uP1noqe6ZbWu3J3MYq47paJDU9Iy
         BhNo99z6DEdPjDLQl4gcni4mRtPk4IJrx5b6Kw6inxjOgsYvOBjjzGR4+SY8bBptSCSO
         AjOBmhwIDaWKJ+l9BAJC5+9Z6dZTOxQj7QHj43jZga8OBOrszaFNIEnhDuO77Djr5tgt
         bRbwYSkVzvgaZ0rVrG5mvA0/fFt/VezBmZtBfYbfVQTFCCULJaimMr9gx5gRYdwGAoWb
         Wq/w==
X-Forwarded-Encrypted: i=1; AJvYcCUYnecAsNBPtYkM3FyO1ZKXCmsia3+wPS5lhSh3SqJzNMS2L1pdRT27lhENsSZXZphLFfd2JfKLstMpcO8y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx64AkTuAddQuqPI7Bu56/BvAQ2mtInzmb2FSNss/AC9MEXbyWL
	qoVyHp/XsSbjV3curBcsxeQhr2tzX+MGIduKMRPWedtihYKXAWvy49UE6uBAp2Y=
X-Gm-Gg: ASbGncsr8Kxy4QQB0hK3OsxOIwvmil7+SkAQnka97sLjTrVBUfJG+rqxlUkdb0Cp1zw
	27HO8qNWVEHcPtW+3Mqsjec5KJzqY7Pg9dYrcPN9Yk5PFc6B0fScsTcktRAEWNQ0OskPe0zbGDu
	WKzazaIM7RxMiWfntkqIdU1HDdy77ji2ZdZ+9eiRefDxq6rfSktWW6FUEYE+ZpKiHleGK9PFTf1
	eROtac5ei4oiyZY1lUEPCvKjniMaJD5FBQ5iMZwb+6W2Wggwiqszu7n8/UBvA==
X-Google-Smtp-Source: AGHT+IHjGCBAHYcrmzbtuFGrX2DIGSLhoBn+LUgUMGhredPFuHNSJWEpV6FO9CkvBHijZu0wjs3jTw==
X-Received: by 2002:a05:6000:2ad:b0:385:e8f9:e839 with SMTP id ffacd0b85a97d-38a224063b2mr43747658f8f.56.1736161155021;
        Mon, 06 Jan 2025 02:59:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm565202195e9.43.2025.01.06.02.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:59:14 -0800 (PST)
Date: Mon, 6 Jan 2025 13:59:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Greg Ungerer <gerg@uclinux.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] drivers/mtd/maps/pismo.c:243
 pismo_probe() error: we previously assumed 'pdata' could be null (see line
 226)
Message-ID: <c25c37d3-eb4c-42de-b961-7eca78ab6a8d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   d03e292d5f72c15f004a13503f4a5cca0a26bec0
commit: d03e292d5f72c15f004a13503f4a5cca0a26bec0 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r073-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310053.VgXsTpPO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412310053.VgXsTpPO-lkp@intel.com/

smatch warnings:
drivers/mtd/maps/pismo.c:243 pismo_probe() error: we previously assumed 'pdata' could be null (see line 226)

vim +/pdata +243 drivers/mtd/maps/pismo.c

0b79d5d1e5982b Uwe Kleine-König         2023-02-26  209  static int pismo_probe(struct i2c_client *client)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  210  {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  211  	struct pismo_pdata *pdata = client->dev.platform_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  212  	struct pismo_eeprom eeprom;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  213  	struct pismo_data *pismo;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  214  	int ret, i;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  215  
752031210ca145 Wolfram Sang             2019-07-22  216  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  217  		dev_err(&client->dev, "functionality mismatch\n");
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  218  		return -EIO;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  219  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  220  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  221  	pismo = kzalloc(sizeof(*pismo), GFP_KERNEL);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  222  	if (!pismo)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  223  		return -ENOMEM;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  224  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  225  	pismo->client = client;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @226  	if (pdata) {
                                                                    ^^^^^
This code assumes pdata can be NULL

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  227  		pismo->vpp = pdata->set_vpp;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  228  		pismo->vpp_data = pdata->vpp_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  229  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  230  	i2c_set_clientdata(client, pismo);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  231  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  232  	ret = pismo_eeprom_read(client, &eeprom, 0, sizeof(eeprom));
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  233  	if (ret < 0) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  234  		dev_err(&client->dev, "error reading EEPROM: %d\n", ret);
395b228858778d Wolfram Sang             2010-03-20  235  		goto exit_free;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  236  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  237  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  238  	dev_info(&client->dev, "%.15s board found\n", eeprom.board);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  239  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  240  	for (i = 0; i < ARRAY_SIZE(eeprom.cs); i++)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  241  		if (eeprom.cs[i].type != 0xff)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  242  			pismo_add_one(pismo, i, &eeprom.cs[i],
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @243  				      pdata->cs_addrs[i]);
                                                                                              ^^^^^^^
Unchecked dereference

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  244  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  245  	return 0;
395b228858778d Wolfram Sang             2010-03-20  246  
395b228858778d Wolfram Sang             2010-03-20  247   exit_free:
395b228858778d Wolfram Sang             2010-03-20  248  	kfree(pismo);
395b228858778d Wolfram Sang             2010-03-20  249  	return ret;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  250  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

