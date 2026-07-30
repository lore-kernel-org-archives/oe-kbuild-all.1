Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0290A402B8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431385; cv=none; b=am7bzC+0eS9QroG07o2LJmiU6JNlKsnjoUau2su2X65cEdAOU2xDDom5rnxeikaK0WMMjG+QQF1S91HBTig75djHde5L4jOLopr3qqBhEmR4shbRTnLcjZmfo7WK7ahX3gwZwKIFuZI5PaDC8BjkQP4n5xRkAobe5YPSDIq9q8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431385; c=relaxed/simple;
	bh=8B5Ow4GYYD5VswddeZW2qcuSRzHvN9mXgvliS86Y3F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gOz371hyhWIceQp7cEpdGeg+YH92hADZQsHArTAjRjYNyGiEqGWBEnmgvJ+XPwJjAwOC7gAqV44nrb2vQoJJw6D38NtaWinbqjXhPWqyq/uRmHscYci50t543gWP5A1R3IQVYs1fKD5ESLvcDFX8TyHOpc+9Lpqmc84VabFGSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiMgpRGw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiMgpRGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785431383; x=1816967383;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8B5Ow4GYYD5VswddeZW2qcuSRzHvN9mXgvliS86Y3F4=;
  b=JiMgpRGwdG2bpvuXDa0y+AVOBileJGOli54sO05PiHUEJEVAzn2nBhgZ
   wxOl/o811AjwaRdRtcIPq7VAOD15xQiOLKrFP1LQTYKq5yklrjA0Jdkin
   V1t4p5MdkjHDtVMAVIVkHjH5ikAxiyUZvPzAZVA3Cx5AnfqdOn2d+Xpad
   EZny14YgUv9fBRTLEFloBYZv3rIn3klWc2G+ZxQJDNA+UZSinbBley7Cv
   ZO2B38qWzE4Dyep8EOhJss49FoKINUvXa2X/B/Zt6T06rG1nMK2L0n2H1
   BV6mXv3FVzL+rhNwvt27z+IxTpWuRaoO9E25/wAEeH5UiceZBkTcnRrm9
   g==;
X-CSE-ConnectionGUID: DC2Z1+7ASO6vEzkW1pfS5w==
X-CSE-MsgGUID: D3XNx4I9RkibiNxFgQplyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111603994"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="111603994"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 10:09:40 -0700
X-CSE-ConnectionGUID: sP1L007QT8uydXzf/Zbu9A==
X-CSE-MsgGUID: oF9gv34zR26Qzt4zLrujuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="263831838"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2026 10:09:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpUGG-000000002Pw-2d9e;
	Thu, 30 Jul 2026 17:09:36 +0000
Date: Thu, 30 Jul 2026 19:08:58 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe-7.2-rc1-wip 7/21] drivers/pci/pcie/aer.c:42:34:
 error: request for member 'dev' in something not a structure or union
Message-ID: <202607301928.a7yQrj5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/l1k/linux doe-7.2-rc1-wip
head:   3ff494368f930bbd2364d93688549fcbd02a3881
commit: 7dde1844d2677e5a1c1f086d6f91294255ff571a [7/21] PCI/AER: Prettify e=
rror source logging
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/202607=
30/202607301928.a7yQrj5J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260730/202607301928.a7yQrj5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301928.a7yQrj5J-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from drivers/pci/pcie/aer.c:18:
   drivers/pci/pcie/aer.c: In function 'aer_print_error':
>> include/linux/printk.h:448:42: error: initialization of 'const char *' f=
rom incompatible pointer type 'struct pci_dev *' [-Wincompatible-pointer-ty=
pes]
     448 |                                 .level =3D __builtin_constant_p(=
_level) ? (_level) : NULL, \
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:478:9: note: in expansion of macro '__printk_inde=
x_emit'
     478 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_in=
