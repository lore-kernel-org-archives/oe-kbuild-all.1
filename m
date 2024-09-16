Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21EC50284
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478296; cv=none; b=AkaI7JSUE7Kk+vYHzjy78wax0a5DZC23IP/V6SaLH+rH7wwYoDyd3fzFF06pKAFdZTPeqZQHCQi7+hOg/p8M0MbAf43Xek+me+mINt7pAEjJoxy6uKAPutuhDfz4V7X2We9mCddDQHbmVxhu3JLw7n39oTsTUcMgOCH3QgFiJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478296; c=relaxed/simple;
	bh=ANcPPEfwneESYbEhy+LoeIfKk3erD75RIgp7uNj/sog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mg/6mMF21VdFl7d2cieOOnB1/DBtE+EsM2ud3jPXK1/fEiD7usTIEqIy34tRkMW4PJl09S/ZtEJPzrzTmLKNOP43yj0HnSETtALTyxvdlX0ij6aRfqgcKM50rP8avR3J6sxPoIatbM0Oc0jpZNxHecj4cuEWDPA0CPPe2lQZ590=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRGToeZg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRGToeZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726478295; x=1758014295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANcPPEfwneESYbEhy+LoeIfKk3erD75RIgp7uNj/sog=;
  b=lRGToeZgrTQkvr7fa/1D7zvn6SUER+IqafJZnnea6fqSS1X7h+hS4OPo
   QNj7DmvytmkezjUN8OTzP1yTTlojVn8J2lcI4jHCX9xxGxRW5aCWky7rE
   hyKMRimLS9N92Ijbq64oA+lFeSVKTTiGK3o1K167mF+HfSHMl4mfYbflD
   i2ZVSE982CiIyY+hp635G+5/LWM19PSkzofof97qEFaWrzGxH0nioip9X
   qmLv4IoQDTmFDzsBYmFq6uiOE2t473TOpkFftbaw6CZCeFj61HJBy7sJn
   GhB9ogMltylNgdoNoVpnKY+oUThWfRjCk62aEV1sXl1G947hxeegufO3o
   Q==;
X-CSE-ConnectionGUID: wgu2gjAsTPeb1Oay0ky70Q==
X-CSE-MsgGUID: V6J/O+gITkyj/OOF6n7tZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50713260"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="50713260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 02:18:14 -0700
X-CSE-ConnectionGUID: LtlVYoJxSgyBJz839wqO1g==
X-CSE-MsgGUID: Les+pS1aSEGS3ff79eEtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68913079"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 02:18:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq7s3-0009bi-0w;
	Mon, 16 Sep 2024 09:18:11 +0000
Date: Mon, 16 Sep 2024 17:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-generic-group 46/53] fs/xfs/xfs_extfree_item.c:481:26:
 error: assignment to 'struct xfs_group *' from incompatible pointer type
 'struct xfs_perag *'
Message-ID: <202409161720.g9imBF30-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-generic-group
head:   70d97335ce6b1b5fa4a40c0c33694d70d5e61224
commit: f08067c829d72702c49ed146b666fa397ac780de [46/53] xfs: store a generic group structure in the intents
config: i386-buildonly-randconfig-004-20240916 (https://download.01.org/0day-ci/archive/20240916/202409161720.g9imBF30-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161720.g9imBF30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161720.g9imBF30-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_extfree_item.c: In function 'xfs_extent_free_defer_add':
>> fs/xfs/xfs_extfree_item.c:481:26: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     481 |         xefi->xefi_group = xfs_group_intent_get(mp, xefi->xefi_startblock,
         |                          ^
   fs/xfs/xfs_extfree_item.c: In function 'xfs_efi_recover_work':
   fs/xfs/xfs_extfree_item.c:615:26: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     615 |         xefi->xefi_group = xfs_group_intent_get(mp, extp->ext_start, isrt);
         |                          ^
   cc1: some warnings being treated as errors
--
   fs/xfs/xfs_bmap_item.c: In function 'xfs_bmap_update_get_group':
>> fs/xfs/xfs_bmap_item.c:335:22: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     335 |         bi->bi_group = xfs_group_intent_get(mp, bi->bi_bmap.br_startblock,
         |                      ^
   cc1: some warnings being treated as errors
--
   fs/xfs/xfs_refcount_item.c: In function 'xfs_refcount_defer_add':
>> fs/xfs/xfs_refcount_item.c:362:22: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     362 |         ri->ri_group = xfs_group_intent_get(mp, ri->ri_startblock,
         |                      ^
   fs/xfs/xfs_refcount_item.c: In function 'xfs_cui_recover_work':
   fs/xfs/xfs_refcount_item.c:472:22: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     472 |         ri->ri_group = xfs_group_intent_get(mp, pmap->pe_startblock, isrt);
         |                      ^
   cc1: some warnings being treated as errors
--
   fs/xfs/xfs_rmap_item.c: In function 'xfs_rmap_defer_add':
>> fs/xfs/xfs_rmap_item.c:386:22: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     386 |         ri->ri_group = xfs_group_intent_get(mp, ri->ri_bmap.br_startblock,
         |                      ^
   fs/xfs/xfs_rmap_item.c: In function 'xfs_rui_recover_work':
   fs/xfs/xfs_rmap_item.c:536:22: error: assignment to 'struct xfs_group *' from incompatible pointer type 'struct xfs_perag *' [-Werror=incompatible-pointer-types]
     536 |         ri->ri_group = xfs_group_intent_get(mp, map->me_startblock, isrt);
         |                      ^
   cc1: some warnings being treated as errors


vim +481 fs/xfs/xfs_extfree_item.c

   469	
   470	/* Add this deferred EFI to the transaction. */
   471	void
   472	xfs_extent_free_defer_add(
   473		struct xfs_trans		*tp,
   474		struct xfs_extent_free_item	*xefi,
   475		struct xfs_defer_pending	**dfpp)
   476	{
   477		struct xfs_mount		*mp = tp->t_mountp;
   478	
   479		trace_xfs_extent_free_defer(mp, xefi);
   480	
 > 481		xefi->xefi_group = xfs_group_intent_get(mp, xefi->xefi_startblock,
   482				xfs_efi_is_realtime(xefi));
   483		*dfpp = xfs_defer_add(tp, &xefi->xefi_list, xefi_ops(xefi));
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
