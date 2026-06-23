Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F2A377034
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210355; cv=none; b=PiO6aUHFN5TiWV6941kyiMN3AQEIMCYjG8xZawuBp8LeHImkOeDVRaVIMEX4hQsccAJvnQ6sk/KdZUAzZYS3i2CcGg/HxhB6c55yVe4iID64XJuqIWhdSGZ2/0zFN5HzyOMK7a1WN0Lx/IA6mivP8FEcapaJJ98Y2meDC8uvMJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210355; c=relaxed/simple;
	bh=DTO6bFtK9taT1wI0hndZ3m5iieJtkwCoyfHQyTppoPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hhbbtHqFljAOiO5sthaMmEn0gbsZLXhYSueBdDOay/837sRqo5n1K5yBnSjBVJRUNrvRYd/5AjXPuyce2Gp1IzpUvspBuTAr7w6MECkuFovgDHmppZIS/GrxBe31pUVhrtsMMCcBG3N2VXwY4NZAF0Idr0iqnIEDBf0QpQLx+YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2/GAj5h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2/GAj5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782210354; x=1813746354;
  h=date:from:to:cc:subject:message-id;
  bh=DTO6bFtK9taT1wI0hndZ3m5iieJtkwCoyfHQyTppoPI=;
  b=X2/GAj5hoS1+WLuWuTvu43/t73vaZe56fYpTBJMCIleuZsGkaz9dDK30
   0dRXgw0Y88YTihBNnxkAneMb1BlJZpNrS3GQMFeMsnlrM1Bc5wxNQSon0
   EH+4zN2P4BzoqN+hjlwL++UIP+vHnJG99TSwoBtrcrpaqXGabHEfFK83D
   ZXjIK4U5Au91Hbs6RVOpQWopiNGH3/5VaaSUdrF0HBbFoa46s/VeGUu6j
   AXcbSxcWaZZ2/WntIsMQY13GF49BC+Rbl+fS3jbnFWziabFrXARGgBXS9
   0eD4g5zrCR5OjWrfUG6H2/6VJcX+d4RQ9F6IN6ebNqhD4xt9gc5c211Fb
   w==;
X-CSE-ConnectionGUID: XHAgPpwhTciCggshKELa5A==
X-CSE-MsgGUID: p8KTrfsJQY2x1VVJbs2CiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82953965"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82953965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:25:53 -0700
X-CSE-ConnectionGUID: YlqC97aGTtqH2kAjpLvbxg==
X-CSE-MsgGUID: QWU6rqCTTo2+wTz3bkmYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247139408"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 03:25:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbyKC-000000002R1-1JvE;
	Tue, 23 Jun 2026 10:25:48 +0000
Date: Tue, 23 Jun 2026 18:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Winkler <rwinkler@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 7/15]
 drivers/i2c/busses/i2c-litex.c:119:9: error: implicit declaration of function
 'strncpy'
Message-ID: <202606231855.ipMEmMUU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c13bee0670f8bcfe9e289c42a42a551462e8c5df
commit: 0feffc97be8ca96055d732a53f8946c9eccb3527 [7/15] LiteX: driver for I2CMaster
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231855.ipMEmMUU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231855.ipMEmMUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231855.ipMEmMUU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-litex.c: In function 'litex_i2c_probe':
>> drivers/i2c/busses/i2c-litex.c:119:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
     119 |         strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
         |         ^~~~~~~
   drivers/i2c/busses/i2c-litex.c:26:1: note: 'strncpy' is defined in header '<string.h>'; this is probably fixable by adding '#include <string.h>'
      25 | #include <linux/litex.h>
     +++ |+#include <string.h>
      26 | 


vim +/strncpy +119 drivers/i2c/busses/i2c-litex.c

    93	
    94	static int litex_i2c_probe(struct platform_device *pdev)
    95	{
    96		struct device_node *node = pdev->dev.of_node;
    97		void __iomem *membase;
    98		struct litex_i2c *i2c_s;
    99		struct resource *res;
   100	
   101		if (!node)
   102			return -ENODEV;
   103	
   104		i2c_s = devm_kzalloc(&pdev->dev, sizeof(*i2c_s), GFP_KERNEL);
   105		if (!i2c_s)
   106			return -ENOMEM;
   107	
   108		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   109		if (!res)
   110			return -EBUSY;
   111	
   112		membase = devm_of_iomap(&pdev->dev, node, 0, &res->end);
   113		if (IS_ERR_OR_NULL(membase))
   114			return -EIO;
   115	
   116		i2c_s->reg_w = membase + OFFSET_REG_W;
   117		i2c_s->reg_r = membase + OFFSET_REG_R;
   118	
 > 119		strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
   120			sizeof(i2c_s->adapter.name));
   121		i2c_s->adapter.owner        = THIS_MODULE;
   122		i2c_s->adapter.algo_data    = &i2c_s->algo_data;
   123		i2c_s->adapter.dev.parent   = &pdev->dev;
   124		i2c_s->adapter.dev.of_node  = node;
   125		i2c_s->algo_data.data       = i2c_s;
   126	
   127		i2c_s->algo_data.setsda  = litex_i2c_setsda;
   128		i2c_s->algo_data.setscl  = litex_i2c_setscl;
   129		i2c_s->algo_data.getsda  = litex_i2c_getsda;
   130		i2c_s->algo_data.getscl  = NULL;
   131		i2c_s->algo_data.udelay  = DRIVER_ALGO_BIT_UDELAY;
   132		i2c_s->algo_data.timeout = HZ;
   133	
   134		platform_set_drvdata(pdev, i2c_s);
   135		return i2c_bit_add_bus(&i2c_s->adapter);
   136	}
   137	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
