Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C31DDF4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334253; cv=none; b=vE9XR+ZMq1UPw0kAJEd7L2Gu9HsExieW0d6Gt+flmC56KC1n3DZSdf8mX+tdTwnHbZuhOqPx1GsHDmJusxYNyiH8V3Tnky9YLmCLvQjFx3O9+RhUwnSqhvhzKIHjfe8ZyFSonH0Ry8kuoLxvDuzI3RnQG3B/sjBMPZX1ZqCL/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334253; c=relaxed/simple;
	bh=iyB5dR1DeEUQe8JQViDzLcwbiWYarJF6TyHQQu5rS+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egVrzddpdXHluV/L6YEE8TbZb17MWUHxPUwwO9ItB0IGbzuuy6uom2n2qK4TFsOb3dSSrFuccaER5u6p5tAmwZ6EaSKHgTZFYV8gXcEcS9nqKHyZ+3lPTkJ2pSBsSR5NYfHv9y2Hz4VE1vDEur22g5XfDiFSEU2n8AkOEr+FjAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajngR5q8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajngR5q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724334252; x=1755870252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyB5dR1DeEUQe8JQViDzLcwbiWYarJF6TyHQQu5rS+4=;
  b=ajngR5q8Tb172emZ/f3vuLMfWAUC1y+cwmm4LC7XnFHkTfftk8MvNtAO
   JlciMgWsYirSNBqz8DngOk9un4o3D3AvsFYBMvMDDoblJEakIlryy659Z
   WV7w3S3C2YxtyboEWVDcoiBU8TyaSft/e6VRaKASJ159WCU/AKJvYpMp7
   5ypjQrWhHA1UFv4J05UTQIgfDiqAfuz3tiO433JeFCvG2YTZvINF9Zulq
   G+80fnDoX/k4wK54xPWr2oH0nYgu2ECjMLRCracLnkypTkFmVlHsvZx0Y
   okM6XRrUKOzu9mQOj2mvI6Ye7N2tBC6B61o73kx04ijmq+V7YDXjt9LTe
   g==;
X-CSE-ConnectionGUID: 5S5cMw7PSkGXWd/b1oOILw==
X-CSE-MsgGUID: azXiI4niTHSnzTP94Q5TDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22902708"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22902708"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 06:44:11 -0700
X-CSE-ConnectionGUID: X5Uteq4dQa+KunfNt+U/JQ==
X-CSE-MsgGUID: esntsgfaT/u9OtXQPHrXog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66132401"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2024 06:44:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh86h-000CoO-1m;
	Thu, 22 Aug 2024 13:44:07 +0000
Date: Thu, 22 Aug 2024 21:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: AlvinZhou <alvinzhou@mxic.com.tw>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 3/19] kismet:
 WARNING: unmet direct dependencies detected for COMMON_CLK_XLNX_CLKWZRD when
 selected by SPI_MXIC_UEFC
Message-ID: <202408222124.UHeWIVOn-lkp@intel.com>
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
commit: 3a117622bcdd9cc7e4747224858f669a5209a35d [3/19] spi: Add support for MXIC UEFC SPI controller
config: i386-kismet-CONFIG_COMMON_CLK_XLNX_CLKWZRD-CONFIG_SPI_MXIC_UEFC-0-0 (https://download.01.org/0day-ci/archive/20240822/202408222124.UHeWIVOn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408222124.UHeWIVOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222124.UHeWIVOn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for COMMON_CLK_XLNX_CLKWZRD when selected by SPI_MXIC_UEFC
   WARNING: unmet direct dependencies detected for COMMON_CLK_XLNX_CLKWZRD
     Depends on [n]: COMMON_CLK [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - SPI_MXIC_UEFC [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
