Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2C3382E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588105; cv=none; b=N3eM1oD2IkA6hNDxQutjez1Jw4ec9fx1Q33Kd157thfBsp7l1Hw8NTM4EBpzgqrHkfd5vi59HeYMcXOf+o1T8Wgubtx0YuOmD3f4VFDomG+1TZoghE8kJV/bZ3kR5cOM0v5+32/VoLHwbtjeqFPvATxpcH6M1fZN4UkUzPqDUek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588105; c=relaxed/simple;
	bh=b7FAuLZhJs3OiBYBg38pDTzwx4pk5RdVUegGgk2R/qA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kz+hJ7OrqVErCGn1w1J+iKTGHoeRSZzYOLEOAXpdcrH7aIQGNYwWt9glzId57bqCxTJChu3w+0U+YF0zub6K6EX4+cIekcF92QXeLH545Av80gsuyqK34+NFudYEn2saQVzovMKA4BFaa4RF5m3i+2/J6zryz8QJ+8m6Kht02n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOEmD+nS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOEmD+nS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769588102; x=1801124102;
  h=date:from:to:cc:subject:message-id;
  bh=b7FAuLZhJs3OiBYBg38pDTzwx4pk5RdVUegGgk2R/qA=;
  b=fOEmD+nSWhpDiIn3cWAXuE1ckic6tPq0xMQ6wbWUPMfiEeR2hWXcsGuM
   sJOe+4ELKrcjG9/eBO4UAdd2AE03yir7OrArJh27V36C9uYShELCw7AJY
   58/8NUWSuO+gfAlEOOo8RTyshiKrDDM7wAehSh6AwwlsB9d+JeD6aaGQR
   sSDyIP9P/1qU7jN65ZYOotIO27RXKu/Whkc3eGOl8Eqj49jhZHRznrzDP
   F+o+zy0eKZO1pZeODPbCAZ/+yKJPsUrwV+xtRf/pbvTKwtVLS6uK4KrCM
   guVOhO5ov/czj2jPavl6AQl85bCiUt/89I0Hf54M3xzjrIp+G70SMQ+gc
   w==;
X-CSE-ConnectionGUID: LnokP+KdS/S088UgGq87Mg==
X-CSE-MsgGUID: DybJjMBgQvWIR266+emcCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74643517"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74643517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:14:25 -0800
X-CSE-ConnectionGUID: 17RBWfkjRim27K9EjK62sQ==
X-CSE-MsgGUID: hF8YZzDNS5uAoAIAeI3oMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="231156837"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 00:14:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl0gv-00000000ZRw-2uGj;
	Wed, 28 Jan 2026 08:14:21 +0000
Date: Wed, 28 Jan 2026 16:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/isdn/hardware/mISDN/hfcmulti.c:453:22: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202601281653.Nacl2u1j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   836937f105dd64e600acaa0286482270c382e394
commit: 836937f105dd64e600acaa0286482270c382e394 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sparc64-randconfig-r122-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281653.Nacl2u1j-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281653.Nacl2u1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281653.Nacl2u1j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/isdn/hardware/mISDN/hfcmulti.c:453:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:453:22: sparse:     expected unsigned int [usertype] l
   drivers/isdn/hardware/mISDN/hfcmulti.c:453:22: sparse:     got restricted __le32 [usertype]
>> drivers/isdn/hardware/mISDN/hfcmulti.c:458:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] w @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:458:22: sparse:     expected unsigned short [usertype] w
   drivers/isdn/hardware/mISDN/hfcmulti.c:458:22: sparse:     got restricted __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:473:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:473:24: sparse:     expected unsigned int [usertype] l
   drivers/isdn/hardware/mISDN/hfcmulti.c:473:24: sparse:     got restricted __le32 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:479:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] w @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:479:24: sparse:     expected unsigned short [usertype] w
   drivers/isdn/hardware/mISDN/hfcmulti.c:479:24: sparse:     got restricted __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:497:32: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:502:32: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:502:32: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:502:32: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:502:32: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:519:25: sparse: sparse: cast to restricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:525:25: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:525:25: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:525:25: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:525:25: sparse: sparse: cast to restricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:1062:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:1062:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/hfcmulti.c:1062:26: sparse:     got void *

vim +453 drivers/isdn/hardware/mISDN/hfcmulti.c

af69fb3a8ffa37 Karsten Keil 2008-07-27  446  
af69fb3a8ffa37 Karsten Keil 2008-07-27  447  /* write fifo data (REGIO) */
5b8343540a3d27 Hannes Eder  2008-12-12  448  static void
af69fb3a8ffa37 Karsten Keil 2008-07-27  449  write_fifo_regio(struct hfc_multi *hc, u_char *data, int len)
af69fb3a8ffa37 Karsten Keil 2008-07-27  450  {
af69fb3a8ffa37 Karsten Keil 2008-07-27  451  	outb(A_FIFO_DATA0, (hc->pci_iobase) + 4);
af69fb3a8ffa37 Karsten Keil 2008-07-27  452  	while (len >> 2) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02 @453  		outl(cpu_to_le32(*(u32 *)data), hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  454  		data += 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  455  		len -= 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  456  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  457  	while (len >> 1) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02 @458  		outw(cpu_to_le16(*(u16 *)data), hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  459  		data += 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  460  		len -= 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  461  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  462  	while (len) {
af69fb3a8ffa37 Karsten Keil 2008-07-27  463  		outb(*data, hc->pci_iobase);
af69fb3a8ffa37 Karsten Keil 2008-07-27  464  		data++;
af69fb3a8ffa37 Karsten Keil 2008-07-27  465  		len--;
af69fb3a8ffa37 Karsten Keil 2008-07-27  466  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  467  }
af69fb3a8ffa37 Karsten Keil 2008-07-27  468  /* write fifo data (PCIMEM) */
5b8343540a3d27 Hannes Eder  2008-12-12  469  static void
af69fb3a8ffa37 Karsten Keil 2008-07-27  470  write_fifo_pcimem(struct hfc_multi *hc, u_char *data, int len)
af69fb3a8ffa37 Karsten Keil 2008-07-27  471  {
af69fb3a8ffa37 Karsten Keil 2008-07-27  472  	while (len >> 2) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  473  		writel(cpu_to_le32(*(u32 *)data),
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  474  		       hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  475  		data += 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  476  		len -= 4;
af69fb3a8ffa37 Karsten Keil 2008-07-27  477  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  478  	while (len >> 1) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  479  		writew(cpu_to_le16(*(u16 *)data),
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  480  		       hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  481  		data += 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  482  		len -= 2;
af69fb3a8ffa37 Karsten Keil 2008-07-27  483  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  484  	while (len) {
b3e0aeeb7e0f89 Karsten Keil 2008-08-02  485  		writeb(*data, hc->pci_membase + A_FIFO_DATA0);
af69fb3a8ffa37 Karsten Keil 2008-07-27  486  		data++;
af69fb3a8ffa37 Karsten Keil 2008-07-27  487  		len--;
af69fb3a8ffa37 Karsten Keil 2008-07-27  488  	}
af69fb3a8ffa37 Karsten Keil 2008-07-27  489  }
eac74af9b547e2 Karsten Keil 2009-05-22  490  

:::::: The code at line 453 was first introduced by commit
:::::: b3e0aeeb7e0f89791c4c3bdfd98b36074c5178e6 Fix remaining big endian issue of hfcmulti

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
