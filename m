Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F621A429
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714115; cv=none; b=udbgMbda1/H0hocwiZdKPeJsvfoyjxTBSdEmPMYZfIsdMSSF+f8V+OuIGDfSqr+6nbXMf8k9SA/aITH1IHLVeb7p/aV3j5h5OQYMAHehH6Rax/Fn/eTcHmHJE5/lXdlGzuxpdqoW+9o3f7FEo2R2Y7F5bPRejjtMXkIoHNaL0BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714115; c=relaxed/simple;
	bh=dsMoohsMOqhw1FHS0DvwApwi9E2nv9UzyoK24HWTZjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYDa3VoCNiy0HricP34weN9cL/Uwt8wfRsdy5PqPPnX9QH5EHw7IwCCcOIEjqPgXTtdsTeAB34th31WnQYmUbQN4bcUnj4eBDvyjYTrn7Pk3lS7BZ/AaPhEXYoHi4HO0lrq7FrZ9EJw5PWujtRx1g71GLalt+kgOjY8RwqLfnZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W78wBk9A; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W78wBk9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734714113; x=1766250113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsMoohsMOqhw1FHS0DvwApwi9E2nv9UzyoK24HWTZjY=;
  b=W78wBk9AzuRli4afb+mtnm7P2tTfiCN5EXSCnL6ZDb2uW3IIYRFWPpQf
   a0BPsNLxxJY4gO57QLD67ogalMYzJXHRURze26c+n0LQRuYx4cMaTzUVJ
   tdKa/5UaiMpLqgsGjDZW5XXuO6mlsP3jxghkBMNKxPJqOTlgwFw6nlvJP
   TS5JWm8Sh4lRzayG4MQZxiTueJmVQsnI2iekNNW+G4P3zEzTPlHjy7ju1
   dShwnN3PZRE6W0g2imEbW/HnYFstvsYAv4s2tb8wEudHB99GYPpJx9PGG
   lbwG6uljDJL5/Fx41MPeq7be/l5yZqu466/5n3uHfLR630kSxl9ly6IfA
   A==;
X-CSE-ConnectionGUID: aisomV0hTsqwScRf85kFFw==
X-CSE-MsgGUID: drTLnvrvR0GkG9aYQDE2xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52672398"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="52672398"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:01:52 -0800
X-CSE-ConnectionGUID: kPCOucCfRjiIno2ROAUi6A==
X-CSE-MsgGUID: CHkHHhajS+KYQqU4kTcN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98337394"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 09:01:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgNo-0001S3-1a;
	Fri, 20 Dec 2024 17:01:48 +0000
Date: Sat, 21 Dec 2024 01:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 14/19] arch/x86/kernel/early_printk.c:148:17:
 error: 'kexec_debug_8250_port' undeclared
Message-ID: <202412210049.ucaK8wXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug
head:   fb9fab65d35df319f262a75718987d66f83a088d
commit: 795b69a26ecdda37c76c71c1dffe41290f7611f8 [14/19] x86/kexec: Add 8250 serial port output
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241221/202412210049.ucaK8wXV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210049.ucaK8wXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210049.ucaK8wXV-lkp@intel.com/

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
