Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21019F48D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434615; cv=none; b=sstX3e084JBQM09nu4GT6RkpIsCcXqpgvf7GkvrwrzpOph2DwBuC3HxR2xPdRYB7ENH8mpPHkS2E9zEt0aO3J5k7615w00/ELDMKhAzmlWVj30bXiVA05lRZW1h9/jPoaCAZfK66tMnevgJAoFib1tWWHKcxMIj0NOuxrk1ql4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434615; c=relaxed/simple;
	bh=QVY/AYM5oY5fMTDiOLcTDfmGhegxKbaFzRVX886wGAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SI/QIJDGU1xuDbY5vMWxf/CKnKQeGvzAiVTOb8oU6nWDp9IgjXDu6S5tF8DbvraXU57Jy5W/yV9FEwd0TilFoJcri0PKNjHOBUrF0v4Ta2ScBms7gjlbV9A/xEkkzbjoWF0EsOcEVU4u982oUcvWCru4lNTAuiW6o46BdkgNQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQMMDQcc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQMMDQcc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640c3940649so1303398a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 06 Nov 2025 05:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762434612; x=1763039412; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t28efrrGHhAa89xd4/lbe98NRmddX9nmQ/RG7kZgsm4=;
        b=MQMMDQccDYzbGOMx9ONqQEbw5vk2nW9L+3642mHn33lJVMoADfsw95SgyVc3NNjg01
         SxSbP/ajvc0lU2oXFE7mr5DkKHtdAxVGE1GoVvnJlC6nJK2vSBfvpfczTMMdAfGkt/S0
         tx/REU70WzrlYuCN4A/qEdY3zEizDuPnOgwDnNc0LTvjxuRA+kQM/y5/ajhPPnHiXInN
         TeWf4avsgrh3pXRDR5w9J7DPHD9cvbYdzFAKkwMcZto+9t3vWdDN3TKZITi9eWa/VSIS
         dbK+r2xuI1fgBhuhqw2Pd6U0Ry9C4QDqrO3I8npOWER0ETaTKknjV5CDGpWCq+lDBiED
         n33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762434612; x=1763039412;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t28efrrGHhAa89xd4/lbe98NRmddX9nmQ/RG7kZgsm4=;
        b=oNdbGEj3Rfqq3shnCBhfo68ZEMuk039kVFV4/oRExa2tZ8OfAs+nZTbXWbhOkW7cJt
         EguaNKVbnFHKDhRA0KreU2ts8xiBr1Vhwir4tAEuACi9LY9FeAkMPRK4V5SIOpGlz/qH
         lJtSIgguq/JIzC/YrGibu1eMUZRj9oCAoWNqXWN+D8fckM+4Z/ajykuulgG3IfuEnqLN
         cWQtmv7RN0yDgECKzdF6Bm12rx5ZSC2Xj4YDQgrBCu1AXJk18Sg9IrBJNrkjNXrTarWA
         Znggiolc+wSEzE6SVwnbmFoAWd/E7t8YhzRvdksEwdRJu7McZiwWSZ5k4X6/18rm9ITX
         fg5w==
X-Forwarded-Encrypted: i=1; AJvYcCU/GmPcRBm/cAl5W9Nv27aOLtRn1tpr6o8p/1YVevQuDyEnkZAG5RvFQ4edMOq/gRo9iAP7sxOwqcjRBkBW@lists.linux.dev
X-Gm-Message-State: AOJu0YxxhHWeYmNKMZmRYXu+RDc5ceSYXjM68KpAmDTM1D326XyW+sDQ
	fPwiN6fejRu4cEIim3B6xLTOsyEOqBSWNnkdPq2kapvXqoTsbcvbm+h9csd3CapY+AI=
X-Gm-Gg: ASbGncvf19wptREG8HHyKSfkBz1YPHLsg1TL8rOaMgD+NVYUDdVQHl1jiqm+KWIX2SY
	JQOnaNCm233D1FpHpKe+WNuTeTvcr9IHSjewomuMhaKqWTLQfLbU+XHj9q+itNqFWOySQjWd1i0
	paf2HpT4KDkgQ6Vvb5Q61uOH4PzTdLctaT8d4swpG9TYkmVi2uC9q0o8Yr+tI3nY0mx+r+LkXwS
	KV5Ms99yHZrfqmJ5gr7nQ/EFLDYGJXzkzx9aTfuDZPG7MAk1JwSdkgWkablmHtNHaXOp3dUxwRo
	p5/VumI0DPMFYN8nUxk/3j3znOhnf1yvR/2CF5uRhCwVobH2Xg4xJO36vdwdJOk0AobKGPF8kL/
	jzieBPvnEbgnrCxlSreI1s+qvWifmolgYB83dOBrlUrgfcjD8MeLHhUBQeihoIHHGeGZB03jqK6
	iOW8t+lFdLvB5d
