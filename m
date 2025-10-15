Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152564438B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760506202; cv=none; b=q1sqtX7rrfCfmij5hEYh812IF9n1LJAbRP2YjoFldWeEP9gAfEm4azNoaKnOzttwGKPm969DyFMoplK+ZxOLZg7PmgAD7v+VP0g+lMa4TnmyIKpyAnrgVN67jIKS8ovvMRdzjePmtjVhzfDMlFhF8AUuBjaL+H94A0giHSeJC/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760506202; c=relaxed/simple;
	bh=8Q6xWkDKxthhFrT0zUUmNjXbUXJ9WGg3naXP8txO0HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzUVY2aCvPOlJTRRTuv3jDV+BqVCp8kFDCAjNQGnGHSDdhmQRFAr1nEiVGZqqFKUCR/MDjagID1fi755g2DFBl6+MrE7Xlvn5S/rS3u+8nXkJ/SvZWXmcdX5xw9Klv5xsZQq+ZhDWS8Lhti5nTmgukNvLNlTQ6pg/1QRPHRkr5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtuFm+eP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtuFm+eP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760506200; x=1792042200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Q6xWkDKxthhFrT0zUUmNjXbUXJ9WGg3naXP8txO0HA=;
  b=RtuFm+eP8p/TYaONR+Oudwwhy7/2mO6dutG2yzwnz6WpexHA91Vh8CHf
   rxXWnDKy0nRYJBd2ucB2dWwFXwscCSjZcwRzV0KE7ppoqZ5Cjo0V1ZMis
   DHboXo6n0RVSsXRysq2DH4f8w/jVzrOVHPXwSSC3sY08pvLqxNbuOwHBp
   Grw8U9tnIntH+f/AazZpKQITFGFK/y+Gwt49i+sHY7mL0kWo67nby/UxA
   6jbVf0PMPyCIlRG8JD0yC9AozgftC1dMcN3Yr32jLBTtVAqumrFECKmhI
   DXf27Y1GAYLuDPWC7Nu4ssYWJDBsNwgjogQjWC7URg6g2xGJQWGgDac5+
   w==;
X-CSE-ConnectionGUID: rBMGDo1qRDOXbyPqxAanrA==
X-CSE-MsgGUID: QXZpA2VbQ56hWwRj4ApUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61705936"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="61705936"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 22:29:59 -0700
X-CSE-ConnectionGUID: PxhM4XTLSzO+ZuZjacXQ0Q==
X-CSE-MsgGUID: b/pK40YZRNqtuYQ2ZmxBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="186082626"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2025 22:29:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8u44-0003Tj-1H;
	Wed, 15 Oct 2025 05:29:26 +0000
Date: Wed, 15 Oct 2025 13:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 6/6] iommu: Pass in old domain to attach_dev callback
 functions
Message-ID: <202510151311.JBXKrGZW-lkp@intel.com>
References: <53e12066ebcaa1bb5a3f4ed1657e088f3d8e8464.1760312540.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e12066ebcaa1bb5a3f4ed1657e088f3d8e8464.1760312540.git.nicolinc@nvidia.com>

