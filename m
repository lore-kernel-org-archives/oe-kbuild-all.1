Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B12F8E98
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406367; cv=none; b=WjhzhnmVRxSsMv7cIDwFImVusObEwtoNhMMAyHAYWtdt2cRCoB7te2W8kpnkPYAuaEndoMNP+aB9IId890Sbc9jfsoIEGufOCmlABVAb1QPhzfpPD5oTt7dozJD2XVpdYMAnNOsiTny066ADXyrBULrWGqAdKd6GKYPkIcmT6gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406367; c=relaxed/simple;
	bh=+CceKN2ws699t1ZqBDz15SYsl3cTGb/4vajhuz1N8Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLxc6hxARpTMPP7Hxtit+Hdkz3HboXdQnX0xL2n2Ed/fOi2/xCOatBL/HwkqHOS0cDcdrMr9cdFzX4sfO+nXWv70adzVN6y/5AlswkSR72ge47hT9QxxKNu1b6b12Q3N4r4qOUQLz/jaoKK0Jmd988mj8f+SUJwh/eGgFq3s4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtjYDGXD; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtjYDGXD"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8b7f937ef44so19111846d6.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406365; x=1779011165; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KAbR7vsIAj8ZBEhNBPo3PYKLN4kzerKm2zqXV0BBMw=;
        b=OtjYDGXDMEssr1prL/7Lf7eAl73MVX7qjiiTwHfqVDgsB6bvgR7gur7K3H2+ApZH6D
         VDX38uI8FywTrRviA+7xacfGTyX27peB70s+pG13498tC34eNxtqoCp0iEXwZs129JBm
         Q38SU0reaEy97YUsx3rNs0MswfrTyetQuYtTjUwopR0tZ1tc17nVb3rTO7yVq2qWG69j
         76QvzkKmwoHhT/BaHlhD73GUkN6BeGdB+AlTCgJS2ZLxmrGnTBfcXMw7x9UnVrECQo36
         /BYSCok9dkj4+ABLuCPblhCVd/umr2zTRmu67cKocfcWJCH2whVTugYV8AMBmOvFhx2A
         xD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406365; x=1779011165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KAbR7vsIAj8ZBEhNBPo3PYKLN4kzerKm2zqXV0BBMw=;
        b=O1o8ke/kJM+jz3Q3Z9QosggL6Dy13dbGYnzW1a3pzAT9IWxpXosZQEsKR6q+U4w9gG
         tiyBfiI5fxZGz2q+MYaJyhp7NdepoJjkyd289FWFd327WS8YxtywbwioE4Bw0JHWoW/J
         vtgnE5PJqAnvfrftmNHwgKgl4JgzicEPydx9vkH5auLA0ZkN+UsmyrUFvpcBRgsBuUAU
         lv0HJsz0kikMrRvSh08ysPKQArE9ty3ePcb+UNtB+QOx87j7q+kJovjj46nymxRdmgN7
         7kgkEBES31GaDMHkypplkL1iskp3l73Bh//2h235cKGmwT5HT+W0RgsH7xbIUzkERdtg
         NIGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SQmyuBfMFfKIZ68AkkuQLL4ijN7GHMb6ei+ny35xOodXsIOeEE/QDFA0lw20E3tupK8je24g5RjcjPK2i@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgt52OrJ6PjeqfHAT5LxLwm0Lbvp+XS7rdw2P6ZrI6Ud9zGJSI
	agtpoGMMk/qMRlJ7n7tlzNq7deRveYxqIOf8mXBprb8AYXCtfGOOrMCW
X-Gm-Gg: Acq92OFDIkNyH4Fbb7OkaGjn+x29ZvWwDWJjNH1yuMCzaRDSCF/VzYpFJUq1PtPGsKe
	pzvZXdvILRsAjdC6Q0SdmTo+P2Dl38ktsA8MhVVbRg5EwaEZbGfcW3w/rqEuptvfb/Eu1J+qbo0
	AH8nMxnz46MiC+gU+9qSFR4Adhi6itFwesONbZlxCaMtw6uuvmd74pRlJMMXH8s8upRS6oNppjx
	kSMIApWYyC59BH/8KILhhtIylSumxHqZdwSJCRHm1FAteKLId2DDVcPRGyQWT5nsO0JjNUTPROk
	mG2aYKPo3f2/ScAEbHk1krGzpPROLDnnDCjFDIiDFhA4F1Vehcznpzk8qWoq4PUpeQQA4rsXiRj
	s8B5YnaFmlNA37udhfMootOuX/Buzz49dpgbsjAj5vDMF0A9pabb/js33wnWK77e7QcjggFO72T
	4QJIMxsWhJKVo2W5Qo3g==
