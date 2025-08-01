Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B014F9D6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754049174; cv=none; b=VaInbKqRs5qEczIlSzutC7cZwehwaV4zlNkM99LgGoxX1xYYXtkYFFRfD0mDxTfC+2vV5u4lgEIrnmQKdv+QyUbhtUw/4P/EMglPj43yMS1cFNLxJkPPCy2XHvMvKr+2YBtSqU8YrPFBVNflvBi/sGa9WELuJQi6C3uunNEboHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754049174; c=relaxed/simple;
	bh=oaFMb3TlEGt/Jt5qhWQdufsYP2EVwQGGYZ+YtIW8N1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8/jh7mcjO/VKV6mby6lFsvufvIIGz4h6MFlECnV7FeJC9TyB0I6h1A4BqvhDBjN8tgxoKw4J0cWIwpTcUvfjSq8zKSnSNh5lYreErPTFMmKrQyA2Yar3KLFO+hEaeS2LA1OXk9+2to2n1CxVbPsaxVCIej1VuRw2/Fi6t7SX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ca1AoiA1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ca1AoiA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754049172; x=1785585172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oaFMb3TlEGt/Jt5qhWQdufsYP2EVwQGGYZ+YtIW8N1Q=;
  b=Ca1AoiA13W9Ah1XZcQ0+z2Krho5l47W09wNZh8ro1Hr8H8lbqCwGQIxg
   Ze/yKFsbPDwhrvFfvl8bXSeNSYbJuHK4h2s5+n5CWed9b9uEWML8/GKhs
   e8YimRu3q6QPmXLbGeZwk6sR/0BJlm5TfxXoK+7ScpGCFpRJOw96DGSiN
   p4XFCbZE49WyjI4bt7HtNCpGSKGUBc50aq2xZ1h+N+pJyPjxxGsSyxNJE
   8d4ozP2IQlemDOLY+rypaVfvPT+Fu0f0lL8QIyBhND5InCSg4kyBioIWE
   c3cca8Oakje+69sZCyGXK5RMXhIFczO4ubfxv89Ny5PYNc8Xiz7asQ702
   Q==;
X-CSE-ConnectionGUID: xRdAcpbUQzyK7B2rsLHjfw==
X-CSE-MsgGUID: 1FK28ADNQIa1YPvouTHEHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56537432"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56537432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 04:52:51 -0700
X-CSE-ConnectionGUID: iRflcO5CT9WGw85E+EpndA==
X-CSE-MsgGUID: CtIClAypQV6aJ5FprhjjFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163111991"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2025 04:52:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhoJc-0001Dr-1h;
	Fri, 01 Aug 2025 11:52:48 +0000
Date: Fri, 1 Aug 2025 13:52:05 +0200
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>
Subject: [linux-next:master 12440/13054] drivers/scsi/BusLogic.c:3727:35:
 warning: 'blogic_pci_tbl' defined but not used
Message-ID: <202508011341.0uyy4GDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 204689f0ea20fce5b328290efbc712afe6f9e456 [12440/13054] scsi: Always define blogic_pci_tbl structure
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011341.0uyy4GDh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011341.0uyy4GDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011341.0uyy4GDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/BusLogic.c:3727:35: warning: 'blogic_pci_tbl' defined but not used [-Wunused-const-variable=]
    3727 | static const struct pci_device_id blogic_pci_tbl[] = {
         |                                   ^~~~~~~~~~~~~~


vim +/blogic_pci_tbl +3727 drivers/scsi/BusLogic.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  3717  
c9a71ca13f71bf Christophe JAILLET 2024-12-07  3718  /*static const struct pci_device_id blogic_pci_tbl[] = {
745b5715fafccc Ben Collins        2006-10-18  3719  	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
745b5715fafccc Ben Collins        2006-10-18  3720  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
745b5715fafccc Ben Collins        2006-10-18  3721  	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER_NC,
745b5715fafccc Ben Collins        2006-10-18  3722  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
745b5715fafccc Ben Collins        2006-10-18  3723  	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT,
745b5715fafccc Ben Collins        2006-10-18  3724  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
745b5715fafccc Ben Collins        2006-10-18  3725  	{ }
839cb99e8f7483 Khalid Aziz        2013-05-16  3726  };*/
9baa3c34ac4e27 Benoit Taine       2014-08-08 @3727  static const struct pci_device_id blogic_pci_tbl[] = {
839cb99e8f7483 Khalid Aziz        2013-05-16  3728  	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER)},
839cb99e8f7483 Khalid Aziz        2013-05-16  3729  	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER_NC)},
839cb99e8f7483 Khalid Aziz        2013-05-16  3730  	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
839cb99e8f7483 Khalid Aziz        2013-05-16  3731  	{0, },
745b5715fafccc Ben Collins        2006-10-18  3732  };
839cb99e8f7483 Khalid Aziz        2013-05-16  3733  MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
745b5715fafccc Ben Collins        2006-10-18  3734  

:::::: The code at line 3727 was first introduced by commit
:::::: 9baa3c34ac4e27f7e062f266f50cc5dbea26a6c1 PCI: Remove DEFINE_PCI_DEVICE_TABLE macro use

:::::: TO: Benoit Taine <benoit.taine@lip6.fr>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
