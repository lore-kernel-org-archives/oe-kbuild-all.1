Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FAF7DA7F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748846904; cv=none; b=W7UXgep01UTMkQmofCr/vnTNraXasypRK0IhfYuUFM7ii4OzkTECMvdefqrKsNYI+7E3mn14TtfbdEoyJUMxdeAQ/Ax8yxct0wQ+rM78YJTjfg3afdFuVe/RlCMBEiYyZi8B1FAg2ro7N5ulmVEoelwYTdMeywy/g5o6j+VWsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748846904; c=relaxed/simple;
	bh=vKIZimpTaaE4qOmtV3rnMnKdHaGiSnz5hcrtealLAlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=q6fP7UliqiPRYxSdkYgvB1cJA7rv4EedHZCrRTaDZr3De6OuOt6hkkuQMx7GGD1wTM8UrVyBld5wvxsES6SrpN+Dl0tAJ1AxFSMPPB6PfgyIwSOEWLCIp8C+2VoFhbkaI/4+1O0/CTDOrQfE+VJOvEZXKvibkghImxLCB2luBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JqMjtU+a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqMjtU+a"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so28319835e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748846900; x=1749451700; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UGYcGfMDZ2DmHAoNlC5WwvnZH/3MHq1zzxTB0uBni8s=;
        b=JqMjtU+aNb0QVl4yxGU9GeGhcdRyQHi11DzS+je44o9K9A+MMcJRPj7ssdM6G2LwaU
         1kuvFvIBX1n6AMdfRSJWqa17LiKvhgR/wV8Ipyyw1/YaCd6VgTFwuO2KNvh4Y4Zf1kM/
         kC9V7KnQlfgN8pfE4myBr2Anj+IFtrbl4JANc5+CUmdMFcljXds+1YFWQ882Ms8rwNZZ
         wvFcu8cTq+i6DKBG+ylYNS3DD9iuWtDYavKSHvPz5817hRGRbQanmtOZWwB/N/KGmDIq
         QakqJGNeuZvDlfx4kGh910yc5YIASYAkkbNRvOG6HLuDeG4VDS5XIQUFH59D3cPD6wxO
         NPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846900; x=1749451700;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGYcGfMDZ2DmHAoNlC5WwvnZH/3MHq1zzxTB0uBni8s=;
        b=DhglF1guS3M4aVJNwFoBOx2pNCRO4N8JE4xAz+TL9Mx43VZWkgBvto90QovIQN/q0q
         3Dk+1wMjxLLHbnDDXpj7g8Te2a9jNpEoHZwdSIDnAZNyFQS52x33FDCNhxfsDBH+JDK4
         qEk4bjWriz6/IZ8grSUodkBVJT0lPvE6JvuurPKBezRLCiaO7H62AnBne+liG2pbwjCQ
         HC3AnRQRiVSDDY3RAZY+d8u2ZBTcUyVzmWcCQBgSwJgCAVCdzR9wNaGEGINLjxzchFZ0
         3sNkz3q27mHPsmeGWp6uttwkSvhdXOepoE2/h6rHA1xBpXyasVR6ZrXqVKnONguyzaLz
         k3VA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ST8KO3rrEvXaMnbhEPK7g6MX4IUCyWqnLLSLDU/3e0n/p6cIRwD7vK1RPTLmwFhBSa/cL1bbW2bA3lt1@lists.linux.dev
X-Gm-Message-State: AOJu0YxMM0OhkXd5JNzg6vzKzWEb1XWy4HOGb0zafbtrAgNSBHRUhSSv
	qHZ2+vPJLVCBf98ILKX/6kmvKNq4joXLxmK1KG4mSyNJsmYzjUHUDckBt7pIkKgcTP8=
X-Gm-Gg: ASbGncv4pjYOUxX+RW3cv3lsqOp+5WrJiE7aITI2tFDCq+3yJMfbqI8BkNnv/7MjctS
	ZvIZIxjL0Vhr9FMQTB3JAnajLWiBQMsRImQEh/of0Pg0MPnK5f/cf3iXL5woT18LjyxSQlHSYgD
	R9cut9GD6l3r06aZPkhIganeMVEiYLG//XXFhYoKBmMUpaeJLvjfGk+fe822wUIi0SQQX8EorgU
	SBFQhCWz9el1z3rfzyAM2cXouJ03kj6wEz0lmBJjaBP+W/8WqjxvansRPMMjXJoHMQZfuH2bncj
	sanXLBa8VHFWQAudkhS2ET6+mE9sIvj2yLE5YDv2pYOD9NjiIawtoS2EGJKMsLL9FA==
