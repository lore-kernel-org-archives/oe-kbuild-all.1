Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE10356A07
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769870164; cv=none; b=FJTyCKsqlNBqXSB4p8K1oMdXVoyvlRAIRjF//ZkLW1lNrHO4QKCVCM/NeELYyBvMBdFTrQdaiqpWl2jyWqmlXxgb9ndBXpTSS36JKOr8m990GYnOJ+Y+PrlxyocDgrYMxSKB+F5SAZ1Ht3EIPbQ1+w1dlJw1oz1uLn8F5L225ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769870164; c=relaxed/simple;
	bh=zvie+874fTn75a3eXFaIOd8Atel+XaljTeurFJOSLEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NZVC9K3eciJDq4LCbH8ETupvRnVS/1YSeOTb488P/n6CY0YtbRx86AwdRXcIBW101e8oYrLlNRF5+5P5SCtInmD6dmIDVf6hQ8nrtr4vqbIOIEJSuG/elu9YEA+Y0Yx/UECkyF4N1nj/vksxFaR2OPykj7XD3eJx4qqUgD/V40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJvA5Nk9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJvA5Nk9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43601e96f72so35664f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 06:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769870161; x=1770474961; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sVSIbao0S7N2+ApNZzv364LLiL6KFRy4sHA0aE5O/xE=;
        b=yJvA5Nk9cGMnqpQk/4een8veJepW86hvB/w//F72PBuPIHEgnpe/1EvA20PL7n/nHV
         nj3EuqSVC1AMeRrCXIWhNAIJwEokOred9I4QpnxZoplaUgxxoSIb41cG+4UqY73NVQ8c
         6/RXGa/9l1aeUijqdZi7Ye+ZsL7K6GcrOYzROs0aumYeQ+PBrtmT2SLFsrFivsntBhkl
         J8X85dUZ9i/jQ4MryX3HyyiJan5Cm7a+se7ULWbOTdiTWJnMMB0u8KuPomOs3gSwWRp+
         EwE2GtCQdgDAKG4e7h01p/DEKz4E++ghpmE0Cndok1jKXPW9EOG9nH+NnJGpc72SK531
         dItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769870161; x=1770474961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVSIbao0S7N2+ApNZzv364LLiL6KFRy4sHA0aE5O/xE=;
        b=TSfD242OaHMmLRBxkmYj5xCfMdc0joKKKqpBylwGE1LSBhOnu1j+cJtcOMyWfJcwF6
         Qvc0mI/hKdN1YO6AyeFvbBLvJYj+kk9kexyHuQi5bj4kqKtu4Tlh/QflM+IoO1+G1w3n
         k8o1I6h9IX6NPLAg+VqhS6FEArKYuIpH4pb/eaS3Zgfxu/faOdpS9jKJ7NcC+F1rR7xx
         Unu2+wOXjJrYyK4xTUAF0boqPYRwbVTaqo0XjWDslK2U1YtCf1efpL4yejdbbf7dpBh9
         NrHOFaNXoVV4BtLm74MtSElPDK0PAQwGgf1aZGq0383YxWW6qWfCSISED2fkeqy3c4jK
         +pOg==
X-Forwarded-Encrypted: i=1; AJvYcCVdylwMvoRRE3RF955YOD/JY7hm38ZJrRJv8nID1cVfH129SiAFCdoRB+BLMTfWn/YnddN091MaAN1VhABQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzonMivKu6bmPVcqCuuir2zcao5Bwe+W5OPnKE8GhHrVnC+Nte1
	Wo6iRGbbNMvyi2Q+trplxai1eqT5yYAoesHBC+eFGxl7uzoh7ruxYwNWO7QHJKZ/8Bg=
X-Gm-Gg: AZuq6aL1lS68T+M8kGaLTY33n3LX7QalEoaSf08djh7qNpVPM3Wmc+oaWJHaMz4w82f
	f27Drxfi6qqs0UDZ2aFrpovaA81LtM/TT2PYiNncBzynK4gVXHuzfoCspNVH+g6485O1RqJ56do
	VKyqcXMjLJGqZlCosZCqprIYYKInk2kqR68bcOlWOA9E+jlOOggXejPSfCkMNgKLBFH6qGvbVj5
	11s6ur4qun6Fm5ggbR0yA1Q+8hBYSWIU1OjmLefI+qsYqdn9EuI8lg5vsIo0dZFiAOtLJ4+XlyA
	7YEFNY98+UQxZIuxvpYcU2wfVywIUI9IbtmsoLM5x8DEJ6eCGMwFWxx0uURaQUvOCcFiZPgRg9a
	3Dd6WRO/B2haDVLRv7bKesWfb+T4C/6yN/7CHuqco44S1e06E3O8mxjAN9yeQy64nsle9LVB2Yn
	JyAqghlfFqmllMmPl0
X-Received: by 2002:a05:6000:4382:b0:435:99d5:9d8f with SMTP id ffacd0b85a97d-435f3a742f4mr9016413f8f.19.1769870160665;
        Sat, 31 Jan 2026 06:36:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm29840712f8f.11.2026.01.31.06.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:36:00 -0800 (PST)
Date: Sat, 31 Jan 2026 17:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
Message-ID: <202601311615.10yziOui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260129-i2c-xiic-v7-5-727e434897ef@nexthop.ai>

Hi Abdurrahman,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130-054653
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434897ef%40nexthop.ai
patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_get_sync() also returns 1 on success

vim +1539 drivers/i2c/busses/i2c-xiic.c

e190a0c389e601 Uwe Kleine-König    2023-05-08  1529  static void xiic_i2c_remove(struct platform_device *pdev)
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1530  {
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531  	struct device *dev = &pdev->dev;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1532  	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533  	int ret;
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1534  
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1535  	/* remove adapter & data */
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1536  	i2c_del_adapter(&i2c->adap);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1537  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538  	ret = pm_runtime_get_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539  	if (ret)
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
810199f7315604 Uwe Kleine-König    2022-10-19  1541  			 ERR_PTR(ret));


pm_runtime_get_sync() can return 1 on success.  Perhaps use
pm_runtime_resume_and_get()?

810199f7315604 Uwe Kleine-König    2022-10-19  1542  	else
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1543  		xiic_deinit(i2c);
810199f7315604 Uwe Kleine-König    2022-10-19  1544  
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545  	pm_runtime_put_sync(dev);
2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546  	pm_runtime_dont_use_autosuspend(dev);
e1d5b6598cdc33 Richard Röjfors     2010-02-11  1547  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

