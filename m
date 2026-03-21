Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B03090FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774081456; cv=none; b=CDemUAhEbc1SBGKUUSqVX8WybkdIKvDwjzTAZQxyRUzv8bC0BEX64TiiFtRSuGf17jrHrsTfnKVlJIIKLD3d9DGJiJlS0h0UiQfoHjGFWACb3nudz8yU7t/zwuFYwkVBfPGzxfcz/7IIJoJKKT/SAFb5LNW7vX9sjeMkShBaH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774081456; c=relaxed/simple;
	bh=fmPBD7YA6azb7F8LrKL+qbpM8UJ2GzSJr7Tbg8I4Alk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmwLDkmuhEHSBTAvPdJdh6E9SO9mJjtl1FQoQUI96mmphoXEB4b5SgqJzdO3fZ5LS5NL92vPNFiqQJAeDDES6GDZa1MY5GlM5UxSeiR+MLpZKUHWaCc9dp9FmAdIuLmX9AogEcoJVI1UkyBEvramHv/edq9PKF1eLuoxhZhDw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRSrr0uS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRSrr0uS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b2965d4bso895693f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774081452; x=1774686252; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CYxzZDk8cPYhADfaWndaY4jl5BWlS1C9t3gVCBTqqu0=;
        b=sRSrr0uS3zTsbqgW7cgTPRtmkPVwTTCZ4yCSi1FL0jpViQaCTbAMf9QMLmuh2XHpZb
         UVj33lL3rJI4FZYJ/Bvbfou4LoGUjN4NPAYIrKbdMHAzJd5i3aYa4hssafPL9/ccPZ2R
         1quFcToLy+9esY0rOenAxeMRSqtA+L5HEOQGMDD7glhghVoGcf25QqnZf7Qx6HLuvW++
         HfcSkgJTDTM3kVW9zrmNfNNZZx3GLlaUiGaa7vEGwYaZ41xa49KQa7olUgR8x5LZXHFE
         Bo9nLeHdDnTTUPC21h6A05VWOriUiB7JIHC5+pSESOjKoXhmPYI7HvaJ8mFWa8l/ufsQ
         OJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774081452; x=1774686252;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYxzZDk8cPYhADfaWndaY4jl5BWlS1C9t3gVCBTqqu0=;
        b=L9i7cBGVc8Ais/nAyV8rfNCSbJJhlpMPeAAUVE0LB8H9kSOWCx/AkN4pCBpNSXtYpP
         5Cvh6sbf112GJOvpFk0lkfcAgf8ueCl4rxm5KFEvmndqRyGAr5SHatpYe4CvBZ89qHMj
         RxE5wlyAbUqopcjQAUwIfC1Q2zCmWJL7xrugujRcTvpMXwZ9zUrs/ihcBFe6RSBbMUrT
         fftxOQ6cIonUj7CJvxasT0tOfg3sKi7hEMdvnkG70kN8cJYhvJ0aB9IAyqIzsY7+hTxu
         xtfzSAfEVKaet59ZpFf4dCcivVwHc+OGibLdOu7qXtjAVZUXT20nQBctq+bizqsxz+sF
         FFDA==
X-Forwarded-Encrypted: i=1; AJvYcCX3yKzc5CnIoqyR6sNgG/bJgRD820iarA4lYsc5/lsQvGvhAJDu+iAx0bPxQGqBQGstkPe0wTPwctrcYuM1@lists.linux.dev
X-Gm-Message-State: AOJu0YydAiBI0149dVUFOvQ4vW1iqZQUYpaCLQUFT04G+uMk12+iQNTv
	sB0IWH9FixD33hUYzhmGrrxHbbt3uXszbwI2C7WahNibHdCuQTH7cYDFOQ2bYOoImDM=
X-Gm-Gg: ATEYQzzK3KmIJELRJGq34qaBjDlCQrSpoQukAQstHL0exFsXxI+ztQlxoy8gSkWoWnG
	KXfgpzba6S0NBvB2coJq0tijj+mOdMaqN9EEU2M/9rk1m6wd9A3GeDPgbS+oUdKI3V/9HwhguFA
	WmqIZurZVVoYamF50hmJ/2xe9OUBVD3hsfT0oElbQGnX+xf1+UUp9CQp1VR2DOPQ8JoaI99D7Qm
	NBf2Uq3zwMwY4CaUSL5TC0jcpIBqd2nKGdftzFD0SxpgfteB6iyRHiPJTarOfJWEY7F2mWe7lwQ
	hP7XfXQAxbRT0Mc2coQ/jpvOYPfnQZx+itwN7FGF4EPaQSp6hRLqbGnoM89jAz655l9OqdEmgiS
	B9kMD37MOrXYGyS7Wkzx7XXEQADUxoJMLi6Q/p6RkgCjsL+22f9qNw5NQiGra8xnt4Hfquqa3HJ
	5IGqOrrFhUEYYAFgy7SBNnErGNyIuPCNf6bVtnJb8=
X-Received: by 2002:a05:6000:612:b0:439:c661:3245 with SMTP id ffacd0b85a97d-43b6427d39dmr9574845f8f.34.1774081452402;
        Sat, 21 Mar 2026 01:24:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm13330801f8f.37.2026.03.21.01.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 01:24:11 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:24:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_
 allocated variable to kfree. 'udev'
