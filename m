Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF9F510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442642; cv=none; b=cuTIO1Pb3U2BqtU+96QtdKhH0t8+SA0b2S1ZraygLDfUo7EHwzigkhEPK0Y1/EOyli1zSZOLBL9nVozDMkd8H2opniysLCUNiIXa8m7ENvYbW8WaEOuNOfkCEpiXRHhGUpbjUvA7iQ7ThPmNbRUZPz+J77WXWW/4hF/pYMBJv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442642; c=relaxed/simple;
	bh=IRhg4mT/2VCR5t/peSLeBb5fLoEyp+bQ7efXxIj6IB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfQdFga3Cm5ENBqar46lnlvN3JI3QWe86ASf+eZhlkbCZi+L4YRX+x7eidA4EZ9WjbjhzKkE+T4pCOO3/zREX2JBWzJziHlLg+EDgG7Q0sDGPivqjA/D7tTUBKcRQqmn2+q7cG4YVHUSBr+DVQpha+ulO08oDD7NuuXOrtfBPK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KM97jcRz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KM97jcRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736442641; x=1767978641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IRhg4mT/2VCR5t/peSLeBb5fLoEyp+bQ7efXxIj6IB4=;
  b=KM97jcRzLP7Lk1H8tzSqfPijjjfnq9SRu6fSPvTKvLcRu3lwLWnrHWvY
   i8JoaLvDru+R+N09pq10G/IhBhctnsmEarWRe3ompphOQECv2rRDH56o9
   iIz3Zfjyyq2pvjfNhAeAm1oCtfnJyo+z6+qIviepOU0Kec0COdb/zFu3M
   jYnR+t2SGM88U3kEtwU8YuKhVePxoVjzvBoQYnSkpQNihFuG7oClGt0GK
   Plk9+dbTpju1rFBz+VJJF4cMedbHUg3uYqOTx+rZ7Uz+YkJWuPbiURj4I
   GGA52iBuOtJLHQjewf0Cg57I9cGgbvJlBF1NtoRKaZyRQ1VYyiXEYaLNm
   g==;
X-CSE-ConnectionGUID: o6f0ZiBLSWWCgOA5svqSTg==
X-CSE-MsgGUID: DWfkAXqzRQ2r89JvltT47w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36613460"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36613460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:10:40 -0800
X-CSE-ConnectionGUID: kAxSGEKOQP26nufu9HkRjA==
X-CSE-MsgGUID: d7z9B9ZFT76DExYG0uW9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108569376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jan 2025 09:10:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVw3I-000Hts-2H;
	Thu, 09 Jan 2025 17:10:36 +0000
Date: Fri, 10 Jan 2025 01:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug 15/19] arch/x86/kernel/early_printk.c:300:17:
 error: 'kexec_debug_8250_mmio32' undeclared
Message-ID: <202501100112.9TQDyG6u-lkp@intel.com>
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
commit: 48277287e921834f8e9d6e29a47f4dc6dd161a16 [15/19] x86/kexec: Add 8250 MMIO serial port output
config: i386-randconfig-014-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100112.9TQDyG6u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100112.9TQDyG6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100112.9TQDyG6u-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/early_printk.c: In function 'early_serial_hw_init':
   arch/x86/kernel/early_printk.c:148:17: error: 'kexec_debug_8250_port' undeclared (first use in this function)
     148 |                 kexec_debug_8250_port = early_serial_base;
         |                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/early_printk.c:148:17: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/early_printk.c: In function 'early_pci_serial_init':
