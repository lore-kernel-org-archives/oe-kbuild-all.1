Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69FD8F70
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNU7Hy11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699084494; x=1730620494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+JO6z0nnnTlhsTlNNyF1xUq6sLKZ6Bs6SUetD1WGy3U=;
  b=DNU7Hy11tH4h8RBNgPkI4e6pvPtQxghOQ6GtWsJM4OMzVr6sYaoYe5iP
   H3IycvDK7BWHU9MwcBTJI/ZuBculM/h5z0C/rY9vU/bbNEeqKQ2iTqkAw
   /cKteVpexAQe1maUXTT3Ej9nD6D7dlRFRqPZRSRH/L/umCqiAAQWyF8zs
   XxWwzVTjWpudt69+XLpkzWvPj5Cu28sprsbAu0O65heZc/Yfa3UDKKDS2
   dPxq0LFtEyRgQq15hxz0J5WfyEQFamzAH6EELDCPQChXOZIkS0DYnxETb
   QYq7u1MqD9Zxin/Xv8TP14OdU3jYJU2YkCTsi+6h/4tv58XTYhqwUCKQR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369277848"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369277848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1009039888"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1009039888"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2023 00:54:52 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzBUX-0003eV-2p;
	Sat, 04 Nov 2023 07:54:49 +0000
Date: Sat, 4 Nov 2023 15:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [esmil:visionfive 4/47] drivers/pwm/pwm-ocores.c:56:15: warning: no
 previous prototype for 'starfive_jh71x0_get_ch_base'
Message-ID: <202311041531.pKJqvX8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   f20633e6824b415b4926e353c80e6fe0951a8f0d
commit: 43156700cd388542cde51b6f4d1bbc656e9dff9a [4/47] pwm: opencores: Add PWM driver support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041531.pKJqvX8q-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041531.pKJqvX8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041531.pKJqvX8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-ocores.c:56:15: warning: no previous prototype for 'starfive_jh71x0_get_ch_base' [-Wmissing-prototypes]
      56 | void __iomem *starfive_jh71x0_get_ch_base(void __iomem *base,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/starfive_jh71x0_get_ch_base +56 drivers/pwm/pwm-ocores.c

    55	
  > 56	void __iomem *starfive_jh71x0_get_ch_base(void __iomem *base,
    57						  unsigned int channel)
    58	{
    59		return base + (channel > 3 ? channel % 4 * 0x10 + (1 << 15) : channel * 0x10);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
