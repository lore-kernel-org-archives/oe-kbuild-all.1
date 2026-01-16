Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4113370F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 01:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768527760; cv=none; b=lrBt/4LUGcCwy0abQt6roeinWD3EcDxTTKXfXpXCzUcFI2ihrvpqHwWCyE6Je+7QhbKiZ4Pk9OQryQhXt+JI0dIJhrUnf0CYVgJu8fDYWwB5UYRDy9iG2o6q2Si4nu0rKu8LDIacy2yq/uJDBO4aXKinaowO1cW7a9TkT13rYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768527760; c=relaxed/simple;
	bh=4A+DULxXUIQI+tCW7dM4TmcMCsHnHKM4bk1mhLPaI3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J00vDIFI7yWKldVJN4nHmPb64SsqKV8mWwPDuuw/zift2onproNzTKRMSLJTBSe2nMzypTJTkj3dUULRZt43ZDYOLn0X4aVMJDe1dA4egrWGkU0Wpf7QVZ587+ceE2A2YC5xQV6qa3aszf23UFN0Rtp60pkk0mbEdMk4W7TpB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpxLaGXY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpxLaGXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768527756; x=1800063756;
  h=date:from:to:cc:subject:message-id;
  bh=4A+DULxXUIQI+tCW7dM4TmcMCsHnHKM4bk1mhLPaI3A=;
  b=VpxLaGXYe5csmybTvJs0NqoASwwDGuZ/fqu9ygcZSkt6uS1nl2J1545V
   2alh25tHFpQe1U8yxfkKva8N38BXeWxf+pFbK9UfWsfEL2mDAO9lPmCak
   ZE9jbvZTwz9XjDavjfAsov1swMceocr1tm/maFmk3OCviy9GKk8xm3cQG
   d3JnDtLsxTou0vMO6J7YufA2DyZVl+4Zr5/TMMpxJz/blY6NknUuwBZkX
   jiWIBwuD36BpEJJunobNeClllGkrwHFMz0OWa3XmrIkHlmCcYXi0elIJy
   dyHqy4ul3Ku5cKZtK7T5SW3068jDVjO6/6WDuRSoF1G46pJTtExUisSxR
   w==;
X-CSE-ConnectionGUID: RReUruUfRSuCIV/RQ2t4Lw==
X-CSE-MsgGUID: Wo5r9SdSQi6wrQ/0leS3+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69936355"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69936355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 17:42:31 -0800
X-CSE-ConnectionGUID: 9VDetiS0QSaMaeErqKWMiA==
X-CSE-MsgGUID: LxZmyLWqQPi/VVOm9RqqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="205168192"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jan 2026 17:42:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYr5-00000000KE8-0XTX;
	Fri, 16 Jan 2026 01:42:27 +0000
Date: Fri, 16 Jan 2026 09:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 148/206]
 fs/bcachefs/alloc/backpointers.c:1351:undefined reference to `__udivdi3'
Message-ID: <202601160946.G7F3qnU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   6bbcfab4a7c266297617a255201d442119d0caa5
commit: ee275944ddf8276ecd88d14df78394828d89535e [148/206] bcachefs: backpointer_scan_iter
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160946.G7F3qnU7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160946.G7F3qnU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160946.G7F3qnU7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/bcachefs/alloc/backpointers.o: in function `bch2_bp_scan_iter_peek':
>> fs/bcachefs/alloc/backpointers.c:1351:(.text+0x4ef2): undefined reference to `__udivdi3'


vim +1351 fs/bcachefs/alloc/backpointers.c

  1326	
  1327	struct bkey_s_c_backpointer bch2_bp_scan_iter_peek(struct btree_trans *trans,
  1328							   struct bp_scan_iter *iter, struct bpos end,
  1329							   struct wb_maybe_flush *last_flushed)
  1330	{
  1331		if (iter->nr_flushes != last_flushed->nr_flushes) {
  1332			if (iter->bps.nr) {
  1333				struct bkey_i_backpointer *prev = &darray_last(iter->bps);
  1334	
  1335				CLASS(btree_iter, bp_iter)(trans, BTREE_ID_backpointers, prev->k.p, 0);
  1336				struct bkey_s_c k;
  1337				int ret = bkey_err(k = bch2_btree_iter_peek_slot(&bp_iter));
  1338				if (bkey_err(k))
  1339					return (struct bkey_s_c_backpointer) { .k = ERR_PTR(ret) };
  1340	
  1341				if (k.k->type == KEY_TYPE_backpointer)
  1342					bkey_reassemble(&prev->k_i, k);
  1343				else
  1344					--iter->bps.nr;
  1345			}
  1346	
  1347			iter->nr_flushes = last_flushed->nr_flushes;
  1348		}
  1349	
  1350		if (!iter->bps.nr) {
> 1351			size_t limit = (system_totalram_bytes() / 16) /
  1352				sizeof(struct bkey_i_backpointer);
  1353	
  1354			u32 restart_count = trans->restart_count;
  1355	
  1356			int ret = for_each_btree_key_max(trans, bp_iter, BTREE_ID_backpointers,
  1357						   iter->pos, end, BTREE_ITER_prefetch, k, ({
  1358				if (k.k->type != KEY_TYPE_backpointer)
  1359					continue;
  1360	
  1361				struct bkey_i_backpointer bp;
  1362				bkey_reassemble(&bp.k_i, k);
  1363				if (iter->bps.nr > limit ||
  1364				    darray_push_gfp(&iter->bps, bp, GFP_KERNEL|__GFP_NOWARN))
  1365					break;
  1366	
  1367				iter->pos = bpos_nosnap_successor(k.k->p);
  1368				(iter->progress
  1369				 ? bch2_progress_update_iter(trans, iter->progress, &bp_iter)
  1370				 : 0);
  1371			}));
  1372			trans->restart_count = restart_count;
  1373	
  1374			if (ret)
  1375				return ((struct bkey_s_c_backpointer) { .k = ERR_PTR(ret) });
  1376	
  1377			if (!iter->bps.nr)
  1378				return (struct bkey_s_c_backpointer) {};
  1379	
  1380			darray_sort(iter->bps, bkey_i_backpointer_cmp);
  1381		}
  1382	
  1383		return backpointer_i_to_s_c(&darray_last(iter->bps));
  1384	}
  1385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
