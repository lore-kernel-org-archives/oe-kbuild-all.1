Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDC46D2B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038796; cv=none; b=M9CfXFFg6Jo4Aly3lDtTi0Lonq7BiCBYZMe0Gww4AETKFzEovTQnFxDjnae8juiE6517S9pxsiaUDNP89ayG938SDrTTJ4UR1P0kvWNqj5qq3ncZzQQIWCKYhLnjAAxz1CK9nCqpq4Iv/vpjSZSY2CaDRwwGNAuZolAHm9gr4IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038796; c=relaxed/simple;
	bh=yZs71CMQhqevRuZTXnX0jGlCGZ/xa65nIuxKinzqNTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbp+4kTLFTgvrajVH+3mY7YjSvBgIDqFf6vbECSmqcWBR2zUU/UW+1YmTxawT+PoXEwXRrkTmrLZkp7dMwj538wlGLaIkV9HXszB2H3dvoKWOBL6I0oVugH+/OdeljTQcHfDUO741CZr/dZ5Wv6L83uoEIUoHgvkOWD0IY/iN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhdBO9ak; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhdBO9ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789038795; x=1820574795;
  h=date:from:to:cc:subject:message-id;
  bh=yZs71CMQhqevRuZTXnX0jGlCGZ/xa65nIuxKinzqNTI=;
  b=BhdBO9akGLDBXj02taCdIC1aTqlQyZ5k54zw/3RnYticRHlIGFgSMtSS
   N03RXT7lVPu7MJJZek8hloMVJg05dBXeuaLJQOWTgRdmXuxzuwB0EgclK
   QNHPV7NNrdD5omZW/mOSiXVwMfTpTXtbDxbZQOPLYMuTUTaClTt4GqhGO
   /NrsOPnv0i3g7VRC8Ye6KIMfTq8FIVYyxcmym87vV60DmnUTfUWgf1d7r
   O3dWOYo2xU7ASfdIxVPiTpnqu1bDuUDffxygPBN1LoVoRaxlYLzNbKFsd
   EUhLZWOXcwimLbbZvyGN5D2CUWJ5OLk4jm9F6VFnIR0V5ucX91mw3cqX7
   w==;
X-CSE-ConnectionGUID: F48lgdd3T1KDA1F2q+QLiA==
X-CSE-MsgGUID: JW5dXSBgTdq+Gpzar5qgtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89249387"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89249387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 04:13:15 -0700
X-CSE-ConnectionGUID: gTz64nbSTp2zHmmpQCpdCA==
X-CSE-MsgGUID: /taoEb0FR/2K6KGVvHhU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269035092"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2026 04:13:13 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ciM-000000001jo-1D3w;
	Thu, 10 Sep 2026 11:13:10 +0000
Date: Thu, 10 Sep 2026 19:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 216/294]
 drivers/media/i2c/ds90ub913.c:23:10: fatal error: media/i2c/ds90ub9xx.h: No
 such file or directory
Message-ID: <202609101958.K8XqOq04-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: c473be37547a95e20e5f6cc7c01968ab474a58a4 [216/294] media: i2c: ds90ub9xx: remove global platform_data definition
config: powerpc-randconfig-r122-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101958.K8XqOq04-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101958.K8XqOq04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101958.K8XqOq04-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ds90ub913.c:23:10: fatal error: media/i2c/ds90ub9xx.h: No such file or directory
      23 | #include <media/i2c/ds90ub9xx.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +23 drivers/media/i2c/ds90ub913.c

c158d0d4ff1530 Tomi Valkeinen 2023-06-19  22  
c158d0d4ff1530 Tomi Valkeinen 2023-06-19 @23  #include <media/i2c/ds90ub9xx.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  24  #include <media/v4l2-fwnode.h>
be1e71b1db5779 Tomi Valkeinen 2023-07-31  25  #include <media/v4l2-mediabus.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  26  #include <media/v4l2-subdev.h>
c158d0d4ff1530 Tomi Valkeinen 2023-06-19  27  

:::::: The code at line 23 was first introduced by commit
:::::: c158d0d4ff15309fd63b7d7cf50a5153bead894a media: i2c: add DS90UB913 driver

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