dex_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:128:17: note: in expansion of macro 'dev_prin=
tk_index_emit'
     128 |                 dev_printk_index_emit(level, fmt);              =
        \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pcie/aer.c:42:9: note: in expansion of macro 'dev_printk'
      42 |         dev_printk(level, &(pdev)->dev, fmt, ##arg)
         |         ^~~~~~~~~~
   drivers/pci/pcie/aer.c:987:17: note: in expansion of macro 'aer_printk'
     987 |                 aer_printk(dev, "%s Bus Error: severity=3D%s (In=
accessible)\n",
         |                 ^~~~~~~~~~
   include/linux/printk.h:448:42: note: (near initialization for '_entry.le=
vel')
     448 |                                 .level =3D __builtin_constant_p(=
_level) ? (_level) : NULL, \
         |                                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:478:9: note: in expansion of macro '__printk_inde=
x_emit'
     478 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_in=
dex_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:128:17: note: in expansion of macro 'dev_prin=
tk_index_emit'
     128 |                 dev_printk_index_emit(level, fmt);              =
        \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pcie/aer.c:42:9: note: in expansion of macro 'dev_printk'
      42 |         dev_printk(level, &(pdev)->dev, fmt, ##arg)
         |         ^~~~~~~~~~
   drivers/pci/pcie/aer.c:987:17: note: in expansion of macro 'aer_printk'
     987 |                 aer_printk(dev, "%s Bus Error: severity=3D%s (In=
accessible)\n",
         |                 ^~~~~~~~~~
   In file included from drivers/pci/pcie/aer.c:20:
>> drivers/pci/pcie/aer.c:42:34: error: request for member 'dev' in somethi=
ng not a structure or union
      42 |         dev_printk(level, &(pdev)->dev, fmt, ##arg)
         |                                  ^~
   include/linux/dev_printk.h:129:36: note: in definition of macro 'dev_pri=
ntk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);    =
        \
         |                                    ^~~
   drivers/pci/pcie/aer.c:987:17: note: in expansion of macro 'aer_printk'
     987 |                 aer_printk(dev, "%s Bus Error: severity=3D%s (In=
accessible)\n",
         |                 ^~~~~~~~~~
>> drivers/pci/pcie/aer.c:987:28: error: passing argument 1 of '_dev_printk=
' from incompatible pointer type [-Wincompatible-pointer-types]
     987 |                 aer_printk(dev, "%s Bus Error: severity=3D%s (In=
accessible)\n",
         |                            ^~~
         |                            |
         |                            struct pci_dev *
   include/linux/dev_printk.h:129:29: note: in definition of macro 'dev_pri=
ntk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);    =
        \
         |                             ^~~~~
   drivers/pci/pcie/aer.c:987:17: note: in expansion of macro 'aer_printk'
     987 |                 aer_printk(dev, "%s Bus Error: severity=3D%s (In=
accessible)\n",
         |                 ^~~~~~~~~~
   include/linux/dev_printk.h:41:30: note: expected 'const char *' but argu=
ment is of type 'struct pci_dev *'
      41 | void _dev_printk(const char *level, const struct device *dev,
         |                  ~~~~~~~~~~~~^~~~~


vim +/dev +42 drivers/pci/pcie/aer.c

23e672bc2abead drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas 2018-06-08  40 =
=20
fab874e12593b6 drivers/pci/pcie/aer.c        Ilpo J=C3=A4rvinen 2024-12-16 =
 41  #define aer_printk(level, pdev, fmt, arg...) \
fab874e12593b6 drivers/pci/pcie/aer.c        Ilpo J=C3=A4rvinen 2024-12-16 =
@42  	dev_printk(level, &(pdev)->dev, fmt, ##arg)
fab874e12593b6 drivers/pci/pcie/aer.c        Ilpo J=C3=A4rvinen 2024-12-16 =
 43 =20

:::::: The code at line 42 was first introduced by commit
:::::: fab874e12593b68f9a7fcb1a31a7dcf4829e88f7 PCI/AER: Descope pci_printk=
() to aer_printk()

:::::: TO: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
