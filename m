Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A632B1DC04A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731020257; cv=none; b=kG9pDH4SidfrOx305caZ7qtZ4uCot4y7PcEUPB3mruQlw3GF6W667BLK0Edf8vtKBmhQpbC7gaTEfPIMlR9bSdylbZOa9a7Y6yW2GXQnY9yKTFmr0BcF4C9jQBwItCaH7wRaX7L3ehVfQJZL3t8CIoYvd3nJIbnRwYmiW4LtAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731020257; c=relaxed/simple;
	bh=hEVeb3oi1HO7k3ZcjgDoNLisYUjwtvgQVNyGkuurIig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbPHfaZ2UlNDXoVq39ICNW5tmIP3oBqMdzkTlR6Ae2HLiyRjj4sPe5tRgqOQDAqyakjC20cL1Tp0hUo1mYkbdEKpYBlYC68E5TStd8ahu/D22v24BWrQpDfe4yYiPgjhRKw0hAwQ76imJgw5zu1iag6yvDxy100s4wXpSX2mYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWMzIb9x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWMzIb9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731020255; x=1762556255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEVeb3oi1HO7k3ZcjgDoNLisYUjwtvgQVNyGkuurIig=;
  b=hWMzIb9xkY16DtWH/qFZ+r/uXtgROwQmvOSrp5ZSHD64xNAlKySt07/9
   wclHa0CFwtKIIo7/xTUG9Xg7LmbvHbCNv1NWhYRAFh4EcvuxtQab+Axt+
   AUvBmYpn2ZTJteEJNtNWKSohmkbeamK3kSQC7SduZHGQ5xpFM+w04FAPa
   GVWnaKi4UgL0AKHdcnmo8F9kEzTBqB6+ZPSINqD8ghn5P7boLGTQyS+hi
   sYM784VbVbRrIYYI/9x2OyPiOWZxDzyVIgkU/HT7W+WcysiyyL3l8/FIS
   z2fr/PsU45BTFD5rFlMVuAEpmBgE+zUrMVnEkOmiIzFi48DC7cEIdSbb7
   g==;
X-CSE-ConnectionGUID: cIOX/5SLSoSkpXVehNG0cQ==
X-CSE-MsgGUID: iTZaQTKjQi6tA76sHbBBKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34582275"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34582275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 14:57:35 -0800
X-CSE-ConnectionGUID: C2ZNx3b/RuK1sQTtfDxe8g==
X-CSE-MsgGUID: qjIIPejrQYqEFCoqYuz1ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89214852"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 14:57:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9BRU-000qkU-0e;
	Thu, 07 Nov 2024 22:57:32 +0000
Date: Fri, 8 Nov 2024 06:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 32/41] fs/xfs/xfs_aops.c:201: undefined reference
 to `__umoddi3'
Message-ID: <202411080620.jEPPJU3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   00ddab456e9b104c128534732d6ae185ddfde379
commit: 1b9104b51569dbccbeb66612746279b40fe10b62 [32/41] xfs: support zoned RT devices
config: i386-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080620.jEPPJU3i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080620.jEPPJU3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080620.jEPPJU3i-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_aops.o: in function `xfs_end_bio':
>> fs/xfs/xfs_aops.c:201: undefined reference to `__umoddi3'


vim +201 fs/xfs/xfs_aops.c

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
   194		if (bio_is_zone_append(bio)) {
   195			/*
   196			 * Record the actually written block number and make sure we
   197			 * don't merge the first ioened for a zone into the last one
   198			 * for the previous zone.
   199			 */
   200			ioend->io_sector = bio->bi_iter.bi_sector;
 > 201			if (!(xfs_daddr_to_rtb(mp, ioend->io_sector) %
   202			      mp->m_groups[XG_TYPE_RTG].blocks))
   203				ioend->io_flags |= IOMAP_F_BOUNDARY;
   204		}
   205	
   206		spin_lock_irqsave(&ip->i_ioend_lock, flags);
   207		if (list_empty(&ip->i_ioend_list))
   208			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
   209						 &ip->i_ioend_work));
   210		list_add_tail(&ioend->io_list, &ip->i_ioend_list);
   211		spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
