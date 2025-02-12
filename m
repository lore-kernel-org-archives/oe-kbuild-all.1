Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90E27180D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319448; cv=none; b=VFKHkKqB2Qwexwo+YCuqpPTbmH27nfxHpApxFfj3Lp9cTukWjoPZDJEREUVdBYtnnJjw1eil3POredeSNlO5Ix0Ezf9rBPb9Syg1QdW7gdBAZUOQiJiBwFmaTb8e5voBccdM1WQ60to9b53xZCSk70kC/SDkdYbPQ52m0V8Cwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319448; c=relaxed/simple;
	bh=w3xwCXMisiFZ1tRW/RXJy7qILfpPp4iwXsGrHAEJJy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZH7dy+FNHJx+3gVxNpLAnIA/PIx67ysrmxCdee4++23bfdiTesvYWw2a3+ZLSlzTz7uCbb/C5Gy83VYeITK8NX2VXnpPfsLBmF4SCOu0VPcp6kfHfeIMFf0sZkY6B1c/MiNhlLi6Ynq9+pa57U1/PxZIfYAnRwItGXqXR3oBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBRexAgS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBRexAgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739319446; x=1770855446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3xwCXMisiFZ1tRW/RXJy7qILfpPp4iwXsGrHAEJJy8=;
  b=kBRexAgScjmfRVbONHfbDcGMkw78Rp+nej5qnt+RMYWXE+2HolkUheXk
   SFtTkGgS+SoqHLh4eANiYRt5ugnfvvrgAmRq8a2EIadgC5+djD9C8SlrE
   3ZBV5Ig3k6bYqiDEfv7bLiRbHDD/KneFJy2NgSs6dOVGUqeep0tdk1D9L
   HK1hW07sDm19Mg7TqWlE0ZSDr2vEcFnnNI0J2qLaWYXYcjk6+VegyTQIZ
   2LOrG4NQbKxwijoKSjmp0QKXqLy5sGfAgmHVIcQ+U4lMNnxQxifDDcZqf
   tiJIdv+F7urgLUThp12WO6vxgYwSYE5T/l/TdzNYKB9th14jMTUTA2gx9
   Q==;
X-CSE-ConnectionGUID: RPLDUGfKQnqAOVgqbi6k9g==
X-CSE-MsgGUID: LEt7TleASrumf4UoFFhdBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57495846"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57495846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:17:24 -0800
X-CSE-ConnectionGUID: f73b3yD3T0WwoXhPcwqZlQ==
X-CSE-MsgGUID: BOKSn6adQbyuiNX9CewzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112488937"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 16:17:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0RN-0014s1-1D;
	Wed, 12 Feb 2025 00:17:21 +0000
Date: Wed, 12 Feb 2025 08:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 11/11]
 drivers/dma/ste_dma40.c:3682:29: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202502120848.1NFUggo1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39762b7a60e9a0f1e5cd736d30163ca936a1ede2
commit: 2a3f74ca167e3645258e36cfac809b8c41102513 [11/11] dmaengine: stedma40: add missing iounmap() on error in d40_probe()
config: arm-randconfig-r131-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120848.1NFUggo1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120848.1NFUggo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120848.1NFUggo1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/ste_dma40.c:1389:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1389:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/dma/ste_dma40.c:1389:28: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:1405:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ste_dma40.c:1405:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/dma/ste_dma40.c:1405:27: sparse:     got unsigned int *
   drivers/dma/ste_dma40.c:3566:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *lcpa_base @@     got void [noderef] __iomem * @@
   drivers/dma/ste_dma40.c:3566:25: sparse:     expected void *lcpa_base
   drivers/dma/ste_dma40.c:3566:25: sparse:     got void [noderef] __iomem *
   drivers/dma/ste_dma40.c:3582:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/dma/ste_dma40.c:3582:38: sparse:     expected void *base
   drivers/dma/ste_dma40.c:3582:38: sparse:     got void [noderef] __iomem *
   drivers/dma/ste_dma40.c:3666:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *base @@
   drivers/dma/ste_dma40.c:3666:40: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/dma/ste_dma40.c:3666:40: sparse:     got void *base
