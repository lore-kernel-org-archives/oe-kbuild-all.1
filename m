Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FCA1581EE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322340; cv=none; b=t4hzfi2CxsjE/oMyorubo58bnzXAPPRsoSrI+OrS1zgzcR1oYx1YyoOnGa0p/hfN1hwU6jWqeBw3dawpcAhHVRFYXEU9lXBlraprB13xYmqzS8/wgcFyQA+JtBiVuKeP3QdCNMUGbNBQZz0lroTT+sOFbuMv3+KPnL+qCwIWu8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322340; c=relaxed/simple;
	bh=3CaSN3Ol+/TL0PBFk7oLcHwlBkd7gJpJDmiiao9qY20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCcs26zwZxFI5baq2ou4Xro690SmjwmpOTtOuuRFhexIZSWULh1Z3HqN370c6OlHHkz+Ou1FNw5sVwKEKNPxmVb4nC/15k3y3bi1HCr5iARs1lBecmuH8NETiE/C4GpLBw3TBF5ySJ71dRJt5Dlcllg1AxtehODqnL+Jf1IZ0v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejyY3rH8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejyY3rH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738322338; x=1769858338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CaSN3Ol+/TL0PBFk7oLcHwlBkd7gJpJDmiiao9qY20=;
  b=ejyY3rH8m8ftHawlO+95rgZinjMU5HnT/WcRT1A/AuY1JAQ/YnAzSXOV
   1b4UARdR4DvI+7/2z0pdMwUdij+kFVlt2czYz8P0tliGiAWiIHovmlO0m
   Pju2Q9pyFuksCb5or9mjmg3yWWO2ux/ORgIjjX5FNsWhMtIfbpyj4Llxi
   fA6POQvRfugD37Srg0Uczl3Dlgf9xZcl+j72UJhKREml+vWIKNRPAWcOk
   XADZRHRvo6ar98vT2Zi7xdwQJjupP1ndUTTDIF7SaoZryau070ALwZUR9
   BNnQWP3ZiNofwqYWac3r4owViBiR8ICwF4UcotYkueXPWTQ/dwx2DRKH/
   Q==;
X-CSE-ConnectionGUID: h2ZepN5BT+WrKWKt3ZW3sA==
X-CSE-MsgGUID: xApxyqiHRUes42kb5KfrkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38593156"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="38593156"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 03:18:58 -0800
X-CSE-ConnectionGUID: dlH5B5+1TDeMaCoKc4al4w==
X-CSE-MsgGUID: Y9IuS9uGTa+N0u3ohoc8wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140487164"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 03:18:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdp30-000mIZ-08;
	Fri, 31 Jan 2025 11:18:54 +0000
Date: Fri, 31 Jan 2025 19:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 49/53] drivers/tty/serial/arc_uart.c:116:10: error:
 'struct uart_driver' has no member named 'nr'
Message-ID: <202501311906.xuYl3JLY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   49d2ec1c49130aef08df8d571310a02866a117a7
commit: a79ca9cf1590b4c025eb1af2fd9892b562421525 [49/53] serial: remove nr
config: x86_64-buildonly-randconfig-003-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311906.xuYl3JLY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311906.xuYl3JLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311906.xuYl3JLY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/arc_uart.c:116:10: error: 'struct uart_driver' has no member named 'nr'
     116 |         .nr             = CONFIG_SERIAL_ARC_NR_PORTS,
         |          ^~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   ./include/generated/autoconf.h:996:36: warning: initialization of 'struct console *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     996 | #define CONFIG_SERIAL_ARC_NR_PORTS 1
         |                                    ^
   drivers/tty/serial/arc_uart.c:116:27: note: in expansion of macro 'CONFIG_SERIAL_ARC_NR_PORTS'
     116 |         .nr             = CONFIG_SERIAL_ARC_NR_PORTS,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/generated/autoconf.h:996:36: note: (near initialization for 'arc_uart_driver.cons')
     996 | #define CONFIG_SERIAL_ARC_NR_PORTS 1
         |                                    ^
   drivers/tty/serial/arc_uart.c:116:27: note: in expansion of macro 'CONFIG_SERIAL_ARC_NR_PORTS'
     116 |         .nr             = CONFIG_SERIAL_ARC_NR_PORTS,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +116 drivers/tty/serial/arc_uart.c

2ac4ad2a146812 Vineet Gupta 2012-10-27  109  
2ac4ad2a146812 Vineet Gupta 2012-10-27  110  static struct uart_driver arc_uart_driver = {
2ac4ad2a146812 Vineet Gupta 2012-10-27  111  	.owner		= THIS_MODULE,
2ac4ad2a146812 Vineet Gupta 2012-10-27  112  	.driver_name	= DRIVER_NAME,
2ac4ad2a146812 Vineet Gupta 2012-10-27  113  	.dev_name	= ARC_SERIAL_DEV_NAME,
2ac4ad2a146812 Vineet Gupta 2012-10-27  114  	.major		= 0,
2ac4ad2a146812 Vineet Gupta 2012-10-27  115  	.minor		= 0,
2ac4ad2a146812 Vineet Gupta 2012-10-27 @116  	.nr		= CONFIG_SERIAL_ARC_NR_PORTS,
2ac4ad2a146812 Vineet Gupta 2012-10-27  117  #ifdef CONFIG_SERIAL_ARC_CONSOLE
2ac4ad2a146812 Vineet Gupta 2012-10-27  118  	.cons		= &arc_console,
2ac4ad2a146812 Vineet Gupta 2012-10-27  119  #endif
2ac4ad2a146812 Vineet Gupta 2012-10-27  120  };
2ac4ad2a146812 Vineet Gupta 2012-10-27  121  

:::::: The code at line 116 was first introduced by commit
:::::: 2ac4ad2a1468123f6bb439a547880a9c0d302e0a serial/arc-uart: Add new driver

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
