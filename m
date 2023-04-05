Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6CB7C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 00:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680655133; x=1712191133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtWhf0ss6NVdDpbFwiRNsA0EX57EIaExh9TtfLkBHq8=;
  b=T4TNla3vYTBngrE0h7Ao8k0Kcxag6FbBCTmxeLAOf9Rci/0LIBZ/fHwZ
   pCOQX8eta7uXcyK+1heRLgslL7oF+/3Z6+aLXMuMepLkH6DuEEo+Gr7+D
   7+gO3vdOPzHiukrIahTaspASAPeGkXwqX4tk9OtGBDspZC4EFAxZOibAY
   BE5Z74bUsR5XYBcNulw+Cpa9CD6S8A9zsaGocj2HvoKocTz93f0ik005s
   TAyiZMW2YyNQQpbnMklk7z+cDv6Xqdsv6+FIkVhffIihjh4uZfqnKE2hB
   sLrKWvXCwask84wqIusEE6g103jfi5lyQVrqKxm8Ci2EXGcMIAC063TC3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341064757"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="341064757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 17:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716841193"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="716841193"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Apr 2023 17:38:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjrAo-000Q8M-1B;
	Wed, 05 Apr 2023 00:38:50 +0000
Date: Wed, 5 Apr 2023 08:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-debug 3/8] fs/btrfs/btrfs.o: warning: objtool:
 run_delalloc_nocow+0x93a: unreachable instruction
