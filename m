Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5D29AAE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 07:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753946115; cv=none; b=nhms/qlF2DwNQgxzCq7Y6FPqNfIdnivxbsyggxLaeVWeyNBNLo7S2BWfAEOlcaS9NiAvd8pT+v+PW8a9Ipx9/fb1Yw/h5LnGfcUaju8EvCJu22OCrZLuaNvYfiyw93/qR0hqyR7K4hapfk6Vswl2miKu2kT9jMr/JxkUscZ4ZHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753946115; c=relaxed/simple;
	bh=AEYCGDPhjDJQ4X3GbKWxOJ0KpsiKn3+q43seKnj0pKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCiADaOL1QkDTFlO66Bg0RIs6BD2Y7Xt82xgTm5J2R+Wa8dKd+gw2bhC+yoT3l1ZkLQkbisOzIzU6Fb6YDeo18GGxf93Y+IfvrwsvXBw4RMbUm/jf0E/VslHMgyFyTWbFc6pgwK4bbwQorKiz4TrFjZxgLPRQeViztfo82hYsJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTI/84Ur; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTI/84Ur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753946114; x=1785482114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AEYCGDPhjDJQ4X3GbKWxOJ0KpsiKn3+q43seKnj0pKY=;
  b=YTI/84UrkmD5UBr5RSuYxJe5bPQHf8hK/5bpRddwSeXEf3MZVTxistKx
   BBdaxIfypi8N4+dmNE2WExVUOVOy2RXIOvoEDnZCrUU0uvJMKN3U7YSMO
   17Yom2lY1XopcfYx0bQa5+uSW9aPvmsyr4VT+dgMFbtUocmtpLYcp6gpS
   z0BXgcta4bkkXFnW23EqqGCa408hlWpCvK7uu6j2ToN38QBV8l8Ju6x9H
   mkV5kYBkfDQp59kMIwjNe91G7Jkdrl9SbDvgTEBPWO7P0xjsL3CzMbMse
   EGuFvPM5GPocdkyCLE+WmzDgRc/gAfxBjHjzNxUWlati27QRdvc3XPMl4
   g==;
X-CSE-ConnectionGUID: jWqefmlFQ0OhxOXrblvgRQ==
X-CSE-MsgGUID: dtaPYaQ6QQ+rdC3Ihx+ROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66953409"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="66953409"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 00:15:13 -0700
X-CSE-ConnectionGUID: 8/sZ5hZFTSqgv/zsEXqzmQ==
X-CSE-MsgGUID: 8iyfAc7KS2K/vzxcLcL1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="200354929"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2025 00:15:13 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhNVO-0003Vo-0h;
	Thu, 31 Jul 2025 07:15:10 +0000
Date: Thu, 31 Jul 2025 15:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 231/231] fs/bcachefs/io_write.c:377:20:
 warning: unused variable 'iter'
Message-ID: <202507311531.5K99PBjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3c91617410c88ee0388ef57f205fc200b914a19f
commit: 3c91617410c88ee0388ef57f205fc200b914a19f [231/231] bcachefs: CLASS(btree_iter)
config: s390-randconfig-002-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311531.5K99PBjf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311531.5K99PBjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311531.5K99PBjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/io_write.c: In function 'bch2_write_index_default':
>> fs/bcachefs/io_write.c:377:20: warning: unused variable 'iter' [-Wunused-variable]
     377 |  struct btree_iter iter;
         |                    ^~~~


vim +/iter +377 fs/bcachefs/io_write.c

