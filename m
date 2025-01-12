Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4362556E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675990; cv=none; b=YVsMKncMIpMKDprpNh/6o7yf/LAZKIR9Ni3ZdMrQMvpfDfCt/T0CAEDGu/vtAkquc9relW5TRfPNynYBwMkVAqjf++gNQaJAgoBvMf46TlxSeBCK7b+wLNsSwsj0PF622B0JOjvAJE1D6XkvPKIA0xSESxwByAA/Xe4ZJxAMwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675990; c=relaxed/simple;
	bh=OmIPLaQ8w3RbLkOsEeShaKfemsz92J6iISivG0Y0Psc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWo/eXJwSeR39325wuxvtfzf+u7LP+cl+77N+QaApuveeEIPnm5ce7yUVZzWat/AJnAF4XSEdZfhzZEoa14jiAboW1g0uvGiWyM4CnIXGQSY9uRBgNJiC/v7MXyFSPY/diQ5XUKdtLZXAekzgew4l2UWv7cHYp9LVcs/3F9xvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkOP9D1/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkOP9D1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736675989; x=1768211989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmIPLaQ8w3RbLkOsEeShaKfemsz92J6iISivG0Y0Psc=;
  b=bkOP9D1/ezmEh2BspVDUTQJxQ/GNaqVnfEbxeTDDzgfVZhJlkcNA2/67
   Gynpmkpy7+4xjaj2wbEmbDzoD2Pn8fEhqzsdatHOh3/+e+xjHbxQlJAf/
   a68VxqqtXGF59HRSEZt+5Bkmc+coQW8t0EjKw8a71GYlfQZ2JOMZJ6tiv
   65MeKQMH4eFazskf8QvZygIXirsd28uhS/bvrT19eSqTJQTGtxOFfFsoL
   UbLaTLgSWAnQMdvcKs3fxFU5GFW9d4lrN7uVnVcxQNqeZva9uMGDAJAP0
   Ev2SWldgtGUsiDBe+NoRx9AaobyX3/UA0+1fbttBwDXgyR8pZZViuEXRI
   g==;
X-CSE-ConnectionGUID: hjgyQD9zRXCAWfri0psAgw==
X-CSE-MsgGUID: bbXdBZ8hRIWX0+NLGfrvag==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47490621"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="47490621"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 01:59:49 -0800
X-CSE-ConnectionGUID: h9LzCIY7TBuo9w0dDFVO1g==
X-CSE-MsgGUID: 5aA0zSQBRei+9GryauQOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135038538"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2025 01:59:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWukz-000Ln3-1O;
	Sun, 12 Jan 2025 09:59:45 +0000
Date: Sun, 12 Jan 2025 17:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/pic32_uart.c:904:34: warning:
 'pic32_serial_dt_ids' defined but not used
Message-ID: <202501121741.fRJ050Ah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: e3e7b13bffae85e2806c73e3ccacd4447bcb19ed serial: allow COMPILE_TEST for some drivers
date:   2 years, 9 months ago
config: mips-randconfig-s051-20221112 (https://download.01.org/0day-ci/archive/20250112/202501121741.fRJ050Ah-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121741.fRJ050Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121741.fRJ050Ah-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/pic32_uart.c:904:34: warning: 'pic32_serial_dt_ids' defined but not used [-Wunused-const-variable=]
     904 | static const struct of_device_id pic32_serial_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/pic32_serial_dt_ids +904 drivers/tty/serial/pic32_uart.c

157b9394709ed5 Andrei Pistirica 2016-01-13  903  
157b9394709ed5 Andrei Pistirica 2016-01-13 @904  static const struct of_device_id pic32_serial_dt_ids[] = {
157b9394709ed5 Andrei Pistirica 2016-01-13  905  	{ .compatible = "microchip,pic32mzda-uart" },
157b9394709ed5 Andrei Pistirica 2016-01-13  906  	{ /* sentinel */ }
157b9394709ed5 Andrei Pistirica 2016-01-13  907  };
157b9394709ed5 Andrei Pistirica 2016-01-13  908  MODULE_DEVICE_TABLE(of, pic32_serial_dt_ids);
157b9394709ed5 Andrei Pistirica 2016-01-13  909  

:::::: The code at line 904 was first introduced by commit
:::::: 157b9394709ed5233288986a293405def22792ed serial: pic32_uart: Add PIC32 UART driver

:::::: TO: Andrei Pistirica <andrei.pistirica@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
