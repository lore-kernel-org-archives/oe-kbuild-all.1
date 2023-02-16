Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5412D308
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676589291; x=1708125291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLl+ZGnMH+/YjhOubCoMjUsEXFeGFNHvL0sl2I1QNlE=;
  b=Yo8k2R7gwPNzwtjPlQBkVa76gFlYevXvxIzQVhLY1Oxynr9YsCp5k08S
   +6KfwuGrCFbvg8U16lC4CC1dQfG+Wq1M6bXkp3Dgel1utnnDVAi968URW
   yXLB6zz15mfj2Es/wWYfPcBcRDHreIUPCQB2SDYRFi9jdR9uVXmucBczC
   5wRk6nKgIZ41zfHQatIZHg1LcgBFwA+TA/2sdTPmznBzLIn91ysTKvtF2
   cQrAAiuScNNuC4M+vc79G/gO7pD8g9BdZ+2fvZs7EIRuUTLjZNWzOoa01
   YTJfzL81yB+oitmmx0mrV5wTPCtd6zFhJjEfsI+VPWlNmvCkgIncxRMnm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315573019"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="315573019"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 15:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620183862"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="620183862"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 15:14:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSnSj-000AwL-2A;
	Thu, 16 Feb 2023 23:14:49 +0000
Date: Fri, 17 Feb 2023 07:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_hwpt 24/24]
 drivers/iommu/iommufd/device.c:556:5: warning: no previous prototype for
 'iommufd_device_replace'
Message-ID: <202302170717.5Av0PbMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   466f0769b1793dd6185fe793dd5baf29acbdead9
commit: 466f0769b1793dd6185fe793dd5baf29acbdead9 [24/24] iommufd: Add iommufd_device_replace()
config: parisc-buildonly-randconfig-r001-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170717.5Av0PbMp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/466f0769b1793dd6185fe793dd5baf29acbdead9
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 466f0769b1793dd6185fe793dd5baf29acbdead9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170717.5Av0PbMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:556:5: warning: no previous prototype for 'iommufd_device_replace' [-Wmissing-prototypes]
     556 | int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_device_replace +556 drivers/iommu/iommufd/device.c

   554	
   555	// FIXME kdoc
 > 556	int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
   557	{
   558		return iommufd_device_change_pt(idev, pt_id,
   559						&iommufd_device_do_replace);
   560	}
   561	EXPORT_SYMBOL_NS_GPL(iommufd_device_replace, IOMMUFD);
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
