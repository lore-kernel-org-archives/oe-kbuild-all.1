Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8424CED5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739998352; cv=none; b=tbToeZL7NDz49mygbDOZHMe9anQrnPJXRpvytbHyXNPihbKN7aB+cWakh1bQztjXasDbnK5PTeQT+Dsruhqd0kqk+9HySdqahvk+fW7MDZ5toLQhDOVeaLlHGaiW3o5gKUACsfuDStEzLu2f1ikGJaHf7DYkoNnGhb5AjsvWGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739998352; c=relaxed/simple;
	bh=2RKnooQxBbH1IUeovs4WzpsoeV00GKjv8Ixd5jrJYjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nr99GHgsscmKiQH9ZVRQ1X3Omc3NwdKavAGKqV1hWuXXwM4S8PN7t48SpqfOH9BLKifHPAIk6IL4NZ5klAjkmPb/Ke7f+6/0l2fdg9pnTdPf9MNX1c73LCEz28VmvGJvItrbUQ/V5YIKRWAdqCxha++x9m92cnMGlgKhHBJrPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3S4QQNI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3S4QQNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739998347; x=1771534347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2RKnooQxBbH1IUeovs4WzpsoeV00GKjv8Ixd5jrJYjQ=;
  b=A3S4QQNIuNLdGa/V5eVZY6+wVnYjFwxNhIq0W0rWlQ9TD+BpMIM0PApY
   wt9J+fcV78P+sEQsT7WMSDr9DZ1ohUmrIbTNuOTIMV2pKS2GBc+LanQz2
   jHNTobjDmBI2cw3sFdzl4rriGcA3BvSeuCaHJHS2SQxfHE39W+Mrnvho/
   D5TYAIWpKmvDfapqaChw/Dn7RrVOJeFkd5QDNITzzJt0aVBrn4V1rgIYi
   AbH72MopRxmjWPxbb8cEt/Phr5L9cFGaS4PirlQzOemxTvXHWS+8NpTt5
   D+4p/OTfZMYFGxfdjYV7ODM1CrU3AowvORZKvgKGj8nV38UW3/SwOaQRG
   w==;
X-CSE-ConnectionGUID: D3XIxsKETeKOSEjmVWzlWA==
X-CSE-MsgGUID: kuOR358cReyHfoa+7tyPfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40612244"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40612244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 12:50:41 -0800
X-CSE-ConnectionGUID: q6GpACLZTeqlomHAVws17Q==
X-CSE-MsgGUID: 2Zb9wnRFQ4efuqXdPvtY9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145710912"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2025 12:34:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkqlx-0003Rh-1L;
	Wed, 19 Feb 2025 20:34:21 +0000
Date: Thu, 20 Feb 2025 04:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/20250219-handle-refactor 8/8]
 drivers/iommu/ipmmu-vmsa.c:641:42: warning: initialization of 'struct
 iommu_domain *' from 'int' makes pointer from integer without a cast
Message-ID: <202502200402.pmeqr7Zt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/20250219-handle-refactor
head:   c1a19e4695fca8f123793f427f4c10638ae0ac41
commit: c1a19e4695fca8f123793f427f4c10638ae0ac41 [8/8] TMP for lockdep get_domain_for_dev
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250220/202502200402.pmeqr7Zt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200402.pmeqr7Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200402.pmeqr7Zt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ipmmu-vmsa.c: In function 'ipmmu_iommu_identity_attach':
   drivers/iommu/ipmmu-vmsa.c:641:42: error: implicit declaration of function 'iommu_get_domain_for_dev_locked'; did you mean 'iommu_get_domain_for_dev'? [-Werror=implicit-function-declaration]
     641 |         struct iommu_domain *io_domain = iommu_get_domain_for_dev_locked(dev);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          iommu_get_domain_for_dev
>> drivers/iommu/ipmmu-vmsa.c:641:42: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   drivers/iommu/arm/arm-smmu/qcom_iommu.c: In function 'qcom_iommu_identity_attach':
   drivers/iommu/arm/arm-smmu/qcom_iommu.c:394:39: error: implicit declaration of function 'iommu_get_domain_for_dev_locked'; did you mean 'iommu_get_domain_for_dev'? [-Werror=implicit-function-declaration]
     394 |         struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       iommu_get_domain_for_dev
>> drivers/iommu/arm/arm-smmu/qcom_iommu.c:394:39: warning: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +641 drivers/iommu/ipmmu-vmsa.c

   637	
   638	static int ipmmu_iommu_identity_attach(struct iommu_domain *identity_domain,
   639					       struct device *dev)
   640	{
 > 641		struct iommu_domain *io_domain = iommu_get_domain_for_dev_locked(dev);
   642		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
   643		struct ipmmu_vmsa_domain *domain;
   644		unsigned int i;
   645	
   646		if (io_domain == identity_domain || !io_domain)
   647			return 0;
   648	
   649		domain = to_vmsa_domain(io_domain);
   650		for (i = 0; i < fwspec->num_ids; ++i)
   651			ipmmu_utlb_disable(domain, fwspec->ids[i]);
   652	
   653		/*
   654		 * TODO: Optimize by disabling the context when no device is attached.
   655		 */
   656		return 0;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
