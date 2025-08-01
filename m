Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571AC1F5EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 19:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754077544; cv=none; b=XlUKBQglqJ1mwnefXDU8Yb/ueIQlvEkvUSRjUc7HSMlRokAWSbV3YFWPNSt8Ji1Zi3GA0K9pjRPW3m1f/TFCgZUj0xW2ghsoxBmIJYHAWMbVUN2S2IIA1EPIxmtfbHf1UNTReTVKh9QVbbCSdy+mVx9IHa9CSvwE+PvoZP68aPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754077544; c=relaxed/simple;
	bh=ezY3CKXK4XkE0O2ilAnQQpkkknpQ9Cd/RzWUgyp3rxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPP1SSKT6R7jhdx+TqUeqKHs3TNlcgDlXaJdOki+VQ/kYqiwNYgrl5o+DOftJmUec8AVMYjNRKIHbiB42hz3h1FD8xdjdRhFVw6Hnr7tc/7qatMR6k7XHLd/KzN7VqWWtdb+sYj/oF1xfFPR5GQnM9eBumedd3SmvaRm1ZBojXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HW9PeAJ/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HW9PeAJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754077542; x=1785613542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezY3CKXK4XkE0O2ilAnQQpkkknpQ9Cd/RzWUgyp3rxM=;
  b=HW9PeAJ/JfJeGOQWwwLkN9LSLafXbjJQHxV44Sxch9dzGLih1MOR6rXm
   /6j/GeZSZW0c68wxqkO/liLLkkzsUFpB32A4cfs4rXOeMZkaqzb6S+N7T
   y6u/fNgm1o0V+3IPpKJzWjzZVls70GuCrNF9WEjfW4BTS+00boeK6OZdZ
   BSbFogoB3Z8rQdZ58gHnvtOAwpvY0r3ngXS+UD3Fh0weI15R+tbRqgzrR
   DuWW9xOiYYdxHgAq50i9/mG2mAlJIIbvUwHZkOCz/Ld0gCn2HV51w6ufD
   AmHwfEbRnECUKxCXppRsJd1xTHtA9nZ9q16iySpTbpZM3HwfUYE6e8Vpk
   Q==;
X-CSE-ConnectionGUID: 5ytLsu3XS9e7Z9I+IXnUTA==
X-CSE-MsgGUID: qpdlUKUwRcK5ZHcM6J+5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67505334"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67505334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 12:45:41 -0700
X-CSE-ConnectionGUID: 7OHT/za9QfGRxp/SiJB9bg==
X-CSE-MsgGUID: cdClfN+ESaG/3QzUgaR6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164030203"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Aug 2025 12:45:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhvhC-0004sW-1o;
	Fri, 01 Aug 2025 19:45:38 +0000
Date: Sat, 2 Aug 2025 03:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 242/245]
 fs/bcachefs/btree_update.c:241:73: warning: the omitted middle operand in
 '?:' will always be 'true', suggest explicit middle operand
Message-ID: <202508020310.zCvLxy3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   0578ddb0c7a29b52a4c947e2a496aed8709074f3
commit: 123601916647ab847fe6e6ecfbae320fa8966886 [242/245] bcachefs: bcachefs_metadata_version_extent_snapshot_whiteouts
config: csky-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020310.zCvLxy3X-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020310.zCvLxy3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020310.zCvLxy3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_update.c: In function 'bch2_trans_update_extent_overwrite':
>> fs/bcachefs/btree_update.c:241:73: warning: the omitted middle operand in '?:' will always be 'true', suggest explicit middle operand [-Wparentheses]
     241 |                         ret =   new.k->p.snapshot != old.k->p.snapshot ?:
         |                                                                         ^


