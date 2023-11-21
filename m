Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC0618650
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzA5ylhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533910; x=1732069910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=baLNOK6OWoB6I0nKO7Av6CpZRL/Nkzz/JGpYp4rey/A=;
  b=XzA5ylhMzrmJqalUrTMpg0mgy0/NYzA5XmV+IqAklFNuuFPZmvBxN0f7
   3vp5U9tdLMZE/6QH/27A9I77W6sca1A5TwoW3wHEMJjHXnxDf/jdhhMKI
   ZsYaDZapv2MnXvM1463QPZhxSXdruU7HL2XQuxWRWxE2Ju923BizcBtBi
   MXiwwK7KdZEqaMIOcLd41c41jXMGtLivc5OHlQjomFiMVowsQW/lf5Clf
   cGZwmhRLDQStLNqvZqvPfsoE3ckSRxRx1M0ISS+pr4Ul6KhNL8ecJLQcJ
   lNAdXkKUUHzqcAl23kj6fJ6KUTgWYmWr7uY2upYrf37dzVPyKsvT/cKjd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090756"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090756"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959086"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959086"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:31:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GYB-0007C0-1L;
	Tue, 21 Nov 2023 02:31:43 +0000
Date: Tue, 21 Nov 2023 10:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: drivers/usb/gadget/function/f_uac1_legacy.c:1: warning: no
 structured comments found
Message-ID: <202311211052.RsFuk4Gr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ruslan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: d355339eecd986648420e05f8c958fbc78dbb382 usb: gadget: function: make current f_uac1 implementation legacy
date:   6 years ago
config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231121/202311211052.RsFuk4Gr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211052.RsFuk4Gr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211052.RsFuk4Gr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac1_legacy.c:1: warning: no structured comments found
--
>> drivers/usb/gadget/function/u_uac1_legacy.c:33: warning: No description found for parameter 'i'
>> drivers/usb/gadget/function/u_uac1_legacy.c:33: warning: No description found for parameter 'val'
>> drivers/usb/gadget/function/u_uac1_legacy.c:96: warning: No description found for parameter 'snd'
>> drivers/usb/gadget/function/u_uac1_legacy.c:156: warning: No description found for parameter 'card'
>> drivers/usb/gadget/function/u_uac1_legacy.c:156: warning: No description found for parameter 'buf'
>> drivers/usb/gadget/function/u_uac1_legacy.c:156: warning: No description found for parameter 'count'
   drivers/usb/gadget/function/u_uac1_legacy.c:205: warning: No description found for parameter 'card'
>> drivers/usb/gadget/function/u_uac1_legacy.c:265: warning: No description found for parameter 'gau'
   drivers/usb/gadget/function/u_uac1_legacy.c:294: warning: No description found for parameter 'card'
>> drivers/usb/gadget/function/u_uac1_legacy.c:311: warning: No description found for parameter 'the_card'


vim +1 drivers/usb/gadget/function/f_uac1_legacy.c

c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03  @1  /*
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   2   * f_audio.c -- USB Audio class function driver
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   3    *
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   4   * Copyright (C) 2008 Bryan Wu <cooloney@kernel.org>
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   5   * Copyright (C) 2008 Analog Devices, Inc
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   6   *
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   7   * Enter bugs at http://blackfin.uclinux.org/
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   8   *
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03   9   * Licensed under the GPL-2 or later.
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03  10   */
c6994e6f067cf0 drivers/usb/gadget/f_audio.c Bryan Wu 2009-06-03  11  

:::::: The code at line 1 was first introduced by commit
:::::: c6994e6f067cf0fc4c6cca3d164018b1150916f8 USB: gadget: add USB Audio Gadget driver

:::::: TO: Bryan Wu <cooloney@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
