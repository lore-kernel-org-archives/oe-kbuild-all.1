Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923101C3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAckk/Pp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697170734; x=1728706734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMSbE43CSUZ6DQUTyiK4TNdQHCOlcLEPwtD8AwygLrw=;
  b=HAckk/PpnJuoki0F3dV/aPUqJZhxAMG6hqZFAtTn9/0zV8q5FiRh3/TJ
   u/WIujlJzRnTbqyuARrbdxs7pMSfC6tiilE780A/oOwVG8Xm44lo0JKUZ
   O1RJwFsj1MnsbERKuzjZSGLi8mhi6RRsCZh1HGXTwT5pMilW4CvagIUXc
   X0nkpk3e4d8+YT7f7JnhAsV6f3XWC62axnkDXWR5umD9e/KH5GcFSEvyd
   p/rIcjZBV3JCO7tO6bJmsYFGa7umjRehO3t0wzFpAK1s+9CQ1M+XayACO
   5VXR/MA57Rgj/90XV7lkU64ta5/x7OJTXRWgO10gMvF08+FWS8/YrxRZH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387956002"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="387956002"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 21:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878386259"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="878386259"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 21:18:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr9dS-0004Jt-0L;
	Fri, 13 Oct 2023 04:18:50 +0000
Date: Fri, 13 Oct 2023 12:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2034/30000]
 drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for
 'i2cfront_xfer'
Message-ID: <202310131213.p3MgZy5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: dda4dde724422c2e8082ffd83d3ea3b3ffb82d06 [2034/30000] LF-191-2 i2c: introduce xen i2c paravirtualization driver
config: x86_64-randconfig-006-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131213.p3MgZy5a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131213.p3MgZy5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131213.p3MgZy5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/xen-i2cfront.c:148:5: warning: no previous prototype for 'i2cfront_xfer' [-Wmissing-prototypes]
     148 | int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
         |     ^~~~~~~~~~~~~


vim +/i2cfront_xfer +148 drivers/i2c/busses/xen-i2cfront.c

   147	
 > 148	int i2cfront_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
   149	{
   150		struct i2cfront_info *info = i2c_get_adapdata(adapter);
   151		int ret, i;
   152	
   153		if (!info || !info->i2cdev) {
   154			dev_err(&adapter->dev, "Not initialized\n");
   155			return -EIO;
   156		}
   157	
   158		if (info->i2cdev->state != XenbusStateConnected) {
   159			dev_err(&adapter->dev, "Not connected\n");
   160			return -EIO;
   161		}
   162	
   163		for (i = 0; i < num; i++) {
   164			if (msgs[i].flags & I2C_M_RD) {
   165				ret = i2cfront_do_req(adapter, &msgs[i], 1);
   166			} else if ((i + 1 < num) && (msgs[i + 1].flags & I2C_M_RD) &&
   167				(msgs[i].addr == msgs[i + 1].addr)) {
   168				ret = i2cfront_do_req(adapter, &msgs[i], 2);
   169				i++;
   170			} else {
   171				ret = i2cfront_do_req(adapter, &msgs[i], 1);
   172			}
   173	
   174			if (ret < 0)
   175				goto err;
   176		}
   177	err:
   178		return (ret < 0) ? ret : num;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
