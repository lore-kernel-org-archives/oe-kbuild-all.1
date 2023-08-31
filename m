Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099019BB8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 19:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693510865; x=1725046865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5eydtHwxuAxjNFLUwXwUFCATk8aAxJusPt1XpXy2DYw=;
  b=jZfXdbnC9khylPUQ+CtKB53s31XBzeqaazK1Wuf9PAR+ielff0b1U+29
   Ah0Icre8AHGXqh1eT2s4XLV6A1DT5zR2YXl7IgL8fOLZFehtwTcKj6e7k
   8eWkIwg+aHmNKzRw/Z/lrAWtf+9Iu/vd8XCovhqP6UxgCuzJP260Ci7E6
   Af7DcCXxIePFviFeATrVXlzXlz8Auj3wBLgKqgXHP3QJ2ZxhlxnluupKE
   xvbCJ5PImKiCsoadzxIgZeH9NWH3z6/Ff3OeiUb7p6UateRLKK1Tf5l7O
   i3EkeHDLsq0mJGzF5+abtnou1hYVT+C5r5iYc8E/odCKzSWUDKf4lhWLY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361068847"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="361068847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 12:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733248355"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="733248355"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Aug 2023 12:41:04 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbnXK-0000Uk-19;
	Thu, 31 Aug 2023 19:41:02 +0000
Date: Fri, 1 Sep 2023 03:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 14031/24603]
 drivers/soc/imx/soc-imx9.c:105:34: warning: 'imx9_soc_of_match' defined but
 not used
Message-ID: <202309010333.jTpFWqxO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0c6c9e418a7d12f042ea7eb3499d97e813d463f0 [14031/24603] MLK-25903-1 driver: soc: imx9: add i.MX93 SoC device register function
config: x86_64-buildonly-randconfig-006-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010333.jTpFWqxO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010333.jTpFWqxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010333.jTpFWqxO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:105:34: warning: 'imx9_soc_of_match' defined but not used [-Wunused-const-variable=]
     105 | static const struct of_device_id imx9_soc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/imx9_soc_of_match +105 drivers/soc/imx/soc-imx9.c

   104	
 > 105	static const struct of_device_id imx9_soc_of_match[] = {
   106	        { .compatible = "fsl,imx93-soc", },
   107	        { }
   108	};
   109	MODULE_DEVICE_TABLE(of, imx9_soc_of_match);
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
