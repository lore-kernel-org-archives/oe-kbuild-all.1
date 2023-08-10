Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F34110E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 05:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691645945; x=1723181945;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7zpOuMnfpUQwiYWxR+D4ZMP2A2sm8QFkeqOrAotR+5A=;
  b=OWJ5YyZaywkVIOctniVbO64MAEWWueJaHjTPSkMqmu34NLYKAqZsCUMv
   OQ9tdra4E8INtPq7M2zcu1HAo89eAk9x7/Ctf3FvG4YS46eLAjfxaBs4H
   G4ryGTEBqI6DnbMROwwdRYESlzBNEQpEearXO+OyDZBje6qoQQJuCQjI3
   apEaV4enFjDypswFlAif6o9RICYhDfLybCODWN7TeJZIYu8ECdUdZgc+Q
   RWJXk3h/YI/X1eT3+MXTxBLLQuAeGLjAP6kqBm6j4o79CXrmsYWPjYDfr
   5eZGTyqRC/icxC+gWMVszcQjqG5wNMhFSpksZdkfS+nj6QWlCbxf2fYo9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361438724"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="361438724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 22:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="855803837"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="855803837"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Aug 2023 22:39:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTyNw-0006ku-0E;
	Thu, 10 Aug 2023 05:39:00 +0000
Date: Thu, 10 Aug 2023 13:38:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 335/382]
 drivers/media/platform/cadence/cdns-csi2rx.c:708:12: warning:
 'csi2rx_resume' defined but not used
Message-ID: <202308101354.XiJoVgFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   b48e8af2b534491c63db33742d2758064b72eb9f
commit: abf5efa8c5ada91dc8d9c8adaa272e7792afaa17 [335/382] media: cadence: csi2rx: Support runtime PM
config: x86_64-randconfig-x013-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101354.XiJoVgFd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101354.XiJoVgFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101354.XiJoVgFd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/cadence/cdns-csi2rx.c:708:12: warning: 'csi2rx_resume' defined but not used [-Wunused-function]
     708 | static int csi2rx_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/media/platform/cadence/cdns-csi2rx.c:696:12: warning: 'csi2rx_suspend' defined but not used [-Wunused-function]
     696 | static int csi2rx_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/csi2rx_resume +708 drivers/media/platform/cadence/cdns-csi2rx.c

   695	
 > 696	static int csi2rx_suspend(struct device *dev)
   697	{
   698		struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
   699	
   700		mutex_lock(&csi2rx->lock);
   701		if (csi2rx->count)
   702			csi2rx_stop(csi2rx);
   703		mutex_unlock(&csi2rx->lock);
   704	
   705		return 0;
   706	}
   707	
 > 708	static int csi2rx_resume(struct device *dev)
   709	{
   710		struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
   711	
   712		mutex_lock(&csi2rx->lock);
   713		if (csi2rx->count)
   714			csi2rx_start(csi2rx);
   715		mutex_unlock(&csi2rx->lock);
   716		return 0;
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
