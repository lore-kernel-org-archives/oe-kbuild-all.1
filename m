Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73415A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695954969; x=1727490969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1p5XXcfjmblug635eWpJ1RmioGZfdf3ZlvFDC9XbSE=;
  b=juuwCf6AzHlTPM6DpWFHmgrUwstzKAQgL56K0ViYO6WhNkj2K709Gl8u
   VLDkKJoe7+HuA+/rrSywHWdqPmIPP2OFvzOK7ZPi7lrusih14BH1KhAmR
   7zzrzh4+c3Pl3NZ3G2dsl674DQCbclq+2HSBv+IaRaiKs7ZeY4IEC6SuY
   hJ5/OmGT26UJRhaU3gRahPLuRgm4hsJApBWdI3PjZinb+lWyYNsySysZi
   vnG/Cg7QdmRBZQ5XSPShnYWKk/Uz+IuM5IaM6GUExHX9gXhpfyulV6ceD
   le946nay4Gq6Zzxl5N+N5lAJYI9FvJJc1VQS4RN3bY1nkkoGwRGlWN64f
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="367281712"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="367281712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 19:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865532511"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="865532511"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2023 19:36:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm3MK-0002Nv-2N;
	Fri, 29 Sep 2023 02:36:04 +0000
Date: Fri, 29 Sep 2023 10:35:28 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 220/1370]
 drivers/usb/misc/usb5744.c:62:55: sparse: sparse: incorrect type in argument
 3 (different base types)
Message-ID: <202309291021.aJkFyuSQ-lkp@intel.com>
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
commit: f713e8772354c2ee753c34977308b4e151c3b194 [220/1370] usb: misc: usb5744: add support for USB hub controller
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291021.aJkFyuSQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291021.aJkFyuSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291021.aJkFyuSQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/misc/usb5744.c:62:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] @@
   drivers/usb/misc/usb5744.c:62:55: sparse:     expected unsigned short [usertype] value
   drivers/usb/misc/usb5744.c:62:55: sparse:     got restricted __be16 [usertype]

vim +62 drivers/usb/misc/usb5744.c

    47	
    48	static int usb5744_i2c_dev_init(struct i2c_client *client)
    49	{
    50		struct device *dev = &client->dev;
    51		struct usb5744 *data = NULL;
    52		int ret = 0;
    53	
    54		i2c_set_clientdata(client, data);
    55	
    56		/* Trigger gpio reset to the hub. */
    57		ret = usb5744_init_hw(dev, data);
    58		if (ret)
    59			return ret;
    60	
    61		/* Send SMBus command to boot hub. */
  > 62		ret = i2c_smbus_write_word_data(client, 0xAA, htons(0x5600));
    63		if (ret < 0)
    64			dev_err(dev, "Sending boot command failed");
    65	
    66		return ret;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
