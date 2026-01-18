Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404C500954
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768706142; cv=none; b=LwqVVBthbxCSxzVpTk9QGo5SB7zPtCvslmWTNhAFgFmnR6wZRRF+FWCDq7N9wwb4TZsTCXFLCi4+DZMGMwsq49dvDqoS3smNgXOZKmh5KpzICmPF3WuDWwHbovX4iru0VAqB8pdpwzhe+YNLM4g3JtZGPAPZniyqVu/hRAGWFHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768706142; c=relaxed/simple;
	bh=OLv2ux4BI6AyDjhSv5O/gDkpF0vv1E4nc03nXfYQ3CA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dSnXuAVM0gvCObhZRWzdpjaf5JM9/CeQihCswb7ffTq8Smpo9/8ESE+f+Lbja10vaLzXVLTO4g7mJEN9E0fueFDaeW5SNAONnQcc+hEsoDKYzkRuhIAU2epJlU/jK3Ft7Ye1UFK24q3Z1cc7HkZTSnMOsvMoE9mJydGEjFL8QWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtnFv/Fl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtnFv/Fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768706141; x=1800242141;
  h=date:from:to:cc:subject:message-id;
  bh=OLv2ux4BI6AyDjhSv5O/gDkpF0vv1E4nc03nXfYQ3CA=;
  b=PtnFv/FlAcyA975SiIztiE5yr30jW4uYMMvhGBP9GL4XQs1TFubLHDlZ
   Ko7Cx6G5B4/F4NbOPQfO5c9E7PmM1Y3LgFdAY5m6fVYPlKhGjU+HTlQdK
   UCFyv/BeBdCw4MFMT48iQXfWUvbPXOCntn3kiMjLH0lc/tPspY4yFRLUo
   zlR4zF1RyCQmOcSESllKYrHOQNmbTHgjCYhmole36Z5KT9Z3g8zsWDmxg
   rFYQZ7FyRMuY0Tui0KCIROWKjfiYFjRvnqujSvx460GoI0WW9aZdO2+Ks
   U5jgNhcfl0eCNmnYOhtgdG4ANeRQ6yVvcHCeE0TL8h3lMJo9CpsJjHGPO
   Q==;
X-CSE-ConnectionGUID: x6ZWKz5hSuKQEI2zvha9dw==
X-CSE-MsgGUID: OJMnl48mRnu/RAjSNnz8JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70049721"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="70049721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 19:15:40 -0800
X-CSE-ConnectionGUID: 47rL2xfzSWaM9ilh1KqWuA==
X-CSE-MsgGUID: QGm3FJ9rT7CK3z9P8DkYjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="204714388"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 19:15:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhJGJ-00000000Mbk-3loj;
	Sun, 18 Jan 2026 03:15:35 +0000
Date: Sun, 18 Jan 2026 11:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 216/218]
 fs/bcachefs/data/ec/create.c:310:1: warning: the frame size of 1296 bytes is
 larger than 1280 bytes
Message-ID: <202601181146.hSLFOcoA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   f6ba99fcb1f50941024f4b6e730fe5f420559da9
commit: bde39b90107558a6e5c84934716bf171ced1cef5 [216/218] bcachefs: Split up data/ec.c
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260118/202601181146.hSLFOcoA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181146.hSLFOcoA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181146.hSLFOcoA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/ec/create.c: In function 'stripe_update_bucket':
>> fs/bcachefs/data/ec/create.c:310:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     310 | }
         | ^


vim +310 fs/bcachefs/data/ec/create.c

   257	
   258	static int stripe_update_bucket(struct btree_trans *trans, struct ec_stripe_new *s, unsigned block)
   259	{
   260		struct bch_fs *c = trans->c;
   261		struct bch_stripe *v = &bkey_i_to_stripe(&s->new_stripe.key)->v;
   262		struct bch_extent_ptr ptr = v->ptrs[block];
   263	
   264		CLASS(bch2_dev_tryget, ca)(c, ptr.dev);
   265		if (!ca) /* BCH_SB_MEMBER_INVALID */
   266			return 0;
   267	
   268		struct bpos bucket_pos = PTR_BUCKET_POS(ca, &ptr);
   269	
   270		struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
   271		wb_maybe_flush_init(&last_flushed);
   272	
   273		struct stripe_update_bucket_stats stats = {};
   274	
   275		CLASS(disk_reservation, res)(c);
   276	
   277		try(for_each_btree_key_max(trans, bp_iter, BTREE_ID_backpointers,
   278				bucket_pos_to_bp_start(ca, bucket_pos),
   279				bucket_pos_to_bp_end(ca, bucket_pos), 0, bp_k, ({
   280			if (bkey_ge(bp_k.k->p, bucket_pos_to_bp(ca, bpos_nosnap_successor(bucket_pos), 0)))
   281				break;
   282	
   283			if (bp_k.k->type != KEY_TYPE_backpointer)
   284				continue;
   285	
   286			struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
   287			if (bp.v->btree_id == BTREE_ID_stripes)
   288				continue;
   289	
   290			wb_maybe_flush_inc(&last_flushed);
   291			stripe_update_extent(trans, s, block, bp, &stats, &res.r, &last_flushed);
   292		})));
   293	
   294		event_inc_trace(c, stripe_update_bucket, buf, ({
   295			prt_printf(&buf, "Updating block %u\n", block);
   296			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(&s->new_stripe.key));
   297			prt_newline(&buf);
   298	
   299			prt_printf(&buf, "bp_to_deleted:\t%u %u\n",
   300				   stats.nr_bp_to_deleted, stats.sectors_bp_to_deleted);
   301			prt_printf(&buf, "no_match:\t%u %u\n",
   302				   stats.nr_no_match, stats.sectors_no_match);
   303			prt_printf(&buf, "cached:\t%u %u\n",
   304				   stats.nr_cached, stats.sectors_cached);
   305			prt_printf(&buf, "done:\t%u %u\n",
   306				   stats.nr_done, stats.sectors_done);
   307		}));
   308	
   309		return 0;
 > 310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
