Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6C364E91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765983156; cv=none; b=N+Sdf1lpVB9NUiwnC67PJ+5RKvf8jzOKYWOnO98OD7QGMQhMxaiXhJmZXupk98N2oLqp4ATZNTeP6YsL+a5fu/vln7CotckL/j9K0uZcSjJSWE+FWoVT8y5EPlJtUeXcA566SulzHE8AoWaO9bKCg8OrNds225o8Oj4KrQEbQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765983156; c=relaxed/simple;
	bh=sxUy2lyaRasPfwZBuh4CxUrW3wUHSpO7/djJ2qA5Ygs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qu2NxNyWecIpFmwiA/yX2Y8RdtnQxhwGTqNYHAlt1oDgfN56TVJxNIUZ+QfA3pG6AkG6u3+pVrtlwXLwzm51jZcsazYXt6UkEEUmFWWcYW9aDw+CUvCEIlqd+LVAZ41JmK+Dx953ldLiPeLBTlbHgZlAhDctttuNldytwgHtvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s33DUlWB; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s33DUlWB"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47789cd2083so32058095e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 06:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765983153; x=1766587953; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9R1VSMxDjDo/PSx2Oy55CzlME/Hv+2vtYOdhIYqnXI=;
        b=s33DUlWB/2xkvY7JjIV1S0NIlFAuP2EUSg07oRmAVYKRgyq02eAV/Z9n+9cvmUdtLW
         AuTd9l6sCYxY8pBP9VxNU2x2UE98342wENW1NTmYERUByed70hGAzDWRm1bGJzDU/2Nw
         Y3R9KRSdcJM8ddMtv8lH9K7/JDgOlLGiP2t1oZXgpeOrU5hUB+axuL5C69wL48zOS9c0
         dPMPo7PB7piUTOpx0wnqULt9jTSAxyLallNsll1eHDhl7XRoHrZ0qV6A71Vf8JMvJHtL
         yqdZrxKBPWLZ45rjIK8+liqrQDAWgIFy7cQYMBSjSAdkXqccNyor85Py8cZQtMULOENB
         9ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765983153; x=1766587953;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9R1VSMxDjDo/PSx2Oy55CzlME/Hv+2vtYOdhIYqnXI=;
        b=AW7usH2vdKFk3/hI+Fxzv6dkvSur59nGekI2D2cv1gpce2LyzjV4tVKetIUhez/7pZ
         FABfpeXcVPMXIpEQCC5fJ8bHYDcSEd/4saox3ZucDjVu+15Q9fNUfiDp15hZNObFPbhW
         YzW7Y7QShy1mHPTXQ2POgiDPlE4pyayI2rNglpd8/ivG1pC8ZBGC+zKZL07YvY5wvJtu
         bZIN5p2pC4TNhrucdvY3E0adPqxmrEn7umOcHlt1roHQA5Ymhp1NFy9k+NjEdVNZdnm7
         ioHELgGcLaqtu/MPdcP9hIKF8SwAeRd+zRSaq0st+BDHFKhsWfFC85+ZV6B56kBcMF8z
         XJXg==
X-Forwarded-Encrypted: i=1; AJvYcCX7qPcrWRv7d7QsmFOO+mFyNgC88ulfKF2aTRB3Kt1PDRv6hWeFlDno9vYzs0qds3gBYXCum79pn3mne/do@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2OqFmV20NfAyDT0wuER3o6hYWzMK9t9ldUmpcCElBYcZerW37
	+sgE8EjY5vhcj+VJAygSksUfFKX6JsfDDaC/GYJ441Ceth8yIwkHEGoZTfgR67yvpYo=
X-Gm-Gg: AY/fxX4FifvQhcnYIrMg4odJHtNB/chChthnSD0kv3X/KaCFPiEFZZISRE1UNPelZcc
	fIv5VASmoqXK0V6dziQg7xBQrqe9CZ/n83QxTwQPN8DBXjY4XhnCutQIW4QSNdvMcWarlFoTtpA
	NY8hHeCGSmHeTXsGlLRzxZ0+jSjl+QUjy/HAW9Fd8VakMAP6RmfxTv3b9iC416haqoDe55plp9c
	xzKnGaMTBJCNKmkh/9pJ+ypiLk+yW/KDVKyorg/1epMP7d+00cvc3ttVInDuLZnwuLoOaQwz3tX
	AymUe8HbdUbaxJ/R+bxR25QCz+vxmVQ30WmO/vVoBrOPDSi/zH3e+vA9vChmmeTkJYVV3to7tKr
	+wjb1CxtoMxXV5VG3o4jrmlNdOUPdkGMiIJud6nDUJnDxmtSnnsdk6s5+IqbC9yFOwllplzoRGQ
	bAUqql8+DyV1RiQe6P
X-Google-Smtp-Source: AGHT+IEUXgc+xMhVYYGwfY93p/WQf2z6WwsqkfeeJjsB47eWKU/eSt1hkobG/fPK2ZsutEsXbAiyxA==
X-Received: by 2002:a05:600d:13:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-47a9327dc50mr163650505e9.26.1765983152581;
        Wed, 17 Dec 2025 06:52:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90f0bd9sm33323815e9.5.2025.12.17.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:52:32 -0800 (PST)
Date: Wed, 17 Dec 2025 17:52:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Sebastien Boeuf <seb@rivosinc.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe()
 warn: 'iommu->irqs_count' unsigned <= 0
Message-ID: <202512141551.kZLTle5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5c0ebbd3c6c6e00af112fe053e81ac0c7cafe647 iommu/riscv: Add RISC-V IOMMU platform device driver
config: riscv-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141551.kZLTle5r-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512141551.kZLTle5r-lkp@intel.com/

smatch warnings:
drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe() warn: 'iommu->irqs_count' unsigned <= 0

vim +54 drivers/iommu/riscv/iommu-platform.c

5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  20  static int riscv_iommu_platform_probe(struct platform_device *pdev)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  21  {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  22  	struct device *dev = &pdev->dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  23  	struct riscv_iommu_device *iommu = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  24  	struct resource *res = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  25  	int vec;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  26  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  27  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  28  	if (!iommu)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  29  		return -ENOMEM;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  30  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  31  	iommu->dev = dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  32  	iommu->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  33  	if (IS_ERR(iommu->reg))
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  34  		return dev_err_probe(dev, PTR_ERR(iommu->reg),
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  35  				     "could not map register region\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  36  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  37  	dev_set_drvdata(dev, iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  38  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  39  	/* Check device reported capabilities / features. */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  40  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  41  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  42  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  43  	/* For now we only support WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  44  	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  45  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  46  	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  47  		break;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  48  	default:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  49  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  50  				     "unable to use wire-signaled interrupts\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  51  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  52  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  53  	iommu->irqs_count = platform_irq_count(pdev);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15 @54  	if (iommu->irqs_count <= 0)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  55  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  56  				     "no IRQ resources provided\n");

platform_irq_count() can return -EPROBE_DEFER so iommu->irqs_count needs
to be signed.  (It's unsigned now).

5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  57  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  58  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  59  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  60  	for (vec = 0; vec < iommu->irqs_count; vec++)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  61  		iommu->irqs[vec] = platform_get_irq(pdev, vec);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  62  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  63  	/* Enable wire-signaled interrupts, fctl.WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  64  	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  65  		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  66  		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  67  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  68  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  69  	return riscv_iommu_init(iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  70  };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

