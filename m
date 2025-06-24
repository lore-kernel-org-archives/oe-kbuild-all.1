Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D445FEE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776331; cv=none; b=AzXYjJbUCfu2Pu3BgA4V3Gg7dEzy8ivfpq93GMijuGRk5A0P1JK59+kJnbfl7RE6yznHRAjPdeJPGYi/mnAfr8QKHcIqljdma7e1VxOZLpN9dT3MmXtBPqXxrmi4X84oHWsjqSH6vRZlInFDmA4YZMRMH6Y0sMAvtkWRm3ior2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776331; c=relaxed/simple;
	bh=A6ghZ5VcaQY3lcCylUHVqFjyxuVtg1KD3orA/c7GO7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UKbvo5p+qMvw0Z/8/Mh2wPsiQsuRz+s48b+AZXRCl2IxZYLOcgubooZjqmIP4qiA+E+P+r1Zqf4eRu7BJ9qTHiwW7uhGzaTkI+t98rOFZ3J+nrZ0mC20rO1dEMOxyqkNxFWNzi6t0m/WAKRnAKzlGaOjaepTTmPCg/ACgfxNre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbkTAIC8; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbkTAIC8"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40791b6969bso3808146b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 07:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750776328; x=1751381128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wbRj9TkPQ20XGWiSk4YSlkPAtJFmTPKLMPw0k3ac3M=;
        b=FbkTAIC8+j87/ld4LtVxp4M495a3/ruyuop4thIQGFHP1C50Vc4f/GwWVbVb+pXtPQ
         v9Xy9cuNEGGGdi8AOFywMgnu1Q9nNjQIc8Gpb2MWY8yXsvobvFDtfIFbsCDpDbPKNK7k
         HrxeD0OkYomveTCsWx6JQlIwEqfYXZmUql4bpYeWltryIXAl+Hv6tevrWByeeG+f1wwM
         cut+e7SMeemPhNcaG9npbLQIp1BiWngl9J2CUCqvKO4fjCpH/Hd0b2Bl8TALBGsw0swz
         l5LT9oByB850vS/EmqKaXawK2WRCvhxqrlWylWOmVieZM2xAOuBfqGhaQehqxqt/hYUB
         hKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776328; x=1751381128;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wbRj9TkPQ20XGWiSk4YSlkPAtJFmTPKLMPw0k3ac3M=;
        b=s12JDibokzFH72fd8aZNxd6IzfI5FeW3ZuFlJ4VT68BxJIs4yeeP4Tw+3X5kHfM4/D
         cgVh7Wg+haBpj+YfHIPUx8deyYV8ifWSo44mGSTLUUWUOIwYYI04JntQY705NB98LSAG
         p1y1arrXbDO9V9AexNoNLb2wypDbx31aeB+5HgUKsNLcK50Z6tv+YmFQyY0WqBWosEvm
         /Ym8IsQ4xF5ONBbH5+XRvz6QTV6GOPsOvwZw0siRKlRABgfeSzgPf9jBKf5rv2T35dKf
         502U4yOZe99liPsrEqwl/SECfdeU5cFc99yauInr3Jj5sLoH+FYnaS/k46NW/k519ji0
         nBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw3mPBSRL2KahR5y1F2C+MS+CY70ood+7ozkFpKmaSZYUS4Ir+O6+BH8JimFc3FQKZfTzB/qTQj2io2cWm@lists.linux.dev
X-Gm-Message-State: AOJu0YxRbcfz8vFh9PTNrsyKnMYV9ucUXVk9ZPh1AZxq3Dsi03wytIgj
	VAg2pfEnGQqy7kBhNTfvhKdwWrbC1mW5ap2XgxI3Rp42FPVFqQskjC1eWzxRqEPYqUo=
X-Gm-Gg: ASbGncts5B4KVhuUKO0kCFUzsPsg7xJtThH4CZATFkFqxh1aS5+RxCAVrfATHz07Oki
	mOs+i1aCujeF/6n5J4QTXDTQd78sEqxYSrFeqNDe7NjWBpWmNbiMKzXr97GXgNaH1NPKXSsQDTy
	R88ibfwJdaMVUzTcv/x2pbZteVpsWaGsCKvhg9D4Q8KfA2Xv8hiRbJmEedoq9RgqFkf0DGt/xuC
	VfM3OdAVrWRLnh3PiGkxS+4bMG9FxKEYze0CGcWXGt0Msny7oiRFGCndrbm3k+A63q4nji0NeDv
	4u1UocMqpei3KP+9NOcYpTDOw8NdDB2RB3evlUYkujnu19Q6g0pQWxZEdzJokc4ihpHJmg==
