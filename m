Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDF0675CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzh8C9sJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702576034; x=1734112034;
  h=date:from:cc:subject:message-id:mime-version;
  bh=avHckGe8iGvCIBzxp+PrUy4WxXjLjV1iZusLUgjEAek=;
  b=fzh8C9sJigqCVNLOIofw3lMqsNmByBHkSr5yVyPb1kmgJPZ36i2iIhnp
   D9zpAOVIP4kBL6hIPxJcyjVSWwqFjOEfPFHu0IscMDxSw/9ixNg5JNE1a
   Yo/v8OTVg9ODRRwOVNItbxz3kFix9rorinQxmGiX707lKqXJy/viBE3VT
   //mTEcIFGEt0hJhYe+fI6MH7IdHlPhJHN9TdVKTfAlxo4bjdtJOB9WR0t
   Ji7MadvW3FJik6os+Gy6zQ4rooJJ0wYeiqZJv4xmTc0X1AIUauFL0zF4P
   wj37PPWhY894FWZ8sS6IAUTgo1smPhWaSiTBEQQr7Tow+xSB7mHcyRVmD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1977298"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="1977298"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 09:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750626309"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="750626309"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Dec 2023 09:47:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDpnA-000MRQ-1s;
	Thu, 14 Dec 2023 17:46:48 +0000
Date: Fri, 15 Dec 2023 01:46:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 13/22] drivers/net/can/m_can/m_can.c:1890:60:
 sparse: sparse: dubious: !x & y
Message-ID: <202312150119.f50Lh0Xf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   247b2535b24894d5ac7f3d8cfc3b48edb7214cc0
commit: a82817238831b72570a3135027ba3bc52becabb7 [13/22] can: m_can: Map WoL to device_set_wakeup_enable
config: mips-randconfig-r121-20231126 (https://download.01.org/0day-ci/archive/20231215/202312150119.f50Lh0Xf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150119.f50Lh0Xf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150119.f50Lh0Xf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/can/m_can/m_can.c:1890:60: sparse: sparse: dubious: !x & y
   drivers/net/can/m_can/m_can.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +1890 drivers/net/can/m_can/m_can.c

  1882	
  1883	static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
  1884	{
  1885		struct m_can_classdev *cdev = netdev_priv(dev);
  1886	
  1887		if ((wol->wolopts & WAKE_PHY) != wol->wolopts)
  1888			return -EINVAL;
  1889	
> 1890		device_set_wakeup_enable(cdev->dev, !!wol->wolopts & WAKE_PHY);
  1891	
  1892		return 0;
  1893	}
  1894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
