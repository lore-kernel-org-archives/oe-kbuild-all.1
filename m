Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8511426C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692128654; x=1723664654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nwk8RvE7OdL2ornbGo4eZatDhCM3ddtdSb5cVESeEs0=;
  b=gwArJbB9ruBVj99kF/dDO77QZYzRc/+dXoLNGZD0uIKLfgqfNLf3Vpul
   o+G6XgF8xZpSzSrjzdEWWF/4sz0JvnWDcRNItoGjH1X6TnaE6dXJjvpbC
   zFT2liwUnwYNSyzgPNkZKTpSvvk3pKXSS0Ln9l9Hi3/nX409M5ItVIHq7
   t/Jzk1v5G4k87ZiniYJlXS8FZW3wXrJH9AR+G5HWFifbsp/IBa2JWfojq
   trz2bda+E0z+h3vXMvpgUjLMEgOPE/l1/Ri0Y1BM9XeVqVkJC84cjp8iV
   YoVTYuZl5w53Dk27JAXK89sqsCeghCkx/LkgYP6MjNKMpIb96v4+j0iw6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376093751"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="376093751"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 12:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737030071"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="737030071"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Aug 2023 12:44:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVzxb-0001CH-0D;
	Tue, 15 Aug 2023 19:44:11 +0000
Date: Wed, 16 Aug 2023 03:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8956/10161] drivers/watchdog/xilinx_wwdt.c:74:
 undefined reference to `__udivdi3'
Message-ID: <202308160339.zgEoGVDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98297fc6ecafc0c7eabc5d869279fb27609fcdc1
commit: f1a43aadb5a690e141a3b6700e2a40c1d4dbe088 [8956/10161] watchdog: Enable COMPILE_TEST for more drivers
config: microblaze-randconfig-r021-20230816 (https://download.01.org/0day-ci/archive/20230816/202308160339.zgEoGVDN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160339.zgEoGVDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160339.zgEoGVDN-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/watchdog/xilinx_wwdt.o: in function `xilinx_wwdt_start':
>> drivers/watchdog/xilinx_wwdt.c:74: undefined reference to `__udivdi3'


vim +74 drivers/watchdog/xilinx_wwdt.c

12984cea1b8c54 Srinivas Neeli 2023-04-20  64  
12984cea1b8c54 Srinivas Neeli 2023-04-20  65  static int xilinx_wwdt_start(struct watchdog_device *wdd)
12984cea1b8c54 Srinivas Neeli 2023-04-20  66  {
12984cea1b8c54 Srinivas Neeli 2023-04-20  67  	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
12984cea1b8c54 Srinivas Neeli 2023-04-20  68  	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
12984cea1b8c54 Srinivas Neeli 2023-04-20  69  	u64 time_out, closed_timeout, open_timeout;
12984cea1b8c54 Srinivas Neeli 2023-04-20  70  	u32 control_status_reg;
12984cea1b8c54 Srinivas Neeli 2023-04-20  71  
12984cea1b8c54 Srinivas Neeli 2023-04-20  72  	/* Calculate timeout count */
12984cea1b8c54 Srinivas Neeli 2023-04-20  73  	time_out = xdev->freq * wdd->timeout;
12984cea1b8c54 Srinivas Neeli 2023-04-20 @74  	closed_timeout = (time_out * xdev->close_percent) / 100;
12984cea1b8c54 Srinivas Neeli 2023-04-20  75  	open_timeout = time_out - closed_timeout;
12984cea1b8c54 Srinivas Neeli 2023-04-20  76  	wdd->min_hw_heartbeat_ms = xdev->close_percent * 10 * wdd->timeout;
12984cea1b8c54 Srinivas Neeli 2023-04-20  77  
12984cea1b8c54 Srinivas Neeli 2023-04-20  78  	spin_lock(&xdev->spinlock);
12984cea1b8c54 Srinivas Neeli 2023-04-20  79  
12984cea1b8c54 Srinivas Neeli 2023-04-20  80  	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  81  	iowrite32(~(u32)XWWDT_ESR_WEN_MASK, xdev->base + XWWDT_ESR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  82  	iowrite32((u32)closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  83  	iowrite32((u32)open_timeout, xdev->base + XWWDT_SWR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  84  
12984cea1b8c54 Srinivas Neeli 2023-04-20  85  	/* Enable the window watchdog timer */
12984cea1b8c54 Srinivas Neeli 2023-04-20  86  	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  87  	control_status_reg |= XWWDT_ESR_WEN_MASK;
12984cea1b8c54 Srinivas Neeli 2023-04-20  88  	iowrite32(control_status_reg, xdev->base + XWWDT_ESR_OFFSET);
12984cea1b8c54 Srinivas Neeli 2023-04-20  89  
12984cea1b8c54 Srinivas Neeli 2023-04-20  90  	spin_unlock(&xdev->spinlock);
12984cea1b8c54 Srinivas Neeli 2023-04-20  91  
12984cea1b8c54 Srinivas Neeli 2023-04-20  92  	dev_dbg(xilinx_wwdt_wdd->parent, "Watchdog Started!\n");
12984cea1b8c54 Srinivas Neeli 2023-04-20  93  
12984cea1b8c54 Srinivas Neeli 2023-04-20  94  	return 0;
12984cea1b8c54 Srinivas Neeli 2023-04-20  95  }
12984cea1b8c54 Srinivas Neeli 2023-04-20  96  

:::::: The code at line 74 was first introduced by commit
:::::: 12984cea1b8c54104f8ac7f5609dfcc0752ad741 watchdog: xilinx_wwdt: Add Versal window watchdog support

:::::: TO: Srinivas Neeli <srinivas.neeli@amd.com>
:::::: CC: Wim Van Sebroeck <wim@linux-watchdog.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
