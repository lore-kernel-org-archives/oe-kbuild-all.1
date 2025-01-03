Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C81C1F10
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889370; cv=none; b=LWRFkPiMX8DrGAnPzSvMEpRNWTDtTAdZ9AgchJVKvsczxMXbZ2NsJFyRDu1Qe2LL1sFD9nW+FoBSxJOK1TlBDDmn/6+OrGYW2E0kPiWZpXLXIqL1kB7QZRYna9Nt0m+eFp5+1F1EdDzQtsUDvaUKjxT5fOjtSvp88jtVOS0lpg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889370; c=relaxed/simple;
	bh=C4VNEBZ/h+MLc2jeUstZkslHDxTMKy5YZexv7njqLrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTPYGs7UCSHd9Qmj3JYR1j9KNO6aXctJ0cSgBMPGjtQVtYC6sRMP+UR84A8Lb0KTwr821RpbvhR4f5EVfAMmKKq13NHv9cKANzLJQqQk3HVLmcSXEu1rBCDseGLnzvF0pn+z7E8MnzhkUlyN1etN3G7Grok0f15Q5+Vc80UccMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxZxTjBK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxZxTjBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735889369; x=1767425369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4VNEBZ/h+MLc2jeUstZkslHDxTMKy5YZexv7njqLrc=;
  b=HxZxTjBKXDDKVFfh1Fy5nBfnjZiahlQJBtIaUaru9rtO50i5ubRC6dPP
   tkyHqdIfgIB/kcZj4de2QqpyMtsgM9mpSg2DX5xmkbyItZ988SaUS8k2S
   9NVdhw3vC1HOJmX1+SAB0mqYpD8tDjY+mWxvjTMml4Oy7l7V9c9gI9Qcz
   8vRkoleXuSc04WS1n+btph2cNcJ8Pf8OR5OJlw1bfVjN7Z5C2WEk79pCS
   rYH4L1GhEapL64+/0jq0h3qegD6Ogid8oNYx2iRKkt6l/+O2Gpt0veeJf
   R8aFvcj+nQcJpXuQIj4jerseUU56VafKeS0OQBxO+1MVcNzCCf5Fxc9bg
   A==;
X-CSE-ConnectionGUID: AFaaLnHLQ/O2kxJpDnV7nQ==
X-CSE-MsgGUID: nzrJH773T9O5hb3t92JSfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35839258"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35839258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 23:29:26 -0800
X-CSE-ConnectionGUID: 30fcVlh2Rt6G8UrNYyub0g==
X-CSE-MsgGUID: 9hk0HdztTDWWZyuo5Fae6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102241324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2025 23:29:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTc7W-0009Nz-1R;
	Fri, 03 Jan 2025 07:29:22 +0000
Date: Fri, 3 Jan 2025 15:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Gromm <christian.gromm@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/most/most_usb.c:69: warning: Function parameter or struct
 member 'dev' not described in 'most_dci_obj'
