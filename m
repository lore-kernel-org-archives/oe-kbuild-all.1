Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB726AE6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939189; cv=none; b=oPOgDt9HF3amMVu6fb2Luf++swqJPd4OpqvPNXqueKBLOuEY845ViwVVYARudhSzT+d4cfh9opBhO98R2PizQG9YOnavZncP0XRim08p5yVzDUj9EiarJLHbFzW28sY62etXdV273wDQf5FtkiP2QoQMu456Ea5Jq6AMC3tNln4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939189; c=relaxed/simple;
	bh=C0pV0ra6gdUolhq25m4X59H0XFGuLIfL9M0hFB9/udc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8w9692ZT7wwH3/pioWzIXxJuqYypzJ5w8dv99EerFWJ9SiOAeAK6hWr1eXg2MsQ8Sv7Hu+3h1hiju5upUJXxpiF8lEOci7iv+xSAZzS+duViJavNSGxgUa1LuY2DV0Z/Hmfj20UkR9YZJa2zArwXgqwGQJNXS2QEl5WzctnP2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXv/Jm1z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXv/Jm1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724939186; x=1756475186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0pV0ra6gdUolhq25m4X59H0XFGuLIfL9M0hFB9/udc=;
  b=VXv/Jm1zmjafwz/dJe5wXpwHiJlPWIOsrbwH78NvQnwWX4cOa3F9oA7K
   BYED3O64nuttRb5OlOlB2zmvNuY5ae7lHYYlRXAT0y7mHabdkyEPurim2
   yGzbz94QQ5993t1Ne64BNPA1gWzlfIup+l268Ja+c5jyNX4ZpRCG6Dzzu
   ql1U2LPPBSQfxgdAoyJdeeM+svb2zPJ0M+MA2hMv33P+kG8UJ3ndu5E5J
   8Yzlj+fnrez1Qk4ChKqR/WPLj/GHqSYMceKR+hW3w9wHTZMDjLvV96ZDd
   o1bnf9IMWftsT9Y0a81Ju3B9EsgG0oPMPdS1vNcoNhUOHIwGgShK9WUf8
   w==;
X-CSE-ConnectionGUID: 1dUov5w3RjKUHPVa0/gKeA==
X-CSE-MsgGUID: Xp9A8pShTBeoW5mgaaJuNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23716629"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23716629"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 06:46:24 -0700
X-CSE-ConnectionGUID: MmYQAU9eTJSnl3f6rLe6aQ==
X-CSE-MsgGUID: sxBnJOzXTrGL3MJk+67HFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68246109"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Aug 2024 06:46:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjfTg-0000KU-2M;
	Thu, 29 Aug 2024 13:46:20 +0000
Date: Thu, 29 Aug 2024 21:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Hari Nagalla <hnagalla@ti.com>, Andrew Davis <afd@ti.com>
Subject: [linux-next:master 4949/7693] drivers/mailbox/omap-mailbox.c:383:34:
 warning: unused variable 'omap_mailbox_of_match'
Message-ID: <202408292154.19W0R3u3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b18bbfc14a38b5234e09c2adcf713e38063a7e6e
commit: ebcf9008a895a2a9416f69e186b56fbade35e12c [4949/7693] remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem
config: hexagon-randconfig-r062-20240829 (https://download.01.org/0day-ci/archive/20240829/202408292154.19W0R3u3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408292154.19W0R3u3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408292154.19W0R3u3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/omap-mailbox.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mailbox/omap-mailbox.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mailbox/omap-mailbox.c:12:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mailbox/omap-mailbox.c:383:34: warning: unused variable 'omap_mailbox_of_match' [-Wunused-const-variable]
   static const struct of_device_id omap_mailbox_of_match[] = {
                                    ^
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/omap_mailbox_of_match +383 drivers/mailbox/omap-mailbox.c

ea2ec1e80f78e5f Suman Anna 2018-07-11  382  
75288cc66dc478b Suman Anna 2014-09-10 @383  static const struct of_device_id omap_mailbox_of_match[] = {
75288cc66dc478b Suman Anna 2014-09-10  384  	{
75288cc66dc478b Suman Anna 2014-09-10  385  		.compatible	= "ti,omap2-mailbox",
ea2ec1e80f78e5f Suman Anna 2018-07-11  386  		.data		= &omap2_data,
75288cc66dc478b Suman Anna 2014-09-10  387  	},
75288cc66dc478b Suman Anna 2014-09-10  388  	{
75288cc66dc478b Suman Anna 2014-09-10  389  		.compatible	= "ti,omap3-mailbox",
ea2ec1e80f78e5f Suman Anna 2018-07-11  390  		.data		= &omap2_data,
75288cc66dc478b Suman Anna 2014-09-10  391  	},
75288cc66dc478b Suman Anna 2014-09-10  392  	{
75288cc66dc478b Suman Anna 2014-09-10  393  		.compatible	= "ti,omap4-mailbox",
ea2ec1e80f78e5f Suman Anna 2018-07-11  394  		.data		= &omap4_data,
75288cc66dc478b Suman Anna 2014-09-10  395  	},
9c1f2a5dc2948b9 Suman Anna 2019-06-04  396  	{
9c1f2a5dc2948b9 Suman Anna 2019-06-04  397  		.compatible	= "ti,am654-mailbox",
9c1f2a5dc2948b9 Suman Anna 2019-06-04  398  		.data		= &omap4_data,
9c1f2a5dc2948b9 Suman Anna 2019-06-04  399  	},
595be654b0c23b6 Suman Anna 2021-02-09  400  	{
595be654b0c23b6 Suman Anna 2021-02-09  401  		.compatible	= "ti,am64-mailbox",
595be654b0c23b6 Suman Anna 2021-02-09  402  		.data		= &omap4_data,
595be654b0c23b6 Suman Anna 2021-02-09  403  	},
75288cc66dc478b Suman Anna 2014-09-10  404  	{
75288cc66dc478b Suman Anna 2014-09-10  405  		/* end */
75288cc66dc478b Suman Anna 2014-09-10  406  	},
75288cc66dc478b Suman Anna 2014-09-10  407  };
75288cc66dc478b Suman Anna 2014-09-10  408  MODULE_DEVICE_TABLE(of, omap_mailbox_of_match);
75288cc66dc478b Suman Anna 2014-09-10  409  

:::::: The code at line 383 was first introduced by commit
:::::: 75288cc66dc478b32e43970dd6913396526504ae mailbox/omap: add support for parsing dt devices

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
