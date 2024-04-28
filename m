Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22DD33DF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 05:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714282272; cv=none; b=WXIo4mcah/Szf7gRKzvMIgNjfkKGxupyEXC3nvUtTP79hoy6jdxBS4wRCjRaYnR3MEPjShaHAbGI2moInftGegOBieawkpov9IcM7vMzxsLB0Y5wgD9SNbGbGx0AumVp20D/83JwSNAlRsEvl7+xcZcBX2Ckqp0F2Eq12+LrcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714282272; c=relaxed/simple;
	bh=+u7SwRbCnyAl+uWJcKLZNbs9crM8HxaPT/MsN3XdmFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErCN61DI9B+y98mKdoBlGsGslkc86tRUvCfTDi+9RoI+u8qnCqpYUt/0gOI8RyMVcyNuFDOaFXLqHszVJd9O/G7qdF1twfYrfr8IWYtcF8ENtpI2WsRw/PNqhSfo/B6EHWd1lE7OLyy1fpl2ebrO99W44jxjo/1MihttyrLXLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrIZwyLi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrIZwyLi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714282271; x=1745818271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+u7SwRbCnyAl+uWJcKLZNbs9crM8HxaPT/MsN3XdmFM=;
  b=jrIZwyLipdHttcUe2KAoD7LaBp95JkjRrJ/hU/j8dSCkKfPMaAfFNYR2
   MBdbylDxNq3iqFmx9Ns+0rxKbaJ/yk2YPolWEzyeRdSILGOC5x1W9uK4N
   GFnb7kYthZohRm+bC3EOUlxbmi//lJNQ/vEB0409vQ5uZ2VMEhbxUNPfn
   zxMXyXe9GSK9yg6YzTCSfcK6WP0HJZ+N/+lYXrUXgEV6hlTkuIuQ5xfR5
   /qD/AaTdPFLeVAWFNiPssLpOiSkBOaLD/Ce6EtQCZIiyBsBUmfhga305p
   bKFJYZAnlNN8ADj2kC46CVG6UZG4N14Z6KzCHCrxGPTOTyRpoI1xtErud
   g==;
X-CSE-ConnectionGUID: PQBeqzFOS8eW3sUyaLZ4kg==
X-CSE-MsgGUID: qcRzoYrSRb2r+ipxSBwM1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21381338"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21381338"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 22:31:10 -0700
X-CSE-ConnectionGUID: pWv7SA7hTqGArCkJEEkjIQ==
X-CSE-MsgGUID: pR0hIKZ6T12Ck3LHHt7ABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25792118"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2024 22:31:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0x7y-0005s2-2d;
	Sun, 28 Apr 2024 05:31:06 +0000
Date: Sun, 28 Apr 2024 13:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4982/11728]
 drivers/soc/imx/soc-imx9.c:97:34: warning: 'imx9_soc_of_match' defined but
 not used
Message-ID: <202404281349.PkyOVEv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: a5244ebd30622a727c7164f057810a4396e30845 [4982/11728] LF-10572 soc: imx9: consolidate the soc info probe method
config: s390-randconfig-002-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281349.PkyOVEv9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281349.PkyOVEv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281349.PkyOVEv9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:97:34: warning: 'imx9_soc_of_match' defined but not used [-Wunused-const-variable=]
      97 | static const struct of_device_id imx9_soc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~


vim +/imx9_soc_of_match +97 drivers/soc/imx/soc-imx9.c

af940fb78034a2 Alice Guo 2022-05-18   96  
af940fb78034a2 Alice Guo 2022-05-18  @97  static const struct of_device_id imx9_soc_of_match[] = {
af940fb78034a2 Alice Guo 2022-05-18   98  	{ .compatible = "fsl,imx93-soc", },
a5244ebd30622a Jacky Bai 2023-11-15   99  	{ .compatible = "fsl,imx95-soc", },
af940fb78034a2 Alice Guo 2022-05-18  100  	{ }
af940fb78034a2 Alice Guo 2022-05-18  101  };
af940fb78034a2 Alice Guo 2022-05-18  102  MODULE_DEVICE_TABLE(of, imx9_soc_of_match);
af940fb78034a2 Alice Guo 2022-05-18  103  

:::::: The code at line 97 was first introduced by commit
:::::: af940fb78034a28b60ebba62458016fde7b7c4bb MLK-25903-1 driver: soc: imx9: add i.MX93 SoC device register function

:::::: TO: Alice Guo <alice.guo@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