Message-ID: <202501031506.taoSku3j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 97a6f772f36b7f52bcfa56a581bbd2470cffe23d drivers: most: add USB adapter driver
date:   4 years, 5 months ago
config: csky-randconfig-r003-20230612 (https://download.01.org/0day-ci/archive/20250103/202501031506.taoSku3j-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031506.taoSku3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031506.taoSku3j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/most/most_usb.c:69: warning: Function parameter or struct member 'dev' not described in 'most_dci_obj'
>> drivers/most/most_usb.c:69: warning: Excess struct member 'kobj' description in 'most_dci_obj'
>> drivers/most/most_usb.c:122: warning: Function parameter or struct member 'dev' not described in 'most_dev'
>> drivers/most/most_usb.c:122: warning: Function parameter or struct member 'clear_work' not described in 'most_dev'
>> drivers/most/most_usb.c:122: warning: Function parameter or struct member 'on_netinfo' not described in 'most_dev'
>> drivers/most/most_usb.c:649: warning: Function parameter or struct member 'on_netinfo' not described in 'hdm_request_netinfo'
   drivers/most/most_usb.c:668: warning: Function parameter or struct member 't' not described in 'link_stat_timer_handler'
   drivers/most/most_usb.c:668: warning: Excess function parameter 'data' description in 'link_stat_timer_handler'
   drivers/most/most_usb.c:768: warning: cannot understand function prototype: 'const struct file_operations hdm_usb_fops = '
   drivers/most/most_usb.c:775: warning: cannot understand function prototype: 'const struct usb_device_id usbid[] = '


vim +69 drivers/most/most_usb.c

a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   58  
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   59  /**
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   60   * struct most_dci_obj - Direct Communication Interface
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   61   * @kobj:position in sysfs
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   62   * @usb_device: pointer to the usb device
c0554645a8c5a2 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-09   63   * @reg_addr: register address for arbitrary DCI access
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   64   */
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   65  struct most_dci_obj {
4d5f022f3a664e drivers/staging/most/usb/usb.c         Christian Gromm 2017-11-21   66  	struct device dev;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   67  	struct usb_device *usb_device;
c0554645a8c5a2 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-09   68  	u16 reg_addr;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  @69  };
9cbe5aa65d5d4e drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-10-21   70  
4d5f022f3a664e drivers/staging/most/usb/usb.c         Christian Gromm 2017-11-21   71  #define to_dci_obj(p) container_of(p, struct most_dci_obj, dev)
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   72  
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   73  struct most_dev;
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   74  
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   75  struct clear_hold_work {
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   76  	struct work_struct ws;
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   77  	struct most_dev *mdev;
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   78  	unsigned int channel;
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   79  	int pipe;
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   80  };
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   81  
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   82  #define to_clear_hold_work(w) container_of(w, struct clear_hold_work, ws)
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19   83  
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   84  /**
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   85   * struct most_dev - holds all usb interface specific stuff
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   86   * @usb_device: pointer to usb device
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   87   * @iface: hardware interface
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   88   * @cap: channel capabilities
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   89   * @conf: channel configuration
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   90   * @dci: direct communication interface of hardware
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   91   * @ep_address: endpoint address table
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   92   * @description: device description
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   93   * @suffix: suffix for channel name
88d1878bcaa438 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-19   94   * @channel_lock: synchronize channel access
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   95   * @padding_active: indicates channel uses padding
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   96   * @is_channel_healthy: health status table of each channel
27e6245e35bc6c drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-19   97   * @busy_urbs: list of anchored items
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   98   * @io_mutex: synchronize I/O with disconnect
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24   99   * @link_stat_timer: timer for link status reports
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  100   * @poll_work_obj: work for polling link status
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  101   */
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  102  struct most_dev {
723de0f9171eeb drivers/staging/most/usb/usb.c         Christian Gromm 2020-01-23  103  	struct device dev;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  104  	struct usb_device *usb_device;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  105  	struct most_interface iface;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  106  	struct most_channel_capability *cap;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  107  	struct most_channel_config *conf;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  108  	struct most_dci_obj *dci;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  109  	u8 *ep_address;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  110  	char description[MAX_STRING_LEN];
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  111  	char suffix[MAX_NUM_ENDPOINTS][MAX_SUFFIX_LEN];
88d1878bcaa438 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-19  112  	spinlock_t channel_lock[MAX_NUM_ENDPOINTS]; /* sync channel access */
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  113  	bool padding_active[MAX_NUM_ENDPOINTS];
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  114  	bool is_channel_healthy[MAX_NUM_ENDPOINTS];
cc28983c322030 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-08-19  115  	struct clear_hold_work clear_work[MAX_NUM_ENDPOINTS];
27e6245e35bc6c drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2016-09-19  116  	struct usb_anchor *busy_urbs;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  117  	struct mutex io_mutex;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  118  	struct timer_list link_stat_timer;
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24  119  	struct work_struct poll_work_obj;
9917b209f8e641 drivers/staging/most/usb/usb.c         Ravi Eluri      2017-12-22  120  	void (*on_netinfo)(struct most_interface *most_iface,
9917b209f8e641 drivers/staging/most/usb/usb.c         Ravi Eluri      2017-12-22  121  			   unsigned char link_state, unsigned char *addrs);
a4198cdf0c3460 drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-07-24 @122  };
9cbe5aa65d5d4e drivers/staging/most/hdm-usb/hdm_usb.c Christian Gromm 2015-10-21  123  

:::::: The code at line 69 was first introduced by commit
:::::: a4198cdf0c3460d767d0d36979cd633021c127a2 Staging: most: add MOST driver's hdm-usb module

:::::: TO: Christian Gromm <christian.gromm@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
