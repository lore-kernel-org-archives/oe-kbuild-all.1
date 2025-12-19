Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB92DAFDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138250; cv=none; b=MvVFGxBdUefs9Oq7jMyFjx5N0qKxBFVTt58d8mLL8btlpWbrLi3qnC0TQ/vEFk0VBe32AVpOK43PJXnmVZFcysRvRm5GWzvf9u3bqyz0Nz5yc73yAIkuoBTPmkTJvNhQIZnUNCHALKNrjBR71ASVM2KgQ+pVP5ifJSXpbhNoEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138250; c=relaxed/simple;
	bh=OR2PY97W8ipr+B7+iOwqoXyCaeWprBeC5EeiojF52ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ev1vI2Ba8ifk/Eb9Ei+ZvuuLKY7hASje35gKOotVHcuOuJSREr/c5bcoOF0eUWM8tKWbE1iwwhdIttu+o51FftTCcR9o876ik3JP49r57kW3Svuy+vUljRQxJ/LK1AyF9uoMXg2CfxMdcjkV2AK4p7eSRcnb+5pik1oLB4CKWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nV/M3aaD; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nV/M3aaD"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so796856f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766138246; x=1766743046; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRfBhsni2kqV80J32b5ISqLNoI4e4O6FW3XsoLOHeBo=;
        b=nV/M3aaDc3CuwoEP0IGVrmDTWCx/XHTB7yT0EYP9SitIWLDWbFPv6Y1I/mr4UWcsZw
         noIVWhGd9IefbIlrPvubWlY5cGgXJzbmmwsBedu11fA+vKQFiXZWQXoP12otUoV3H2bD
         fHuUiS9kYQjvk5/mdg2/ytJlIL7cRzyAYU97rcJJ0TkeLstGGhs8/qzUdLOZ2iF8qXw2
         zEld5byNlT5tvz39ysP5hG6DzAUoXs3TP+2PI8nTnV322VjxSHziSU6PBzONVpl0zZ94
         zNIz2ttq+L2y/5oFDbA8gpxXl4p3ZBg4gd2Z61kceRUHlPHIdAG0tqdFQsL5ECFzW3wX
         Nnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138246; x=1766743046;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRfBhsni2kqV80J32b5ISqLNoI4e4O6FW3XsoLOHeBo=;
        b=thfU0A5taA8InfO/I9hrC1/WkhH1U3s5amFNzALb/ctcBJlEe3jwZC8tuqho744s2p
         mqDYe1KBLr8HkX1ZdofQrAmFXKn5OJQjxlS8OT8jjxUm7Y66bujMeXTgsYDNbiERHTpU
         25RtfbzpeBlAud24riW9tVkevPnAGewk+A6YmrNOaoCXKZ4JZJvFLwilkVVyLrtRVt0W
         uFpOt58ssN/96aLRqzNRRrS8s05Kl8I7sQxKN4CX6MK9Iq39Es3U6XVTV2p89Lw0S3O7
         zngSjiwfF5oNkZZ0cUHSe//0BVBQtJU9z0QqI7/4SPY7W8XEQaAW3IF1o//xM9fX5f6a
         gFOg==
X-Forwarded-Encrypted: i=1; AJvYcCXdc4keBMssA9+MSjcsoAnYgp7f61ouruCOdmvPS9wvABjG5Z/usGEhUDYG2CONJDTogl7r5+e9nk7pHNv/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+nEYwhud58oYSBWYkfzIR8gHe9nlQ7K3ebGrxrBYJxqVVZgFo
	Keo9WdCtduZ5fs2KwNrE1dAWdrTfQzUfLCfVlwBE8zsa5xSNl7Pqh8HQvNefBCTUPVw=
X-Gm-Gg: AY/fxX7fIAU8kyG/kqcEixejhvAlP1E6U35jqikEoOutVaP2nxYP/Y9Fn/CDMMK2GOw
	rMh40c0N531omZK48hi/pUvifWEl4qX69baG67B4JHnDJ9IzlW3t46Lwdm7JMObc5Xv57VOfLZ5
	CiXIBx33Aq0yu8v2uTDT6oYrOREo2kbtiMDdRvpLXGQ7fTg3CyfoT8Th+7aLEIzw8bAeTTG6GP3
	KP5a6FoOjsxIDNVK+s0O+ThAuQESnCzBPmZqVhv2F/02iTj3+4XcSyoFIe6AnPfg7a3VVepg4DU
	PZ09E1N+cILfCpU5rDoFdNZuJWpd+DNuN32ime/Vy/TS5RHRMQSLTKnyqaskvm7Q1IzLVZST8EY
	/lEjsAdBp8RDESwSoZ+A6RVH5AmUCnySjtlSnP82JPw2pn99oEQvT86DjorixLbj1MpfuAOxFcQ
	PjmLW6uOpsD0sr39OhoKbqJcoaNsw=
X-Google-Smtp-Source: AGHT+IEmm8YEgs2M733a2qvyZJWLUeoj1I8ahYmA2Kd5VWV9ji7NpsIvN7JSmqGW4U4b399znZeBrQ==
X-Received: by 2002:a05:6000:178f:b0:431:5ac:1ea with SMTP id ffacd0b85a97d-4324e4fb37dmr2627710f8f.39.1766138245970;
        Fri, 19 Dec 2025 01:57:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4092280f8f.22.2025.12.19.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:57:25 -0800 (PST)
