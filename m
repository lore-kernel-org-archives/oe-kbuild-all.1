Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB52AE78
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835575; cv=none; b=BmslkHNwv7jb3ZAOGfFLv1eadNEDJFmY5KSGlBj2DkRuMz8sDv6F3BIssS6WH8Cj1/35FOwJFyxIN+8DJBBFQItTEYf46uumnKDZDxEuJMixYXAEv4EeCua21xmzn/P9E288TaKg/qkBfWhYwxr4rcIMYOZA+0mbH7wp777brjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835575; c=relaxed/simple;
	bh=4TQSYdQC94t4irLBdqUeL7KxrfjRzcHc6ldZprea940=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SI6U/ds8hURQ3Wq89lSxMSxby0dLbcIp2N+d6O4fZCCmb8FNTrosPEO5pK3f6SLoBpKWGYc8bFUtHS8Ma4r+Qq91PD7lRBhC6PjT8kGnoWj+rRGmzByFBiEEG68M/sbUJmMuUwxlEktFaLU3gBRSKvhen3MeXXrrwQJyDXUNI1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT8qNl+j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT8qNl+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788835573; x=1820371573;
  h=date:from:to:cc:subject:message-id;
  bh=4TQSYdQC94t4irLBdqUeL7KxrfjRzcHc6ldZprea940=;
  b=TT8qNl+jlk1gI3n0X7v7KgpfZLaKXSnSMhhkbQzKYUfNcDHEF17PDnPi
   Tzm+zt/k5trxxeMnA0m8y3empjD03lSgcYIBgWJqGX/JClGe/6nGbEUMo
   LpwbgBXS1WuaKVB7ncuQ+5IE6qnYJ93W/wY5WCJjUp3ByeC4iNmLZvmHh
   z0ZNxZ/5197G8d8ST33gRd3S4d06aa81mDOIht1QGEBslpYMy39Kk3gcr
   4YTju01p4j9P51US4dHj05ptUUFFYpb3cynbCFuqCvNW5l6Yw0Gp6jqBS
   3zRKXbSwi3TuJ6h/8Mi6ueB03eoshDn39cv59QyNnHM+j2UpIGhRoHKWh
   A==;
X-CSE-ConnectionGUID: 4tdBUinvRWORJy95sFW8qw==
X-CSE-MsgGUID: Op3Tg4T7Q9aFv7EysW0wfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88164645"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88164645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 19:46:12 -0700
X-CSE-ConnectionGUID: cgZ7orPpTE+Q9l7sXDyK6w==
X-CSE-MsgGUID: DPHy5bk8T2ibbUpmoCmdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="300735543"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2026 19:46:11 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3lqb-000000000YQ-2AgB;
	Tue, 08 Sep 2026 02:46:09 +0000
Date: Tue, 08 Sep 2026 04:45:23 +0200
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/pci_ids.h:19:41: warning: unsigned conversion
 from 'int' to 'unsigned char' changes value from '256' to '0'
Message-ID: <202609080411.ja1cXH2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/alistair23-gmail-com/virtio_pci-Add-a-quirk-to-force-DMA-Map-API-for-certain-legacy-devices/20260901-114649
head:   3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005
commit: 3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005 scsi: Initial commit of VirtIO PCIe Endpoint Driver
date:   7 days ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609080411.ja1cXH2Z-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080411.ja1cXH2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080411.ja1cXH2Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/virtio-scsi-pci-epf.c:23:
>> include/linux/pci_ids.h:19:41: warning: unsigned conversion from 'int' to 'unsigned char' changes value from '256' to '0' [-Woverflow]
      19 | #define PCI_CLASS_STORAGE_SCSI          0x0100
         |                                         ^~~~~~
   drivers/scsi/virtio-scsi-pci-epf.c:2642:27: note: in expansion of macro 'PCI_CLASS_STORAGE_SCSI'
    2642 |         .subclass_code  = PCI_CLASS_STORAGE_SCSI,
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +19 include/linux/pci_ids.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  17  
^1da177e4c3f41 Linus Torvalds    2005-04-16  18  #define PCI_BASE_CLASS_STORAGE		0x01
^1da177e4c3f41 Linus Torvalds    2005-04-16 @19  #define PCI_CLASS_STORAGE_SCSI		0x0100
^1da177e4c3f41 Linus Torvalds    2005-04-16  20  #define PCI_CLASS_STORAGE_IDE		0x0101
^1da177e4c3f41 Linus Torvalds    2005-04-16  21  #define PCI_CLASS_STORAGE_FLOPPY	0x0102
^1da177e4c3f41 Linus Torvalds    2005-04-16  22  #define PCI_CLASS_STORAGE_IPI		0x0103
^1da177e4c3f41 Linus Torvalds    2005-04-16  23  #define PCI_CLASS_STORAGE_RAID		0x0104
c9f89475a5b184 Conke Hu          2007-01-09  24  #define PCI_CLASS_STORAGE_SATA		0x0106
c9f89475a5b184 Conke Hu          2007-01-09  25  #define PCI_CLASS_STORAGE_SATA_AHCI	0x010601
4e06cbd42c41f9 Moore, Eric Dean  2005-12-01  26  #define PCI_CLASS_STORAGE_SAS		0x0107
a2e7eefd5618e0 Christoph Hellwig 2016-12-02  27  #define PCI_CLASS_STORAGE_EXPRESS	0x010802
^1da177e4c3f41 Linus Torvalds    2005-04-16  28  #define PCI_CLASS_STORAGE_OTHER		0x0180
^1da177e4c3f41 Linus Torvalds    2005-04-16  29  
a2e7eefd5618e0 Christoph Hellwig 2016-12-02  30  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
