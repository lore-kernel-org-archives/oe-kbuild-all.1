Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CC358388
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073120; cv=none; b=Rf2aRHiI+7kwR+44nPg7+lYRrifxn6dmrrg2kmUuqKjqYZiQA36J6E1HUp9zI4YiWRLt7Qlrl1EMqY2/jzPa2FQ6lEGpbY4QL1yYLHxTovKqT9ZcTyP/HXtAiOWKYZvMWJcq4sBdCoqTb0X5QpynQxXUgB8GNtjECh4ldmm8ZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073120; c=relaxed/simple;
	bh=skEYGdLhXiqHD2GjfXMJk62B7EMh678WccSVrP0o2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rzminF3/lVGn+AOJceJywUixUNWHjtm1SqeI6A3dK7pX0RbwDAfbIgJkQz4oPvG4zpQ7jNyi0WjduamBYodpTDwOi9Iig9VJU90NeGWBTtCHExm9EtNdVxI+TE91O94c5lIOFKFA/ed0DBDc8/L8Zgs0SICJLKE4KU5lY6k2Wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKOFGz9k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKOFGz9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783073119; x=1814609119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skEYGdLhXiqHD2GjfXMJk62B7EMh678WccSVrP0o2qI=;
  b=dKOFGz9k/tKZJ6zEGS6OS4UQG0yApyk0kifAa3fDKa5xnQPTW75r5lAy
   lzW3KUysS7Kz99sUf2RCl+oJDK1pgwq1yytwYK6LPccOSTcAPGsG4wQqx
   sfXgifLrdl4MhduL4ERYHCGbWqcNfVW9fsYiVGdM5R1v1RYA/Bii/pD1y
   IYrS091R0b8dhXUzqwwUjI/1QdF4HVueqcmZPnR8b0Plr6xZehNRm22mj
   y11cXoph6mx9dySgN83ta4KJC+a3lXa1FdBcmzGwMplwCsIDKNm/q3Y9D
   79uoQcZyjXJWxgJ7AjRCjEoadxd2yW9VS+8WQ47pmr+7KHufNNjKPzNx+
   g==;
X-CSE-ConnectionGUID: w/m0JY7iQxGe1e0xO4jYRA==
X-CSE-MsgGUID: jRfbH92JSMekasytn0hfQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71347496"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71347496"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 03:05:18 -0700
X-CSE-ConnectionGUID: QXZrqzijSe+Dei8QotJg+A==
X-CSE-MsgGUID: SpDHfLprQqihrl254YCuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="251358289"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Jul 2026 03:05:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfall-00000000ByJ-3vmg;
	Fri, 03 Jul 2026 10:05:13 +0000
Date: Fri, 03 Jul 2026 18:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 37/125] ld:
 drivers/net/wireless/realtek/rtl8xxxu/core.c:8154:undefined reference to
 `sdio_release_irq'
Message-ID: <202607031734.6dh8mBtM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   dd5ae791340d9c645202fab0d77afedf9339ebd0
commit: 23478cf772846b53bea77cd84ac45e80d5a457ae [37/125] Try to add the wifi card in the dlink device.
config: x86_64-randconfig-074-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031734.6dh8mBtM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031734.6dh8mBtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031734.6dh8mBtM-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rtl8xxxu_writeN':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:1031:(.text+0x3314f22): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:1035:(.text+0x3314f7e): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:1045:(.text+0x3314fa8): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read8':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:753:(.text+0x3315cd5): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:754:(.text+0x3315ce5): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:756:(.text+0x3315cf0): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read16':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:779:(.text+0x3315e49): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:783:(.text+0x3315e5c): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:783:(.text+0x3315e7c): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:795:(.text+0x3315eeb): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxu_sdio_rxfifo_recv':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7589:(.text+0x33160a2): undefined reference to `sdio_align_size'
   ld: vmlinux.o: in function `rtl81xxxu_sdio_read_port':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7545:(.text+0x331619b): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7550:(.text+0x3316248): undefined reference to `sdio_memcpy_fromio'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7574:(.text+0x33162af): undefined reference to `sdio_release_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7574:(.text+0x3316409): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read32':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:820:(.text+0x3316661): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:824:(.text+0x3316689): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:836:(.text+0x33166d5): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_sdio_write_port':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7653:(.text+0x33168cf): undefined reference to `sdio_align_size'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7668:(.text+0x331693f): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7670:(.text+0x3316976): undefined reference to `sdio_memcpy_toio'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7673:(.text+0x3316990): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write8':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:856:(.text+0x33170d7): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:857:(.text+0x33170ea): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:859:(.text+0x33170f2): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write16':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:879:(.text+0x331897e): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:884:(.text+0x3318995): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:884:(.text+0x33189b6): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:895:(.text+0x33189c6): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write32':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:915:(.text+0x3319610): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:920:(.text+0x331966b): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:931:(.text+0x3319689): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_sdio_claim':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7970:(.text+0x3321241): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7972:(.text+0x3321249): undefined reference to `sdio_enable_func'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7979:(.text+0x3321279): undefined reference to `sdio_set_block_size'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7988:(.text+0x33212c3): undefined reference to `sdio_claim_irq'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8003:(.text+0x33212d3): undefined reference to `sdio_release_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8001:(.text+0x3322663): undefined reference to `sdio_disable_func'
   ld: vmlinux.o: in function `rtl8xxxu_probe':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8153:(.text+0x3322729): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8154:(.text+0x3322731): undefined reference to `sdio_release_irq'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8155:(.text+0x3322739): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_driver_init':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8211:(.init.text+0x10c5ce): undefined reference to `__sdio_register_driver'
   ld: vmlinux.o: in function `rtl8xxxu_driver_exit':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:8211:(.exit.text+0xbfcc): undefined reference to `sdio_unregister_driver'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
