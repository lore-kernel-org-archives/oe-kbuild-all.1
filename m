Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BE0A41
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768079846; cv=none; b=pVWnTbJiXlPT7YhxQJ+bNtrkiwg0RbIZNKarW0iIaCKdR4ZsBP7McN1TjZFCbKx6TwEFWRchysFS52P4BK9wDg7UAh8c9iv9roGZAE8xfzGF0/XmnjjvguxdsrB2NTvH0UOXzdJ7j5OD1f7/zqbd4/1WMBMF3shkVcXQwvF8/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768079846; c=relaxed/simple;
	bh=rq7s/eDWw0Eg3051xQI8sO4ChyCChoa3ppeujb2pQ1M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKfQfzU6hHDLj90iD6GwTcluljo9lMeVcSxrTu2eq0OIuM+Roqye6qVDJaih/ctiZWEklrfSBwIfkqAjM0o++Yw3z+rATIZJRhd8tEWiE/RCjT72x9tvBO92TNTBqOWLPdeqjTvJO9kREiGsWHLpIPrUOITEwk/c7dSkcnqZP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUcBmjnU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUcBmjnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768079844; x=1799615844;
  h=date:from:to:cc:subject:message-id;
  bh=rq7s/eDWw0Eg3051xQI8sO4ChyCChoa3ppeujb2pQ1M=;
  b=iUcBmjnUpO/jn4NzAtOoHQ+skhbRNkx1M/jHrsu5offF22PSxrXT4WdZ
   eo3owDg9LDNu6LB1Z/RXPHCDTNx0pu6nwaszzqSv+eCw4iHTvgEcWt1g8
   d1N/TgoEdgCDGW1AT/MufR67zB7cZPgMU0R6X/MdNAcZO3Y9qwfAypZCa
   209AE8/JaFvIu9n6sgjHr6VYulSBnzp5DYtFh2z2JAko6cwx7gD2rsJLl
   UaKFJwJWQmQLgTarn3/b4Bdw4vjtN49WUjCc2s4sAHZCme8j/GABwBQoK
   zw4ohOB8dAg5t3jfj4adJVLBfIJYr08qJILp5NmlatPmT8n4sJUEeI30c
   Q==;
X-CSE-ConnectionGUID: PMDb6y/oSaqKulty7RDAYw==
X-CSE-MsgGUID: 5pECXX/NQ52FtP8eBQtT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69490534"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="69490534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 13:17:23 -0800
X-CSE-ConnectionGUID: PnokmmISQtKlR23s3fgw4Q==
X-CSE-MsgGUID: 3iQtVF2MTYa3MG/9u1NUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="234444954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2026 13:17:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vegKl-000000009Bo-39mo;
	Sat, 10 Jan 2026 21:17:19 +0000
Date: Sun, 11 Jan 2026 05:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1060/1155]
 fs/bcachefs/alloc/backpointers.c:963:1: warning: the frame size of 1336 bytes
 is larger than 1280 bytes
Message-ID: <202601110500.U1E3tdMN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   af2e18a32ff0ee83f028b504e0ff92450377ff24
commit: 04148c4e30f1a2a12ef87fed2c29c703b3269f05 [1060/1155] bcachefs: Convert more code to bch_log_msg
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260111/202601110500.U1E3tdMN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110500.U1E3tdMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110500.U1E3tdMN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/backpointers.c: In function 'check_bucket_backpointer_mismatch':
>> fs/bcachefs/alloc/backpointers.c:963:1: warning: the frame size of 1336 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     963 | }
         | ^


vim +963 fs/bcachefs/alloc/backpointers.c

