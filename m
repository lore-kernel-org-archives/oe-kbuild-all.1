Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A0820EE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681317217; x=1712853217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWPHuwZ0T6uH6uRghf/4C6XQApSmztrzfwHcZoX1Khw=;
  b=chKGoZbJnHC/ptlRx02Qiwo+1ChNQCON8ijMrzGWE3mBUKvwTGPCQ7DQ
   igh2IVxrEp5kR/RKMViZKz4hHESM8aGE2hXjhxs7nxL/z5MOpBMD+5/I6
   1Bjo/HgCl0RQXCLLTPmaZr/elgx9+/MFTtCU+NY3c2MqXAARnplpK6b6h
   //p1eEBSaULQoAntlCyHi8BJCmrDy6oh5NMpBfDyju8K+5wvUSstjwrMg
   iBCHqA366WGgTTLnnrBLv7cqXmMwdDQfgB+tv/u3CQUZemeyaGKTkgsTm
   y5Vaph5YRVCZ9s6KBsA+/HluM30Nl7/Ge46jQjDGm6/g7Rikq7T1am2gv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346627659"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="346627659"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 09:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758312690"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="758312690"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2023 09:33:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmdPI-000Xsd-2M;
	Wed, 12 Apr 2023 16:33:16 +0000
Date: Thu, 13 Apr 2023 00:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Bimpikas <vasileios.bimpikas@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 85/1065]
 drivers/staging/xroeframer/sysfs_xroe.c:106: warning: expecting prototype
 for version_store(). Prototype was for enable_store() instead
Message-ID: <202304130053.uaUXEmMa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: 3c408a647a4607b8940ff6432e8af0bf18429b1d [85/1065] staging: Add xroeframer driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130053.uaUXEmMa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/3c408a647a4607b8940ff6432e8af0bf18429b1d
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout 3c408a647a4607b8940ff6432e8af0bf18429b1d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/media/mc/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/ptp/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130053.uaUXEmMa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/xroeframer/sysfs_xroe.c:106: warning: expecting prototype for version_store(). Prototype was for enable_store() instead
>> drivers/staging/xroeframer/sysfs_xroe.c:552: warning: expecting prototype for utils_sysfs_store_wrapper(). Prototype was for utils_sysfs_show_wrapper() instead
--
>> drivers/staging/xroeframer/sysfs_xroe_framer_ipv6.c:504: warning: expecting prototype for xroe_sysfs_ipv4_exit(). Prototype was for xroe_sysfs_ipv6_exit() instead
--
>> drivers/staging/xroeframer/sysfs_xroe_framer_udp.c:176: warning: expecting prototype for xroe_sysfs_ipv6_exit(). Prototype was for xroe_sysfs_udp_exit() instead


vim +106 drivers/staging/xroeframer/sysfs_xroe.c

    91	
    92	/**
    93	 * version_store - Writes to the framer's enable status register
    94	 * @kobj:	The kernel object of the entry
    95	 * @attr:	The attributes of the kernel object
    96	 * @buff:	The buffer containing the enable status
    97	 * @count:	The number of characters typed by the user
    98	 *
    99	 * Reads the user input and accordingly writes the framer's enable status
   100	 * to the sysfs entry
   101	 *
   102	 * Return: XROE_SIZE_MAX or the value of "count", if that's lesser, on success
   103	 */
   104	static ssize_t enable_store(struct kobject *kobj, struct kobj_attribute *attr,
   105				    const char *buff, size_t count)
 > 106	{
   107		u32 enable = 0;
   108	
   109		xroe_size = min_t(size_t, count, (size_t)XROE_SIZE_MAX);
   110		strncpy(xroe_tmp, buff, xroe_size);
   111		if (strncmp(xroe_tmp, "true", xroe_size) == 0)
   112			enable = 1;
   113		else if (strncmp(xroe_tmp, "false", xroe_size) == 0)
   114			enable = 0;
   115		utils_sysfs_store_wrapper(CFG_MASTER_INT_ENABLE_ADDR,
   116					  CFG_MASTER_INT_ENABLE_OFFSET,
   117					  CFG_MASTER_INT_ENABLE_MASK, enable, kobj);
   118		return xroe_size;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