Message-ID: <202603210811.1eXTfndx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42bddab0563fe67882b2722620a66dd98c8dbf33
commit: 3397c3cd859a2c51962ad032dcf97961d42f9db2 uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
config: x86_64-randconfig-161-20260321 (https://download.01.org/0day-ci/archive/20260321/202603210811.1eXTfndx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603210811.1eXTfndx-lkp@intel.com/

New smatch warnings:
drivers/uio/uio_pci_generic_sva.c:140 probe() warn: passing devm_ allocated variable to kfree. 'udev'

vim +/udev +140 drivers/uio/uio_pci_generic_sva.c

3397c3cd859a2c Yaxing Guo 2025-09-26   62  static int probe(struct pci_dev *pdev, const struct pci_device_id *id)
3397c3cd859a2c Yaxing Guo 2025-09-26   63  {
3397c3cd859a2c Yaxing Guo 2025-09-26   64  	struct uio_pci_sva_dev *udev;
3397c3cd859a2c Yaxing Guo 2025-09-26   65  	int ret, i, irq = 0;
3397c3cd859a2c Yaxing Guo 2025-09-26   66  
3397c3cd859a2c Yaxing Guo 2025-09-26   67  	ret = pci_enable_device(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26   68  	if (ret) {
3397c3cd859a2c Yaxing Guo 2025-09-26   69  		dev_err(&pdev->dev, "pci_enable_device failed: %d\n", ret);
3397c3cd859a2c Yaxing Guo 2025-09-26   70  		return ret;
3397c3cd859a2c Yaxing Guo 2025-09-26   71  	}
3397c3cd859a2c Yaxing Guo 2025-09-26   72  
3397c3cd859a2c Yaxing Guo 2025-09-26   73  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
3397c3cd859a2c Yaxing Guo 2025-09-26   74  	if (ret)
3397c3cd859a2c Yaxing Guo 2025-09-26   75  		goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   76  
3397c3cd859a2c Yaxing Guo 2025-09-26   77  	pci_set_master(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26   78  
3397c3cd859a2c Yaxing Guo 2025-09-26   79  	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX | PCI_IRQ_MSI);
3397c3cd859a2c Yaxing Guo 2025-09-26   80  	if (ret > 0) {
3397c3cd859a2c Yaxing Guo 2025-09-26   81  		irq = pci_irq_vector(pdev, 0);
3397c3cd859a2c Yaxing Guo 2025-09-26   82  		if (irq < 0) {
3397c3cd859a2c Yaxing Guo 2025-09-26   83  			dev_err(&pdev->dev, "Failed to get MSI vector\n");
3397c3cd859a2c Yaxing Guo 2025-09-26   84  			ret = irq;
3397c3cd859a2c Yaxing Guo 2025-09-26   85  			goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   86  		}
3397c3cd859a2c Yaxing Guo 2025-09-26   87  	} else
3397c3cd859a2c Yaxing Guo 2025-09-26   88  		dev_warn(&pdev->dev,
3397c3cd859a2c Yaxing Guo 2025-09-26   89  			 "No IRQ vectors available (%d), using polling\n", ret);
3397c3cd859a2c Yaxing Guo 2025-09-26   90  
3397c3cd859a2c Yaxing Guo 2025-09-26   91  	udev = devm_kzalloc(&pdev->dev, sizeof(struct uio_pci_sva_dev),
3397c3cd859a2c Yaxing Guo 2025-09-26   92  			    GFP_KERNEL);

udev is devm_ memory.

3397c3cd859a2c Yaxing Guo 2025-09-26   93  	if (!udev) {
3397c3cd859a2c Yaxing Guo 2025-09-26   94  		ret =  -ENOMEM;
3397c3cd859a2c Yaxing Guo 2025-09-26   95  		goto out_disable;
3397c3cd859a2c Yaxing Guo 2025-09-26   96  	}
3397c3cd859a2c Yaxing Guo 2025-09-26   97  

[ snip ]

3397c3cd859a2c Yaxing Guo 2025-09-26  129  	ret = devm_uio_register_device(&pdev->dev, &udev->info);
3397c3cd859a2c Yaxing Guo 2025-09-26  130  	if (ret) {
3397c3cd859a2c Yaxing Guo 2025-09-26  131  		dev_err(&pdev->dev, "Failed to register uio device\n");
3397c3cd859a2c Yaxing Guo 2025-09-26  132  		goto out_free;
3397c3cd859a2c Yaxing Guo 2025-09-26  133  	}
3397c3cd859a2c Yaxing Guo 2025-09-26  134  
3397c3cd859a2c Yaxing Guo 2025-09-26  135  	pci_set_drvdata(pdev, udev);
3397c3cd859a2c Yaxing Guo 2025-09-26  136  
3397c3cd859a2c Yaxing Guo 2025-09-26  137  	return 0;
3397c3cd859a2c Yaxing Guo 2025-09-26  138  
3397c3cd859a2c Yaxing Guo 2025-09-26  139  out_free:
3397c3cd859a2c Yaxing Guo 2025-09-26 @140  	kfree(udev);

So this is a double free.

3397c3cd859a2c Yaxing Guo 2025-09-26  141  out_disable:
3397c3cd859a2c Yaxing Guo 2025-09-26  142  	pci_disable_device(pdev);
3397c3cd859a2c Yaxing Guo 2025-09-26  143  
3397c3cd859a2c Yaxing Guo 2025-09-26  144  	return ret;
3397c3cd859a2c Yaxing Guo 2025-09-26  145  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