X-Google-Smtp-Source: AGHT+IFpS8g6Vaqx3fZzd3FMvQvmqC0h1tgXNlttTp7lZtKJbB6VTC5+xsTlx9pRv9afV8Mn/19XRw==
X-Received: by 2002:a05:6808:1453:b0:3f7:d16c:e293 with SMTP id 5614622812f47-40ac6f52873mr14807487b6e.2.1750776328010;
        Tue, 24 Jun 2025 07:45:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c30454sm1805823b6e.14.2025.06.24.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:45:27 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:45:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xi Pardee <xi.pardee@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement
 for S0ix blockers
Message-ID: <a0500c45-993d-4daa-b35f-48c9ff4cf50b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621210529.237964-5-xi.pardee@linux.intel.com>

Hi Xi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Pardee/platform-x86-intel-pmc-Enable-SSRAM-support-for-Lunar-Lake/20250622-050804
base:   linus/master
patch link:    https://lore.kernel.org/r/20250621210529.237964-5-xi.pardee%40linux.intel.com
patch subject: [PATCH v1 4/5] platform/x86:intel/pmc: Show substate requirement for S0ix blockers
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241840.0POVt4tf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241840.0POVt4tf-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/pmc/core.c:1525 pmc_core_pmt_get_blk_sub_req() error: uninitialized symbol 'ret'.
drivers/platform/x86/intel/pmc/core.c:1559 pmc_core_get_telem_info() error: uninitialized symbol 'ret'.

vim +/ret +1525 drivers/platform/x86/intel/pmc/core.c

f3435ca196060d Xi Pardee 2025-06-21  1497  static int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev, struct pmc *pmc,
f3435ca196060d Xi Pardee 2025-06-21  1498  					struct telem_endpoint *ep)
f3435ca196060d Xi Pardee 2025-06-21  1499  {
f3435ca196060d Xi Pardee 2025-06-21  1500  	u32 num_blocker, sample_id;
f3435ca196060d Xi Pardee 2025-06-21  1501  	unsigned int index;
f3435ca196060d Xi Pardee 2025-06-21  1502  	u32 *req_offset;
f3435ca196060d Xi Pardee 2025-06-21  1503  	int ret;
f3435ca196060d Xi Pardee 2025-06-21  1504  
f3435ca196060d Xi Pardee 2025-06-21  1505  	num_blocker = pmc->map->num_s0ix_blocker;
f3435ca196060d Xi Pardee 2025-06-21  1506  	sample_id = pmc->map->blocker_req_offset;
f3435ca196060d Xi Pardee 2025-06-21  1507  
f3435ca196060d Xi Pardee 2025-06-21  1508  	pmc->blk_sub_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
f3435ca196060d Xi Pardee 2025-06-21  1509  					 num_blocker * sizeof(u32),

Use devm_kcalloc() so we don't have to check if num_blocker can be
greater than UINT_MAX / 4 on 32bit systems.

f3435ca196060d Xi Pardee 2025-06-21  1510  					 GFP_KERNEL);
f3435ca196060d Xi Pardee 2025-06-21  1511  	if (!pmc->blk_sub_req_regs)
f3435ca196060d Xi Pardee 2025-06-21  1512  		ret = -ENOMEM;

s/ret = /return /.  Otherwise it leads to a NULL pointer dereference.