70de7a47e2c56a fs/bcachefs/io.c       Kent Overstreet 2022-11-13  370  
af171183194f73 fs/bcachefs/io.c       Kent Overstreet 2022-10-28  371  static int bch2_write_index_default(struct bch_write_op *op)
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  372  {
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  373  	struct bch_fs *c = op->c;
07a1006ae81580 fs/bcachefs/io.c       Kent Overstreet 2020-12-17  374  	struct bkey_buf sk;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  375  	struct keylist *keys = &op->insert_keys;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  376  	struct bkey_i *k = bch2_keylist_front(keys);
67e0dd8f0d8b4b fs/bcachefs/io.c       Kent Overstreet 2021-08-30 @377  	struct btree_iter iter;
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  378  	subvol_inum inum = {
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  379  		.subvol = op->subvol,
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  380  		.inum	= k->k.p.inode,
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  381  	};
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  382  	int ret;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  383  
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  384  	BUG_ON(!inum.subvol);
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  385  
3e45706bb210f6 fs/bcachefs/io_write.c Kent Overstreet 2025-07-14  386  	CLASS(btree_trans, trans)(c);
07a1006ae81580 fs/bcachefs/io.c       Kent Overstreet 2020-12-17  387  	bch2_bkey_buf_init(&sk);
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  388  
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  389  	do {
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  390  		bch2_trans_begin(trans);
a8abd3a7f63efe fs/bcachefs/io.c       Kent Overstreet 2019-12-20  391  
35189e09ab4678 fs/bcachefs/io.c       Kent Overstreet 2019-11-09  392  		k = bch2_keylist_front(keys);
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  393  		bch2_bkey_buf_copy(&sk, c, k);
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  394  
6bd68ec266ad71 fs/bcachefs/io_write.c Kent Overstreet 2023-09-12  395  		ret = bch2_subvolume_get_snapshot(trans, inum.subvol,
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  396  						  &sk.k->k.p.snapshot);
549d173c1bd9b5 fs/bcachefs/io.c       Kent Overstreet 2022-07-17  397  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  398  			continue;
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  399  		if (ret)
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  400  			break;
e751c01a8ee1ca fs/bcachefs/io.c       Kent Overstreet 2021-03-24  401  
3c91617410c88e fs/bcachefs/io_write.c Kent Overstreet 2025-07-30  402  		CLASS(btree_iter, iter)(trans, BTREE_ID_extents,
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  403  					bkey_start_pos(&sk.k->k),
5dd8c60e1e0448 fs/bcachefs/io_write.c Kent Overstreet 2024-04-07  404  					BTREE_ITER_slots|BTREE_ITER_intent);
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  405  
c631bb41f5a9cf fs/bcachefs/io_write.c Kent Overstreet 2025-05-16  406  		ret =   bch2_extent_update(trans, inum, &iter, sk.k,
a1ee777bfcceeb fs/bcachefs/io.c       Kent Overstreet 2022-11-03  407  					&op->res,
a6336910b1c307 fs/bcachefs/io.c       Kent Overstreet 2021-05-20  408  					op->new_i_size, &op->i_sectors_delta,
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  409  					op->flags & BCH_WRITE_check_enospc);
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  410  
549d173c1bd9b5 fs/bcachefs/io.c       Kent Overstreet 2022-07-17  411  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  412  			continue;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  413  		if (ret)
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  414  			break;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  415  
e88a75ebe86c1d fs/bcachefs/io.c       Kent Overstreet 2022-11-24  416  		if (bkey_ge(iter.pos, k->k.p))
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  417  			bch2_keylist_pop_front(&op->insert_keys);
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  418  		else
8c6d298ab22fc1 fs/bcachefs/io.c       Kent Overstreet 2021-03-12  419  			bch2_cut_front(iter.pos, k);
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  420  	} while (!bch2_keylist_empty(keys));
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  421  
07a1006ae81580 fs/bcachefs/io.c       Kent Overstreet 2020-12-17  422  	bch2_bkey_buf_exit(&sk, c);
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  423  
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  424  	return ret;
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  425  }
9a3df993e15e0d fs/bcachefs/io.c       Kent Overstreet 2019-10-09  426  

:::::: The code at line 377 was first introduced by commit
:::::: 67e0dd8f0d8b4bf09098c4692abcb43a20089dff bcachefs: btree_path

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
