Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362D19D093
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383901; cv=none; b=frWTBN5Q7svIxvsMk2ZW69/Ttt2/ymXwTz2tMOjCdPO+tgh8anLUvM7qFTrGRvAYGMxaT2xxVIRFeD6h3GxFRKjJHTrz/hBZcajIGxFr0y66D2m+MPoLpEwzXg80kFFkDKQfPzmA2EyOzNxisoQgqDjN89IZ/TKQFAX0ERXaJ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383901; c=relaxed/simple;
	bh=yHiTcapBqC7sO3j4DaTaa8tX2XjAerXY/K/EWJWeT8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJDRquH74tsK0QyjZL8rrAwRvwhLMRsjbvbzdP50oXmrofK1E9rrChU0ecXzl3NAFZUJU+IYcORO9rZUlauNSum+qStzUGDiFqay8/JSUH7jC5bKly5+ydSNUy84lTGXBj+8JdvcSDzl8kk1sm06JJLLYURg7n9ptEtTibyNU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRQAjkGH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRQAjkGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753383900; x=1784919900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHiTcapBqC7sO3j4DaTaa8tX2XjAerXY/K/EWJWeT8Q=;
  b=dRQAjkGHIiAzeIT8gFDg2+onWl8a2eFTKhjklqDCPK8/iSZKLeeRIc3M
   aRakbZJIeD5HRoWf/1VREzdzE0UChSdMWeLLD5CzwfPmWAfEX/5bsMc27
   Sn2/j1Sp26MPwIZ0TyNX+ZWv+NjzmC0OSpMOW0FEc9CZcUH0yKbzHE2FT
   DNT95gprUQ2s+Sw5gEAcUSJVKvFLOECuVdyn2RX3yqMFbOozJ2cokiUHr
   iND/DIL4dAu4hoU7vSRMc+eAEARpkVlzLJkKlsAM1ClNbZQ6n05QGAfVk
   vRAFfW2HlePOvF6jv+SSVmVriP8H8PlrkErMMZqDfVPKSaBs9xmE5df8E
   g==;
X-CSE-ConnectionGUID: ASdi5JH7Tx67+54Dii4iEw==
X-CSE-MsgGUID: GlFmUJQ9QoqCFFc1Op461g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55863827"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55863827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 12:04:59 -0700
X-CSE-ConnectionGUID: Mk0pIN0yRxaj/YV4PVjbKQ==
X-CSE-MsgGUID: ioU5CzBmRM+DGlIxckIwQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="161105741"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2025 12:04:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf1FP-000Kjz-2N;
	Thu, 24 Jul 2025 19:04:55 +0000
Date: Fri, 25 Jul 2025 03:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Kiran K <kiran.k@intel.com>
Subject: [linux-next:master 11895/12139]
 drivers/bluetooth/btintel_pcie.c:2665:25: sparse: sparse: symbol
 'btintel_pcie_pm_ops' was not declared. Should it be static?
Message-ID: <202507250315.yCOsaZ08-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ee814bd78e315e4551223ca7548dd3f6bdcf1ae
commit: 33bb9b1ce6f612e7e71b835db3e1fc2533f6da55 [11895/12139] Bluetooth: btintel_pcie: Add support for _suspend() / _resume()
config: arc-randconfig-r113-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250315.yCOsaZ08-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250725/202507250315.yCOsaZ08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250315.yCOsaZ08-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel_pcie.c:2665:25: sparse: sparse: symbol 'btintel_pcie_pm_ops' was not declared. Should it be static?

vim +/btintel_pcie_pm_ops +2665 drivers/bluetooth/btintel_pcie.c

  2664	
> 2665	const struct dev_pm_ops btintel_pcie_pm_ops = {
  2666		.suspend = btintel_pcie_suspend,
  2667		.resume = btintel_pcie_resume,
  2668		.freeze = btintel_pcie_freeze,
  2669		.thaw = btintel_pcie_resume,
  2670		.poweroff = btintel_pcie_hibernate,
  2671		.restore = btintel_pcie_resume,
  2672	};
  2673	#define BTINTELPCIE_PM_OPS	(&btintel_pcie_pm_ops)
  2674	#else
  2675	#define BTINTELPCIE_PM_OPS	NULL
  2676	#endif
  2677	static struct pci_driver btintel_pcie_driver = {
  2678		.name = KBUILD_MODNAME,
  2679		.id_table = btintel_pcie_table,
  2680		.probe = btintel_pcie_probe,
  2681		.remove = btintel_pcie_remove,
  2682		.driver.pm = BTINTELPCIE_PM_OPS,
  2683	#ifdef CONFIG_DEV_COREDUMP
  2684		.driver.coredump = btintel_pcie_coredump
  2685	#endif
  2686	};
  2687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
