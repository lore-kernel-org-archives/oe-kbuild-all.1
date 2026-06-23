Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4B379C23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214841; cv=none; b=sVDuVcFdH2jDBIpOtO3EETeDwdDCIPs7MRYbE8vO4nXFrgczSaQN7Bm7xEEiVS14ew1NvfD+QNMP1x2gCCDJktCDsWo4xYoKenYL6/JfmRFARO0VA5e8o03EIl2euvXsMrRTf/mTEm7vPPkAI+fzt6aIb2SEfwy1B6fogwnv+AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214841; c=relaxed/simple;
	bh=w2/f6aGM+saHIwD13rPOwdGZbnDuWjyj2CWJ8GAdLsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R07xYRn2s59P8+Sh86PPd3m1wKNCuJGlxPdv1vlllw0rLp08/K6w01Z6EmYCDdjMq9MvAm5f2hOIwjJGyGr/wslVMCLT/k+HfR2uJMjShp6vuCsD91L1JEYLLi46P8T8r2tKpkkgRVsvpf+eoDzkDDlVPNsPnGTZwvbTUJarM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HV7Vrkwn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV7Vrkwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782214840; x=1813750840;
  h=date:from:to:cc:subject:message-id;
  bh=w2/f6aGM+saHIwD13rPOwdGZbnDuWjyj2CWJ8GAdLsc=;
  b=HV7VrkwnpsIOCo3WE8XVU8aF+taKF9m8vbd+AIs2igr/eYBujBOsEysb
   drmqs888DuLDZPMRdUgBzDXr/IL5T9jqQ4bkLdoH1U7UlLZpMxonSoA/D
   6uHlJspDSH8A1TJy3Wpz9/f7F9VmHqDhdBYm6DTht20jlONYBWmOYAVb/
   GvLFdQttMO+3O/oTafC8fOxFg9roBfBekJj4aaPzPZz5VemD4Tci5Et/P
   rRc3XH6a0q0k8kfLAYyMWb+x5eNzebtrVZK6603XY6CyDZhT4KVADZITS
   TetUBCHsw9WOj74PAn7bgDpmlOaSlCtv9evUcX477rSgI77o9947csuVL
   Q==;
X-CSE-ConnectionGUID: MAn2sVFET7igEByV6BL4lw==
X-CSE-MsgGUID: OxKy4hAGRyuW+cjRBwd6ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82825134"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82825134"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 04:40:39 -0700
X-CSE-ConnectionGUID: 32Tp44RxS3yQHFeLrn72ow==
X-CSE-MsgGUID: 3wPPs0G/Qq+Cj4La4wXD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="243135719"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 04:40:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbzUY-000000002UX-4A9b;
	Tue, 23 Jun 2026 11:40:34 +0000
Date: Tue, 23 Jun 2026 19:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Winkler <rwinkler@internships.antmicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 7/15]
 drivers/i2c/busses/i2c-litex.c:119:9: warning: incompatible implicit
 declaration of built-in function 'strncpy'
Message-ID: <202606231932.0GQfk4Oq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c13bee0670f8bcfe9e289c42a42a551462e8c5df
commit: 0feffc97be8ca96055d732a53f8946c9eccb3527 [7/15] LiteX: driver for I2CMaster
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231932.0GQfk4Oq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231932.0GQfk4Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231932.0GQfk4Oq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-litex.c: In function 'litex_i2c_probe':
   drivers/i2c/busses/i2c-litex.c:119:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
     119 |         strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
         |         ^~~~~~~
   drivers/i2c/busses/i2c-litex.c:26:1: note: include '<string.h>' or provide a declaration of 'strncpy'
      25 | #include <linux/litex.h>
     +++ |+#include <string.h>
      26 | 
>> drivers/i2c/busses/i2c-litex.c:119:9: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
     119 |         strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
         |         ^~~~~~~
   drivers/i2c/busses/i2c-litex.c:119:9: note: include '<string.h>' or provide a declaration of 'strncpy'


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
