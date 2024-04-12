Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE3F152180
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712962903; cv=none; b=lvWWb0GIdwPbPvNO4qS2tQwJ8FwLXybnDyE6PUiChB/wik3SZ4d8RhsS5ezNcuk5Grn/oPjARXSUz6dMD7WmmCkLz2rVjmGKP4PcWMnupJdt0Ymq2BydeI9/b1PKS7vGOWXeH+NNx23cQG66GfurZ9dTyLr4pCcQHwwDYhHbekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712962903; c=relaxed/simple;
	bh=6cy8QS7Ao9c0fyc39eq6BZ/Bflwoun0jChuXBYA7sDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zk1x1TxSVoNHtozJlrxOve0DqzI0k+J0tJcm5yRIJFGCrqvTeHZCRLwQRxTKJim6Hqp2kXy2mwZrzcrqHNmFXpAU7AYBUoLJ5LUeOdn16V2lWdJt4RKtQl8qcBvaHQ9WmaDYvPxS/Qu5rFe956hUMD44TPj7ES/lByFgWLUdlXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFI3miME; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFI3miME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712962901; x=1744498901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cy8QS7Ao9c0fyc39eq6BZ/Bflwoun0jChuXBYA7sDo=;
  b=NFI3miMEo6D6vVNMPrJFrOqoH/t8C5pqY/yTFymFU2UwJMo77GfL1Jo4
   uzUy67pTsZx6PDF4CfIDUcduJV3gtNpLtDZMTEWkbi2HyhVKb3BpWZOqR
   wO2RspaV3R6pf1XfYjz9NwzIKEOdHlu4giYeoZx46LVxJkE+x49jU1nMB
   FCststzjaPEreG8w/zurxgDEo3OSjtS8VCC+a+ADBnPXWscc7To4+DwNx
   c8/RfAvul907XDsWb9Atdut9JW4k8zajhVWBvuIh1nhj2Q+RT9Zp7dLr2
   wF5061vDMo5hAfuUXmykwiiem74YQrCIsdXstYzKex+W9dw6sz3oTc38Z
   g==;
X-CSE-ConnectionGUID: eK73HpHpRd6YnkIaLThdZw==
X-CSE-MsgGUID: +SgUcK6yQwu/B8AcLjWr8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8293561"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="8293561"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 16:01:41 -0700
X-CSE-ConnectionGUID: N8WWGzVZSAWYuLq5ct/n8Q==
X-CSE-MsgGUID: 3jERnEnjQb2BFRBDCOMRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="21434231"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 16:01:39 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvPtp-0000vc-0l;
	Fri, 12 Apr 2024 23:01:37 +0000
