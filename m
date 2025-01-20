Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E51EE029
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737408240; cv=none; b=Jj7BZQMLimbouOFpJXvUowB4Ud++r3KUYeuJh0OJirYl1zGrqn/T8pDl7d1Rd1P6TozXYtlsrRP4nuwQR3ocUY1T9xGMxJNXRsJKO3TxA9AFZTJhvsSdJ7/kXhjTejCXrPg9pdT2vYDz/Ku/gRxnLvzaODfgt4/6etVMVZYrESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737408240; c=relaxed/simple;
	bh=wiCKzZ6v54i2Ndlok2YqijODsK93FxK40Q8Te+R18fU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4/pfst3gpTXxfhjmc8lxUuwTf5c9gcSmtb+ZFd3jA3ySLINyM5ARA1f+t5xHpFwbVzcfQ68nNeOFFFZOY78Ki+YAa1jSrb6IkoGbbw9+QgXxQvZwDae1RBOKHR4Vqiw4I1JX0ig472HOcmk6EcnR4efKQldbdZfvcjLyam0tII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdNs5vBp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdNs5vBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737408238; x=1768944238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiCKzZ6v54i2Ndlok2YqijODsK93FxK40Q8Te+R18fU=;
  b=cdNs5vBpPW2v0W30rBIewikhwgxsT5gMdLxq6lAU44BLz4JI6omKwEdG
   Po2XlSc/1CNrOW7IfdI+Xgka3e+DLy7nUKTQf25urTAk0oHYmMVka11VC
   0YsWS8KUJmI0aPgYSXv2a2TaMx9j3WnDCbHKSHZjxql7N1mstet/fT9pY
   uE+vANhU74v9NxXHjejxQ6PiAFIvS8EE/FWg+S5NhI9tgjrtc9CIB6ZTJ
   yHUzcEnv+mhvF7MV9dnFkVX8TygTNmQbPmzkqBG/iC/yn/ehP1Jbq9dFI
   IUAyguFNOO3hpq1yGn72E8djn9Gt3CxKI4uhrEIW2GiHjjQU5KAT4+9+A
   Q==;
X-CSE-ConnectionGUID: COgIUTmXSHasQaKumlftSA==
X-CSE-MsgGUID: KaIaIfRIQ5aR0gCDzSetOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41485025"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="41485025"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:23:58 -0800
X-CSE-ConnectionGUID: ZMmPTZwSTEWQYNGMTpF7Sw==
X-CSE-MsgGUID: MBwOUE3HSgqECbVqQDPJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137508271"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 13:23:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzFM-000Wz3-2H;
	Mon, 20 Jan 2025 21:23:48 +0000
Date: Tue, 21 Jan 2025 05:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 294/295]
 fs/bcachefs/btree_io.c:1922:36-37: Unneeded semicolon
Message-ID: <202501210547.ZdLJxtbP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   cb4af57eb5a0046c43df9141f8f0cc7aed9f49c0
commit: 6ef9eab6f449eafe3b6c6a467500bae280a7c8be [294/295] bcachefs: bch2_btree_node_scrub()
config: mips-randconfig-r053-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210547.ZdLJxtbP-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210547.ZdLJxtbP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_io.c:1922:36-37: Unneeded semicolon

vim +1922 fs/bcachefs/btree_io.c

  1886	
  1887	static void btree_node_scrub_work(struct work_struct *work)
  1888	{
  1889		struct btree_node_scrub *scrub = container_of(work, struct btree_node_scrub, work);
  1890		struct bch_fs *c = scrub->c;
  1891		struct printbuf err = PRINTBUF;
  1892	
  1893		__bch2_btree_pos_to_text(&err, c, scrub->btree, scrub->level,
  1894					 bkey_i_to_s_c(scrub->key.k));
  1895		prt_newline(&err);
  1896	
  1897		if (!btree_node_scrub_check(c, scrub->buf, scrub->written, &err)) {
  1898			struct btree_trans *trans = bch2_trans_get(c);
  1899	
  1900			struct btree_iter iter;
  1901			bch2_trans_node_iter_init(trans, &iter, scrub->btree,
  1902						  scrub->key.k->k.p, 0, scrub->level - 1, 0);
  1903	
  1904			struct btree *b;
  1905			int ret = lockrestart_do(trans, PTR_ERR_OR_ZERO(b = bch2_btree_iter_peek_node(&iter)));
  1906			if (ret)
  1907				goto err;
  1908	
  1909			if (bkey_i_to_btree_ptr_v2(&b->key)->v.seq == scrub->seq) {
  1910				bch_err(c, "error validating btree node during scrub on %s at btree %s",
  1911					scrub->ca->name, err.buf);
  1912	
  1913				ret = bch2_btree_node_rewrite(trans, &iter, b, 0);
  1914			}
  1915	err:
  1916			bch2_trans_iter_exit(trans, &iter);
  1917			bch2_trans_begin(trans);
  1918			bch2_trans_put(trans);
  1919		}
  1920	
  1921		printbuf_exit(&err);
> 1922		bch2_bkey_buf_exit(&scrub->key, c);;
  1923		btree_bounce_free(c, c->opts.btree_node_size, scrub->used_mempool, scrub->buf);
  1924		percpu_ref_put(&scrub->ca->io_ref);
  1925		kfree(scrub);
  1926		bch2_write_ref_put(c, BCH_WRITE_REF_btree_node_scrub);
  1927	}
  1928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
