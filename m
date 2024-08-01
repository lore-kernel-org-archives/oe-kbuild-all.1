Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3A2611E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Aug 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722485723; cv=none; b=nBqOEX+7LyYZgpG2OJK7WLBQLdEADa8UBDvl34xDOymys1PcsPcLXprcfDMIVuAF/U7kGfrErFltMKltM80fb+vjg1eng3jQRvwlqeftWa/+N9H7Mvy4zCfc4mBsXUCMU5fQfxZ0y66RA3U9ZiFXBuIUkI0fd0RubuXXDuvMzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722485723; c=relaxed/simple;
	bh=I4UhXqfYP/tT6QTOtbNGAZeMMJp27orKYa4x++dYfnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JsmB7aE22sQijBtakDMnaI0soKxioOxKy82DFQ7GrEVNPH/ApIKbCaBwHRI7LzSC7lDks80/DzSJidjkkTHYEqoUmfqzQdmMUBeYDcN5S9+ZT0pLK8xRZWqPxoXghfPgp1Bmm4ZMlsGlY57+fLDiIFY3pAhOyf0OHKN/7vHsTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tb2QXt6b; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tb2QXt6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722485721; x=1754021721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I4UhXqfYP/tT6QTOtbNGAZeMMJp27orKYa4x++dYfnI=;
  b=Tb2QXt6bUFt5bD2dJX8TdyHbhuvW0NQ+b6Y5XCLoqYU+ccOtMRdAEF7C
   5DkKs1UOBP8O9g/v38f5KK5nroy9dp1YpgvXrYKWQJfPqypwR12TkVR8c
   +H6PYwksBTTtayxB0WuRWX0HqIb4E/jZDRcrNMyJ3vag+bUOrG2JZQtdU
   Q6YEvMBZsx7FyfyBHoc5omMDmlus239aF3aYIsrsoYYci9goeP4jpRW4k
   7hyYMvbU5OGLlGbaILFGDGhSDIE601w/31+vUxIFLHcEdxDGyTXgdM3JS
   edUZjbeGnwcZSc9omtjErORM9CzVjwMVFcKUCSbqApHceGbDtd91A6yr0
   A==;
X-CSE-ConnectionGUID: VY8Aim/sRiCuyGXOenbBpw==
X-CSE-MsgGUID: QNaMz3+9RQCWEYZ9nXLjTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12820973"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="12820973"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 21:15:16 -0700
X-CSE-ConnectionGUID: Y+ICtegESEi2XzNmNCeCCA==
X-CSE-MsgGUID: jZKr8sM3SeaGj/oBaqyF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="54864424"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2024 21:15:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZNDc-000vBA-1m;
	Thu, 01 Aug 2024 04:15:12 +0000
Date: Thu, 1 Aug 2024 12:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Duyck <alexanderduyck@fb.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>, Joe Damato <jdamato@fastly.com>
Subject: [linux-next:pending-fixes 107/314]
 drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:17:undefined reference to
 `devlink_priv'
Message-ID: <202408011219.hiPmwwAs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   22645e656434a5f47e33fca73b4a51513e3252ea
commit: 697943657444a7d7123b47bc32019e62533f4863 [107/314] fbnic: Change kconfig prompt from S390=n to !S390
config: x86_64-randconfig-123-20240731 (https://download.01.org/0day-ci/archive/20240801/202408011219.hiPmwwAs-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011219.hiPmwwAs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011219.hiPmwwAs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `fbnic_devlink_info_get':
>> drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:17:(.text+0x1d77fee): undefined reference to `devlink_priv'
>> ld: drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:29:(.text+0x1d7805e): undefined reference to `devlink_info_serial_number_put'
   ld: vmlinux.o: in function `fbnic_devlink_free':
>> drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:43:(.text+0x1d780b2): undefined reference to `priv_to_devlink'
>> ld: drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:45:(.text+0x1d780ba): undefined reference to `devlink_free'
   ld: vmlinux.o: in function `devlink_alloc':
>> include/net/devlink.h:1541:(.text+0x1d780ee): undefined reference to `devlink_alloc_ns'
   ld: vmlinux.o: in function `fbnic_devlink_alloc':
   drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:59:(.text+0x1d78102): undefined reference to `devlink_priv'
   ld: vmlinux.o: in function `fbnic_devlink_register':
   drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:78:(.text+0x1d782d8): undefined reference to `priv_to_devlink'
>> ld: drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:80:(.text+0x1d782e0): undefined reference to `devlink_register'
   ld: vmlinux.o: in function `fbnic_devlink_unregister':
   drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:85:(.text+0x1d782ee): undefined reference to `priv_to_devlink'
