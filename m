Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E31DDC1D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 02:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749523857; cv=none; b=WkIZIe2MSlyT3fs5jL3ABOjvSQJ5qZp0Hx3oMiqjdFflXqoqIk0xB+Qxga46Fi4iGXxNG5eIh6nlxBZ5ItTgDCehzvtPBV2dMVX509HrDPapzGrmDlFzkljzv2i1k02g0x3OCmwhKT+nbiSrqgjPEnq10WvigTiG1OImrXTdJIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749523857; c=relaxed/simple;
	bh=ntyx1houRqDI5d93mQHgwcX5QsLqIusP8Cg9tp6xBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e53NKOlwbCWmZXvnQ/IDft8ZLuIUVyh2eEwiUtDFbQLwwA2MWryYUlKA1qxZd+bwWEtJlkbovJvlWt33uYy7flm5mBCLCnQyEEbc2efFB0su/2MzBnSQ2qOIzbtsu4ja6aRUcMJtel135cKK1aEcZDXB2cQuK2u+4L1TbLyWQjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLr2OL+O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLr2OL+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749523855; x=1781059855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntyx1houRqDI5d93mQHgwcX5QsLqIusP8Cg9tp6xBlw=;
  b=SLr2OL+OqE08XZ4S+cdJPM54cU8WQ7TNEgq6A4fbqVFHRcqxcX3dzt5V
   ANhKWMsPfBw9OVB+9+vl3mKAk2P1nbDXZXi5TEJkwDz9Dcn3bFDZHUbWr
   1QcRrWe25tKrLctL2/yQ/P2o6duys86EzCMsHkQS5ZcmoYk3Zxd1aCWxR
   B2YykrV7N4JSHxXjVXRyOllF1aICuYWbQCIbmF5C5JGAxALdUhl2W5Nd9
   mhLPFKFA6QFcnhG3X1SmqgIc85X8B0HrP678pMAehY4grj35ryx+j4WmA
   vynnrhrPkIPO/8lvcMdQRUg8nErUub3oExJfDpv3kbAd3CWU8HKVaOrUU
   g==;
X-CSE-ConnectionGUID: KZPahBDLQuS1C49QgWLRnw==
X-CSE-MsgGUID: Pg2HQZjJS2yAkAIwpN870g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51710687"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51710687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 19:50:55 -0700
X-CSE-ConnectionGUID: iPsAQTUsTcKEXnWGosfA4w==
X-CSE-MsgGUID: BWmZnmhwTQytqEQGgt4e2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="151500127"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 19:50:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOp4d-0007fd-1J;
	Tue, 10 Jun 2025 02:50:51 +0000
Date: Tue, 10 Jun 2025 10:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 53/90] drivers/tty/serial/serial_core.c:1087:6:
 warning: unused variable 'result'
Message-ID: <202506101035.cEBHA2Ng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ddc23bf3036b252a58a07fbcf74b3a0a6cb3582d
commit: 555da4e8dcbc70496db3e4cf4c9e15ab0e1a2bd2 [53/90] serial_core: use GUARDs
config: arm-randconfig-002-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101035.cEBHA2Ng-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101035.cEBHA2Ng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101035.cEBHA2Ng-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/serial_core.c: In function 'uart_tiocmget':
>> drivers/tty/serial/serial_core.c:1087:6: warning: unused variable 'result' [-Wunused-variable]
     int result;
         ^~~~~~


vim +/result +1087 drivers/tty/serial/serial_core.c

^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1081  
60b33c133ca0b7 drivers/tty/serial/serial_core.c Alan Cox          2011-02-14  1082  static int uart_tiocmget(struct tty_struct *tty)
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1083  {
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1084  	struct uart_state *state = tty->driver_data;
a2bceae065ed8c drivers/serial/serial_core.c     Alan Cox          2009-09-19  1085  	struct tty_port *port = &state->port;
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley      2016-04-09  1086  	struct uart_port *uport;
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08 @1087) 	int result;
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08  1088) 
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08  1089) 	guard(mutex)(&port->mutex);
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1090  
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley      2016-04-09  1091  	uport = uart_port_check(state);
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08  1092) 	if (!uport || tty_io_error(tty))
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08  1093) 		return -EIO;
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley      2016-04-09  1094  
555da4e8dcbc70 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2025-04-15  1095) 	guard(uart_port_lock_irq)(uport);
5879adbff5aad0 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2024-08-08  1096) 
555da4e8dcbc70 drivers/tty/serial/serial_core.c Jiri Slaby (SUSE  2025-04-15  1097) 	return uport->mctrl | uport->ops->get_mctrl(uport);
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1098  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds    2005-04-16  1099  

:::::: The code at line 1087 was first introduced by commit
:::::: 5879adbff5aad0436298db006a922dd576339c7f serial: use guards for simple mutex locks

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
