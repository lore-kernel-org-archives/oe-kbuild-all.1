Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1760B146588
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742244154; cv=none; b=gD9XHMBk76CoIuBS4pgkibFPtnQ+bZzPlDfV1STY+bFm6qOIAdIc5APpIdrfzQMv4HDL8Jh3IJmdDV85gsM+aSNLgDiVVTXIAyk8CRXLXFmlCZnhnLeOWq8hTeabocy0X3tgQvh5cMqYaoLpl/pYSxdnYXIHaqTa/NNs/C1phYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742244154; c=relaxed/simple;
	bh=VVgyV/HPiF/auW/re7hncpnEqz3IS0WW8qFMM3qWsyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LI2kwrGmqGo+RQn+L1v+g5FABnVZObkXgFBHTrcML8MmKxVs9tcnA5tBV7+rXLoxRrx0sijglaFWJH3TCNNYCDOQGOw1/amKaG/RfJnVbb06UcTu47m7IMRh6Me4l4TT+9a4m4EcwVigV3T00Ntx0YoQcDYLJcKXZhfVLlmyuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvhYPxKk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvhYPxKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742244153; x=1773780153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVgyV/HPiF/auW/re7hncpnEqz3IS0WW8qFMM3qWsyk=;
  b=DvhYPxKk1LAovvQjbD5SccgYYHDMPyqZTZto7MIWsEmWip70aKsyTYZa
   l2/01bBwvs/6IZg1gK5kHkkec6wzfp974459oj298DLr3DBFY5/n0nIVu
   qLqBkh64hTYNUVChIUNt8za8GKPR5qLniGPAmo8QoN6uFyacPaBqe9+ai
   UOLliV6l8orLnfpq/XLWi6r+o2S3fFTN/bWv02DBl6RMvcS0lhdAXWmVU
   pZ8DKw+ESosLKgPMpxJNAcW9H8QFBOkzbw8lDdJ3YWsBOqTT0EsPW/TIv
   hrIjqmGJSaVvdlVi7PaFJR/IL7EwrwDEA4yRhEYFgzg2HxuLmwseBuynb
   Q==;
X-CSE-ConnectionGUID: NR77vdrLSuuCbE6Z6wwQag==
X-CSE-MsgGUID: nPlytArMTBKdti+x+lMYgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="53986807"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="53986807"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 13:42:32 -0700
X-CSE-ConnectionGUID: 2gVYKdUdT8WxobT+e7pYUw==
X-CSE-MsgGUID: Jd1sj47nS72LETijQgObDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="127228963"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 Mar 2025 13:42:32 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuHHx-000D9e-2F;
	Mon, 17 Mar 2025 20:42:24 +0000
Date: Tue, 18 Mar 2025 04:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10942/11415] arch/mips/include/asm/io.h:550:21:
 error: static declaration of 'pci_iounmap' follows non-static declaration
Message-ID: <202503180450.TzH3iiJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e94bd4ec45ac156616da285a0bf03056cd7430fc
commit: 976bf3aec388331454362b60cd1b5605f99bfe38 [10942/11415] mips: drop GENERIC_IOMAP wrapper
config: mips-randconfig-r061-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180450.TzH3iiJ6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180450.TzH3iiJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180450.TzH3iiJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/uio.h:10,
                    from include/linux/socket.h:8,
                    from include/linux/compat.h:15,
                    from arch/mips/kernel/asm-offsets.c:12:
>> arch/mips/include/asm/io.h:550:21: error: static declaration of 'pci_iounmap' follows non-static declaration
     550 | #define pci_iounmap pci_iounmap
         |                     ^~~~~~~~~~~
   include/asm-generic/pci_iomap.h:56:20: note: in expansion of macro 'pci_iounmap'
      56 | static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
         |                    ^~~~~~~~~~~
   arch/mips/include/asm/io.h:549:6: note: previous declaration of 'pci_iounmap' with type 'void(struct pci_dev *, void *)'
     549 | void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
         |      ^~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pci_iounmap +550 arch/mips/include/asm/io.h

   546	
   547	#ifdef CONFIG_PCI_DRIVERS_LEGACY
   548	struct pci_dev;
   549	void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
 > 550	#define pci_iounmap pci_iounmap
   551	#endif
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
