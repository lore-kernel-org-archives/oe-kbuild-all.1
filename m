Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31DD2E92D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205320; cv=none; b=jK6mSGVhmDa9FeEXB2ZcNm8Zxx1gkK3NLtltip6UiZYnj41NjdMkTTnbNFM5YqG4RB1XeZGYPW+DVpGIyud33wu14yyN9JuF7+U6VQUNjIbepagrnBdEeBxJIOaGsmOP7ttMbk6BKK5Ub24bSInB/ZMJ6tgj7GeOSKGpRAniV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205320; c=relaxed/simple;
	bh=PZHKQJ8URb2CFQKQ79A/Mr1idTMMD2vqZhg0Gc+6zRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S8Ch/VKRIQyBtPoOLWA/U9twSoKtAdGK/BQxEnJP+yCN4MEspVsl2VOf8cxwFoIKxRFz2qBYK/+5PnCYebahVSYga+n2FjfXJXsNxVfo/PxCvYJJRvwoDJ2wlNkpzkjG2lwBfO1jI2dH+pxWRcbaaNunq8tL0G87U6GBzb6l404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAOgUodB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAOgUodB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772205319; x=1803741319;
  h=date:from:to:cc:subject:message-id;
  bh=PZHKQJ8URb2CFQKQ79A/Mr1idTMMD2vqZhg0Gc+6zRQ=;
  b=mAOgUodBjb5FxYe0qgNABdI+N59KIA9wa1E1/6G1HCNWl0akvjeVyNuR
   AIrrbli2JfwJtDrAtZ6rH6JIL4SOu0AKgX4aVhoepO0b0cx8qYyJmlgUV
   ga4aafSVHaUsr84RErAsSJoa/kSB2pi8vhAe0e171uxShWO0PGNyycXgQ
   xG4LPOTQWW7oTBO8+PLuJLxdoKvZWdomD4EQqBs39jhMCfAKBi6KwgGBM
   tp20NYQKuFLqKEJl0Td5+zewAQ6Ub9AAHuD4EP6voWJywu2zTtx1MGwKl
   8dbGRr0htHAUR2zwyNy5ax9qdTcUtRhGiT2tCHRJXj6JLiexawDg4MCUo
   w==;
X-CSE-ConnectionGUID: wPOOebnhSNa/nWnnYoiO8Q==
X-CSE-MsgGUID: ytd50oDFSjO1ttvHH77ebg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73195682"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="73195682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:15:19 -0800
X-CSE-ConnectionGUID: LX10OvWTRNW191dEdnA8yA==
X-CSE-MsgGUID: 27zbPqRhTmOrDWo6tPlViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="215086257"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Feb 2026 07:15:17 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvzYg-00000000Aht-1xjr;
	Fri, 27 Feb 2026 15:15:14 +0000
Date: Fri, 27 Feb 2026 23:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:master-ppc-huge-pfnmap-rfc-v2-0day 1/2]
 drivers/vfio/pci/vfio_pci_core.c:1676 vfio_pci_vmf_insert_pfn() warn:
 inconsistent indenting
Message-ID: <202602272359.eq4QAHyr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/riteshharjani/linux master-ppc-huge-pfnmap-rfc-v2-0day
head:   71a4d1ca6df51ec0941829be16833684c870af81
commit: 8b24002497695bb11104a1f01c3e38a015584876 [1/2] drivers/vfio_pci_core: Change PXD_ORDER check from switch case to if/else block
config: i386-randconfig-141-20260227 (https://download.01.org/0day-ci/archive/20260227/202602272359.eq4QAHyr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272359.eq4QAHyr-lkp@intel.com/

smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1676 vfio_pci_vmf_insert_pfn() warn: inconsistent indenting

vim +1676 drivers/vfio/pci/vfio_pci_core.c

  1662	
  1663	vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
  1664					   struct vm_fault *vmf,
  1665					   unsigned long pfn,
  1666					   unsigned int order)
  1667	{
  1668		lockdep_assert_held_read(&vdev->memory_lock);
  1669	
  1670		if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
  1671			return VM_FAULT_SIGBUS;
  1672	
  1673		if (!order)
  1674			return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
  1675	
> 1676		 if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
  1677			return vmf_insert_pfn_pmd(vmf, pfn, false);
  1678	
  1679		 if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
  1680			return vmf_insert_pfn_pud(vmf, pfn, false);
  1681	
  1682		return VM_FAULT_FALLBACK;
  1683	}
  1684	EXPORT_SYMBOL_GPL(vfio_pci_vmf_insert_pfn);
  1685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
