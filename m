Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B955622
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680684134; x=1712220134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yhhWzBJfaph7HkXBMDntsas82xoO5YD1P6rZ84JH3s=;
  b=P91u6Yvaa3zUH5Tx1jdJ1HXZ5zw13F80t2CCv+tEorQZPykdibZHqjkW
   BI9kUeHQawuNu7AGA2aw0jHP3UoP4S1EpFFQTYjMMQx6CHxI5UPxFqncO
   Z9lFE41nw32o33oNVCzC4C+zYsysZ8S/xM3TeG12kTEWMZ0XbmKg8LHlR
   P8cj1UmK5gfTXoUMXDVvMgCsySQ5ALUoK2rZYC5Xkb/ppeMaQEy0pS8BO
   f2xLwP/1oS453DW58etX6B/KAL2A/O2xtexxP3t1voKkb75OkznKmq/s2
   SdzLyOlOyG/MSqXEtvUg6b7i09ZZ+9dmx6rrpy/ivdvbPzdGNhKBW+iyI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="342419480"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="342419480"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716957251"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="716957251"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 01:42:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjyiU-000QQY-1F;
	Wed, 05 Apr 2023 08:42:06 +0000
Date: Wed, 5 Apr 2023 16:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 8/8] fs/btrfs/btrfs.o: warning: objtool:
 btrfs_unfreeze+0x3e8: btrfs_assertfail() is missing a __noreturn annotation
Message-ID: <202304051607.xR72bEfi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   261316083661e4879d4db1cc7d34efb3f3dfcbbf
commit: 261316083661e4879d4db1cc7d34efb3f3dfcbbf [8/8] objtool: Detect missing __noreturn annotations
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051607.xR72bEfi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=261316083661e4879d4db1cc7d34efb3f3dfcbbf
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout 261316083661e4879d4db1cc7d34efb3f3dfcbbf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051607.xR72bEfi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x3e8: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_calc_avail_data_space+0x549: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: finish_need_commit_sem_search+0x237: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_search_slot_get_root+0x566: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: split_node+0xd26: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: balance_level+0x11f8: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: search_leaf+0x5e8: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_search_slot+0xffa: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_search_old_slot+0x5eb: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_search_forward+0x809: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_next_old_leaf+0x6b0: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_find_item+0x382: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: alloc_reserved_extent+0x14f: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: do_allocation_zoned.constprop.0+0x5a4: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_get_extent_inline_ref_type+0x1d8: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: update_inline_extent_backref+0x2b3: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: extent_data_ref_count+0x265: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: __btrfs_free_extent+0xa20: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_discard_extent+0x43b: btrfs_assertfail() is missing a __noreturn annotation
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_inc_extent_ref+0xa5: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_run_delayed_refs_for_head+0x551: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: do_walk_down+0x81c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: insert_with_overflow+0x274: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: csum_size_to_bytes+0xb5: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: search_csum_tree+0x493: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_inode_set_file_extent_range+0x191: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_inode_clear_file_extent_range+0x1ac: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_bio_sums+0x7fe: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_csums_list+0x8e2: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_csums_bitmap+0x73c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_csum_one_bio+0xc62: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_del_csums+0x715: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_file_extent_end+0x1fb: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_truncate_inode_items+0xdfe: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_cleanup_bg_io+0x116: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_global_root_id.part.0+0x7c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: csum_one_extent_buffer+0x467: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: validate_extent_buffer+0x8c3: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: validate_subpage_buffer+0x25c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_extent_buffer+0x2f9: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_validate_metadata_buffer+0x24d: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: read_tree_block+0x11e: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_global_root_insert+0x1ab: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: backup_super_roots+0x195a: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_block_group_root+0x24e: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_dev_one_super+0x206: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_and_free_fs_root+0x1a3: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_fs_root_commit_root+0x2c3: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_mark_buffer_dirty+0x2b5: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_cleanup_one_transaction+0x599: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: warn_about_uncommitted_trans+0x56f: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: close_ctree+0x70a: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_root_ref.part.0+0x818: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: init_tree_roots+0xa99: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: switch_commit_roots+0x488: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: commit_fs_roots+0x530: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: add_pending_snapshot+0x22c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: commit_cowonly_roots+0x65b: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_trans_release_metadata+0x208: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_wait_tree_log_extents+0x163: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: create_pending_snapshot+0x8b2: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_commit_transaction+0xe31: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: wait_subpage_spinlock+0x161: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: split_zoned_em+0xc65: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: insert_inline_extent+0x6df: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_del_delalloc_inode+0x33e: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_clear_delalloc_extent+0x63e: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_check_sector_csum+0x1ee: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_data_csum_ok+0x672: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_delayed_iput+0x29d: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: cow_file_range+0x989: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: run_delalloc_nocow+0x93a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: run_delalloc_zoned+0x360: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_run_delalloc_range+0x473: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_finish_ordered_io+0x12d2: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_invalidate_folio+0x74f: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_delete_subvolume+0x970: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_evict_inode+0x81a: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_extent+0x1259: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_range_writeback+0x28e: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_assert_inode_range_clean+0x198: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_insert_replace_extent+0x935: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_zero_range+0x7ff: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_pages+0x25a: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_dirty_pages+0x259: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_extents+0x1381: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_punch_hole+0x8be: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sync_file+0x5ea: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: defrag_get_extent+0x65a: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: defrag_collect_targets+0x9e4: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: defrag_one_locked_target.isra.0+0x4e4: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: defrag_one_range+0x6b9: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: mergable_maps+0x413: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: replace_extent_mapping+0x52b: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_extent_mapping+0xd6: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_extent_map_range+0xd87: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_replace_extent_map_range+0x12c: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_remove_device+0x163: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_add_device+0x3aa: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_add_qgroups+0x1c5: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_8+0x282: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_8+0x16f: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_8+0x282: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_8+0x173: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_16+0x455: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_16+0x2bb: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_16+0x475: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_16+0x2bd: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_32+0x491: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_32+0x2c6: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_32+0x4ae: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_32+0x2c9: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_64+0x491: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_64+0x2c7: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_64+0x4b3: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_64+0x2c9: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_setxattr+0x486: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_setxattr_trans+0x2c8: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_ordered_extent+0xb12: btrfs_assertfail() is missing a __noreturn annotation
   fs/btrfs/btrfs.o: warning: objtool: btrfs_mark_ordered_io_finished+0x836: btrfs_assertfail() is missing a __noreturn annotation


objdump-func vmlinux.o btrfs_unfreeze:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
