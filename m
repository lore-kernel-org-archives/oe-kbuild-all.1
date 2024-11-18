Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2938B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731889059; cv=none; b=d/YbohkBzBoGM3GJL84nPD+JA1FaudbOi5i9pqXBjpRTn6v6H1/npmLfNKb9J6Vkjb7qauKdWkwumInUU1As4FOTPHTxK+y3zqtLGCNHTqzKxOuixhFiBS7E3Osu3q889F8IuBval01XV9R5KhXgmmy855lJBwvANhwEwe6FniU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731889059; c=relaxed/simple;
	bh=mqBqTJMBhlCQFmuNFbo9ChxR+6xD/YznscN2LGn1LHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GK3bT7rm6WcVWiWLGmr2PFCwqeqUfzsrVody/XZLL0GujEOdsrmGhwa++4f/1LlDNvP/KZmGXeN/TsrfyP4WzM8fqonQ3Dt6LU7+Xgi1Q4RXukRlMAa2wQ56d/2wA8dz1UZPzRAzibBdTUUOSmJfIj6SnpODjGFJj9fobGBvB+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnveYq3J; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnveYq3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731889057; x=1763425057;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mqBqTJMBhlCQFmuNFbo9ChxR+6xD/YznscN2LGn1LHs=;
  b=SnveYq3JMNzMvYA6vm++2LLBjHktUABuvXAVPwYdz5ZHKq8hNv1bBHJJ
   qIRsmYDSgiuOqc+6GLpZL4ofDnjlfGYQUP2HhzQzR87bZ8lNjHSYfbq3R
   2wDQkh6gyEXG3oD3yrgmEdmfc2c7GoRndYac+83Lh3t5ohOX39Fyh5CxA
   9iqiBdI3HXFp8stFNql0iSn5KvSdeo5T+WA/gyJnqrLfX4Vs3Mim8bp+N
   VI8Gq8cKuo0HQqbPi7IUSUSWslEmEIrrN1ERQJ+YbnD2zg3ijuaqOinCo
   a9any7/J7o5jdK41qQ3sMlQviyNiUjySS0qMdxKo7vaSbD/A4pvfVHKx9
   Q==;
X-CSE-ConnectionGUID: W15PlNr0TVSq712oZb5MKw==
X-CSE-MsgGUID: 2DXlww0gRUSqeeJ4WkoUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35747080"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="35747080"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:17:36 -0800
X-CSE-ConnectionGUID: vx91M8YYS4i17VGwVveS9A==
X-CSE-MsgGUID: sa5sJZD3QzuA9+6/Q+1eIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89076423"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2024 16:17:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpSP-000293-0L;
	Mon, 18 Nov 2024 00:17:33 +0000
Date: Mon, 18 Nov 2024 08:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 6/28] drivers/hid/hid-magicmouse.c:152:
 warning: Function parameter or struct member 'pos' not described in
 'magicmouse_sc'
Message-ID: <202411180818.Mm6Fk0oc-lkp@intel.com>
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
commit: f0fb164cd2570e364884facb9d0e44bab4c1b0a4 [6/28] HID: magicmouse: use struct input_mt_pos for X/Y
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241118/202411180818.Mm6Fk0oc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180818.Mm6Fk0oc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180818.Mm6Fk0oc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-magicmouse.c:152: warning: Function parameter or struct member 'pos' not described in 'magicmouse_sc'


vim +152 drivers/hid/hid-magicmouse.c

