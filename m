Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B03528FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751205693; cv=none; b=JYD3yjsdl02vxcO977EZ8iGK3hUEZbCXBz1hKLfsAIoD6xseQHA2Mu2Dgs8rqXx8zHNs2HmtfmOtpe3tr8OCfp71xnFgPfbF6Uo7/xDakGpDLaLteCNRhOTVYIz39N0y5kzHNzgRsgzo8g52M3YWA9vasfyEAx/4SMuKI14wV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751205693; c=relaxed/simple;
	bh=xhIFcxH8Wh2lL+wkQtyMJEHp4NUZa0UsjVUpryji6t0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+KI9KU5znIFW0tsp8pt57/37mTRT2DsHa2CljNcWdSxNif9p1L+Kt7JNkwGNOkils6Hd81IkvRdUCOhKMbKT0qr5DHXfTrRE9zVTgPyK6k5EiOQ1v85nGuy6PfkKgarxGevenqobizNELKprXS85WetegAw/jPbd4xCiSjVOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5nz2PMX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5nz2PMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751205691; x=1782741691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhIFcxH8Wh2lL+wkQtyMJEHp4NUZa0UsjVUpryji6t0=;
  b=L5nz2PMXdunkdYcyo3GI2tVaS5HGvGmXlCQQa/zkdlWwxWCxhHr2UH01
   3sODHnzK+F7KViIdoTbedYn0klE5YSGk3JH8EgOZCO9ZGQxtSDmnwslYO
   NYFTbftKn9B+pluqaimpSXCpusXeKdH9hxRwvt9w0I5pG0sX5OqhiGvbx
   c2P+Tpv6GfhG2He/7iwnnApqbF4RK6IPba0ozGBM53pS9oBbWPjX4+jBh
   JADUuhTy6fv54NXnENWx2RTHYPNqtJfQt+GNf46AmnGAiTWDDDNorPLb9
   1bT8dT1SCq5UrLaeRe34LkHRiE2JYAoL7/baDslHS0O+DHm78npcgmDrQ
   A==;
X-CSE-ConnectionGUID: Nik3ruPGSd+x7XTYexjPcw==
X-CSE-MsgGUID: F5wERAr3QN2Qp87qH6uVpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53593536"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53593536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 07:01:31 -0700
X-CSE-ConnectionGUID: zA4r7ZLtQF+fT16F/AC9Kw==
X-CSE-MsgGUID: cBu9RpbhSaC/bQKISxviUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="184146574"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jun 2025 07:01:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVsb2-000Xz8-0R;
	Sun, 29 Jun 2025 14:01:28 +0000
Date: Sun, 29 Jun 2025 22:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 68/89] fs/bcachefs/btree_trans_commit.c:345:32-33:
 Unneeded semicolon
Message-ID: <202506292119.JPRdXNOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   cb09cb340afe5410c81a6cb006a1740c45b7b66b
commit: 4045e643af83729130e7a3523cfb9d8e5ec7aa7c [68/89] bcachefs: Evict/bypass key cache when deleting
config: x86_64-randconfig-103-20250629 (https://download.01.org/0day-ci/archive/20250629/202506292119.JPRdXNOG-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292119.JPRdXNOG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_trans_commit.c:345:32-33: Unneeded semicolon

vim +345 fs/bcachefs/btree_trans_commit.c

   335	
   336	static inline void btree_insert_entry_checks(struct btree_trans *trans,
   337						     struct btree_insert_entry *i)
   338	{
   339		struct btree_path *path = trans->paths + i->path;
   340	
   341		BUG_ON(!bpos_eq(i->k->k.p, path->pos));
   342		BUG_ON(i->cached	!= path->cached);
   343		BUG_ON(i->cached &&
   344		       !i->key_cache_already_flushed  &&
 > 345		       bkey_deleted(&i->k->k));;
   346		BUG_ON(i->level		!= path->level);
   347		BUG_ON(i->btree_id	!= path->btree_id);
   348		BUG_ON(i->bkey_type	!= __btree_node_type(path->level, path->btree_id));
   349		EBUG_ON(!i->level &&
   350			btree_type_has_snapshots(i->btree_id) &&
   351			!(i->flags & BTREE_UPDATE_internal_snapshot_node) &&
   352			test_bit(JOURNAL_replay_done, &trans->c->journal.flags) &&
   353			i->k->k.p.snapshot &&
   354			bch2_snapshot_is_internal_node(trans->c, i->k->k.p.snapshot) > 0);
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
