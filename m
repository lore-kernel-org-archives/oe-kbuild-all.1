Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D02452D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 22:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691618722; x=1723154722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrZ3SNWryF5xj3o/BjNfF43gi3v+wCEt0iuKSi1blL4=;
  b=iRi6lKHzX3a5H3hznsEp720Km8PO0aLOfMX33Kqu12bg5Lx00xMxYZQL
   Uhi3SGF0O5wu2pzqroZOz/WqBkorrJ0ItQNPv4mfzh66mvABCnJsWQRqy
   Voy3IRNyKZSWaQuN8NcKjaK7+MXzimUoLC4XQ06r0QQBtwqmFirPlGyzN
   iY142YvjlOJTyUDvk3/algkHuzsoI/nSmguYnRgOeWvb/TG+MCrFi6cep
   4UeoeoPRiTWe9d7Ey3vA2AX5FwXRXmi5IO+pvvJgY3ujws1Aiz3Wz4IGy
   a68urBUXTOBzZFSWNN0WoRSan0C7+kRi9jJQ8GeAZHkY+iY9Ckblxdk+P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="437598612"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="437598612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 15:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761549762"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="761549762"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 15:04:48 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTrIN-0006Re-0M;
	Wed, 09 Aug 2023 22:04:47 +0000
Date: Thu, 10 Aug 2023 06:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Agner <stefan@agner.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [stable:linux-5.4.y 4477/9261] arch/arm/vfp/vfphw.S:49: Error:
 selected processor does not support `fstmiax r4!,{d0-d15}' in ARM mode
Message-ID: <202308100536.aqtOUENH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   21732fd224978ebddf4bded7cb99663d2be1e732
commit: 0a43679016f051fd78ab0355f9af6f6f4468149f [4477/9261] ARM: 8990/1: use VFP assembler mnemonics in register load/store macros
config: arm-randconfig-r024-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100536.aqtOUENH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100536.aqtOUENH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100536.aqtOUENH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/vfp/vfphw.S: Assembler messages:
>> arch/arm/vfp/vfphw.S:49: Error: selected processor does not support `fstmiax r4!,{d0-d15}' in ARM mode
   arch/arm/vfp/vfphw.S:108:  Info: macro invoked from here


vim +49 arch/arm/vfp/vfphw.S

^1da177e4c3f41 Linus Torvalds 2005-04-16  21  
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  	.macro	DBGSTR, str
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  #ifdef DEBUG
^1da177e4c3f41 Linus Torvalds 2005-04-16  24  	stmfd	sp!, {r0-r3, ip, lr}
ded3ef0fa71696 Russell King   2013-02-26  25  	ldr	r0, =1f
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  	bl	printk
ded3ef0fa71696 Russell King   2013-02-26  27  	ldmfd	sp!, {r0-r3, ip, lr}
ded3ef0fa71696 Russell King   2013-02-26  28  
ded3ef0fa71696 Russell King   2013-02-26  29  	.pushsection .rodata, "a"
ded3ef0fa71696 Russell King   2013-02-26  30  1:	.ascii	KERN_DEBUG "VFP: \str\n"
ded3ef0fa71696 Russell King   2013-02-26  31  	.byte	0
ded3ef0fa71696 Russell King   2013-02-26  32  	.previous
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  34  	.endm
^1da177e4c3f41 Linus Torvalds 2005-04-16  35  
^1da177e4c3f41 Linus Torvalds 2005-04-16  36  	.macro  DBGSTR1, str, arg
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  #ifdef DEBUG
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  	stmfd	sp!, {r0-r3, ip, lr}
^1da177e4c3f41 Linus Torvalds 2005-04-16  39  	mov	r1, \arg
ded3ef0fa71696 Russell King   2013-02-26  40  	ldr	r0, =1f
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  	bl	printk
ded3ef0fa71696 Russell King   2013-02-26  42  	ldmfd	sp!, {r0-r3, ip, lr}
ded3ef0fa71696 Russell King   2013-02-26  43  
ded3ef0fa71696 Russell King   2013-02-26  44  	.pushsection .rodata, "a"
ded3ef0fa71696 Russell King   2013-02-26  45  1:	.ascii	KERN_DEBUG "VFP: \str\n"
ded3ef0fa71696 Russell King   2013-02-26  46  	.byte	0
ded3ef0fa71696 Russell King   2013-02-26  47  	.previous
^1da177e4c3f41 Linus Torvalds 2005-04-16  48  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16 @49  	.endm
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  	.macro  DBGSTR3, str, arg1, arg2, arg3
^1da177e4c3f41 Linus Torvalds 2005-04-16  52  #ifdef DEBUG
^1da177e4c3f41 Linus Torvalds 2005-04-16  53  	stmfd	sp!, {r0-r3, ip, lr}
^1da177e4c3f41 Linus Torvalds 2005-04-16  54  	mov	r3, \arg3
^1da177e4c3f41 Linus Torvalds 2005-04-16  55  	mov	r2, \arg2
^1da177e4c3f41 Linus Torvalds 2005-04-16  56  	mov	r1, \arg1
ded3ef0fa71696 Russell King   2013-02-26  57  	ldr	r0, =1f
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  	bl	printk
ded3ef0fa71696 Russell King   2013-02-26  59  	ldmfd	sp!, {r0-r3, ip, lr}
ded3ef0fa71696 Russell King   2013-02-26  60  
ded3ef0fa71696 Russell King   2013-02-26  61  	.pushsection .rodata, "a"
ded3ef0fa71696 Russell King   2013-02-26  62  1:	.ascii	KERN_DEBUG "VFP: \str\n"
ded3ef0fa71696 Russell King   2013-02-26  63  	.byte	0
ded3ef0fa71696 Russell King   2013-02-26  64  	.previous
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  	.endm
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  
^1da177e4c3f41 Linus Torvalds 2005-04-16  68  

:::::: The code at line 49 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
