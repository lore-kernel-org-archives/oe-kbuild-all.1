Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C608B41760
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 04:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474905; cv=none; b=UaWRE2ciwCnpxt0S/leAuMrE2ueAZ+cpfRQ+R8jKmn3yx4OG6qUjrllgDjmZa1iUH33ksDKwkv9KA7jYBh8t5rTQU+i49jbbmNOzux+goZyzZiCfnZYeft5f9D/OQAmkJdigqxrf0mMVOw/ck1/K3HQPqvh+ObPfAnlORxF/5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474905; c=relaxed/simple;
	bh=dFJsbRx192t5bf0RdxTM5k83IesAlWnJNoG4UHXCSgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUEDaedAR/hPBLcLhLRdjzbEz1MlIK7ewFCUED2Tykp1mR70Fnn8IAQlaYNemst9Nnj5Pb6sqUHX7a84fOhfyVSYLg+Ke/ZfLFyAhv+8irhllBAUReLzpwIpUI4aMRqVH3VenMrzSvboVHZqktTEzFX5GKJ+kadq/+2Tm2FkL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyyU82vc; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyyU82vc"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso3628081e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778474903; x=1779079703; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dd7o5VMBbNwxiJlDjEkzdfjbbgIYWV8kmrnexYNNlUE=;
        b=QyyU82vcs3JgomSgvtfVt3uxy5ulXu1EUBGW0fMTxvvbYt8dt0Ba0nlLLtpzn4n0AI
         Q9/nBhed7+wW6kpy+dXV+MdA0Bpq3RGBifOavUowkVpetVVfWiV3yKmSMNbxbo7rM040
         25Q+sN9z+WsLVCZWM0w1yLrGMlMm4eqs/vsZ4AP9LCYKXovhdIcrP6O1eeX2wf6c/9ss
         BYwZ+KucOA8hDKVXfOG8i/TIvstku8jyYuGeLADpPSUDDHquh5+fnSewb6D17Xkxw/2j
         aK/OC3UxPvjUrfDN/0TYZI+/I8aL8W+G1RF0dO54FgfjISDU+w1avXG5iL39+8DE/U/O
         XsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778474903; x=1779079703;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd7o5VMBbNwxiJlDjEkzdfjbbgIYWV8kmrnexYNNlUE=;
        b=X7H3m0kUHTIDi2V3xpO/wCuSxp/a2yAuZGmxeS7RWgpX/zxisEDB2Lj/XGbqoU7F9M
         6s9Ot8lqoEMSeF2SqVwP17JyQsOn756XSh6cFj1TXP6iRUXi9f3obqGgItWFcPYXqSgE
         OFKJMpVWeeYFEf+YFC9zX4FrZeGRiAyE44jYipHdRPG+sPFI/oDrCd+cBUd83dQNkKya
         dSjMzaHdhwcSKEveq1tcDcBFhFlkdPVB1J9RyUODQpUymwZ74B5+OgJrvzZoMr9Cg3o5
         04PlEjoh6vzfA3+8bYLjx6lrUx2fVM9W1GBV1DY9aVGxTQCx9UntEsBrRv6cQNNsCvSq
         Zd9A==
X-Forwarded-Encrypted: i=1; AFNElJ8q3JWezSRJN/xtOX7/H3VHXsOl3q7zgIFDT1Y6yMO2kpfBZAVjmGANJeiwY5vYn18fnwE7mafTeofeC4zJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1eRzSXF4hD7E6Zc0jiQqTCzPbBZeOUS7mr9V7EPitjGdH01qZ
	ObBCmVWFribZtMQ8muaUDvvwxykAEBwJWHMGqgJdpmFrJy/g4LHlesuH