Hi Nicolin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc1 next-20251014]
[cannot apply to krzk/for-next rockchip/for-next sunxi/sunxi/for-next tegra/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommu-Generic-support-for-RMRs-during-device-release/20251013-080652
base:   linus/master
patch link:    https://lore.kernel.org/r/53e12066ebcaa1bb5a3f4ed1657e088f3d8e8464.1760312540.git.nicolinc%40nvidia.com
patch subject: [PATCH v1 6/6] iommu: Pass in old domain to attach_dev callback functions
config: s390-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151311.JBXKrGZW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151311.JBXKrGZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151311.JBXKrGZW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/s390-iommu.c: In function 's390_iommu_attach_device':
>> drivers/iommu/s390-iommu.c:714:9: error: too few arguments to function 'blocking_domain_attach_device'
     714 |         blocking_domain_attach_device(&blocking_domain, dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/s390-iommu.c:672:12: note: declared here
     672 | static int blocking_domain_attach_device(struct iommu_domain *domain,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/s390-iommu.c: In function 's390_attach_dev_identity':
   drivers/iommu/s390-iommu.c:1143:9: error: too few arguments to function 'blocking_domain_attach_device'
    1143 |         blocking_domain_attach_device(&blocking_domain, dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/s390-iommu.c:672:12: note: declared here
     672 | static int blocking_domain_attach_device(struct iommu_domain *domain,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/blocking_domain_attach_device +714 drivers/iommu/s390-iommu.c

bf8d2dd2ed0825 Niklas Schnelle 2022-10-25  696  
8128f23c436d0d Gerald Schaefer 2015-08-27  697  static int s390_iommu_attach_device(struct iommu_domain *domain,
0f29cf898327c3 Nicolin Chen    2025-10-12  698  				    struct device *dev,
0f29cf898327c3 Nicolin Chen    2025-10-12  699  				    struct iommu_domain *old)
8128f23c436d0d Gerald Schaefer 2015-08-27  700  {
8128f23c436d0d Gerald Schaefer 2015-08-27  701  	struct s390_domain *s390_domain = to_s390_domain(domain);
d08d6f5d75242c Pierre Morel    2020-02-21  702  	struct zpci_dev *zdev = to_zpci_dev(dev);
8128f23c436d0d Gerald Schaefer 2015-08-27  703  	unsigned long flags;
59bbf596791b89 Niklas Schnelle 2022-11-09  704  	u8 status;
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  705  	int cc;
8128f23c436d0d Gerald Schaefer 2015-08-27  706  
8128f23c436d0d Gerald Schaefer 2015-08-27  707  	if (!zdev)
8128f23c436d0d Gerald Schaefer 2015-08-27  708  		return -ENODEV;
8128f23c436d0d Gerald Schaefer 2015-08-27  709  
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  710  	if (WARN_ON(domain->geometry.aperture_start > zdev->end_dma ||
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  711  		domain->geometry.aperture_end < zdev->start_dma))
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  712  		return -EINVAL;
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  713  
ecda483339a515 Matthew Rosato  2024-09-10 @714  	blocking_domain_attach_device(&blocking_domain, dev);
fa7e9ecc5e1c1a Matthew Rosato  2022-05-19  715  
ecda483339a515 Matthew Rosato  2024-09-10  716  	/* If we fail now DMA remains blocked via blocking domain */
0ed5967a0a6355 Matthew Rosato  2025-02-12  717  	cc = s390_iommu_domain_reg_ioat(zdev, domain, &status);
9ffaf5229055fc Niklas Schnelle 2025-09-04  718  	if (reg_ioat_propagate_error(cc, status))
1a3a7d64bbce31 Niklas Schnelle 2022-10-25  719  		return -EIO;
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  720  	zdev->dma_table = s390_domain->dma_table;
ecda483339a515 Matthew Rosato  2024-09-10  721  	zdev_s390_domain_update(zdev, domain);
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  722  
cbf7827bc5dcfa Niklas Schnelle 2022-10-25  723  	spin_lock_irqsave(&s390_domain->list_lock, flags);
2ba8336dab5fb8 Niklas Schnelle 2022-11-09  724  	list_add_rcu(&zdev->iommu_list, &s390_domain->devices);
8128f23c436d0d Gerald Schaefer 2015-08-27  725  	spin_unlock_irqrestore(&s390_domain->list_lock, flags);
8128f23c436d0d Gerald Schaefer 2015-08-27  726  
8128f23c436d0d Gerald Schaefer 2015-08-27  727  	return 0;
8128f23c436d0d Gerald Schaefer 2015-08-27  728  }
8128f23c436d0d Gerald Schaefer 2015-08-27  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
