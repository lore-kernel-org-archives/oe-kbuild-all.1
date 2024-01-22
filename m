Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBF3CF63
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705930558; cv=none; b=YGaOYSKgjzGaPPV/WLPYE03DLS7I5tndnMRV5woX2ugebEEmQGivWnriULIdTboc2RKncxWMY/TPCQZp0qNGTQQMt8iZ/jrR3hj6yZXnc8MhrbsSeU6oPB7vyMNTLh1L8jL73t/mxhv8fVq6Z89kWodcF4iBIRKgR1QpuXRYIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705930558; c=relaxed/simple;
	bh=NEsX1FCeJqfQDVgBXKnZmDXQUqfSUgVSGhKwXiagV7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTvhHy3VWutzHX4nhfNS3tdjrFzhVgNBXsOQ1N1rPZAOw/atr7XqugxZtwdHCPV1XCJ++fbEtSPINDvN1acwqPN5J2ytNxyiIde2ciccWCFgkQiwuYFbsmmGwBHlG/wdqvtyMxrAqdNJ6sPhpDDItIW9R96CvbWWvBZJ51lSyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StvAIkHq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StvAIkHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705930557; x=1737466557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEsX1FCeJqfQDVgBXKnZmDXQUqfSUgVSGhKwXiagV7g=;
  b=StvAIkHqoBDfYcmpu8mNZh6K1AUgwtc/cuNC95T6iwoaFBm61bhKSAI3
   +D4T2BuqFb3NMcCqR4zEUg5y17US4HR8qzcIEV/gBdOLkMFPwdX4CVhUI
   6Q6fenTNnmSNC+ZLIXXMniiQQufi8k7u2W4kKDujy4UVtEzq+s2QJYB44
   9TQCn+s6QiGelPBPgCL3o1lcgY/qT5Ef+WJeTz8uJmG7RbzD8F8YgMMl6
   4DkvW/vfMdWWVnDzD1XNU6S+evddwBSNrdVZ2Fj/JRiMFa6+hpetTqsMN
   IsGHRwDWD3dv+yvWGhqAcspjrZpXYAhXExcRwCko2VVza5kchtH7Uy4Qu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1066959"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1066959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 05:35:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1185604"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2024 05:35:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRuSu-0006dS-0a;
	Mon, 22 Jan 2024 13:35:52 +0000
Date: Mon, 22 Jan 2024 21:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-peric0-usi-uart-i2c-v3-and-serial-fixes-v1-with-u32
 19/30] arch/mips/include/asm/irq.h:19:41: error: 'THREAD_SIZE' undeclared
Message-ID: <202401222120.cHvPl6Zn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-peric0-usi-uart-i2c-v3-and-serial-fixes-v1-with-u32
head:   938794931c239edc54401a31259d3eb27a2d717f
commit: 56bd958109f1492f0edb0507468d586cac01e81f [19/30] tty: serial: samsung: sort headers alphabetically
config: mips-randconfig-r052-20240122 (https://download.01.org/0day-ci/archive/20240122/202401222120.cHvPl6Zn-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401222120.cHvPl6Zn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401222120.cHvPl6Zn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/samsung_tty.c:24:
   arch/mips/include/asm/irq.h: In function 'on_irq_stack':
>> arch/mips/include/asm/irq.h:19:41: error: 'THREAD_SIZE' undeclared (first use in this function)
      19 | #define IRQ_STACK_SIZE                  THREAD_SIZE
         |                                         ^~~~~~~~~~~
   arch/mips/include/asm/irq.h:41:36: note: in expansion of macro 'IRQ_STACK_SIZE'
      41 |         unsigned long high = low + IRQ_STACK_SIZE;
         |                                    ^~~~~~~~~~~~~~
   arch/mips/include/asm/irq.h:19:41: note: each undeclared identifier is reported only once for each function it appears in
      19 | #define IRQ_STACK_SIZE                  THREAD_SIZE
         |                                         ^~~~~~~~~~~
   arch/mips/include/asm/irq.h:41:36: note: in expansion of macro 'IRQ_STACK_SIZE'
      41 |         unsigned long high = low + IRQ_STACK_SIZE;
         |                                    ^~~~~~~~~~~~~~


vim +/THREAD_SIZE +19 arch/mips/include/asm/irq.h

^1da177e4c3f41 include/asm-mips/irq.h      Linus Torvalds 2005-04-16  18  
fe8bd18ffea532 arch/mips/include/asm/irq.h Matt Redfearn  2016-12-19 @19  #define IRQ_STACK_SIZE			THREAD_SIZE
5fdc66e0462063 arch/mips/include/asm/irq.h Matt Redfearn  2017-07-10  20  #define IRQ_STACK_START			(IRQ_STACK_SIZE - 16)
fe8bd18ffea532 arch/mips/include/asm/irq.h Matt Redfearn  2016-12-19  21  

:::::: The code at line 19 was first introduced by commit
:::::: fe8bd18ffea5327344d4ec2bf11f47951212abd0 MIPS: Introduce irq_stack

:::::: TO: Matt Redfearn <matt.redfearn@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
