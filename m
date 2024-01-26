Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4F60267
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706255020; cv=none; b=qvvaE0sBgha6wKWX35jbTywubluG4tLnSG34YAZet3DE9pniUpeyf0xpDCLsbrkF75wfQcUvdMux6jcMAwLNWHUHSC+/SNQkdvdIY5JsM4P6TLlg9HXMMPZPHp/ALiT/c55PNRcn3edLF2mFdTkKQy/p5aUAm28oyXajbp5fONw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706255020; c=relaxed/simple;
	bh=HlmQ1Ol77lBzkGkJ++LiTZAjy+UhM1yYobDwV+IcOHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAmN5i0Sr98v9O+4vtJfAtBLb5QNxhk0dLtiHvj8LIgRe3TG8VpeW9sK3rsGSqtbQWKx0BVccKBWJ5un8BIMGjNJpT3eCYabjZkkmN4NendNGS4eAHUKMYiJEPPn5FT7xJuY51lazGKtBLGT5rKFE+KHH98L9oh9AhJsi2hVVZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaAuuXt6; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaAuuXt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706255018; x=1737791018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HlmQ1Ol77lBzkGkJ++LiTZAjy+UhM1yYobDwV+IcOHk=;
  b=BaAuuXt657p+f+e6gWgUOJklbRQR2jYtcyxjQ9ML4KXeVxryFe971kEW
   AJO29MR9+v+rURO2NLaJcDDCeVjG7OWOFPzcd00qLgUzl2TwUg7Kr1+ZY
   FrK6Ded564aGLoMgDrr2oHwprc6XWfyUPazoUPQtM9V04BBaTTx9EdHC/
   JsKulAfGIlzcC+aHWPx/7V2mC+qRMG7HZE5xx8TRp30ABl7zKHQ7SFIRo
   YIot7HLe+JdiD9jNuBo13Av7Ds9laLFapSUB0DBWO+u8kV3dRD/guZDiM
   QaI3jhPrl+7UIhrr+2EAK9eSa/ZfRVJvOynKrW9KpIizsio3fCfySh8Uh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466687572"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466687572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 23:43:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="29051408"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jan 2024 23:43:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTGsA-0000oL-2q;
	Fri, 26 Jan 2024 07:43:34 +0000
