Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA72249E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 15:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436196; cv=none; b=f2QOpSMCab1f9b164/UxY6zrQa/zD+MUBKaoM1NSRZRYUPsrc06dIJoVTczRnrtPmN2m3tEROWvU9zRd2YwPZ9HEyp2gsCzEZMaQZmmfsZU3c7d5nZT9tKlUYeUodmqC084OS9LdqDMdRv4ek0en+uTpujMLueBgsMnEONU93L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436196; c=relaxed/simple;
	bh=Y7OQZfCzVZSjAfWma47XWqztZSwfR1bk1era98usLpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKdvcQJofGQnP6OwgPUafBLK+v8U7MGW03KDruWytdUlEm3Qc6ZbQ5T4Sx7Ry0rwWUvApnMkr+tN354AJJTnD8D9xMnuvYFbSXfrlW7bq+nic0ShozdR6kMo20XUxb9w43bejGv0BjyV1hmTdohFAmBhIfHhlDIo5crMOPJip0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJXomOAf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJXomOAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736436195; x=1767972195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7OQZfCzVZSjAfWma47XWqztZSwfR1bk1era98usLpI=;
  b=hJXomOAf4tepNVjbTbUDivMUgBYIxL6FuPNCli/tgO54B0BqmAbhpbp1
   UI1neKXatZS3wZQVpZFoIndpGbimhb4h9Cgh6iGtAyN4K3r5Vb4uBZv18
   UowGleYsbT0Z24BUpUNyygT6QN58TMj4GxjNyhr3ZugtfJIBLpGCztgRL
   nQgew1ossCFtivs+ZU31RPdzN+ybGoDaRnbsFrH0vJ8cQN6xMPn2vZvqT
   UHVFi08sgItGNYTDTqHeq61GRBXBq4DClII1JS0XQmi9SPsC7hCBSMKBU
   U5Hx0u8C6JIvs6VJz2ycwTto82oON1P5y42zNrIk2EIz+STM6yBK7CeKJ
   Q==;
X-CSE-ConnectionGUID: zLb0okUWR9+S0L2qX7rDHA==
X-CSE-MsgGUID: c6A2NQXcRReQJSAMm/xjAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36599945"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36599945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:23:14 -0800
X-CSE-ConnectionGUID: /hUJ2ijmRsigpM9wbVQ3EA==
X-CSE-MsgGUID: L2NUb9mlQN+z+QkoRCv9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="134273362"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 07:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuNK-000HjR-3D;
	Thu, 09 Jan 2025 15:23:11 +0000
Date: Thu, 9 Jan 2025 23:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 14/19] arch/x86/kernel/early_printk.c:148:17:
 error: 'kexec_debug_8250_port' undeclared
Message-ID: <202501092339.M2pcVsb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   f68307270bcdae9b9d59997d0712eedb41dcc2b1
commit: 5449b2a6c3c2fbf3a7e564111bf48ec73646b6ca [14/19] x86/kexec: Add 8250 serial port output
config: i386-randconfig-014-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092339.M2pcVsb2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092339.M2pcVsb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092339.M2pcVsb2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/early_printk.c: In function 'early_serial_hw_init':
>> arch/x86/kernel/early_printk.c:148:17: error: 'kexec_debug_8250_port' undeclared (first use in this function)
     148 |                 kexec_debug_8250_port = early_serial_base;
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:148:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/kexec_debug_8250_port +148 arch/x86/kernel/early_printk.c

   130	
   131	static __init void early_serial_hw_init(unsigned divisor)
   132	{
   133		unsigned char c;
   134	
   135		serial_out(early_serial_base, LCR, 0x3);	/* 8n1 */
   136		serial_out(early_serial_base, IER, 0);	/* no interrupt */
   137		serial_out(early_serial_base, FCR, 0);	/* no fifo */
   138		serial_out(early_serial_base, MCR, 0x3);	/* DTR + RTS */
   139	
   140		c = serial_in(early_serial_base, LCR);
   141		serial_out(early_serial_base, LCR, c | DLAB);
   142		serial_out(early_serial_base, DLL, divisor & 0xff);
   143		serial_out(early_serial_base, DLH, (divisor >> 8) & 0xff);
   144		serial_out(early_serial_base, LCR, c & ~DLAB);
   145	
   146	#ifdef CONFIG_KEXEC_DEBUG
   147		if (serial_in == io_serial_in)
 > 148			kexec_debug_8250_port = early_serial_base;
   149	#endif
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
