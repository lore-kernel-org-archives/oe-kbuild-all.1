Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC436F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683743688; x=1715279688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G6jOym/qew2KH0OW+7t2/FmwQygCH1IMozUtJY8u6gs=;
  b=Qobmc9Hm71Bh7UY1cA92PqrtXSq/j8deTMCj1JBHZIgtypC6sYzv/DHT
   GReVHRnIvWZ/LDf+dzyXA+lsSiE3xQxM5YH2NCAHYoBCaGZD29R2STuni
   PUnp/Hg+J3LnMf8zqKCAFCPZAX5gYh4Fo6NfaQbICSF9YQM4zvrS2x0yl
   QtZn+5TSdC/qlpNyxPI+Kut9jL81OFc+fn6pCKxIeVHRTJtFM/vKQDr1h
   fPgpGeBHpAzigC9i2PN3zsFFVY37yQx1Si2QG91w1TaQ0I5edr4tazp3P
   JFewR+Ut+yKWeATgYuPcPkveZMySmjr+bCvVc5DL+IV2jR8vuN3dzRhUh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415867663"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="415867663"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 11:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649830521"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="649830521"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 11:34:42 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwoe9-0003VY-1i;
	Wed, 10 May 2023 18:34:41 +0000
Date: Thu, 11 May 2023 02:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-05102023-yi-no-bitmap 6/46]
 drivers/iommu/iommufd/hw_pagetable.c:216:7: warning: variable 'pt_obj' is
 used uninitialized whenever 'if' condition is true
Message-ID: <202305110243.79IZu3ps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-05102023-yi-no-bitmap
head:   1f8fcc5026dcf27335898350f990901be3308d88
commit: 3c3cd6965cf40569070f077aa3c1d33cc79eba75 [6/46] iommufd: IOMMU_HWPT_ALLOC allocation with user data
config: s390-randconfig-r023-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110243.79IZu3ps-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/3c3cd6965cf40569070f077aa3c1d33cc79eba75
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-05102023-yi-no-bitmap
        git checkout 3c3cd6965cf40569070f077aa3c1d33cc79eba75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110243.79IZu3ps-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/iommu/iommufd/hw_pagetable.c:5:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/iommu/iommufd/hw_pagetable.c:216:7: warning: variable 'pt_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (WARN_ON(klen < 0)) {
                       ^~~~~~~~~~~~~~~~~
   arch/s390/include/asm/bug.h:53:20: note: expanded from macro 'WARN_ON'
   #define WARN_ON(x) ({                                   \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:297:21: note: uninitialized use occurs here
           iommufd_put_object(pt_obj);
                              ^~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:216:3: note: remove the 'if' if its condition is always false
                   if (WARN_ON(klen < 0)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:188:31: note: initialize the variable 'pt_obj' to silence this warning
           struct iommufd_object *pt_obj;
                                        ^
                                         = NULL
   13 warnings generated.


vim +216 drivers/iommu/iommufd/hw_pagetable.c

   183	
   184	int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
   185	{
   186		struct iommufd_hw_pagetable *hwpt, *parent = NULL;
   187		struct iommu_hwpt_alloc *cmd = ucmd->cmd;
   188		struct iommufd_object *pt_obj;
   189		const struct iommu_ops *ops;
   190		struct iommufd_device *idev;
   191		struct iommufd_ioas *ioas;
   192		void *data = NULL;
   193		int klen = 0;
   194		int rc = 0;
   195	
   196		if (cmd->flags || cmd->__reserved)
   197			return -EOPNOTSUPP;
   198	
   199		idev = iommufd_get_device(ucmd, cmd->dev_id);
   200		if (IS_ERR(idev))
   201			return PTR_ERR(idev);
   202	
   203		ops = dev_iommu_ops(idev->dev);
   204	
   205		/*
   206		 * All drivers support IOMMU_HWPT_TYPE_DEFAULT, so pass it through.
   207		 * For any other hwpt_type, check the ops->domain_alloc_user_data_len
   208		 * presence and its result.
   209		 */
   210		if (cmd->hwpt_type != IOMMU_HWPT_TYPE_DEFAULT) {
   211			if (!ops->domain_alloc_user_data_len) {
   212				rc = -EOPNOTSUPP;
   213				goto out_put_idev;
   214			}
   215			klen = ops->domain_alloc_user_data_len(cmd->hwpt_type);
 > 216			if (WARN_ON(klen < 0)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
