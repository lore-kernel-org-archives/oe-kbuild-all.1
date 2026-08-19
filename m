Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E13D6CB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126072; cv=none; b=R1RJwaeTaC6s0D7CiUPeQUl4FHngDhbgMyRxjc9K9dVz8ckCWobhLqrPNFZi53PxQSTGqHOGyVHoY/IluFIHHM796TsZY3JFT5rx0EmLDG1YNfNfcsZUUDuTz5G8bPrgz+zOrDfV8w3Jw6MhtVulqJxgEYL99h47VcAbzoKjBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126072; c=relaxed/simple;
	bh=j2GqdFYYlLOEa6zkfp5E5Yc6Z2CKz6WYSmsQ3wr1j6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcyRegygT3ysGsNTnQxIILUSWLaXSNW5vJgN/EGT5FwhKgOExcWfJehgHONMMLhKPe8GHvrEB1wm0Aiw6bXIo04cPoJlnymNcyZPPme+0ggGKKSXcfffKnN2au0qES7S51bwnx4i9kniBUU7YMrrRgWFeIvSFlDPr/y/zVp+SIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIg/hDm6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIg/hDm6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso5298755e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787126069; x=1787730869; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXyjcjL3bnTlnkKMFFgkBYIHbcZl4/hc7w/BVYgFeCU=;
        b=WIg/hDm65x5o0Hnan6G0A+FhTdr7YHfgNITkVO/mKRkUwdxDywGu9hB3Yo+/KT7zRI
         JUJ8aU/JDe9LnTWEyMLUGH5If37JT4PDPTf4nfv+o/+nLKx2LIql2jWIwAb18XXkZ02n
         zdW/DKmMAl/DNdnRib7ude/1OiH7qvnRnia+QTsPHBknboubwsfCDs3/w3OD0gwCkJfs
         UoEPNB/4epQWQYeqZz6TQMbMQOKZnHgd80yUk8QtyMx67+pKvH53YqrX+DmJbHRDsy6M
         WDY3FiNsnWJ26BNb45YPK5kSyfa18PKxkpAg7r5SxmzajOH0ehfReD73AUdy5X/KeRdV
         CVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787126069; x=1787730869;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXyjcjL3bnTlnkKMFFgkBYIHbcZl4/hc7w/BVYgFeCU=;
        b=pxHLuTEHsQbOYvPdZlNjFt49wsBTjwCO8Uj/JTGaFkEQBEylAaBR3pHS0q346ZSnhj
         A1KZ/afFQU+v2omgcHfaOgPRrHmuBIG0sbIIar+grP6RpDlbUmjz5iMFFVpqGhn+dxud
         z9nhD6wi/3KsN/on4royD88Bl105/+pCkzRixu17D37qLqlTVDohZBX80rCE4ROBzRlC
         kJyg/Xu34Y90TbqsQnVvYS4fY8iDSQykq/oVrTlxXrfofdaf3VITmfKaI95DJrCHravW
         nsiGPX1FEv5OFOqhsawrZhv/RnojGundAnPXA2rPSqBXEptyEDY77CnVo2kaoYZ4vfHg
         pJig==
X-Forwarded-Encrypted: i=1; AHgh+Rrnq4X0LC7gBI8/zeZvS8AihIxgpCLTyoQX/jqlMr02EFeK+75tjX+SNoBrEYJu93nBidT5XO0N/Ipn7wbq@lists.linux.dev
X-Gm-Message-State: AOJu0YyzeQT0iePdSUPiE79mUP5Ro/S/xG3/DrNzfJAuLXtRE9xN3ee2
	UGqVIA0PaJngXFtZ8R4QzxyIBtB/vG72OfFZjfx5vVQZLS/xBtbDYgl8
X-Gm-Gg: AR+sD10cXOUI21XKuX/GXChQzPh2kKY/HcBxyk6VuAEihIfkZoUj4okuNPEonaLZu1C
	MsL9y+yyalM/5fyTV2s2JXueyPEdgtwle382Uea2spvYrig7iVaTDERGvKTcJ3sRJF87eqUauKN
	yYaNhENyb9Y9NP4QIsPyE6zO8jw6QLr8sQdf2OVz2Da1NAGUanjcaFWUnZAYNGjVJUfFBbKlmf8
	Zyryx5Ofm8maI43muMr1oiJQD/f5UDPnm+QByQogFhuTXHvjCJ8e8ifvPwwETKItV0DVwIIFSc6
	3d9GPf36jid/fhZrCz62mNp0Jbpup8R1PlZnbLUXCzFAOVwHRi23rWUItou+nEPGtbfmDcO9iaU
	xRwXXE1+MvoHF2+ZCIFgYjkwOMNQaR5oSd+mfkjYuP3000fhu7AsyX2/n3gqNkLBAzEdy1fsEia
	H+enziJtRWTHmLwepnW7cIecARLreISWMgVTFvydoifpQ2EMu0piOKR5Vs+g==
