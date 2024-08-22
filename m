Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6026AF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 12:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724329271; cv=none; b=tybKOBwcjiC53vnxllay9F0J9bT8eF2JM0IU0hbNC2okLQKTUUSBzrmGnC/9bM7k/+A/Rpmcn0lrlDKfnUCYeee11TZZMqDdhyAZRQ7WannUcII0riLzRjDOsQ/0nHcjs9kFFhBtrjDkM5EapCKYUDL0mxJ8Q1UilOXGIwND71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724329271; c=relaxed/simple;
	bh=a+3Vq7QELTrwkjhr8n5itJCmvmmGkawKyaerwmsT/ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=an2cjLdmJmnGDW75hGeom1nedrDVvFdlqGn+ubwJvNgabnkFRGlQScaMFnCk0yZAU64GX/xk3DQCIsZ9/VtH+mYZuoHAN681l2XdfljtoJJvhnzKQuHL8FpA3yOVA/B9UVWhbeZmLsbPytbAdUdOfKUvy/RTsvlitK5AB/fRzwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgSGpF+T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgSGpF+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724329271; x=1755865271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a+3Vq7QELTrwkjhr8n5itJCmvmmGkawKyaerwmsT/ps=;
  b=jgSGpF+TtaIbVNJvRwdKHN9hl1gfIidCrsinFwwYuKZB5QC0Iv7D3OaO
   5Gp2PBuMWFNImY8QwkZy17fhhZHUFW3D8ylcTr2OoCSPQKW4oDmawPHb0
   qSzNcKOLYy5MLtPZ3sXihgnI8TlBJo6uAdSogymuMMmm2BgX+BPzvtSCL
   PI0WhnC5Ahs9poJTe+MRvWCA16NjfgKUkuFzC050EKuWLfKZTDYKNzSGv
   Qj3oJ3KfHfqETgCpFFD7Sta3w2DL2MiQs66SvHEhEy3Is9sPWXCzk4cSo
   un5UvRbBew/2t7ZpN4rj47mpAsMcyX0bvIjZMirmBFhhn8uKlywVdSXtG
   w==;
X-CSE-ConnectionGUID: ZAqXEcupThGrTrCuyW/hnA==
X-CSE-MsgGUID: cQXwIxs1RMaEHIQS6Fg7og==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22893297"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22893297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 05:21:10 -0700
X-CSE-ConnectionGUID: X9JDUCKpRtOpT5Q9tBRwlg==
X-CSE-MsgGUID: St2cCOFZRAi8LMioZQg8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61133651"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Aug 2024 05:21:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh6oJ-000Cjk-13;
	Thu, 22 Aug 2024 12:21:03 +0000
Date: Thu, 22 Aug 2024 20:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: AlvinZhou <alvinzhou.tw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 1/19]
 drivers/clk/zynq/clk-wizard.c:399:19: error: initialization of 'void
 (*)(struct platform_device *)' from incompatible pointer type 'int
 (*)(struct platform_device *)'
Message-ID: <202408222031.BIka9uUo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   fadbfba401d2b839e573b267e4380bedc055da2c
commit: 39a43abeef4a9648bf37adb2b0e87f076bf43f62 [1/19] ARM: macronix: Add support for picozed
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408222031.BIka9uUo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222031.BIka9uUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222031.BIka9uUo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/zynq/clk-wizard.c:399:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     399 |         .remove = zynq_clkwzd_remove,
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/clk/zynq/clk-wizard.c:399:19: note: (near initialization for 'zynq_clkwzd_driver.<anonymous>.remove')


vim +399 drivers/clk/zynq/clk-wizard.c

   396	
   397	static struct platform_driver zynq_clkwzd_driver = {
   398		.probe = zynq_clkwzd_probe,
 > 399		.remove = zynq_clkwzd_remove,
   400		.driver = {
   401			.name = "zynq-clk-wizard",
   402			.of_match_table = zynq_clkwzd_of_ids,
   403		},
   404	};
   405	module_platform_driver(zynq_clkwzd_driver);
   406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
