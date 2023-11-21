Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454296FCE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJ2UtmDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700601187; x=1732137187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjJ553Y+4myjUDZDcFzbklN6xBWg/BjAN5ZYJ8061jg=;
  b=FJ2UtmDCmlv7y1kGY+YSw9ZAX8d/0uCHpeLKQM0lp6FjdvPUOBQrv3yc
   irfpO4LEW6TDkE4FQNtVZ63t4xMZfRSzx2DZrfzbVE8hIosZDD1wO7rrF
   +EHCQPipOlaVXw4PIU64l3WGVL97WPP72VeFL/p1o2YOTGR3JMboFGX4K
   ecP09+4YQevloNxQ7uyQYTTt4XaB6Q7Zfr+Svg6FtzcNqVQj+ocNzqZcF
   /YmojdNeLBwAKtVCdhdShbA06YgDoRnipOy95hcCcSzUJ9Waq7UPhPklX
   obbOfzcEUhccyGhlGYBnTSwCQwNfW8vdnV5I7WCmHKtHNPET9lwofwMrs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="456263881"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="456263881"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 13:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884332583"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="884332583"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 13:13:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Y3K-0008Fq-1I;
	Tue, 21 Nov 2023 21:13:02 +0000
Date: Wed, 22 Nov 2023 05:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/pinctrl/pinctrl-mcp23s08.c:1: warning: no structured
 comments found
Message-ID: <202311220421.xKye7ZRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: d8f4494e70ae5fef159719bfbb6abedc53619bf1 pinctrl: mcp23s08: drop comment about missing irq support
date:   7 years ago
config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231122/202311220421.xKye7ZRO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220421.xKye7ZRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220421.xKye7ZRO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-mcp23s08.c: In function 'mcp_pinconf_set':
   drivers/pinctrl/pinctrl-mcp23s08.c:282:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     u16 val;
         ^~~
   drivers/pinctrl/pinctrl-mcp23s08.c:281:11: warning: variable 'mask' set but not used [-Wunused-but-set-variable]
     u32 arg, mask;
              ^~~~
>> drivers/pinctrl/pinctrl-mcp23s08.c:1: warning: no structured comments found


vim +1 drivers/pinctrl/pinctrl-mcp23s08.c

   > 1	/* MCP23S08 SPI/I2C GPIO driver */
     2	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
