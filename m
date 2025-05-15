Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DCA224B04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306473; cv=none; b=dbuujWLaeKEk/rlLaKkElIkW/d8fd4FXq8Tg68rO7Gz4uUEuy/T0pQ4s8B0jIf4+hmbhwWwMBcfWQo07/5MxkyzWo9tj8fGyKm+um6URuFTxPhZBLw6Efxk9Ktr8THkFQkfxoxNJziU3E1sC4wgnZ1e3NFJ6Bdovl+zzv3iBw90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306473; c=relaxed/simple;
	bh=c+Id3KADwOA6WDPiGwTOY+xlSBrpMabAsOQijLoveck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LoESUfk0aYHHxOvdjxJiWJmPLRr7Or1L1omO1YW1sdWhjgdORcjy3aaoOt+HYiGxYkqUB9+P1BVaX1FXQFxewdHOECucgAP0ERs54XIcjw6o4qaRA7d60e0Fxv5exO6BXO1vJnijLUc8spillf9yCi8/El3TaJPq0WwLggS5QuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXyI/csd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXyI/csd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747306471; x=1778842471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+Id3KADwOA6WDPiGwTOY+xlSBrpMabAsOQijLoveck=;
  b=dXyI/csdUx4pdWTmKT6IkyaoaSQRzzAB/1kQgcolvEb916u6df0301in
   d+StbS4wlvSLj+uZ0yO6dGN35JqrMy3gEyPHsHpXp/+sbqqfBvHJmadMf
   hNk26o7uMZU4RRICy8gZQmZM1q3fI4SHb/IBqWSlmIPRD9hgmqzqkzhK6
   JS3SnFcoaSnSStb2G2kY9BMz55ExQGpi+A6YSy+OygrLBMFvyOEE/XHLe
   zbzhYh7iYQAKCtH+wFmOBsIYr8IvSRUc+xlJScVDaMxTqvlbN47uvqYF+
   0U4Y+FDA2hRxwnH7Jpjl5g39rBKiNe6Q64ForXFyZ67m5hvMISVgIn28k
   w==;
X-CSE-ConnectionGUID: i+x+26LnSFWjCDIlFaWrWA==
X-CSE-MsgGUID: TRfrw4qbSraGUgsaqrclzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60572138"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60572138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 03:54:30 -0700
X-CSE-ConnectionGUID: bUItiRNuQOq3r9UAwRIOqw==
X-CSE-MsgGUID: eKYOIhbqSwSGYYsrma2dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143219023"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 03:54:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWEN-000II7-0I;
	Thu, 15 May 2025 10:54:27 +0000
Date: Thu, 15 May 2025 18:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_raid6_rvv_v5 48/68]
 drivers/acpi/scan.c:1635:undefined reference to `rimt_iommu_configure_id'
Message-ID: <202505151822.wuPNHD4U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_raid6_rvv_v5
head:   9b85cdf2ad159e2a8ee78d62c6b423942917119e
commit: 4287f0761f29c69d9cfe33c2bab885f75153288c [48/68] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
config: loongarch-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151822.wuPNHD4U-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151822.wuPNHD4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151822.wuPNHD4U-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/scan.o: in function `acpi_iommu_configure_id':
>> drivers/acpi/scan.c:1635:(.text+0x708): undefined reference to `rimt_iommu_configure_id'


vim +1635 drivers/acpi/scan.c

  1620	
  1621	static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
  1622	{
  1623		int err;
  1624	
  1625		/* Serialise to make dev->iommu stable under our potential fwspec */
  1626		mutex_lock(&iommu_probe_device_lock);
  1627		/* If we already translated the fwspec there is nothing left to do */
  1628		if (dev_iommu_fwspec_get(dev)) {
  1629			mutex_unlock(&iommu_probe_device_lock);
  1630			return 0;
  1631		}
  1632	
  1633		err = iort_iommu_configure_id(dev, id_in);
  1634		if (err && err != -EPROBE_DEFER) {
> 1635			err = rimt_iommu_configure_id(dev, id_in);
  1636			if (err && err != -EPROBE_DEFER)
  1637				err = viot_iommu_configure(dev);
  1638		}
  1639	
  1640		mutex_unlock(&iommu_probe_device_lock);
  1641	
  1642		return err;
  1643	}
  1644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