4f6fdf08681cec Chase Douglas 2011-08-05   93  
4f6fdf08681cec Chase Douglas 2011-08-05   94  #define TRACKPAD_DIMENSION_X (float)13000
4f6fdf08681cec Chase Douglas 2011-08-05   95  #define TRACKPAD_MIN_X -2909
4f6fdf08681cec Chase Douglas 2011-08-05   96  #define TRACKPAD_MAX_X 3167
4f6fdf08681cec Chase Douglas 2011-08-05   97  #define TRACKPAD_RES_X \
4f6fdf08681cec Chase Douglas 2011-08-05   98  	((TRACKPAD_MAX_X - TRACKPAD_MIN_X) / (TRACKPAD_DIMENSION_X / 100))
4f6fdf08681cec Chase Douglas 2011-08-05   99  #define TRACKPAD_DIMENSION_Y (float)11000
4f6fdf08681cec Chase Douglas 2011-08-05  100  #define TRACKPAD_MIN_Y -2456
4f6fdf08681cec Chase Douglas 2011-08-05  101  #define TRACKPAD_MAX_Y 2565
4f6fdf08681cec Chase Douglas 2011-08-05  102  #define TRACKPAD_RES_Y \
4f6fdf08681cec Chase Douglas 2011-08-05  103  	((TRACKPAD_MAX_Y - TRACKPAD_MIN_Y) / (TRACKPAD_DIMENSION_Y / 100))
4f6fdf08681cec Chase Douglas 2011-08-05  104  
9d7b18668956c4 Sean O'Brien  2018-10-02  105  #define TRACKPAD2_DIMENSION_X (float)16000
9d7b18668956c4 Sean O'Brien  2018-10-02  106  #define TRACKPAD2_MIN_X -3678
9d7b18668956c4 Sean O'Brien  2018-10-02  107  #define TRACKPAD2_MAX_X 3934
9d7b18668956c4 Sean O'Brien  2018-10-02  108  #define TRACKPAD2_RES_X \
9d7b18668956c4 Sean O'Brien  2018-10-02  109  	((TRACKPAD2_MAX_X - TRACKPAD2_MIN_X) / (TRACKPAD2_DIMENSION_X / 100))
9d7b18668956c4 Sean O'Brien  2018-10-02  110  #define TRACKPAD2_DIMENSION_Y (float)11490
9d7b18668956c4 Sean O'Brien  2018-10-02  111  #define TRACKPAD2_MIN_Y -2478
9d7b18668956c4 Sean O'Brien  2018-10-02  112  #define TRACKPAD2_MAX_Y 2587
9d7b18668956c4 Sean O'Brien  2018-10-02  113  #define TRACKPAD2_RES_Y \
9d7b18668956c4 Sean O'Brien  2018-10-02  114  	((TRACKPAD2_MAX_Y - TRACKPAD2_MIN_Y) / (TRACKPAD2_DIMENSION_Y / 100))
9d7b18668956c4 Sean O'Brien  2018-10-02  115  
128537cea464d9 Michael Poole 2010-02-06  116  /**
128537cea464d9 Michael Poole 2010-02-06  117   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  118   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  119   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  120   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  121   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  122   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  123   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  124   * @tracking_ids: Mapping of current touch input data to @touches.
b0a1fe4610de57 Jiri Kosina   2023-12-27  125   * @hdev: Pointer to the underlying HID device.
b0a1fe4610de57 Jiri Kosina   2023-12-27  126   * @work: Workqueue to handle initialization retry for quirky devices.
b0a1fe4610de57 Jiri Kosina   2023-12-27  127   * @battery_timer: Timer for obtaining battery level information.
128537cea464d9 Michael Poole 2010-02-06  128   */
128537cea464d9 Michael Poole 2010-02-06  129  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  130  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  131  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  132  
128537cea464d9 Michael Poole 2010-02-06  133  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  134  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  135  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  136  
f0fb164cd2570e Janne Grunau  2021-12-16  137  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  138  	struct {
c04266889b5911 Chase Douglas 2010-06-20  139  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  140  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  141  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  142  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  143  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  144  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  145  		bool scroll_y_active;
f10fcbb3804026 Janne Grunau  2021-12-16  146  	} touches[MAX_CONTACTS];
f10fcbb3804026 Janne Grunau  2021-12-16  147  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  148  
c0dc5582812dfa John Chen     2021-03-30  149  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  150  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  151  	struct timer_list battery_timer;
128537cea464d9 Michael Poole 2010-02-06 @152  };
128537cea464d9 Michael Poole 2010-02-06  153  

:::::: The code at line 152 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
