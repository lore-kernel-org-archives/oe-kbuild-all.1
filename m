Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E583D8B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 17:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693848853; x=1725384853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8081p4nrxgxN8GSaXZ/bWMjp62juGGB3y6QvaUromxk=;
  b=j8nKf4hX0yoEwmRFp+YKpirvoWkvgavJxsZLwDmOzCnwmKfg9lNFdeM+
   gvxYYBTj45cE/tzHHQmShlDzwn5D+tfsgKPGv9hd4k8+caS4aYOn/gZ5x
   EoyPiXxnKOMRYpHQwa0qqkqx/vPCHyAu707AKk7mcaJoLu/uWSD8JJm6N
   XU4eNe3bv0HARzvGtFV5skqnyX2CvuLHJVO0BmvI8WFe1Wb33RjIp3dsC
   VLsWffjm5F0L8WtHPfgkb0aMT6F+mdhLeNsXYIKdTwxNy+XG7y99u15KP
   NITlsF+YPQJa1fs70MD5y5MkXNGMwTe3V6tfb7mRbszgcgeuC8FKCh192
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="361673368"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="361673368"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 10:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="830966404"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="830966404"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2023 10:34:11 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdDSj-0000hH-0N;
	Mon, 04 Sep 2023 17:34:09 +0000
Date: Tue, 5 Sep 2023 01:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09042023-yi-not-tested 13/26]
 drivers/iommu/iommufd/hw_pagetable.c:325:7: warning: variable 'parent' is
 uninitialized when used here
Message-ID: <202309050103.oXXfDycg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09042023-yi-not-tested
head:   19df4ebfe078e091791110a53bfcc1abc6f72fb3
commit: 56bfc2cb8d81259247dcedd479140554c66f9aa3 [13/26] iommufd: Add user-managed hw_pagetable support
config: i386-randconfig-012-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050103.oXXfDycg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050103.oXXfDycg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050103.oXXfDycg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/hw_pagetable.c:325:7: warning: variable 'parent' is uninitialized when used here [-Wuninitialized]
                   if (parent->user_managed || !parent->nest_parent) {
                       ^~~~~~
   drivers/iommu/iommufd/hw_pagetable.c:293:44: note: initialize the variable 'parent' to silence this warning
           struct iommufd_hw_pagetable *hwpt, *parent;
                                                     ^
                                                      = NULL
   1 warning generated.


vim +/parent +325 drivers/iommu/iommufd/hw_pagetable.c

   283	
   284	int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
   285	{
   286		struct iommufd_hw_pagetable *(*alloc_fn)(
   287						struct iommufd_ctx *ictx,
   288						struct iommufd_object *pt_obj,
   289						struct iommufd_device *idev,
   290						u32 flags, enum iommu_hwpt_type type,
   291						struct iommu_user_data *user_data,
   292						bool flag);
   293		struct iommufd_hw_pagetable *hwpt, *parent;
   294		struct iommu_hwpt_alloc *cmd = ucmd->cmd;
   295		struct iommufd_object *pt_obj;
   296		struct iommufd_device *idev;
   297		struct iommufd_ioas *ioas;
   298		struct mutex *mutex;
   299		int rc;
   300	
   301		if (cmd->flags & (~IOMMU_HWPT_ALLOC_NEST_PARENT) || cmd->__reserved)
   302			return -EOPNOTSUPP;
   303	
   304		idev = iommufd_get_device(ucmd, cmd->dev_id);
   305		if (IS_ERR(idev))
   306			return PTR_ERR(idev);
   307	
   308		pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
   309		if (IS_ERR(pt_obj)) {
   310			rc = -EINVAL;
   311			goto out_put_idev;
   312		}
   313	
   314		switch (pt_obj->type) {
   315		case IOMMUFD_OBJ_IOAS:
   316			ioas = container_of(pt_obj, struct iommufd_ioas, obj);
   317			mutex = &ioas->mutex;
   318			alloc_fn = iommufd_hw_pagetable_alloc;
   319			break;
   320		case IOMMUFD_OBJ_HW_PAGETABLE:
   321			/*
   322			 * No user-managed HWPT on top of an user-managed one,
   323			 * parent should be allocated with NEST_PARENT flag.
   324			 */
 > 325			if (parent->user_managed || !parent->nest_parent) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