c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  821  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  822  static int check_bucket_backpointers_to_extents(struct btree_trans *, struct bch_dev *, struct bpos,
a417a8f59a4808 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-21  823  						struct wb_maybe_flush *last_flushed);
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  824  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  825  static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
39cea302f13a0a fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  826  					     bool *had_mismatch,
a417a8f59a4808 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-21  827  					     struct wb_maybe_flush *last_flushed,
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  828  					     struct bpos *last_pos,
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  829  					     unsigned *nr_iters)
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  830  {
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  831  	struct bch_fs *c = trans->c;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  832  	struct bch_alloc_v4 a_convert;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  833  	const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  834  	bool need_commit = false;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  835  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  836  	if (!bpos_eq(*last_pos, alloc_k.k->p))
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  837  		*nr_iters = 0;
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  838  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  839  	*last_pos = alloc_k.k->p;
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  840  
39cea302f13a0a fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  841  	*had_mismatch = false;
39cea302f13a0a fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  842  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  843  	if (a->data_type == BCH_DATA_sb ||
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  844  	    a->data_type == BCH_DATA_journal ||
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  845  	    a->data_type == BCH_DATA_parity)
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  846  		return 0;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  847  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  848  	u32 sectors[ALLOC_SECTORS_NR];
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  849  	memset(sectors, 0, sizeof(sectors));
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  850  
6bf809fcd4197b fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-14  851  	CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  852  	if (!ca)
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  853  		return 0;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  854  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  855  	struct bkey_s_c bp_k;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  856  	int ret = 0;
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  857  	unsigned nr_deletes = 0;
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  858  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  859  	for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  860  				bucket_pos_to_bp_start(ca, alloc_k.k->p),
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  861  				bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  862  		if (bp_k.k->type != KEY_TYPE_backpointer)
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  863  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  864  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  865  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  866  
2b67b72da5a034 fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  867  		if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  868  		    (bp.v->bucket_gen != a->gen ||
d800fc8b69ff90 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-26  869  		     bp.v->flags)) {
3c16c1d9609b81 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-05  870  			try(bch2_backpointer_del(trans, bp_k.k->p));
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  871  			nr_deletes++;
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  872  
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  873  			if (nr_deletes > 256)
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  874  				return  bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc) ?:
bbbb5c36ae831d fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-11-22  875  					bch2_btree_write_buffer_flush_sync(trans);
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  876  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  877  			need_commit = true;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  878  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  879  		}
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  880  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  881  		if (bp.v->bucket_gen != a->gen)
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  882  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  883  
962322475bb5ce fs/bcachefs/backpointers.c       Kent Overstreet 2025-03-19  884  		int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
962322475bb5ce fs/bcachefs/backpointers.c       Kent Overstreet 2025-03-19  885  		if (alloc_counter < 0)
962322475bb5ce fs/bcachefs/backpointers.c       Kent Overstreet 2025-03-19  886  			continue;
962322475bb5ce fs/bcachefs/backpointers.c       Kent Overstreet 2025-03-19  887  
962322475bb5ce fs/bcachefs/backpointers.c       Kent Overstreet 2025-03-19  888  		sectors[alloc_counter] += bp.v->bucket_len;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  889  	};
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  890  	if (ret)
6bf809fcd4197b fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-14  891  		return ret;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  892  
3c16c1d9609b81 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-05  893  	if (need_commit)
3c16c1d9609b81 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-05  894  		try(bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc));
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  895  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  896  	if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  897  	    sectors[ALLOC_cached] > a->cached_sectors ||
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  898  	    sectors[ALLOC_stripe] > a->stripe_sectors) {
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  899  		if (*nr_iters) {
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  900  			CLASS(bch_log_msg, msg)(c);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  901  
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  902  			prt_printf(&msg.m, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  903  				   "bucket %llu:%llu data type %s, counters\n",
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  904  				   alloc_k.k->p.inode,
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  905  				   alloc_k.k->p.offset,
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  906  				   __bch2_data_types[a->data_type]);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  907  			if (sectors[ALLOC_dirty]  > a->dirty_sectors)
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  908  				prt_printf(&msg.m, "dirty: %u > %u\n",
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  909  					   sectors[ALLOC_dirty], a->dirty_sectors);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  910  			if (sectors[ALLOC_cached] > a->cached_sectors)
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  911  				prt_printf(&msg.m, "cached: %u > %u\n",
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  912  					   sectors[ALLOC_cached], a->cached_sectors);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  913  			if (sectors[ALLOC_stripe] > a->stripe_sectors)
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  914  				prt_printf(&msg.m, "stripe: %u > %u\n",
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  915  					   sectors[ALLOC_stripe], a->stripe_sectors);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  916  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  917  			for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  918  						bucket_pos_to_bp_start(ca, alloc_k.k->p),
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  919  						bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  920  				bch2_bkey_val_to_text(&msg.m, c, bp_k);
04148c4e30f1a2 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-12-02  921  				prt_newline(&msg.m);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  922  			}
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  923  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  924  			__WARN();
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  925  			return ret;
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  926  		}
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  927  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  928  		*nr_iters += 1;
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  929  
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  930  		return check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p, last_flushed) ?:
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  931  			bch_err_throw(c, transaction_restart_nested);
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  932  	}
8317017fbfa082 fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-04  933  
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  934  	if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
15800f3d4b0134 fs/bcachefs/backpointers.c       Kent Overstreet 2025-02-07  935  	    sectors[ALLOC_cached] != a->cached_sectors ||
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  936  	    sectors[ALLOC_stripe] != a->stripe_sectors) {
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  937  		/*
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  938  		 * Post 1.14 upgrade, we assume that backpointers are mostly
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  939  		 * correct and a sector count mismatch is probably due to a
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  940  		 * write buffer race
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  941  		 *
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  942  		 * Pre upgrade, we expect all the buckets to be wrong, a write
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  943  		 * buffer flush is pointless:
0fb08f59ed996c fs/bcachefs/backpointers.c       Kent Overstreet 2025-08-08  944  		 */
3c16c1d9609b81 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-05  945  		if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen)
3c16c1d9609b81 fs/bcachefs/alloc/backpointers.c Kent Overstreet 2025-10-05  946  			try(bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed));
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  947  
13ffcbae86dadb fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  948  		bool empty = (sectors[ALLOC_dirty] +
13ffcbae86dadb fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  949  			      sectors[ALLOC_stripe] +
13ffcbae86dadb fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  950  			      sectors[ALLOC_cached]) == 0;
13ffcbae86dadb fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  951  
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  952  		ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  953  					     alloc_k.k->p.offset) ?:
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  954  			(empty
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  955  			 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  956  						  alloc_k.k->p.offset)
15f969326ee296 fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-17  957  			 : 0);
39cea302f13a0a fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  958  
39cea302f13a0a fs/bcachefs/backpointers.c       Kent Overstreet 2025-05-09  959  		*had_mismatch = true;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  960  	}
6bf809fcd4197b fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-14  961  
6bf809fcd4197b fs/bcachefs/backpointers.c       Kent Overstreet 2025-07-14  962  	return 0;
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15 @963  }
c738866e47ef2e fs/bcachefs/backpointers.c       Kent Overstreet 2024-11-15  964  

:::::: The code at line 963 was first introduced by commit
:::::: c738866e47ef2e4d543698f0ab370ffe2b7e0d59 bcachefs: check_extents_to_backpointers() now only checks buckets with mismatches

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
