Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7817BA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898191; cv=none; b=ONxTk/n1F7VYIjXHy3PaELbhXWl5K0Hit+gkn07UMF5fbtjkOfExCJbhtHoqMH6z/qDuywaWqYEyPTAUA7ydBTX/rIPuYIcsUas4P7OAkGdFISVTF8CESMSmI9AiBfPk3W8f6BGmVAoBdsbcP78spOw0xPIw0WlwKE5diUCCfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898191; c=relaxed/simple;
	bh=yj2mORdWnOblG/yw7PA8WHE4nJzZMnJl73R1P88r/Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T2SJB76XxhfAKm2f4sFyoyqlG5MQWyCdmXqFSxwy2ZqCaf4L4WzRybrD7zAMnLBQIbJCxTNYFItQR62QnzF0wFeG26Nzs7cBIwAlkOQXvfmIunh3O9IVxfHtkDf+e8Dg1L+gl46NDnqUWlmy/o3I2BPmtVMEawNmlmjeuwb8YjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geGOo+Bc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geGOo+Bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898189; x=1797434189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yj2mORdWnOblG/yw7PA8WHE4nJzZMnJl73R1P88r/Ns=;
  b=geGOo+BcmeOXnQc9WBsg+VRnsxdNmUyXVRdTYd3Y1Uihy5RlzXkAUZZe
   3tF0h6ZQHw2V5ARU08lKOzdIinfeZtlMX4hgnXUSBCFTmruTlv85JS8QI
   Mvpjslo8w9SMB//vax68f4wGOAEfKHzyConpbHKKJGtdmZrdT06Sthf8q
   8/dzl7fa4AVQSlM46cBACV3EkXPwyeKsIRjg9lBy0Lxqcfhz/xraqFvLP
   rZXdtsDvGm6ReaOaYyhtolJblS6K7I79m/SKDUg1/Vu6lbFnotG0y7NGL
   5/iKQXQO/0AzMTz0pH62y0y3x2rzvXKinKwBs46tFXXp5ahZV0vJ78IuD
   w==;
X-CSE-ConnectionGUID: ZGZqMRVdQHOUMJ0x8K4wcw==
X-CSE-MsgGUID: J+AD3HKRQua4oNHKlHLxZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85408152"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="85408152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:16:28 -0800
X-CSE-ConnectionGUID: 6cnmjmu2ShOpXVxhlxdHZQ==
X-CSE-MsgGUID: 4dbzk9gcSVOJVTl6H/+DLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202537779"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 07:16:26 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWmX-000000003Qa-23Kq;
	Tue, 16 Dec 2025 15:16:13 +0000
Date: Tue, 16 Dec 2025 23:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member
 'clk' not described in 'sg2042_pwm_ddata'
Message-ID: <202512162305.ZNb2KkF9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 10e95f1093985110d9a0b157a1d8500ba6ce3019 [11/11] anolis:bugfix: pwm: SG2042: Adapt for Linux 6.6
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512162305.ZNb2KkF9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162305.ZNb2KkF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162305.ZNb2KkF9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member 'chip' not described in 'sg2042_pwm_ddata'
>> drivers/pwm/pwm-sophgo-sg2042.c:56: warning: Function parameter or member 'clk' not described in 'sg2042_pwm_ddata'


vim +56 drivers/pwm/pwm-sophgo-sg2042.c

7de18b46d6f204 Chen Wang 2025-02-05  45  
7de18b46d6f204 Chen Wang 2025-02-05  46  /**
7de18b46d6f204 Chen Wang 2025-02-05  47   * struct sg2042_pwm_ddata - private driver data
7de18b46d6f204 Chen Wang 2025-02-05  48   * @base:		base address of mapped PWM registers
7de18b46d6f204 Chen Wang 2025-02-05  49   * @clk_rate_hz:	rate of base clock in HZ
7de18b46d6f204 Chen Wang 2025-02-05  50   */
7de18b46d6f204 Chen Wang 2025-02-05  51  struct sg2042_pwm_ddata {
10e95f10939851 Yao Zi    2025-05-01  52  	struct pwm_chip chip;
7de18b46d6f204 Chen Wang 2025-02-05  53  	void __iomem *base;
7de18b46d6f204 Chen Wang 2025-02-05  54  	unsigned long clk_rate_hz;
10e95f10939851 Yao Zi    2025-05-01  55  	struct clk *clk;
7de18b46d6f204 Chen Wang 2025-02-05 @56  };
7de18b46d6f204 Chen Wang 2025-02-05  57  

:::::: The code at line 56 was first introduced by commit
:::::: 7de18b46d6f204cbd496cdad00d044e2375bab34 pwm: sophgo: add driver for Sophgo SG2042 PWM

:::::: TO: Chen Wang <unicorn_wang@outlook.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
