Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6330E0DC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441179; cv=none; b=i9mt3twNPgkg/i/wgj65Gorrckon2bjVnTBhGxrADN6jbJZKOE2nndkEMYpKGW9VyzbdwSS10QdlaQIR1jbzvY+DiaxBxSBRmJG+v/tYB/6AJPu7ZDLfvLKzxzW+a+MTo021CJbS5hRh3pQaM65M8CDUg24zOKcmw8sZw/IrAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441179; c=relaxed/simple;
	bh=Q0gZk7svUBefQ/A5MPwWsKU99Yc6w3fK0LE0Qh88r7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iyKSeUI+yy4rQlLxVG4LXR9qjan/dhiqALg1yPXbrwsulcmBChJMsuVfcpgEzpZfyR6IZFfC87c5RGEUG4iu7iZTFOd6Q2iTwSAAtXeHbRFvDAvtGtb9WsQXfKQIBGGB9FrqrOsG8UZoZ2czJLnMUuqzMVGxlKPscdLucq7+gmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PZOWF2QU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PZOWF2QU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b6d9c981so470325f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772441175; x=1773045975; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdlDDX8VXPcYa2UYA/DhAef+/wnl+VGalN90V2Vta0I=;
        b=PZOWF2QUqe6mMGWvpovbond1dZrMtGPKsmiVzAAQdwj6gHRwNYsY78d9iK+KPO65GQ
         AiVw/882qfuTj+tpzQ7BuEM5nsFP/e1t31u31j4FYLF+2cOyq9KH6QtnOgRyS/H9tgdN
         gGxznD7YLp/n0JrIYRIDvx3rWYLA+ASb0CJNvi+rh0c5ZOeZAareKTrES1aDnEE3JT7M
         KFVY0VMlp1XWx+bCeUAhnqFA6hCNpnzBLlCw+ZTK6/mgPDOyt8YztLGJk+TW67xne/tS
         G2+ZWkU+pq5sPJKYMljQpbSMAiurbiBM3WjQOmizwkzEW96IFtyStW8P2WnQQewZCo9V
         uRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441175; x=1773045975;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdlDDX8VXPcYa2UYA/DhAef+/wnl+VGalN90V2Vta0I=;
        b=xC0mzWa0AN/fkrVBRdrnz1Z6T7FAR++ZRgd7s0Ff69W7wi2pKmkR6+hZ5LGAZDpHpf
         dkckaQ8yspZU0BucctDZl8BWDx3FxJjlOdvKHKFlh88Fq3lZww7RISp7Vi5YVuEsXwpU
         aje0ZIJTb8aBcaJq8nEntra817Hr9QBH0+0pZGYQ9AO6AEyOnQy540oPdlful6hRWsh9
         8j3rx5G6beiW9omjOWl+Pvr8M53OXOQLAibBorIxUzyflCAdCDmJB90N5qn/8Y5dVD79
         wq/odiTbYu6FVzwPk41QB8xUCv+YaRBsgBsl8Sakz2QkAUxYQ26h8goppF+8uphzrXzF
         Fwug==
X-Forwarded-Encrypted: i=1; AJvYcCVcjVCureXXXIyyhV0duof5knxIMcQe0qbeh1lIUh/WPLfqxzoW7pblZNZDBeIDCGi1YgxUjh3hLwu3ZpQp@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+p4ZKsP0lgWFEiMMeRpQX8GgfYVL4wyQJ+HMC2QS8jn802YgS
	q9gLnxPaPpMJ1sAxdBdKzcgKXLTyOXfRIe6nluHG7jcF4XJooodYQLdw3TmiTrtQKJQ=
X-Gm-Gg: ATEYQzwAW/m/YAflOq2M5BAvM/ejVSpR82oJFdJndVUCUU2K1zXVGrko0q1xpwq5A3Y
	PtXM7st9/0CgoqPerEfLZfAHpF04QIp6bBjXZvNidJubzj1v9bhazD/gIRo2oDXKhWZXUlX08cg
	kHurq/R/dr6SDL3LzejTTEzQi8KrNOyt/RCK93YaFM4SGZxpXSBIWNhwGQ9Woi1uUhvZUdijfdB
	WGRoW8E37QiCVDgV91ytUY0D7DkenoUFaYY6DyGBZwsZTlQzn8ueCjMQcUgtIkPawvioYnUlA8n
	NP8kM51GkuCl+ePnk91jh0rU6/JJ09HsyGrXu0dmOdBo2B0HohwE7JJZHUki9+hB0oenWfOM0Yo
	80B3J0+Sr0I+hRkPsWYj3Um4wvFvE3m0qYGDubGnQqHzhoDHwJVFFkMFubFhQ+oBdbhZmPXbBhI
	wH8FXLZH4ctj+Yb7kzuW/Ml65o5ZHx
