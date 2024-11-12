Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222D2143890
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418090; cv=none; b=TieesbKGxYFla1hbtS8CPdlgUl4jCO5PfsFn3rGwrpHmq1MpzdeeVO7tyvq+Gwau9W7FwCxaTIjkpdVTOrUdIgjwYAHy57KYnEhYNDZOilI2k4PlgG1RfBHrIno+X53wUC0QA1wKYMZkniEJF2OL1ufTpqwmM4dDuBbMmjlg0bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418090; c=relaxed/simple;
	bh=wgLlQf+mo71ApmWSTEl8OoDApGhB9P7Y5Z7kGRz0Vfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYwt2bcTVLyxs0/tbtSHkevlW78WzI4OCEcKfxgoYZlY0V6RQslZr5MMRGbYF2V75j6IXFrsiSUtBZfpurqQToKa7pI2L914hVBzyRqPgx2WWsGuRPeLOv91QH3TGpLld/Shn2CANon8zM7Tvs2FEnVRKiRZfK9AbDJQZQESEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCNA+YWU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCNA+YWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731418088; x=1762954088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wgLlQf+mo71ApmWSTEl8OoDApGhB9P7Y5Z7kGRz0Vfk=;
  b=VCNA+YWURwAF6bHlXi+Y8l0KFarywLgbcExCJGaVh8e6CX09w4NBJNE1
   pSYjQpnl9V9hW1I8A86qcXmhx5hIEZObk6H7+2kWjYfaGYwuSR6tm6unx
   90HN7QsSZ/9rO3AhR51PmQ1NftsuPpYGhJQuE/XHD9KvRWiwhmV3hurV0
   WSevEk/X+ds54A2MJQ2iOfh0xQpH2yY+Gj4JHRo6xN0C8yA8qAIo9MWQv
   PyVp8n71oSIEoq627e+Rf7KRfkO8GUfY9xrpCdTnTe9mE4f9QeTIeH7Ip
   Y7hfRGLR35a4AVMcZChh0e3DOJMjdx8vM57ORuDdggwazD6kkuHmEw7tA
   w==;
X-CSE-ConnectionGUID: EtZH/rhgR2a1gPnuIeGDMQ==
X-CSE-MsgGUID: nOEel1JNSjOCBntRU8Z49g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="48762198"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="48762198"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 05:28:08 -0800
X-CSE-ConnectionGUID: hq86Q4hEQ6mQgNaM6GOWgA==
X-CSE-MsgGUID: isO5o1u2T3umFWKq3GkNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87415179"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2024 05:28:07 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAqw8-0001LT-0H;
	Tue, 12 Nov 2024 13:28:04 +0000
Date: Tue, 12 Nov 2024 21:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 62/64] fs/xfs/xfs_aops.c:200: undefined reference
 to `xfs_mark_rtg_boundary'
Message-ID: <202411122110.ct0FS0fR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f9bf4d561e545fe8e988fb807cc47d879f0a00f8
commit: 2469717386951415b1e900370e25b0cc3c8d6b1d [62/64] xfs: use xfs_mark_rtg_boundary in xfs_end_bio
config: x86_64-randconfig-016-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122110.ct0FS0fR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122110.ct0FS0fR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122110.ct0FS0fR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `xfs_end_bio':
>> fs/xfs/xfs_aops.c:200: undefined reference to `xfs_mark_rtg_boundary'


vim +200 fs/xfs/xfs_aops.c

   184	
   185	void
   186	xfs_end_bio(
   187		struct bio		*bio)
   188	{
   189		struct iomap_ioend	*ioend = iomap_ioend_from_bio(bio);
   190		struct xfs_inode	*ip = XFS_I(ioend->io_inode);
   191		struct xfs_mount	*mp = ip->i_mount;
   192		unsigned long		flags;
   193	
   194		/*
   195		 * For Appends record the actually written block number and set the
   196		 * boundary flag if needed.
   197		 */
   198		if (bio_is_zone_append(bio)) {
   199			ioend->io_sector = bio->bi_iter.bi_sector;
 > 200			xfs_mark_rtg_boundary(ioend);
   201		}
   202	
   203		spin_lock_irqsave(&ip->i_ioend_lock, flags);
   204		if (list_empty(&ip->i_ioend_list))
   205			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
   206						 &ip->i_ioend_work));
   207		list_add_tail(&ioend->io_list, &ip->i_ioend_list);
   208		spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