X-Google-Smtp-Source: AGHT+IGDC3NDQYPTkkfUUoVyM/sJxUdHO2Lpp1MzeugUZlOM8vLQhbQSiv+7msu1x/Jy2tsYDRamhg==
X-Received: by 2002:a17:906:c103:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b7265607354mr700966366b.59.1762434612174;
        Thu, 06 Nov 2025 05:10:12 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896848a5sm207325966b.57.2025.11.06.05.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:10:11 -0800 (PST)
Date: Thu, 6 Nov 2025 16:10:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Baryshkov <lumag@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn:
 variable dereferenced before check 'kms' (see line 235)
Message-ID: <9412d8fc-7bb8-456f-9911-8443303497a5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc77806cf3b4788d328fddf245e86c5b529f31a2
commit: a409b78fcdf724422fa030bd5ef177ebf3b7608a drm/msm: move wq handling to KMS code
config: powerpc64-randconfig-r073-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061924.Y0EaYmPu-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511061924.Y0EaYmPu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/msm_kms.c:251 msm_drm_kms_uninit() warn: variable dereferenced before check 'kms' (see line 235)

vim +/kms +251 drivers/gpu/drm/msm/msm_kms.c

506efcba31296e Dmitry Baryshkov 2023-10-09  220  void msm_drm_kms_uninit(struct device *dev)
506efcba31296e Dmitry Baryshkov 2023-10-09  221  {
506efcba31296e Dmitry Baryshkov 2023-10-09  222  	struct platform_device *pdev = to_platform_device(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  223  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
506efcba31296e Dmitry Baryshkov 2023-10-09  224  	struct drm_device *ddev = priv->dev;
506efcba31296e Dmitry Baryshkov 2023-10-09  225  	struct msm_kms *kms = priv->kms;
506efcba31296e Dmitry Baryshkov 2023-10-09  226  	int i;
506efcba31296e Dmitry Baryshkov 2023-10-09  227  
506efcba31296e Dmitry Baryshkov 2023-10-09  228  	BUG_ON(!kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  229  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  230  	/* We must cancel and cleanup any pending vblank enable/disable
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  231  	 * work before msm_irq_uninstall() to avoid work re-enabling an
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  232  	 * irq after uninstall has disabled it.
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  233  	 */
a409b78fcdf724 Dmitry Baryshkov 2025-07-05  234  
a409b78fcdf724 Dmitry Baryshkov 2025-07-05 @235  	flush_workqueue(kms->wq);
                                                                        ^^^^^^^
Dereferenced

a409b78fcdf724 Dmitry Baryshkov 2025-07-05  236  
506efcba31296e Dmitry Baryshkov 2023-10-09  237  	/* clean up event worker threads */
506efcba31296e Dmitry Baryshkov 2023-10-09  238  	for (i = 0; i < priv->num_crtcs; i++) {
506efcba31296e Dmitry Baryshkov 2023-10-09  239  		if (priv->event_thread[i].worker)
506efcba31296e Dmitry Baryshkov 2023-10-09  240  			kthread_destroy_worker(priv->event_thread[i].worker);
506efcba31296e Dmitry Baryshkov 2023-10-09  241  	}
506efcba31296e Dmitry Baryshkov 2023-10-09  242  
506efcba31296e Dmitry Baryshkov 2023-10-09  243  	drm_kms_helper_poll_fini(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  244  
506efcba31296e Dmitry Baryshkov 2023-10-09  245  	msm_disp_snapshot_destroy(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  246  
506efcba31296e Dmitry Baryshkov 2023-10-09  247  	pm_runtime_get_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  248  	msm_irq_uninstall(ddev);
506efcba31296e Dmitry Baryshkov 2023-10-09  249  	pm_runtime_put_sync(dev);
506efcba31296e Dmitry Baryshkov 2023-10-09  250  
506efcba31296e Dmitry Baryshkov 2023-10-09 @251  	if (kms && kms->funcs)
                                                            ^^^
Checked too late.

506efcba31296e Dmitry Baryshkov 2023-10-09  252  		kms->funcs->destroy(kms);
506efcba31296e Dmitry Baryshkov 2023-10-09  253  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

