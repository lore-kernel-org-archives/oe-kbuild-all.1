Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63D15665C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726504400; cv=none; b=HbgoC2yi81fcUsCU9IuG2bGUMbfuBgXOzlHdSGbknnlgjthdOD/dMGQiEZVFa/qjpDnGz3F+5fVD+7oql/PJic3Yc8y+eQbzGp/LfqO7OvmHftahy3qqmKtdaTOcaKF3I46XQpHPPoGOT50LZH9yNze9SzbMF5nGq5k2AW1OwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726504400; c=relaxed/simple;
	bh=gHwITvPGVMB5QprfwASOesU/48qaCGnEalYK9sDMKyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7YLY2N6spK8t9+GoEjMRpPGjjsGoS8HnddCTKKnviyklmjV/UeBldtED5cJfBf59hon9DbI7sxJLWC1t4fUhcNV89ks5NueZOX2p9DzKrHXRHLI+dyubTAOZUJq/C+zABDhs8sNCGMfNoj+QNUD94Mc22iW1wNDLhast0GljMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbaGMcZ+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbaGMcZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726504398; x=1758040398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHwITvPGVMB5QprfwASOesU/48qaCGnEalYK9sDMKyg=;
  b=dbaGMcZ+cM0g3McWnUhDP1xJU/RPVgUfIwPOwGH2pa0ltZws84/H/ifm
   PRPnI1ah1w2oNJdgTBcFGRCgLyXGmqONnYJwpR8IOEDlDBJgrFWxYcS20
   tYYRPDdpthy7OKtyLE3W3gRZIuq9hulSKhj12SYByzs5la3IDSm5jSvgS
   Q39biHM1iBaQxNlTjO0EyzXn3Ay6qiZY1AUmnVdDn5IrJzdysHiA2rl1c
   8rmssL0bFnvYBhmjm9FEPDrXWJAEf0GmKpHVpEwNWXAgRaTTXa3p/D9v4
   MpyLulrcqqL7PB+N+kZRo9XhokAg/ANF+xbeFTuzmLMToPZdINEjF1ViA
   A==;
X-CSE-ConnectionGUID: HDVnHCrbQS6uV9aaAPpuTQ==
X-CSE-MsgGUID: cfSBS/yyTEuBLJhQGxCxqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29085208"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29085208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 09:33:17 -0700
X-CSE-ConnectionGUID: dMcCAMj3Su+4tfHtBSKxmg==
X-CSE-MsgGUID: q5wdqy4LQbe1yjhxIa88Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68907794"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2024 09:33:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqEf4-000AHv-0a;
	Mon, 16 Sep 2024 16:33:14 +0000
Date: Tue, 17 Sep 2024 00:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-generic-group 46/53] fs/xfs/xfs_extfree_item.c:481:19:
 error: incompatible pointer types assigning to 'struct xfs_group *' from
 'struct xfs_perag *'
Message-ID: <202409170021.oigIancz-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20240916 (https://download.01.org/0day-ci/archive/20240917/202409170021.oigIancz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170021.oigIancz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170021.oigIancz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_extfree_item.c:481:19: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     481 |         xefi->xefi_group = xfs_group_intent_get(mp, xefi->xefi_startblock,
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     482 |                         xfs_efi_is_realtime(xefi));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_extfree_item.c:615:19: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     615 |         xefi->xefi_group = xfs_group_intent_get(mp, extp->ext_start, isrt);
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> fs/xfs/xfs_bmap_item.c:335:15: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     335 |         bi->bi_group = xfs_group_intent_get(mp, bi->bi_bmap.br_startblock,
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     336 |                         xfs_ifork_is_realtime(bi->bi_owner, bi->bi_whichfork));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> fs/xfs/xfs_rmap_item.c:386:15: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     386 |         ri->ri_group = xfs_group_intent_get(mp, ri->ri_bmap.br_startblock,
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     387 |                         ri->ri_realtime);
         |                         ~~~~~~~~~~~~~~~~
   fs/xfs/xfs_rmap_item.c:536:15: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     536 |         ri->ri_group = xfs_group_intent_get(mp, map->me_startblock, isrt);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> fs/xfs/xfs_refcount_item.c:362:15: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     362 |         ri->ri_group = xfs_group_intent_get(mp, ri->ri_startblock,
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     363 |                         ri->ri_realtime);
         |                         ~~~~~~~~~~~~~~~~
   fs/xfs/xfs_refcount_item.c:472:15: error: incompatible pointer types assigning to 'struct xfs_group *' from 'struct xfs_perag *' [-Werror,-Wincompatible-pointer-types]
     472 |         ri->ri_group = xfs_group_intent_get(mp, pmap->pe_startblock, isrt);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


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
