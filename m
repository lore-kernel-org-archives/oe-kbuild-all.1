Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131426;
	b=unJjQLwaUhijBYaRRO+2uSwz8tgsf+3PWr6QQ/295L2fiiMyO97duO0+AVXbEDdK9cMD
	 TQKdLUbcBdbTQQMCKkQ9XeTuA4lHk6f6M+++zg5PXYqOupm7lQqUaZvDR5OWpCVki0DAo
	 8P9XuwtSAgMH98Fn1tHAwfA47k+wfKaeBRvODbmE/76HLpXp9YWPRiItZqDyUgX4t5teJ
	 DPsoKqzkT1CIirV483EJElbyIUWHETrQ/8beuXT2SPFM2zA1MB198GhMthguU/jx9Sfyd
	 TZIRSy5/0G6eGcJ+Pyjk1rlo27q1zmmzt/9Z6s4ViRQ8zk122k7hb0MxPtz/yfbtJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131426;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zI1LtDdMCHtcuHQCYhcbyED5/mQEBKDbhEXb83l5fYI=;
	b=Xv1soSsKviL+8ESU197rlFHAH7AvIwmtPusn3on90OVqkAQCTFZW/8AjcQtwY6BWAN1+
	 vuWxprh8M93apc06SKaH1ZC+El18bfiUP/vMPU1CfdkTf7XevGaDL7nGkHTAI7fhhPfLp
	 YmIqb+XNXn3hzjuwMY9rxKlJurR2f5pscygKSdRe0E6YIll2Txy1dRkk20imp8cdK3a6A
	 fd7/r2btjtY2ifg+WNZ/p9cGNEGtmYNUisWX5OQGvZoEZJTpo8g9IehGSp83Wk7M1wzYI
	 wl26dY/y8Qv4Y4YZJQwOTpjMo8FLXcHJ4S9FGSoxmgFiONVv5LJQGoYPZf6ckViJMKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=enjC3vl+;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8009D606A31F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 20:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8009D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=enjC3vl+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793131426; x=1824667426;
  h=date:from:to:cc:subject:message-id;
  bh=gkwdKQZ8NyLJLfXg5tsrNeW8YNCrNkSIjFEBgo3mCHQ=;
  b=enjC3vl+lmUpfMkrZUq4yBeIBXvhpyEXavUlg58fNWF96ywZxdNIIC+y
   yqwCBAv5VPYEmEDUXPNtflXEtxXLglgAaxQGHjulnVAmug2qBvZ1Of7tV
   E4bGGn3LFnvTbx7sjxaTCasVzpPM5ZukrAuVorPxcX0X55up5aIYdLNQr
   EVcg+HNIbrkM2XqVSl+Ktx75U0Xx3RHSMVlh9dVeENBD7eZCYyNrsB0Zj
   0STtsBAFmQ/CeyQ8/ux/ixmz/OoFcyq6d5qFSoMHnJFSIf0/SNEpBPM8T
   r/w8XRJxBFheUhml3nj9FSx2+h8fdldprX1D5oz284OSGYpaJLz4HzXHE
   Q==;
X-CSE-ConnectionGUID: vQavHedWRqqt8nm9lY9ZjQ==
X-CSE-MsgGUID: mKciohfaQoelFRTVklaL3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1872261"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1872261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:03:44 -0700
X-CSE-ConnectionGUID: tMGarHfBTQmZyg9nzR9T5w==
X-CSE-MsgGUID: nOZkb9HCRWOuiVSstT96yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4983928"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Oct 2026 13:03:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLnOV-000000004bx-3743;
	Tue, 27 Oct 2026 20:03:39 +0000
Date: Tue, 27 Oct 2026 21:03:23 +0100
From: kernel test robot <lkp@intel.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: drivers/rtc/rtc-m41t93.c:496: undefined reference to
 `devm_watchdog_register_device'
Message-ID: <202610272125.Me30O4PA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   83f32c773255720a661aa45d83e36278135f23f5
commit: 15ec2ce19962b61576c8bf25bc129fc61a653c2e rtc: m41t93: Add watchdog support
date:   4 months ago
config: powerpc64-randconfig-r2109-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272125.Me30O4PA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272125.Me30O4PA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 15ec2ce19962 ("rtc: m41t93: Add watchdog support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272125.Me30O4PA-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/rtc/rtc-m41t93.o: in function `m41t93_probe':
>> drivers/rtc/rtc-m41t93.c:496: undefined reference to `devm_watchdog_register_device'


vim +496 drivers/rtc/rtc-m41t93.c

   481	
   482	static int m41t93_watchdog_register(struct device *dev, struct m41t93_data *m41t93)
   483	{
   484		int ret;
   485	
   486		m41t93->wdd.parent = dev;
   487		m41t93->wdd.info = &m41t93_wdt_info;
   488		m41t93->wdd.ops = &m41t93_watchdog_ops;
   489		m41t93->wdd.min_timeout = 0;
   490		m41t93->wdd.max_timeout = 10;
   491		m41t93->wdd.timeout = 3; /* Default timeout is 3 sec */
   492		m41t93->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
   493	
   494		watchdog_set_drvdata(&m41t93->wdd, m41t93);
   495	
 > 496		ret = devm_watchdog_register_device(dev, &m41t93->wdd);
   497		if (ret) {
   498			dev_warn(dev, "Failed to register watchdog\n");
   499			return ret;
   500		}
   501	
   502		/* Disable watchdog at start */
   503		ret = m41t93_wdt_stop(&m41t93->wdd);
   504	
   505		return ret;
   506	}
   507	#endif
   508	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
