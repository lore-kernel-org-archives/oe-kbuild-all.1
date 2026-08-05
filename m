Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DF4446836
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930964; cv=none; b=kJB8aALqLy5FD5s276crksuKrRCYk3+11/U5/4KhcQ/syie98Bld+RACgcpmuoEYFLcswUAvSEs1j3lpjUJqtfZWwW99nEV/hA8fl8K8oGWUsC3V1t0/ho/Q8ThNWXsx0tIVrdu5aevBaj0OydK7ZYbntlYS9LwqxkSs2nRof48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930964; c=relaxed/simple;
	bh=eoAUFz98Go/kpd8FLUtOBymORC3A8ZQoiogBkj+sHPI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i5z6XkOpSH7ZV9YFBJUtl+M2DOMqKiUlabDkZ1zH3m+rjoWw3svNHnskGOUaY/P2eeK/HOn31Na4uxe8DsPI63dREaXacJ6Aq1R1ZjXcq1NQkjrsNnHpYvN/knHhOHSEm5JucXa03JxDEjHrgIm3AbfMxGKtNma2bV0GIPKN+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsnpnIk3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsnpnIk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785930962; x=1817466962;
  h=date:from:to:cc:subject:message-id;
  bh=eoAUFz98Go/kpd8FLUtOBymORC3A8ZQoiogBkj+sHPI=;
  b=AsnpnIk3mBEH8VtOonwM6e7+c/p8+lOZ6Y0iMmOW0+Dipc1ZQTkm2QN9
   mNn0SUHdqRxITNkrDiaobkeL0gZfUAadkbkOlDY2baBPMtKNbiiiuvPUf
   fzegOUTa6BUvGrAk1aYzOat2xPTNq0MWXNJja/SIz1IDpUYQcvdLdcJqz
   4Zn9uGnv+OH9BHP7iaFexAYw6sF1nW/PJGVZkotC8newQM+L7OFICQTDG
   yUQFd+a/CbNBazIhDdWg8ictIHUL6jGFFYAq0wTOaCo9r0I95qxqxzefo
   49b1EmDEEskPMAAQFZK6lZdc5EiADoE+w2id6YZMxmSHu5UyLlaetFPB5
   Q==;
X-CSE-ConnectionGUID: P1VfZ42RRIC6H7wuB6tptA==
X-CSE-MsgGUID: uTtQrvW+ShOXMIKQtewd5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90176917"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90176917"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 04:56:02 -0700
X-CSE-ConnectionGUID: DJS5PsmKTVmSvbvjOCos+g==
X-CSE-MsgGUID: wFV3Le5cREanoVXdbM88iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257928482"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2026 04:55:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wraE1-00000000CJz-1zLb;
	Wed, 05 Aug 2026 11:55:57 +0000
Date: Wed, 05 Aug 2026 19:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8973/12727]
 drivers/soc/fsl/qe/gpio.c:43:34: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202608051952.ADkLIB86-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
commit: 21d055109b2352542ac293872ca9113b42b6c55e [8973/12727] powerpc: Move CONFIG_QE_GPIO to SoC
config: arc-randconfig-r132-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051952.ADkLIB86-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051952.ADkLIB86-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051952.ADkLIB86-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/fsl/qe/gpio.c:42:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdata @@     got unsigned int [usertype] cpdata @@
   drivers/soc/fsl/qe/gpio.c:42:34: sparse:     expected restricted __be32 [usertype] cpdata
   drivers/soc/fsl/qe/gpio.c:42:34: sparse:     got unsigned int [usertype] cpdata
>> drivers/soc/fsl/qe/gpio.c:43:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir1 @@     got unsigned int [usertype] __v @@
   drivers/soc/fsl/qe/gpio.c:43:34: sparse:     expected restricted __be32 [usertype] cpdir1
   drivers/soc/fsl/qe/gpio.c:43:34: sparse:     got unsigned int [usertype] __v
>> drivers/soc/fsl/qe/gpio.c:44:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir2 @@     got unsigned int [usertype] __v @@
   drivers/soc/fsl/qe/gpio.c:44:34: sparse:     expected restricted __be32 [usertype] cpdir2
   drivers/soc/fsl/qe/gpio.c:44:34: sparse:     got unsigned int [usertype] __v
>> drivers/soc/fsl/qe/gpio.c:45:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar1 @@     got unsigned int [usertype] __v @@
   drivers/soc/fsl/qe/gpio.c:45:34: sparse:     expected restricted __be32 [usertype] cppar1
   drivers/soc/fsl/qe/gpio.c:45:34: sparse:     got unsigned int [usertype] __v
>> drivers/soc/fsl/qe/gpio.c:46:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar2 @@     got unsigned int [usertype] __v @@
   drivers/soc/fsl/qe/gpio.c:46:34: sparse:     expected restricted __be32 [usertype] cppar2
   drivers/soc/fsl/qe/gpio.c:46:34: sparse:     got unsigned int [usertype] __v
>> drivers/soc/fsl/qe/gpio.c:47:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpodr @@     got unsigned int [usertype] __v @@
   drivers/soc/fsl/qe/gpio.c:47:33: sparse:     expected restricted __be32 [usertype] cpodr
   drivers/soc/fsl/qe/gpio.c:47:33: sparse:     got unsigned int [usertype] __v
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:259:18: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer

vim +43 drivers/soc/fsl/qe/gpio.c

32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  36  
e9713655b29a47d drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  37  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  38  {
e9713655b29a47d drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  39  	struct qe_pio_regs __iomem *regs = qe_gc->regs;
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  40  
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06  41  	qe_gc->cpdata = ioread32be(&regs->cpdata);
1b9e89046c31fd3 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-12-03  42  	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @43  	qe_gc->saved_regs.cpdir1 = ioread32be(&regs->cpdir1);
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @44  	qe_gc->saved_regs.cpdir2 = ioread32be(&regs->cpdir2);
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @45  	qe_gc->saved_regs.cppar1 = ioread32be(&regs->cppar1);
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @46  	qe_gc->saved_regs.cppar2 = ioread32be(&regs->cppar2);
3f39f38ea91dc26 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @47  	qe_gc->saved_regs.cpodr = ioread32be(&regs->cpodr);
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  48  }
32def337aafee0b arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  49  

:::::: The code at line 43 was first introduced by commit
:::::: 3f39f38ea91dc2603dcb7dc8a16ee3dbe10bd34b soc: fsl: qe: replace qe_io{read,write}* wrappers by generic io{read,write}*

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Li Yang <leoyang.li@nxp.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
