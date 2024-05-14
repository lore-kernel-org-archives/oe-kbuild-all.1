Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2E417F378
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 17:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715707909; cv=none; b=BbEvEXHOEEq1LIIhXVJ0mcFaYa952HlMvRp6Mnoen3XCSA5rkh5BePxxLI969zrG5RwGWFjLOpCfADD7j2/PfYWEiZgcR/RP4BRmfdHCWWNYH6jxQaDTmwIfiQVv/3eNngtIZctn+Le6dTp6GfZFWBxm2xjBKvZdVcviHUAxtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715707909; c=relaxed/simple;
	bh=YFK2FXaP4x14NPsOgoW1Lk2W5/k1xVq7iRihIzb2WtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snBqpVbT3Wj7JXewui58TCcGjkSqw9dzHSthhvMQtid5ZR6J7LYVh8fvRfsdMJyhhz+HK/zJ4ytvjNcueKI3AZB+SwDHIBG6sjtI8AiqHSZ0uXi5Fp/oEl9L2BbwUT7UZkVMHX0TeEFcAcn+dbbbXFdTQiDyLZUbjXWDOW4BGa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JW0UwL5f; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JW0UwL5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715707907; x=1747243907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFK2FXaP4x14NPsOgoW1Lk2W5/k1xVq7iRihIzb2WtE=;
  b=JW0UwL5f8cdWZi4wl9UJ8wAL3tnMrWiN5kzUpgjvhx3vBKzRPJ1WuvVu
   oxducYY0SIIft/8XjXFYhL62b9q7xvR59oouoLPzq+4i6dX48TB997H5+
   OyGDsVMas9lxIMPcjwyuDR9LB0oBgOtVqW95pnweuuwlsfHf0ELh95KME
   s5QiqlYp31x8KCvEJzNRxDsGD6jFP3pFGOeK3n8VxGS6yyQQn6BjdJEs0
   ZhfWsuxCRe7FoYH+SUCNDbmVCZI5R+dWxT7sN4zYUOd8WIwwTxcc7UtJ4
   k3N8z/4eSXoiyutUJA8nlCwOGosY0fC5qsTcOVCA7IQJKdqB5EgWK379b
   A==;
X-CSE-ConnectionGUID: xsnwvfLJTmy/R7PjoksBWQ==
X-CSE-MsgGUID: gUDirsVjQ0yOEQJKszgdfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11829351"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11829351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 10:31:46 -0700
X-CSE-ConnectionGUID: bra/FxyqR4aN+kgPxIGwAg==
X-CSE-MsgGUID: eorvnzkhSIqvjQvumDSa1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30733490"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2024 10:31:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6w06-000Bgt-0a;
	Tue, 14 May 2024 17:31:42 +0000
Date: Wed, 15 May 2024 01:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 95/106]
 drivers/media/platform/mediatek/aie/mtk_aie_53.c:1804:12: warning:
 'mtk_aie_resume' defined but not used
