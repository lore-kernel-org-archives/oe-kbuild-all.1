Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1162C3268
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368521; cv=none; b=enEpUELwoDWOxBjNfveGwj3WFzP/qO0HoOoip8vTSDTUkZH+QnvSmmnXK4/0RDW5lQorbx+aVwfxq6KOme3tv5fFigSQLWCCGaphiYOuV7Zuzj/eekZsSEAgEM7914wgSpq4QwuWdQPI84Cx5GCXDT8EM/KFFbwqEa7YtrNSrVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368521; c=relaxed/simple;
	bh=J1nMr3lCgFX9MaxJFnjsls8TGKr59pe+hYrZmOsfd4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LuSta3Dy2bDhL+9ga5zsUSmq4QD+I943ZPMSEp8KDActoNM0dkUbUoKnEhq4t9pCMVfE7KPA4/9W9KbFtjC5tk2in43JYrNkfVlZi6otMCyAlfB/M7MPdhRcpMrm0QP0CbcmUTBtCXZXdQIZ+q/vjGpqm5WHDnDESQ8nW8dUO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4l1MbB1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4l1MbB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774368516; x=1805904516;
  h=date:from:to:cc:subject:message-id;
  bh=J1nMr3lCgFX9MaxJFnjsls8TGKr59pe+hYrZmOsfd4o=;
  b=V4l1MbB1DNyQeOtHcCi4i9vv6aQRwSH5icbKI1gLjj1N1OJ59g8wFT+k
   vA1x3F1m0m2F2YB2+5xWxAnveY2PdN3t7eeDkV1GOgoRYkDP2A+mTD55K
   jqFbv/2eZH08o02LFM9ZKdIi7mAZmLKub9S/AvHqsdL4mxQws0S2HyIdM
   hO/O/AHStdEUpvPchxVOBlic5EPoz/8hpUWIuGNIHp8Eju4NiACCDbSZx
   Es2AtmaxJBKlsqXmSNu4XQ8QcZdDYtwU8ka9FjWMniqt3Wdf9Ys6Gi0nP
   2G2zDNli37Lycuz89FaOS934r7/PTrat3+oXaAN/htekQWdWQE5vDo5Y0
   Q==;
X-CSE-ConnectionGUID: yhvmw1yhRHiz41O1YZTtxg==
X-CSE-MsgGUID: Hs/ukLUTRAiSd3YjQxxGEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75461400"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75461400"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:08:35 -0700
X-CSE-ConnectionGUID: lelyc+9hSnqYa+KNQXwfIw==
X-CSE-MsgGUID: EZkdFctkQTKObBWgtNRD1w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2026 09:08:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w54Ix-000000004rx-0Zsx;
	Tue, 24 Mar 2026 16:08:31 +0000
