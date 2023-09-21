Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84F210B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 16:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695314250; x=1726850250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMZPVC3lMtwrM21Iw9renkeBYIx9RM2W8vsdGOKT1Ls=;
  b=IgYXLrf2W5BIfgnUOyqMmj6OhG/evsj2+yPAH2hZJxX1XauGPiUhO3K7
   s2ysfWRYM5bj0L7LD+Ezk8oSma370RMH0TdrKpln7mHGrWCp9AvNDJsYB
   vFeqvQSQpmU79GhoEHjk9fuxJC0SvQsYZLvBUS2Qc39YgZqPKDHSOW9jx
   wSEByhzOJHhSO0AsSpvMtkoYYxim2Q9Ej0hUgF3Db1X/7sTDQxqd3YwrB
   ThgubS2/YJFahj59tr86ylqd5j+dV7bRCITTitDxfl6NqYCEt6eWskjSN
   IxPE3wmu95T3ed2loKmWNkfK6SNFTWsUDpAW+3Omhrn2yCBWeR8k1cYSL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383333069"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383333069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 09:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696812013"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="696812013"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 09:36:11 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjMev-0000AB-0N;
	Thu, 21 Sep 2023 16:36:09 +0000
Date: Fri, 22 Sep 2023 00:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Kishon <kishon@ti.com>
Subject: [phy:topic/hdmi 2/3]
 drivers/phy/freescale/phy-fsl-imx8mq-dp.c:15:10: fatal error:
 drm/bridge/cdns-mhdp-mailbox.h: No such file or directory
Message-ID: <202309220027.OQmyDay9-lkp@intel.com>
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
commit: a2717f1d7c64660679441c407b96103abb7c4a8c [2/3] phy: freescale: Add DisplayPort PHY driver for i.MX8MQ
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20230922/202309220027.OQmyDay9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220027.OQmyDay9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220027.OQmyDay9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/freescale/phy-fsl-imx8mq-dp.c:15:10: fatal error: drm/bridge/cdns-mhdp-mailbox.h: No such file or directory
      15 | #include <drm/bridge/cdns-mhdp-mailbox.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/phy/freescale/phy-fsl-imx8mq-dp.c

    14	
  > 15	#include <drm/bridge/cdns-mhdp-mailbox.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
