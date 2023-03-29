Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0655848C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680123135; x=1711659135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vdiW0a2013TzqpSPGv8Yepr4JLyUFGN6DuePn6R0hQ=;
  b=h77AiHH1K125X6s76WIi1TJNHlxzbcU3iTV8zF1lY5q/buOMVKumWmV1
   wL/+OzAmtfFcXoBnDA7hqPcxXcT91JzpzajjjVTXMMUielBht43ulDfIF
   3NUPVDH3Z8QfIrizBZVEVUzpnL3GAUzsz98LB9outfbjRRlUNBDnQmP/p
   3OwqL0leC5vpcQXP330teR1UYNTMiWpnRyvjgDHedJjydgmNfo/ERIQrx
   Ec0JquQjjZJXDoP38upsKlVPT3dCVJsDDT3PgQ09ecfsKDf+PXgb0Awb7
   Vic+CXhwpoqUaiX4iJJRkennsgLAvwKpW/dikfCpBEErJu2yYV0u1MBBG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368771676"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="368771676"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="661751139"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="661751139"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Mar 2023 13:52:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phcmC-000JwP-1H;
	Wed, 29 Mar 2023 20:52:12 +0000
Date: Thu, 30 Mar 2023 04:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 15/42]
 drivers/iommu/iommufd/hw_pagetable.c:241:6: warning: variable 'klen' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202303300411.G6eiAs8y-lkp@intel.com>
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
config: riscv-randconfig-r013-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300411.G6eiAs8y-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/cfab6d45ee4dd485bc223d0135643093a7778923
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-03292023-yi
        git checkout cfab6d45ee4dd485bc223d0135643093a7778923
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300411.G6eiAs8y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/hw_pagetable.c:119:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (WARN_ON((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:166:28: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:162:17: note: uninitialized use occurs here
           return ERR_PTR(rc);
                          ^~
   drivers/iommu/iommufd/hw_pagetable.c:119:2: note: remove the 'if' if its condition is always false
           if (WARN_ON((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:87:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
>> drivers/iommu/iommufd/hw_pagetable.c:241:6: warning: variable 'klen' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:247:6: note: uninitialized use occurs here
           if (klen) {
               ^~~~
   drivers/iommu/iommufd/hw_pagetable.c:241:2: note: remove the 'if' if its condition is always true
           if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:182:10: note: initialize the variable 'klen' to silence this warning
           u32 klen;
                   ^
                    = 0
   2 warnings generated.


vim +241 drivers/iommu/iommufd/hw_pagetable.c

   172	
   173	int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
   174	{
   175		struct iommufd_hw_pagetable *hwpt, *parent = NULL;
   176		struct iommu_hwpt_alloc *cmd = ucmd->cmd;
   177		struct iommufd_object *pt_obj;
   178		const struct iommu_ops *ops;
   179		struct iommufd_device *idev;
   180		struct iommufd_ioas *ioas;
   181		void *data = NULL;
   182		u32 klen;
   183		int rc;
   184	
   185		if (cmd->flags || cmd->__reserved)
   186			return -EOPNOTSUPP;
   187	
   188		idev = iommufd_get_device(ucmd, cmd->dev_id);
   189		if (IS_ERR(idev))
   190			return PTR_ERR(idev);
   191	
   192		ops = dev_iommu_ops(idev->dev);
   193	
   194		/*
   195		 * cmd->data_type should be a supported type marked in the
   196		 * ops->hwpt_type_bitmap. Otherwise, the allocation can continue
   197		 * only when the ops->hw_info_type==IOMMU_HW_INFO_TYPE_NONE and
   198		 * cmd->data_type==IOMMU_HWPT_TYPE_DEFAULT.
   199		 */
   200		if (!((1 << cmd->data_type) & ops->hwpt_type_bitmap) &&
   201		    ((ops->hw_info_type != IOMMU_HW_INFO_TYPE_NONE) ||
   202		     (cmd->data_type != IOMMU_HWPT_TYPE_DEFAULT))) {
   203			rc = -EINVAL;
   204			goto out_put_idev;
   205		}
   206	
   207		pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
   208		if (IS_ERR(pt_obj)) {
   209			rc = -EINVAL;
   210			goto out_put_idev;
   211		}
   212	
   213		switch (pt_obj->type) {
   214		case IOMMUFD_OBJ_IOAS:
   215			ioas = container_of(pt_obj, struct iommufd_ioas, obj);
   216			break;
   217		case IOMMUFD_OBJ_HW_PAGETABLE:
   218			/* pt_id points HWPT only when data_type is !IOMMU_HWPT_TYPE_DEFAULT */
   219			if (cmd->data_type == IOMMU_HWPT_TYPE_DEFAULT) {
   220				rc = -EINVAL;
   221				goto out_put_pt;
   222			}
   223	
   224			parent = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
   225			/*
   226			 * Cannot allocate user-managed hwpt linking to auto_created
   227			 * hwpt. If the parent hwpt is already a user-managed hwpt,
   228			 * don't allocate another user-managed hwpt linking to it.
   229			 */
   230			if (parent->auto_domain || parent->parent) {
   231				rc = -EINVAL;
   232				goto out_put_pt;
   233			}
   234			ioas = parent->ioas;
   235			break;
   236		default:
   237			rc = -EINVAL;
   238			goto out_put_pt;
   239		}
   240	
 > 241		if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
   242			klen = iommufd_hwpt_alloc_data_size[cmd->data_type];
   243	#ifdef CONFIG_IOMMUFD_TEST
   244		else
   245			klen = sizeof(struct iommu_hwpt_selftest);
   246	#endif
   247		if (klen) {
   248			if (!cmd->data_len) {
   249				rc = -EINVAL;
   250				goto out_put_pt;
   251			}
   252	
   253			data = kzalloc(klen, GFP_KERNEL);
   254			if (!data) {
   255				rc = -ENOMEM;
   256				goto out_put_pt;
   257			}
   258	
   259			rc = copy_struct_from_user(data, klen,
   260						   u64_to_user_ptr(cmd->data_uptr),
   261						   cmd->data_len);
   262			if (rc)
   263				goto out_free_data;
   264		}
   265	
   266		mutex_lock(&ioas->mutex);
   267		hwpt = iommufd_hw_pagetable_alloc(ucmd->ictx, ioas, idev,
   268						  parent, data, false);
   269		mutex_unlock(&ioas->mutex);
   270		if (IS_ERR(hwpt)) {
   271			rc = PTR_ERR(hwpt);
   272			goto out_free_data;
   273		}
   274	
   275		cmd->out_hwpt_id = hwpt->obj.id;
   276		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
   277		if (rc)
   278			goto out_hwpt;
   279		iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
   280		goto out_free_data;
   281	
   282	out_hwpt:
   283		iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
   284	out_free_data:
   285		kfree(data);
   286	out_put_pt:
   287		iommufd_put_object(pt_obj);
   288	out_put_idev:
   289		iommufd_put_object(&idev->obj);
   290		return rc;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