X-Received: by 2002:a05:600c:1d1a:b0:493:a623:d090 with SMTP id 5b1f17b1804b1-499aa1dde53mr44247205e9.10.1787126069040;
        Wed, 19 Aug 2026 00:54:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6964sm39163725e9.9.2026.08.19.00.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:54:28 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:54:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 200/200] drivers/mmc/host/sdhci-pxav2.c:318
 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null
 (see line 305)
Message-ID: <202608191405.jP6epa63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: c12d647b0229f4d75a2973c9b4e79f9b53406426 [200/200] remaining pdata removal
config: parisc-randconfig-r073-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191405.jP6epa63-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608191405.jP6epa63-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-pxav2.c:318 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null (see line 305)

vim +/variant +318 drivers/mmc/host/sdhci-pxav2.c

e41c48b4bcb3ce Doug Brown            2023-01-16  295  	clk_core = devm_clk_get_optional_enabled(dev, "core");
072f5e2c34a95b Binbin Zhou           2025-06-07  296  	if (IS_ERR(clk_core))
072f5e2c34a95b Binbin Zhou           2025-06-07  297  		return dev_err_probe(dev, PTR_ERR(clk_core),
072f5e2c34a95b Binbin Zhou           2025-06-07  298  				     "failed to enable core clock\n");
e41c48b4bcb3ce Doug Brown            2023-01-16  299  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  300  	host->quirks = SDHCI_QUIRK_BROKEN_ADMA
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  301  		| SDHCI_QUIRK_BROKEN_TIMEOUT_VAL
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  302  		| SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  303  
dfe9746aed2d12 Doug Brown            2023-01-16  304  	variant = of_device_get_match_data(dev);
dfe9746aed2d12 Doug Brown            2023-01-16 @305  	if (variant)

This assumes "variant" can be NULL.

b650352dd3df36 Chris Ball            2012-04-10  306  		pdata = pxav2_get_mmc_pdata(dev);
dfe9746aed2d12 Doug Brown            2023-01-16  307  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  308  	if (pdata->flags & PXA_FLAG_CARD_PERMANENT) {
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  309  		/* on-chip device */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  310  		host->quirks |= SDHCI_QUIRK_BROKEN_CARD_DETECTION;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  311  		host->mmc->caps |= MMC_CAP_NONREMOVABLE;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  312  	}
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  313  
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  314  	/* If slot design supports 8 bit data, indicate this to MMC. */
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  315  	if (pdata->flags & PXA_FLAG_SD_8_BIT_CAPABLE_SLOT)
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  316  		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
9f5d71e4a78a02 Zhangfei Gao          2011-06-08  317  
dfe9746aed2d12 Doug Brown            2023-01-16 @318  	host->quirks |= variant->extra_quirks;
dfe9746aed2d12 Doug Brown            2023-01-16  319  	host->ops = variant->ops;

But later it's dereferenced without checking.

9f5d71e4a78a02 Zhangfei Gao          2011-06-08  320  
f35ca223882aa6 Doug Brown            2023-01-16  321  	/* Set up optional pinctrl for PXA168 SDIO IRQ fix */
f35ca223882aa6 Doug Brown            2023-01-16  322  	pxav2_host->pinctrl = devm_pinctrl_get(dev);
f35ca223882aa6 Doug Brown            2023-01-16  323  	if (!IS_ERR(pxav2_host->pinctrl)) {
f35ca223882aa6 Doug Brown            2023-01-16  324  		pxav2_host->pins_cmd_gpio = pinctrl_lookup_state(pxav2_host->pinctrl,
f35ca223882aa6 Doug Brown            2023-01-16  325  								 "state_cmd_gpio");
f35ca223882aa6 Doug Brown            2023-01-16  326  		if (IS_ERR(pxav2_host->pins_cmd_gpio))
f35ca223882aa6 Doug Brown            2023-01-16  327  			pxav2_host->pins_cmd_gpio = NULL;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

