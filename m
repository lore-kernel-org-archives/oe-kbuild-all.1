Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8655257844
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 05:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782277821; cv=none; b=hiF+WwAuSMnBEEPnF56NJnfdm0/0ve4xvMFKB+oC+ket0EK+LlkVCm/eU9LSbJdDwYNl6UcsBemO2phYDtASpR7HASuYgy60Jpha6ySN0jmZ/StKmBm+gVjSGxe8QrwUBcRwrPHAK2Lxr233JgwZxKoD5daj4dxzGdNh/C7NcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782277821; c=relaxed/simple;
	bh=FPrw226VtLc5KFUX0MWJrpGCdd2Ok1pbgOKgBaEWPS4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ULcMC8NNNL7KURcIoGpxFpcGqP8zkX3TMY3mV0WAXc7uc4NRv8dDX7SkAL8CMrgyADA8veNbpWErYba9aTc/D4vdyK7SNvk2TmXq6aVu9ElCbcraeh6u0dP/W4sJTqDQm/wHXsC9cbNR/zilV1dQY8RvCPcPoWejUz8q1NRVH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiUhx90B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiUhx90B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782277820; x=1813813820;
  h=date:from:to:cc:subject:message-id;
  bh=FPrw226VtLc5KFUX0MWJrpGCdd2Ok1pbgOKgBaEWPS4=;
  b=UiUhx90BwtY4iJpvXfvKIKm/iB9MwUhJB2NjJPqajasiMVkieklxx3mo
   Aem50ZX32QbBH5mkK1upxCH5Vn1oG2aDosA+i7pUXzARpAboT103WwUE2
   7IFexGgdn7oaVU8CxW4SuKcFzSBfOzabFVIfuIk6mu9GuM9kplyaxle9B
   DpGSXQ+Ynuf7CPDKwuX79Ur9nx/aCBcOX8rYxig48AApo9kNQVFbFH1rh
   ZRhdF8scF+q03aoKFjD0tFc85sAwRFjcBmk1leved+9IuNYWQQJxNwZx9
   QRHrwlRjDJ+spmNXeH7fpuQgtZgAlZ8BRGoHHiGu4MdHCE8yDJuive8hF
   g==;
X-CSE-ConnectionGUID: 40NyWyhfRomffDjKBtKMPA==
X-CSE-MsgGUID: oWldE4M9QG6nFq55Mb+QDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83079620"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="83079620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:10:19 -0700
X-CSE-ConnectionGUID: Kr5ArTbIQH2PjnI5FOFBmw==
X-CSE-MsgGUID: FyjXDtOXTbOg4QBkWB7VWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="253591707"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 22:10:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcFsN-00000000385-0PAA;
	Wed, 24 Jun 2026 05:10:15 +0000
Date: Wed, 24 Jun 2026 13:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 8727/15099]
 drivers/firmware/imx/se_ctrl.c:476:2-7: WARNING: invalid free of devm_
 allocated data
Message-ID: <202606241320.9gDd2s75-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e5dfb7c84012007c3c7061126491bbc92d71bf1
commit: 2768fdfd55852f0973ddb0866eef14321df2fa47 [8727/15099] firmware: drivers: imx: adds miscdev
config: powerpc64-randconfig-r052-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241320.9gDd2s75-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241320.9gDd2s75-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:476:2-7: WARNING: invalid free of devm_ allocated data
   drivers/firmware/imx/se_ctrl.c:487:2-7: WARNING: invalid free of devm_ allocated data

vim +476 drivers/firmware/imx/se_ctrl.c

   460	
   461	static int init_device_context(struct se_if_priv *priv, int ch_id,
   462				       struct se_if_device_ctx **new_dev_ctx)
   463	{
   464		struct se_if_device_ctx *dev_ctx;
   465		int ret = 0;
   466	
   467		dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
   468	
   469		if (!dev_ctx)
   470			return -ENOMEM;
   471	
   472		dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
   473					     get_se_if_name(priv->if_defs->se_if_type),
   474					     ch_id);
   475		if (!dev_ctx->devname) {
 > 476			kfree(dev_ctx);
   477			return -ENOMEM;
   478		}
   479	
   480		mutex_init(&dev_ctx->fops_lock);
   481		dev_ctx->priv = priv;
   482		*new_dev_ctx = dev_ctx;
   483	
   484		ret = init_se_shared_mem(dev_ctx);
   485		if (ret < 0) {
   486			kfree(dev_ctx->devname);
   487			kfree(dev_ctx);
   488			*new_dev_ctx = NULL;
   489		}
   490	
   491		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
   492		priv->active_devctx_count++;
   493	
   494		return ret;
   495	}
   496	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
