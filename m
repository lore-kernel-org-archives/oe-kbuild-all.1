Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75FF443A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 17:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683827326; x=1715363326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mt/pRmkKiMG9SAeO0F3vAeD+sWBGwA0E+yhiP8HraDI=;
  b=HZ8xeYEJ+IfiY0j6G84HuadRJtkHm/O5Gy7Cr3I/dbW1y68orwbc0SEz
   6uUZAPzR9X+dnmD3NClH7eCa7vOucC5j0KiTn5aomZYqFouu7D6wX+urh
   bdCS9AeEwuR220bb4i4y3Fnl4Bh1JLbREe0dZbie6RsjX6QQhcs0o555h
   xMOWSPBNes+oOC69WFkgAMe7aJiizMUF/Al3Vb+WvWOtulU4XuIW6pr6j
   mZifVWeT7xTQkTlrQn1RK3xwLJnjtumwHSToXELwTyhObdRI1DQg893Jd
   PHPCWjXFOGcNcCYb0+9/P4MQkIH6BOZWJNWRPZMU/0zkGAs1Q62kFWtuv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330936806"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="330936806"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 10:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730466088"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="730466088"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 May 2023 10:48:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxAPA-0004AO-1S;
	Thu, 11 May 2023 17:48:40 +0000
Date: Fri, 12 May 2023 01:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05112023-yi-no-bitmap 11/51]
 drivers/iommu/iommufd/hw_pagetable.c:217:7: warning: variable 'pt_obj' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202305120108.qSNnEGEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05112023-yi-no-bitmap
head:   9d42da14a06f33e64fc593b2287ad9a9a4d12880
commit: ac6c1e334538ed5cd5ed039f6c4f3c81fe4c81cf [11/51] iommufd: IOMMU_HWPT_ALLOC allocation with user data
config: hexagon-randconfig-r001-20230510 (https://download.01.org/0day-ci/archive/20230512/202305120108.qSNnEGEJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/ac6c1e334538ed5cd5ed039f6c4f3c81fe4c81cf
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05112023-yi-no-bitmap
        git checkout ac6c1e334538ed5cd5ed039f6c4f3c81fe4c81cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120108.qSNnEGEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/iommu/iommufd/hw_pagetable.c:217:7: warning: variable 'pt_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (WARN_ON(klen < 0)) {
                       ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:121:28: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:298:21: note: uninitialized use occurs here
           iommufd_put_object(pt_obj);
                              ^~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:217:3: note: remove the 'if' if its condition is always false
                   if (WARN_ON(klen < 0)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:190:31: note: initialize the variable 'pt_obj' to silence this warning
           struct iommufd_object *pt_obj;
                                        ^
                                         = NULL
   7 warnings generated.


vim +217 drivers/iommu/iommufd/hw_pagetable.c

   184	
   185	int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
   186	{
   187		struct iommufd_hw_pagetable *hwpt, *parent = NULL;
   188		union iommu_domain_user_data *data = NULL;
   189		struct iommu_hwpt_alloc *cmd = ucmd->cmd;
   190		struct iommufd_object *pt_obj;
   191		const struct iommu_ops *ops;
   192		struct iommufd_device *idev;
   193		struct iommufd_ioas *ioas;
   194		int klen = 0;
   195		int rc = 0;
   196	
   197		if (cmd->flags || cmd->__reserved)
   198			return -EOPNOTSUPP;
   199	
   200		idev = iommufd_get_device(ucmd, cmd->dev_id);
   201		if (IS_ERR(idev))
   202			return PTR_ERR(idev);
   203	
   204		ops = dev_iommu_ops(idev->dev);
   205	
   206		/*
   207		 * All drivers support IOMMU_HWPT_TYPE_DEFAULT, so pass it through.
   208		 * For any other hwpt_type, check the ops->domain_alloc_user_data_len
   209		 * presence and its result.
   210		 */
   211		if (cmd->hwpt_type != IOMMU_HWPT_TYPE_DEFAULT) {
   212			if (!ops->domain_alloc_user_data_len) {
   213				rc = -EOPNOTSUPP;
   214				goto out_put_idev;
   215			}
   216			klen = ops->domain_alloc_user_data_len(cmd->hwpt_type);
 > 217			if (WARN_ON(klen < 0)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
