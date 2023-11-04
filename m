Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C915A0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 05:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ir6xyq1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699074633; x=1730610633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlKmogMJhMAcSPYFAXfWSP5J/1i4h7nDXGGSXp/oduo=;
  b=Ir6xyq1JFBkAtBioLD13MQ5TVtDZlmUijAkEapjqny2iUg5ly+zC3NI3
   X0fk9B4uELYhbw/nYiXeO4c7VFKrQxN95r1VmtBMWjKKjukHyGJixAzXa
   6LT98Ty7ZuzgXrBLW55UkYal2gyFDPOdGUDayvfSuw3lM+mVQgVTYQ+ht
   2fmBFEY/Qud6KheY+lekDpS+cOsdAfLn7xnQ13j3mMPK58aNDDLgB6CSE
   AM8HGaJFlt9GgmDK5opNnHsL4sFRs34qRSCxK+VlOjoRjr25zYmL8JMq6
   9arL/PVYbAwutBVBL50ERgjT0hJP2ytcIx4RMSD9AqkDvp9+75+KAaLAn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369268737"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369268737"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765461890"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="765461890"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 22:10:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz8vV-0003Sh-1H;
	Sat, 04 Nov 2023 05:10:29 +0000
Date: Sat, 4 Nov 2023 13:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 11/19] drivers/acpi/scan.c:1604:8: warning:
 type qualifiers ignored on function return type
Message-ID: <202311041350.IofwvlsC-lkp@intel.com>
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
config: i386-randconfig-011-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041350.IofwvlsC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041350.IofwvlsC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041350.IofwvlsC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/scan.c:1604:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    1604 | static const int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
         |        ^~~~~


vim +1604 drivers/acpi/scan.c

  1603	
> 1604	static const int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
  1605	{
  1606		return -ENODEV;
  1607	}
  1608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
