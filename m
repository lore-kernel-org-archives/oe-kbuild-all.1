Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886B1798F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695937415; x=1727473415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgFgU1/0+UL3aaUZm4GAhAlgwYALkyNungwv5hqyB9o=;
  b=fbwtxBr6A75WboZvRS9uPI4bp8Y05pR4tRCOmT7xcf15woh9l7IidS9o
   sqTWfzl42iRH3qkcCNaCjeapGvjPFywed3/lk/bF462pH60hvfprmBLck
   Gm0O+3da8vhts+G6nUCH7Vd/nmfJa6ZaV8emgrCs//9/04m6wyYS0AARB
   96VsZS8xeQu4gubaIobrRUM6ycCXmSkRqHpzYIQ1ongMTCKfH69qxzWYf
   lv4TJJxW7SC/axaPcWqCxJqI95Mhgk48BSIsXIMpHNLN5Oo76BVzUSTex
   XttTwsSl7+Lg07UdAJGvJ56V4ih0U8P61i+eDWuCPv1SkCVQ4uU/MBKyY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379454574"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="379454574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 14:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699437494"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="699437494"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Sep 2023 14:43:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlynB-0001zh-1W;
	Thu, 28 Sep 2023 21:43:29 +0000
Date: Fri, 29 Sep 2023 05:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Bimpikas <vasileios.bimpikas@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 85/1370]
 drivers/staging/xroeframer/sysfs_xroe.c:194:43: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202309290511.j8YYq8Wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 3c408a647a4607b8940ff6432e8af0bf18429b1d [85/1370] staging: Add xroeframer driver
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290511.j8YYq8Wi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290511.j8YYq8Wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290511.j8YYq8Wi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/xroeframer/sysfs_xroe.c:194:43: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/staging/xroeframer/sysfs_xroe.c:195:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:195:9: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:195:9: sparse:     got unsigned char [usertype] *
   drivers/staging/xroeframer/sysfs_xroe.c:227:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/staging/xroeframer/sysfs_xroe.c:228:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:228:9: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:228:9: sparse:     got unsigned char [usertype] *
   drivers/staging/xroeframer/sysfs_xroe.c:263:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/staging/xroeframer/sysfs_xroe.c:263:67: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:263:67: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:263:67: sparse:     got unsigned char [usertype] *
   drivers/staging/xroeframer/sysfs_xroe.c:293:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/staging/xroeframer/sysfs_xroe.c:293:67: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:293:67: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:293:67: sparse:     got unsigned char [usertype] *
   drivers/staging/xroeframer/sysfs_xroe.c:329:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/staging/xroeframer/sysfs_xroe.c:329:67: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:329:67: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:329:67: sparse:     got unsigned char [usertype] *
   drivers/staging/xroeframer/sysfs_xroe.c:357:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/staging/xroeframer/sysfs_xroe.c:357:67: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *working_address @@     got unsigned char [usertype] * @@
   drivers/staging/xroeframer/sysfs_xroe.c:357:67: sparse:     expected void [noderef] __iomem *working_address
   drivers/staging/xroeframer/sysfs_xroe.c:357:67: sparse:     got unsigned char [usertype] *

vim +/__iomem +194 drivers/staging/xroeframer/sysfs_xroe.c

   176	
   177	/**
   178	 * deframer_restart_show - Returns the deframer's restart status
   179	 * @kobj:	The kernel object of the entry
   180	 * @attr:	The attributes of the kernel object
   181	 * @buff:	The buffer containing the restart status
   182	 *
   183	 * Reads and writes the deframer's restart status to the sysfs entry
   184	 *
   185	 * Return: XROE_SIZE_MAX on success
   186	 */
   187	static ssize_t deframer_restart_show(struct kobject *kobj,
   188					     struct kobj_attribute *attr, char *buff)
   189	{
   190		u32 offset = DEFM_RESTART_OFFSET;
   191		u32 mask = DEFM_RESTART_MASK;
   192		u32 buffer = 0;
   193		u32 restart = 0;
 > 194		void __iomem *working_address = ((u8 *)xroe_lp->base_addr
 > 195		+ DEFM_RESTART_ADDR);
   196	
   197		buffer = ioread32(working_address);
   198		restart = (buffer & mask) >> offset;
   199	
   200		if (restart)
   201			sprintf(buff, "true\n");
   202	
   203		else
   204			sprintf(buff, "false\n");
   205	
   206		return XROE_SIZE_MAX;
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
