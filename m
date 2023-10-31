Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A529CE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 23:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzhRQ0u0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698796165; x=1730332165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlE9LkR50sA1SivoPfk5A3IfpKX8AAQkN956Fj7kcPw=;
  b=mzhRQ0u0pa4+PTPhD1A2SWRitqtJo1AfKW5PuHhUFfqjIPV4hEJ8XV41
   1bAxvlrx7GzYJxJpEGiYIlJDIQti7GlJ0VuYo8iZ7ny4bPBd2pJuOihpj
   dfgj+K72DCOQdv5hoTd+mlB1LbVuh9tkbZzQ/uBMBOaz3mwCzf+iie8Lc
   dJcx5fcApmAn6Kak3ZjGQjAH+jhbS6p1bjvf3bPDKUk0guLDWWIysCjnZ
   TddV1cokg/8wemkZOB1vK06Y4fh4yohuTKkszD6p2NplFHcMEtfZY4J4a
   EWqRYxDVjol1tBRu/Nyz/RLostk2Bc6eJ421xFngAEc8fldoCPj8e1ftL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="452689164"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="452689164"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 16:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851407665"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="851407665"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2023 16:48:59 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxyTh-0000Su-2b;
	Tue, 31 Oct 2023 23:48:57 +0000
Date: Wed, 1 Nov 2023 07:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10202023-yi 41/54] htmldocs:
 ./include/uapi/linux/iommufd.h:685: warning: Enum value
 'IOMMU_IDEV_DATA_ARM_SMMUV3' not described in enum 'iommu_idev_data_type'
Message-ID: <202311010723.Y1j1KcUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10202023-yi
head:   7e413d2798f93759b4500bd7bfdc9a6186bf68ae
commit: 8ab490c97cc10e1d161d178428f27ed67adcb214 [41/54] iommu/arm-smmu-v3: Add arm_smmu_set/unset_dev_data_user
reproduce: (https://download.01.org/0day-ci/archive/20231101/202311010723.Y1j1KcUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311010723.Y1j1KcUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/iommufd.h:685: warning: Enum value 'IOMMU_IDEV_DATA_ARM_SMMUV3' not described in enum 'iommu_idev_data_type'

vim +685 ./include/uapi/linux/iommufd.h

   677	
   678	/**
   679	 * enum iommu_idev_data_type - Data Type for a Device behind an IOMMU
   680	 * @IOMMU_IDEV_DATA_NONE: no data
   681	 */
   682	enum iommu_idev_data_type {
   683		IOMMU_IDEV_DATA_NONE,
   684		IOMMU_IDEV_DATA_ARM_SMMUV3,
 > 685	};
   686	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
