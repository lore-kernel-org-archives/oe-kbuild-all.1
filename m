Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A167463D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680113181; x=1711649181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5w5DoFQoqFOoOe6e6TrJ8KxOF5sKDE2uohW1G2VOdZM=;
  b=g7BycsV/pgZRRplI9R1d/Of/SREZksjuwKs7qB1kXLDeNCydjLB9XFuC
   L/rVwcFpdU6670l+Y23tsI5KXlhJVhfaRpmN77RayJ3bEC0A0YQ0MAGKM
   X9m+sKZ8ouAskes8VLK2AFX41s0IkLgNHr2tUJozRWMyhtQKbr/yl6GRI
   q88NdvyaEWZBEqon9KiId2S8xoU6wQkmvOD3146Z836xVxw7A1ABlQiWA
   WOy/uunwNyX7mS/BaZUcV6eNNkN9MIIZz28OavwgkbmLsL6q9Lv3mX0pu
   H8vsyMo8YgSN+kkG0rGXtg/hEZha3zr/y+l9g9k+kQFPd/X0cToRWPdL+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339685363"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339685363"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773677817"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773677817"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 11:06:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phaBR-000JnL-0G;
	Wed, 29 Mar 2023 18:06:05 +0000
Date: Thu, 30 Mar 2023 02:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 3/42]
 drivers/iommu/iommufd/device.c:323:6: warning: variable 'rc' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202303300103.luCe8qDs-lkp@intel.com>
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
commit: 06ac6c12f5cac61638684e9d6f3fee0fca1287d3 [3/42] iommufd: Add IOMMU_DEVICE_GET_HW_INFO
config: riscv-randconfig-r042-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300103.luCe8qDs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/yiliu1765/iommufd/commit/06ac6c12f5cac61638684e9d6f3fee0fca1287d3
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd wip/iommufd_nesting-03292023-yi
        git checkout 06ac6c12f5cac61638684e9d6f3fee0fca1287d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300103.luCe8qDs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:323:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (length < cmd->data_len) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:329:7: note: uninitialized use occurs here
           if (!rc) {
                ^~
   drivers/iommu/iommufd/device.c:323:2: note: remove the 'if' if its condition is always true
           if (length < cmd->data_len) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:284:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   1 warning generated.


vim +323 drivers/iommu/iommufd/device.c

   276	
   277	int iommufd_device_get_hw_info(struct iommufd_ucmd *ucmd)
   278	{
   279		struct iommu_hw_info *cmd = ucmd->cmd;
   280		unsigned int length, data_len;
   281		struct iommufd_device *idev;
   282		const struct iommu_ops *ops;
   283		void *data = NULL;
   284		int rc;
   285	
   286		if (cmd->flags || cmd->__reserved || !cmd->data_len)
   287			return -EOPNOTSUPP;
   288	
   289		idev = iommufd_get_device(ucmd, cmd->dev_id);
   290		if (IS_ERR(idev))
   291			return PTR_ERR(idev);
   292	
   293		ops = dev_iommu_ops(idev->dev);
   294		if (!ops->hw_info) {
   295			rc = 0;
   296			length = 0;
   297			goto out;
   298		}
   299	
   300		/* driver has hw_info callback should have a unique hw_info_type */
   301		if (ops->hw_info_type == IOMMU_HW_INFO_TYPE_NONE) {
   302			pr_warn_ratelimited("iommu driver set an invalid type\n");
   303			rc = -ENODEV;
   304			goto out;
   305		}
   306	
   307		data = ops->hw_info(idev->dev, &data_len);
   308		if (IS_ERR(data)) {
   309			rc = PTR_ERR(data);
   310			goto out;
   311		}
   312	
   313		length = min(cmd->data_len, data_len);
   314		if (copy_to_user(u64_to_user_ptr(cmd->data_ptr), data, length)) {
   315			rc = -EFAULT;
   316			goto out;
   317		}
   318	
   319		/*
   320		 * Zero the trailing bytes if the user buffer is bigger than the
   321		 * data size kernel actually has.
   322		 */
 > 323		if (length < cmd->data_len) {
   324			rc = iommufd_zero_fill_user(cmd->data_ptr + length,
   325						    cmd->data_len - length);
   326		}
   327	
   328	out:
   329		if (!rc) {
   330			cmd->out_data_type = ops->hw_info_type;
   331			cmd->data_len = length;
   332			rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
   333		}
   334	
   335		kfree(data);
   336		iommufd_put_object(&idev->obj);
   337		return rc;
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
