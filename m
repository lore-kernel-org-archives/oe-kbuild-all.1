Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A245C4D108
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710363730; cv=none; b=Mz86p7klmb+1Z6U9UETCcMf5Eu+ceisLvAmk23fq8Q6ypgNqVKxd+JYWBR9/TUJUMSwbnL+/p3Ddkl2f50C/oCMgkl3DMbu4h7hCNIIZ1nsGwzPxCZuMlVsln+9rhMKOWU2rAssc09GTvrxvWaa3aGnvWZifAanxBln6moTnWl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710363730; c=relaxed/simple;
	bh=Mq1oX/4hAMliMB+gb3sh9cLNwNE0OVX8Ft22L8MSh48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ghaLVUxaxjvReNJd3WHOCNIoyQb13Y2pIqHXLMyagWMbQTKGXGCjqE4ft5hL9JMGY3nj0KUTHKHy5lqC8+huL3ovFV/4uFX8PmGcxZA1kYN4Fz9p8k6EW0eoy6ZEf/LvKRPBt4uz1Wey+0V3lZP38GKaBAhao/BsdjQ3DpF5vxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0RFORfz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0RFORfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710363728; x=1741899728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mq1oX/4hAMliMB+gb3sh9cLNwNE0OVX8Ft22L8MSh48=;
  b=D0RFORfzjuwTclcJ3gHvoQ51frp64o0FWvTm5bon0t6OXx4P6ohs3Oh9
   WZ1VElX5VdL/vPN9y+riKoFQFu0lPB/f59NRXg/slAEaok++Yg80QCmJI
   P7oHfDLhYwZIZ8GHc4ojxdHYMIC8SHjECNO6rqDIkFaBi8xjr7ndY+DnO
   XM1SoUB898i8uZVG+aKjeIhO2GBkDrHdFF+5+OgoYnCHwvGJiWHt0JN4v
   ae2hPZT/RGtdeC3Mgy3vX/w+v1gkNvbgV9Hswzdnq/h52ajAFZnVEVhuh
   WXjVoNM31vJSG/QhEJHXK4rWpSGDggh+1QxRoOsi0gfJLqn9FoXrM1dSw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5023360"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5023360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 14:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="11952616"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2024 14:02:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkVjd-000ClL-1l;
	Wed, 13 Mar 2024 21:02:01 +0000
Date: Thu, 14 Mar 2024 05:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/intel/dmar.c:2008:34: error: storage size of 'event'
 isn't known
Message-ID: <202403140444.GlUDT1Ui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 6eccdade909f64f27a5939414c2963122a3930e7 iommu/vt-d: iommu/vt-d: report non-recoverable faults to device
date:   9 months ago
config: x86_64-randconfig-006-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140444.GlUDT1Ui-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140444.GlUDT1Ui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140444.GlUDT1Ui-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/debug_locks.h:7,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from include/linux/mutex.h:16,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/iommu/intel/dmar.c:19:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/string.h:6,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
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