Date: Sat, 13 Apr 2024 07:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 79/139] fs/bcachefs/btree_io.c:891:34:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 12 has type 'unsigned int'
Message-ID: <202404130747.wH6Dd23p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   dc57bd8774721e6a62bb5dc0b08aff0b4afc0a5b
commit: efa71a63d7d88348ef4dc6421e353f5bb8dd3662 [79/139] bcachefs: Check for packed bkeys that are too big
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240413/202404130747.wH6Dd23p-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130747.wH6Dd23p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130747.wH6Dd23p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_io.c: In function 'validate_bset_keys':
>> fs/bcachefs/btree_io.c:891:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 12 has type 'unsigned int' [-Wformat=]
     891 |                                  "bad k->u64s %u (min %u max %lu)", k->u64s,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_io.c:603:32: note: in definition of macro 'btree_err'
     603 |                                msg, ##__VA_ARGS__);                     \
         |                                ^~~
   fs/bcachefs/btree_io.c:887:21: note: in expansion of macro 'btree_err_on'
     887 |                 if (btree_err_on(!bkeyp_u64s_valid(&b->format, k),
         |                     ^~~~~~~~~~~~
   fs/bcachefs/btree_io.c:891:64: note: format string is defined here
     891 |                                  "bad k->u64s %u (min %u max %lu)", k->u64s,
         |                                                              ~~^
         |                                                                |
         |                                                                long unsigned int
         |                                                              %u


vim +891 fs/bcachefs/btree_io.c

   853	
   854	static int validate_bset_keys(struct bch_fs *c, struct btree *b,
   855				 struct bset *i, int write,
   856				 bool have_retry, bool *saw_error)
   857	{
   858		unsigned version = le16_to_cpu(i->version);
   859		struct bkey_packed *k, *prev = NULL;
   860		struct printbuf buf = PRINTBUF;
   861		bool updated_range = b->key.k.type == KEY_TYPE_btree_ptr_v2 &&
   862			BTREE_PTR_RANGE_UPDATED(&bkey_i_to_btree_ptr_v2(&b->key)->v);
   863		int ret = 0;
   864	
   865		for (k = i->start;
   866		     k != vstruct_last(i);) {
   867			struct bkey_s u;
   868			struct bkey tmp;
   869			unsigned next_good_key;
   870	
   871			if (btree_err_on(bkey_p_next(k) > vstruct_last(i),
   872					 -BCH_ERR_btree_node_read_err_fixable,
   873					 c, NULL, b, i,
   874					 btree_node_bkey_past_bset_end,
   875					 "key extends past end of bset")) {
   876				i->u64s = cpu_to_le16((u64 *) k - i->_data);
   877				break;
   878			}
   879	
   880			if (btree_err_on(k->format > KEY_FORMAT_CURRENT,
   881					 -BCH_ERR_btree_node_read_err_fixable,
   882					 c, NULL, b, i,
   883					 btree_node_bkey_bad_format,
   884					 "invalid bkey format %u", k->format))
   885				goto drop_this_key;
   886	
   887			if (btree_err_on(!bkeyp_u64s_valid(&b->format, k),
   888					 -BCH_ERR_btree_node_read_err_fixable,
   889					 c, NULL, b, i,
   890					 btree_node_bkey_bad_u64s,
 > 891					 "bad k->u64s %u (min %u max %lu)", k->u64s,
   892					 bkeyp_key_u64s(&b->format, k),
   893					 U8_MAX - BKEY_U64s + bkeyp_key_u64s(&b->format, k)))
   894				goto drop_this_key;
   895	
   896			if (!write)
   897				bch2_bkey_compat(b->c.level, b->c.btree_id, version,
   898					    BSET_BIG_ENDIAN(i), write,
   899					    &b->format, k);
   900	
   901			u = __bkey_disassemble(b, k, &tmp);
   902	
   903			printbuf_reset(&buf);
   904			if (bset_key_invalid(c, b, u.s_c, updated_range, write, &buf)) {
   905				printbuf_reset(&buf);
   906				bset_key_invalid(c, b, u.s_c, updated_range, write, &buf);
   907				prt_printf(&buf, "\n  ");
   908				bch2_bkey_val_to_text(&buf, c, u.s_c);
   909	
   910				btree_err(-BCH_ERR_btree_node_read_err_fixable,
   911					  c, NULL, b, i,
   912					  btree_node_bad_bkey,
   913					  "invalid bkey: %s", buf.buf);
   914				goto drop_this_key;
   915			}
   916	
   917			if (write)
   918				bch2_bkey_compat(b->c.level, b->c.btree_id, version,
   919					    BSET_BIG_ENDIAN(i), write,
   920					    &b->format, k);
   921	
   922			if (prev && bkey_iter_cmp(b, prev, k) > 0) {
   923				struct bkey up = bkey_unpack_key(b, prev);
   924	
   925				printbuf_reset(&buf);
   926				prt_printf(&buf, "keys out of order: ");
   927				bch2_bkey_to_text(&buf, &up);
   928				prt_printf(&buf, " > ");
   929				bch2_bkey_to_text(&buf, u.k);
   930	
   931				if (btree_err(-BCH_ERR_btree_node_read_err_fixable,
   932					      c, NULL, b, i,
   933					      btree_node_bkey_out_of_order,
   934					      "%s", buf.buf))
   935					goto drop_this_key;
   936			}
   937	
   938			prev = k;
   939			k = bkey_p_next(k);
   940			continue;
   941	drop_this_key:
   942			next_good_key = k->u64s;
   943	
   944			if (!next_good_key ||
   945			    (BSET_BIG_ENDIAN(i) == CPU_BIG_ENDIAN &&
   946			     version >= bcachefs_metadata_version_snapshot)) {
   947				/*
   948				 * only do scanning if bch2_bkey_compat() has nothing to
   949				 * do
   950				 */
   951	
   952				if (!bkey_packed_valid(c, b, i, (void *) ((u64 *) k + next_good_key))) {
   953					for (next_good_key = 1;
   954					     next_good_key < (u64 *) vstruct_last(i) - (u64 *) k;
   955					     next_good_key++)
   956						if (bkey_packed_valid(c, b, i, (void *) ((u64 *) k + next_good_key)))
   957							goto got_good_key;
   958				}
   959	
   960				/*
   961				 * didn't find a good key, have to truncate the rest of
   962				 * the bset
   963				 */
   964				next_good_key = (u64 *) vstruct_last(i) - (u64 *) k;
   965			}
   966	got_good_key:
   967			le16_add_cpu(&i->u64s, -next_good_key);
   968			memmove_u64s_down(k, bkey_p_next(k), (u64 *) vstruct_end(i) - (u64 *) k);
   969		}
   970	fsck_err:
   971		printbuf_exit(&buf);
   972		return ret;
   973	}
   974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
