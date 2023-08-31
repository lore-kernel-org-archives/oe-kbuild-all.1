Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71A8F47
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693477786; x=1725013786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SipwJmOtqnJvw0ydXhyBdVLToCdlxs4SBTZHTWvIqg=;
  b=mW6LYHz7LrvM06USk+kGpWd68Smw/XbRawSiv8ylVJ6APk3CcQNchhoY
   pvFBmC1nGxP8Po68Qv29VdjVSWYhZdsHd2yKKwGJe65Tww3Vi8XB5PEox
   icqRWCNu5OZWMjfGqUh14NfR6nuMHnDxeFjn+JMVdTu9Zd7w3xZz3aiV5
   ERzbA5b1sGhezwct9vq3vXu+phVttDWwg9ucf9XzW95gYeUNLYoVP7a98
   4wQov7RBgjqf1s4yulluius8vLdeAY/sYrSrcem61qekiFBH9PGZKNAlU
   zr2IQWMMLWkqjmBEQOETfEH8s8XnG1GMSPXTYINo3+6JzAsnLctQoC5HC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462267905"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="462267905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804925740"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="804925740"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 03:29:44 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbevm-00002F-2a;
	Thu, 31 Aug 2023 10:29:42 +0000
Date: Thu, 31 Aug 2023 18:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4263/24603]
 drivers/tty/serial/fsl_linflexuart.c:180:13: warning: function
 'linflex_string_write' has internal linkage but is not defined
Message-ID: <202308311850.lP3LW0JR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Larisa,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 093375dfcc1c685b974c21cb9b50f44df4dcf29f [4263/24603] LF-631-7 tty: serial: linflexuart: Add support for FIFO with DMA
config: i386-randconfig-014-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311850.lP3LW0JR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311850.lP3LW0JR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311850.lP3LW0JR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:180:13: warning: function 'linflex_string_write' has internal linkage but is not defined [-Wundefined-internal]
   static void linflex_string_write(struct linflex_port *sport, const char *s,
               ^
   drivers/tty/serial/fsl_linflexuart.c:993:3: note: used here
                   linflex_string_write(sport, "", 1);
                   ^
   1 warning generated.


vim +/linflex_string_write +180 drivers/tty/serial/fsl_linflexuart.c

   176	
   177	/* Forward declare this for the dma callbacks. */
   178	static void linflex_dma_tx_complete(void *arg);
   179	static void linflex_dma_rx_complete(void *arg);
 > 180	static void linflex_string_write(struct linflex_port *sport, const char *s,
   181					 unsigned int count);
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
