Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C0351C22
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 04:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775018683; cv=none; b=ekEcJJL9UD8Fi4lEZGV/Om/MKtBttBPSPhUKI09Wn6CWJ8mLGHRKCgZxunGusAaipR9f+jgwKvYU8zNmdz0u9WK4Rg5I7HAPKnc1+Ya/wdbAGhpv+4LJBMjSjZJGZMREne/zAZmn2PJnQJE6hy+X2xzRveJjX0CLe0hY1TDjx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775018683; c=relaxed/simple;
	bh=ccLrIGGSK/NsS0UrSIWlLbqbvM6gvEoglQHLMcGhpGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nyc8pENOisu+Qv5PnxpdlkBsuVdd5Qn/+7AusMLs7LXFieApZZxtQ1BJBoLrL//Do+bgwRwXYdjRWGOY2Jt3LQaicuQDZXcwrQD2LcEGyhcLYD40jfh9AoFTMzzzs5Hh3i5y1SFlLzndsbGY1uWVX8GqJo1w7LlnzwnQNv/FsRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaL2i+yB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaL2i+yB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775018681; x=1806554681;
  h=date:from:to:cc:subject:message-id;
  bh=ccLrIGGSK/NsS0UrSIWlLbqbvM6gvEoglQHLMcGhpGw=;
  b=ZaL2i+yBeegHmpWSi6evl8E7szBkG+0KyhBm2EzYXGjDwAd+yG1oAvIQ
   S3elo/M3e4rT+cZXbNQkK9XBDK91KcCS2h1cRZIi48RGdj1Cm4Qve81oR
   E1EHe9/nNVTHx5vMqh6CiETHc2nXA2YRFXNc5jar4WJzU9eLn9rqMAYrO
   D0WI8fEGzTJdTfOGIgDM9EFZoda3+oakvN2atAZCZbv3cu/Ka4h0PQyRp
   /gU0lu1/zgUVA9kb8SWVfYSoG0wT8aH4WC3G44USPCtLr7iLeiasCdW9O
   QaVDfdiku7A4luJOuBozsfUcFDnPKCL4gPJKLsg/NdW4qsNuWlHdicN4d
   A==;
X-CSE-ConnectionGUID: 9i82SHjYSbeylgd5WcYQdQ==
X-CSE-MsgGUID: fw7695ImSCi5O68rfexG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75932803"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75932803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 21:44:39 -0700
X-CSE-ConnectionGUID: z30ALr2eRE6qXyyrUthBDg==
X-CSE-MsgGUID: //PeewgZTC6Suv/V0LwJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="221712350"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Mar 2026 21:44:37 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7nRS-000000004n4-3nZV;
	Wed, 01 Apr 2026 04:44:34 +0000
Date: Wed, 01 Apr 2026 12:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 10415/10705]
 drivers/power/sequencing/pwrseq-pcie-m2.c:290: undefined reference to
 `serdev_device_remove'
Message-ID: <202604011237.x7SJZZV8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 3f736aecbdc8e4faf2ed82c981812a6bfc76ea98 [10415/10705] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
config: arm64-randconfig-003-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011237.x7SJZZV8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011237.x7SJZZV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011237.x7SJZZV8-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/power/sequencing/pwrseq-pcie-m2.o: in function `pwrseq_pcie_m2_remove_serdev.isra.2':
>> drivers/power/sequencing/pwrseq-pcie-m2.c:290: undefined reference to `serdev_device_remove'
   aarch64-linux-ld: drivers/power/sequencing/pwrseq-pcie-m2.o: in function `pwrseq_m2_pcie_notify':
>> drivers/power/sequencing/pwrseq-pcie-m2.c:241: undefined reference to `of_find_serdev_controller_by_node'
>> aarch64-linux-ld: drivers/power/sequencing/pwrseq-pcie-m2.c:251: undefined reference to `serdev_device_alloc'
>> aarch64-linux-ld: drivers/power/sequencing/pwrseq-pcie-m2.c:261: undefined reference to `serdev_device_add'


vim +290 drivers/power/sequencing/pwrseq-pcie-m2.c

   229	
   230	static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
   231	{
   232		struct serdev_controller *serdev_ctrl;
   233		struct device *dev = ctx->dev;
   234		int ret;
   235	
   236		struct device_node *serdev_parent __free(device_node) =
   237			of_graph_get_remote_node(dev_of_node(ctx->dev), 3, 0);
   238		if (!serdev_parent)
   239			return 0;
   240	
 > 241		serdev_ctrl = of_find_serdev_controller_by_node(serdev_parent);
   242		if (!serdev_ctrl)
   243			return 0;
   244	
   245		/* Bail out if the device was already attached to this controller */
   246		if (serdev_ctrl->serdev) {
   247			serdev_controller_put(serdev_ctrl);
   248			return 0;
   249		}
   250	
 > 251		ctx->serdev = serdev_device_alloc(serdev_ctrl);
   252		if (!ctx->serdev) {
   253			ret = -ENOMEM;
   254			goto err_put_ctrl;
   255		}
   256	
   257		ret = pwrseq_m2_pcie_create_bt_node(ctx, serdev_parent);
   258		if (ret)
   259			goto err_free_serdev;
   260	
 > 261		ret = serdev_device_add(ctx->serdev);
   262		if (ret) {
   263			dev_err(dev, "Failed to add serdev for WCN7850: %d\n", ret);
   264			goto err_free_dt_node;
   265		}
   266	
   267		serdev_controller_put(serdev_ctrl);
   268	
   269		return 0;
   270	
   271	err_free_dt_node:
   272		device_remove_of_node(&ctx->serdev->dev);
   273		of_changeset_revert(ctx->ocs);
   274		of_changeset_destroy(ctx->ocs);
   275		kfree(ctx->ocs);
   276		ctx->ocs = NULL;
   277	err_free_serdev:
   278		serdev_device_put(ctx->serdev);
   279		ctx->serdev = NULL;
   280	err_put_ctrl:
   281		serdev_controller_put(serdev_ctrl);
   282	
   283		return ret;
   284	}
   285	
   286	static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx)
   287	{
   288		if (ctx->serdev) {
   289			device_remove_of_node(&ctx->serdev->dev);
 > 290			serdev_device_remove(ctx->serdev);
   291			ctx->serdev = NULL;
   292		}
   293	
   294		if (ctx->ocs) {
   295			of_changeset_revert(ctx->ocs);
   296			of_changeset_destroy(ctx->ocs);
   297			kfree(ctx->ocs);
   298			ctx->ocs = NULL;
   299		}
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
