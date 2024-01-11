Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542039F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQewH9CG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705000597; x=1736536597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEnpVGoa+D1MMtsda5IBvv849V55sBil2HoJcX+wnPE=;
  b=EQewH9CGLT5FuQez4+oHVoetUuJrFk0y63goihMz0i3+SnudDcxCmTpL
   Gl/NhgL3Z+1a5dToMOYmbZ89BPEyicSOl8JoDRTN7l1GVQpxnOMcnTLt0
   SvcKWt4s52QbkaQyK1e8gUhEUFMBhEDqjxtjbWp56AVCzeMMbyzCHT9Ct
   Lg+7jjNE/lfdqtubOXSvo5tHWTLvRxbWrn8e69D5/D8cAk6Mhg62br0VA
   CejVjJhz83hcg1rnS0X5Gum4E052Fi3gmxYRPuXzZVaxlgjxb68eYTvDD
   PeTZDJy2QjS2uF9Z3hj8JHMAyeSvfdv1b5if/JiBl4j9NprobSiEP5toj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389406868"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="389406868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 11:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="782756237"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="782756237"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 11 Jan 2024 11:16:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO0XY-0008eE-2f;
	Thu, 11 Jan 2024 19:16:32 +0000
Date: Fri, 12 Jan 2024 03:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 11930/13245] wx_ethtool.c:undefined reference to
 `phylink_ethtool_nway_reset'
Message-ID: <202401120338.OPOIOZ7T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: e8e138cf7383cf820419fcbec63992e75a01467b [11930/13245] net: libwx: add phylink to libwx
config: loongarch-randconfig-001-20240111 (https://download.01.org/0day-ci/archive/20240112/202401120338.OPOIOZ7T-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120338.OPOIOZ7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120338.OPOIOZ7T-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_nway_reset':
>> wx_ethtool.c:(.text+0x3ac): undefined reference to `phylink_ethtool_nway_reset'
   loongarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_link_ksettings':
>> wx_ethtool.c:(.text+0x3b4): undefined reference to `phylink_ethtool_ksettings_get'
   loongarch64-linux-ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_set_link_ksettings':
>> wx_ethtool.c:(.text+0x3bc): undefined reference to `phylink_ethtool_ksettings_set'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
