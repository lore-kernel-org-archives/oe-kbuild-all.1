Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B13BCD37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067091; cv=none; b=nw0BO0CKWvuLaieJDMqQHAaZniYg4TekaAlNH932DPug/WDgGGTeSV+GMcFB/JGn1p/hOjbpylVEm76gwYLwA0v0GwCphmq+A+TmEBPST2aMY4QowUa8KxC3S9lTMi8h9D6JHwKktY/SGmYOYYd2ijQ/RxIafyiveV/iswnBhiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067091; c=relaxed/simple;
	bh=z3ypjf9+arMPxJcPS5+1S8YjdtGuJS1GQZhsg8O+eJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+scpOZKjgkECgwDgFRUHgaiMyRRBwLX3ER27M6Ueb4aiZ1E8qva5jAKa56gqekhwN6l2BrafeIg1238+by/SSabiuA/x90TJ3C7KLpGB3vbzN10bco36pteVVyYew4FtpUWMPzflqDOOUz1/PqwEWWL2Zl76POYPbUj/+B5+98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4pMwFOo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4pMwFOo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso68077225e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792067087; x=1792671887; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxfJL03yCUmbogf01UkuHJxurEyMn6HY9RwQo32N40A=;
        b=J4pMwFOokJhOcejRFa9IZaY1J48Qr+P4KK1I7SsTIpvcDVhsppRnUxflxkexgQwolQ
         19uCvSEw8Pe3chER+Sci/sa+khsocN4IKjqhmBAfIDLwff125j4fbftI+Ki6jwiIV0eo
         xpc28kAAaQrtA2XNoHa/IbGhRiGoKnehX3NhV2w5POvLXiXVnoorkshW2+RfBlsaZQrm
         cOhts7SoyJjomQXN4Vg3MuWkwtqstdSSTtZ727Xfx1XlThc4ck8AztXNU5NaWZvr3mZg
         H9z7JtGLm5Ie8Wob3d8hBH5Xr9N93/TAW7AuG9Ei49mWXiJvVhba7zuGZAXuHNG3+TFN
         JFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792067087; x=1792671887;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxfJL03yCUmbogf01UkuHJxurEyMn6HY9RwQo32N40A=;
        b=tJr2QDCEcXUJfU1+UCUw2iOF49qsJdxhzduK1ykS+6EWwQf92bbKookLHBVLKp5wyk
         5lJkcZj+w2WXM/ooS5NMvmJ8V6NF4/zcRFND8T3236UCfzfUWvr36wT0J5eNkZfjQaZl
         nzYW/8yP7u9yqAqeNcHB6pL6Cf6NchGBxlJBWumkP7rPWGFzrcOO4MwfUn1qApCYBONj
         hSRUyk8biddikwq9QLUmOYfBYeC2fHDAL/pifiFpBEeRuqXhUVqdg6qslmPpa9KEEJEc
         NLFRXADhf2leNB/HY8MM+nzInKF0V5iOlNDz2fE80C1UgigQgWA6BFouzyXki2z/1jLD
         Y+Og==
X-Forwarded-Encrypted: i=1; AKwUvBx/LADZ/CTOAXRDLlU5eXbfcGmtDuAut+JrFEJL5qabwmSueT0pgZKLzCt7+Tq6gCpTv1NCIlIuVqEDIDXm@lists.linux.dev
X-Gm-Message-State: AFq9FYKnKecoo5Lq1jn44d5zqcuoHcTf7Zkk+78usFsD3mmRw2/67jWK
	zQUneS/inD0r+XkhxRh/0DMy+QeHtaQhdv3xCzgEvl9+sLZIPFNw5X3m
X-Gm-Gg: AYBFou1r485gcHx5wju8hv8vRwHLCzTMD87t2X26i9x4noN5X5ZdzmpKGlsH3Wj4zDu
	8+UylrTYTZQYSKsVLngM/WXn9RzopBcXQLiP7uRsuaM6n5071ikE0nuMuZSTIlF1vk7fXQv5mSj
	bjv9WoucqMmZIB8c0N/NCR6C3cTLKZ9q+lpJl4GFZDo2ybkyKlzzVasCmpi6EBSg9X4TtZcZ2Cc
	LpHiwF8LekuRVLfT7wuNBxCDn+PEwQ09tKV8E//tVN1bJv1ZYIBqXwKsaHO1FAdvJ1YSrFlG41V
	/a8VZjrziusbwhieG4zrzgGnJvUiXoSZ+nmxLT3q6urUlMRCwIROtaUFQDrcaR6vBFR5/YJl6DF
	bh7EmfJ7O4gCT4JsSSw+8JEWbB0/W89zLXxCAHEoJ6QEditDrzA4Og6h2RSNgrQZpVyoYhVg+t3
	TjV31HaN4AY4F8ONop12DeLPKZiS6rq6Poz0J95uqLdKRRl4WtNGA9tUMGnRMaeIZH8Xs=
