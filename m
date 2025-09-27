Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C11C84A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758964175; cv=none; b=HXAlkXLcMayrG348KPHgmJesDAQYzNI7SROF37ViiH01pNbh8uk1OMUdFrJCnP4ljttuPmRGwgnwRNPJ+eSpSyM7RjYHKB9hL3dNjUMHKDv36glpBZY/0r97RWyrdPnqRTwJNc3wd26jjcQyQG12LTKWx6LUnfRlj2UVaAN+3Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758964175; c=relaxed/simple;
	bh=AtqmCqcO22RcZ/Y1Q8AbDntnXCB0j3qLb9j0/GItVpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXmoAO1oTG0dBIv3czXvK1feRrhboQBNj6Czm8QvkN7NZkrtRYRsOcRw7oQcdobkaDWd4RqJfuUamlxXU+PC8Nfl3R8WREE5tYcsRCnicVyM3SwJgK/u31qD1TIGECaG3W0sr6RntTXHXSDVFWK5oRY+IAP5kpieG/W5n4acafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFpV/ZXs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFpV/ZXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758964174; x=1790500174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AtqmCqcO22RcZ/Y1Q8AbDntnXCB0j3qLb9j0/GItVpY=;
  b=LFpV/ZXsBszRT7t+BUdnAUF0vADMV7BzTgTJx0A/n2vHEH4rkiydg1+H
   ueH9SDMTr3yYeUVmT4/Ob63qNzAE3ULB0gwIMOnhSSCKOkL9VdlcjQtvm
   LxC5GBcO6G6ifcZm4Fu0eY3wS8bjFOcslsySk+riEAPvNMjEFmB5OuGbC
   MgAmiML2WGL8GzzVTJsCGO/R/AZlXwzAglK9hAgMcn9id+7Kq5h4wqHLk
   /h/iVSUXivWCjJcyOLWKGPF/z4DNyV19UwGz7WAyizrIwQClj9RokeSyG
   YCjP09Lq2nuL1qNTw5abBJc9NDaQYQ2xwoTtofI06MJnJKhqBThK5X+Da
   w==;
X-CSE-ConnectionGUID: OrwbOCQ3TVupywFsANpv9w==
X-CSE-MsgGUID: 2gwZgzi5QDGZJ5338jk1+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="71899152"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="71899152"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 02:09:33 -0700
X-CSE-ConnectionGUID: TBgS0P25TCmKU6vrWjDX5Q==
X-CSE-MsgGUID: SbwkgG4oQBaNaD0501APFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="182100561"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2025 02:09:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Qvp-0006wD-0K;
	Sat, 27 Sep 2025 09:09:29 +0000
Date: Sat, 27 Sep 2025 17:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 456/456]
 fs/bcachefs/move.c:1134:22: warning: unused variable 'end'
