Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C191D618E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155941; cv=none; b=Fd0FuePR4EaHZF3U+FxRv2sGD2JESqPI7U+Khqs+ByeUi3Wo5qa/cXGDGgXAajVITMpHS0RAL7sOdFGpjRagds9NLfo2PhTk7tN26EVZLmc4kyAFrTilSW2eOkwZSMaCGfhOSLBuZv5M91wmxYiWTnNCWqAXt116OYUMYbZDTB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155941; c=relaxed/simple;
	bh=j+5K/Yw15zWJf1U3wa5I1b3+ipxeNF3waXlDVublRJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6sjUx8On4mw34xzMqU1basIyZaBtCrbUbkfuXpZYMJZnu5tPfWfXRpS5W1Aw+p09022U427bV2p4UHrHaeas63pNcTDbKpE0EGRPYLhj6ZC/NtvBjkW+yQmMBB4wfCNCBXvhQOk+EdipR/d19WmEppXN4muzUn72yBSU/h1mNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeMqsbQJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeMqsbQJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3862a921123so9537833f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155937; x=1736760737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4wudLqt36meOHn2FyBRvJb7RBQuV91xkEx9ZCgxGr8=;
        b=oeMqsbQJ0T+vGB+gehEWyD+CznlyexrNGXeKkbTm+D2It+JwRusVtPL4QgsDUXisUG
         1m71BEsQxnW/5WpaDAvRZDx2WsRFPVHAwW0jACCibm7hJ39VTVhdLnD8wxt8AeN7KYaA
         beh8z/YvohRt7XGyL0pFEi1RLKv7bjwmSwAQJc6nF6qIR7Odf+UI5ARJyr8bPA9H2ZQZ
         LvSmL+ZEeaRpAHo2y+Purl/9LpkxhjLy3Fsgu4rATpPdVVVzxU9UpW/Gy62nlfaw0w0I
         1oe+Z0L8vkMueRpjdV8SdPgRed+C7v36dlm8WCo6+SvZ4Yf8fF4IX7ESnlPYzUg+tirv
         ZErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155937; x=1736760737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4wudLqt36meOHn2FyBRvJb7RBQuV91xkEx9ZCgxGr8=;
        b=XQTeaPRT3gcA5PpULoH4sYUseaN9ibn7PxFHQdY6ZDvV3vzTFG6SHMnnioPMJiwFFR
         UMwIc7PZ7B/J8JBE5xi/olD+YO5c4PNEZysM1JWJyNBI6iDuhlT6UI+HkaO3+QO5jO1l
         zemmQrri9Q6Vy4/moaxD4wdoPQ4RVsRyTxpHbn6PyhPu/NWdysEB61vfFoS/u8xhd8bk
         3KB844qrlEYmmjeFPi8sTjDVB9cBc6Wb52rp1iMb2kpclofllhB8IY41NbXpt5CLs1jr
         NAksOmMS+iohxyfraOZQJwDVvv6efPSOY9Kq/vSC+zE8F2ewKyT+Co3HA60l0w5+3PUC
         wgCg==
X-Forwarded-Encrypted: i=1; AJvYcCUdraJ33PdKYHiXBb/LqMEueKDwSBvbaTq3i9q903u6fcrOFXhPR0NVRDT1HqRZdiBWPq1WS44PyzThIEMx@lists.linux.dev
X-Gm-Message-State: AOJu0YwWUYD6+YAx+S7R1nzwV2g7srnJLaxjV97LBXJN7pmH+cMA/vwx
	x4rvTstN5n97oXX7pyCfveMwxPdBIgGcyGMOR5Ek6vAPOCJQUqGYtyhOLIKk+Gc=
X-Gm-Gg: ASbGncu3+cHzu63NOpSxfZPoqZkAK3NjIyP9bc/gN51H3v2xumNT+XTLnlSnpJ3LUj4
	aGs8A3O6+xZrrfWUnkzM+kZsEd4J09WKLAswVXSKPg9HysYcz+QzEADbeG80I+3AmiEcunP6x7Z
	RFvN5XS20YsPih3lJZWwu3BPJf1fH6HAV4ccOGVRh9wZkZ/VYe+r7VceMUxevAuC9J8poqxdA/5
	8ZWhfQb+h7/TKHpeyGCuTtF41aSi06M/sGI5PzcCGA1aTkXd3UyB8y267i8hg==
X-Google-Smtp-Source: AGHT+IGznhjdf9roPTBUrh2MEvUFKUvamB3tHvYpuQ5p6JfZYitbi6+g1EMjzXBFszXoYz9UAtvwrg==
X-Received: by 2002:a05:6000:18a8:b0:385:f7d2:7e29 with SMTP id ffacd0b85a97d-38a221ea539mr47426696f8f.15.1736155936734;
        Mon, 06 Jan 2025 01:32:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acabbsm47077330f8f.93.2025.01.06.01.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:32:16 -0800 (PST)
Date: Mon, 6 Jan 2025 12:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: [linux-next:master 3636/5236] drivers/spi/atmel-quadspi.c:1282
 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
Message-ID: <f3b27d32-1440-4585-9a78-cbd2fd47a992@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 [3636/5236] spi: atmel-quadspi: Add support for sama7g5 QSPI
config: nios2-randconfig-r072-20241222 (https://download.01.org/0day-ci/archive/20241222/202412222135.I9vxNl6I-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412222135.I9vxNl6I-lkp@intel.com/

smatch warnings:
drivers/spi/atmel-quadspi.c:1282 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1282 drivers/spi/atmel-quadspi.c

5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1274  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1275  {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1276  	struct atmel_qspi *aq = spi_controller_get_devdata(ctrl);
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1277  	int ret;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1278  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1279  	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1280  	if (IS_ERR(aq->rx_chan)) {
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1281  		aq->rx_chan = NULL;
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28 @1282  		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
                                                                                                                                             ^^^^^^^^^^^
The error code was over-written with NULL on the previous line.

5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1283  				     "RX DMA channel is not available\n");
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1284  	}
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1285  
5af42209a4d23ad drivers/spi/atmel-quadspi.c         Tudor Ambarus   2024-11-28  1286  	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

