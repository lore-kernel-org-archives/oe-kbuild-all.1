Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C8A959
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 20:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694552197; x=1726088197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OXPzaPgkhoRYGGIT8WhoXADv2BFgMbsW5N7wSX1ttgg=;
  b=NAVs3tNTCaTTPfsNwJyVkDFqlvRreUxwcOYwpSQQSmSI49ZR2AvHITce
   /HBWyS+FFgQYkZI4Attm6DVwMzfQ8Gcah4DZ32Qyoi3ioqidN3s7/XhWk
   L+O9IaB4Sv7UXPAu0lAd2OLCDzKojkwnE+hIvx3b3wpAGZIKf8A/4A6Sa
   htmYamBUetw/4mciLGt7CN6QTgDc/R7Tie1qFLE9PioKNTSCQo0mqafpr
   l7+juI5XNYteAvrOm4YhkahGqmwUFkvNhObctQJ2yB37RFY8u7zbDbya+
   qiz5zwOj80KVbjBzeL8QUWK3Ts/NeQZh3Kb7UY8KoA0usp0oqoh27NC/C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368757576"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368757576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 13:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887079187"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="887079187"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2023 13:56:07 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgAQz-0000G3-1Q;
	Tue, 12 Sep 2023 20:56:33 +0000
Date: Wed, 13 Sep 2023 04:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:serial 6/74] include/linux/serial_core.h:616:9: sparse:
 sparse: incompatible types in comparison expression (different base types):
Message-ID: <202309130428.4HhHGJl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git serial
head:   75adfb6dc779d7c86a2e31b3ca6b266b8a8ef854
commit: 5022835b8285ab19d4c175f00091977c2a40c5f7 [6/74] serial: 8250: Use port lock wrappers
config: x86_64-randconfig-121-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130428.4HhHGJl2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130428.4HhHGJl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130428.4HhHGJl2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/serial/8250/8250_core.c: note: in included file (through include/linux/serial_8250.h):
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
--
   drivers/tty/serial/8250/8250_port.c: note: in included file (through include/linux/serial_8250.h):
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **
   include/linux/serial_core.h:639:16: sparse: sparse: incompatible types in comparison expression (different base types):
   include/linux/serial_core.h:639:16: sparse:    unsigned long *
   include/linux/serial_core.h:639:16: sparse:    unsigned long **
   include/linux/serial_core.h:639:16: sparse: sparse: incompatible types in comparison expression (different base types):
   include/linux/serial_core.h:639:16: sparse:    unsigned long *
   include/linux/serial_core.h:639:16: sparse:    unsigned long **
   include/linux/serial_core.h:639:16: sparse: sparse: incompatible types in comparison expression (different base types):
   include/linux/serial_core.h:639:16: sparse:    unsigned long *
   include/linux/serial_core.h:639:16: sparse:    unsigned long **
   include/linux/serial_core.h:639:16: sparse: sparse: incompatible types in comparison expression (different base types):
   include/linux/serial_core.h:639:16: sparse:    unsigned long *
   include/linux/serial_core.h:639:16: sparse:    unsigned long **
>> include/linux/serial_core.h:616:9: sparse: sparse: incompatible types in comparison expression (different base types):
>> include/linux/serial_core.h:616:9: sparse:    unsigned long *
>> include/linux/serial_core.h:616:9: sparse:    unsigned long **

vim +616 include/linux/serial_core.h

7887baec9d8546 Thomas Gleixner 2023-09-08  608  
7887baec9d8546 Thomas Gleixner 2023-09-08  609  /**
7887baec9d8546 Thomas Gleixner 2023-09-08  610   * uart_port_lock_irqsave - Lock the UART port, save and disable interrupts
7887baec9d8546 Thomas Gleixner 2023-09-08  611   * @up:		Pointer to UART port structure
7887baec9d8546 Thomas Gleixner 2023-09-08  612   * @flags:	Pointer to interrupt flags storage
7887baec9d8546 Thomas Gleixner 2023-09-08  613   */
7887baec9d8546 Thomas Gleixner 2023-09-08  614  static inline void uart_port_lock_irqsave(struct uart_port *up, unsigned long *flags)
7887baec9d8546 Thomas Gleixner 2023-09-08  615  {
7887baec9d8546 Thomas Gleixner 2023-09-08 @616  	spin_lock_irqsave(&up->lock, flags);
7887baec9d8546 Thomas Gleixner 2023-09-08  617  }
7887baec9d8546 Thomas Gleixner 2023-09-08  618  

:::::: The code at line 616 was first introduced by commit
:::::: 7887baec9d85468ea43d70b614fc3f51f7206793 serial: core: Provide port lock wrappers

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