>> drivers/dma/ste_dma40.c:3682:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got void *lcpa_base @@
   drivers/dma/ste_dma40.c:3682:29: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/dma/ste_dma40.c:3682:29: sparse:     got void *lcpa_base

vim +3682 drivers/dma/ste_dma40.c

  3506	
  3507	static int __init d40_probe(struct platform_device *pdev)
  3508	{
  3509		struct stedma40_platform_data *plat_data = dev_get_platdata(&pdev->dev);
  3510		struct device_node *np = pdev->dev.of_node;
  3511		int ret = -ENOENT;
  3512		struct d40_base *base;
  3513		struct resource *res;
  3514		int num_reserved_chans;
  3515		u32 val;
  3516	
  3517		if (!plat_data) {
  3518			if (np) {
  3519				if (d40_of_probe(pdev, np)) {
  3520					ret = -ENOMEM;
  3521					goto report_failure;
  3522				}
  3523			} else {
  3524				d40_err(&pdev->dev, "No pdata or Device Tree provided\n");
  3525				goto report_failure;
  3526			}
  3527		}
  3528	
  3529		base = d40_hw_detect_init(pdev);
  3530		if (!base)
  3531			goto report_failure;
  3532	
  3533		num_reserved_chans = d40_phy_res_init(base);
  3534	
  3535		platform_set_drvdata(pdev, base);
  3536	
  3537		spin_lock_init(&base->interrupt_lock);
  3538		spin_lock_init(&base->execmd_lock);
  3539	
  3540		/* Get IO for logical channel parameter address */
  3541		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lcpa");
  3542		if (!res) {
  3543			ret = -ENOENT;
  3544			d40_err(&pdev->dev, "No \"lcpa\" memory resource\n");
  3545			goto destroy_cache;
  3546		}
  3547		base->lcpa_size = resource_size(res);
  3548		base->phy_lcpa = res->start;
  3549	
  3550		if (request_mem_region(res->start, resource_size(res),
  3551				       D40_NAME " I/O lcpa") == NULL) {
  3552			ret = -EBUSY;
  3553			d40_err(&pdev->dev, "Failed to request LCPA region %pR\n", res);
  3554			goto destroy_cache;
  3555		}
  3556	
  3557		/* We make use of ESRAM memory for this. */
  3558		val = readl(base->virtbase + D40_DREG_LCPA);
  3559		if (res->start != val && val != 0) {
  3560			dev_warn(&pdev->dev,
  3561				 "[%s] Mismatch LCPA dma 0x%x, def %pa\n",
  3562				 __func__, val, &res->start);
  3563		} else
  3564			writel(res->start, base->virtbase + D40_DREG_LCPA);
  3565	
  3566		base->lcpa_base = ioremap(res->start, resource_size(res));
  3567		if (!base->lcpa_base) {
  3568			ret = -ENOMEM;
  3569			d40_err(&pdev->dev, "Failed to ioremap LCPA region\n");
  3570			goto destroy_cache;
  3571		}
  3572		/* If lcla has to be located in ESRAM we don't need to allocate */
  3573		if (base->plat_data->use_esram_lcla) {
  3574			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
  3575								"lcla_esram");
  3576			if (!res) {
  3577				ret = -ENOENT;
  3578				d40_err(&pdev->dev,
  3579					"No \"lcla_esram\" memory resource\n");
  3580				goto destroy_cache;
  3581			}
  3582			base->lcla_pool.base = ioremap(res->start,
  3583							resource_size(res));
  3584			if (!base->lcla_pool.base) {
  3585				ret = -ENOMEM;
  3586				d40_err(&pdev->dev, "Failed to ioremap LCLA region\n");
  3587				goto destroy_cache;
  3588			}
  3589			writel(res->start, base->virtbase + D40_DREG_LCLA);
  3590	
  3591		} else {
  3592			ret = d40_lcla_allocate(base);
  3593			if (ret) {
  3594				d40_err(&pdev->dev, "Failed to allocate LCLA area\n");
  3595				goto destroy_cache;
  3596			}
  3597		}
  3598	
  3599		spin_lock_init(&base->lcla_pool.lock);
  3600	
  3601		base->irq = platform_get_irq(pdev, 0);
  3602	
  3603		ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
  3604		if (ret) {
  3605			d40_err(&pdev->dev, "No IRQ defined\n");
  3606			goto destroy_cache;
  3607		}
  3608	
  3609		if (base->plat_data->use_esram_lcla) {
  3610	
  3611			base->lcpa_regulator = regulator_get(base->dev, "lcla_esram");
  3612			if (IS_ERR(base->lcpa_regulator)) {
  3613				d40_err(&pdev->dev, "Failed to get lcpa_regulator\n");
  3614				ret = PTR_ERR(base->lcpa_regulator);
  3615				base->lcpa_regulator = NULL;
  3616				goto destroy_cache;
  3617			}
  3618	
  3619			ret = regulator_enable(base->lcpa_regulator);
  3620			if (ret) {
  3621				d40_err(&pdev->dev,
  3622					"Failed to enable lcpa_regulator\n");
  3623				regulator_put(base->lcpa_regulator);
  3624				base->lcpa_regulator = NULL;
  3625				goto destroy_cache;
  3626			}
  3627		}
  3628	
  3629		writel_relaxed(D40_DREG_GCC_ENABLE_ALL, base->virtbase + D40_DREG_GCC);
  3630	
  3631		pm_runtime_irq_safe(base->dev);
  3632		pm_runtime_set_autosuspend_delay(base->dev, DMA40_AUTOSUSPEND_DELAY);
  3633		pm_runtime_use_autosuspend(base->dev);
  3634		pm_runtime_mark_last_busy(base->dev);
  3635		pm_runtime_set_active(base->dev);
  3636		pm_runtime_enable(base->dev);
  3637	
  3638		ret = d40_dmaengine_init(base, num_reserved_chans);
  3639		if (ret)
  3640			goto destroy_cache;
  3641	
  3642		base->dev->dma_parms = &base->dma_parms;
  3643		ret = dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
  3644		if (ret) {
  3645			d40_err(&pdev->dev, "Failed to set dma max seg size\n");
  3646			goto destroy_cache;
  3647		}
  3648	
  3649		d40_hw_init(base);
  3650	
  3651		if (np) {
  3652			ret = of_dma_controller_register(np, d40_xlate, NULL);
  3653			if (ret)
  3654				dev_err(&pdev->dev,
  3655					"could not register of_dma_controller\n");
  3656		}
  3657	
  3658		dev_info(base->dev, "initialized\n");
  3659		return 0;
  3660	 destroy_cache:
  3661		kmem_cache_destroy(base->desc_slab);
  3662		if (base->virtbase)
  3663			iounmap(base->virtbase);
  3664	
  3665		if (base->lcla_pool.base && base->plat_data->use_esram_lcla) {
  3666			iounmap(base->lcla_pool.base);
  3667			base->lcla_pool.base = NULL;
  3668		}
  3669	
  3670		if (base->lcla_pool.dma_addr)
  3671			dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
  3672					 SZ_1K * base->num_phy_chans,
  3673					 DMA_TO_DEVICE);
  3674	
  3675		if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
  3676			free_pages((unsigned long)base->lcla_pool.base,
  3677				   base->lcla_pool.pages);
  3678	
  3679		kfree(base->lcla_pool.base_unaligned);
  3680	
  3681		if (base->lcpa_base)
> 3682			iounmap(base->lcpa_base);
  3683	
  3684		if (base->phy_lcpa)
  3685			release_mem_region(base->phy_lcpa,
  3686					   base->lcpa_size);
  3687		if (base->phy_start)
  3688			release_mem_region(base->phy_start,
  3689					   base->phy_size);
  3690		if (base->clk) {
  3691			clk_disable_unprepare(base->clk);
  3692			clk_put(base->clk);
  3693		}
  3694	
  3695		if (base->lcpa_regulator) {
  3696			regulator_disable(base->lcpa_regulator);
  3697			regulator_put(base->lcpa_regulator);
  3698		}
  3699	
  3700		kfree(base->lcla_pool.alloc_map);
  3701		kfree(base->lookup_log_chans);
  3702		kfree(base->lookup_phy_chans);
  3703		kfree(base->phy_res);
  3704		kfree(base);
  3705	 report_failure:
  3706		d40_err(&pdev->dev, "probe failed\n");
  3707		return ret;
  3708	}
  3709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
