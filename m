Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0CE1EB44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731894825; cv=none; b=DEubY+MHvppV0mo6aGUq/XXa+gAUqRCDismiSysWzqPApKhOWQNLHUk8C3iHELhkRmnhEEXMyo89Xt81qs2yrgLd3SmLo34+MP2mzW7eAxCedfgBjcj3I7yiGEj55VNTcn8v/FxhOXbNsWJgpelrfP7BFMmhR+COyTal5nPSSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731894825; c=relaxed/simple;
	bh=1XI2Un4LyVtZc6uAkTsgr+zRa2S9A2T5xgMtu6OxM2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3XBSo6dYUP1Ix+NMgrtZ4kRPk1zldDAdiJM0IT06fmyTijsGhf5xq7XRDX155ZypMiqk8hUHmVHr8gw8vqNPp+UFI0xEQZGZimfk1kh3OYj4Li9FZUXNGDf1mGDd7hybAbmQXrB6uuj+IXDVTuB7qjRgfCQYazAeDBFhYq5mbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4Oix/w+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4Oix/w+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894824; x=1763430824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1XI2Un4LyVtZc6uAkTsgr+zRa2S9A2T5xgMtu6OxM2g=;
  b=K4Oix/w+mX/rGQS8Kmhy+M8r9nzPznX34XooXx5loApze7QAB5ernokx
   Y+CvgcyqCCdvLJl3Q/yypqchip+vc/xFDDHu2MIYD+Ppft2P6op+stwsm
   +TH8od929iEw+GcrXh5U5WhQ3MZ/GVT2SkBLOIx+/0o36mVd3LpRBZXvL
   o+2tSh4CGkWzJdY7mctiG80B5/zY263SMd9S1kxPjShfw8AXWzk7rzTbq
   BdjyrVGeipSZjTHnRwm9ELZZTohSICBtFPfxiUTUvHQVMFPrR4sDcFlLZ
   W3p+x4810gCq7OT1YxVKbEPhDP6qKXHgCwgMbMJdGuKbnNyy/TH29tItz
   A==;
X-CSE-ConnectionGUID: 41EKO5SVRkW920L6Bj9VUQ==
X-CSE-MsgGUID: wYS+d12rTIi2fD10V5I6ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31983761"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31983761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:53:43 -0800
X-CSE-ConnectionGUID: CO3Umq2VRuWl6FCgFbmQmA==
X-CSE-MsgGUID: 4uiH+0ZbRUumVYp7Q8OtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="119933766"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2024 17:53:42 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqxP-0002CV-1I;
	Mon, 18 Nov 2024 01:53:39 +0000
Date: Mon, 18 Nov 2024 09:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 7/28] drivers/hid/hid-magicmouse.c:160:
 warning: Function parameter or struct member 'input_ops' not described in
 'magicmouse_sc'
Message-ID: <202411180947.Jt8JZb82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   501868c5f377ff4155041d111e0bea3c499b97a8
commit: 2991b2ba08b0a2be65bd9429507dc58a4bdc0f40 [7/28] HID: magicmouse: use ops function pointers for input functionality
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241118/202411180947.Jt8JZb82-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180947.Jt8JZb82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180947.Jt8JZb82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:160: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:160: warning: Function parameter or struct member 'input_ops' not described in 'magicmouse_sc'


vim +160 drivers/hid/hid-magicmouse.c

2991b2ba08b0a2 Janne Grunau  2021-12-16  122  
128537cea464d9 Michael Poole 2010-02-06  123  /**
128537cea464d9 Michael Poole 2010-02-06  124   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  125   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  126   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  127   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  128   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  129   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  130   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  131   * @tracking_ids: Mapping of current touch input data to @touches.
b0a1fe4610de57 Jiri Kosina   2023-12-27  132   * @hdev: Pointer to the underlying HID device.
b0a1fe4610de57 Jiri Kosina   2023-12-27  133   * @work: Workqueue to handle initialization retry for quirky devices.
b0a1fe4610de57 Jiri Kosina   2023-12-27  134   * @battery_timer: Timer for obtaining battery level information.
128537cea464d9 Michael Poole 2010-02-06  135   */
128537cea464d9 Michael Poole 2010-02-06  136  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  137  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  138  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  139  
128537cea464d9 Michael Poole 2010-02-06  140  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  141  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  142  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  143  
f0fb164cd2570e Janne Grunau  2021-12-16  144  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  145  	struct {
c04266889b5911 Chase Douglas 2010-06-20  146  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  147  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  148  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  149  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  150  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  151  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  152  		bool scroll_y_active;
f10fcbb3804026 Janne Grunau  2021-12-16  153  	} touches[MAX_CONTACTS];
f10fcbb3804026 Janne Grunau  2021-12-16  154  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  155  
c0dc5582812dfa John Chen     2021-03-30  156  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  157  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  158  	struct timer_list battery_timer;
2991b2ba08b0a2 Janne Grunau  2021-12-16  159  	struct magicmouse_input_ops input_ops;
128537cea464d9 Michael Poole 2010-02-06 @160  };
128537cea464d9 Michael Poole 2010-02-06  161  

:::::: The code at line 160 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