f3435ca196060d Xi Pardee 2025-06-21  1513  
f3435ca196060d Xi Pardee 2025-06-21  1514  	req_offset = pmc->blk_sub_req_regs;
f3435ca196060d Xi Pardee 2025-06-21  1515  	for (index = 0; index < num_blocker; index++) {

smatch doesn't know if num_blocker can be zero.

f3435ca196060d Xi Pardee 2025-06-21  1516  		ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
f3435ca196060d Xi Pardee 2025-06-21  1517  		if (ret) {
f3435ca196060d Xi Pardee 2025-06-21  1518  			dev_err(&pmcdev->pdev->dev,
f3435ca196060d Xi Pardee 2025-06-21  1519  				"couldn't read Low Power Mode requirements: %d\n", ret);
f3435ca196060d Xi Pardee 2025-06-21  1520  			return ret;
f3435ca196060d Xi Pardee 2025-06-21  1521  		}
f3435ca196060d Xi Pardee 2025-06-21  1522  		sample_id++;
f3435ca196060d Xi Pardee 2025-06-21  1523  		req_offset++;
f3435ca196060d Xi Pardee 2025-06-21  1524  	}
f3435ca196060d Xi Pardee 2025-06-21 @1525  	return ret;
f3435ca196060d Xi Pardee 2025-06-21  1526  }
f3435ca196060d Xi Pardee 2025-06-21  1527  
f3435ca196060d Xi Pardee 2025-06-21  1528  static int pmc_core_get_telem_info(struct pmc_dev *pmcdev, int func, unsigned int telem_info)
78a7491d5cba8b Xi Pardee 2025-04-09  1529  {
b5d46539626833 Xi Pardee 2025-04-25  1530  	struct pci_dev *pcidev __free(pci_dev_put) = NULL;
d7bc7e19147769 Xi Pardee 2025-06-21  1531  	struct telem_endpoint *ep;
052fabddeaa70b Xi Pardee 2025-04-09  1532  	unsigned int i;
d7bc7e19147769 Xi Pardee 2025-06-21  1533  	u32 guid;
052fabddeaa70b Xi Pardee 2025-04-09  1534  	int ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1535  
b5d46539626833 Xi Pardee 2025-04-25  1536  	pcidev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(20, func));
b5d46539626833 Xi Pardee 2025-04-25  1537  	if (!pcidev)
78a7491d5cba8b Xi Pardee 2025-04-09  1538  		return -ENODEV;
78a7491d5cba8b Xi Pardee 2025-04-09  1539  
78a7491d5cba8b Xi Pardee 2025-04-09  1540  	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
d7bc7e19147769 Xi Pardee 2025-06-21  1541  		struct pmc *pmc;
d7bc7e19147769 Xi Pardee 2025-06-21  1542  
d7bc7e19147769 Xi Pardee 2025-06-21  1543  		pmc = pmcdev->pmcs[i];
d7bc7e19147769 Xi Pardee 2025-06-21  1544  		if (!pmc)
78a7491d5cba8b Xi Pardee 2025-04-09  1545  			continue;
78a7491d5cba8b Xi Pardee 2025-04-09  1546  
d7bc7e19147769 Xi Pardee 2025-06-21  1547  		guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
d7bc7e19147769 Xi Pardee 2025-06-21  1548  		if (!guid)
d7bc7e19147769 Xi Pardee 2025-06-21  1549  			return -ENXIO;
d7bc7e19147769 Xi Pardee 2025-06-21  1550  
d7bc7e19147769 Xi Pardee 2025-06-21  1551  		ep = pmt_telem_find_and_register_endpoint(pcidev, guid, 0);
d7bc7e19147769 Xi Pardee 2025-06-21  1552  		if (IS_ERR(ep)) {
d7bc7e19147769 Xi Pardee 2025-06-21  1553  			dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %pe", ep);
d7bc7e19147769 Xi Pardee 2025-06-21  1554  			return -EPROBE_DEFER;
d7bc7e19147769 Xi Pardee 2025-06-21  1555  		}
d7bc7e19147769 Xi Pardee 2025-06-21  1556  
f3435ca196060d Xi Pardee 2025-06-21  1557  		if (telem_info & SUB_REQ_LPM)
d7bc7e19147769 Xi Pardee 2025-06-21  1558  			ret = pmc_core_pmt_get_lpm_req(pmcdev, pmc, ep);

ret is uninitialized on else path.  I generally encourage developers
to set CONFIG_INIT_STACK_ALL_PATTERN=y for their testing.

78a7491d5cba8b Xi Pardee 2025-04-09 @1559  		if (ret)
f3435ca196060d Xi Pardee 2025-06-21  1560  			goto unregister_ep;
f3435ca196060d Xi Pardee 2025-06-21  1561  
f3435ca196060d Xi Pardee 2025-06-21  1562  		if (telem_info & SUB_REQ_BLK)
f3435ca196060d Xi Pardee 2025-06-21  1563  			ret = pmc_core_pmt_get_blk_sub_req(pmcdev, pmc, ep);
f3435ca196060d Xi Pardee 2025-06-21  1564  		if (ret)
f3435ca196060d Xi Pardee 2025-06-21  1565  			goto unregister_ep;
f3435ca196060d Xi Pardee 2025-06-21  1566  
f3435ca196060d Xi Pardee 2025-06-21  1567  		pmt_telem_unregister_endpoint(ep);
78a7491d5cba8b Xi Pardee 2025-04-09  1568  	}
78a7491d5cba8b Xi Pardee 2025-04-09  1569  
78a7491d5cba8b Xi Pardee 2025-04-09  1570  	return 0;
f3435ca196060d Xi Pardee 2025-06-21  1571  
f3435ca196060d Xi Pardee 2025-06-21  1572  unregister_ep:
f3435ca196060d Xi Pardee 2025-06-21  1573  	pmt_telem_unregister_endpoint(ep);
f3435ca196060d Xi Pardee 2025-06-21  1574  	return ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1575  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

