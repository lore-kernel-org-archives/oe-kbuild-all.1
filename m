Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76F1115
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkisGrPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696815752; x=1728351752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+1eb9jRb9jPh1o5Zc83BOngYcGo+o0zIel0LJFdPRw=;
  b=IkisGrPcsue1UHVS0IeksEcOvaVFejRpRsiqzdckPZBc+6s560BwOFaM
   EddYI4m57Ne4PfY+IYAucecslSrop8p3q95/CGDJRkAmqZR+j7m24mAct
   66cCvfSKFHpJzGfQ7BL894EBaHm/I5jPy7H/yfF4/5GJw1Zo19rMOwlVb
   kkyFVu2jhAg5ytK/Jt1CebBiWvmnCK+ZDtq90IYmKFeTEu46jYpU2xm8i
   q9lxJWjZSwnwgMk2owG/eWiqWiZd1vSa8xi1/3mRu4Gn5soGwXwpAXuTC
   VvbBdmHL7UWuVsChkn7Skok6mM7xkTz5VlxSYG846wthDxj0tA1nbfJjt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="363403622"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="363403622"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 18:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="876639222"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="876639222"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Oct 2023 18:42:29 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpfHv-0005x7-1h;
	Mon, 09 Oct 2023 01:42:27 +0000
Date: Mon, 9 Oct 2023 09:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6076/24603]
 drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1266:12: warning:
 'mipi_csis_runtime_resume' defined but not used
Message-ID: <202310090909.LkGFp2J8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b0519c4b9531e65e71b3ff5db18553d6ad840099 [6076/24603] Merge remote-tracking branch 'origin/capture/mxc' into capture/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310090909.LkGFp2J8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090909.LkGFp2J8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090909.LkGFp2J8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: In function 'mipi_csis_probe':
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1075:29: warning: variable 'mipi_sd' set but not used [-Wunused-but-set-variable]
    1075 |         struct v4l2_subdev *mipi_sd;
         |                             ^~~~~~~
   drivers/media/platform/mxc/capture/mxc_mipi_csi.c: At top level:
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1266:12: warning: 'mipi_csis_runtime_resume' defined but not used [-Wunused-function]
    1266 | static int mipi_csis_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mxc/capture/mxc_mipi_csi.c:1261:12: warning: 'mipi_csis_runtime_suspend' defined but not used [-Wunused-function]
    1261 | static int mipi_csis_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mipi_csis_runtime_resume +1266 drivers/media/platform/mxc/capture/mxc_mipi_csi.c

6205720ceacacc Robby Cai 2019-09-27  1260  
6205720ceacacc Robby Cai 2019-09-27 @1261  static int mipi_csis_runtime_suspend(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1262  {
6205720ceacacc Robby Cai 2019-09-27  1263  	return mipi_csis_pm_suspend(dev, true);
6205720ceacacc Robby Cai 2019-09-27  1264  }
6205720ceacacc Robby Cai 2019-09-27  1265  
6205720ceacacc Robby Cai 2019-09-27 @1266  static int mipi_csis_runtime_resume(struct device *dev)
6205720ceacacc Robby Cai 2019-09-27  1267  {
6205720ceacacc Robby Cai 2019-09-27  1268  	return mipi_csis_pm_resume(dev, true);
6205720ceacacc Robby Cai 2019-09-27  1269  }
6205720ceacacc Robby Cai 2019-09-27  1270  

:::::: The code at line 1266 was first introduced by commit
:::::: 6205720ceacacce82f3e8dba6816a1dbffcd903c media: mipi csi: add samsung's mipi csi support

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
