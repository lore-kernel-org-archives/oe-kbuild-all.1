Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B50E6D38
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678283988; x=1709819988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNKgVbdiZoQzmmlNx3nHznYDAnTPVivtpJ3s3x4aK1U=;
  b=mAy4L/TdSgDB5hhuoA0iefrX3rYz9sbvfn+9OF9YhgKKHGkUW32wHAFT
   A158FT8NHw0KpQZs+hLEf48vHjLRYcOEbnwmc1Yoqi1uy2kAgDWNeqARW
   AQftORMd44B0bCY+qjFFOayPffVyEEJJ83UTBFLH7iRrGmAOL26WCAozK
   RZOTtDlzfZqJWfub9lYD6Qll70Ov+oOaV4rM66CwN6l2VwHotHaTsfLTL
   ZNGCmcSiPHmRuPfWOGBavO/8qkuUzSDaDahDpcu70dZTTTNze0x0PNery
   zDBU0osSqrdUcBre2ntaMzUK6uDhklG2TFloCpvzn70nqflx7vyvM8i7c
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="363793277"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="363793277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006334723"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="1006334723"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 05:59:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZuKY-0002AO-0c;
	Wed, 08 Mar 2023 13:59:46 +0000
Date: Wed, 8 Mar 2023 21:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:for-usb-next 8/14]
 drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted
 __le32
Message-ID: <202303082106.YhLmsktf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
head:   a1d18a67ae7cf71edacfdfad8bd5abf8d0e3787f
commit: 383d00635a264b0044c2342fcad36160fb0e3249 [8/14] xhci: dbc: Provide sysfs option to configure dbc descriptors
config: openrisc-randconfig-s052-20230305 (https://download.01.org/0day-ci/archive/20230308/202303082106.YhLmsktf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=383d00635a264b0044c2342fcad36160fb0e3249
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci for-usb-next
        git checkout 383d00635a264b0044c2342fcad36160fb0e3249
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082106.YhLmsktf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/xhci-dbgcap.c:127:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:127:18: sparse:     expected unsigned int [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:127:18: sparse:     got restricted __le32 [usertype]
   drivers/usb/host/xhci-dbgcap.c:130:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:130:18: sparse:     expected unsigned int [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:130:18: sparse:     got restricted __le32 [usertype]
   drivers/usb/host/xhci-dbgcap.c:269:25: sparse: sparse: invalid assignment: &=
   drivers/usb/host/xhci-dbgcap.c:269:25: sparse:    left side has type unsigned int
   drivers/usb/host/xhci-dbgcap.c:269:25: sparse:    right side has type restricted __le32
   drivers/usb/host/xhci-dbgcap.c:271:25: sparse: sparse: invalid assignment: |=
   drivers/usb/host/xhci-dbgcap.c:271:25: sparse:    left side has type unsigned int
   drivers/usb/host/xhci-dbgcap.c:271:25: sparse:    right side has type restricted __le32
   drivers/usb/host/xhci-dbgcap.c:723:53: sparse: sparse: restricted __le64 degrades to integer
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1009:20: sparse: sparse: cast to restricted __le32
>> drivers/usb/host/xhci-dbgcap.c:1010:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:1010:18: sparse:     expected unsigned int [assigned] [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:1010:18: sparse:     got restricted __le32 [usertype]
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1049:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1050:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:1050:18: sparse:     expected unsigned int [assigned] [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:1050:18: sparse:     got restricted __le32 [usertype]
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1088:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1089:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:1089:18: sparse:     expected unsigned int [assigned] [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:1089:18: sparse:     got restricted __le32 [usertype]
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1131:20: sparse: sparse: cast to restricted __le32
   drivers/usb/host/xhci-dbgcap.c:1132:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] dev_info @@     got restricted __le32 [usertype] @@
   drivers/usb/host/xhci-dbgcap.c:1132:18: sparse:     expected unsigned int [assigned] [usertype] dev_info
   drivers/usb/host/xhci-dbgcap.c:1132:18: sparse:     got restricted __le32 [usertype]

vim +1009 drivers/usb/host/xhci-dbgcap.c

   988	
   989	static ssize_t dbc_idVendor_store(struct device *dev,
   990				     struct device_attribute *attr,
   991				     const char *buf, size_t size)
   992	{
   993		struct xhci_dbc		*dbc;
   994		struct xhci_hcd		*xhci;
   995		void __iomem		*ptr;
   996		u16			value;
   997		u32			dev_info;
   998	
   999		if (kstrtou16(buf, 0, &value))
  1000			return -EINVAL;
  1001	
  1002		xhci = hcd_to_xhci(dev_get_drvdata(dev));
  1003		dbc = xhci->dbc;
  1004		if (dbc->state != DS_DISABLED)
  1005			return -EBUSY;
  1006	
  1007		dbc->idVendor = value;
  1008		ptr = &dbc->regs->devinfo1;
> 1009		dev_info = le32_to_cpu(readl(ptr));
> 1010		dev_info = cpu_to_le32((dev_info & ~(0xffffu << 16)) | (value << 16));
  1011		writel(dev_info, ptr);
  1012	
  1013		return size;
  1014	}
  1015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
