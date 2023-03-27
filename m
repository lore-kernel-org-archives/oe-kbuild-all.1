Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9109E79CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679951195; x=1711487195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRpNI2iUMPE4gDvk9TEaudvkHIcKyHx5Jm62RY5rvNk=;
  b=mi8wMsFXcXYquk7vUtOqVWRh6GgkLQ47bTFt1I3QWFPFiOAp8dCjftXt
   lsAs48XNuaN1WhbErfmycvDiqltymn+DDl0s2t3UQ1hUftGji2HHXvV3H
   J5E/aVJN9dcVFs3cjaSUjVW8x1i2PquwzzMjO29/hzrXMHcqWhOtpk/Sj
   RkNPFV2zAqL+UvtPzoDV9vbCRTTg9jP4PjdD7DCcyTh822VIE6YlRvNDv
   aj+tuZnRuoEz60cQEqh3nW1yPe1TjpqwId8dDqICctawoga8YvQVkggWT
   XksT/zupSZCuYQrhjJC8doHhasi6g8feRYGtOkKm47zxrgXzb4XLCVMBT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328835157"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="328835157"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 14:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="683608325"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="683608325"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Mar 2023 14:06:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgu2z-000I1H-0y;
	Mon, 27 Mar 2023 21:06:33 +0000
Date: Tue, 28 Mar 2023 05:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 9/21] drivers/cxl/core/acpi.c:26: warning: expecting
 prototype for cxl_acpi_get_root_acpi_handle(). Prototype was for
 cxl_acpi_get_rootdev_handle() instead
Message-ID: <202303280536.DPGB8HJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   4ae6955d7687ac4f6bdb6bd81d99dca122cce533
commit: 35841fb68e0bcd3c07c1e05ff1719d55bca4d35d [9/21] cxl: Add helper function to retrieve ACPI handle of CXL root device
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303280536.DPGB8HJM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=35841fb68e0bcd3c07c1e05ff1719d55bca4d35d
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 35841fb68e0bcd3c07c1e05ff1719d55bca4d35d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280536.DPGB8HJM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/acpi.c:26: warning: expecting prototype for cxl_acpi_get_root_acpi_handle(). Prototype was for cxl_acpi_get_rootdev_handle() instead


vim +26 drivers/cxl/core/acpi.c

    12	
    13	const guid_t acpi_cxl_qtg_id_guid =
    14		GUID_INIT(0xF365F9A6, 0xA7DE, 0x4071,
    15			  0xA6, 0x6A, 0xB4, 0x0C, 0x0B, 0x4F, 0x8E, 0x52);
    16	
    17	/**
    18	 * cxl_acpi_get_root_acpi_handle - get the ACPI handle of the CXL root device
    19	 * @dev: 'struct device' to start searching from. Should be from cxl_port->dev.
    20	 *
    21	 * Return: acpi_handle on success, errptr of errno on error.
    22	 *
    23	 * Looks for the ACPI0017 device and return the ACPI handle
    24	 **/
    25	acpi_handle cxl_acpi_get_rootdev_handle(struct device *dev)
  > 26	{
    27		struct device *itr = dev;
    28		struct device *root_dev;
    29		acpi_handle handle;
    30	
    31		if (!dev)
    32			return ERR_PTR(-EINVAL);
    33	
    34		while (itr->parent) {
    35			root_dev = itr;
    36			itr = itr->parent;
    37		}
    38	
    39		if (!dev_is_platform(root_dev))
    40			return ERR_PTR(-ENODEV);
    41	
    42		handle = ACPI_HANDLE(root_dev);
    43		if (!handle)
    44			return ERR_PTR(-ENODEV);
    45	
    46		return handle;
    47	}
    48	EXPORT_SYMBOL_NS_GPL(cxl_acpi_get_rootdev_handle, CXL);
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