vim +241 fs/bcachefs/btree_update.c

   173	
   174	int bch2_trans_update_extent_overwrite(struct btree_trans *trans,
   175					       struct btree_iter *iter,
   176					       enum btree_iter_update_trigger_flags flags,
   177					       struct bkey_s_c old,
   178					       struct bkey_s_c new)
   179	{
   180		enum btree_id btree_id = iter->btree_id;
   181		struct bkey_i *update;
   182		struct bpos new_start = bkey_start_pos(new.k);
   183		unsigned front_split = bkey_lt(bkey_start_pos(old.k), new_start);
   184		unsigned back_split  = bkey_gt(old.k->p, new.k->p);
   185		unsigned middle_split = (front_split || back_split) &&
   186			old.k->p.snapshot != new.k->p.snapshot;
   187		unsigned nr_splits = front_split + back_split + middle_split;
   188		int ret = 0, compressed_sectors;
   189	
   190		/*
   191		 * If we're going to be splitting a compressed extent, note it
   192		 * so that __bch2_trans_commit() can increase our disk
   193		 * reservation:
   194		 */
   195		if (nr_splits > 1 &&
   196		    (compressed_sectors = bch2_bkey_sectors_compressed(old)))
   197			trans->extra_disk_res += compressed_sectors * (nr_splits - 1);
   198	
   199		if (front_split) {
   200			update = bch2_bkey_make_mut_noupdate(trans, old);
   201			if ((ret = PTR_ERR_OR_ZERO(update)))
   202				return ret;
   203	
   204			bch2_cut_back(new_start, update);
   205	
   206			ret =   bch2_insert_snapshot_whiteouts(trans, btree_id,
   207						old.k->p, update->k.p) ?:
   208				bch2_btree_insert_nonextent(trans, btree_id, update,
   209						BTREE_UPDATE_internal_snapshot_node|flags);
   210			if (ret)
   211				return ret;
   212		}
   213	
   214		/* If we're overwriting in a different snapshot - middle split: */
   215		if (middle_split) {
   216			update = bch2_bkey_make_mut_noupdate(trans, old);
   217			if ((ret = PTR_ERR_OR_ZERO(update)))
   218				return ret;
   219	
   220			bch2_cut_front(new_start, update);
   221			bch2_cut_back(new.k->p, update);
   222	
   223			ret =   bch2_insert_snapshot_whiteouts(trans, btree_id,
   224						old.k->p, update->k.p) ?:
   225				bch2_btree_insert_nonextent(trans, btree_id, update,
   226						  BTREE_UPDATE_internal_snapshot_node|flags);
   227			if (ret)
   228				return ret;
   229		}
   230	
   231		if (!back_split) {
   232			update = bch2_trans_kmalloc(trans, sizeof(*update));
   233			if ((ret = PTR_ERR_OR_ZERO(update)))
   234				return ret;
   235	
   236			bkey_init(&update->k);
   237			update->k.p = old.k->p;
   238			update->k.p.snapshot = new.k->p.snapshot;
   239	
   240			if (btree_type_has_snapshots(btree_id)) {
 > 241				ret =   new.k->p.snapshot != old.k->p.snapshot ?:
   242					need_whiteout_for_snapshot(trans, btree_id, update->k.p);
   243				if (ret < 0)
   244					return ret;
   245				if (ret)
   246					update->k.type = extent_whiteout_type(iter->btree_id, new.k);
   247			}
   248	
   249			ret = bch2_btree_insert_nonextent(trans, btree_id, update,
   250						  BTREE_UPDATE_internal_snapshot_node|flags);
   251			if (ret)
   252				return ret;
   253		} else {
   254			update = bch2_bkey_make_mut_noupdate(trans, old);
   255			if ((ret = PTR_ERR_OR_ZERO(update)))
   256				return ret;
   257	
   258			bch2_cut_front(new.k->p, update);
   259	
   260			ret = bch2_trans_update_by_path(trans, iter->path, update,
   261						  BTREE_UPDATE_internal_snapshot_node|
   262						  flags, _RET_IP_);
   263			if (ret)
   264				return ret;
   265		}
   266	
   267		return 0;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
