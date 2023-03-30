Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1501380
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 03:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680146076; x=1711682076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNo8/wtzio+p1zDvlF9Wq/9viOsu2k+PnMZOe33XDR4=;
  b=hzEOQZN5z6UOrzwhe/rK8QkBOQ0LwSJlB6zp+C+D4SwCq1/+kz4+PuOe
   4Ql9Sdguvz6pV+USdtn0D7ZSPUZq/Jh6PpsWwToHUrXu6LnuImzVnvlOs
   5wKYOaVWGd0kFsLadQSXvyqqqdZ4PtUF0XDhrwuZkHL6dWijUG6OQ3mbS
   AFF7CYaT82ntlEgoBElP63lEz5eZkmKlZ+krAoUfNCRdt5o8UliJiGXQk
   ja6+kcm0Z4I4G8MJmx46cRYVnpUBgFPNdFSfp8qjMlvQ9U4SXwxwGl9aG
   n9QSPTGjz4k7ZIgUlwyhf+IteDNe7s1bfSBg/ycEy2WG9GRiuc+KdXoFd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339780570"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339780570"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 20:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753826758"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="753826758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2023 20:14:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phik5-000KGs-1N;
	Thu, 30 Mar 2023 03:14:25 +0000
Date: Thu, 30 Mar 2023 11:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgg-iommufd:for-next 15/15]
 drivers/iommu/iommufd/hw_pagetable.c:135:33: error: passing argument 1 of
 'iommufd_get_ioas' from incompatible pointer type
Message-ID: <202303301137.C2yH1LK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git for-next
head:   085121c1d1bba69f2d06fdbf98fb8652e153480a
commit: 085121c1d1bba69f2d06fdbf98fb8652e153480a [15/15] Merge branch 'ko-iommufd/wip/for-nesting' into k.o-iommufd/for-next
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230330/202303301137.C2yH1LK5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git/commit/?id=085121c1d1bba69f2d06fdbf98fb8652e153480a
        git remote add jgg-iommufd git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git
        git fetch --no-tags jgg-iommufd for-next
        git checkout 085121c1d1bba69f2d06fdbf98fb8652e153480a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301137.C2yH1LK5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/hw_pagetable.c: In function 'iommufd_hwpt_alloc':
>> drivers/iommu/iommufd/hw_pagetable.c:135:33: error: passing argument 1 of 'iommufd_get_ioas' from incompatible pointer type [-Werror=incompatible-pointer-types]
     135 |         ioas = iommufd_get_ioas(ucmd, cmd->pt_id);
         |                                 ^~~~
         |                                 |
         |                                 struct iommufd_ucmd *
   In file included from drivers/iommu/iommufd/hw_pagetable.c:8:
   drivers/iommu/iommufd/iommufd_private.h:216:73: note: expected 'struct iommufd_ctx *' but argument is of type 'struct iommufd_ucmd *'
     216 | static inline struct iommufd_ioas *iommufd_get_ioas(struct iommufd_ctx *ictx,
         |                                                     ~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/iommufd_get_ioas +135 drivers/iommu/iommufd/hw_pagetable.c

8295188cc9e671 Jason Gunthorpe 2023-03-27  119  
8295188cc9e671 Jason Gunthorpe 2023-03-27  120  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
8295188cc9e671 Jason Gunthorpe 2023-03-27  121  {
8295188cc9e671 Jason Gunthorpe 2023-03-27  122  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
8295188cc9e671 Jason Gunthorpe 2023-03-27  123  	struct iommufd_hw_pagetable *hwpt;
8295188cc9e671 Jason Gunthorpe 2023-03-27  124  	struct iommufd_device *idev;
8295188cc9e671 Jason Gunthorpe 2023-03-27  125  	struct iommufd_ioas *ioas;
8295188cc9e671 Jason Gunthorpe 2023-03-27  126  	int rc;
8295188cc9e671 Jason Gunthorpe 2023-03-27  127  
8295188cc9e671 Jason Gunthorpe 2023-03-27  128  	if (cmd->flags || cmd->__reserved)
8295188cc9e671 Jason Gunthorpe 2023-03-27  129  		return -EOPNOTSUPP;
8295188cc9e671 Jason Gunthorpe 2023-03-27  130  
8295188cc9e671 Jason Gunthorpe 2023-03-27  131  	idev = iommufd_get_device(ucmd, cmd->dev_id);
8295188cc9e671 Jason Gunthorpe 2023-03-27  132  	if (IS_ERR(idev))
8295188cc9e671 Jason Gunthorpe 2023-03-27  133  		return PTR_ERR(idev);
8295188cc9e671 Jason Gunthorpe 2023-03-27  134  
8295188cc9e671 Jason Gunthorpe 2023-03-27 @135  	ioas = iommufd_get_ioas(ucmd, cmd->pt_id);

:::::: The code at line 135 was first introduced by commit
:::::: 8295188cc9e6713d4454e41b0cfa2ae5a656fccd iommufd: Add IOMMU_HWPT_ALLOC

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
