Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C08F43
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686744050; x=1718280050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcGq10ls7+0OvxaQ9MMvz4HIm1l4VO+BF06p/6k3624=;
  b=GgUl6QfZcA/52W/Pb/yHJPvO5o21PmqZE9DpOoq9pstr1PQJIT0Wz8vo
   knHBI7iAc1TPaCbAet7iO1CYg8kQK3EGoJ6q8HbEyFTysJLhqTQiogfX+
   RIB4Jlb2scnFb1FvrW5DGLMYw6AAt8oTFDKMoT2GFf1KVDShX+yOaCVJV
   FxastDLgNp+bjGbs8UTYmUlfgLaZbBN6brn6r0QRyZYwfDRiy4trDBMl+
   sFwWK/LqvpAc7+zOM7Dp44IKbqV/eUgiGNvHr0s28eWIKDPECqz4IS3a8
   XdKBtIqWYd7bLEE4rWo6WEYR1r8L+6aI6cuZInoAUqutzv9STsvcNNVE4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361963910"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="361963910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958775137"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="958775137"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2023 05:00:38 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9PAz-0000b7-1Y;
	Wed, 14 Jun 2023 12:00:37 +0000
Date: Wed, 14 Jun 2023 19:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Wendy Liang <wendy.liang@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 78/1079]
 drivers/uio/uio_xilinx_ai_engine.c:39:13: warning: variable 'irq' set but
 not used
Message-ID: <202306141929.B30E5Meo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   b8d15414a440db0904ee32f03268e2d262dbf397
commit: a221710ea6a7410a7b07061a9a15bb84d5513b7e [78/1079] uio: Add the UIO driver for AI engine
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306141929.B30E5Meo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/a221710ea6a7410a7b07061a9a15bb84d5513b7e
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
        git checkout a221710ea6a7410a7b07061a9a15bb84d5513b7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/staging/ drivers/uio/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141929.B30E5Meo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/uio/uio_xilinx_ai_engine.c: In function 'xilinx_ai_engine_debugfs_write':
>> drivers/uio/uio_xilinx_ai_engine.c:39:13: warning: variable 'irq' set but not used [-Wunused-but-set-variable]
      39 |         int irq, ret;
         |             ^~~


vim +/irq +39 drivers/uio/uio_xilinx_ai_engine.c

    33	
    34	static ssize_t xilinx_ai_engine_debugfs_write(struct file *f,
    35						      const char __user *buf,
    36						      size_t size, loff_t *pos)
    37	{
    38		struct irq_domain *irq_sim_domain = file_inode(f)->i_private;
  > 39		int irq, ret;
    40	
    41		irq = irq_find_mapping(irq_sim_domain, 1);
    42		ret = irq_set_irqchip_state(1, IRQCHIP_STATE_PENDING, true);
    43		if (ret)
    44			return ret;
    45	
    46		return size;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
