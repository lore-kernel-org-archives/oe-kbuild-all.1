Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BF11C13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 05:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677822293; x=1709358293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xIHSWhvM39rKlp7IVZJSpcl6N9inV6hXxBUjzV56B3k=;
  b=ebBfBA8KpzIBYHdU1dbEVKANYaNf5Kccp0FBfB5Q3LHh+WoFVMFyUhcg
   rXtptv6DKqL8JAGvgkfZyyQtBXo5PReN6W4MkXNhSfKKUxpoXcqBrzLG8
   mbDXsCga50I6m4rDtsUbfkOyXNCDSmyYwlOHmQDEpIy9mqIQ8dnyqMyAu
   T0PzAocminUl4h7PcYrGxlUJjT94s5ZW0fA7aHzASlMhaGBjNIXK+DZYi
   f7vGVmWU6WLr/OroHCIouBGKkPVGl/RN3Us9egg15lw/U1ygBIR9MZmFO
   GGtvf97V3kMaB9KK8OdbeKy802GMiCZklVj1ZHY19luYu9huXt8imIB12
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397552085"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="397552085"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 21:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739377369"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="739377369"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 21:44:51 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXyDq-0001Es-28;
	Fri, 03 Mar 2023 05:44:50 +0000
Date: Fri, 3 Mar 2023 13:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 42/53]
 drivers/iommu/iommufd/hw_pagetable.c:249:2: warning: variable 'klen' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202303031352.L47zV3MF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: 869b61fad83cd07b697804deece60479e6446001 [42/53] iommufd/selftest: Add support for user-managed domain allocation
config: hexagon-buildonly-randconfig-r001-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031352.L47zV3MF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/869b61fad83cd07b697804deece60479e6446001
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd tmp/for-baol-0303
        git checkout 869b61fad83cd07b697804deece60479e6446001
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031352.L47zV3MF-lkp@intel.com/

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
>> drivers/iommu/iommufd/hw_pagetable.c:249:2: warning: variable 'klen' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (cmd->data_type != IOMMU_PGTBL_DATA_SELFTTEST)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:255:6: note: uninitialized use occurs here
           if (klen) {
               ^~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iommufd/hw_pagetable.c:249:2: note: remove the 'if' if its condition is always true
           if (cmd->data_type != IOMMU_PGTBL_DATA_SELFTTEST)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iommu/iommufd/hw_pagetable.c:189:23: note: initialize the variable 'klen' to silence this warning
           u32 driver_type, klen;
                                ^
                                 = 0
>> drivers/iommu/iommufd/hw_pagetable.c:210:2: warning: variable 'support' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (driver_type != IOMMU_DEVICE_DATA_SELFTEST)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:216:7: note: uninitialized use occurs here
           if (!support) {
                ^~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iommufd/hw_pagetable.c:210:2: note: remove the 'if' if its condition is always true
           if (driver_type != IOMMU_DEVICE_DATA_SELFTEST)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/iommu/iommufd/hw_pagetable.c:191:14: note: initialize the variable 'support' to silence this warning
           bool support;
                       ^
                        = 0
   8 warnings generated.


vim +249 drivers/iommu/iommufd/hw_pagetable.c

   180	
   181	int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
   182	{
   183		struct iommufd_hw_pagetable *hwpt, *parent = NULL;
   184		struct iommu_hwpt_alloc *cmd = ucmd->cmd;
   185		struct iommufd_object *pt_obj = NULL;
   186		struct iommufd_device *idev;
   187		struct iommufd_ioas *ioas;
   188		const struct iommu_ops *ops;
   189		u32 driver_type, klen;
   190		void *data = NULL;
   191		bool support;
   192		int rc;
   193	
   194		if (cmd->__reserved || cmd->flags)
   195			return -EOPNOTSUPP;
   196	
   197		idev = iommufd_get_device(ucmd, cmd->dev_id);
   198		if (IS_ERR(idev))
   199			return PTR_ERR(idev);
   200	
   201		ops = dev_iommu_ops(idev->dev);
   202		if (!ops) {
   203			rc = -EOPNOTSUPP;
   204			goto out_put_idev;
   205		}
   206	
   207		driver_type = ops->driver_type;
   208	
   209		/* data_type should be a supported type by the hardware */
 > 210		if (driver_type != IOMMU_DEVICE_DATA_SELFTEST)
   211			support = iomufd_hwpt_type_check(driver_type, cmd->data_type);
   212	#ifdef CONFIG_IOMMUFD_TEST
   213		else
   214			support = true; /* selftest pretend to support all types */
   215	#endif
   216		if (!support) {
   217			rc = -EINVAL;
   218			goto out_put_idev;
   219		}
   220	
   221		pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
   222		if (IS_ERR(pt_obj)) {
   223			rc = -EINVAL;
   224			goto out_put_idev;
   225		}
   226	
   227		switch (pt_obj->type) {
   228		case IOMMUFD_OBJ_HW_PAGETABLE:
   229			parent = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
   230			/*
   231			 * Cannot allocate user-managed hwpt linking to auto_created
   232			 * hwpt. If the parent hwpt is already a user-managed hwpt,
   233			 * don't allocate another user-managed hwpt linking to it.
   234			 */
   235			if (parent->auto_domain || parent->parent) {
   236				rc = -EINVAL;
   237				goto out_put_pt;
   238			}
   239			ioas = parent->ioas;
   240			break;
   241		case IOMMUFD_OBJ_IOAS:
   242			ioas = container_of(pt_obj, struct iommufd_ioas, obj);
   243			break;
   244		default:
   245			rc = -EINVAL;
   246			goto out_put_pt;
   247		}
   248	
 > 249		if (cmd->data_type != IOMMU_PGTBL_DATA_SELFTTEST)
   250			klen = iommufd_hwpt_info_size[cmd->data_type];
   251	#ifdef CONFIG_IOMMUFD_TEST
   252		else
   253			klen = sizeof(struct iommu_hwpt_selftest);
   254	#endif
   255		if (klen) {
   256			if (!cmd->data_len) {
   257				rc = -EINVAL;
   258				goto out_put_pt;
   259			}
   260	
   261			data = kzalloc(klen, GFP_KERNEL);
   262			if (!data) {
   263				rc = -ENOMEM;
   264				goto out_put_pt;
   265			}
   266	
   267			rc = copy_struct_from_user(data, klen,
   268						   u64_to_user_ptr(cmd->data_uptr),
   269						   cmd->data_len);
   270			if (rc)
   271				goto out_free_data;
   272		}
   273	
   274		mutex_lock(&ioas->mutex);
   275		hwpt = iommufd_hw_pagetable_alloc(ucmd->ictx, ioas, idev,
   276						  parent, data, false);
   277		mutex_unlock(&ioas->mutex);
   278		if (IS_ERR(hwpt)) {
   279			rc = PTR_ERR(idev);
   280			goto out_free_data;
   281		}
   282	
   283		cmd->out_hwpt_id = hwpt->obj.id;
   284		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
   285		if (rc)
   286			goto out_hwpt;
   287		iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
   288		goto out_free_data;
   289	
   290	out_hwpt:
   291		iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
   292	out_free_data:
   293		kfree(data);
   294	out_put_pt:
   295		iommufd_put_object(pt_obj);
   296	out_put_idev:
   297		iommufd_put_object(&idev->obj);
   298		return rc;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
