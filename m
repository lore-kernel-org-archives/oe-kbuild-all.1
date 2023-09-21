Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC14998C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695318650; x=1726854650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYVsv55c8OXhXdNVXuuPOuN94vGJP7bhYZfDI3pR+uU=;
  b=N/UXTbgyoov1EVih1ucPbuflVO2fNBs8IwqO6OjwVwiWQo4QDhYjNhxN
   erVNo2Xo9x4Rpb61YNqGetcxTQ2v/RaC6E9i9yWmY5s6D1uEhsCM3ncB+
   OKPGrXCIsvKy7mdamak0rgVUIeSPjviJNFzmIWM5iNmwLrGt/XLOLCMzW
   lWp644pbS2o9IZdnb6NsYn5gxVukUYAG12pUeRKc1QjtrZsfpFgSGtre1
   ELlX149IXAkOohvoraVbX4ewbJo7vpfzPAGfgI9nqk3/bONskAvPX6X+P
   KsRfiHBmlsN4QsySruNF7Ysr8yB3L1K51EePETOrAk2PWSNgau0Bn3fFr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="444717437"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="444717437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 10:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="920832792"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="920832792"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Sep 2023 10:50:48 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjNp8-0000DP-03;
	Thu, 21 Sep 2023 17:50:46 +0000
Date: Fri, 22 Sep 2023 01:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: [phy:topic/hdmi 3/3]
 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c:14:10: fatal error:
 drm/bridge/cdns-mhdp-mailbox.h: No such file or directory
Message-ID: <202309220126.WiL0hW74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git topic/hdmi
head:   8e36091a94d2d28e8dccb9bfda081b2e42e951ae
commit: 8e36091a94d2d28e8dccb9bfda081b2e42e951ae [3/3] phy: freescale: Add HDMI PHY driver for i.MX8MQ
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230922/202309220126.WiL0hW74-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220126.WiL0hW74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220126.WiL0hW74-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c:14:10: fatal error: drm/bridge/cdns-mhdp-mailbox.h: No such file or directory
      14 | #include <drm/bridge/cdns-mhdp-mailbox.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c

    13	
  > 14	#include <drm/bridge/cdns-mhdp-mailbox.h>
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
