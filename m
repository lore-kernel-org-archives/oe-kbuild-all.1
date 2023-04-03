Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B2747B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680544533; x=1712080533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwmT4Vpby/hwZQ54Ern/x5nmEZC7nVdiE7uK9evEQEE=;
  b=nV769Xt6FTlNOEBhad/1/XeCixo4VTm0cj6pz7TG3nBrNr+yEKSZn/wp
   e7njuA7g6g1Pwt8JOHARqtowomn+zM69SIw//jq+93FCSgFiFYaxIiIaO
   4MZnS63IkLnOenHy6Z5KtJYt2TE9MFITZjw0eGT9jBLNWojHfiMAQwDJI
   6i1ooVDXF9sFuHDIydiVyYJux+5ONWrk2EE6H660YXXDVnIHC9/s/BPaU
   uUf2C6xAVqb2Ay8g6js42IlGA86tAjv25Qzxe3CjOPL/X7i/Aakj4YBfP
   vxFw9+/kauH8THVyeyQYDEqXKMn+7SD7H/E8LvHhpGFFq+sS0AU+gAVM+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="325984909"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="325984909"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 10:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755345821"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="755345821"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2023 10:55:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjOOw-000OcP-0j;
	Mon, 03 Apr 2023 17:55:30 +0000
Date: Tue, 4 Apr 2023 01:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 15/42]
 drivers/iommu/iommufd/selftest.c:340:22: warning: implicit conversion from
 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from
 18446744073709551615 to 4294967295
Message-ID: <202304040101.9pkwOhIz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: cfab6d45ee4dd485bc223d0135643093a7778923 [15/42] iommufd/selftest: Add domain_alloc_user() support in iommu mock
config: powerpc-randconfig-c003-20230402 (https://download.01.org/0day-ci/archive/20230404/202304040101.9pkwOhIz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/cfab6d45ee4dd485bc223d0135643093a7778923
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-03292023-yi
        git checkout cfab6d45ee4dd485bc223d0135643093a7778923
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040101.9pkwOhIz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/selftest.c:340:22: warning: implicit conversion from 'u64' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           .hwpt_type_bitmap = IOMMU_HWPT_TYPE_BITMAP_SELFTTEST,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_test.h:120:42: note: expanded from macro 'IOMMU_HWPT_TYPE_BITMAP_SELFTTEST'
   #define IOMMU_HWPT_TYPE_BITMAP_SELFTTEST        U64_MAX
                                                   ^~~~~~~
   include/linux/limits.h:23:19: note: expanded from macro 'U64_MAX'
   #define U64_MAX         ((u64)~0ULL)
                            ^~~~~~~~~~
   1 warning generated.


vim +340 drivers/iommu/iommufd/selftest.c

   334	
   335	static const struct iommu_ops mock_ops = {
   336		.owner = THIS_MODULE,
   337		.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
   338		.hw_info_type = IOMMU_HW_INFO_TYPE_SELFTEST,
   339		.hw_info = mock_domain_hw_info,
 > 340		.hwpt_type_bitmap = IOMMU_HWPT_TYPE_BITMAP_SELFTTEST,
   341		.domain_alloc = mock_domain_alloc,
   342		.domain_alloc_user = mock_domain_alloc_user,
   343		.capable = mock_domain_capable,
   344		.set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
   345		.default_domain_ops =
   346			&(struct iommu_domain_ops){
   347				.free = mock_domain_free,
   348				.attach_dev = mock_domain_nop_attach,
   349				.map_pages = mock_domain_map_pages,
   350				.unmap_pages = mock_domain_unmap_pages,
   351				.iova_to_phys = mock_domain_iova_to_phys,
   352			},
   353	};
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