Date: Fri, 26 Jan 2024 15:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 79/80] fs/xfs/xfs_reflink.c:835: undefined
 reference to `xfs_zone_record_blocks'
Message-ID: <202401261517.cM7pDXKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   9fc0addd2e44d48f96a00113084dfcab9b9df8f8
commit: 2fa0f6f5ec6e51a9507fe67dfe98cdd1b89958cd [79/80] xfs: add a "defrag" mode to xfs_zoned_end_cow
config: i386-randconfig-011-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261517.cM7pDXKA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261517.cM7pDXKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261517.cM7pDXKA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_reflink.o: in function `__xfs_reflink_end_cow_extent':
>> fs/xfs/xfs_reflink.c:835: undefined reference to `xfs_zone_record_blocks'


vim +835 fs/xfs/xfs_reflink.c

   792	
   793	static int
   794	__xfs_reflink_end_cow_extent(
   795		struct xfs_trans	*tp,
   796		struct xfs_inode	*ip,
   797		struct xfs_bmbt_irec	*cow,
   798		xfs_fsblock_t		*new_startblock,
   799		xfs_fsblock_t		old_startblock)
   800	{
   801		bool			isrt = XFS_IS_REALTIME_INODE(ip);
   802		struct xfs_bmbt_irec	data, new;
   803		int			nmaps = 1;
   804		int			error;
   805	
   806		error = xfs_iext_count_may_overflow(ip, XFS_DATA_FORK,
   807				XFS_IEXT_REFLINK_END_COW_CNT);
   808		if (error == -EFBIG)
   809			error = xfs_iext_count_upgrade(tp, ip,
   810					XFS_IEXT_REFLINK_END_COW_CNT);
   811		if (error)
   812			return error;
   813	
   814		/* Grab the corresponding mapping in the data fork. */
   815		error = xfs_bmapi_read(ip, cow->br_startoff, cow->br_blockcount, &data,
   816				       &nmaps, 0);
   817		if (error)
   818			return error;
   819	
   820		/* We can only remap the smaller of the two extent sizes. */
   821		data.br_blockcount = min(data.br_blockcount, cow->br_blockcount);
   822		cow->br_blockcount = data.br_blockcount;
   823	
   824		if (old_startblock != NULLFSBLOCK &&
   825		    data.br_startblock != old_startblock) {
   826			/*
   827			 * A data write raced with our GC write.
   828			 *
   829			 * Keep the existing data, mark our newly written GC extent as
   830			 * reclaimable and move on to the next extent.
   831			 */
   832			ASSERT(xfs_is_zoned_inode(ip));
   833			ASSERT(*new_startblock == NULLFSBLOCK);
   834			trace_xfs_reflink_cow_remap_skip(ip, cow);
 > 835			return xfs_zone_record_blocks(tp, cow->br_startblock,
   836					cow->br_blockcount, false);
   837		}
   838	
   839		trace_xfs_reflink_cow_remap_from(ip, cow);
   840		trace_xfs_reflink_cow_remap_to(ip, &data);
   841	
   842		if (xfs_bmap_is_real_extent(&data)) {
   843			/*
   844			 * If the extent we're remapping into is backed by storage
   845			 * (written or not), unmap the extent and drop its refcount.
   846			 */
   847			xfs_bmap_unmap_extent(tp, ip, XFS_DATA_FORK, &data);
   848			if (xfs_is_reflink_inode(ip)) {
   849				xfs_refcount_decrease_extent(tp, isrt, &data);
   850			} else {
   851				error = xfs_free_extent_later(tp, data.br_startblock,
   852						data.br_blockcount, NULL,
   853						XFS_AG_RESV_NONE,
   854						XFS_FREE_EXTENT_REALTIME);
   855				if (error)
   856					return error;
   857			}
   858			xfs_reflink_update_quota(tp, ip, false, -data.br_blockcount);
   859		} else if (data.br_startblock == DELAYSTARTBLOCK) {
   860			int		done;
   861	
   862			/*
   863			 * If the extent we're remapping into is a delalloc reservation,
   864			 * we can use the regular bunmapi function to release the
   865			 * incore state.  Dropping the delalloc reservation takes care
   866			 * of the quota reservation for us.
   867			 */
   868			error = xfs_bunmapi(NULL, ip, data.br_startoff,
   869					data.br_blockcount, 0, 1, &done);
   870			if (error)
   871				return error;
   872			ASSERT(done);
   873		}
   874	
   875		new = *cow;
   876		if (xfs_is_zoned_inode(ip)) {
   877			if (*new_startblock != NULLFSBLOCK) {
   878				ASSERT(isnullstartblock(new.br_startblock));
   879				ASSERT(new.br_state == XFS_EXT_NORM);
   880	
   881				new.br_startblock = *new_startblock;
   882				*new_startblock += new.br_blockcount;
   883			}
   884	
   885			error = xfs_zone_record_blocks(tp, new.br_startblock,
   886					new.br_blockcount, true);
   887			if (error)
   888				return error;
   889		} else {
   890			ASSERT(*new_startblock == NULLFSBLOCK);
   891	
   892			/* Free the CoW orphan record. */
   893			xfs_refcount_free_cow_extent(tp, isrt, cow->br_startblock,
   894						     cow->br_blockcount);
   895		}
   896	
   897		/* Map the new blocks into the data fork. */
   898		xfs_bmap_map_extent(tp, ip, XFS_DATA_FORK, &new);
   899	
   900		/* Charge this new data fork mapping to the on-disk quota. */
   901		xfs_reflink_update_quota(tp, ip, true, cow->br_blockcount);
   902		return 0;
   903	}
   904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