X-Gm-Gg: Acq92OEke8sIp0aHaHlf6JV/gcqB6catpDrIGS/2ZNv0A6de0FqO1VdoAQFY+hwSQVv
	NQeHkhJ+xJO/rnHHSPJkuN1we3Fn3ukeoT7i1K9WQ9j0NW3B2QruHeOaxx/2l+v//acI56AKS4a
	J07K8GYGQ9x9aIK7V9eTuexSXTxyCCWt0yfBOv14O3xbGpSVtvokBX46Nr7ggHB0dch2rTqZYwp
	HROEL4dE5+M0WhNvC3HAcmmmHrtUjNjOLHlebVIwGb13HNyCIAV/n3Ye67Tz6NbWis34IL0VKCO
	Tdyo9kEV7gMQmdhlAnrZWTjUXR3aTt/03PDGVobx0yuJJny1t5/E/bATyvRaKVHeYalB2HEUUXq
	VR9nh5CIU5uvqlNyo8c2Y+wcZXFo92OBORXLV4zkR59bViOeW9u07cYyGaKL+YAJE+83zknrec2
	65+YsQDG/Nqx1BCWFviw==
X-Received: by 2002:a05:6122:8294:b0:56e:e9cf:7134 with SMTP id 71dfb90a1353d-575593ac428mr11483089e0c.3.1778474902714;
        Sun, 10 May 2026 21:48:22 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57586996768sm5299001e0c.7.2026.05.10.21.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:48:21 -0700 (PDT)
Date: Mon, 11 May 2026 07:48:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/020-dart 4/20] drivers/iommu/apple-dart.c:1236
 apple_dart_probe() warn: missing error code 'ret'