Message-ID: <202304050802.c1YEICPw-lkp@intel.com>
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
commit: 8a21b194da04c824cdf6825a4de136c585eeb307 [3/8] objtool: Limit unreachable warnings to once per function
config: x86_64-randconfig-r026-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050802.c1YEICPw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=8a21b194da04c824cdf6825a4de136c585eeb307
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout 8a21b194da04c824cdf6825a4de136c585eeb307
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050802.c1YEICPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x3e8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_calc_avail_data_space+0x549: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: finish_need_commit_sem_search+0x237: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_search_slot_get_root+0x566: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: split_node+0xd26: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: balance_level+0x11f8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: search_leaf+0x5e8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_search_slot+0xffa: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_search_old_slot+0x5eb: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_search_forward+0x809: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_next_old_leaf+0x6b0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_find_item+0x382: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: alloc_reserved_extent+0x14f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: do_allocation_zoned.constprop.0+0x5a4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_extent_inline_ref_type+0x1d8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: update_inline_extent_backref+0x2b3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: extent_data_ref_count+0x265: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_free_extent+0xa20: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_discard_extent+0x43b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_inc_extent_ref+0xa5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_run_delayed_refs_for_head+0x551: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: do_walk_down+0x81c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: insert_with_overflow+0x274: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: csum_size_to_bytes+0xb5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: search_csum_tree+0x493: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_inode_set_file_extent_range+0x191: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_inode_clear_file_extent_range+0x1ac: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_bio_sums+0x7fe: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_csums_list+0x8e2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_lookup_csums_bitmap+0x73c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_csum_one_bio+0xc62: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_del_csums+0x715: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_file_extent_end+0x1fb: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_truncate_inode_items+0xdfe: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_cleanup_bg_io+0x116: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_global_root_id.part.0+0x7c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: csum_one_extent_buffer+0x467: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: validate_extent_buffer+0x8c3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: validate_subpage_buffer+0x25c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_extent_buffer+0x2f9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_validate_metadata_buffer+0x24d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: read_tree_block+0x11e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_global_root_insert+0x1ab: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: backup_super_roots+0x195a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_block_group_root+0x24e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_dev_one_super+0x206: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_and_free_fs_root+0x1a3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_fs_root_commit_root+0x2c3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_mark_buffer_dirty+0x2b5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_cleanup_one_transaction+0x599: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: warn_about_uncommitted_trans+0x56f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: close_ctree+0x70a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_root_ref.part.0+0x818: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: init_tree_roots+0xa99: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: switch_commit_roots+0x488: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: commit_fs_roots+0x530: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: add_pending_snapshot+0x22c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: commit_cowonly_roots+0x65b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_trans_release_metadata+0x208: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_wait_tree_log_extents+0x163: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: create_pending_snapshot+0x8b2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_commit_transaction+0xe31: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: wait_subpage_spinlock+0x161: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: split_zoned_em+0xc65: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: insert_inline_extent+0x6df: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_del_delalloc_inode+0x33e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_clear_delalloc_extent+0x63e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_check_sector_csum+0x1ee: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_data_csum_ok+0x672: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_delayed_iput+0x29d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: cow_file_range+0x989: unreachable instruction
>> fs/btrfs/btrfs.o: warning: objtool: run_delalloc_nocow+0x93a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: run_delalloc_zoned+0x360: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_run_delalloc_range+0x473: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_finish_ordered_io+0x12d2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_invalidate_folio+0x74f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_delete_subvolume+0x970: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_evict_inode+0x81a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_extent+0x1259: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_range_writeback+0x28e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_assert_inode_range_clean+0x198: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_insert_replace_extent+0x935: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_zero_range+0x7ff: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_pages+0x25a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_dirty_pages+0x259: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_extents+0x1381: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_punch_hole+0x8be: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sync_file+0x5ea: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: defrag_get_extent+0x65a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: defrag_collect_targets+0x9e4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: defrag_one_locked_target.isra.0+0x4e4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: defrag_one_range+0x6b9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: mergable_maps+0x413: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: replace_extent_mapping+0x52b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_extent_mapping+0xd6: unreachable instruction
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_drop_extent_map_range+0xd87: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_replace_extent_map_range+0x12c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_remove_device+0x163: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_add_device+0x3aa: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sysfs_add_qgroups+0x1c5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_8+0x282: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_8+0x16f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_8+0x282: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_8+0x173: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_16+0x455: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_16+0x2bb: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_16+0x475: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_16+0x2bd: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_32+0x491: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_32+0x2c6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_32+0x4ae: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_32+0x2c9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_token_64+0x491: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_64+0x2c7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_token_64+0x4b3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_64+0x2c9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_setxattr+0x486: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_setxattr_trans+0x2c8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_ordered_extent+0xb12: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_mark_ordered_io_finished+0x836: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_put_ordered_extent+0x396: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_remove_ordered_extent+0x863: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_get_ordered_extents_for_logging+0x2f0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_bio_add_page+0x37c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __alloc_extent_buffer+0x1c9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: get_next_extent_buffer.isra.0+0x371: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: submit_one_bio+0x34a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: submit_extent_page+0x55e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: submit_write_bio+0xf9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: read_extent_buffer_subpage+0x6f1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_bio_subpage_eb_writepage+0x68a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_bio_extent_buffer_writepage+0x54d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: process_one_page+0x248: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __process_pages_contig+0x481: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __unlock_for_delalloc+0xb3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: lock_delalloc_pages+0x17d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_lock_delalloc_range+0x3e5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __extent_writepage_io+0x82d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btree_clear_page_dirty+0x6f7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_page_read+0x445: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_bio_extent_readpage+0x841: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_extent_writepage+0x26e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: end_bio_extent_writepage+0x38e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: set_page_extent_mapped+0x2e8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_do_readpage+0xaa9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __extent_writepage+0xcc3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: clear_page_extent_mapped+0x30a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: extent_write_locked_range+0x762: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: extent_invalidate_folio+0x29b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: alloc_extent_buffer+0x443: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: fiemap_find_last_extent_offset+0x376: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: copy_extent_buffer_full+0x34c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_fsid+0xc8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: decide_stripe_size+0x5fa: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_live_mirror+0x404: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_may_alloc_data_chunk+0x169: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: dev_extent_hole_check.isra.0+0x1af: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_free_dev_extent_start.constprop.0+0x7ef: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_del_sys_chunk+0x35d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_close_one_device+0x42c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: init_alloc_chunk_ctl+0xbb1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_assign_next_active_device+0x279: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_rm_dev_replace_free_srcdev+0x1e8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_resume_balance_async+0x1dc: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_create_chunk+0x2c1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_chunk_alloc_add_chunk_item+0x8fa: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_remove_chunk+0x7be: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_balance+0x122b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_map_block+0x1974: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_rm_device+0x116b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: read_one_dev+0xc35: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_sys_array+0x3cf: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_read_chunk_tree+0x4d1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_commit_device_sizes+0x2d5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_ioctl_balance+0x64c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_exclop_balance+0x180: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_ioctl+0x2478: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: flush_dir_items_batch+0x48d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: log_dir_items+0x7a4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: replay_xattr_deletes+0x5c0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: overwrite_item+0x9f7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: log_delayed_deletions_incremental.isra.0+0x644: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: log_delayed_insertion_items.constprop.0+0x74d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: replay_one_dir_item+0x1de: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: check_item_in_log+0x421: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_log_inode+0x1aa4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: log_new_delayed_dentries+0x47e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_sync_log+0x1611: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_log_new_name+0x782: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: io_ctl_map_page+0x1c8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: recalculate_thresholds+0x241: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: update_cache_item+0x302: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: link_free_space+0x4b0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: tree_search_offset+0x498: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: relink_bitmap_entry+0x36f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: bitmap_clear_bits+0x343: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: bitmap_set_bits+0x2f7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: insert_into_bitmap+0x762: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: setup_cluster_no_bitmap+0x3ab: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_bitmap_cluster+0x5f9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __load_free_space_cache+0x85d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: steal_from_bitmap+0x712: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_add_free_space+0x2ab: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_find_space_for_alloc+0x73f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_alloc_from_cluster+0x3ff: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_trim_block_group+0x253: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: copy_compressed_data_to_page+0x45a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: lzo_compress_pages+0x520: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: lzo_decompress_bio+0x450: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_submit_compressed_write+0x545: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_submit_compressed_read+0xa68: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_decompress_buf2page+0x2f9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: insert_delayed_ref+0x513: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_delayed_tree_ref+0x8ba: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_add_delayed_data_ref+0x91a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: replace_path+0xab1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: handle_useless_nodes+0x746: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __add_tree_block+0x5b7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: build_backref_tree+0x359: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __del_reloc_root+0x36d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: clone_backref_node+0x787: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: prealloc_file_extent_cluster+0x752: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: select_reloc_root+0x398: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: do_relocation+0xad2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: relocate_one_page+0xf48: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: relocate_tree_block+0x548: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_reloc_root+0x28a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: prepare_to_merge+0x6cc: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: merge_reloc_root+0x1117: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: merge_reloc_roots+0x505: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_relocate_block_group+0x351: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_recover_relocation+0xa3e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_reloc_post_snapshot+0x530: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_release_delayed_iref+0xfb: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_release_delayed_node.part.0+0x9d9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_insert_delayed_item+0xb66: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: __btrfs_update_delayed_inode+0x656: unreachable instruction
>> fs/btrfs/btrfs.o: warning: objtool: btrfs_batch_delete_items+0x717: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_insert_delayed_dir_index+0x861: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_delete_delayed_dir_index+0x385: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_delayed_update_inode+0x4d7: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_log_get_delayed_items+0x3be: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_log_put_delayed_items+0x44a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_sector_get_page+0x1b3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: get_extent_info+0x313: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_workers_get+0x473: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_first_extent_item+0x3d0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: unlock_full_stripe.isra.0+0x311: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: alloc_scrub_sector+0x577: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: lock_full_stripe+0x475: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_sector_get_kaddr+0xe0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_checksum_tree_block+0xba6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_repair_sector_from_good_copy+0x423: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_recheck_block_on_raid56+0x5e1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_recheck_block+0x51f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_wr_bio_end_io_worker+0x2fb: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_setup_recheck_block+0xac2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_add_sector_to_rd_bio+0x93e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_sectors_for_parity+0x55d: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_raid56_data_stripe_for_parity.constprop.0+0xa14: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_raid56_parity+0x446: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_missing_raid56_pages+0x6ae: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_add_sector_to_wr_bio+0x727: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_simple_mirror+0xaf1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_stripe+0xfd4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_handle_errored_block.isra.0+0x14ec: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_bio_end_io_worker+0x772: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_enumerate_chunks+0xe81: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_scrub_dev+0x96f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: lookup_backref_shared_cache+0x3e4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: store_backref_shared_cache+0x3a2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: find_parent_nodes+0xa48: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_find_all_roots_safe+0x3c9: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_find_all_leafs+0x238: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: tree_backref_for_extent+0x339: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: iterate_extent_inodes+0x8ff: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_iter_next+0x5b6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_alloc_node+0x1f1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: handle_indirect_tree_backref+0xa05: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_cleanup_node+0x70c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_release_cache+0x2f2: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_add_tree_node+0x221: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_finish_upper_links+0xcaf: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_backref_error_cleanup+0xae0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: ulist_add_merge+0x406: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: try_flush_qgroup+0x29c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_quota_enable+0x1381: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_qgroup_trace_extent_post+0x1c6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: inconsistent_snapshot_error+0x241: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: search_key_again+0x10f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: store_backref_cache+0x41e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: get_inode_gen+0x10c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: can_rmdir+0xbe6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: cache_dir_utimes+0x102: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: apply_dir_move+0x1e1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: finish_inode_if_needed+0xa40: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: changed_cb+0x728: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_dev_replace_start+0x741: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_finish_block_group_to_copy+0x2b8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: index_stripe_sectors+0x24e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: bio_get_trace_info+0x2c6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: sector_in_rbio+0x1d3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: index_one_bio+0x41c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: get_rbio_veritical_errors+0x27b: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: rbio_add_bio+0x37a: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: rbio_add_io_sector+0x610: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: set_rbio_range_error+0x382: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: steal_rbio.part.0+0x2c8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: fill_data_csums+0x581: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: cache_rbio_pages+0x3f5: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: get_bio_sector_nr+0x256: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: raid_wait_read_end_io+0x3d6: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_assemble_read_bios+0x3a4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: alloc_rbio+0x7d1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: finish_parity_scrub.constprop.0+0x32c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: scrub_rbio+0x8d4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: verify_one_sector+0x3b8: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: generate_pq_vertical+0x68c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: rmw_assemble_write_bios.constprop.0+0x400: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: recover_vertical+0x6e1: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: rmw_rbio+0x998: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: recover_rbio+0x52c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: raid56_parity_recover+0x349: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x27f: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: raid56_add_scrub_pages+0x1f3: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: raid56_alloc_missing_rbio+0x186: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_ignore_prop+0x5e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_set_prop+0x160: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: free_space_set_bits+0x352: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: free_space_test_bit+0x24e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: btrfs_search_prev_slot.constprop.0+0x6e: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: search_free_space_info+0x316: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: convert_free_space_to_extents+0x5c0: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: load_free_space_extents+0x34c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: load_free_space_bitmaps+0x46c: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: convert_free_space_to_bitmaps+0x5f4: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: add_free_space_extent+0x642: unreachable instruction
   fs/btrfs/btrfs.o: warning: objtool: remove_free_space_extent+0x535: unreachable instruction


objdump-func vmlinux.o run_delalloc_nocow:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
