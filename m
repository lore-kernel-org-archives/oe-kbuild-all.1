Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D580026CE36
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 04:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756960358; cv=none; b=J8iW4EBmqxUKcjY1qkxb8BUAtM4+FR9LZOr11+mxZbPVt1LPd91/b+ELM+R5ZE273abSgmL3wCW16LVlfbiKgU1aEzvnqstXZnuTXFTmNVw3eljmISigBWDo8PmlqZ07lAZQ+dHkJ4MVFQQezS5ByOhi1Z64VTYaT3TtjMY6rXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756960358; c=relaxed/simple;
	bh=53Jpva9GupD1KAynVYNY+tItfx8PPwGwjHbMqoy6eu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPmmXgeWSkT/eT2bIVhW3PIuPpawFhIwzpwUlhxGRPCt+sd7qFMqP7qjdx+WE7FtlrjOSmDzYiyR3Dh6e/QE9doo14ouEfWUymyCGsvPTS7/MHPg2RbTgrCH7wzocS0Dc++IBU0TW1mH0HYBbODuVR8hw3dFlvr9hmHRGglILdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INe7IY3f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INe7IY3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756960356; x=1788496356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53Jpva9GupD1KAynVYNY+tItfx8PPwGwjHbMqoy6eu0=;
  b=INe7IY3fi/a9k+bxet6IMYXVL8lNlnL44u2fNB8t6VgkiLh2jyqakfWu
   YmYj2dt3EXX3qOsWWss7bZ+TUtQpyV4AjuZOaVGfA7CY0xSbe4FxCN5pM
   XgbofN/jotbO7vsom0ecPDMFzvJY6HwgxIhNXPZ5VmUOjR+HJZzPqChYG
   DpWtRKD9qIoZY1aIDvd7NUHnRYx5NLnDiIHW3oinXwAQEtFjClO9pypeG
   6ZBD+Owa2vSH6eqt/j+/tSxZyIm5/A7v7L+3ZVXd4z8hOQdvpl7wAZuSS
   1lHREBScXXz+fjipc1unfYMpxhePZwlD/byCqvF+Y2wusZSqW+2FkxM43
   g==;
X-CSE-ConnectionGUID: l/mwZcAGQGiKydyLAcQkvg==
X-CSE-MsgGUID: zDaQLCoIRXuYk/30y/0Gpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76736332"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="76736332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 21:32:35 -0700
X-CSE-ConnectionGUID: AXKwbnw5REeCJvzI6MEBSQ==
X-CSE-MsgGUID: M4grias2TzKKW1LCdxihPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="177043918"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2025 21:32:34 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu1eA-0004kb-2W;
	Thu, 04 Sep 2025 04:32:30 +0000
Date: Thu, 4 Sep 2025 12:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 329/329]
 fs/bcachefs/backpointers.c:969:33: error: implicit declaration of function
 '__WARN'; did you mean '__warn'?
Message-ID: <202509041222.rNobimSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   1419ab5663efc7a18a3b76af1cba9024d3cdfe0c
commit: d1a65c46ee1f3f0585f0b990f4843367219e48b8 [329/329] bcachefs: Fix infinite loop in backpointers fsck on upgrade
config: x86_64-buildonly-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041222.rNobimSh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041222.rNobimSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041222.rNobimSh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/backpointers.c: In function 'check_bucket_backpointer_mismatch':
>> fs/bcachefs/backpointers.c:969:33: error: implicit declaration of function '__WARN'; did you mean '__warn'? [-Werror=implicit-function-declaration]
     969 |                                 __WARN();
         |                                 ^~~~~~
         |                                 __warn
   cc1: some warnings being treated as errors


