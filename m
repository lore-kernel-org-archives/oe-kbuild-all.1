Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B762F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 06:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674281761; x=1705817761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9NCkVwQKXxnx5ww+hTTcDI5DI8sCSnUIz/hx2tn944=;
  b=SzGYi5gBvAygkckAq+xpcimsZ/LJxjcrhIegC8s7oDQYjqJyAnBpiycx
   ThcCC8QAWQHQtq10HGRN61mcptLUhBYmq0e9PPATwBN1IwjMOZT8D+icV
   gbVjYl91flADErYEAG1h5Ski1b/FJrfWUIZqJULp+ctClQ7+iwzlhk3y2
   l5qrnChLMgJVG9ehUEUJ9jYICIwVSCoK/i7Tif06tYuzU17fA//vNs+h3
   243EBZw3u8FANjLlC2ecmgT+A5Ue0reTzrubwUSEv2MNEHVdCzn3KJxJQ
   eIBSJShS7Z5O6cwvIdMQF1YSMdcNM/+L+Ud3Pa4dVxjAWSzNuqSqt7KtY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388122978"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388122978"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="660846115"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="660846115"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2023 22:15:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ7AU-0003eI-2f;
	Sat, 21 Jan 2023 06:15:58 +0000
Date: Sat, 21 Jan 2023 14:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 34/41] ERROR:
 modpost: module iommufd uses symbol iommu_iotlb_sync_user from namespace
 IOMMUFD_INTERNAL, but does not import it.
Message-ID: <202301211440.g9SHIbDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc2-nesting
head:   f9c22cd2206b239919f6290e33e92cd53748dd0c
commit: e87a6f89ec03470bf1790810cec30c6c5f64f48e [34/41] iommuf: Add user-managed hw_pagetable allocation
config: s390-randconfig-r003-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211440.g9SHIbDR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/e87a6f89ec03470bf1790810cec30c6c5f64f48e
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd-v6.2-rc2-nesting
        git checkout e87a6f89ec03470bf1790810cec30c6c5f64f48e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module iommufd uses symbol iommu_iotlb_sync_user from namespace IOMMUFD_INTERNAL, but does not import it.
ERROR: modpost: module iommufd uses symbol iommu_domain_alloc_user from namespace IOMMUFD_INTERNAL, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