Message-ID: <202605102224.vlvlpsIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-dart
head:   1fe2c37040cfeced8a9d0161c2d7093cf8c9c1d0
commit: 66bff25252bfad1ee4298c3c998404e8f92f19e8 [4/20] iommu: apple-dart: Support specifying the DMA aperture in the DT
config: um-randconfig-r072-20260509 (https://download.01.org/0day-ci/archive/20260510/202605102224.vlvlpsIR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605102224.vlvlpsIR-lkp@intel.com/

smatch warnings:
drivers/iommu/apple-dart.c:1236 apple_dart_probe() warn: missing error code 'ret'

vim +/ret +1236 drivers/iommu/apple-dart.c

46d1fb072e76b1 Sven Peter      2021-08-03  1152  static int apple_dart_probe(struct platform_device *pdev)
46d1fb072e76b1 Sven Peter      2021-08-03  1153  {
46d1fb072e76b1 Sven Peter      2021-08-03  1154  	int ret;
d8bcc870d99d7e Hector Martin   2023-01-13  1155  	u32 dart_params[4];
46d1fb072e76b1 Sven Peter      2021-08-03  1156  	struct resource *res;
46d1fb072e76b1 Sven Peter      2021-08-03  1157  	struct apple_dart *dart;
46d1fb072e76b1 Sven Peter      2021-08-03  1158  	struct device *dev = &pdev->dev;
66bff25252bfad Hector Martin   2023-04-11  1159  	u64 dma_range[2];
46d1fb072e76b1 Sven Peter      2021-08-03  1160  
46d1fb072e76b1 Sven Peter      2021-08-03  1161  	dart = devm_kzalloc(dev, sizeof(*dart), GFP_KERNEL);
46d1fb072e76b1 Sven Peter      2021-08-03  1162  	if (!dart)
46d1fb072e76b1 Sven Peter      2021-08-03  1163  		return -ENOMEM;
46d1fb072e76b1 Sven Peter      2021-08-03  1164  
46d1fb072e76b1 Sven Peter      2021-08-03  1165  	dart->dev = dev;
a380b8dcf22ccb Sven Peter      2022-09-16  1166  	dart->hw = of_device_get_match_data(dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1167  	spin_lock_init(&dart->lock);
46d1fb072e76b1 Sven Peter      2021-08-03  1168  
a15932f4377062 Yang Yingliang  2022-04-25  1169  	dart->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
a15932f4377062 Yang Yingliang  2022-04-25  1170  	if (IS_ERR(dart->regs))
a15932f4377062 Yang Yingliang  2022-04-25  1171  		return PTR_ERR(dart->regs);
a15932f4377062 Yang Yingliang  2022-04-25  1172  
46d1fb072e76b1 Sven Peter      2021-08-03  1173  	if (resource_size(res) < 0x4000) {
46d1fb072e76b1 Sven Peter      2021-08-03  1174  		dev_err(dev, "MMIO region too small (%pr)\n", res);
46d1fb072e76b1 Sven Peter      2021-08-03  1175  		return -EINVAL;
46d1fb072e76b1 Sven Peter      2021-08-03  1176  	}
46d1fb072e76b1 Sven Peter      2021-08-03  1177  
46d1fb072e76b1 Sven Peter      2021-08-03  1178  	dart->irq = platform_get_irq(pdev, 0);
46d1fb072e76b1 Sven Peter      2021-08-03  1179  	if (dart->irq < 0)
46d1fb072e76b1 Sven Peter      2021-08-03  1180  		return -ENODEV;
46d1fb072e76b1 Sven Peter      2021-08-03  1181  
46d1fb072e76b1 Sven Peter      2021-08-03  1182  	ret = devm_clk_bulk_get_all(dev, &dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1183  	if (ret < 0)
46d1fb072e76b1 Sven Peter      2021-08-03  1184  		return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1185  	dart->num_clks = ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1186  
46d1fb072e76b1 Sven Peter      2021-08-03  1187  	ret = clk_bulk_prepare_enable(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1188  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1189  		return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1190  
00751168c3b96e Hector Martin   2022-12-12  1191  	pm_runtime_get_noresume(dev);
00751168c3b96e Hector Martin   2022-12-12  1192  	pm_runtime_set_active(dev);
00751168c3b96e Hector Martin   2022-12-12  1193  	pm_runtime_irq_safe(dev);
00751168c3b96e Hector Martin   2022-12-12  1194  
00751168c3b96e Hector Martin   2022-12-12  1195  	ret = devm_pm_runtime_enable(dev);
00751168c3b96e Hector Martin   2022-12-12  1196  	if (ret)
00751168c3b96e Hector Martin   2022-12-12  1197  		goto err_clk_disable;
00751168c3b96e Hector Martin   2022-12-12  1198  
46d1fb072e76b1 Sven Peter      2021-08-03  1199  	dart_params[0] = readl(dart->regs + DART_PARAMS1);
46d1fb072e76b1 Sven Peter      2021-08-03  1200  	dart_params[1] = readl(dart->regs + DART_PARAMS2);
a772a02c18342b Hector Martin   2023-01-13  1201  	dart->pgsize = 1 << FIELD_GET(DART_PARAMS1_PAGE_SHIFT, dart_params[0]);
a772a02c18342b Hector Martin   2023-01-13  1202  	dart->supports_bypass = dart_params[1] & DART_PARAMS2_BYPASS_SUPPORT;
510d4072df7fcf Hector Martin   2023-01-13  1203  
d8bcc870d99d7e Hector Martin   2023-01-13  1204  	switch (dart->hw->type) {
d8bcc870d99d7e Hector Martin   2023-01-13  1205  	case DART_T8020:
d8bcc870d99d7e Hector Martin   2023-01-13  1206  	case DART_T6000:
d8bcc870d99d7e Hector Martin   2023-01-13  1207  		dart->ias = 32;
d8bcc870d99d7e Hector Martin   2023-01-13  1208  		dart->oas = dart->hw->oas;
510d4072df7fcf Hector Martin   2023-01-13  1209  		dart->num_streams = dart->hw->max_sid_count;
d8bcc870d99d7e Hector Martin   2023-01-13  1210  		break;
d8bcc870d99d7e Hector Martin   2023-01-13  1211  
d8bcc870d99d7e Hector Martin   2023-01-13  1212  	case DART_T8110:
d8bcc870d99d7e Hector Martin   2023-01-13  1213  		dart_params[2] = readl(dart->regs + DART_T8110_PARAMS3);
d8bcc870d99d7e Hector Martin   2023-01-13  1214  		dart_params[3] = readl(dart->regs + DART_T8110_PARAMS4);
d8bcc870d99d7e Hector Martin   2023-01-13  1215  		dart->ias = FIELD_GET(DART_T8110_PARAMS3_VA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin   2023-01-13  1216  		dart->oas = FIELD_GET(DART_T8110_PARAMS3_PA_WIDTH, dart_params[2]);
d8bcc870d99d7e Hector Martin   2023-01-13  1217  		dart->num_streams = FIELD_GET(DART_T8110_PARAMS4_NUM_SIDS, dart_params[3]);
5229bd5f9e3dbc Hector Martin   2025-08-21  1218  		dart->four_level = dart->ias > 36;
d8bcc870d99d7e Hector Martin   2023-01-13  1219  		break;
d8bcc870d99d7e Hector Martin   2023-01-13  1220  	}
510d4072df7fcf Hector Martin   2023-01-13  1221  
66bff25252bfad Hector Martin   2023-04-11  1222  	dart->dma_min = 0;
66bff25252bfad Hector Martin   2023-04-11  1223  	dart->dma_max = DMA_BIT_MASK(dart->ias);
66bff25252bfad Hector Martin   2023-04-11  1224  
66bff25252bfad Hector Martin   2023-04-11  1225  	ret = of_property_read_u64_array(dev->of_node, "apple,dma-range", dma_range, 2);
66bff25252bfad Hector Martin   2023-04-11  1226  	if (ret == -EINVAL) {
66bff25252bfad Hector Martin   2023-04-11  1227  		ret = 0;
66bff25252bfad Hector Martin   2023-04-11  1228  	} else if (ret) {
66bff25252bfad Hector Martin   2023-04-11  1229  		goto err_clk_disable;
66bff25252bfad Hector Martin   2023-04-11  1230  	} else {
66bff25252bfad Hector Martin   2023-04-11  1231  		dart->dma_min = dma_range[0];
66bff25252bfad Hector Martin   2023-04-11  1232  		dart->dma_max = dma_range[0] + dma_range[1] - 1;
66bff25252bfad Hector Martin   2023-04-11  1233  		if ((dart->dma_min ^ dart->dma_max) & ~DMA_BIT_MASK(dart->ias)) {
66bff25252bfad Hector Martin   2023-04-11  1234  			dev_err(&pdev->dev, "Invalid DMA range for ias=%d\n",
66bff25252bfad Hector Martin   2023-04-11  1235  				dart->ias);
66bff25252bfad Hector Martin   2023-04-11 @1236  			goto err_clk_disable;

ret = -EINVAL;

66bff25252bfad Hector Martin   2023-04-11  1237  		}
66bff25252bfad Hector Martin   2023-04-11  1238  		dev_info(&pdev->dev, "Limiting DMA range to %pad..%pad\n",
66bff25252bfad Hector Martin   2023-04-11  1239  			 &dart->dma_min, &dart->dma_max);
66bff25252bfad Hector Martin   2023-04-11  1240  	}
66bff25252bfad Hector Martin   2023-04-11  1241  
510d4072df7fcf Hector Martin   2023-01-13  1242  	if (dart->num_streams > DART_MAX_STREAMS) {
510d4072df7fcf Hector Martin   2023-01-13  1243  		dev_err(&pdev->dev, "Too many streams (%d > %d)\n",
510d4072df7fcf Hector Martin   2023-01-13  1244  			dart->num_streams, DART_MAX_STREAMS);
510d4072df7fcf Hector Martin   2023-01-13  1245  		ret = -EINVAL;
510d4072df7fcf Hector Martin   2023-01-13  1246  		goto err_clk_disable;
510d4072df7fcf Hector Martin   2023-01-13  1247  	}
510d4072df7fcf Hector Martin   2023-01-13  1248  
510d4072df7fcf Hector Martin   2023-01-13  1249  	ret = apple_dart_hw_reset(dart);
510d4072df7fcf Hector Martin   2023-01-13  1250  	if (ret)
510d4072df7fcf Hector Martin   2023-01-13  1251  		goto err_clk_disable;
510d4072df7fcf Hector Martin   2023-01-13  1252  
206b3243aaa8bc Asahi Lina      2023-09-29  1253  	ret = request_irq(dart->irq, apple_dart_irq, IRQF_SHARED,
46d1fb072e76b1 Sven Peter      2021-08-03  1254  			  "apple-dart fault handler", dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1255  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1256  		goto err_clk_disable;
46d1fb072e76b1 Sven Peter      2021-08-03  1257  
46d1fb072e76b1 Sven Peter      2021-08-03  1258  	platform_set_drvdata(pdev, dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1259  
46d1fb072e76b1 Sven Peter      2021-08-03  1260  	ret = iommu_device_sysfs_add(&dart->iommu, dev, NULL, "apple-dart.%s",
46d1fb072e76b1 Sven Peter      2021-08-03  1261  				     dev_name(&pdev->dev));
46d1fb072e76b1 Sven Peter      2021-08-03  1262  	if (ret)
006abbe36acdac Robin Murphy    2022-08-15  1263  		goto err_free_irq;
46d1fb072e76b1 Sven Peter      2021-08-03  1264  
46d1fb072e76b1 Sven Peter      2021-08-03  1265  	ret = iommu_device_register(&dart->iommu, &apple_dart_iommu_ops, dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1266  	if (ret)
46d1fb072e76b1 Sven Peter      2021-08-03  1267  		goto err_sysfs_remove;
46d1fb072e76b1 Sven Peter      2021-08-03  1268  
00751168c3b96e Hector Martin   2022-12-12  1269  	pm_runtime_put(dev);
00751168c3b96e Hector Martin   2022-12-12  1270  
46d1fb072e76b1 Sven Peter      2021-08-03  1271  	dev_info(
46d1fb072e76b1 Sven Peter      2021-08-03  1272  		&pdev->dev,
5229bd5f9e3dbc Hector Martin   2025-08-21  1273  		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d, AS %d -> %d] initialized\n",
bbc70e0aec287e Jason Gunthorpe 2023-09-27  1274  		dart->pgsize, dart->num_streams, dart->supports_bypass,
5229bd5f9e3dbc Hector Martin   2025-08-21  1275  		dart->pgsize > PAGE_SIZE, dart->ias, dart->oas);
46d1fb072e76b1 Sven Peter      2021-08-03  1276  	return 0;
46d1fb072e76b1 Sven Peter      2021-08-03  1277  
46d1fb072e76b1 Sven Peter      2021-08-03  1278  err_sysfs_remove:
46d1fb072e76b1 Sven Peter      2021-08-03  1279  	iommu_device_sysfs_remove(&dart->iommu);
46d1fb072e76b1 Sven Peter      2021-08-03  1280  err_free_irq:
46d1fb072e76b1 Sven Peter      2021-08-03  1281  	free_irq(dart->irq, dart);
46d1fb072e76b1 Sven Peter      2021-08-03  1282  err_clk_disable:
00751168c3b96e Hector Martin   2022-12-12  1283  	pm_runtime_put(dev);
46d1fb072e76b1 Sven Peter      2021-08-03  1284  	clk_bulk_disable_unprepare(dart->num_clks, dart->clks);
46d1fb072e76b1 Sven Peter      2021-08-03  1285  
46d1fb072e76b1 Sven Peter      2021-08-03  1286  	return ret;
46d1fb072e76b1 Sven Peter      2021-08-03  1287  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

