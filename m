Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584E1FA8F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107242; cv=none; b=K1VfRXzrkWE+kBmrG3PkdNbKXisMKzai93j1QL2R1YIChWakDqmW1yWYUXNvrCtDCCqYmxYJ+Png9KvvxDajU0zWrBSfO+JzNYYpuKxdfgvNo2KEVFpvOmown/+J7O5+3ygbv0j5WCIFzwQzxSCWrmB0vwaBNWtfHXDDSHO5W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107242; c=relaxed/simple;
	bh=unBQ7uEZ9AvJej/zbTuQ21whQ+7XtY2CP/2XHUzhGyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+ksa1ZMKDl583+Q2HOKqhsIWV3Y0T3IodYsUfuDp6/5qmwc3vo9d7x3HRD4SbgFRQurKGm4oG6MOspgDvkoValmrDL5uGVlOwahjnqHgXtWj8PNCVH1HrGN/j+TnMvL/pr/+ryKgwhrN/WwSJ5ZDOQCmx9rRmWN9Y4IiZIVfqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyY//21m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyY//21m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737107241; x=1768643241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=unBQ7uEZ9AvJej/zbTuQ21whQ+7XtY2CP/2XHUzhGyE=;
  b=iyY//21mL55GTg1L1wS7w/gQGv9yRdyAN1JG82r91lzlHA/rPFFcoNyR
   vbdw8JebztAS9jPuP+Ugn9f7GQHltfgQ+dvJlAVQS3K7syofYL0OmHqhm
   a/R3k1MJ3ORftew9WfFLBbiYb+jOQDnscqMhlu8YZnCNyOXAGdFke/ETZ
   oMmDCrUnQYbxbN0dlEGS378Uq9FsE2TS2FD42e+Z9WcAG0lI+szbrL9h3
   dBDCl6JltVYWlBMNfaCgaRb/LWBuJRXsbxQnFVM2shadsyrYPbtlvkZWB
   RWOQ6LLdQSBLgjaZoOoGrSxv/Zec8ODoTHt/gEl8RK2XJWGKZihoI1YDq
   w==;
X-CSE-ConnectionGUID: veOlqqlLTlWee8yUttxQbA==
X-CSE-MsgGUID: uAjcdVnsRju7unra/vakeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41208458"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="41208458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:47:21 -0800
X-CSE-ConnectionGUID: QxbFybwXSCOmN4E0LX3QQg==
X-CSE-MsgGUID: Vxo9hyL9QV+XPWxU0SzUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105949180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Jan 2025 01:47:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYiwe-000T2B-2i;
	Fri, 17 Jan 2025 09:47:16 +0000
Date: Fri, 17 Jan 2025 17:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [linux-next:master 8789/9563]
 drivers/pci/controller/dwc/pci-imx6.c:1203: undefined reference to
 `dw_pcie_suspend_noirq'
Message-ID: <202501171751.YzEFidaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 08e27c9cdbfacf5df2e721b892a5365dae0d31c3 [8789/9563] PCI: imx6: Use DWC common suspend resume method
config: x86_64-buildonly-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171751.YzEFidaE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171751.YzEFidaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171751.YzEFidaE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_suspend_noirq':
>> drivers/pci/controller/dwc/pci-imx6.c:1203: undefined reference to `dw_pcie_suspend_noirq'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx_pcie_resume_noirq':
>> drivers/pci/controller/dwc/pci-imx6.c:1233: undefined reference to `dw_pcie_resume_noirq'


vim +1203 drivers/pci/controller/dwc/pci-imx6.c

  1185	
  1186	static int imx_pcie_suspend_noirq(struct device *dev)
  1187	{
  1188		struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
  1189	
  1190		if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
  1191			return 0;
  1192	
  1193		imx_pcie_msi_save_restore(imx_pcie, true);
  1194		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
  1195			/*
  1196			 * The minimum for a workaround would be to set PERST# and to
  1197			 * set the PCIE_TEST_PD flag. However, we can also disable the
  1198			 * clock which saves some power.
  1199			 */
  1200			imx_pcie_assert_core_reset(imx_pcie);
  1201			imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
  1202		} else {
> 1203			return dw_pcie_suspend_noirq(imx_pcie->pci);
  1204		}
  1205	
  1206		return 0;
  1207	}
  1208	
  1209	static int imx_pcie_resume_noirq(struct device *dev)
  1210	{
  1211		int ret;
  1212		struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
  1213	
  1214		if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
  1215			return 0;
  1216	
  1217		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
  1218			ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
  1219			if (ret)
  1220				return ret;
  1221			ret = imx_pcie_deassert_core_reset(imx_pcie);
  1222			if (ret)
  1223				return ret;
  1224			/*
  1225			 * Using PCIE_TEST_PD seems to disable MSI and powers down the
  1226			 * root complex. This is why we have to setup the rc again and
  1227			 * why we have to restore the MSI register.
  1228			 */
  1229			ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
  1230			if (ret)
  1231				return ret;
  1232		} else {
> 1233			ret = dw_pcie_resume_noirq(imx_pcie->pci);
  1234			if (ret)
  1235				return ret;
  1236		}
  1237		imx_pcie_msi_save_restore(imx_pcie, false);
  1238	
  1239		return 0;
  1240	}
  1241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
