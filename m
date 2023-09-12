Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B1361
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 22:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694558587; x=1726094587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xv18AuzCkZkTPUyhxvBCw61QrrwM53+AVVpsMt/v3HE=;
  b=hmZR5+x782K+vb+ynrwyQJCdPj5FXwBeiz9DjVgKotYmUrOdPukJEp+v
   838CnRvdLBgwrBwpMIs8akY1hsrKMJIsIe5h6Xpx81ecqr1CzmZJ3bAwI
   hiVF/L/9IdunwAHGX1vjw+7hEP9Xu2mlHhzO+wMKKrnFN5WK1YaOPniB1
   5Inob9wMKAmo8u913mer/o5e84qLYML5jvLONs7nqfT5nWcwCzaQz53W/
   AoeAWjLSibayD9+g3g+ZpOeGblOAG+GJ3Pm+/bJL/1keEGuo87bFSLKfw
   d/nbxd4v1pxRJcP2j9HotCNVtLh6MTmwMFxKy/7pEOpVp9nTr1Y32jniW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358784396"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="358784396"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 15:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="814007330"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="814007330"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2023 15:43:03 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgC61-0000NL-1Q;
	Tue, 12 Sep 2023 22:43:01 +0000
Date: Wed, 13 Sep 2023 06:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1499/4552] fs/bcachefs/reflink.c:298:1: warning:
 the frame size of 1124 bytes is larger than 1024 bytes
