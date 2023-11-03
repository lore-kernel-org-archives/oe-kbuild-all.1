Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B907E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 06:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diOSISzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698993367; x=1730529367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1KkjaiUnZoJPlarKcJLP6wvtdrqVQAO8YpFOtBuHv24=;
  b=diOSISzxyClBLSxmb9v7rCiE8UZHO+62pem0dltDDXQDbRABaHEmw8OA
   yfHuZ/9AjwUVK9HM/rOnsbcvUGYC5Lyw/A8Y3GQqklsYL8ZQa7UCjwAic
   Z7YpMv8rrpPjmG3gxxS42GFa9+JjsaO4xuBfvopKIAN0loB/FTe5gaTrC
   eEFL4KFsauwLfv702+R9W/3iOXtjpix6klBjZ2iKvAvJgUJ5KaHJ2nYp6
   vAOvse+46vAJmu4UFICYm/D9I46yRRMGG9bHgkgI2wEGEhUNq8uPgLFW8
   aCE2bEBTkywJfgNjOS03JvoNtHbF6xhautYBsvZHluyogtodaYNDPPIVM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1765914"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1765914"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 23:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="878542658"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="878542658"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2023 23:36:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qynml-0002JI-14;
	Fri, 03 Nov 2023 06:36:03 +0000
Date: Fri, 3 Nov 2023 14:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 7/21] drivers/hid/hid-magicmouse.c:157:
 warning: Function parameter or member 'input_ops' not described in
 'magicmouse_sc'
Message-ID: <202311031457.l002ABA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   aefaf432ff80e54092c35dcba09404239f181de6
commit: 991d9692ce457f94c749787fbf2d2f2bd8bb7bf1 [7/21] HID: magicmouse: use ops function pointers for input functionality
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311031457.l002ABA4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031457.l002ABA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031457.l002ABA4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'battery_timer' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:157: warning: Function parameter or member 'input_ops' not described in 'magicmouse_sc'


vim +157 drivers/hid/hid-magicmouse.c

991d9692ce457f Janne Grunau  2021-12-16  122  
128537cea464d9 Michael Poole 2010-02-06  123  /**
128537cea464d9 Michael Poole 2010-02-06  124   * struct magicmouse_sc - Tracks Magic Mouse-specific data.
128537cea464d9 Michael Poole 2010-02-06  125   * @input: Input device through which we report events.
128537cea464d9 Michael Poole 2010-02-06  126   * @quirks: Currently unused.
128537cea464d9 Michael Poole 2010-02-06  127   * @ntouches: Number of touches in most recent touch report.
128537cea464d9 Michael Poole 2010-02-06  128   * @scroll_accel: Number of consecutive scroll motions.
128537cea464d9 Michael Poole 2010-02-06  129   * @scroll_jiffies: Time of last scroll motion.
128537cea464d9 Michael Poole 2010-02-06  130   * @touches: Most recent data for a touch, indexed by tracking ID.
128537cea464d9 Michael Poole 2010-02-06  131   * @tracking_ids: Mapping of current touch input data to @touches.
128537cea464d9 Michael Poole 2010-02-06  132   */
128537cea464d9 Michael Poole 2010-02-06  133  struct magicmouse_sc {
128537cea464d9 Michael Poole 2010-02-06  134  	struct input_dev *input;
128537cea464d9 Michael Poole 2010-02-06  135  	unsigned long quirks;
128537cea464d9 Michael Poole 2010-02-06  136  
128537cea464d9 Michael Poole 2010-02-06  137  	int ntouches;
128537cea464d9 Michael Poole 2010-02-06  138  	int scroll_accel;
128537cea464d9 Michael Poole 2010-02-06  139  	unsigned long scroll_jiffies;
128537cea464d9 Michael Poole 2010-02-06  140  
089b2bcdbc5e12 Janne Grunau  2021-12-16  141  	struct input_mt_pos pos[MAX_CONTACTS];
128537cea464d9 Michael Poole 2010-02-06  142  	struct {
c04266889b5911 Chase Douglas 2010-06-20  143  		short scroll_x;
128537cea464d9 Michael Poole 2010-02-06  144  		short scroll_y;
d4b9f10a0eb64c José Expósito 2021-07-07  145  		short scroll_x_hr;
d4b9f10a0eb64c José Expósito 2021-07-07  146  		short scroll_y_hr;
128537cea464d9 Michael Poole 2010-02-06  147  		u8 size;
9d60648c607a2b José Expósito 2021-07-07  148  		bool scroll_x_active;
9d60648c607a2b José Expósito 2021-07-07  149  		bool scroll_y_active;
8aff5a2106ccfe Janne Grunau  2021-12-16  150  	} touches[MAX_CONTACTS];
8aff5a2106ccfe Janne Grunau  2021-12-16  151  	int tracking_ids[MAX_CONTACTS];
c0dc5582812dfa John Chen     2021-03-30  152  
c0dc5582812dfa John Chen     2021-03-30  153  	struct hid_device *hdev;
c0dc5582812dfa John Chen     2021-03-30  154  	struct delayed_work work;
0b91b4e4dae63c José Expósito 2021-11-18  155  	struct timer_list battery_timer;
991d9692ce457f Janne Grunau  2021-12-16  156  	struct magicmouse_input_ops input_ops;
128537cea464d9 Michael Poole 2010-02-06 @157  };
128537cea464d9 Michael Poole 2010-02-06  158  

:::::: The code at line 157 was first introduced by commit
:::::: 128537cea464d919febeaea2000e256749f317eb HID: add a device driver for the Apple Magic Mouse.

:::::: TO: Michael Poole <mdpoole@troilus.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