>> ld: drivers/net/ethernet/meta/fbnic/fbnic_devlink.c:87:(.text+0x1d782f6): undefined reference to `devlink_unregister'


vim +17 drivers/net/ethernet/meta/fbnic/fbnic_devlink.c

1a9d48892ea5bf Alexander Duyck 2024-07-12  12  
1a9d48892ea5bf Alexander Duyck 2024-07-12  13  static int fbnic_devlink_info_get(struct devlink *devlink,
1a9d48892ea5bf Alexander Duyck 2024-07-12  14  				  struct devlink_info_req *req,
1a9d48892ea5bf Alexander Duyck 2024-07-12  15  				  struct netlink_ext_ack *extack)
1a9d48892ea5bf Alexander Duyck 2024-07-12  16  {
1a9d48892ea5bf Alexander Duyck 2024-07-12 @17  	struct fbnic_dev *fbd = devlink_priv(devlink);
1a9d48892ea5bf Alexander Duyck 2024-07-12  18  	int err;
1a9d48892ea5bf Alexander Duyck 2024-07-12  19  
1a9d48892ea5bf Alexander Duyck 2024-07-12  20  	if (fbd->dsn) {
1a9d48892ea5bf Alexander Duyck 2024-07-12  21  		unsigned char serial[FBNIC_SN_STR_LEN];
1a9d48892ea5bf Alexander Duyck 2024-07-12  22  		u8 dsn[8];
1a9d48892ea5bf Alexander Duyck 2024-07-12  23  
1a9d48892ea5bf Alexander Duyck 2024-07-12  24  		put_unaligned_be64(fbd->dsn, dsn);
1a9d48892ea5bf Alexander Duyck 2024-07-12  25  		err = snprintf(serial, FBNIC_SN_STR_LEN, "%8phD", dsn);
1a9d48892ea5bf Alexander Duyck 2024-07-12  26  		if (err < 0)
1a9d48892ea5bf Alexander Duyck 2024-07-12  27  			return err;
1a9d48892ea5bf Alexander Duyck 2024-07-12  28  
1a9d48892ea5bf Alexander Duyck 2024-07-12 @29  		err = devlink_info_serial_number_put(req, serial);
1a9d48892ea5bf Alexander Duyck 2024-07-12  30  		if (err)
1a9d48892ea5bf Alexander Duyck 2024-07-12  31  			return err;
1a9d48892ea5bf Alexander Duyck 2024-07-12  32  	}
1a9d48892ea5bf Alexander Duyck 2024-07-12  33  
1a9d48892ea5bf Alexander Duyck 2024-07-12  34  	return 0;
1a9d48892ea5bf Alexander Duyck 2024-07-12  35  }
1a9d48892ea5bf Alexander Duyck 2024-07-12  36  
1a9d48892ea5bf Alexander Duyck 2024-07-12  37  static const struct devlink_ops fbnic_devlink_ops = {
1a9d48892ea5bf Alexander Duyck 2024-07-12  38  	.info_get = fbnic_devlink_info_get,
1a9d48892ea5bf Alexander Duyck 2024-07-12  39  };
1a9d48892ea5bf Alexander Duyck 2024-07-12  40  
1a9d48892ea5bf Alexander Duyck 2024-07-12  41  void fbnic_devlink_free(struct fbnic_dev *fbd)
1a9d48892ea5bf Alexander Duyck 2024-07-12  42  {
1a9d48892ea5bf Alexander Duyck 2024-07-12 @43  	struct devlink *devlink = priv_to_devlink(fbd);
1a9d48892ea5bf Alexander Duyck 2024-07-12  44  
1a9d48892ea5bf Alexander Duyck 2024-07-12 @45  	devlink_free(devlink);
1a9d48892ea5bf Alexander Duyck 2024-07-12  46  }
1a9d48892ea5bf Alexander Duyck 2024-07-12  47  
1a9d48892ea5bf Alexander Duyck 2024-07-12  48  struct fbnic_dev *fbnic_devlink_alloc(struct pci_dev *pdev)
1a9d48892ea5bf Alexander Duyck 2024-07-12  49  {
1a9d48892ea5bf Alexander Duyck 2024-07-12  50  	void __iomem * const *iomap_table;
1a9d48892ea5bf Alexander Duyck 2024-07-12  51  	struct devlink *devlink;
1a9d48892ea5bf Alexander Duyck 2024-07-12  52  	struct fbnic_dev *fbd;
1a9d48892ea5bf Alexander Duyck 2024-07-12  53  
1a9d48892ea5bf Alexander Duyck 2024-07-12  54  	devlink = devlink_alloc(&fbnic_devlink_ops, sizeof(struct fbnic_dev),
1a9d48892ea5bf Alexander Duyck 2024-07-12  55  				&pdev->dev);
1a9d48892ea5bf Alexander Duyck 2024-07-12  56  	if (!devlink)
1a9d48892ea5bf Alexander Duyck 2024-07-12  57  		return NULL;
1a9d48892ea5bf Alexander Duyck 2024-07-12  58  
1a9d48892ea5bf Alexander Duyck 2024-07-12 @59  	fbd = devlink_priv(devlink);
1a9d48892ea5bf Alexander Duyck 2024-07-12  60  	pci_set_drvdata(pdev, fbd);
1a9d48892ea5bf Alexander Duyck 2024-07-12  61  	fbd->dev = &pdev->dev;
1a9d48892ea5bf Alexander Duyck 2024-07-12  62  
1a9d48892ea5bf Alexander Duyck 2024-07-12  63  	iomap_table = pcim_iomap_table(pdev);
1a9d48892ea5bf Alexander Duyck 2024-07-12  64  	fbd->uc_addr0 = iomap_table[0];
1a9d48892ea5bf Alexander Duyck 2024-07-12  65  	fbd->uc_addr4 = iomap_table[4];
1a9d48892ea5bf Alexander Duyck 2024-07-12  66  
1a9d48892ea5bf Alexander Duyck 2024-07-12  67  	fbd->dsn = pci_get_dsn(pdev);
3646153161f105 Alexander Duyck 2024-07-12  68  	fbd->mps = pcie_get_mps(pdev);
3646153161f105 Alexander Duyck 2024-07-12  69  	fbd->readrq = pcie_get_readrq(pdev);
1a9d48892ea5bf Alexander Duyck 2024-07-12  70  
eb690ef8d1c2a1 Alexander Duyck 2024-07-12  71  	fbd->mac_addr_boundary = FBNIC_RPC_TCAM_MACDA_DEFAULT_BOUNDARY;
eb690ef8d1c2a1 Alexander Duyck 2024-07-12  72  
1a9d48892ea5bf Alexander Duyck 2024-07-12  73  	return fbd;
1a9d48892ea5bf Alexander Duyck 2024-07-12  74  }
1a9d48892ea5bf Alexander Duyck 2024-07-12  75  
1a9d48892ea5bf Alexander Duyck 2024-07-12  76  void fbnic_devlink_register(struct fbnic_dev *fbd)
1a9d48892ea5bf Alexander Duyck 2024-07-12  77  {
1a9d48892ea5bf Alexander Duyck 2024-07-12  78  	struct devlink *devlink = priv_to_devlink(fbd);
1a9d48892ea5bf Alexander Duyck 2024-07-12  79  
1a9d48892ea5bf Alexander Duyck 2024-07-12 @80  	devlink_register(devlink);
1a9d48892ea5bf Alexander Duyck 2024-07-12  81  }
1a9d48892ea5bf Alexander Duyck 2024-07-12  82  
1a9d48892ea5bf Alexander Duyck 2024-07-12  83  void fbnic_devlink_unregister(struct fbnic_dev *fbd)
1a9d48892ea5bf Alexander Duyck 2024-07-12  84  {
1a9d48892ea5bf Alexander Duyck 2024-07-12  85  	struct devlink *devlink = priv_to_devlink(fbd);
1a9d48892ea5bf Alexander Duyck 2024-07-12  86  
1a9d48892ea5bf Alexander Duyck 2024-07-12 @87  	devlink_unregister(devlink);

:::::: The code at line 17 was first introduced by commit
:::::: 1a9d48892ea5bf27f359f40d96511acc3eecea58 eth: fbnic: Allocate core device specific structures and devlink interface

:::::: TO: Alexander Duyck <alexanderduyck@fb.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
