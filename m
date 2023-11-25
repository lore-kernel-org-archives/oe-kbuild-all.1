Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503958C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9wizzS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898227; x=1732434227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UpkTIgKCR54GLbxApHic7JKUm1Bwjlkk4ivDeTT1WQ=;
  b=Y9wizzS9KpcWb17M/BusZ/zfTvhcv+RS1ijeJfvcfyukkSsEpedXN4ZH
   87+cdiA7FkUBaExLp8smnDcH4cNO9m49lcgMoEoEfoRvmOJLyKKgnfR5h
   l2ezNLxKVadOIRBQ1d6rGQbkguLwx3iMYeoJGHKbx55GnNH45sXL0PYun
   CRe58l44epsj1qYcL+KXsTjMbmFm+H0GPfCuWy4trggRnAm2+6E5fEJjF
   ThIPGcCUjLcYUWo6oY+IZJ5v/doqx2UVJpw0ldiopy9KN4WgXMe4ZY/5P
   OuyrbGcu8HAjwFE7WaoAw/jDtIhPLMspONf/AxvpFZwVzdcFsNSK6wPR9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392266110"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="392266110"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911623525"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911623525"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 23:43:40 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKE-0003kB-1T;
	Sat, 25 Nov 2023 07:43:38 +0000
Date: Sat, 25 Nov 2023 15:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jerry Snitselaar <jsnitsel@redhat.com>
Subject: [jgunthorpe:iommu_fwspec 8/41] drivers/acpi/scan.c:1641:13: warning:
 assignment to 'int' from 'const struct iommu_ops *' makes integer from
 pointer without a cast
Message-ID: <202311251523.DL6QC7LK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   c87a72108f7683a608ec2eb459ee92b3eeca7406
commit: 58886c28edaa4d5052c7ccde93f739d553591d18 [8/41] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
config: i386-randconfig-063-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251523.DL6QC7LK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251523.DL6QC7LK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251523.DL6QC7LK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/scan.c: In function 'acpi_dma_configure_id':
>> drivers/acpi/scan.c:1641:13: warning: assignment to 'int' from 'const struct iommu_ops *' makes integer from pointer without a cast [-Wint-conversion]
    1641 |         ret = acpi_iommu_configure_id(dev, input_id);
         |             ^


vim +1641 drivers/acpi/scan.c

  1622	
  1623	/**
  1624	 * acpi_dma_configure_id - Set-up DMA configuration for the device.
  1625	 * @dev: The pointer to the device
  1626	 * @attr: device dma attributes
  1627	 * @input_id: input device id const value pointer
  1628	 */
  1629	int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
  1630				  const u32 *input_id)
  1631	{
  1632		int ret;
  1633	
  1634		if (attr == DEV_DMA_NOT_SUPPORTED) {
  1635			set_dma_ops(dev, &dma_dummy_ops);
  1636			return 0;
  1637		}
  1638	
  1639		acpi_arch_dma_setup(dev);
  1640	
> 1641		ret = acpi_iommu_configure_id(dev, input_id);
  1642		if (ret == -EPROBE_DEFER)
  1643			return -EPROBE_DEFER;
  1644	
  1645		/*
  1646		 * Historically this routine doesn't fail driver probing due to errors
  1647		 * in acpi_iommu_configure_id()
  1648		 */
  1649	
  1650		arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
  1651	
  1652		return 0;
  1653	}
  1654	EXPORT_SYMBOL_GPL(acpi_dma_configure_id);
  1655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