Date: Fri, 19 Dec 2025 12:57:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kishon Vijay Abraham I <kvijayab@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: drivers/iommu/amd/iommu.c:2401 amd_iommu_probe_device() error:
 uninitialized symbol 'dev_data'.
Message-ID: <202512191724.meqJENXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 19e5cc156cbc32421eb8237615f246c08eea8284 iommu/amd: Enable support for up to 2K interrupts per function
config: x86_64-randconfig-r073-20251215 (https://download.01.org/0day-ci/archive/20251219/202512191724.meqJENXe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512191724.meqJENXe-lkp@intel.com/

New smatch warnings:
drivers/iommu/amd/iommu.c:2401 amd_iommu_probe_device() error: uninitialized symbol 'dev_data'.
drivers/iommu/amd/iommu.c:3200 alloc_irq_table() error: we previously assumed 'iommu' could be null (see line 3195)

vim +/dev_data +2401 drivers/iommu/amd/iommu.c

dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2353  static struct iommu_device *amd_iommu_probe_device(struct device *dev)
15898bbcb48fc8 arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-24  2354  {
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2355  	struct iommu_device *iommu_dev;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2356  	struct amd_iommu *iommu;
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2357  	struct iommu_dev_data *dev_data;
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2358  	int ret;
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2359  
57bd2c24ba1673 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2360  	if (!check_device(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2361  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2362  
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2363  	iommu = rlookup_amd_iommu(dev);
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2364  	if (!iommu)
8b71c9bf4df829 drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2365  		return ERR_PTR(-ENODEV);
e275a2a0fc9e21 arch/x86/kernel/amd_iommu.c Joerg Roedel           2008-12-10  2366  
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2367  	/* Not registered yet? */
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2368  	if (!iommu->iommu.ops)
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2369  		return ERR_PTR(-ENODEV);
cbc040081fdf7d drivers/iommu/amd/iommu.c   Robin Murphy           2022-08-15  2370  
05a0542b456e13 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-05-27  2371  	if (dev_iommu_priv_get(dev))
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2372  		return &iommu->iommu;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2373  
99fc4ac3d2978c drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2374  	ret = iommu_init_device(iommu, dev);
4d58b8a6de6b8c drivers/iommu/amd_iommu.c   Joerg Roedel           2015-06-11  2375  	if (ret) {
5f226da1b1d706 drivers/iommu/amd_iommu.c   Bjorn Helgaas          2019-02-08  2376  		dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2377  		iommu_dev = ERR_PTR(ret);
99fc4ac3d2978c drivers/iommu/amd/iommu.c   Suravee Suthikulpanit  2022-07-06  2378  		iommu_ignore_device(iommu, dev);
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2379  		goto out_err;

dev_data is uninitialized.

293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2380  	}
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2381  
2b2c6aa63824c6 drivers/iommu/amd/iommu.c   Thomas Gleixner        2020-08-26  2382  	amd_iommu_set_pci_msi_domain(dev, iommu);
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2383  	iommu_dev = &iommu->iommu;
657cbb6b6cba0f arch/x86/kernel/amd_iommu.c Joerg Roedel           2009-11-23  2384  
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2385  	/*
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2386  	 * If IOMMU and device supports PASID then it will contain max
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2387  	 * supported PASIDs, else it will be zero.
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2388  	 */
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2389  	dev_data = dev_iommu_priv_get(dev);
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2390  	if (amd_iommu_pasid_supported() && dev_is_pci(dev) &&
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2391  	    pdev_pasid_supported(dev_data)) {
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2392  		dev_data->max_pasids = min_t(u32, iommu->iommu.max_pasids,
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2393  					     pci_max_pasids(to_pci_dev(dev)));
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2394  	}
a0c47f233e683e drivers/iommu/amd/iommu.c   Vasant Hegde           2024-04-18  2395  
293aa9ec694e63 drivers/iommu/amd/iommu.c   Vasant Hegde           2024-08-28  2396  out_err:
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2397  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2398  	iommu_completion_wait(iommu);
2c9195e9902970 drivers/iommu/amd_iommu.c   Joerg Roedel           2012-07-19  2399  
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2400  	if (FEATURE_NUM_INT_REMAP_SUP_2K(amd_iommu_efr2))
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07 @2401  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_2K;
                                                                                                ^^^^^^^^^^

19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2402  	else
19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2403  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
                                                                                                ^^^^^^^^^^

19e5cc156cbc32 drivers/iommu/amd/iommu.c   Kishon Vijay Abraham I 2025-03-07  2404  
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2405  	if (dev_is_pci(dev))
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2406  		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
6c17c7d5936e6a drivers/iommu/amd/iommu.c   Jason Gunthorpe        2024-08-07  2407  
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2408  	return iommu_dev;
dce8d6964ebdb3 drivers/iommu/amd_iommu.c   Joerg Roedel           2020-04-29  2409  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