Message-ID: <202309130621.r3QPoRpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: ddcdf61a8ed2c7c2436c4a0351d8526212dcd1b8 [1499/4552] bcachefs: Reflink
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309130621.r3QPoRpz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130621.r3QPoRpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130621.r3QPoRpz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_MAX' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_BITS' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:968:14: warning: 'BCH_MEMBER_REPLACEMENT_OFFSET' defined but not used [-Wunused-const-variable=]
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         |              ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:968:1: note: in expansion of macro 'LE64_BITMASK'
     968 | LE64_BITMASK(BCH_MEMBER_REPLACEMENT,    struct bch_member, flags[0], 10, 14)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_MAX' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_BITS' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:966:14: warning: 'BCH_MEMBER_STATE_OFFSET' defined but not used [-Wunused-const-variable=]
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         |              ^~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:966:1: note: in expansion of macro 'LE64_BITMASK'
     966 | LE64_BITMASK(BCH_MEMBER_STATE,          struct bch_member, flags[0],  0,  4)
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:852:23: warning: 'BKEY_ALLOC_VAL_U64s_MAX' defined but not used [-Wunused-const-variable=]
     852 | static const unsigned BKEY_ALLOC_VAL_U64s_MAX =
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:845:23: warning: 'BCH_ALLOC_FIELD_BYTES' defined but not used [-Wunused-const-variable=]
     845 | static const unsigned BCH_ALLOC_FIELD_BYTES[] = {
         |                       ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_MAX' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_BITS' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:86:25: note: in definition of macro 'LE_BITMASK'
      86 | static const unsigned   name##_BITS = (end - offset);                   \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:770:14: warning: 'INODE_NR_FIELDS_OFFSET' defined but not used [-Wunused-const-variable=]
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         |              ^~~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:85:25: note: in definition of macro 'LE_BITMASK'
      85 | static const unsigned   name##_OFFSET = offset;                         \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:770:1: note: in expansion of macro 'LE32_BITMASK'
     770 | LE32_BITMASK(INODE_NR_FIELDS,   struct bch_inode, bi_flags, 24, 32);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:769:14: warning: 'INODE_STR_HASH_MAX' defined but not used [-Wunused-const-variable=]
     769 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         |              ^~~~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:87:25: note: in definition of macro 'LE_BITMASK'
      87 | static const __u##_bits name##_MAX = (1ULL << (end - offset)) - 1;      \
         |                         ^~~~
   fs/bcachefs/bcachefs_format.h:769:1: note: in expansion of macro 'LE32_BITMASK'
     769 | LE32_BITMASK(INODE_STR_HASH,    struct bch_inode, bi_flags, 20, 24);
         | ^~~~~~~~~~~~
   fs/bcachefs/bcachefs_format.h:449:23: warning: 'bch_crc_bytes' defined but not used [-Wunused-const-variable=]
     449 | static const unsigned bch_crc_bytes[] = {
         |                       ^~~~~~~~~~~~~
   fs/bcachefs/reflink.c: In function 'bch2_remap_range':
>> fs/bcachefs/reflink.c:298:1: warning: the frame size of 1124 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     298 | }
         | ^


vim +298 fs/bcachefs/reflink.c

   162	
   163	s64 bch2_remap_range(struct bch_fs *c,
   164			     struct bch_inode_info *dst_inode,
   165			     struct bpos dst_start, struct bpos src_start,
   166			     u64 remap_sectors, u64 new_i_size)
   167	{
   168		struct btree_trans trans;
   169		struct btree_iter *dst_iter, *src_iter;
   170		struct bkey_s_c src_k;
   171		BKEY_PADDED(k) new_dst, new_src;
   172		struct bpos dst_end = dst_start, src_end = src_start;
   173		struct bpos dst_want, src_want;
   174		u64 src_done, dst_done;
   175		int ret = 0;
   176	
   177		if (!(c->sb.features & (1ULL << BCH_FEATURE_REFLINK))) {
   178			mutex_lock(&c->sb_lock);
   179			if (!(c->sb.features & (1ULL << BCH_FEATURE_REFLINK))) {
   180				c->disk_sb.sb->features[0] |=
   181					cpu_to_le64(1ULL << BCH_FEATURE_REFLINK);
   182	
   183				bch2_write_super(c);
   184			}
   185			mutex_unlock(&c->sb_lock);
   186		}
   187	
   188		dst_end.offset += remap_sectors;
   189		src_end.offset += remap_sectors;
   190	
   191		bch2_trans_init(&trans, c, BTREE_ITER_MAX, 4096);
   192	
   193		src_iter = __bch2_trans_get_iter(&trans, BTREE_ID_EXTENTS, src_start,
   194						 BTREE_ITER_INTENT, 1);
   195		dst_iter = __bch2_trans_get_iter(&trans, BTREE_ID_EXTENTS, dst_start,
   196						 BTREE_ITER_INTENT, 2);
   197	
   198		while (1) {
   199			bch2_trans_begin_updates(&trans);
   200			trans.mem_top = 0;
   201	
   202			if (fatal_signal_pending(current)) {
   203				ret = -EINTR;
   204				goto err;
   205			}
   206	
   207			src_k = get_next_src(src_iter, src_end);
   208			ret = bkey_err(src_k);
   209			if (ret)
   210				goto btree_err;
   211	
   212			src_done = bpos_min(src_iter->pos, src_end).offset -
   213				src_start.offset;
   214			dst_want = POS(dst_start.inode, dst_start.offset + src_done);
   215	
   216			if (bkey_cmp(dst_iter->pos, dst_want) < 0) {
   217				ret = bch2_fpunch_at(&trans, dst_iter, dst_want,
   218						     dst_inode, new_i_size);
   219				if (ret)
   220					goto btree_err;
   221				continue;
   222			}
   223	
   224			BUG_ON(bkey_cmp(dst_iter->pos, dst_want));
   225	
   226			if (!bkey_cmp(dst_iter->pos, dst_end))
   227				break;
   228	
   229			if (src_k.k->type == KEY_TYPE_extent) {
   230				bkey_reassemble(&new_src.k, src_k);
   231				src_k = bkey_i_to_s_c(&new_src.k);
   232	
   233				bch2_cut_front(src_iter->pos,	&new_src.k);
   234				bch2_cut_back(src_end,		&new_src.k.k);
   235	
   236				ret = bch2_make_extent_indirect(&trans, src_iter,
   237							bkey_i_to_extent(&new_src.k));
   238				if (ret)
   239					goto btree_err;
   240	
   241				BUG_ON(src_k.k->type != KEY_TYPE_reflink_p);
   242			}
   243	
   244			if (src_k.k->type == KEY_TYPE_reflink_p) {
   245				struct bkey_s_c_reflink_p src_p =
   246					bkey_s_c_to_reflink_p(src_k);
   247				struct bkey_i_reflink_p *dst_p =
   248					bkey_reflink_p_init(&new_dst.k);
   249	
   250				u64 offset = le64_to_cpu(src_p.v->idx) +
   251					(src_iter->pos.offset -
   252					 bkey_start_offset(src_k.k));
   253	
   254				dst_p->v.idx = cpu_to_le64(offset);
   255			} else {
   256				BUG();
   257			}
   258	
   259			new_dst.k.k.p = dst_iter->pos;
   260			bch2_key_resize(&new_dst.k.k,
   261					min(src_k.k->p.offset - src_iter->pos.offset,
   262					    dst_end.offset - dst_iter->pos.offset));
   263	
   264			ret = bch2_extent_update(&trans, dst_inode, NULL, NULL,
   265						 dst_iter, &new_dst.k,
   266						 new_i_size, false, true, NULL);
   267			if (ret)
   268				goto btree_err;
   269	
   270			dst_done = dst_iter->pos.offset - dst_start.offset;
   271			src_want = POS(src_start.inode, src_start.offset + dst_done);
   272			bch2_btree_iter_set_pos(src_iter, src_want);
   273	btree_err:
   274			if (ret == -EINTR)
   275				ret = 0;
   276			if (ret)
   277				goto err;
   278		}
   279	
   280		BUG_ON(bkey_cmp(dst_iter->pos, dst_end));
   281	err:
   282		BUG_ON(bkey_cmp(dst_iter->pos, dst_end) > 0);
   283	
   284		dst_done = dst_iter->pos.offset - dst_start.offset;
   285		new_i_size = min(dst_iter->pos.offset << 9, new_i_size);
   286	
   287		ret = bch2_trans_exit(&trans) ?: ret;
   288	
   289		mutex_lock(&dst_inode->ei_update_lock);
   290		if (dst_inode->v.i_size < new_i_size) {
   291			i_size_write(&dst_inode->v, new_i_size);
   292			ret = bch2_write_inode_size(c, dst_inode, new_i_size,
   293						    ATTR_MTIME|ATTR_CTIME);
   294		}
   295		mutex_unlock(&dst_inode->ei_update_lock);
   296	
   297		return dst_done ?: ret;
 > 298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
