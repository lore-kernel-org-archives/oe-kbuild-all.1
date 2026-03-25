Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CC3BE16E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452372; cv=none; b=Xsl1bsFuuJmSmq8tAdgx63kSOSjNdibJYK+ORLxwgyclJg6cT+FmtpnErA0rUa/qdk650rczrPAAV9/vgETzMMgajrTNEErukRAe8o179V92ADz++5HgoNLDLeCCw2zAN7BWVZi9v+1KpB/JiE4diIRbx1ErYUf27EX7MwG9S/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452372; c=relaxed/simple;
	bh=q7luRxJOP9RIbOM4Cco7d+3w5W3pWV71Lw+M+1CAY+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwXO6+aohVgvfvfbM1B5H5VkhVhHCqdwCbhccux1s/hQPhgIlvyNGSUcz4X9oMV41CKHQ7GKyxSH9M8Z7bkSkp/GZvfJ3zOrBzAyxeo88WMLXDNoRI8JsZfIFXEwhqYwLnmZeFmamtfhjSVgITW2RCNUOarOR2AOLqciLwhd21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hm1QsCVz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hm1QsCVz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so50199985e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774452369; x=1775057169; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLXdwZgz3OX7xFXei4hlC2wY0sZDRlHVahArePn31D8=;
        b=Hm1QsCVzAVtiRZCPAiDmiSTMPhZms77zMh9wJycG+psbSmM7PrAMxPD3/IhLmd0okv
         +K4pK92YtMvLRPeVBmAXkBTa1ZXcIq2NLLRXhkZ5D9rI8JU6XTSoHCKTlTzf+wUCQkEP
         doyf6OgPJMO22OCWpoLCbC3KOEtYZEN6h22iYN9jncGU+TZRAg2ddSG2FJr3Fb3R9wqE
         ZVtIQIBtXm0gWWq62rrqyb34hK+TZIke5UUVR37jugj+e+uDE3DY38kRl7YX5MGKrVke
         /3VJPSkLjdR1VEzqKn7jpDMYSskjAPe969c/S1BpvVnUszuv2oJ/6OwaMQNxh4Aj0B86
         PIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452369; x=1775057169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLXdwZgz3OX7xFXei4hlC2wY0sZDRlHVahArePn31D8=;
        b=TqW300rs9jmUjH9KfaNLldI+Lu7LLfZhEUlo306iAVy0slBFpR8WiuKPbV9nUdlGSP
         APY2xGm0KI6Uz9Arg6iYn4xICrgsulLSakQCJXGkFOexuv51WLBKuluIHrRdXduN/Idc
         QDCLXuYVPPXuS9oMcHP16g3o66t+EorOJQAUN7en2F+vNWKfd8m7ImTpQxCq/eTVLVRS
         4qKMBwuil52mEGcrKjQGixnyYt5dR3NkuymNwZ2skT+ux3hZgwmZqXqX/lNlkcBnYEkD
         V1BeCieg4qTonEYXxdTAizPhjDiBpe2w2Fv+mDBdE1FxumUIbJcyenl24tiaMEeEoVGy
         eP4A==
X-Forwarded-Encrypted: i=1; AJvYcCVg/W/XtzNdRrEmdHKLKhd72X/ZCBdAgO/C7m/IM8Af6Yea9FV8+5gi/GWpEuvjyB90+QKXQRHMYZiQzIog@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4a1u++0xwtRZpymICnNJtTJbCujRq9EWBevS1d+7fG0M00z3G
	htvNKcfS7kfy/wUvvzF6ri/Ajk+OjFnCFBAocrYm7r9QQmZ3Rcc4FdFTM+kQN3QPmOM=
X-Gm-Gg: ATEYQzwj0FGIBPuwSU8mBglJzZVOhP8v7ZXVP3a4ZOMo6CCrxzbK6eJknSo45QAtGy8
	wsr8VhVxab07osMfBFXelYi/qkuAQBcvSWEslKrpStU9qq34lnwzwedZH3xM9n7nza0APRJ+v9n
	FKtC04tzE3Q7fi7qWzWj6IqVHFRrNgqiG9k6bXlUetKu8fr+XvD2Hb2s3GBicbVSxKaJYL9mw9o
	nnnaGI0n0aSC4lZ+i5975LEkJMXwI9RM4JgdstTAVYfQaBFlOL9jkezzzGgu9XACTX4Asalw619
	9mGLiB5xeo+YvGsbtdpfRLfZbjCJHwMY2UdhobPhwpz7TmCOtZO22oSDKiDH2Bl57QwA3jvLPK4
	ZUj3U7N6k21MM6ByOtYT0Bq5fIJA0bfuVCVUwC3huCvurYioI/6kjd3rMzRioNkJzyyvbtYYiaJ
	eBV2uot0oAuMkA0hHfQpJeUsoq1WUI
X-Received: by 2002:a05:600c:630d:b0:485:3586:1e28 with SMTP id 5b1f17b1804b1-48716034eb4mr57109245e9.18.1774452368866;
        Wed, 25 Mar 2026 08:26:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm692368f8f.2.2026.03.25.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:26:07 -0700 (PDT)
Date: Wed, 25 Mar 2026 18:26:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: drivers/mtd/nand/raw/cadence-nand-controller.c:2956
 cadence_nand_init() warn: variable dereferenced before check
 'cdns_ctrl->dmac' (see line 2918)
