Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E52301706
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352282; cv=none; b=UQ73G55PYKnp+JHXqn0EvOGJ2YXQqnkRcAkxqhr4di40btS7bOtqZNcyc6j30qiJ97FdMP75q4yPPpLM6vFNoRalpgO+u8h8sGTJM5MajL9H1rDH/fJ3XZaF+x00lYMWIauWQrpAyT9/CjSMQqZUigbOcYeai3K2a3z101Nwlg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352282; c=relaxed/simple;
	bh=0rgFXAdhZYIl4uZfRj/KpdaKtwfix/8nzFdE6wQsJ20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIAz+EWRLCz9HvOMbhRRi40AztFm0cWyY8LXXJR1iX8CbDyL18g8K9XLZgILrKECpCEmA3iBeN+5OQUrZ2SzMy7OlS8vL/W2/+pLi3411cEBqXneTEHxbWVDXXNAGVF+6LNaokgx1t5ywuY5M5IITbQCph4lwuu+tAShc8cY5IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9W0L0Ec; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9W0L0Ec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760352277; x=1791888277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rgFXAdhZYIl4uZfRj/KpdaKtwfix/8nzFdE6wQsJ20=;
  b=d9W0L0EcY6G4IO6XY0euKihuuzRB8JCfSeLQsbKLAPbQMM9YlrRyasFd
   pNVGtgg8oGPn9KIKoLHfJxXLbBoMcVpjDwsWO+84wFrVbR+9ewvcszazC
   sSLpeQs2SjSbXIZtvlvkowrTZcR4VM6sSnNXjxqPMSCPwq54ibkKSA5sM
   csFEEAUoNS+mXOmubxhiOdlnJYbYHJDDbS6iBMpM266AkwTt7Y1KjU9mf
   9kjcFWJpnDSfUjZonvGtCcef0VgjRVANgH0DJa4EPib7+ZlJBp1xL9l/l
   qYUwBLNgZWATv8eQddLwXM9rsiFM83qsNZZ6jWyQLczSHIXIa0YvOAuXG
   Q==;
X-CSE-ConnectionGUID: hARyN4MPRkmfvT78nS04cg==
X-CSE-MsgGUID: EODp2EoHTIWvGdyrNbyMpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62520070"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62520070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 03:44:33 -0700
X-CSE-ConnectionGUID: HioUa1mXRHS5FkQQZ5ef6w==
X-CSE-MsgGUID: JDR7KF+jQbuQWBDrmUv2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="205252812"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 03:44:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8G2X-0000Mn-2L;
	Mon, 13 Oct 2025 10:44:29 +0000
Date: Mon, 13 Oct 2025 18:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master /569] fs/bcachefs/data/rebalance.c:368:2: error: a
 label can only be part of a statement and a declaration is not a statement
Message-ID: <202510131849.cvspSn85-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ab6262d0e3688744f5ecdd6086e0c15e3ec22c79
commit: c2566abb1266756014a8464808dcdf7def91fe31 [/569] bcachefs: bch2_bkey_get_io_opts() responsible for indirect extent opts
config: arm-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131849.cvspSn85-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131849.cvspSn85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131849.cvspSn85-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/data/rebalance.c: In function 'bch2_bkey_get_io_opts':
>> fs/bcachefs/data/rebalance.c:368:2: error: a label can only be part of a statement and a declaration is not a statement
     368 |  const struct bch_extent_rebalance *old = bch2_bkey_rebalance_opts(k);
         |  ^~~~~


vim +368 fs/bcachefs/data/rebalance.c

   288	
   289	int bch2_bkey_get_io_opts(struct btree_trans *trans,
   290				  struct per_snapshot_io_opts *snapshot_opts, struct bkey_s_c k,
   291				  struct bch_inode_opts *opts)
   292	{
   293		struct bch_fs *c = trans->c;
   294	
   295		if (!snapshot_opts) {
   296			bch2_inode_opts_get(c, opts, bkey_is_btree_ptr(k.k));
   297	
   298			if (k.k->type == KEY_TYPE_reflink_v)
   299				goto indirect_extent_fixups;
   300	
   301			if (!bkey_is_btree_ptr(k.k) && k.k->type != KEY_TYPE_reflink_v) {
   302				struct bch_inode_unpacked inode;
   303				int ret = bch2_inode_find_by_inum_snapshot(trans, k.k->p.inode, k.k->p.snapshot,
   304									   &inode, BTREE_ITER_cached);
   305				if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
   306					return ret;
   307				if (!ret)
   308					bch2_inode_opts_get_inode(c, &inode, opts);
   309			}
   310	
   311			return 0;
   312		}
   313	
   314		if (snapshot_opts->fs_io_opts.change_cookie != atomic_read(&c->opt_change_cookie)) {
   315			bch2_inode_opts_get(c, &snapshot_opts->fs_io_opts, bkey_is_btree_ptr(k.k));
   316	
   317			snapshot_opts->cur_inum = 0;
   318			snapshot_opts->d.nr = 0;
   319		}
   320	
   321		if (bkey_is_btree_ptr(k.k)) {
   322			*opts = snapshot_opts->fs_io_opts;
   323			return 0;
   324		}
   325	
   326		if (k.k->type == KEY_TYPE_reflink_v) {
   327			*opts = snapshot_opts->fs_io_opts;
   328			goto indirect_extent_fixups;
   329		}
   330	
   331		if (snapshot_opts->cur_inum != k.k->p.inode) {
   332			snapshot_opts->d.nr = 0;
   333	
   334			int ret = for_each_btree_key(trans, iter, BTREE_ID_inodes, POS(0, k.k->p.inode),
   335						     BTREE_ITER_all_snapshots, k, ({
   336				if (k.k->p.offset != k.k->p.inode)
   337					break;
   338	
   339				if (!bkey_is_inode(k.k))
   340					continue;
   341	
   342				struct bch_inode_unpacked inode;
   343				_ret3 = bch2_inode_unpack(k, &inode);
   344				if (_ret3)
   345					break;
   346	
   347				struct snapshot_io_opts_entry e = { .snapshot = k.k->p.snapshot };
   348				bch2_inode_opts_get_inode(c, &inode, &e.io_opts);
   349	
   350				darray_push(&snapshot_opts->d, e);
   351			}));
   352	
   353			snapshot_opts->cur_inum = k.k->p.inode;
   354	
   355			return ret ?: bch_err_throw(c, transaction_restart_nested);
   356		}
   357	
   358		if (k.k->p.snapshot)
   359			darray_for_each(snapshot_opts->d, i)
   360				if (bch2_snapshot_is_ancestor(c, k.k->p.snapshot, i->snapshot)) {
   361					*opts = i->io_opts;
   362					return 0;
   363				}
   364	
   365		*opts = snapshot_opts->fs_io_opts;
   366		return 0;
   367	indirect_extent_fixups:
 > 368		const struct bch_extent_rebalance *old = bch2_bkey_rebalance_opts(k);
   369		if (old) {
   370	#define x(_name)								\
   371		if (old->_name##_from_inode) {						\
   372			opts->_name			= old->_name;			\
   373			opts->_name##_from_inode	= old->_name##_from_inode;	\
   374		}
   375		BCH_REBALANCE_OPTS()
   376	#undef x
   377		}
   378	
   379		return 0;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
