Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C33FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735346530; cv=none; b=DUF6gzdnMvJFQNbS6WYCmd725Vt+UNpG50+PTpiTY39AoaECDnePaUzD54SOIKgPlzT+6wYflOjq1A1Vc0Gi0HqSR1KKF6lxvpQX5QOngHeqiUXMzHlCKrEpaNcWfcSSOcB9G8WAUcSiAVRwv75KCrx0gb6dYbkN8ipPilcD5Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735346530; c=relaxed/simple;
	bh=NzpoO60cMtB+RRFxUoHtH5qzJBOmRJ2Kq+FBhoQvqgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lz8jH+uGFyzBCcgE990pHele8U+aHWia98Uhiyad/WqS2btH0oZVVGZjWJH6QY+hBjpHmsxhuYkFoqjqU8Tg/z/Dd0Icg53KNZPQTuiE5y1QUfTCtmDnlO43594hvoUwHU/Iyy6AYMAWYjvPBT2EQp+ky3e5qdayzm1LqgnIfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtVvXAaA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtVvXAaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735346528; x=1766882528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzpoO60cMtB+RRFxUoHtH5qzJBOmRJ2Kq+FBhoQvqgQ=;
  b=NtVvXAaAW/l+dkonsATXNnhA8D9Y/SGgrvX+lMHh/0isOecXLXgurY3W
   OUzcrbXEeeSk/UZI7BLWgpIg3iB6ck0Sim3k/6gRfSRU5z6d+HaxpinTm
   52of11BSEBHHercGS5XLlx8aEhtUKe4diZSyhC7IRkPEd/MEpVpUsBs3o
   zgCmtPbtTBJoGQlC/qJmJA882IhtShLaDHwZXqFQvR35KK57goWrXdm8j
   LGMpWaCpnFE0IIIW7AiJHGDYz75dW+eYf3SSuWmEdjng5uIdE2xBt/ddF
   JHlkZVaqeG7mXekqHVvwGePGCY8EIaK2SICXGMPF2/n+xXBovH84xbZFY
   w==;
X-CSE-ConnectionGUID: nP/5KBNjReGlH9VSgQ9qPg==
X-CSE-MsgGUID: 58MVO8ZgQdS6VL0dBsInrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35765550"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35765550"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 16:42:07 -0800
X-CSE-ConnectionGUID: WbB1kDlMSaCrK06mw9SPAw==
X-CSE-MsgGUID: Y7XvW7YlRVi9X19cEHlRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100757922"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 16:42:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRKu3-0003lE-2v;
	Sat, 28 Dec 2024 00:42:03 +0000
Date: Sat, 28 Dec 2024 08:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host-next 32/41]
 drivers/i2c/busses/i2c-imx-lpi2c.c:1430:12: warning: 'lpi2c_resume_noirq'
 defined but not used
Message-ID: <202412280835.LRAV3z0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   957341d16d50c758b555b8631cce4c1ee39048a6
commit: fa89723f7a789cfa6023d723b20d329c8cace055 [32/41] i2c: imx-lpi2c: add target mode support
config: i386-buildonly-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280835.LRAV3z0g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280835.LRAV3z0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.c:1430:12: warning: 'lpi2c_resume_noirq' defined but not used [-Wunused-function]
    1430 | static int lpi2c_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:1425:12: warning: 'lpi2c_suspend_noirq' defined but not used [-Wunused-function]
    1425 | static int lpi2c_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/lpi2c_resume_noirq +1430 drivers/i2c/busses/i2c-imx-lpi2c.c

  1424	
> 1425	static int lpi2c_suspend_noirq(struct device *dev)
  1426	{
  1427		return pm_runtime_force_suspend(dev);
  1428	}
  1429	
> 1430	static int lpi2c_resume_noirq(struct device *dev)
  1431	{
  1432		struct lpi2c_imx_struct *lpi2c_imx = dev_get_drvdata(dev);
  1433		int ret;
  1434	
  1435		ret = pm_runtime_force_resume(dev);
  1436		if (ret)
  1437			return ret;
  1438	
  1439		/*
  1440		 * If the I2C module powers down during system suspend,
  1441		 * the register values will be lost. Therefore, reinitialize
  1442		 * the target when the system resumes.
  1443		 */
  1444		if (lpi2c_imx->target)
  1445			lpi2c_imx_target_init(lpi2c_imx);
  1446	
  1447		return 0;
  1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