Date: Wed, 25 Mar 2026 00:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Harmstone <mark@harmstone.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 102/115]
 fs/btrfs/tree-checker.c:812: undefined reference to `__udivdi3'
Message-ID: <202603242357.yxVc4lPB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   5c167fff9f9032fd34942c568393933236467af6
commit: 29416ccaeb36941aa65b571a09cea90bcca8213e [102/115] btrfs: add remap-tree checks to check_block_group_item()
config: powerpc-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242357.yxVc4lPB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242357.yxVc4lPB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242357.yxVc4lPB-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/btrfs/tree-checker.o: in function `check_block_group_item':
>> fs/btrfs/tree-checker.c:812: undefined reference to `__udivdi3'


vim +812 fs/btrfs/tree-checker.c

   681	
   682	static int check_block_group_item(struct extent_buffer *leaf,
   683					  struct btrfs_key *key, int slot)
   684	{
   685		struct btrfs_fs_info *fs_info = leaf->fs_info;
   686		struct btrfs_block_group_item bgi;
   687		u32 item_size = btrfs_item_size(leaf, slot);
   688		u64 chunk_objectid;
   689		u64 flags;
   690		u64 type;
   691		size_t exp_size;
   692	
   693		/*
   694		 * Here we don't really care about alignment since extent allocator can
   695		 * handle it.  We care more about the size.
   696		 */
   697		if (unlikely(key->offset == 0)) {
   698			block_group_err(leaf, slot,
   699					"invalid block group size 0");
   700			return -EUCLEAN;
   701		}
   702	
   703		if (btrfs_fs_incompat(fs_info, REMAP_TREE))
   704			exp_size = sizeof(struct btrfs_block_group_item_v2);
   705		else
   706			exp_size = sizeof(struct btrfs_block_group_item);
   707	
   708		if (unlikely(item_size != exp_size)) {
   709			block_group_err(leaf, slot,
   710				"invalid item size, have %u expect %zu",
   711					item_size, exp_size);
   712			return -EUCLEAN;
   713		}
   714	
   715		read_extent_buffer(leaf, &bgi, btrfs_item_ptr_offset(leaf, slot),
   716				   sizeof(bgi));
   717		chunk_objectid = btrfs_stack_block_group_chunk_objectid(&bgi);
   718		if (btrfs_fs_incompat(fs_info, EXTENT_TREE_V2)) {
   719			/*
   720			 * We don't init the nr_global_roots until we load the global
   721			 * roots, so this could be 0 at mount time.  If it's 0 we'll
   722			 * just assume we're fine, and later we'll check against our
   723			 * actual value.
   724			 */
   725			if (unlikely(fs_info->nr_global_roots &&
   726				     chunk_objectid >= fs_info->nr_global_roots)) {
   727				block_group_err(leaf, slot,
   728		"invalid block group global root id, have %llu, needs to be <= %llu",
   729						chunk_objectid,
   730						fs_info->nr_global_roots);
   731				return -EUCLEAN;
   732			}
   733		} else if (unlikely(chunk_objectid != BTRFS_FIRST_CHUNK_TREE_OBJECTID)) {
   734			block_group_err(leaf, slot,
   735			"invalid block group chunk objectid, have %llu expect %llu",
   736					btrfs_stack_block_group_chunk_objectid(&bgi),
   737					BTRFS_FIRST_CHUNK_TREE_OBJECTID);
   738			return -EUCLEAN;
   739		}
   740	
   741		if (unlikely(btrfs_stack_block_group_used(&bgi) > key->offset)) {
   742			block_group_err(leaf, slot,
   743				"invalid block group used, have %llu expect [0, %llu)",
   744					btrfs_stack_block_group_used(&bgi), key->offset);
   745			return -EUCLEAN;
   746		}
   747	
   748		flags = btrfs_stack_block_group_flags(&bgi);
   749		if (unlikely(hweight64(flags & BTRFS_BLOCK_GROUP_PROFILE_MASK) > 1)) {
   750			block_group_err(leaf, slot,
   751	"invalid profile flags, have 0x%llx (%lu bits set) expect no more than 1 bit set",
   752				flags & BTRFS_BLOCK_GROUP_PROFILE_MASK,
   753				hweight64(flags & BTRFS_BLOCK_GROUP_PROFILE_MASK));
   754			return -EUCLEAN;
   755		}
   756	
   757		if (unlikely(flags & BTRFS_BLOCK_GROUP_METADATA_REMAP &&
   758			     !btrfs_fs_incompat(fs_info, REMAP_TREE))) {
   759			block_group_err(leaf, slot,
   760	"invalid flags, have 0x%llx (METADATA_REMAP flag set) but no remap-tree incompat flag",
   761					flags);
   762			return -EUCLEAN;
   763		}
   764	
   765		type = flags & BTRFS_BLOCK_GROUP_TYPE_MASK;
   766		if (unlikely(type != BTRFS_BLOCK_GROUP_DATA &&
   767			     type != BTRFS_BLOCK_GROUP_METADATA &&
   768			     type != BTRFS_BLOCK_GROUP_SYSTEM &&
   769			     type != BTRFS_BLOCK_GROUP_METADATA_REMAP &&
   770			     type != (BTRFS_BLOCK_GROUP_METADATA |
   771				      BTRFS_BLOCK_GROUP_DATA))) {
   772			block_group_err(leaf, slot,
   773	"invalid type, have 0x%llx (%lu bits set) expect either 0x%llx, 0x%llx, 0x%llx, 0x%llx or 0x%llx",
   774				type, hweight64(type),
   775				BTRFS_BLOCK_GROUP_DATA, BTRFS_BLOCK_GROUP_METADATA,
   776				BTRFS_BLOCK_GROUP_SYSTEM, BTRFS_BLOCK_GROUP_METADATA_REMAP,
   777				BTRFS_BLOCK_GROUP_METADATA | BTRFS_BLOCK_GROUP_DATA);
   778			return -EUCLEAN;
   779		}
   780	
   781		if (unlikely(!btrfs_fs_incompat(fs_info, REMAP_TREE) &&
   782			     type == BTRFS_BLOCK_GROUP_METADATA_REMAP)) {
   783			block_group_err(leaf, slot,
   784	"invalid type, METADATA_REMAP set but REMAP_TREE incompat flag not set");
   785			return -EUCLEAN;
   786		}
   787	
   788		if (unlikely(!btrfs_fs_incompat(fs_info, REMAP_TREE) &&
   789			     flags & BTRFS_BLOCK_GROUP_REMAPPED)) {
   790			block_group_err(leaf, slot,
   791	"invalid flags, REMAPPED set but REMAP_TREE incompat flag not set");
   792			return -EUCLEAN;
   793		}
   794	
   795		if (item_size == sizeof(struct btrfs_block_group_item_v2)) {
   796			struct btrfs_block_group_item_v2 *bgi2;
   797			u64 remap_bytes;
   798			u32 identity_remap_count;
   799	
   800			bgi2 = btrfs_item_ptr(leaf, slot, struct btrfs_block_group_item_v2);
   801	
   802			remap_bytes = btrfs_block_group_v2_remap_bytes(leaf, bgi2);
   803	
   804			if (unlikely(remap_bytes > key->offset)) {
   805				block_group_err(leaf, slot,
   806					"invalid remap_bytes, have %llu expect [0, %llu]",
   807						remap_bytes, key->offset);
   808				return -EUCLEAN;
   809			}
   810	
   811			identity_remap_count = btrfs_block_group_v2_identity_remap_count(leaf, bgi2);
 > 812			if (unlikely((u64)identity_remap_count >
   813				     key->offset / fs_info->sectorsize)) {
   814				block_group_err(leaf, slot,
   815					"invalid identity_remap_count, have %u expect [0, %llu]",
   816						identity_remap_count,
   817						key->offset / fs_info->sectorsize);
   818				return -EUCLEAN;
   819			}
   820		}
   821	
   822		return 0;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
