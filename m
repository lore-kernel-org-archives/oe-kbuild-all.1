Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2F1BDDB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719465567; cv=none; b=WitYbMSimzUcbOSpXuoRaswauk5ajzDid5CYT8ong4gQ6avjNNm+9BKuEIfwyN+oF3jOqdf9xmRxY1YVStH33Jf6CyP/m4UQ1iWwy/4tTyuiPM7mJDNK9kW5NqdY446tdzhxhRPuwz15r6XuHsAzunZZQejCzx6UlP6cRg1RkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719465567; c=relaxed/simple;
	bh=MSA/6SFQPaUZULX9wI1pQ7/qJmk+tCHCyDfDgoPtWPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOqF6cLcCgVn/gwfLF+1Fqhq4L+Es+gs5pang0fVBhdeFjIblZWLwI1KS5FoVh6QDeJUKtXM20OrlASRCxgeCqT+EJVQSqGYy4wZl1jE8HpFiGkP2CoWsAswROogcPNvnyoVvJGk3LTIY2H/88o1XnAQowGqWGiRcMnjwSU3W54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0pSz/VT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0pSz/VT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719465566; x=1751001566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSA/6SFQPaUZULX9wI1pQ7/qJmk+tCHCyDfDgoPtWPs=;
  b=k0pSz/VTwz3HH+ay36cxyxtT8mHlrOaEGwBhKN/HenAsReouUrQ1DfVR
   ZuyAH0zenJgoSc0Y/iU+Hzs719uXwkR1vzOlpRd/ySkM/xlRUISGFQ8yZ
   YkqfF9WmWKR5xlwnK5OYtmQ2diH5CHHOO9cu/4XZgo0mQqoDEzmJIX0m+
   siCXF09iA6mIn7qpKL5jvj/S0rw/Zgd52Exnw0IXxSpmYJKe4rUzAAifV
   Ak8xIJqGRjK7nV4nxSbKwXtSx6MjnbETwJrvBZtNnC6qk3yxqnySyYooF
   MKg/lOffi5gxVtYwhYzqOyY/uqGOCAdkgVy804KyEQtarSvPOhEQsaDmz
   w==;
X-CSE-ConnectionGUID: i7JRgBDOSV6rVOYFDT+Jbw==
X-CSE-MsgGUID: H6/doAvYT1m8tmm/Kobgmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27968600"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="27968600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 22:19:25 -0700
X-CSE-ConnectionGUID: swNHnGg9S0uV3WD+jfzhjw==
X-CSE-MsgGUID: 49gd9qUUSN6oRaFoGOQUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="49216583"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Jun 2024 22:19:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMhXW-000Fv8-0f;
	Thu, 27 Jun 2024 05:19:22 +0000
Date: Thu, 27 Jun 2024 13:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240626 1/31]
 drivers/iommu/intel/iommu.c:4367:20: error: incompatible function pointer
 types initializing 'int (*)(struct iommu_domain *, struct device *,
 ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *,
 struct device *, unsigned int, struct iomm...
Message-ID: <202406271308.Irnc16c2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240626
head:   fd569f167302f1d7a03199dae77450a22884fb93
commit: ad4c2a1ad5ea4662bb7b1a8b2839ca4eca59a05f [1/31] iommu: Pass old domain to set_dev_pasid op
config: i386-randconfig-013-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271308.Irnc16c2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271308.Irnc16c2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271308.Irnc16c2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:4367:20: error: incompatible function pointer types initializing 'int (*)(struct iommu_domain *, struct device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *, struct device *, unsigned int, struct iommu_domain *)') with an expression of type 'int (struct iommu_domain *, struct device *, ioasid_t)' (aka 'int (struct iommu_domain *, struct device *, unsigned int)') [-Wincompatible-function-pointer-types]
    4367 |                 .set_dev_pasid  = identity_domain_set_dev_pasid,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +4367 drivers/iommu/intel/iommu.c

46d417fe907d5c Lu Baolu 2024-06-01  4362  
46d417fe907d5c Lu Baolu 2024-06-01  4363  static struct iommu_domain identity_domain = {
46d417fe907d5c Lu Baolu 2024-06-01  4364  	.type = IOMMU_DOMAIN_IDENTITY,
46d417fe907d5c Lu Baolu 2024-06-01  4365  	.ops = &(const struct iommu_domain_ops) {
46d417fe907d5c Lu Baolu 2024-06-01  4366  		.attach_dev	= identity_domain_attach_dev,
46d417fe907d5c Lu Baolu 2024-06-01 @4367  		.set_dev_pasid	= identity_domain_set_dev_pasid,
46d417fe907d5c Lu Baolu 2024-06-01  4368  	},
46d417fe907d5c Lu Baolu 2024-06-01  4369  };
46d417fe907d5c Lu Baolu 2024-06-01  4370  

:::::: The code at line 4367 was first introduced by commit
:::::: 46d417fe907d5c5ca3dae996fb2fc5b87870aba5 iommu/vt-d: Add support for static identity domain

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Lu Baolu <baolu.lu@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