>> arch/x86/kernel/early_printk.c:300:17: error: 'kexec_debug_8250_mmio32' undeclared (first use in this function)
     300 |                 kexec_debug_8250_mmio32 = bar0 & PCI_BASE_ADDRESS_MEM_MASK;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kexec_debug_8250_mmio32 +300 arch/x86/kernel/early_printk.c

   214	
   215	/*
   216	 * early_pci_serial_init()
   217	 *
   218	 * This function is invoked when the early_printk param starts with "pciserial"
   219	 * The rest of the param should be "[force],B:D.F,baud", where B, D & F describe
   220	 * the location of a PCI device that must be a UART device. "force" is optional
   221	 * and overrides the use of an UART device with a wrong PCI class code.
   222	 */
   223	static __init void early_pci_serial_init(char *s)
   224	{
   225		unsigned divisor;
   226		unsigned long baud = DEFAULT_BAUD;
   227		u8 bus, slot, func;
   228		u32 classcode, bar0;
   229		u16 cmdreg;
   230		char *e;
   231		int force = 0;
   232	
   233		if (*s == ',')
   234			++s;
   235	
   236		if (*s == 0)
   237			return;
   238	
   239		/* Force the use of an UART device with wrong class code */
   240		if (!strncmp(s, "force,", 6)) {
   241			force = 1;
   242			s += 6;
   243		}
   244	
   245		/*
   246		 * Part the param to get the BDF values
   247		 */
   248		bus = (u8)simple_strtoul(s, &e, 16);
   249		s = e;
   250		if (*s != ':')
   251			return;
   252		++s;
   253		slot = (u8)simple_strtoul(s, &e, 16);
   254		s = e;
   255		if (*s != '.')
   256			return;
   257		++s;
   258		func = (u8)simple_strtoul(s, &e, 16);
   259		s = e;
   260	
   261		/* A baud might be following */
   262		if (*s == ',')
   263			s++;
   264	
   265		/*
   266		 * Find the device from the BDF
   267		 */
   268		cmdreg = read_pci_config(bus, slot, func, PCI_COMMAND);
   269		classcode = read_pci_config(bus, slot, func, PCI_CLASS_REVISION);
   270		bar0 = read_pci_config(bus, slot, func, PCI_BASE_ADDRESS_0);
   271	
   272		/*
   273		 * Verify it is a 16550-UART type device
   274		 */
   275		if (((classcode >> 16 != PCI_CLASS_COMMUNICATION_MODEM) &&
   276		     (classcode >> 16 != PCI_CLASS_COMMUNICATION_SERIAL)) ||
   277		    (((classcode >> 8) & 0xff) != PCI_SERIAL_16550_COMPATIBLE)) {
   278			if (!force)
   279				return;
   280		}
   281	
   282		/*
   283		 * Determine if it is IO or memory mapped
   284		 */
   285		if ((bar0 & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO) {
   286			/* it is IO mapped */
   287			serial_in = io_serial_in;
   288			serial_out = io_serial_out;
   289			early_serial_base = bar0 & PCI_BASE_ADDRESS_IO_MASK;
   290			write_pci_config(bus, slot, func, PCI_COMMAND,
   291					 cmdreg|PCI_COMMAND_IO);
   292		} else {
   293			/* It is memory mapped - assume 32-bit alignment */
   294			serial_in = mem32_serial_in;
   295			serial_out = mem32_serial_out;
   296			/* WARNING! assuming the address is always in the first 4G */
   297			early_serial_base =
   298				(unsigned long)early_ioremap(bar0 & PCI_BASE_ADDRESS_MEM_MASK, 0x10);
   299	#ifdef CONFIG_KEXEC_DEBUG
 > 300			kexec_debug_8250_mmio32 = bar0 & PCI_BASE_ADDRESS_MEM_MASK;
   301	#endif
   302			write_pci_config(bus, slot, func, PCI_COMMAND,
   303					 cmdreg|PCI_COMMAND_MEMORY);
   304		}
   305	
   306		/*
   307		 * Initialize the hardware
   308		 */
   309		if (*s) {
   310			if (strcmp(s, "nocfg") == 0)
   311				/* Sometimes, we want to leave the UART alone
   312				 * and assume the BIOS has set it up correctly.
   313				 * "nocfg" tells us this is the case, and we
   314				 * should do no more setup.
   315				 */
   316				return;
   317			if (kstrtoul(s, 0, &baud) < 0 || baud == 0)
   318				baud = DEFAULT_BAUD;
   319		}
   320	
   321		/* Convert from baud to divisor value */
   322		divisor = 115200 / baud;
   323	
   324		/* Set up the HW */
   325		early_serial_hw_init(divisor);
   326	}
   327	#endif
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