vim +969 fs/bcachefs/backpointers.c

   866	
   867	static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
   868						     bool *had_mismatch,
   869						     struct bkey_buf *last_flushed,
   870						     struct bpos *last_pos,
   871						     unsigned *nr_iters)
   872	{
   873		struct bch_fs *c = trans->c;
   874		struct bch_alloc_v4 a_convert;
   875		const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
   876		bool need_commit = false;
   877	
   878		if (!bpos_eq(*last_pos, alloc_k.k->p))
   879			*nr_iters = 0;
   880	
   881		*last_pos = alloc_k.k->p;
   882	
   883		*had_mismatch = false;
   884	
   885		if (a->data_type == BCH_DATA_sb ||
   886		    a->data_type == BCH_DATA_journal ||
   887		    a->data_type == BCH_DATA_parity)
   888			return 0;
   889	
   890		u32 sectors[ALLOC_SECTORS_NR];
   891		memset(sectors, 0, sizeof(sectors));
   892	
   893		CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
   894		if (!ca)
   895			return 0;
   896	
   897		struct bkey_s_c bp_k;
   898		int ret = 0;
   899		for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   900					bucket_pos_to_bp_start(ca, alloc_k.k->p),
   901					bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   902			if (bp_k.k->type != KEY_TYPE_backpointer)
   903				continue;
   904	
   905			struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
   906	
   907			if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
   908			    (bp.v->bucket_gen != a->gen ||
   909			     bp.v->pad)) {
   910				ret = bch2_backpointer_del(trans, bp_k.k->p);
   911				if (ret)
   912					return ret;
   913	
   914				need_commit = true;
   915				continue;
   916			}
   917	
   918			if (bp.v->bucket_gen != a->gen)
   919				continue;
   920	
   921			int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
   922			if (alloc_counter < 0)
   923				continue;
   924	
   925			sectors[alloc_counter] += bp.v->bucket_len;
   926		};
   927		if (ret)
   928			return ret;
   929	
   930		if (need_commit) {
   931			ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
   932			if (ret)
   933				return ret;
   934		}
   935	
   936		if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
   937		    sectors[ALLOC_cached] != a->cached_sectors ||
   938		    sectors[ALLOC_stripe] != a->stripe_sectors) {
   939			if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
   940			    sectors[ALLOC_cached] > a->cached_sectors ||
   941			    sectors[ALLOC_stripe] > a->stripe_sectors) {
   942				if (*nr_iters) {
   943					CLASS(printbuf, buf)();
   944					bch2_log_msg_start(c, &buf);
   945	
   946					prt_printf(&buf, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
   947						   "bucket %llu:%llu data type %s, counters\n",
   948						   alloc_k.k->p.inode,
   949						   alloc_k.k->p.offset,
   950						   __bch2_data_types[a->data_type]);
   951					if (sectors[ALLOC_dirty]  > a->dirty_sectors)
   952						prt_printf(&buf, "dirty: %u > %u\n",
   953							   sectors[ALLOC_dirty], a->dirty_sectors);
   954					if (sectors[ALLOC_cached] > a->cached_sectors)
   955						prt_printf(&buf, "cached: %u > %u\n",
   956							   sectors[ALLOC_cached], a->cached_sectors);
   957					if (sectors[ALLOC_stripe] > a->stripe_sectors)
   958						prt_printf(&buf, "stripe: %u > %u\n",
   959							   sectors[ALLOC_stripe], a->stripe_sectors);
   960	
   961					for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   962								bucket_pos_to_bp_start(ca, alloc_k.k->p),
   963								bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   964						bch2_bkey_val_to_text(&buf, c, bp_k);
   965						prt_newline(&buf);
   966					}
   967	
   968					bch2_print_str(c, KERN_ERR, buf.buf);
 > 969					__WARN();
   970					return ret;
   971				}
   972	
   973				ret = check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p);
   974				if (ret)
   975					return ret;
   976	
   977				*nr_iters += 1;
   978				return bch_err_throw(c, transaction_restart_nested);
   979			}
   980	
   981			/*
   982			 * Post 1.14 upgrade, we assume that backpointers are mostly
   983			 * correct and a sector count mismatch is probably due to a
   984			 * write buffer race
   985			 *
   986			 * Pre upgrade, we expect all the buckets to be wrong, a write
   987			 * buffer flush is pointless:
   988			 */
   989			if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen) {
   990				ret = bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed);
   991				if (ret)
   992					return ret;
   993			}
   994	
   995			bool empty = (sectors[ALLOC_dirty] +
   996				      sectors[ALLOC_stripe] +
   997				      sectors[ALLOC_cached]) == 0;
   998	
   999			ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
  1000						     alloc_k.k->p.offset) ?:
  1001				(empty
  1002				 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
  1003							  alloc_k.k->p.offset)
  1004				 : 0);
  1005	
  1006			*had_mismatch = true;
  1007		}
  1008	
  1009		return 0;
  1010	}
  1011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
