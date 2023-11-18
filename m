Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517CAD281
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 04:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5Pa6dAR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700283316; x=1731819316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnzhhPFQMAqOzcaIfE+pOhJWAozFyIPf/vEW+mgDqXQ=;
  b=A5Pa6dARCmannrCdlwCddNeOv3ZzAIx3HmmsmdkPzRQubzCZ8AY+egVb
   WEIc9OberIRCO0Fpm+PreyNybiGw1vVb8A3r9X4VEu/imOjYEnHWA2mlz
   04RLapMJWgxJm30LTgyf74x2W1erQC3RuZMkdonFxVAZ2bBZZzAjENkLG
   Z9X5ekY4vABGxjtmn/GSNtWvwnUQFRuAkI1A8Op8kJhmoQnaADPq39veL
   Pp0cxMGsbYwjp5CuagXuuDaRXQfh2y1P8+Mi7gxD9ocSihXTD+qLr1p3F
   KjUUCHqI2UUsukRtPyrA93tBOiD1YmicQZxVKuqwyO8fRm9gF1Dpa4X1N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="381793954"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="381793954"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 20:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889435068"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="889435068"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2023 20:55:14 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DMO-0003Wd-2I;
	Sat, 18 Nov 2023 04:55:12 +0000
Date: Sat, 18 Nov 2023 12:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v2 04/10] net: sfp: Add helper to return the
 SFP bus name
Message-ID: <202311181214.uTtjF2ku-lkp@intel.com>
References: <20231117162323.626979-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117162323.626979-5-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231117-234210
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231117162323.626979-5-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v2 04/10] net: sfp: Add helper to return the SFP bus name
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231118/202311181214.uTtjF2ku-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181214.uTtjF2ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181214.uTtjF2ku-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ethtool/ioctl.c:23:
>> include/linux/sfp.h:653:20: warning: 'sfp_get_name' defined but not used [-Wunused-function]
     653 | static const char *sfp_get_name(struct sfp_bus *bus)
         |                    ^~~~~~~~~~~~


vim +/sfp_get_name +653 include/linux/sfp.h

   652	
 > 653	static const char *sfp_get_name(struct sfp_bus *bus)
   654	{
   655		return NULL;
   656	}
   657	#endif
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