X-Received: by 2002:a05:600c:4e92:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a18e4837e7mr374665925e9.6.1792067086190;
        Thu, 15 Oct 2026 05:24:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66ab3dsm62636355e9.2.2026.10.15.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:24:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 15:24:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 13311/15025] drivers/dma/amlogic-dma.c:636
 aml_dma_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <atDGCefULqNew80V@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: b84b5197e344e2d378a9edf5d782b6fbddff8d06 [13311/15025] dmaengine: amlogic: Add general DMA driver for A9
config: openrisc-randconfig-r2202-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080953.C5TYlCaA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080953.C5TYlCaA-lkp@intel.com/

smatch warnings:
drivers/dma/amlogic-dma.c:636 aml_dma_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +636 drivers/dma/amlogic-dma.c

b84b5197e344e2 Xianwei Zhao 2026-09-03  597  static int aml_dma_probe(struct platform_device *pdev)
b84b5197e344e2 Xianwei Zhao 2026-09-03  598  {
b84b5197e344e2 Xianwei Zhao 2026-09-03  599  	struct device_node *np = pdev->dev.of_node;
b84b5197e344e2 Xianwei Zhao 2026-09-03  600  	struct dma_device *dma_dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  601  	struct aml_dma_dev *aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  602  	int ret, i, len;
b84b5197e344e2 Xianwei Zhao 2026-09-03  603  	u32 chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  604  
b84b5197e344e2 Xianwei Zhao 2026-09-03  605  	const struct regmap_config aml_regmap_config = {
b84b5197e344e2 Xianwei Zhao 2026-09-03  606  		.reg_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  607  		.val_bits = 32,
b84b5197e344e2 Xianwei Zhao 2026-09-03  608  		.reg_stride = 4,
b84b5197e344e2 Xianwei Zhao 2026-09-03  609  		.max_register = 0x3000,
b84b5197e344e2 Xianwei Zhao 2026-09-03  610  	};
b84b5197e344e2 Xianwei Zhao 2026-09-03  611  
b84b5197e344e2 Xianwei Zhao 2026-09-03  612  	ret = of_property_read_u32(np, "dma-channels", &chan_nr);
b84b5197e344e2 Xianwei Zhao 2026-09-03  613  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  614  		return dev_err_probe(&pdev->dev, ret, "failed to read dma-channels\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  615  	if (chan_nr > (MAX_CHAN_ID * 2))
b84b5197e344e2 Xianwei Zhao 2026-09-03  616  		return dev_err_probe(&pdev->dev, -EINVAL, "dma-channels unusual\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  617  
b84b5197e344e2 Xianwei Zhao 2026-09-03  618  	len = sizeof(struct aml_dma_dev) + sizeof(struct aml_dma_chan) * chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  619  	aml_dma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  620  	if (!aml_dma)
b84b5197e344e2 Xianwei Zhao 2026-09-03  621  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  622  
b84b5197e344e2 Xianwei Zhao 2026-09-03  623  	aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  624  	if (!aml_dma->free_wq)
b84b5197e344e2 Xianwei Zhao 2026-09-03  625  		return -ENOMEM;
b84b5197e344e2 Xianwei Zhao 2026-09-03  626  
b84b5197e344e2 Xianwei Zhao 2026-09-03  627  	aml_dma->chan_nr = chan_nr;
b84b5197e344e2 Xianwei Zhao 2026-09-03  628  
b84b5197e344e2 Xianwei Zhao 2026-09-03  629  	aml_dma->base = devm_platform_ioremap_resource(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  630  	if (IS_ERR(aml_dma->base))
b84b5197e344e2 Xianwei Zhao 2026-09-03  631  		return PTR_ERR(aml_dma->base);
b84b5197e344e2 Xianwei Zhao 2026-09-03  632  
b84b5197e344e2 Xianwei Zhao 2026-09-03  633  	aml_dma->regmap = devm_regmap_init_mmio(&pdev->dev, aml_dma->base,
b84b5197e344e2 Xianwei Zhao 2026-09-03  634  						&aml_regmap_config);
b84b5197e344e2 Xianwei Zhao 2026-09-03  635  	if (IS_ERR_OR_NULL(aml_dma->regmap))
b84b5197e344e2 Xianwei Zhao 2026-09-03 @636  		return PTR_ERR(aml_dma->regmap);

devm_regmap_init_mmio() can't actually return NULL so
s/IS_ERR_OR_NULL/IS_ERR/.

b84b5197e344e2 Xianwei Zhao 2026-09-03  637  
b84b5197e344e2 Xianwei Zhao 2026-09-03  638  	aml_dma->clk = devm_clk_get_enabled(&pdev->dev, NULL);
b84b5197e344e2 Xianwei Zhao 2026-09-03  639  	if (IS_ERR(aml_dma->clk))
b84b5197e344e2 Xianwei Zhao 2026-09-03  640  		return PTR_ERR(aml_dma->clk);
b84b5197e344e2 Xianwei Zhao 2026-09-03  641  
b84b5197e344e2 Xianwei Zhao 2026-09-03  642  	aml_dma->irq = platform_get_irq(pdev, 0);
b84b5197e344e2 Xianwei Zhao 2026-09-03  643  
b84b5197e344e2 Xianwei Zhao 2026-09-03  644  	aml_dma->pdev = pdev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  645  	aml_dma->dma_device.dev = &pdev->dev;
b84b5197e344e2 Xianwei Zhao 2026-09-03  646  
b84b5197e344e2 Xianwei Zhao 2026-09-03  647  	dma_dev = &aml_dma->dma_device;
b84b5197e344e2 Xianwei Zhao 2026-09-03  648  	INIT_LIST_HEAD(&dma_dev->channels);
b84b5197e344e2 Xianwei Zhao 2026-09-03  649  
b84b5197e344e2 Xianwei Zhao 2026-09-03  650  	/* Initialize channel parameters */
b84b5197e344e2 Xianwei Zhao 2026-09-03  651  	for (i = 0; i < chan_nr; i++) {
b84b5197e344e2 Xianwei Zhao 2026-09-03  652  		struct aml_dma_chan *aml_chan = &aml_dma->aml_chans[i];
b84b5197e344e2 Xianwei Zhao 2026-09-03  653  
b84b5197e344e2 Xianwei Zhao 2026-09-03  654  		aml_chan->aml_dma = aml_dma;
b84b5197e344e2 Xianwei Zhao 2026-09-03  655  		aml_chan->vchan.desc_free = aml_dma_free_desc;
b84b5197e344e2 Xianwei Zhao 2026-09-03  656  		vchan_init(&aml_chan->vchan, &aml_dma->dma_device);
b84b5197e344e2 Xianwei Zhao 2026-09-03  657  	}
b84b5197e344e2 Xianwei Zhao 2026-09-03  658  	aml_dma->chan_used = 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  659  
b84b5197e344e2 Xianwei Zhao 2026-09-03  660  	dma_set_max_seg_size(dma_dev->dev, SG_MAX_LEN);
b84b5197e344e2 Xianwei Zhao 2026-09-03  661  	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
b84b5197e344e2 Xianwei Zhao 2026-09-03  662  	dma_dev->device_alloc_chan_resources = aml_dma_alloc_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  663  	dma_dev->device_free_chan_resources = aml_dma_free_chan_resources;
b84b5197e344e2 Xianwei Zhao 2026-09-03  664  	dma_dev->device_tx_status = aml_dma_tx_status;
b84b5197e344e2 Xianwei Zhao 2026-09-03  665  	dma_dev->device_prep_slave_sg = aml_dma_prep_slave_sg;
b84b5197e344e2 Xianwei Zhao 2026-09-03  666  	dma_dev->device_pause = aml_dma_chan_pause;
b84b5197e344e2 Xianwei Zhao 2026-09-03  667  	dma_dev->device_resume = aml_dma_chan_resume;
b84b5197e344e2 Xianwei Zhao 2026-09-03  668  	dma_dev->device_terminate_all = aml_dma_terminate_all;
b84b5197e344e2 Xianwei Zhao 2026-09-03  669  	dma_dev->device_issue_pending = aml_dma_issue_pending;
b84b5197e344e2 Xianwei Zhao 2026-09-03  670  	/* PIO 4 bytes and I2C 1 byte */
b84b5197e344e2 Xianwei Zhao 2026-09-03  671  	dma_dev->dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
b84b5197e344e2 Xianwei Zhao 2026-09-03  672  	dma_dev->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
b84b5197e344e2 Xianwei Zhao 2026-09-03  673  	dma_dev->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
b84b5197e344e2 Xianwei Zhao 2026-09-03  674  
b84b5197e344e2 Xianwei Zhao 2026-09-03  675  	regmap_write(aml_dma->regmap, RCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  676  	regmap_write(aml_dma->regmap, WCH_INT_MASK, INT_MASK);
b84b5197e344e2 Xianwei Zhao 2026-09-03  677  
b84b5197e344e2 Xianwei Zhao 2026-09-03  678  	ret = devm_request_irq(&pdev->dev, aml_dma->irq, aml_dma_interrupt_handler,
b84b5197e344e2 Xianwei Zhao 2026-09-03  679  			       0, dev_name(&pdev->dev), aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  680  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  681  		return dev_err_probe(&pdev->dev, ret, "failed to register irq\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  682  
b84b5197e344e2 Xianwei Zhao 2026-09-03  683  	ret = dmaenginem_async_device_register(dma_dev);
b84b5197e344e2 Xianwei Zhao 2026-09-03  684  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  685  		return dev_err_probe(&pdev->dev, ret, "failed to register dmaenginem\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  686  
b84b5197e344e2 Xianwei Zhao 2026-09-03  687  	ret = of_dma_controller_register(np, aml_of_dma_xlate, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  688  	if (ret)
b84b5197e344e2 Xianwei Zhao 2026-09-03  689  		return dev_err_probe(&pdev->dev, ret, "failed to register xlate\n");
b84b5197e344e2 Xianwei Zhao 2026-09-03  690  
b84b5197e344e2 Xianwei Zhao 2026-09-03  691  	platform_set_drvdata(pdev, aml_dma);
b84b5197e344e2 Xianwei Zhao 2026-09-03  692  
b84b5197e344e2 Xianwei Zhao 2026-09-03  693  	return 0;
b84b5197e344e2 Xianwei Zhao 2026-09-03  694  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