Message-ID: <202405150132.kBtWlGQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1f64c8ce89e6d5c5cf094d47ae84dbc6956094a6
commit: 5cd0ae9700e0a1483b2fd161c7d7f120b643d953 [95/106] CHROMIUM: media: platform: mediatek: aie driver migration
config: arm-randconfig-002-20240515 (https://download.01.org/0day-ci/archive/20240515/202405150132.kBtWlGQY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405150132.kBtWlGQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405150132.kBtWlGQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/aie/mtk_aie_53.c:1804:12: warning: 'mtk_aie_resume' defined but not used [-Wunused-function]
    1804 | static int mtk_aie_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/aie/mtk_aie_53.c:1770:12: warning: 'mtk_aie_suspend' defined but not used [-Wunused-function]
    1770 | static int mtk_aie_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/mtk_aie_resume +1804 drivers/media/platform/mediatek/aie/mtk_aie_53.c

d2e4e2025dedbc Copy Chou 2023-10-18  1769  
d2e4e2025dedbc Copy Chou 2023-10-18 @1770  static int mtk_aie_suspend(struct device *dev)
d2e4e2025dedbc Copy Chou 2023-10-18  1771  {
d2e4e2025dedbc Copy Chou 2023-10-18  1772  	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
d2e4e2025dedbc Copy Chou 2023-10-18  1773  	int ret = -EINVAL, num = 0;
d2e4e2025dedbc Copy Chou 2023-10-18  1774  
d2e4e2025dedbc Copy Chou 2023-10-18  1775  	if (pm_runtime_suspended(dev))
d2e4e2025dedbc Copy Chou 2023-10-18  1776  		return 0;
d2e4e2025dedbc Copy Chou 2023-10-18  1777  
d2e4e2025dedbc Copy Chou 2023-10-18  1778  	num = atomic_read(&fd->num_composing);
d2e4e2025dedbc Copy Chou 2023-10-18  1779  	dev_info(dev, "%s: suspend aie job start, num(%d)\n", __func__, num);
d2e4e2025dedbc Copy Chou 2023-10-18  1780  
d2e4e2025dedbc Copy Chou 2023-10-18  1781  	ret = wait_event_timeout(fd->flushing_waitq,
d2e4e2025dedbc Copy Chou 2023-10-18  1782  				 !(num = atomic_read(&fd->num_composing)),
d2e4e2025dedbc Copy Chou 2023-10-18  1783  				 msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MSEC)
d2e4e2025dedbc Copy Chou 2023-10-18  1784  		);
d2e4e2025dedbc Copy Chou 2023-10-18  1785  	if (!ret && num) {
d2e4e2025dedbc Copy Chou 2023-10-18  1786  		dev_dbg(dev,
d2e4e2025dedbc Copy Chou 2023-10-18  1787  			"%s: flushing aie job timeout num %d\n",
d2e4e2025dedbc Copy Chou 2023-10-18  1788  			__func__,
d2e4e2025dedbc Copy Chou 2023-10-18  1789  			num
d2e4e2025dedbc Copy Chou 2023-10-18  1790  		);
d2e4e2025dedbc Copy Chou 2023-10-18  1791  
d2e4e2025dedbc Copy Chou 2023-10-18  1792  		return -EBUSY;
d2e4e2025dedbc Copy Chou 2023-10-18  1793  	}
d2e4e2025dedbc Copy Chou 2023-10-18  1794  
d2e4e2025dedbc Copy Chou 2023-10-18  1795  	dev_info(dev, "%s: suspend aie job end num(%d)\n", __func__, num);
d2e4e2025dedbc Copy Chou 2023-10-18  1796  
d2e4e2025dedbc Copy Chou 2023-10-18  1797  	ret = pm_runtime_force_suspend(dev);
d2e4e2025dedbc Copy Chou 2023-10-18  1798  	if (ret)
d2e4e2025dedbc Copy Chou 2023-10-18  1799  		return ret;
d2e4e2025dedbc Copy Chou 2023-10-18  1800  
d2e4e2025dedbc Copy Chou 2023-10-18  1801  	return 0;
d2e4e2025dedbc Copy Chou 2023-10-18  1802  }
d2e4e2025dedbc Copy Chou 2023-10-18  1803  
d2e4e2025dedbc Copy Chou 2023-10-18 @1804  static int mtk_aie_resume(struct device *dev)
d2e4e2025dedbc Copy Chou 2023-10-18  1805  {
d2e4e2025dedbc Copy Chou 2023-10-18  1806  	int ret = -EINVAL;
d2e4e2025dedbc Copy Chou 2023-10-18  1807  
d2e4e2025dedbc Copy Chou 2023-10-18  1808  	dev_info(dev, "%s: resume aie job start)\n", __func__);
d2e4e2025dedbc Copy Chou 2023-10-18  1809  
d2e4e2025dedbc Copy Chou 2023-10-18  1810  	if (pm_runtime_suspended(dev)) {
d2e4e2025dedbc Copy Chou 2023-10-18  1811  		dev_info(dev,
d2e4e2025dedbc Copy Chou 2023-10-18  1812  			 "%s: pm_runtime_suspended is true, no action\n",
d2e4e2025dedbc Copy Chou 2023-10-18  1813  			 __func__
d2e4e2025dedbc Copy Chou 2023-10-18  1814  		);
d2e4e2025dedbc Copy Chou 2023-10-18  1815  		return 0;
d2e4e2025dedbc Copy Chou 2023-10-18  1816  	}
d2e4e2025dedbc Copy Chou 2023-10-18  1817  
d2e4e2025dedbc Copy Chou 2023-10-18  1818  	ret = pm_runtime_force_resume(dev);
d2e4e2025dedbc Copy Chou 2023-10-18  1819  	if (ret)
d2e4e2025dedbc Copy Chou 2023-10-18  1820  		return ret;
d2e4e2025dedbc Copy Chou 2023-10-18  1821  
d2e4e2025dedbc Copy Chou 2023-10-18  1822  	dev_info(dev, "%s: resume aie job end)\n", __func__);
d2e4e2025dedbc Copy Chou 2023-10-18  1823  	return 0;
d2e4e2025dedbc Copy Chou 2023-10-18  1824  }
d2e4e2025dedbc Copy Chou 2023-10-18  1825  

:::::: The code at line 1804 was first introduced by commit
:::::: d2e4e2025dedbc41046b5d9f4a8a209280f328f6 CHROMIUM: media: platform: mediatek: aie: Porting Kernel 6.1

:::::: TO: Copy Chou <copy.chou@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