X-Received: by 2002:a05:6000:238a:b0:439:b835:f939 with SMTP id ffacd0b85a97d-439b835fb59mr3557141f8f.19.1772441174946;
        Mon, 02 Mar 2026 00:46:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm3360634f8f.33.2026.03.02.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:46:13 -0800 (PST)
Date: Mon, 2 Mar 2026 11:46:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v4 2/3] dma: amlogic: Add general DMA driver for A9
Message-ID: <202603020642.3hq2CxZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-amlogic-dma-v4-2-f25e4614e9b7@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-A9-SoC-DMA/20260227-152743
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260227-amlogic-dma-v4-2-f25e4614e9b7%40amlogic.com
patch subject: [PATCH v4 2/3] dma: amlogic: Add general DMA driver for A9
config: arm-randconfig-r073-20260228 (https://download.01.org/0day-ci/archive/20260302/202603020642.3hq2CxZ7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603020642.3hq2CxZ7-lkp@intel.com/

New smatch warnings:
drivers/dma/amlogic-dma.c:354 aml_dma_interrupt_handler() warn: variable dereferenced before check 'aml_chan' (see line 353)
drivers/dma/amlogic-dma.c:483 aml_dma_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/dma/amlogic-dma.c:384 aml_dma_interrupt_handler() warn: variable dereferenced before check 'aml_chan' (see line 383)

vim +/aml_chan +354 drivers/dma/amlogic-dma.c

c01d15789f1d15b Xianwei Zhao 2026-02-27  335  static irqreturn_t aml_dma_interrupt_handler(int irq, void *dev_id)
c01d15789f1d15b Xianwei Zhao 2026-02-27  336  {
c01d15789f1d15b Xianwei Zhao 2026-02-27  337  	struct aml_dma_dev *aml_dma = dev_id;
c01d15789f1d15b Xianwei Zhao 2026-02-27  338  	struct aml_dma_chan *aml_chan;
c01d15789f1d15b Xianwei Zhao 2026-02-27  339  	u32 done, eoc_done, err, err_l, end;
c01d15789f1d15b Xianwei Zhao 2026-02-27  340  	int i = 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  341  
c01d15789f1d15b Xianwei Zhao 2026-02-27  342  	/* deal with rch normal complete and error */
c01d15789f1d15b Xianwei Zhao 2026-02-27  343  	regmap_read(aml_dma->regmap, RCH_DONE, &done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  344  	regmap_read(aml_dma->regmap, RCH_ERR, &err);
c01d15789f1d15b Xianwei Zhao 2026-02-27  345  	regmap_read(aml_dma->regmap, RCH_LEN_ERR, &err_l);
c01d15789f1d15b Xianwei Zhao 2026-02-27  346  	err = err | err_l;
c01d15789f1d15b Xianwei Zhao 2026-02-27  347  
c01d15789f1d15b Xianwei Zhao 2026-02-27  348  	done = done | err;
c01d15789f1d15b Xianwei Zhao 2026-02-27  349  
c01d15789f1d15b Xianwei Zhao 2026-02-27  350  	while (done) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  351  		i = ffs(done) - 1;
c01d15789f1d15b Xianwei Zhao 2026-02-27  352  		aml_chan = aml_dma->aml_rch[i];
c01d15789f1d15b Xianwei Zhao 2026-02-27 @353  		regmap_write(aml_dma->regmap, CLEAR_RCH, BIT(aml_chan->chan_id));
                                                                                                     ^^^^^^^^^^^^^^^^^^
Move this dereference

c01d15789f1d15b Xianwei Zhao 2026-02-27 @354  		if (!aml_chan) {
                                                             ^^^^^^^^
after this NULL check?

c01d15789f1d15b Xianwei Zhao 2026-02-27  355  			dev_err(aml_dma->dma_device.dev, "idx %d rch not initialized\n", i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  356  			done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  357  			continue;
c01d15789f1d15b Xianwei Zhao 2026-02-27  358  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  359  		aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
c01d15789f1d15b Xianwei Zhao 2026-02-27  360  		dma_cookie_complete(&aml_chan->desc);
c01d15789f1d15b Xianwei Zhao 2026-02-27  361  		dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  362  		done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  363  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  364  
c01d15789f1d15b Xianwei Zhao 2026-02-27  365  	/* deal with wch normal complete and error */
c01d15789f1d15b Xianwei Zhao 2026-02-27  366  	regmap_read(aml_dma->regmap, DMA_BATCH_END, &end);
c01d15789f1d15b Xianwei Zhao 2026-02-27  367  	if (end)
c01d15789f1d15b Xianwei Zhao 2026-02-27  368  		regmap_write(aml_dma->regmap, CLEAR_W_BATCH, end);
c01d15789f1d15b Xianwei Zhao 2026-02-27  369  
c01d15789f1d15b Xianwei Zhao 2026-02-27  370  	regmap_read(aml_dma->regmap, WCH_DONE, &done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  371  	regmap_read(aml_dma->regmap, WCH_EOC_DONE, &eoc_done);
c01d15789f1d15b Xianwei Zhao 2026-02-27  372  	done = done | eoc_done;
c01d15789f1d15b Xianwei Zhao 2026-02-27  373  
c01d15789f1d15b Xianwei Zhao 2026-02-27  374  	regmap_read(aml_dma->regmap, WCH_ERR, &err);
c01d15789f1d15b Xianwei Zhao 2026-02-27  375  	regmap_read(aml_dma->regmap, WDMA_RESP_ERR, &err_l);
c01d15789f1d15b Xianwei Zhao 2026-02-27  376  	err = err | err_l;
c01d15789f1d15b Xianwei Zhao 2026-02-27  377  
c01d15789f1d15b Xianwei Zhao 2026-02-27  378  	done = done | err;
c01d15789f1d15b Xianwei Zhao 2026-02-27  379  	i = 0;
c01d15789f1d15b Xianwei Zhao 2026-02-27  380  	while (done) {
c01d15789f1d15b Xianwei Zhao 2026-02-27  381  		i = ffs(done) - 1;
c01d15789f1d15b Xianwei Zhao 2026-02-27  382  		aml_chan = aml_dma->aml_wch[i];
c01d15789f1d15b Xianwei Zhao 2026-02-27  383  		regmap_write(aml_dma->regmap, CLEAR_WCH, BIT(aml_chan->chan_id));
c01d15789f1d15b Xianwei Zhao 2026-02-27  384  		if (!aml_chan) {

Same.

c01d15789f1d15b Xianwei Zhao 2026-02-27  385  			dev_err(aml_dma->dma_device.dev, "idx %d wch not initialized\n", i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  386  			done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  387  			continue;
c01d15789f1d15b Xianwei Zhao 2026-02-27  388  		}
c01d15789f1d15b Xianwei Zhao 2026-02-27  389  		aml_chan->status = (err & (1 << i)) ? DMA_ERROR : DMA_COMPLETE;
c01d15789f1d15b Xianwei Zhao 2026-02-27  390  		dma_cookie_complete(&aml_chan->desc);
c01d15789f1d15b Xianwei Zhao 2026-02-27  391  		dmaengine_desc_get_callback_invoke(&aml_chan->desc, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  392  		done &= ~BIT(i);
c01d15789f1d15b Xianwei Zhao 2026-02-27  393  	}
c01d15789f1d15b Xianwei Zhao 2026-02-27  394  
c01d15789f1d15b Xianwei Zhao 2026-02-27  395  	return IRQ_HANDLED;
c01d15789f1d15b Xianwei Zhao 2026-02-27  396  }

[ snip ]

c01d15789f1d15b Xianwei Zhao 2026-02-27  450  static int aml_dma_probe(struct platform_device *pdev)
c01d15789f1d15b Xianwei Zhao 2026-02-27  451  {
c01d15789f1d15b Xianwei Zhao 2026-02-27  452  	struct device_node *np = pdev->dev.of_node;
c01d15789f1d15b Xianwei Zhao 2026-02-27  453  	struct dma_device *dma_dev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  454  	struct aml_dma_dev *aml_dma;
c01d15789f1d15b Xianwei Zhao 2026-02-27  455  	int ret, i, len;
c01d15789f1d15b Xianwei Zhao 2026-02-27  456  	u32 chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  457  
c01d15789f1d15b Xianwei Zhao 2026-02-27  458  	const struct regmap_config aml_regmap_config = {
c01d15789f1d15b Xianwei Zhao 2026-02-27  459  		.reg_bits = 32,
c01d15789f1d15b Xianwei Zhao 2026-02-27  460  		.val_bits = 32,
c01d15789f1d15b Xianwei Zhao 2026-02-27  461  		.reg_stride = 4,
c01d15789f1d15b Xianwei Zhao 2026-02-27  462  		.max_register = 0x3000,
c01d15789f1d15b Xianwei Zhao 2026-02-27  463  	};
c01d15789f1d15b Xianwei Zhao 2026-02-27  464  
c01d15789f1d15b Xianwei Zhao 2026-02-27  465  	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
c01d15789f1d15b Xianwei Zhao 2026-02-27  466  	if (ret)
c01d15789f1d15b Xianwei Zhao 2026-02-27  467  		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
c01d15789f1d15b Xianwei Zhao 2026-02-27  468  
c01d15789f1d15b Xianwei Zhao 2026-02-27  469  	len = sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  470  	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  471  	if (!aml_dma)
c01d15789f1d15b Xianwei Zhao 2026-02-27  472  		return -ENOMEM;
c01d15789f1d15b Xianwei Zhao 2026-02-27  473  
c01d15789f1d15b Xianwei Zhao 2026-02-27  474  	aml_dma->chan_nr = chan_nr;
c01d15789f1d15b Xianwei Zhao 2026-02-27  475  
c01d15789f1d15b Xianwei Zhao 2026-02-27  476  	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
c01d15789f1d15b Xianwei Zhao 2026-02-27  477  	if (IS_ERR(aml_dma->base))
c01d15789f1d15b Xianwei Zhao 2026-02-27  478  		return PTR_ERR(aml_dma->base);
c01d15789f1d15b Xianwei Zhao 2026-02-27  479  
c01d15789f1d15b Xianwei Zhao 2026-02-27  480  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
c01d15789f1d15b Xianwei Zhao 2026-02-27  481  						&aml_regmap_config);
c01d15789f1d15b Xianwei Zhao 2026-02-27  482  	if (IS_ERR_OR_NULL(aml_dma->regmap))

This should just be if (IS_ERR(aml_dma->regmap)) since
devm_regmap_init_mmio() can't return NULL.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/


c01d15789f1d15b Xianwei Zhao 2026-02-27 @483  		return PTR_ERR(aml_dma->regmap);
c01d15789f1d15b Xianwei Zhao 2026-02-27  484  
c01d15789f1d15b Xianwei Zhao 2026-02-27  485  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
c01d15789f1d15b Xianwei Zhao 2026-02-27  486  	if (IS_ERR(aml_dma->clk))
c01d15789f1d15b Xianwei Zhao 2026-02-27  487  		return PTR_ERR(aml_dma->clk);
c01d15789f1d15b Xianwei Zhao 2026-02-27  488  
c01d15789f1d15b Xianwei Zhao 2026-02-27  489  	aml_dma->irq = platform_get_irq(pdev, 0);
c01d15789f1d15b Xianwei Zhao 2026-02-27  490  
c01d15789f1d15b Xianwei Zhao 2026-02-27  491  	aml_dma->pdev = pdev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  492  	aml_dma->dma_device.dev = &pdev->dev;
c01d15789f1d15b Xianwei Zhao 2026-02-27  493  
c01d15789f1d15b Xianwei Zhao 2026-02-27  494  	dma_dev = &aml_dma->dma_device;
c01d15789f1d15b Xianwei Zhao 2026-02-27  495  	INIT_LIST_HEAD(&dma_dev->channels);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

