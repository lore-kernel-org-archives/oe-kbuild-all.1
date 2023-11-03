Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F50E2107
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVs2d9Dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699051683; x=1730587683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvJ/7D5KAIZwhSuDcaqabDrcxET7dqzEbNL/iDRYqUM=;
  b=LVs2d9DhWxxZ7yR9zxfVoXS1zobD/o80F2nHg92ntzQwTNWppWMf2Wg2
   CmH3IG15FBb3udkXtmF5WZvPKjP59zpmc1MOxYimxkzMwPIx7yl50OiUH
   n2lrBy+Y3fhqj5MjS+tyFfLJ+XEZjV6RLCS+QvgaU/MbKEBvG7fRIBW3G
   y/gn+PitrgfRwaROSSENdL4BgMzFEYffgLJcIvxrahelvJdC4MOE+72C9
   5AAbje6VcEzoaIrK+NHO92g4P52kJc2+R8DjllI2sfOc1fgk6GXDn1sxf
   YZUu32cIj5QhheExChCwnAXYw4sj9Pz2wSreZAh1x4jx9GVSBJBebHWbh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392924804"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="392924804"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="711651317"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="711651317"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Nov 2023 15:48:01 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2xL-00031M-1Q;
	Fri, 03 Nov 2023 22:47:59 +0000
Date: Sat, 4 Nov 2023 06:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] drivers/acpi/scan.c:1570:39: error:
 passing argument 1 of 'iort_iommu_configure_id' from incompatible pointer
 type
Message-ID: <202311040619.PYKIQZcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   a387bf414bfa3cc4e39cc07d1cfb257a13081c8e
commit: 82d63e7b3a55983a4ff9d4633c4f1f233f3e8853 [11/19] acpi: Do not use dev->iommu within acpi_iommu_configure()
config: loongarch-randconfig-002-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040619.PYKIQZcU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040619.PYKIQZcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040619.PYKIQZcU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/scan.c: In function 'acpi_iommu_configure_id':
>> drivers/acpi/scan.c:1570:39: error: passing argument 1 of 'iort_iommu_configure_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1570 |         err = iort_iommu_configure_id(fwspec, dev, id_in);
         |                                       ^~~~~~
         |                                       |
         |                                       struct iommu_fwspec *
   In file included from drivers/acpi/scan.c:13:
   include/linux/acpi_iort.h:61:58: note: expected 'struct device *' but argument is of type 'struct iommu_fwspec *'
      61 | static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
         |                                           ~~~~~~~~~~~~~~~^~~
   drivers/acpi/scan.c:1570:47: error: passing argument 2 of 'iort_iommu_configure_id' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1570 |         err = iort_iommu_configure_id(fwspec, dev, id_in);
         |                                               ^~~
         |                                               |
         |                                               struct device *
   include/linux/acpi_iort.h:61:74: note: expected 'const u32 *' {aka 'const unsigned int *'} but argument is of type 'struct device *'
      61 | static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
         |                                                               ~~~~~~~~~~~^~~~~
>> drivers/acpi/scan.c:1570:15: error: too many arguments to function 'iort_iommu_configure_id'
    1570 |         err = iort_iommu_configure_id(fwspec, dev, id_in);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi_iort.h:61:19: note: declared here
      61 | static inline int iort_iommu_configure_id(struct device *dev, const u32 *id_in)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/iort_iommu_configure_id +1570 drivers/acpi/scan.c

  1560	
  1561	static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
  1562	{
  1563		int err;
  1564		struct iommu_fwspec *fwspec;
  1565	
  1566		fwspec = iommu_fwspec_alloc();
  1567		if (IS_ERR(fwspec))
  1568			return PTR_ERR(fwspec);
  1569	
> 1570		err = iort_iommu_configure_id(fwspec, dev, id_in);
  1571		if (err == -ENODEV)
  1572			err = viot_iommu_configure(fwspec, dev);
  1573		if (err == -ENODEV || err == -EPROBE_DEFER)
  1574			goto err_free;
  1575		if (err)
  1576			goto err_log;
  1577	
  1578		err = iommu_probe_device_fwspec(dev, fwspec);
  1579		if (err) {
  1580			/*
  1581			 * Ownership for fwspec always passes into
  1582			 * iommu_probe_device_fwspec()
  1583			 */
  1584			fwspec = NULL;
  1585			goto err_log;
  1586		}
  1587	
  1588	err_log:
  1589		dev_dbg(dev, "Adding to IOMMU failed: %d\n", err);
  1590	err_free:
  1591		iommu_fwspec_dealloc(fwspec);
  1592		return err;
  1593	}
  1594	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
