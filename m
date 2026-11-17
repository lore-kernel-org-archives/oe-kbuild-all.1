Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940396;
	b=HXoLw0q9aoD3KAFORAEPSvBAkV5rGVTexwLPkJETp3gCHWbMTzwb1urpIJHBzIzHZH6n
	 a60MACExpfuUVkaqhAAVEM0Sjh3uZ7OWf2rLckUOhxWOcHJTLv9Um4Dbp6D7Oc5tPJFO/
	 MsrFRwO7v6K+obvEdTw6+aPyMpbefF8G6Lqd0O0SUZhwEd7z09sNRFWfQBPRFXnsTV7NT
	 xpqDg4Ap8+wS4CN0XBeQetNALQk6n52LpwC+jHmVDsTPZbWbOzymJgNNhiORBOzmZTYJo
	 y8UzsuTpsCNgSwdc2NWJIB4FdZESWJGl+Td+jar58vJDI4v1JAzuTcEMh5f8ve7yN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940396;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6F+XQOU1EJbJn540EhCAIPbGVlgxeJw/+LsNkc3bwt8=;
	b=BdaqHEBmRP8ovgaqRzWVTCJgv4Lf6jFQ7LLPpPnTzxI8CwWKoyArUQ+eobkUWvX/TyPn
	 nbVnMsEVvylq9nkAKh86etOKbmNndk+Rwd9+8M+P7L6t7piBP1HyAqwjGCKbQnEykTNPB
	 kwt46wXkXGEloHYWFuZPp2Dt1HcFCk8rmM7O3Yb2TpgWXV0s4ACJcCKQ3I8HuW549C/mF
	 qtOoMOZbW9sYxbEiCuRfOfRVpoc3hpkR4wM9c7mH0FrwCpRX9rcVcY1jPtReci5I9LqpL
	 SMECDjje33dtziGmgCnSAA027EglmrqK33xjUTYEdDjHs3hET6GvOvhElKOVZ0g33VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cz1FLvUY;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D52606A336
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 18:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D52606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cz1FLvUY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794940396; x=1826476396;
  h=date:from:to:cc:subject:message-id;
  bh=e9Wj6tq234oRUwG9/4Lkfh+knV340iU+t3YHKYB9rbc=;
  b=Cz1FLvUYfIrVHegniWzIKsbQT6WPQKl2Y48O3g/pwSDvD7OLh+r41Cuw
   XPtt5GpsOOxf17x3cRQCGeh0U5T5xJo8rPlCwghpGx+Z9TYsXL20yOjSb
   5BZNcWhGH1h8CDz8NdmYx+RswiaHuuD/oSXyuwVYbj6FOcdXXkY9UnYyt
   TIhjccq7L2bCSDb0Xu4tJ5ez8OuFMpgekl2earMsQNIkfo4rw//0UoS8w
   EyS+dw/nk4znHIlg6c+mPEnuaKYb08wk6wWPbjyHtl8BygFIYniBUSFiO
   2YHs+xKPYC+qGVg9JMCPPq3pH2ZLdX0d6QzmKyqlYVQTecz3Iw8RVZGIb
   Q==;
X-CSE-ConnectionGUID: ygUnc3YLSiOskU/wlMjpNA==
X-CSE-MsgGUID: LBUQMclFQjGoefI95d/XMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3625813"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3625813"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 10:33:16 -0800
X-CSE-ConnectionGUID: HL4d8cFDSV+9hWjpIvOQdw==
X-CSE-MsgGUID: heljkVBRToiN3FWKhpVMmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10274838"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 10:33:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTNzU-000000003BG-0Ew5;
	Tue, 17 Nov 2026 18:33:12 +0000
Date: Tue, 17 Nov 2026 19:33:11 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 13/13]
 drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <20261117192448.YVgYISDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   da36a96147d782be90d8143f05fb6d04535ca87a
commit: 88d92cffc9d9c8807d9a6aaa8a5235494636fc86 [13/13] usb: cdnsp: Fix issue with resuming from L1
config: x86_64-randconfig-r2300-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117192448.YVgYISDS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117192448.YVgYISDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117192448.YVgYISDS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/cdnsp-gadget.c:156:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     expected unsigned int val
   drivers/usb/cdns3/cdnsp-gadget.c:158:16: sparse:     got restricted __le32 [usertype]

vim +158 drivers/usb/cdns3/cdnsp-gadget.c

   140	
   141	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   142	{
   143		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   144		__le32 __iomem *reg;
   145		void __iomem *base;
   146		u32 offset = 0;
   147		u32 val;
   148	
   149		if (!cdns->override_apb_timeout)
   150			return;
   151	
   152		base = &pdev->cap_regs->hc_capbase;
   153		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   154		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   155	
 > 156		val  = le32_to_cpu(readl(reg));
   157		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
 > 158		writel(cpu_to_le32(val), reg);
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
