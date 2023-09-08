Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB830FA9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694211755; x=1725747755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MOHj62qLG31z2GwNyly7FlwKCL7IxM1i/szrCKmoFM=;
  b=FanAO/eFte4JM5CwAd+POSksT0EefnXYE3ebeYuBsdAcrzLB6JKEUv/X
   FAnAIQNUcfcnJIByCK23+HxrDO5a1yPScXB4TL5Nhlax9+PYbQwuOR1Ok
   GZLPxW5R0FCXEzXmp4XzPtD8vnMrmDVOeMva10GxugwOVygAlI5y3XVuy
   N4/Aj/IqqChs/kOQJR+k2QoIEL/3xjSxOXwWmfWMh/zxO2sE5GjJ1ltx3
   S6FIcZ4vxW9HQjQ52FJuzMo7yQmaGrSShgriwLqEtXb82kuF2Yk+rRTVg
   fRgZsAH0OfYwRT4Eg44aY440LEz8mZsLea1ulEw/QlRp1kmPcSbGzZy7S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464129461"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="464129461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 15:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832807019"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="832807019"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2023 15:22:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qejry-0002f4-0t;
	Fri, 08 Sep 2023 22:22:30 +0000
Date: Sat, 9 Sep 2023 06:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: powerpc64-linux-ld: warning: orphan section `.stubs' from
 `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
Message-ID: <202309090600.2Q2WxuSD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a48fa7efaf1161c1c898931fe4c7f0070964233a
commit: 66aac8ea0a6c79729f99087b1c5a596938e5d838 dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL in fsl-edma-common.c
date:   2 weeks ago
config: powerpc64-randconfig-r003-20230908 (https://download.01.org/0day-ci/archive/20230909/202309090600.2Q2WxuSD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090600.2Q2WxuSD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090600.2Q2WxuSD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