X-Received: by 2002:a05:6214:3f8f:b0:8a0:4e92:c45f with SMTP id 6a1803df08f44-8bc42b685eamr311568426d6.11.1778406365173;
        Sun, 10 May 2026 02:46:05 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d0702aasm299973856d6.43.2026.05.10.02.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:46:04 -0700 (PDT)
Date: Sun, 10 May 2026 12:45:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 17/19]
 drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to
 'dev_err_probe'
Message-ID: <202605101332.SfUuii8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 9ac13ff0fc75010681a6ea5fd694db592dea9069 [17/19] soc: apple: Add DockChannel driver
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605101332.SfUuii8x-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605101332.SfUuii8x-lkp@intel.com/

New smatch warnings:
drivers/soc/apple/dockchannel.c:241 dockchannel_init() warn: passing zero to 'dev_err_probe'
drivers/soc/apple/dockchannel.c:358 dockchannel_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
drivers/soc/apple/dockchannel.c:247 dockchannel_init() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +241 drivers/soc/apple/dockchannel.c

9ac13ff0fc7501 Hector Martin 2022-07-08  213  struct dockchannel *dockchannel_init(struct platform_device *pdev)
9ac13ff0fc7501 Hector Martin 2022-07-08  214  {
9ac13ff0fc7501 Hector Martin 2022-07-08  215  	struct device *dev = &pdev->dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  216  	struct dockchannel *dockchannel;
9ac13ff0fc7501 Hector Martin 2022-07-08  217  	int ret;
9ac13ff0fc7501 Hector Martin 2022-07-08  218  
9ac13ff0fc7501 Hector Martin 2022-07-08  219  	dockchannel = devm_kzalloc(dev, sizeof(*dockchannel), GFP_KERNEL);
9ac13ff0fc7501 Hector Martin 2022-07-08  220  	if (!dockchannel)
9ac13ff0fc7501 Hector Martin 2022-07-08  221  		return ERR_PTR(-ENOMEM);
9ac13ff0fc7501 Hector Martin 2022-07-08  222  
9ac13ff0fc7501 Hector Martin 2022-07-08  223  	dockchannel->dev = dev;
9ac13ff0fc7501 Hector Martin 2022-07-08  224  	dockchannel->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
9ac13ff0fc7501 Hector Martin 2022-07-08  225  	if (IS_ERR(dockchannel->config_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  226  		return (__force void *)dockchannel->config_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  227  
9ac13ff0fc7501 Hector Martin 2022-07-08  228  	dockchannel->data_base = devm_platform_ioremap_resource_byname(pdev, "data");
9ac13ff0fc7501 Hector Martin 2022-07-08  229  	if (IS_ERR(dockchannel->data_base))
9ac13ff0fc7501 Hector Martin 2022-07-08  230  		return (__force void *)dockchannel->data_base;
9ac13ff0fc7501 Hector Martin 2022-07-08  231  
9ac13ff0fc7501 Hector Martin 2022-07-08  232  	ret = of_property_read_u32(dev->of_node, "apple,fifo-size", &dockchannel->fifo_size);
9ac13ff0fc7501 Hector Martin 2022-07-08  233  	if (ret)
9ac13ff0fc7501 Hector Martin 2022-07-08  234  		return ERR_PTR(dev_err_probe(dev, ret, "Missing apple,fifo-size property"));
9ac13ff0fc7501 Hector Martin 2022-07-08  235  
9ac13ff0fc7501 Hector Martin 2022-07-08  236  	init_completion(&dockchannel->tx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  237  	init_completion(&dockchannel->rx_comp);
9ac13ff0fc7501 Hector Martin 2022-07-08  238  
9ac13ff0fc7501 Hector Martin 2022-07-08  239  	dockchannel->tx_irq = platform_get_irq_byname(pdev, "tx");
9ac13ff0fc7501 Hector Martin 2022-07-08  240  	if (dockchannel->tx_irq <= 0) {
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^
This should be < 0 since platform_get_irq_byname() can't return zero.

9ac13ff0fc7501 Hector Martin 2022-07-08 @241  		return ERR_PTR(dev_err_probe(dev, dockchannel->tx_irq,
9ac13ff0fc7501 Hector Martin 2022-07-08  242  				     "Failed to get TX IRQ"));

Otherwise we'd have to set a correct error code.

9ac13ff0fc7501 Hector Martin 2022-07-08  243  	}
9ac13ff0fc7501 Hector Martin 2022-07-08  244  
9ac13ff0fc7501 Hector Martin 2022-07-08  245  	dockchannel->rx_irq = platform_get_irq_byname(pdev, "rx");
9ac13ff0fc7501 Hector Martin 2022-07-08  246  	if (dockchannel->rx_irq <= 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

