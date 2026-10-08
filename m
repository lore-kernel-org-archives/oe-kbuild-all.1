Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792513DDB07
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444393; cv=none; b=mEkWh/TWIrbB5b0s/nzRLdLL2wgEgHvNSvyXJE2igUZ7o6ZPDicwjQJEnVJUx39H3DEA4BHBMiUoc88JhgDQxu259JnFSUSE8AixT+G9I9gHdVZYSj2JFFHIGBygqWAPsRZaCJlyiwSX3SJXmAZtg6GxdJYBDss9r9Ahvp2t5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444393; c=relaxed/simple;
	bh=j75g8r7mgj85EkCYbEY9RTPAJeGwH896sNjtn1cNhu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QnkzE1IhrOrtE7R6Pk6T/VQpYfAT3SHDYQM7neTH0niCOVaas4tjqC9Kn9cBik/yNqCd7dSYVkvlbLgrxNhTBmj97NxhIvfc0l2pwb3XB9Xqdaq61GgbnIHxDYKi66jUHfrHN4E7/HIfGD5xtkdGdRSzuvwIR/7sGCEB0LIztds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcJSabc6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcJSabc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791444392; x=1822980392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j75g8r7mgj85EkCYbEY9RTPAJeGwH896sNjtn1cNhu0=;
  b=dcJSabc62rTqpDSVVZx9OPL8EnQ+/K7qtF/tKMTcIdTefr+qfWwD7QEn
   ZbvxhEBH1FKJmlhYnmcHCtS27WSuk0eLCvNrl3XtGAB7ltLudkcCze+RP
   dBSS8mhoXH/G/00fsSvUI73iqrQNgvUa7nDft5tU+uGTqm4wuAwfWwBVi
   g1p3PMZ9GxYY5oBmb2QsMAy7CKKpOp81eP/FAK8R86DjrvZnTAsP28bsA
   TINKAVQKwwDm2zUpe9T3sLCztJcMSR+5B7YwPVInLDreaZu6dk3mqHz7d
   I4DgHjzSuXPp/GvJeRIQEvh1JzeUh3IEAvclGXI110py/ECtCqS9WA18i
   Q==;
X-CSE-ConnectionGUID: n6Ek/Dk9TbutbQdSqBpG5g==
X-CSE-MsgGUID: SpxOHQmlReS7vlBF/NlEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="223563"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="223563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 00:26:31 -0700
X-CSE-ConnectionGUID: 5c6dcI1kQM+Ju4mrUZ/RZw==
X-CSE-MsgGUID: Z3EIrv0ITIONczHa+ju6RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="54640"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Oct 2026 00:26:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEiWJ-00000000484-1Km1;
	Thu, 08 Oct 2026 07:26:27 +0000
Date: Thu, 08 Oct 2026 15:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 77/142]
 drivers/spi/spi-zx.c:477:24: warning: conversion from 'long unsigned int' to
 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to
 '4294967294'
Message-ID: <202610081510.H0dU0UA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: 4fa1d7e70e05f781c1e9a1876619ad78b3297e19 [77/142] zx29 qspi driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261008/202610081510.H0dU0UA2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081510.H0dU0UA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081510.H0dU0UA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-zx.c: In function 'zx_qspi_remove':
>> drivers/spi/spi-zx.c:477:24: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
     477 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);


vim +477 drivers/spi/spi-zx.c

   473	
   474	static void zx_qspi_remove(struct platform_device *pdev)
   475	{
   476		struct zx_qspi *qspi = platform_get_drvdata(pdev);
 > 477		writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