X-Google-Smtp-Source: AGHT+IFqFO4rW3RSXfE/U6h/VokWGUsgcVzZ5j/9AyBTiFeKRO2EovFEcdOooegUPlhIVlnxD3azXg==
X-Received: by 2002:a05:6000:2289:b0:3a4:e8bc:5aa with SMTP id ffacd0b85a97d-3a4f89a5bc2mr8706782f8f.11.1748846900467;
        Sun, 01 Jun 2025 23:48:20 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fc1adesm111519205e9.33.2025.06.01.23.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:48:19 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:48:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hu Ziji <huziji@marvell.com>
Subject: Re: [PATCH v2 32/35] mmc: sdhci-xenon: Drop the use of
 sdhci_pltfm_free()
Message-ID: <202505310526.Nh371Swn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b79920fa8bff8f7cf2f407863846446344d2eab7.1748515612.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-sdhci-Use-devm_mmc_alloc_host-helper/20250529-212928
base:   d2c6acff6386f43ed307822454b970c831c48f1b
patch link:    https://lore.kernel.org/r/b79920fa8bff8f7cf2f407863846446344d2eab7.1748515612.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 32/35] mmc: sdhci-xenon: Drop the use of sdhci_pltfm_free()
config: i386-randconfig-141-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310526.Nh371Swn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505310526.Nh371Swn-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-xenon.c:536 xenon_probe() error: uninitialized symbol 'err'.

vim +/err +536 drivers/mmc/host/sdhci-xenon.c

3a3748dba881ed Hu Ziji         2017-03-30  509  static int xenon_probe(struct platform_device *pdev)
3a3748dba881ed Hu Ziji         2017-03-30  510  {
3a3748dba881ed Hu Ziji         2017-03-30  511  	struct sdhci_pltfm_host *pltfm_host;
1542488031deed Marcin Wojtas   2020-12-04  512  	struct device *dev = &pdev->dev;
3a3748dba881ed Hu Ziji         2017-03-30  513  	struct sdhci_host *host;
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  514  	struct xenon_priv *priv;
3a3748dba881ed Hu Ziji         2017-03-30  515  	int err;
3a3748dba881ed Hu Ziji         2017-03-30  516  
3a3748dba881ed Hu Ziji         2017-03-30  517  	host = sdhci_pltfm_init(pdev, &sdhci_xenon_pdata,
3a3748dba881ed Hu Ziji         2017-03-30  518  				sizeof(struct xenon_priv));
3a3748dba881ed Hu Ziji         2017-03-30  519  	if (IS_ERR(host))
3a3748dba881ed Hu Ziji         2017-03-30  520  		return PTR_ERR(host);
3a3748dba881ed Hu Ziji         2017-03-30  521  
3a3748dba881ed Hu Ziji         2017-03-30  522  	pltfm_host = sdhci_priv(host);
bb16ea1742c8f3 Gregory CLEMENT 2017-10-02  523  	priv = sdhci_pltfm_priv(pltfm_host);
3a3748dba881ed Hu Ziji         2017-03-30  524  
f75fda3730728e Marcin Wojtas   2020-12-04  525  	priv->hw_version = (unsigned long)device_get_match_data(&pdev->dev);
f75fda3730728e Marcin Wojtas   2020-12-04  526  
3a3748dba881ed Hu Ziji         2017-03-30  527  	/*
3a3748dba881ed Hu Ziji         2017-03-30  528  	 * Link Xenon specific mmc_host_ops function,
3a3748dba881ed Hu Ziji         2017-03-30  529  	 * to replace standard ones in sdhci_ops.
3a3748dba881ed Hu Ziji         2017-03-30  530  	 */
3a3748dba881ed Hu Ziji         2017-03-30  531  	xenon_replace_mmc_host_ops(host);
3a3748dba881ed Hu Ziji         2017-03-30  532  
1542488031deed Marcin Wojtas   2020-12-04  533  	if (dev->of_node) {
3a3748dba881ed Hu Ziji         2017-03-30  534  		pltfm_host->clk = devm_clk_get(&pdev->dev, "core");
3a3748dba881ed Hu Ziji         2017-03-30  535  		if (IS_ERR(pltfm_host->clk)) {
3a3748dba881ed Hu Ziji         2017-03-30 @536  			dev_err(&pdev->dev, "Failed to setup input clk: %d\n", err);
                                                                                                                               ^^^
Use %pe and pass pltfm_host->clk as the error code.

6773eb1cf68bcb Binbin Zhou     2025-05-29  537  			return PTR_ERR(pltfm_host->clk);
3a3748dba881ed Hu Ziji         2017-03-30  538  		}
3a3748dba881ed Hu Ziji         2017-03-30  539  		err = clk_prepare_enable(pltfm_host->clk);
3a3748dba881ed Hu Ziji         2017-03-30  540  		if (err)
6773eb1cf68bcb Binbin Zhou     2025-05-29  541  			return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