Message-ID: <202603252339.fQzI6oc8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 5c56bf214af85ca042bf97f8584aab2151035840 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
config: openrisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252339.fQzI6oc8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603252339.fQzI6oc8-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init() warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)

vim +2956 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d316 Piotr Sroka         2019-09-26  2871  static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2872  {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2873  	dma_cap_mask_t mask;
5c56bf214af85ca Niravkumar L Rabara 2025-10-23  2874  	struct dma_device *dma_dev;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2875  	int ret;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2876  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2877  	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2878  						  sizeof(*cdns_ctrl->cdma_desc),
ec4ba01e894d316 Piotr Sroka         2019-09-26  2879  						  &cdns_ctrl->dma_cdma_desc,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2880  						  GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2881  	if (!cdns_ctrl->dma_cdma_desc)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2882  		return -ENOMEM;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2883  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2884  	cdns_ctrl->buf_size = SZ_16K;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2885  	cdns_ctrl->buf = kmalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2886  	if (!cdns_ctrl->buf) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2887  		ret = -ENOMEM;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2888  		goto free_buf_desc;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2889  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2890  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2891  	if (devm_request_irq(cdns_ctrl->dev, cdns_ctrl->irq, cadence_nand_isr,
ec4ba01e894d316 Piotr Sroka         2019-09-26  2892  			     IRQF_SHARED, "cadence-nand-controller",
ec4ba01e894d316 Piotr Sroka         2019-09-26  2893  			     cdns_ctrl)) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2894  		dev_err(cdns_ctrl->dev, "Unable to allocate IRQ\n");
ec4ba01e894d316 Piotr Sroka         2019-09-26  2895  		ret = -ENODEV;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2896  		goto free_buf;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2897  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2898  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2899  	spin_lock_init(&cdns_ctrl->irq_lock);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2900  	init_completion(&cdns_ctrl->complete);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2901  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2902  	ret = cadence_nand_hw_init(cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2903  	if (ret)
ec4ba01e894d316 Piotr Sroka         2019-09-26  2904  		goto disable_irq;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2905  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2906  	dma_cap_zero(mask);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2907  	dma_cap_set(DMA_MEMCPY, mask);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2908  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2909  	if (cdns_ctrl->caps1->has_dma) {
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2910  		cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
                                                                ^^^^^^^^^^^^^^^
->dmac assigned here.

2b9df00cded911e Niravkumar L Rabara 2025-02-10  2911  		if (IS_ERR(cdns_ctrl->dmac)) {
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2912  			ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
2b9df00cded911e Niravkumar L Rabara 2025-02-10  2913  					    "%d: Failed to get a DMA channel\n", ret);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2914  			goto disable_irq;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2915  		}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2916  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2917  
5c56bf214af85ca Niravkumar L Rabara 2025-10-23 @2918  	dma_dev = cdns_ctrl->dmac->device;

This feels like it should be in the if statement.  Smatch complains that
we check it for NULL later.

d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2919  	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2920  						  cdns_ctrl->io.size,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2921  						  DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2922  
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2923  	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2924  	if (ret) {
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2925  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2926  		goto dma_release_chnl;
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2927  	}
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2928  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2929  	nand_controller_init(&cdns_ctrl->controller);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2930  	INIT_LIST_HEAD(&cdns_ctrl->chips);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2931  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2932  	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2933  	cdns_ctrl->curr_corr_str_idx = 0xFF;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2934  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2935  	ret = cadence_nand_chips_init(cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2936  	if (ret) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2937  		dev_err(cdns_ctrl->dev, "Failed to register MTD: %d\n",
ec4ba01e894d316 Piotr Sroka         2019-09-26  2938  			ret);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2939  		goto unmap_dma_resource;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2940  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2941  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2942  	kfree(cdns_ctrl->buf);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2943  	cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2944  	if (!cdns_ctrl->buf) {
ec4ba01e894d316 Piotr Sroka         2019-09-26  2945  		ret = -ENOMEM;
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2946  		goto unmap_dma_resource;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2947  	}
ec4ba01e894d316 Piotr Sroka         2019-09-26  2948  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2949  	return 0;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2950  
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2951  unmap_dma_resource:
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2952  	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2953  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
d76d22b5096c5b0 Niravkumar L Rabara 2025-02-10  2954  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2955  dma_release_chnl:
ec4ba01e894d316 Piotr Sroka         2019-09-26 @2956  	if (cdns_ctrl->dmac)
                                                            ^^^^^^^^^^^^^^^
Checked here.

ec4ba01e894d316 Piotr Sroka         2019-09-26  2957  		dma_release_channel(cdns_ctrl->dmac);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2958  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2959  disable_irq:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2960  	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2961  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2962  free_buf:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2963  	kfree(cdns_ctrl->buf);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2964  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2965  free_buf_desc:
ec4ba01e894d316 Piotr Sroka         2019-09-26  2966  	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
ec4ba01e894d316 Piotr Sroka         2019-09-26  2967  			  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
ec4ba01e894d316 Piotr Sroka         2019-09-26  2968  
ec4ba01e894d316 Piotr Sroka         2019-09-26  2969  	return ret;
ec4ba01e894d316 Piotr Sroka         2019-09-26  2970  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

