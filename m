Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBF28DF41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300801; cv=none; b=Tdi3titZ1YV4W4U1o5r4yWYlRDjkNoZLNjUlMjHe0RUAUIgVBCqCnIUPTAwBGcs+iDhjcbxdL1Vf8tO/E1MacSl+8yR/9P6nTqZ0+cOejeMyITVE8YQ37CKjyWe0g96qgIdyjp1N3EV9iSdzrld/lqtTLbyqPx3Ywe7aIXmMgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300801; c=relaxed/simple;
	bh=ZYMR7z5T+7I0DbIT2AphsLI9oq3i24aPeQXV7iyq+7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IY36v3kirFPhCZYhCfbA9pmf6hme28yEvDPfL4kgJaBVVr165zDUs9/hVB2UADFXdkYcn5Q19KMovHVpDG7h7aeWuWonWbrPmGzYwJAT5dcZT9UMTAdztuk/GoffEywa4n+yokjRWPNytosKc4JAoLFPEYza01NAIjRtRHwR4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0FkWTaz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0FkWTaz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so4997078a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300797; x=1751905597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=Q0FkWTaz+2LsyxQMCExw1OKoXxKTI9noO/1oz4QLVWIsZ9nnL1pc7RviNi21HH7rf0
         et4OKTWA/IIlaBhM1pfKE3p8rJKUBTVZ94ld75E/H0qCmnigVLmi1WZnaTq5+d212Boc
         prbsjsnNwbRA5kyjqHCOzO9zzQ3vSVxLIgQANkLz4iK2RsG826mLO0h4XtCOmZlCz7dU
         fkvlmBCfnsdjtKAo5LDGR/x3/9b2RvHJWq2onyWigsa9i55/HlEEWzaskrp3/sY11Pxm
         DNY2JW0nBHCRpgqkylHORVaqgFKER2pVud3ocV8u4s91YQSkk7YR4z5g7igEfXMYrfG4
         n13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300797; x=1751905597;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=eyquB1aqnKe4TqxD6lTMIVq5YKhBWiwKwiulfUwTuCDzhDKQNyWlKVlL436vLZIaLm
         tUIugXiKuRqA5fGLhCqhwtLTpoMJBRpmQ7vwVIroe6E1NDh+7/vCVoa/i43Z2FXkslQH
         U71+UX+K5Wl334b6S3HJI9gIsXM5GcpIZTMRT8YyGV/YOFOzZZVTyAATqQ9TAlBJUcYY
         KbnUEitve/b9WK05ZghJDO4zX3ruuGTQw2Sbe4EHok5SzLiWwlOwaVUvUVNxcRJAZfJd
         PtbjmBPmKfAYheJ6bk6Ut5rVwohhu9eAHcpHTNNWD0ikApjD5co6JwxpbbdyienJqh+p
         mmWw==
X-Forwarded-Encrypted: i=1; AJvYcCVIS1lOO8Y9a9M2YqrBGNwuDGv8Q0ynXDshbbryz73DFaylhg7T+Nyz+hoqNIbzRABpaXlofbj0YNkEB/6V@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt7tv9WpwK4L83qVWXy+uSBmnTeFDtN92ucXq30k+eiiiIeO1a
	sltSw+8VwZz+GlAJIfvSiHKDOwgObkuiPimaV3Jll8UIWHJzfsWUvObGPLzTZQyqito=
X-Gm-Gg: ASbGnctbOuMdFug7rINEdofBHd1Xy9xxvTP0YRWWx2e6L9REirnFZnaNEC3Bj2uV44G
	j0xeFrlnxe6RqMy1EshiMIfzwFJ6LSjCS84UYBE7pRhQfM3xOr974q45dgyt+M9Pyj4ps3T7sZC
	g3rxTt4OazoVk87J41eYNZ7S9Z023E1o4pprZUrZGu9AfNeL0Q1nIzwGWvWg0NOIkhRKeqXEZyM
	bTdKwPlzlotw17OsLl+V3EHtBRYPq84294qE5oA9AYUfjfzb3IWPFRICylbVHr3rLX3v3yWgdKX
	Lmeac+1ltv6RWpAI6tIlPHphvk4gFJdyhsQfvwp5N78KhvlCLE8xj3MlqGFIDGdi//LoNZyuOK5
	34M4=
X-Google-Smtp-Source: AGHT+IEZUFYK3OlqCsPYEUjbY6KleNynpLo18SzDo4cGFtE9VgvfMNqI4nas16gqs6EKpGcliuTGQg==
X-Received: by 2002:a17:907:94cc:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae34fdbbadfmr1268647466b.22.1751300797043;
        Mon, 30 Jun 2025 09:26:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35776d0ebsm685350066b.155.2025.06.30.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:26:36 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:26:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shradha Todi <shradha.t@samsung.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com, Shradha Todi <shradha.t@samsung.com>
Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <5ed352de-8319-4e3f-8cce-43a4bb332e66@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-10-shradha.t@samsung.com>

Hi Shradha,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shradha-Todi/PCI-exynos-Remove-unused-MACROs-in-exynos-PCI-file/20250626-104154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250625165229.3458-10-shradha.t%40samsung.com
patch subject: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301329.VWoiH0yn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506301329.VWoiH0yn-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-exynos.c:621 exynos_pcie_probe() error: we previously assumed 'pdata->res_ops' could be null (see line 609)
drivers/pci/controller/dwc/pci-exynos.c:655 exynos_pcie_probe() warn: missing error code 'ret'

vim +621 drivers/pci/controller/dwc/pci-exynos.c

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  595  			dev_err(dev, "couldn't get the register offset for syscon!\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  596  			return ret;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  597  		}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  598  	}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  599  
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  600  	/* External Local Bus interface (ELBI) registers */
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  601  	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  602  	if (IS_ERR(ep->elbi_base))
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  603  		return PTR_ERR(ep->elbi_base);
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  604  
10106d5c1f9cee drivers/pci/controller/dwc/pci-exynos.c Cristian Ciocaltea 2024-12-17  605  	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
6b11143f9344dd dripdata->res_opsvers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  606  	if (ret < 0)
6b11143f9344dd drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  607  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  608  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @609  	if (pdata->res_ops && pdata->res_ops->init_regulator) {
                                                                                                    ^^^^^^^^^^^^^^
This code assumes pdata->res_ops can be NULL

ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  610  		ret = ep->pdata->res_ops->init_regulator(ep);
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  611  		if (ret)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  612  			return ret;
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  613  	}
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  614  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  615  	ret = samsung_regulator_enable(ep);
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  616  	if (ret)
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  617  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  618  
b2e6d3055d5545 drivers/pci/dwc/pci-exynos.c            Bjorn Helgaas      2017-02-21  619  	platform_set_drvdata(pdev, ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  620  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @621  	if (pdata->res_ops->set_device_mode)
                                                                                                    ^^^^^^^^^^^^^^
But this dereferences it without checking.  Most likely the
NULL check should be removed?

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  622  		pdata->res_ops->set_device_mode(ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  623  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  624  	switch (ep->pdata->device_mode) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

