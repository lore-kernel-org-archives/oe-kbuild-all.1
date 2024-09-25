Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE831A3A91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307539; cv=none; b=Mqg/EwVrGayDfVW48JvLab9kZghIqGp43sFWGeryBEa4uPGdqkqoauXO+AyysMTSUk7PPfhkJ0eyRpI1VCb1jMnWaRx6+e5t4sYOfdziEaDUjaQ60PinESPL6Ze+rjTm1jcxO+YZkx/Yn7ZYHTPfnXuijhHbMd44bukDnLrwUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307539; c=relaxed/simple;
	bh=vByc3+e31aZzWqGUbCGNaZ7d3PQiyGYxUjKPNQ2V+vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnmddLZvDmrlAq56ChuHXafKioFtSuLD5V36YQWslKh6CGUcGRUNrV8U0rKxyKI2sFSI+u8BzHhdj7q0lIdhxEGEIKtuJRrL+/94e3StwRq6Yc41lfx1Wgtv8fDq0iLyGz8dd2Aq6khzk8DiNVOuaowNAEtvxHcvUJZ9+agegsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCHuOesH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCHuOesH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727307537; x=1758843537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vByc3+e31aZzWqGUbCGNaZ7d3PQiyGYxUjKPNQ2V+vs=;
  b=RCHuOesHXGVJIjwklaxQzQ8XtxbWEdbiE4LKvMv+stMqYAwJ39DUwkqK
   Zeizmo6/VAzelCaWxaoOk8wSjmt0HxO02vMKOPFm+Sz8GP1F/f0nJBFWq
   hWSrY1bQZHwGjTc4wfeh5rcSpMJCBet5eEPqPr7NPoRSIJrCvS0SK/UYA
   qqkUTveiCg0dJSu72EfTu/sAY5jp/kHW0yZOLiWciDJfXrAetWuEQJqsM
   VZa3d2GB3bpuzhpgwDjV6T6u08xiXRmk0m30CCm8Ea1eBclZzIDMlte5+
   K6NU/0sQpYfM23Ro/loo+U3RUL4lrzMaTZXtull/nyotUhbZeBvrpQb6p
   w==;
X-CSE-ConnectionGUID: ffIjW1vfQouJzDePMIzvAw==
X-CSE-MsgGUID: QjSFG+c4SNCN+Mn4hMBxag==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26253171"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="26253171"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 16:38:49 -0700
X-CSE-ConnectionGUID: lT1EAwuRSGekTpLu9Rfu7A==
X-CSE-MsgGUID: BHFNXjYVSny+jj2lRtMxHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="71819127"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2024 16:38:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stbai-000K2P-0X;
	Wed, 25 Sep 2024 23:38:40 +0000
Date: Thu, 26 Sep 2024 07:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1471/2443]
 drivers/iommu/intel/dmar.c:2008:34: error: storage size of 'event' isn't
 known
Message-ID: <202409260727.sGb0UfHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: e92481ba78985e197ec3307f5f782ac4a7afb7a4 [1471/2443] iommu/vt-d: iommu/vt-d: report non-recoverable faults to device
config: x86_64-randconfig-005-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260727.sGb0UfHl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260727.sGb0UfHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260727.sGb0UfHl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/intel-iommu.h:19,
                    from drivers/iommu/intel/dmar.c:22:
   include/linux/ioasid.h:209:51: error: unknown type name 'ioasid_set_type'
     209 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   include/linux/iommu.h:1117:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1117 | {
         | ^
   drivers/iommu/intel/dmar.c: In function 'report_fault_to_device':
>> drivers/iommu/intel/dmar.c:2008:34: error: storage size of 'event' isn't known
    2008 |         struct iommu_fault_event event;
         |                                  ^~~~~
>> drivers/iommu/intel/dmar.c:2012:34: error: invalid application of 'sizeof' to incomplete type 'struct iommu_fault_event'
    2012 |         memset(&event, 0, sizeof(struct iommu_fault_event));
         |                                  ^~~~~~
>> drivers/iommu/intel/dmar.c:2008:34: warning: unused variable 'event' [-Wunused-variable]
    2008 |         struct iommu_fault_event event;
         |                                  ^~~~~


vim +2008 drivers/iommu/intel/dmar.c

  2003	
  2004	static void report_fault_to_device(struct work_struct *work)
  2005	{
  2006		struct dmar_fault_work *dfw = container_of(work, struct dmar_fault_work,
  2007							fault_work);
> 2008		struct iommu_fault_event event;
  2009		struct pci_dev *pdev;
  2010		u8 bus, devfn;
  2011	
> 2012		memset(&event, 0, sizeof(struct iommu_fault_event));
  2013		bus = PCI_BUS_NUM(dfw->sid);
  2014		devfn = PCI_DEVFN(PCI_SLOT(dfw->sid), PCI_FUNC(dfw->sid));
  2015		/*
  2016		 * we need to check if the fault reporting is requested for the
  2017		 * offending device.
  2018		 */
  2019		pdev = pci_get_domain_bus_and_slot(dfw->iommu->segment, bus, devfn);
  2020		if (!pdev) {
  2021			pr_warn("No PCI device found for source ID %x\n", dfw->sid);
  2022			goto free_work;
  2023		}
  2024		/*
  2025		 * unrecoverable fault is reported per IOMMU, notifier handler can
  2026		 * resolve PCI device based on source ID.
  2027		 */
  2028		event.fault.event.reason = to_iommu_fault_reason(dfw->reason);
  2029		event.fault.event.addr = dfw->addr;
  2030		event.fault.type = IOMMU_FAULT_DMA_UNRECOV;
  2031		event.fault.event.perm = dfw->type ? IOMMU_READ : IOMMU_WRITE;
  2032		iommu_report_device_fault(&pdev->dev, &event);
  2033		pci_dev_put(pdev);
  2034	
  2035	free_work:
  2036		kfree(dfw);
  2037	}
  2038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
