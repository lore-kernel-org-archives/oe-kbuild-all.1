Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CD29D04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9Tw5Kf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697723772; x=1729259772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cbiGGxxyjz3nOteOXmht3zicXfEbHaBeyB8UsICd+Ag=;
  b=a9Tw5Kf1PgJYiwnxTvmOKeXFgm98N2bMseowdw0Qla/KW3BTRhAjJTK+
   ckjxuDnXpZ9pAoODHCOJwXgSDLCohv6ukkD/lFEeCqsdKAiAqkvEOhw/q
   YHuh8MCpUR2Msy686BL0NBkMRooLweddhZTfjoxTqh3JiJpJ/KTT8KKMN
   9WYB35M/U6gq14NHj5kdMieZWIgTwrn++dTvj7Wvtzgya4WU4yNHTCxuK
   +dC2u2QPi+t+3iVpkVimfTBE7Zv0Id8yDCNNwExrYpn2klFMQWIAHp/IL
   yAp++dsoTmss9si43ckDSi8qG5jaKTCVSbUD8upxUfK7M0i5aSCCEGEn0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7817341"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="7817341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792010035"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="792010035"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Oct 2023 06:49:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtTOf-00029q-2v;
	Thu, 19 Oct 2023 13:49:09 +0000
Date: Thu, 19 Oct 2023 21:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10192023-yi 4/54]
 drivers/iommu/iommufd/device.c:328:5: warning: no previous prototype for
 'iommufd_hwpt_paging_attach'
Message-ID: <202310192121.3iaDtjge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10192023-yi
head:   e3455e3d7e9bdc5a6f2dcc73adad2b8a12b4d2da
commit: a782fc88b2803a9421890d5a1fa83bbca344c2ae [4/54] iommufd/device: Wrap IOMMUFD_OBJ_HWPT_PAGING-only configurations
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310192121.3iaDtjge-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192121.3iaDtjge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192121.3iaDtjge-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:328:5: warning: no previous prototype for 'iommufd_hwpt_paging_attach' [-Wmissing-prototypes]
     328 | int iommufd_hwpt_paging_attach(struct iommufd_hw_pagetable *hwpt,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_hwpt_paging_attach +328 drivers/iommu/iommufd/device.c

   327	
 > 328	int iommufd_hwpt_paging_attach(struct iommufd_hw_pagetable *hwpt,
   329				       struct iommufd_device *idev)
   330	{
   331		int rc;
   332	
   333		lockdep_assert_held(&idev->igroup->lock);
   334	
   335		/* Try to upgrade the domain we have */
   336		if (idev->enforce_cache_coherency) {
   337			rc = iommufd_hw_pagetable_enforce_cc(hwpt);
   338			if (rc)
   339				return rc;
   340		}
   341	
   342		rc = iopt_table_enforce_dev_resv_regions(&hwpt->ioas->iopt, idev->dev,
   343							 &idev->igroup->sw_msi_start);
   344		if (rc)
   345			return rc;
   346	
   347		if (list_empty(&idev->igroup->device_list)) {
   348			rc = iommufd_group_setup_msi(idev->igroup, hwpt);
   349			if (rc) {
   350				iopt_remove_reserved_iova(&hwpt->ioas->iopt, idev->dev);
   351				return rc;
   352			}
   353		}
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
