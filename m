Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF0321F2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786585266; cv=none; b=i1NZq0zpmHEC8dVFM2IkSWO9qghfDgXqGkmvqFY3txWZw3iRiTFAyS/tylpQyv/4vwF/RHEuUYQN1X8eMMXY9KwzbS5eYMsQ0RQiEo8Kd26wlfOpyFG8xXWmu8LStCAgBqhnES5VDsXojE4mjOsW5Di7vbD6sL3Q59eFAMFdqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786585266; c=relaxed/simple;
	bh=EbuUyFo2rFN6CMX6J2Pbfsxaad04ZeR+SBSHCpJIwZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NkKo1nWgUBh+PTFq2hPw/2ZRNn7OCNU4+G9W7CU/6nZWs0y+sC04T5edLiFzjIrP7o2S3KNy+qp0uWiBqaCSaKp7v6hzPly02wA77wAc4C1swmYiizTu2hTF8lUzrRDTvYzT+nQL2Up4yJBn+XGrdMXlk3z4OtzFEfP59ZyLAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ2+qurQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ2+qurQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786585264; x=1818121264;
  h=date:from:to:cc:subject:message-id;
  bh=EbuUyFo2rFN6CMX6J2Pbfsxaad04ZeR+SBSHCpJIwZQ=;
  b=RJ2+qurQqXLy9iTNXBq8CRof3W675gcR+0EUIsKwK2KnoXBETeIQx7hI
   8acURV98y9eTXeYWzJJySnBNwssy6IrGjb0WKrqvVvOU+v3haXtdE+sAl
   SCwSIp8hWAp3/P1X7zNDuemGLCXYpg1daBgCcOQ1Inr5P29PtG5fTypWe
   HVSANXSvH+uP+obDWXWPW7mApljs4jBYCn2ruasR1/FjCWywxxNHocFPP
   a3Ov8+xvXkQsiEpRSuZX0DcrvVa+NikhUrckKuglqRwbTnlsfhayaW3eS
   ZdztwmP3LylRbPEuql4DXjHcGb9yoCwk10U2ojXIgECHtbJCj8Y/JyZ1W
   Q==;
X-CSE-ConnectionGUID: 41PmNkcoQNGRMvJGYbLo9g==
X-CSE-MsgGUID: a+VbViJXTxu4nU4Fz/7LAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87014976"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87014976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:41:04 -0700
X-CSE-ConnectionGUID: JBAvN0awTRCRkxLxhqzALg==
X-CSE-MsgGUID: vR+BCj0sTJWINiKI/jyQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267657902"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Aug 2026 18:41:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuKRG-00000000SPM-3jG7;
	Thu, 13 Aug 2026 01:40:59 +0000
Date: Thu, 13 Aug 2026 09:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8662/14447]
 drivers/soc/fsl/qe/gpio.c:42:34: sparse: sparse: incorrect type in assignment
 (different base types)
Message-ID: <202608130908.gEy44F1D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christophe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
commit: 21d055109b2352542ac293872ca9113b42b6c55e [8662/14447] powerpc: Move CONFIG_QE_GPIO to SoC
config: parisc-randconfig-r111-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130908.gEy44F1D-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130908.gEy44F1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130908.gEy44F1D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/fsl/qe/gpio.c:42:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdata @@     got unsigned int [usertype] cpdata @@
   drivers/soc/fsl/qe/gpio.c:42:34: sparse:     expected restricted __be32 [usertype] cpdata
   drivers/soc/fsl/qe/gpio.c:42:34: sparse:     got unsigned int [usertype] cpdata
   drivers/soc/fsl/qe/gpio.c:43:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir1 @@     got unsigned int @@
   drivers/soc/fsl/qe/gpio.c:43:34: sparse:     expected restricted __be32 [usertype] cpdir1
   drivers/soc/fsl/qe/gpio.c:43:34: sparse:     got unsigned int
   drivers/soc/fsl/qe/gpio.c:44:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir2 @@     got unsigned int @@
   drivers/soc/fsl/qe/gpio.c:44:34: sparse:     expected restricted __be32 [usertype] cpdir2
   drivers/soc/fsl/qe/gpio.c:44:34: sparse:     got unsigned int
   drivers/soc/fsl/qe/gpio.c:45:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar1 @@     got unsigned int @@
   drivers/soc/fsl/qe/gpio.c:45:34: sparse:     expected restricted __be32 [usertype] cppar1
   drivers/soc/fsl/qe/gpio.c:45:34: sparse:     got unsigned int
>> drivers/soc/fsl/qe/gpio.c:46:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar2 @@     got unsigned int @@
   drivers/soc/fsl/qe/gpio.c:46:34: sparse:     expected restricted __be32 [usertype] cppar2
   drivers/soc/fsl/qe/gpio.c:46:34: sparse:     got unsigned int
>> drivers/soc/fsl/qe/gpio.c:47:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpodr @@     got unsigned int @@
   drivers/soc/fsl/qe/gpio.c:47:33: sparse:     expected restricted __be32 [usertype] cpodr
   drivers/soc/fsl/qe/gpio.c:47:33: sparse:     got unsigned int
   drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:259:18: sparse: sparse: restricted __be32 degrades to integer
   drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer

vim +42 drivers/soc/fsl/qe/gpio.c

32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  36  
e9713655b29a47 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  37  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  38  {
e9713655b29a47 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  39  	struct qe_pio_regs __iomem *regs = qe_gc->regs;
32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  40  
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06  41  	qe_gc->cpdata = ioread32be(&regs->cpdata);
1b9e89046c31fd arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-12-03 @42  	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @43  	qe_gc->saved_regs.cpdir1 = ioread32be(&regs->cpdir1);
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @44  	qe_gc->saved_regs.cpdir2 = ioread32be(&regs->cpdir2);
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06  45  	qe_gc->saved_regs.cppar1 = ioread32be(&regs->cppar1);
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @46  	qe_gc->saved_regs.cppar2 = ioread32be(&regs->cppar2);
3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @47  	qe_gc->saved_regs.cpodr = ioread32be(&regs->cpodr);
32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  48  }
32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  49  

:::::: The code at line 42 was first introduced by commit
:::::: 1b9e89046c31fd39d08742915b6bd72f6c239608 powerpc/qe: Implement QE Pin Multiplexing API

:::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