Message-ID: <202509271743.2IKoQhBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   2eb95760a329e436d7224064b0ed95731f56ffd4
commit: 3f4c3f5210af2d5f2e472c4e1eb7dda3e1518d4d [456/456] bcachefs: BCH_DATA_OP_(rereplicate|drop_extra_replicas) obsolete XXX
config: x86_64-buildonly-randconfig-001-20250927 (https://download.01.org/0day-ci/archive/20250927/202509271743.2IKoQhBK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271743.2IKoQhBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509271743.2IKoQhBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/move.c: In function 'bch2_data_job':
>> fs/bcachefs/move.c:1134:22: warning: unused variable 'end' [-Wunused-variable]
    1134 |         struct bbpos end        = BBPOS(op->end_btree, op->end_pos);
         |                      ^~~
>> fs/bcachefs/move.c:1133:22: warning: unused variable 'start' [-Wunused-variable]
    1133 |         struct bbpos start      = BBPOS(op->start_btree, op->start_pos);
         |                      ^~~~~
   fs/bcachefs/move.c: At top level:
>> fs/bcachefs/move.c:1067:13: warning: 'drop_extra_replicas_pred' defined but not used [-Wunused-function]
    1067 | static bool drop_extra_replicas_pred(struct bch_fs *c, void *arg,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/move.c:962:13: warning: 'rereplicate_pred' defined but not used [-Wunused-function]
     962 | static bool rereplicate_pred(struct bch_fs *c, void *arg,
         |             ^~~~~~~~~~~~~~~~
>> fs/bcachefs/move.c:598:12: warning: 'bch2_move_data' defined but not used [-Wunused-function]
     598 | static int bch2_move_data(struct bch_fs *c,
         |            ^~~~~~~~~~~~~~


vim +/end +1134 fs/bcachefs/move.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16   961  
7f5c5d20f01483 Kent Overstreet 2022-06-13  @962  static bool rereplicate_pred(struct bch_fs *c, void *arg,
7a274285d37066 Kent Overstreet 2025-04-03   963  			     enum btree_id btree, struct bkey_s_c k,
d39d0be6570d60 Kent Overstreet 2025-08-23   964  			     struct bch_inode_opts *io_opts,
7f5c5d20f01483 Kent Overstreet 2022-06-13   965  			     struct data_update_opts *data_opts)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   966  {
26609b619fa230 Kent Overstreet 2018-11-01   967  	unsigned nr_good = bch2_bkey_durability(c, k);
e8bde78a178798 Kent Overstreet 2021-10-12   968  	unsigned replicas = bkey_is_btree_ptr(k.k)
e8bde78a178798 Kent Overstreet 2021-10-12   969  		? c->opts.metadata_replicas
e8bde78a178798 Kent Overstreet 2021-10-12   970  		: io_opts->data_replicas;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   971  
18dad454cd16cb Kent Overstreet 2025-05-24   972  	guard(rcu)();
fdccb24352e589 Kent Overstreet 2024-06-02   973  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
fdccb24352e589 Kent Overstreet 2024-06-02   974  	unsigned i = 0;
fdccb24352e589 Kent Overstreet 2024-06-02   975  	bkey_for_each_ptr(ptrs, ptr) {
fdccb24352e589 Kent Overstreet 2024-06-02   976  		struct bch_dev *ca = bch2_dev_rcu(c, ptr->dev);
fdccb24352e589 Kent Overstreet 2024-06-02   977  		if (!ptr->cached &&
fdccb24352e589 Kent Overstreet 2024-06-02   978  		    (!ca || !ca->mi.durability))
fdccb24352e589 Kent Overstreet 2024-06-02   979  			data_opts->kill_ptrs |= BIT(i);
fdccb24352e589 Kent Overstreet 2024-06-02   980  		i++;
fdccb24352e589 Kent Overstreet 2024-06-02   981  	}
fdccb24352e589 Kent Overstreet 2024-06-02   982  
fdccb24352e589 Kent Overstreet 2024-06-02   983  	if (!data_opts->kill_ptrs &&
fdccb24352e589 Kent Overstreet 2024-06-02   984  	    (!nr_good || nr_good >= replicas))
7f5c5d20f01483 Kent Overstreet 2022-06-13   985  		return false;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   986  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   987  	data_opts->target		= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13   988  	data_opts->extra_replicas	= replicas - nr_good;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   989  	data_opts->btree_insert_flags	= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13   990  	return true;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   991  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16   992  
7f5c5d20f01483 Kent Overstreet 2022-06-13   993  static bool migrate_pred(struct bch_fs *c, void *arg,
7a274285d37066 Kent Overstreet 2025-04-03   994  			 enum btree_id btree, struct bkey_s_c k,
d39d0be6570d60 Kent Overstreet 2025-08-23   995  			 struct bch_inode_opts *io_opts,
7f5c5d20f01483 Kent Overstreet 2022-06-13   996  			 struct data_update_opts *data_opts)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   997  {
7f5c5d20f01483 Kent Overstreet 2022-06-13   998  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   999  	struct bch_ioctl_data *op = arg;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1000  	unsigned i = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1001  
7f5c5d20f01483 Kent Overstreet 2022-06-13  1002  	data_opts->rewrite_ptrs		= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1003  	data_opts->target		= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1004  	data_opts->extra_replicas	= 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1005  	data_opts->btree_insert_flags	= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1006  
7f5c5d20f01483 Kent Overstreet 2022-06-13  1007  	bkey_for_each_ptr(ptrs, ptr) {
7f5c5d20f01483 Kent Overstreet 2022-06-13  1008  		if (ptr->dev == op->migrate.dev)
7f5c5d20f01483 Kent Overstreet 2022-06-13  1009  			data_opts->rewrite_ptrs |= 1U << i;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1010  		i++;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1011  	}
7f5c5d20f01483 Kent Overstreet 2022-06-13  1012  
3e3e02e6bce627 Kent Overstreet 2022-10-19  1013  	return data_opts->rewrite_ptrs != 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1014  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1015  
0ec5b3b7ccfcdc Kent Overstreet 2024-05-05  1016  /*
0ec5b3b7ccfcdc Kent Overstreet 2024-05-05  1017   * Ancient versions of bcachefs produced packed formats which could represent
0ec5b3b7ccfcdc Kent Overstreet 2024-05-05  1018   * keys that the in memory format cannot represent; this checks for those
0ec5b3b7ccfcdc Kent Overstreet 2024-05-05  1019   * formats so we can get rid of them.
0ec5b3b7ccfcdc Kent Overstreet 2024-05-05  1020   */
e01dacf76c0c6a Kent Overstreet 2021-03-20  1021  static bool bformat_needs_redo(struct bkey_format *f)
e01dacf76c0c6a Kent Overstreet 2021-03-20  1022  {
61692c7812ab2a Kent Overstreet 2024-05-08  1023  	for (unsigned i = 0; i < f->nr_fields; i++)
61692c7812ab2a Kent Overstreet 2024-05-08  1024  		if (bch2_bkey_format_field_overflows(f, i))
e01dacf76c0c6a Kent Overstreet 2021-03-20  1025  			return true;
e01dacf76c0c6a Kent Overstreet 2021-03-20  1026  
e01dacf76c0c6a Kent Overstreet 2021-03-20  1027  	return false;
e01dacf76c0c6a Kent Overstreet 2021-03-20  1028  }
e01dacf76c0c6a Kent Overstreet 2021-03-20  1029  
7f5c5d20f01483 Kent Overstreet 2022-06-13  1030  static bool rewrite_old_nodes_pred(struct bch_fs *c, void *arg,
1889ad5a1285ba Kent Overstreet 2021-03-14  1031  				   struct btree *b,
d39d0be6570d60 Kent Overstreet 2025-08-23  1032  				   struct bch_inode_opts *io_opts,
7f5c5d20f01483 Kent Overstreet 2022-06-13  1033  				   struct data_update_opts *data_opts)
1889ad5a1285ba Kent Overstreet 2021-03-14  1034  {
1889ad5a1285ba Kent Overstreet 2021-03-14  1035  	if (b->version_ondisk != c->sb.version ||
e01dacf76c0c6a Kent Overstreet 2021-03-20  1036  	    btree_node_need_rewrite(b) ||
e01dacf76c0c6a Kent Overstreet 2021-03-20  1037  	    bformat_needs_redo(&b->format)) {
1889ad5a1285ba Kent Overstreet 2021-03-14  1038  		data_opts->target		= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1039  		data_opts->extra_replicas	= 0;
1889ad5a1285ba Kent Overstreet 2021-03-14  1040  		data_opts->btree_insert_flags	= 0;
7f5c5d20f01483 Kent Overstreet 2022-06-13  1041  		return true;
1889ad5a1285ba Kent Overstreet 2021-03-14  1042  	}
1889ad5a1285ba Kent Overstreet 2021-03-14  1043  
7f5c5d20f01483 Kent Overstreet 2022-06-13  1044  	return false;
1889ad5a1285ba Kent Overstreet 2021-03-14  1045  }
1889ad5a1285ba Kent Overstreet 2021-03-14  1046  
a4805d6672aac0 Kent Overstreet 2021-03-22  1047  int bch2_scan_old_btree_nodes(struct bch_fs *c, struct bch_move_stats *stats)
a4805d6672aac0 Kent Overstreet 2021-03-22  1048  {
a4805d6672aac0 Kent Overstreet 2021-03-22  1049  	int ret;
a4805d6672aac0 Kent Overstreet 2021-03-22  1050  
a4805d6672aac0 Kent Overstreet 2021-03-22  1051  	ret = bch2_move_btree(c,
3c843a67595187 Kent Overstreet 2023-11-20  1052  			      BBPOS_MIN,
3c843a67595187 Kent Overstreet 2023-11-20  1053  			      BBPOS_MAX,
a4805d6672aac0 Kent Overstreet 2021-03-22  1054  			      rewrite_old_nodes_pred, c, stats);
a4805d6672aac0 Kent Overstreet 2021-03-22  1055  	if (!ret) {
21f4d575e0fecd Kent Overstreet 2025-07-14  1056  		guard(mutex)(&c->sb_lock);
c0ebe3e48c75ab Kent Overstreet 2021-05-23  1057  		c->disk_sb.sb->compat[0] |= cpu_to_le64(1ULL << BCH_COMPAT_extents_above_btree_updates_done);
c0ebe3e48c75ab Kent Overstreet 2021-05-23  1058  		c->disk_sb.sb->compat[0] |= cpu_to_le64(1ULL << BCH_COMPAT_bformat_overflow_done);
a4805d6672aac0 Kent Overstreet 2021-03-22  1059  		c->disk_sb.sb->version_min = c->disk_sb.sb->version;
a4805d6672aac0 Kent Overstreet 2021-03-22  1060  		bch2_write_super(c);
a4805d6672aac0 Kent Overstreet 2021-03-22  1061  	}
a4805d6672aac0 Kent Overstreet 2021-03-22  1062  
1bb3c2a9747c40 Kent Overstreet 2023-06-20  1063  	bch_err_fn(c, ret);
a4805d6672aac0 Kent Overstreet 2021-03-22  1064  	return ret;
a4805d6672aac0 Kent Overstreet 2021-03-22  1065  }
a4805d6672aac0 Kent Overstreet 2021-03-22  1066  
ba11c7d67a53b8 Kent Overstreet 2023-11-20 @1067  static bool drop_extra_replicas_pred(struct bch_fs *c, void *arg,
7a274285d37066 Kent Overstreet 2025-04-03  1068  			     enum btree_id btree, struct bkey_s_c k,
d39d0be6570d60 Kent Overstreet 2025-08-23  1069  			     struct bch_inode_opts *io_opts,
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1070  			     struct data_update_opts *data_opts)
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1071  {
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1072  	unsigned durability = bch2_bkey_durability(c, k);
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1073  	unsigned replicas = bkey_is_btree_ptr(k.k)
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1074  		? c->opts.metadata_replicas
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1075  		: io_opts->data_replicas;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1076  	const union bch_extent_entry *entry;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1077  	struct extent_ptr_decoded p;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1078  	unsigned i = 0;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1079  
18dad454cd16cb Kent Overstreet 2025-05-24  1080  	guard(rcu)();
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1081  	bkey_for_each_ptr_decode(k.k, bch2_bkey_ptrs_c(k), p, entry) {
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1082  		unsigned d = bch2_extent_ptr_durability(c, &p);
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1083  
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1084  		if (d && durability - d >= replicas) {
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1085  			data_opts->kill_ptrs |= BIT(i);
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1086  			durability -= d;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1087  		}
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1088  
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1089  		i++;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1090  	}
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1091  
63dfcfdf53de80 Kent Overstreet 2025-08-03  1092  	i = 0;
63dfcfdf53de80 Kent Overstreet 2025-08-03  1093  	bkey_for_each_ptr_decode(k.k, bch2_bkey_ptrs_c(k), p, entry) {
63dfcfdf53de80 Kent Overstreet 2025-08-03  1094  		if (p.has_ec && durability - p.ec.redundancy >= replicas) {
63dfcfdf53de80 Kent Overstreet 2025-08-03  1095  			data_opts->kill_ec_ptrs |= BIT(i);
63dfcfdf53de80 Kent Overstreet 2025-08-03  1096  			durability -= p.ec.redundancy;
63dfcfdf53de80 Kent Overstreet 2025-08-03  1097  		}
63dfcfdf53de80 Kent Overstreet 2025-08-03  1098  
63dfcfdf53de80 Kent Overstreet 2025-08-03  1099  		i++;
63dfcfdf53de80 Kent Overstreet 2025-08-03  1100  	}
63dfcfdf53de80 Kent Overstreet 2025-08-03  1101  
63dfcfdf53de80 Kent Overstreet 2025-08-03  1102  	return (data_opts->kill_ptrs|data_opts->kill_ec_ptrs) != 0;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1103  }
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1104  
f269ae55d2de9c Kent Overstreet 2024-12-28  1105  static bool scrub_pred(struct bch_fs *c, void *_arg,
7a274285d37066 Kent Overstreet 2025-04-03  1106  		       enum btree_id btree, struct bkey_s_c k,
d39d0be6570d60 Kent Overstreet 2025-08-23  1107  		       struct bch_inode_opts *io_opts,
f269ae55d2de9c Kent Overstreet 2024-12-28  1108  		       struct data_update_opts *data_opts)
f269ae55d2de9c Kent Overstreet 2024-12-28  1109  {
f269ae55d2de9c Kent Overstreet 2024-12-28  1110  	struct bch_ioctl_data *arg = _arg;
f269ae55d2de9c Kent Overstreet 2024-12-28  1111  
f269ae55d2de9c Kent Overstreet 2024-12-28  1112  	if (k.k->type != KEY_TYPE_btree_ptr_v2) {
f269ae55d2de9c Kent Overstreet 2024-12-28  1113  		struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
f269ae55d2de9c Kent Overstreet 2024-12-28  1114  		const union bch_extent_entry *entry;
f269ae55d2de9c Kent Overstreet 2024-12-28  1115  		struct extent_ptr_decoded p;
f269ae55d2de9c Kent Overstreet 2024-12-28  1116  		bkey_for_each_ptr_decode(k.k, ptrs, p, entry)
f269ae55d2de9c Kent Overstreet 2024-12-28  1117  			if (p.ptr.dev == arg->migrate.dev) {
f269ae55d2de9c Kent Overstreet 2024-12-28  1118  				if (!p.crc.csum_type)
f269ae55d2de9c Kent Overstreet 2024-12-28  1119  					return false;
f269ae55d2de9c Kent Overstreet 2024-12-28  1120  				break;
f269ae55d2de9c Kent Overstreet 2024-12-28  1121  			}
f269ae55d2de9c Kent Overstreet 2024-12-28  1122  	}
f269ae55d2de9c Kent Overstreet 2024-12-28  1123  
f269ae55d2de9c Kent Overstreet 2024-12-28  1124  	data_opts->scrub	= true;
f269ae55d2de9c Kent Overstreet 2024-12-28  1125  	data_opts->read_dev	= arg->migrate.dev;
f269ae55d2de9c Kent Overstreet 2024-12-28  1126  	return true;
f269ae55d2de9c Kent Overstreet 2024-12-28  1127  }
f269ae55d2de9c Kent Overstreet 2024-12-28  1128  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1129  int bch2_data_job(struct bch_fs *c,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1130  		  struct bch_move_stats *stats,
49ef02e926af75 Kent Overstreet 2025-07-15  1131  		  struct bch_ioctl_data *op)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1132  {
49ef02e926af75 Kent Overstreet 2025-07-15 @1133  	struct bbpos start	= BBPOS(op->start_btree, op->start_pos);
49ef02e926af75 Kent Overstreet 2025-07-15 @1134  	struct bbpos end	= BBPOS(op->end_btree, op->end_pos);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1135  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1136  
49ef02e926af75 Kent Overstreet 2025-07-15  1137  	if (op->op >= BCH_DATA_OP_NR)
01e9564540d7e2 Kent Overstreet 2023-11-20  1138  		return -EINVAL;
01e9564540d7e2 Kent Overstreet 2023-11-20  1139  
49ef02e926af75 Kent Overstreet 2025-07-15  1140  	bch2_move_stats_init(stats, bch2_data_ops_strs[op->op]);
01e9564540d7e2 Kent Overstreet 2023-11-20  1141  
49ef02e926af75 Kent Overstreet 2025-07-15  1142  	switch (op->op) {
f269ae55d2de9c Kent Overstreet 2024-12-28  1143  	case BCH_DATA_OP_scrub:
f269ae55d2de9c Kent Overstreet 2024-12-28  1144  		/*
f269ae55d2de9c Kent Overstreet 2024-12-28  1145  		 * prevent tests from spuriously failing, make sure we see all
f269ae55d2de9c Kent Overstreet 2024-12-28  1146  		 * btree nodes that need to be repaired
f269ae55d2de9c Kent Overstreet 2024-12-28  1147  		 */
f269ae55d2de9c Kent Overstreet 2024-12-28  1148  		bch2_btree_interior_updates_flush(c);
f269ae55d2de9c Kent Overstreet 2024-12-28  1149  
49ef02e926af75 Kent Overstreet 2025-07-15  1150  		ret = bch2_move_data_phys(c, op->scrub.dev, 0, U64_MAX,
49ef02e926af75 Kent Overstreet 2025-07-15  1151  					  op->scrub.data_types,
f269ae55d2de9c Kent Overstreet 2024-12-28  1152  					  NULL,
f269ae55d2de9c Kent Overstreet 2024-12-28  1153  					  stats,
f269ae55d2de9c Kent Overstreet 2024-12-28  1154  					  writepoint_hashed((unsigned long) current),
f269ae55d2de9c Kent Overstreet 2024-12-28  1155  					  false,
49ef02e926af75 Kent Overstreet 2025-07-15  1156  					  scrub_pred, op) ?: ret;
f269ae55d2de9c Kent Overstreet 2024-12-28  1157  		break;
f269ae55d2de9c Kent Overstreet 2024-12-28  1158  
01e9564540d7e2 Kent Overstreet 2023-11-20  1159  	case BCH_DATA_OP_rereplicate:
89fd25be70b4e3 Kent Overstreet 2020-07-09  1160  		stats->data_type = BCH_DATA_journal;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1161  		ret = bch2_journal_flush_device_pins(&c->journal, -1);
f36b381b6ad2ff Kent Overstreet 2025-07-17  1162  		bch2_btree_interior_updates_flush(c);
3f4c3f5210af2d Kent Overstreet 2025-09-27  1163  		/* XXX: how do we make this happen automatically? */
ae0ff7b8b0ccf0 Kent Overstreet 2019-04-30  1164  		ret = bch2_replicas_gc2(c) ?: ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1165  		break;
01e9564540d7e2 Kent Overstreet 2023-11-20  1166  	case BCH_DATA_OP_migrate:
49ef02e926af75 Kent Overstreet 2025-07-15  1167  		if (op->migrate.dev >= c->sb.nr_devices)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1168  			return -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1169  
89fd25be70b4e3 Kent Overstreet 2020-07-09  1170  		stats->data_type = BCH_DATA_journal;
49ef02e926af75 Kent Overstreet 2025-07-15  1171  		ret = bch2_journal_flush_device_pins(&c->journal, op->migrate.dev);
49ef02e926af75 Kent Overstreet 2025-07-15  1172  		ret = bch2_move_data_phys(c, op->migrate.dev, 0, U64_MAX,
e63cf203d78190 Kent Overstreet 2025-01-23  1173  					  ~0,
0337cc7eeed19e Kent Overstreet 2022-06-20  1174  					  NULL,
0337cc7eeed19e Kent Overstreet 2022-06-20  1175  					  stats,
0337cc7eeed19e Kent Overstreet 2022-06-20  1176  					  writepoint_hashed((unsigned long) current),
0337cc7eeed19e Kent Overstreet 2022-06-20  1177  					  true,
49ef02e926af75 Kent Overstreet 2025-07-15  1178  					  migrate_pred, op) ?: ret;
e63cf203d78190 Kent Overstreet 2025-01-23  1179  		bch2_btree_interior_updates_flush(c);
ae0ff7b8b0ccf0 Kent Overstreet 2019-04-30  1180  		ret = bch2_replicas_gc2(c) ?: ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1181  		break;
01e9564540d7e2 Kent Overstreet 2023-11-20  1182  	case BCH_DATA_OP_rewrite_old_nodes:
a4805d6672aac0 Kent Overstreet 2021-03-22  1183  		ret = bch2_scan_old_btree_nodes(c, stats);
1889ad5a1285ba Kent Overstreet 2021-03-14  1184  		break;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1185  	case BCH_DATA_OP_drop_extra_replicas:
3f4c3f5210af2d Kent Overstreet 2025-09-27  1186  		/* XXX: how do we make this happen automatically? */
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1187  		ret = bch2_replicas_gc2(c) ?: ret;
ba11c7d67a53b8 Kent Overstreet 2023-11-20  1188  		break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1189  	default:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1190  		ret = -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1191  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1192  
01e9564540d7e2 Kent Overstreet 2023-11-20  1193  	bch2_move_stats_exit(stats, c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1194  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1195  }
b9fa375bab2786 Kent Overstreet 2023-03-11  1196  

:::::: The code at line 1134 was first introduced by commit
:::::: 49ef02e926af75a2e92fdd04758532656bf4203f bcachefs: don't pass bch_ioctl_data by value

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
