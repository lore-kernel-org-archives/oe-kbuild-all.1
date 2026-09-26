Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10CA54705A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 00:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381266; cv=none; b=koRyaKX/tBArlRuP5sYFqNbHQTTqWNohtQikjwN0yObRATAPdlFM/pF/dZn6Y42bAlh+b+iNwAnHeXSfrju/MxBGRjSHATY3ms8Zo1S0LMICuSLb7slfIOlFP5kKxJ5FHO/vMJuU+VvWNmhN5gAA6Zuj+48N77hzYhIZI5PAEig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381266; c=relaxed/simple;
	bh=Wr1zUqZPhRQK4ryTpWzI3QtAa9LNGgR9ckigBTr4PMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dcvpDWzV0jrF2AJrkTtpRKcr0fxIIZp4V4ZhY8sp4+r405mks9aBzScyn2eq3AkFaeLYGWQDeHLDGc7vsfB2wUrOSgdKQLUYG9oNugEyWsY0DlPAsaYImsiXIRIrvL9tzh3R98QBMM8waCeIuHASE9m7u7E8eVUqBhYrnoPlAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE3Rak76; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE3Rak76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790381265; x=1821917265;
  h=date:from:to:cc:subject:message-id;
  bh=Wr1zUqZPhRQK4ryTpWzI3QtAa9LNGgR9ckigBTr4PMc=;
  b=ZE3Rak76TixBHjj5sIfXfgs0bs1pg0G9RyZeJAkUutDRyl0Y9mYP+06u
   TJRE6XLpKFCIff+YLzu9MnHpa/6ovnY2UTagtbGqrPoRn8nhZcN79K+il
   66/GeO5/sW9uDOeMC4MKWwZJiCtXJ3LuSHoUoSefLM6emyTvo8SQqAfJO
   Mn9WdM2ur0xnrnRyFADFph9+WPt/e+hL8tjN/IWIW3w67HoxEh+oKy6kZ
   D9CEcGN+qztjBhCZaFfTNWipmjpzHr7sf7Y3VTpHN5yQ2bVbMw4pM2acm
   whHf2r9bo7r3Rf1s1D7IOaDOWgqIzTNzQm+uFl6/OnKRTM5gMR1Yu3c+Y
   A==;
X-CSE-ConnectionGUID: FeY/c2xkTfCSG98Mtj7/lA==
X-CSE-MsgGUID: YVzbFKzNQROfMFFjnBaqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94053889"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94053889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 17:07:32 -0700
X-CSE-ConnectionGUID: H9ZC0H/0Rl6DLWEQSCAFsA==
X-CSE-MsgGUID: JnivJuNCR4Gn0Qca+xiXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273678493"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 17:07:26 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAFwl-0000000007H-32x0;
	Sat, 26 Sep 2026 00:07:19 +0000
Date: Sat, 26 Sep 2026 02:06:44 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 539/673]
 drivers/tty/serial/8250/8250_parisc.c:26:23: warning: variable 'address' set
 but not used
Message-ID: <202609260115.aZ7z6MSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: c859e8d1c0dd5308ff6e4ab5c280b589a191e1a4 [539/673] 8250: port settings
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609260115.aZ7z6MSb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260115.aZ7z6MSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260115.aZ7z6MSb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_parisc.c:21:
   drivers/tty/serial/8250/8250.h: In function 'serial8250_apply_quirks':
   drivers/tty/serial/8250/8250.h:226:36: error: 'skip_txen_test' undeclared (first use in this function)
     226 |                 up->port.quirks |= skip_txen_test ? UPQ_NO_TXEN_TEST : 0;
         |                                    ^~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250.h:226:36: note: each undeclared identifier is reported only once for each function it appears in
   drivers/tty/serial/8250/8250_parisc.c: In function 'serial_init_chip':
>> drivers/tty/serial/8250/8250_parisc.c:26:23: warning: variable 'address' set but not used [-Wunused-but-set-variable=]
      26 |         unsigned long address;
         |                       ^~~~~~~


vim +/address +26 drivers/tty/serial/8250/8250_parisc.c

^1da177e4c3f41 drivers/serial/8250_gsc.c          Linus Torvalds 2005-04-16  22  
8b4a483be54456 drivers/serial/8250_gsc.c          Alan Cox       2008-02-08  23  static int __init serial_init_chip(struct parisc_device *dev)
^1da177e4c3f41 drivers/serial/8250_gsc.c          Linus Torvalds 2005-04-16  24  {
2655a2c76f80d9 drivers/tty/serial/8250/8250_gsc.c Alan Cox       2012-07-12  25  	struct uart_8250_port uart;
^1da177e4c3f41 drivers/serial/8250_gsc.c          Linus Torvalds 2005-04-16 @26  	unsigned long address;
^1da177e4c3f41 drivers/serial/8250_gsc.c          Linus Torvalds 2005-04-16  27  	int err;
^1da177e4c3f41 drivers/serial/8250_gsc.c          Linus Torvalds 2005-04-16  28  

:::::: The code at line 26 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
