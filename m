Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26F161
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676938057; x=1708474057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kIL+GLv60n24Hn8hUzrEC5jbV7fyeB8+sPgV7tEJ6g=;
  b=nTf7LmtS9zALhXY+n8z7V6R1n+QPS2JPJ9r3AHD9akxFTqQDypUdiUUQ
   LhhR2L/2DUS45ETzigk4B0GhZMgHtbqRhpuD6YZfO4X4CTLvXDO70whWP
   9v5iaxn/Q7oM0cUcD2PNq0qtAaG3IMeAp5ej63QX+/B8VgslJyj9o1ZER
   6NsOc3OgZUizgsqjr/81wzZPoMOKYuikQ7FPfsDhJjR4c5g5Ek1qedAlI
   P+UYYAovLiXxG0N1fSv3jS0IqtKjvqnM4eol5knCNrbK99TyJ4us4lC1e
   xRRcAurrGWru21s4PzSiXsZyqFBfK5QrmPDLXtR26Zgdbqy3BC/z9WWql
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312139838"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="312139838"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 16:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="916988613"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="916988613"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Feb 2023 16:07:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUGBy-000EG7-0g;
	Tue, 21 Feb 2023 00:07:34 +0000
Date: Tue, 21 Feb 2023 08:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:noreturn-start-kernel 28/28] vmlinux.o: warning: objtool:
 apply_dir_move+0x1bb: unreachable instruction
Message-ID: <202302210709.IlXfgMpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git noreturn-start-kernel
head:   397ac3f03606c948ea7e0166e75be998f48899f8
commit: 397ac3f03606c948ea7e0166e75be998f48899f8 [28/28] objtool: Add per-function rate limiting for unreachable warnings
config: x86_64-randconfig-a004-20230220 (https://download.01.org/0day-ci/archive/20230221/202302210709.IlXfgMpX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=397ac3f03606c948ea7e0166e75be998f48899f8
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe noreturn-start-kernel
        git checkout 397ac3f03606c948ea7e0166e75be998f48899f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210709.IlXfgMpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __btrfs_map_block+0x1c63: unreachable instruction
>> vmlinux.o: warning: objtool: apply_dir_move+0x1bb: unreachable instruction
>> vmlinux.o: warning: objtool: get_bio_sector_nr+0x251: unreachable instruction
>> vmlinux.o: warning: objtool: raid_wait_read_end_io+0x682: unreachable instruction
>> vmlinux.o: warning: objtool: raid56_parity_alloc_scrub_rbio+0x37d: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_add_bg_to_space_info+0x6e0: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_unfreeze.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_calc_avail_data_space.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: finish_need_commit_sem_search.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_search_slot_get_root.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: split_node.cold+0x42: unreachable instruction
>> vmlinux.o: warning: objtool: balance_level.cold+0x89: unreachable instruction
>> vmlinux.o: warning: objtool: search_leaf.cold+0x26: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_search_slot.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_search_old_slot.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_search_forward.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_next_old_leaf.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_find_item.cold+0x21: unreachable instruction
>> vmlinux.o: warning: objtool: do_allocation_zoned.constprop.0.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: alloc_reserved_extent.cold+0x18: unreachable instruction
>> vmlinux.o: warning: objtool: btrfs_get_extent_inline_ref_type.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: update_inline_extent_backref.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: extent_data_ref_count.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_free_extent.cold+0x48f: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_discard_extent.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inc_extent_ref.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_run_delayed_refs_for_head.cold+0xf0: unreachable instruction
   vmlinux.o: warning: objtool: do_walk_down.cold+0x22: unreachable instruction
   vmlinux.o: warning: objtool: insert_with_overflow.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: csum_size_to_bytes.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: search_csum_tree.cold+0x20: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inode_set_file_extent_range.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inode_clear_file_extent_range.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_bio_sums.cold+0x36: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_csums_list.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_csums_bitmap.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_csum_one_bio.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_del_csums.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_file_extent_end.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_truncate_inode_items.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_global_root_id.cold+0x1b: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_cleanup_bg_io.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: validate_extent_buffer.cold+0x3f4: unreachable instruction
   vmlinux.o: warning: objtool: validate_subpage_buffer.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: csum_one_extent_buffer.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btree_csum_one_bio.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_read_extent_buffer.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_validate_metadata_buffer.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: read_tree_block.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_global_root_insert.cold+0x20: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_read_dev_one_super.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_and_free_fs_root.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_fs_root_commit_root.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_cleanup_one_transaction.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_root_ref.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: commit_fs_roots.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_trans_release_metadata.cold+0x39: unreachable instruction
   vmlinux.o: warning: objtool: switch_commit_roots.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: add_pending_snapshot.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: commit_cowonly_roots.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: create_pending_snapshot.cold+0x4f6: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_wait_tree_log_extents.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_commit_transaction.cold+0xf7: unreachable instruction
   vmlinux.o: warning: objtool: wait_subpage_spinlock.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: insert_inline_extent.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: split_zoned_em.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_submit_direct.cold+0x9f: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_del_delalloc_inode.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_clear_delalloc_extent.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_check_sector_csum.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_check_data_csum.cold+0x300: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_encoded_read_verify_csum.cold+0x44: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_verify_data_csum.cold+0x36: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_add_delayed_iput.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: cow_file_range.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: run_delalloc_nocow.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: run_delalloc_zoned.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_run_delalloc_range.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_finish_ordered_io.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_invalidate_folio.cold+0x4d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_delete_subvolume.cold+0x2c5: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_evict_inode.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_extent.cold+0x58: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_range_writeback.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_insert_replace_extent.cold+0x1d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_pages.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_zero_range.cold+0xec: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_dirty_pages.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_extents.cold+0x8c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_punch_hole.cold+0x124: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sync_file.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: defrag_get_extent.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: defrag_collect_targets.cold+0x27: unreachable instruction
   vmlinux.o: warning: objtool: defrag_one_range.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: mergable_maps.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: replace_extent_mapping.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_add_extent_mapping.cold+0x1b: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_extent_map_range.cold+0x19: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_replace_extent_map_range.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_remove_device.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_add_device.cold+0x6c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_add_qgroups.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_feature_update.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_8.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_8.cold+0x69: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_8.cold+0x1c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_8.cold+0x66: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_16.cold+0x21: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_16.cold+0x5e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_16.cold+0x26: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_16.cold+0x65: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_32.cold+0x21: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_32.cold+0x5e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_32.cold+0x26: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_32.cold+0x65: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_64.cold+0x21: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_64.cold+0x5e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_64.cold+0x26: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_64.cold+0x66: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_setxattr.cold+0x18: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_setxattr_trans.cold+0x27: unreachable instruction


objdump-func vmlinux.o apply_dir_move:
0000 0000000000f8d490 <apply_dir_move>:
0000   f8d490:	e8 00 00 00 00       	call   f8d495 <apply_dir_move+0x5>	f8d491: R_X86_64_PLT32	__fentry__-0x4
0005   f8d495:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
000f   f8d49f:	41 57                	push   %r15
0011   f8d4a1:	41 56                	push   %r14
0013   f8d4a3:	41 55                	push   %r13
0015   f8d4a5:	41 54                	push   %r12
0017   f8d4a7:	55                   	push   %rbp
0018   f8d4a8:	53                   	push   %rbx
0019   f8d4a9:	48 89 fb             	mov    %rdi,%rbx
001c   f8d4ac:	48 81 ec 60 01 00 00 	sub    $0x160,%rsp
0023   f8d4b3:	48 8d 84 24 a0 00 00 00 	lea    0xa0(%rsp),%rax
002b   f8d4bb:	48 89 34 24          	mov    %rsi,(%rsp)
002f   f8d4bf:	48 c7 84 24 a0 00 00 00 b3 8a b5 41 	movq   $0x41b58ab3,0xa0(%rsp)
003b   f8d4cb:	48 c1 e8 03          	shr    $0x3,%rax
003f   f8d4cf:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
0044   f8d4d4:	48 01 d0             	add    %rdx,%rax
0047   f8d4d7:	48 c7 84 24 a8 00 00 00 00 00 00 00 	movq   $0x0,0xa8(%rsp)	f8d4df: R_X86_64_32S	.rodata.str1.8+0x3c200
0053   f8d4e3:	48 c7 84 24 b0 00 00 00 00 00 00 00 	movq   $0x0,0xb0(%rsp)	f8d4eb: R_X86_64_32S	.text+0xf8d490
005f   f8d4ef:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0065   f8d4f5:	c7 40 04 00 f2 f2 f2 	movl   $0xf2f2f200,0x4(%rax)
006c   f8d4fc:	c7 40 08 00 f2 f2 f2 	movl   $0xf2f2f200,0x8(%rax)
0073   f8d503:	c7 40 0c 00 f2 f2 f2 	movl   $0xf2f2f200,0xc(%rax)
007a   f8d50a:	c7 40 10 00 f2 f2 f2 	movl   $0xf2f2f200,0x10(%rax)
0081   f8d511:	c7 40 14 00 00 f3 f3 	movl   $0xf3f30000,0x14(%rax)
0088   f8d518:	48 8d 87 c8 00 00 00 	lea    0xc8(%rdi),%rax
008f   f8d51f:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0094   f8d524:	48 c1 e8 03          	shr    $0x3,%rax
0098   f8d528:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
009c   f8d52c:	0f 85 e9 13 00 00    	jne    f8e91b <apply_dir_move+0x148b>
00a2   f8d532:	48 8b 83 c8 00 00 00 	mov    0xc8(%rbx),%rax
00a9   f8d539:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
00ae   f8d53e:	e8 3d 09 ff ff       	call   f7de80 <fs_path_alloc>
00b3   f8d543:	49 89 c5             	mov    %rax,%r13
00b6   f8d546:	e8 35 09 ff ff       	call   f7de80 <fs_path_alloc>
00bb   f8d54b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
00c0   f8d550:	4d 85 ed             	test   %r13,%r13
00c3   f8d553:	0f 84 81 0c 00 00    	je     f8e1da <apply_dir_move+0xd4a>
00c9   f8d559:	48 85 c0             	test   %rax,%rax
00cc   f8d55c:	0f 84 6f 0c 00 00    	je     f8e1d1 <apply_dir_move+0xd41>
00d2   f8d562:	48 8b 04 24          	mov    (%rsp),%rax
00d6   f8d566:	48 83 c0 30          	add    $0x30,%rax
00da   f8d56a:	48 89 c2             	mov    %rax,%rdx
00dd   f8d56d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
00e2   f8d572:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00ec   f8d57c:	48 c1 ea 03          	shr    $0x3,%rdx
00f0   f8d580:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00f4   f8d584:	0f 85 82 13 00 00    	jne    f8e90c <apply_dir_move+0x147c>
00fa   f8d58a:	48 8b 04 24          	mov    (%rsp),%rax
00fe   f8d58e:	4c 8b 78 30          	mov    0x30(%rax),%r15
0102   f8d592:	48 8d 83 a0 01 00 00 	lea    0x1a0(%rbx),%rax
0109   f8d599:	48 89 c2             	mov    %rax,%rdx
010c   f8d59c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0111   f8d5a1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
011b   f8d5ab:	48 c1 ea 03          	shr    $0x3,%rdx
011f   f8d5af:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0123   f8d5b3:	0f 85 cc 12 00 00    	jne    f8e885 <apply_dir_move+0x13f5>
0129   f8d5b9:	4c 8b a3 a0 01 00 00 	mov    0x1a0(%rbx),%r12
0130   f8d5c0:	4d 85 e4             	test   %r12,%r12
0133   f8d5c3:	74 6e                	je     f8d633 <apply_dir_move+0x1a3>
0135   f8d5c5:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
013f   f8d5cf:	eb 21                	jmp    f8d5f2 <apply_dir_move+0x162>
0141   f8d5d1:	49 8d 7c 24 10       	lea    0x10(%r12),%rdi
0146   f8d5d6:	48 89 f8             	mov    %rdi,%rax
0149   f8d5d9:	48 c1 e8 03          	shr    $0x3,%rax
014d   f8d5dd:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0152   f8d5e2:	0f 85 3e 12 00 00    	jne    f8e826 <apply_dir_move+0x1396>
0158   f8d5e8:	4d 8b 64 24 10       	mov    0x10(%r12),%r12
015d   f8d5ed:	4d 85 e4             	test   %r12,%r12
0160   f8d5f0:	74 41                	je     f8d633 <apply_dir_move+0x1a3>
0162   f8d5f2:	49 8d 7c 24 18       	lea    0x18(%r12),%rdi
0167   f8d5f7:	48 89 f8             	mov    %rdi,%rax
016a   f8d5fa:	48 c1 e8 03          	shr    $0x3,%rax
016e   f8d5fe:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0173   f8d603:	0f 85 13 12 00 00    	jne    f8e81c <apply_dir_move+0x138c>
0179   f8d609:	4d 3b 7c 24 18       	cmp    0x18(%r12),%r15
017e   f8d60e:	72 c1                	jb     f8d5d1 <apply_dir_move+0x141>
0180   f8d610:	76 51                	jbe    f8d663 <apply_dir_move+0x1d3>
0182   f8d612:	49 8d 7c 24 08       	lea    0x8(%r12),%rdi
0187   f8d617:	48 89 f8             	mov    %rdi,%rax
018a   f8d61a:	48 c1 e8 03          	shr    $0x3,%rax
018e   f8d61e:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0193   f8d623:	0f 85 9d 12 00 00    	jne    f8e8c6 <apply_dir_move+0x1436>
0199   f8d629:	4d 8b 64 24 08       	mov    0x8(%r12),%r12
019e   f8d62e:	4d 85 e4             	test   %r12,%r12
01a1   f8d631:	75 bf                	jne    f8d5f2 <apply_dir_move+0x162>
01a3   f8d633:	ba bd 0d 00 00       	mov    $0xdbd,%edx
01a8   f8d638:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	f8d63b: R_X86_64_32S	.rodata+0x28a4c0
01af   f8d63f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f8d642: R_X86_64_32S	.rodata+0x28ac40
01b6   f8d646:	e8 00 00 00 00       	call   f8d64b <apply_dir_move+0x1bb>	f8d647: R_X86_64_PLT32	btrfs_assertfail-0x4
01bb   f8d64b:	48 b8 04 00 00 00 00 fc ff df 	movabs $0xdffffc0000000004,%rax
01c5   f8d655:	80 38 00             	cmpb   $0x0,(%rax)
01c8   f8d658:	0f 84 00 00 00 00    	je     f8d65e <apply_dir_move+0x1ce>	f8d65a: R_X86_64_PC32	.text.unlikely+0x67f66
01ce   f8d65e:	e9 00 00 00 00       	jmp    f8d663 <apply_dir_move+0x1d3>	f8d65f: R_X86_64_PC32	.text.unlikely+0x67f5c
01d3   f8d663:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01dd   f8d66d:	49 8d 7c 24 20       	lea    0x20(%r12),%rdi
01e2   f8d672:	48 89 fa             	mov    %rdi,%rdx
01e5   f8d675:	48 c1 ea 03          	shr    $0x3,%rdx
01e9   f8d679:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
01ed   f8d67d:	0f 85 39 12 00 00    	jne    f8e8bc <apply_dir_move+0x142c>
01f3   f8d683:	49 8b 44 24 20       	mov    0x20(%r12),%rax
01f8   f8d688:	49 8d 7c 24 28       	lea    0x28(%r12),%rdi
01fd   f8d68d:	48 89 fa             	mov    %rdi,%rdx
0200   f8d690:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0205   f8d695:	48 c1 ea 03          	shr    $0x3,%rdx
0209   f8d699:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0213   f8d6a3:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0217   f8d6a7:	0f 85 d9 16 00 00    	jne    f8ed86 <apply_dir_move+0x18f6>
021d   f8d6ad:	49 8b 44 24 28       	mov    0x28(%r12),%rax
0222   f8d6b2:	49 8d 7c 24 30       	lea    0x30(%r12),%rdi
0227   f8d6b7:	48 89 fa             	mov    %rdi,%rdx
022a   f8d6ba:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
022f   f8d6bf:	48 c1 ea 03          	shr    $0x3,%rdx
0233   f8d6c3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
023d   f8d6cd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0241   f8d6d1:	84 c0                	test   %al,%al
0243   f8d6d3:	74 06                	je     f8d6db <apply_dir_move+0x24b>
0245   f8d6d5:	0f 8e c8 11 00 00    	jle    f8e8a3 <apply_dir_move+0x1413>
024b   f8d6db:	41 0f b6 44 24 30    	movzbl 0x30(%r12),%eax
0251   f8d6e1:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
0256   f8d6e6:	4c 89 e7             	mov    %r12,%rdi
0259   f8d6e9:	88 84 24 9b 00 00 00 	mov    %al,0x9b(%rsp)
0260   f8d6f0:	e8 00 00 00 00       	call   f8d6f5 <apply_dir_move+0x265>	f8d6f1: R_X86_64_PLT32	rb_erase-0x4
0265   f8d6f5:	4c 89 e7             	mov    %r12,%rdi
0268   f8d6f8:	e8 00 00 00 00       	call   f8d6fd <apply_dir_move+0x26d>	f8d6f9: R_X86_64_PLT32	kfree-0x4
026d   f8d6fd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0277   f8d707:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
027c   f8d70c:	48 c1 ea 03          	shr    $0x3,%rdx
0280   f8d710:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0284   f8d714:	0f 85 7a 11 00 00    	jne    f8e894 <apply_dir_move+0x1404>
028a   f8d71a:	48 8b 04 24          	mov    (%rsp),%rax
028e   f8d71e:	80 bc 24 9b 00 00 00 00 	cmpb   $0x0,0x9b(%rsp)
0296   f8d726:	48 8b 70 30          	mov    0x30(%rax),%rsi
029a   f8d72a:	0f 84 0f 03 00 00    	je     f8da3f <apply_dir_move+0x5af>
02a0   f8d730:	48 8d 78 38          	lea    0x38(%rax),%rdi
02a4   f8d734:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02ae   f8d73e:	48 89 fa             	mov    %rdi,%rdx
02b1   f8d741:	48 c1 ea 03          	shr    $0x3,%rdx
02b5   f8d745:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
02b9   f8d749:	0f 85 35 14 00 00    	jne    f8eb84 <apply_dir_move+0x16f4>
02bf   f8d74f:	48 8b 04 24          	mov    (%rsp),%rax
02c3   f8d753:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
02c8   f8d758:	48 89 df             	mov    %rbx,%rdi
02cb   f8d75b:	48 8b 50 38          	mov    0x38(%rax),%rdx
02cf   f8d75f:	e8 7c 25 ff ff       	call   f7fce0 <gen_unique_name>
02d4   f8d764:	41 89 c7             	mov    %eax,%r15d
02d7   f8d767:	45 85 ff             	test   %r15d,%r15d
02da   f8d76a:	0f 88 56 03 00 00    	js     f8dac6 <apply_dir_move+0x636>
02e0   f8d770:	48 8d 83 80 00 00 00 	lea    0x80(%rbx),%rax
02e7   f8d777:	48 89 c2             	mov    %rax,%rdx
02ea   f8d77a:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
02f2   f8d782:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02fc   f8d78c:	48 c1 ea 03          	shr    $0x3,%rdx
0300   f8d790:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0304   f8d794:	0f 85 fe 13 00 00    	jne    f8eb98 <apply_dir_move+0x1708>
030a   f8d79a:	48 8b 83 80 00 00 00 	mov    0x80(%rbx),%rax
0311   f8d7a1:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
0316   f8d7a6:	4c 8d 60 01          	lea    0x1(%rax),%r12
031a   f8d7aa:	48 c1 ea 03          	shr    $0x3,%rdx
031e   f8d7ae:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0328   f8d7b8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
032c   f8d7bc:	0f 85 a5 10 00 00    	jne    f8e867 <apply_dir_move+0x13d7>
0332   f8d7c2:	48 8b 04 24          	mov    (%rsp),%rax
0336   f8d7c6:	4c 89 a3 c8 00 00 00 	mov    %r12,0xc8(%rbx)
033d   f8d7cd:	48 83 c0 38          	add    $0x38,%rax
0341   f8d7d1:	48 89 c2             	mov    %rax,%rdx
0344   f8d7d4:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0349   f8d7d9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0353   f8d7e3:	48 c1 ea 03          	shr    $0x3,%rdx
0357   f8d7e7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
035b   f8d7eb:	0f 85 85 10 00 00    	jne    f8e876 <apply_dir_move+0x13e6>
0361   f8d7f1:	48 8b 04 24          	mov    (%rsp),%rax
0365   f8d7f5:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
036a   f8d7fa:	48 8b 50 38          	mov    0x38(%rax),%rdx
036e   f8d7fe:	48 c1 e9 03          	shr    $0x3,%rcx
0372   f8d802:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
037c   f8d80c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0380   f8d810:	0f 85 dd 10 00 00    	jne    f8e8f3 <apply_dir_move+0x1463>
0386   f8d816:	48 c7 84 24 00 01 00 00 00 00 00 00 	movq   $0x0,0x100(%rsp)
0392   f8d822:	48 8b 04 24          	mov    (%rsp),%rax
0396   f8d826:	48 c7 84 24 20 01 00 00 00 00 00 00 	movq   $0x0,0x120(%rsp)
03a2   f8d832:	48 8b 40 30          	mov    0x30(%rax),%rax
03a6   f8d836:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
03ab   f8d83b:	48 3d 00 01 00 00    	cmp    $0x100,%rax
03b1   f8d841:	0f 84 b5 0f 00 00    	je     f8e7fc <apply_dir_move+0x136c>
03b7   f8d847:	49 8d 45 19          	lea    0x19(%r13),%rax
03bb   f8d84b:	49 8d 75 10          	lea    0x10(%r13),%rsi
03bf   f8d84f:	45 31 ff             	xor    %r15d,%r15d
03c2   f8d852:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
03c7   f8d857:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
03cc   f8d85c:	48 c1 e8 03          	shr    $0x3,%rax
03d0   f8d860:	49 8d 7d 08          	lea    0x8(%r13),%rdi
03d4   f8d864:	45 89 f8             	mov    %r15d,%r8d
03d7   f8d867:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
03e1   f8d871:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
03e6   f8d876:	4d 89 ef             	mov    %r13,%r15
03e9   f8d879:	45 31 e4             	xor    %r12d,%r12d
03ec   f8d87c:	48 01 e8             	add    %rbp,%rax
03ef   f8d87f:	48 8d bb a8 01 00 00 	lea    0x1a8(%rbx),%rdi
03f6   f8d886:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
03fb   f8d88b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0400   f8d890:	48 89 f0             	mov    %rsi,%rax
0403   f8d893:	48 c1 e8 03          	shr    $0x3,%rax
0407   f8d897:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
040c   f8d89c:	48 01 e8             	add    %rbp,%rax
040f   f8d89f:	49 89 c5             	mov    %rax,%r13
0412   f8d8a2:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0417   f8d8a7:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
041c   f8d8ac:	0f b6 00             	movzbl (%rax),%eax
041f   f8d8af:	83 e1 07             	and    $0x7,%ecx
0422   f8d8b2:	38 c8                	cmp    %cl,%al
0424   f8d8b4:	7f 08                	jg     f8d8be <apply_dir_move+0x42e>
0426   f8d8b6:	84 c0                	test   %al,%al
0428   f8d8b8:	0f 85 1f 13 00 00    	jne    f8ebdd <apply_dir_move+0x174d>
042e   f8d8be:	41 80 7d 00 00       	cmpb   $0x0,0x0(%r13)
0433   f8d8c3:	41 0f b6 4f 19       	movzbl 0x19(%r15),%ecx
0438   f8d8c8:	0f 85 3e 13 00 00    	jne    f8ec0c <apply_dir_move+0x177c>
043e   f8d8ce:	49 8b 47 10          	mov    0x10(%r15),%rax
0442   f8d8d2:	84 c9                	test   %cl,%cl
0444   f8d8d4:	0f 88 5f 04 00 00    	js     f8dd39 <apply_dir_move+0x8a9>
044a   f8d8da:	4c 89 f9             	mov    %r15,%rcx
044d   f8d8dd:	48 c1 e9 03          	shr    $0x3,%rcx
0451   f8d8e1:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0455   f8d8e5:	0f 85 5f 13 00 00    	jne    f8ec4a <apply_dir_move+0x17ba>
045b   f8d8eb:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0460   f8d8f0:	49 89 07             	mov    %rax,(%r15)
0463   f8d8f3:	48 c1 e9 03          	shr    $0x3,%rcx
0467   f8d8f7:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
046b   f8d8fb:	0f 85 86 13 00 00    	jne    f8ec87 <apply_dir_move+0x17f7>
0471   f8d901:	48 89 c1             	mov    %rax,%rcx
0474   f8d904:	49 89 47 08          	mov    %rax,0x8(%r15)
0478   f8d908:	48 89 c7             	mov    %rax,%rdi
047b   f8d90b:	48 c1 e9 03          	shr    $0x3,%rcx
047f   f8d90f:	83 e7 07             	and    $0x7,%edi
0482   f8d912:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
0486   f8d916:	40 38 f9             	cmp    %dil,%cl
0489   f8d919:	7f 08                	jg     f8d923 <apply_dir_move+0x493>
048b   f8d91b:	84 c9                	test   %cl,%cl
048d   f8d91d:	0f 85 f5 11 00 00    	jne    f8eb18 <apply_dir_move+0x1688>
0493   f8d923:	c6 00 00             	movb   $0x0,(%rax)
0496   f8d926:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
049b   f8d92b:	48 c1 e8 03          	shr    $0x3,%rax
049f   f8d92f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04a3   f8d933:	0f 85 1c 12 00 00    	jne    f8eb55 <apply_dir_move+0x16c5>
04a9   f8d939:	48 8b 83 a8 01 00 00 	mov    0x1a8(%rbx),%rax
04b0   f8d940:	48 85 c0             	test   %rax,%rax
04b3   f8d943:	74 3d                	je     f8d982 <apply_dir_move+0x4f2>
04b5   f8d945:	48 8d 78 18          	lea    0x18(%rax),%rdi
04b9   f8d949:	48 89 f9             	mov    %rdi,%rcx
04bc   f8d94c:	48 c1 e9 03          	shr    $0x3,%rcx
04c0   f8d950:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
04c4   f8d954:	0f 85 cf 0b 00 00    	jne    f8e529 <apply_dir_move+0x1099>
04ca   f8d95a:	4c 39 70 18          	cmp    %r14,0x18(%rax)
04ce   f8d95e:	0f 86 8b 02 00 00    	jbe    f8dbef <apply_dir_move+0x75f>
04d4   f8d964:	48 8d 78 10          	lea    0x10(%rax),%rdi
04d8   f8d968:	48 89 f9             	mov    %rdi,%rcx
04db   f8d96b:	48 c1 e9 03          	shr    $0x3,%rcx
04df   f8d96f:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
04e3   f8d973:	0f 85 98 0c 00 00    	jne    f8e611 <apply_dir_move+0x1181>
04e9   f8d979:	48 8b 40 10          	mov    0x10(%rax),%rax
04ed   f8d97d:	48 85 c0             	test   %rax,%rax
04f0   f8d980:	75 c3                	jne    f8d945 <apply_dir_move+0x4b5>
04f2   f8d982:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
04f7   f8d987:	48 c1 e8 03          	shr    $0x3,%rax
04fb   f8d98b:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04ff   f8d98f:	0f 85 29 12 00 00    	jne    f8ebbe <apply_dir_move+0x172e>
0505   f8d995:	48 8b 83 a0 01 00 00 	mov    0x1a0(%rbx),%rax
050c   f8d99c:	48 85 c0             	test   %rax,%rax
050f   f8d99f:	74 3d                	je     f8d9de <apply_dir_move+0x54e>
0511   f8d9a1:	48 8d 78 18          	lea    0x18(%rax),%rdi
0515   f8d9a5:	48 89 f9             	mov    %rdi,%rcx
0518   f8d9a8:	48 c1 e9 03          	shr    $0x3,%rcx
051c   f8d9ac:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0520   f8d9b0:	0f 85 d2 0b 00 00    	jne    f8e588 <apply_dir_move+0x10f8>
0526   f8d9b6:	4c 39 70 18          	cmp    %r14,0x18(%rax)
052a   f8d9ba:	0f 86 4f 02 00 00    	jbe    f8dc0f <apply_dir_move+0x77f>
0530   f8d9c0:	48 8d 78 10          	lea    0x10(%rax),%rdi
0534   f8d9c4:	48 89 f9             	mov    %rdi,%rcx
0537   f8d9c7:	48 c1 e9 03          	shr    $0x3,%rcx
053b   f8d9cb:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
053f   f8d9cf:	0f 85 e8 0b 00 00    	jne    f8e5bd <apply_dir_move+0x112d>
0545   f8d9d5:	48 8b 40 10          	mov    0x10(%rax),%rax
0549   f8d9d9:	48 85 c0             	test   %rax,%rax
054c   f8d9dc:	75 c3                	jne    f8d9a1 <apply_dir_move+0x511>
054e   f8d9de:	4c 8d 84 24 20 01 00 00 	lea    0x120(%rsp),%r8
0556   f8d9e6:	4d 89 f9             	mov    %r15,%r9
0559   f8d9e9:	4c 89 f6             	mov    %r14,%rsi
055c   f8d9ec:	48 89 df             	mov    %rbx,%rdi
055f   f8d9ef:	48 8d 8c 24 00 01 00 00 	lea    0x100(%rsp),%rcx
0567   f8d9f7:	e8 54 76 ff ff       	call   f85050 <__get_cur_name_and_parent>
056c   f8d9fc:	41 89 c0             	mov    %eax,%r8d
056f   f8d9ff:	85 c0                	test   %eax,%eax
0571   f8da01:	0f 8f 5c 05 00 00    	jg     f8df63 <apply_dir_move+0xad3>
0577   f8da07:	45 85 c0             	test   %r8d,%r8d
057a   f8da0a:	0f 88 b4 07 00 00    	js     f8e1c4 <apply_dir_move+0xd34>
0580   f8da10:	48 8b 84 24 00 01 00 00 	mov    0x100(%rsp),%rax
0588   f8da18:	48 39 44 24 20       	cmp    %rax,0x20(%rsp)
058d   f8da1d:	0f 84 92 07 00 00    	je     f8e1b5 <apply_dir_move+0xd25>
0593   f8da23:	48 8b 94 24 20 01 00 00 	mov    0x120(%rsp),%rdx
059b   f8da2b:	48 3d 00 01 00 00    	cmp    $0x100,%rax
05a1   f8da31:	0f 84 b8 03 00 00    	je     f8ddef <apply_dir_move+0x95f>
05a7   f8da37:	49 89 c6             	mov    %rax,%r14
05aa   f8da3a:	e9 63 fe ff ff       	jmp    f8d8a2 <apply_dir_move+0x412>
05af   f8da3f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05b9   f8da49:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
05bd   f8da4d:	48 89 fa             	mov    %rdi,%rdx
05c0   f8da50:	48 c1 ea 03          	shr    $0x3,%rdx
05c4   f8da54:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
05c8   f8da58:	0f 85 4c 11 00 00    	jne    f8ebaa <apply_dir_move+0x171a>
05ce   f8da5e:	48 8d 84 24 60 01 00 00 	lea    0x160(%rsp),%rax
05d6   f8da66:	48 8b 7b 48          	mov    0x48(%rbx),%rdi
05da   f8da6a:	48 8d 8c 24 e0 00 00 00 	lea    0xe0(%rsp),%rcx
05e2   f8da72:	4d 89 e8             	mov    %r13,%r8
05e5   f8da75:	48 8d 90 60 ff ff ff 	lea    -0xa0(%rax),%rdx
05ec   f8da7c:	e8 8f 4b ff ff       	call   f82610 <get_first_ref>
05f1   f8da81:	41 89 c7             	mov    %eax,%r15d
05f4   f8da84:	85 c0                	test   %eax,%eax
05f6   f8da86:	78 3e                	js     f8dac6 <apply_dir_move+0x636>
05f8   f8da88:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
05fd   f8da8d:	48 8b 94 24 e0 00 00 00 	mov    0xe0(%rsp),%rdx
0605   f8da95:	48 89 df             	mov    %rbx,%rdi
0608   f8da98:	48 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%rsi
0610   f8daa0:	4c 89 f1             	mov    %r14,%rcx
0613   f8daa3:	e8 a8 87 ff ff       	call   f86250 <get_cur_path>
0618   f8daa8:	41 89 c7             	mov    %eax,%r15d
061b   f8daab:	85 c0                	test   %eax,%eax
061d   f8daad:	78 17                	js     f8dac6 <apply_dir_move+0x636>
061f   f8daaf:	4c 89 ee             	mov    %r13,%rsi
0622   f8dab2:	4c 89 f7             	mov    %r14,%rdi
0625   f8dab5:	e8 d6 9e fe ff       	call   f77990 <fs_path_add_path>
062a   f8daba:	41 89 c7             	mov    %eax,%r15d
062d   f8dabd:	45 85 ff             	test   %r15d,%r15d
0630   f8dac0:	0f 89 aa fc ff ff    	jns    f8d770 <apply_dir_move+0x2e0>
0636   f8dac6:	49 8d 45 10          	lea    0x10(%r13),%rax
063a   f8daca:	31 ed                	xor    %ebp,%ebp
063c   f8dacc:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0641   f8dad1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
064b   f8dadb:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
0650   f8dae0:	48 c1 ea 03          	shr    $0x3,%rdx
0654   f8dae4:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0658   f8dae8:	0f 85 bf 0d 00 00    	jne    f8e8ad <apply_dir_move+0x141d>
065e   f8daee:	49 8b 7d 10          	mov    0x10(%r13),%rdi
0662   f8daf2:	49 8d 45 1a          	lea    0x1a(%r13),%rax
0666   f8daf6:	48 39 c7             	cmp    %rax,%rdi
0669   f8daf9:	74 05                	je     f8db00 <apply_dir_move+0x670>
066b   f8dafb:	e8 00 00 00 00       	call   f8db00 <apply_dir_move+0x670>	f8dafc: R_X86_64_PLT32	kfree-0x4
0670   f8db00:	4c 89 ef             	mov    %r13,%rdi
0673   f8db03:	e8 00 00 00 00       	call   f8db08 <apply_dir_move+0x678>	f8db04: R_X86_64_PLT32	kfree-0x4
0678   f8db08:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
067d   f8db0d:	48 8d 78 10          	lea    0x10(%rax),%rdi
0681   f8db11:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
068b   f8db1b:	48 89 fa             	mov    %rdi,%rdx
068e   f8db1e:	48 c1 ea 03          	shr    $0x3,%rdx
0692   f8db22:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0696   f8db26:	0f 85 a4 0d 00 00    	jne    f8e8d0 <apply_dir_move+0x1440>
069c   f8db2c:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
06a1   f8db31:	48 8b 78 10          	mov    0x10(%rax),%rdi
06a5   f8db35:	48 83 c0 1a          	add    $0x1a,%rax
06a9   f8db39:	48 39 c7             	cmp    %rax,%rdi
06ac   f8db3c:	74 05                	je     f8db43 <apply_dir_move+0x6b3>
06ae   f8db3e:	e8 00 00 00 00       	call   f8db43 <apply_dir_move+0x6b3>	f8db3f: R_X86_64_PLT32	kfree-0x4
06b3   f8db43:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
06b8   f8db48:	e8 00 00 00 00       	call   f8db4d <apply_dir_move+0x6bd>	f8db49: R_X86_64_PLT32	kfree-0x4
06bd   f8db4d:	48 85 ed             	test   %rbp,%rbp
06c0   f8db50:	74 39                	je     f8db8b <apply_dir_move+0x6fb>
06c2   f8db52:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06cc   f8db5c:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
06d0   f8db60:	48 89 fa             	mov    %rdi,%rdx
06d3   f8db63:	48 c1 ea 03          	shr    $0x3,%rdx
06d7   f8db67:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
06db   f8db6b:	0f 85 69 0d 00 00    	jne    f8e8da <apply_dir_move+0x144a>
06e1   f8db71:	48 8b 7d 10          	mov    0x10(%rbp),%rdi
06e5   f8db75:	48 8d 45 1a          	lea    0x1a(%rbp),%rax
06e9   f8db79:	48 39 c7             	cmp    %rax,%rdi
06ec   f8db7c:	74 05                	je     f8db83 <apply_dir_move+0x6f3>
06ee   f8db7e:	e8 00 00 00 00       	call   f8db83 <apply_dir_move+0x6f3>	f8db7f: R_X86_64_PLT32	kfree-0x4
06f3   f8db83:	48 89 ef             	mov    %rbp,%rdi
06f6   f8db86:	e8 00 00 00 00       	call   f8db8b <apply_dir_move+0x6fb>	f8db87: R_X86_64_PLT32	kfree-0x4
06fb   f8db8b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0705   f8db95:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
070a   f8db9a:	48 c1 ea 03          	shr    $0x3,%rdx
070e   f8db9e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0712   f8dba2:	0f 85 3c 0d 00 00    	jne    f8e8e4 <apply_dir_move+0x1454>
0718   f8dba8:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
071d   f8dbad:	48 89 83 c8 00 00 00 	mov    %rax,0xc8(%rbx)
0724   f8dbb4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
072e   f8dbbe:	48 03 44 24 60       	add    0x60(%rsp),%rax
0733   f8dbc3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
073a   f8dbca:	48 c7 40 08 00 00 00 00 	movq   $0x0,0x8(%rax)
0742   f8dbd2:	48 c7 40 10 00 00 00 00 	movq   $0x0,0x10(%rax)
074a   f8dbda:	48 81 c4 60 01 00 00 	add    $0x160,%rsp
0751   f8dbe1:	44 89 f8             	mov    %r15d,%eax
0754   f8dbe4:	5b                   	pop    %rbx
0755   f8dbe5:	5d                   	pop    %rbp
0756   f8dbe6:	41 5c                	pop    %r12
0758   f8dbe8:	41 5d                	pop    %r13
075a   f8dbea:	41 5e                	pop    %r14
075c   f8dbec:	41 5f                	pop    %r15
075e   f8dbee:	c3                   	ret
075f   f8dbef:	73 42                	jae    f8dc33 <apply_dir_move+0x7a3>
0761   f8dbf1:	48 8d 78 08          	lea    0x8(%rax),%rdi
0765   f8dbf5:	48 89 f9             	mov    %rdi,%rcx
0768   f8dbf8:	48 c1 e9 03          	shr    $0x3,%rcx
076c   f8dbfc:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0770   f8dc00:	0f 85 bc 0b 00 00    	jne    f8e7c2 <apply_dir_move+0x1332>
0776   f8dc06:	48 8b 40 08          	mov    0x8(%rax),%rax
077a   f8dc0a:	e9 31 fd ff ff       	jmp    f8d940 <apply_dir_move+0x4b0>
077f   f8dc0f:	0f 83 dd 00 00 00    	jae    f8dcf2 <apply_dir_move+0x862>
0785   f8dc15:	48 8d 78 08          	lea    0x8(%rax),%rdi
0789   f8dc19:	48 89 f9             	mov    %rdi,%rcx
078c   f8dc1c:	48 c1 e9 03          	shr    $0x3,%rcx
0790   f8dc20:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0794   f8dc24:	0f 85 bd 09 00 00    	jne    f8e5e7 <apply_dir_move+0x1157>
079a   f8dc2a:	48 8b 40 08          	mov    0x8(%rax),%rax
079e   f8dc2e:	e9 69 fd ff ff       	jmp    f8d99c <apply_dir_move+0x50c>
07a3   f8dc33:	48 8d 78 20          	lea    0x20(%rax),%rdi
07a7   f8dc37:	48 89 f9             	mov    %rdi,%rcx
07aa   f8dc3a:	48 c1 e9 03          	shr    $0x3,%rcx
07ae   f8dc3e:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
07b2   f8dc42:	0f 85 40 0b 00 00    	jne    f8e788 <apply_dir_move+0x12f8>
07b8   f8dc48:	48 3b 50 20          	cmp    0x20(%rax),%rdx
07bc   f8dc4c:	73 4f                	jae    f8dc9d <apply_dir_move+0x80d>
07be   f8dc4e:	48 8d 78 10          	lea    0x10(%rax),%rdi
07c2   f8dc52:	48 89 f9             	mov    %rdi,%rcx
07c5   f8dc55:	48 c1 e9 03          	shr    $0x3,%rcx
07c9   f8dc59:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
07cd   f8dc5d:	0f 84 16 fd ff ff    	je     f8d979 <apply_dir_move+0x4e9>
07d3   f8dc63:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
07db   f8dc6b:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
07e3   f8dc73:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
07eb   f8dc7b:	e8 00 00 00 00       	call   f8dc80 <apply_dir_move+0x7f0>	f8dc7c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07f0   f8dc80:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
07f8   f8dc88:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
0800   f8dc90:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
0808   f8dc98:	e9 dc fc ff ff       	jmp    f8d979 <apply_dir_move+0x4e9>
080d   f8dc9d:	0f 86 4c 01 00 00    	jbe    f8ddef <apply_dir_move+0x95f>
0813   f8dca3:	48 8d 78 08          	lea    0x8(%rax),%rdi
0817   f8dca7:	48 89 f9             	mov    %rdi,%rcx
081a   f8dcaa:	48 c1 e9 03          	shr    $0x3,%rcx
081e   f8dcae:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
0822   f8dcb2:	0f 84 4e ff ff ff    	je     f8dc06 <apply_dir_move+0x776>
0828   f8dcb8:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
0830   f8dcc0:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0838   f8dcc8:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
0840   f8dcd0:	e8 00 00 00 00       	call   f8dcd5 <apply_dir_move+0x845>	f8dcd1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0845   f8dcd5:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
084d   f8dcdd:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
0855   f8dce5:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
085d   f8dced:	e9 14 ff ff ff       	jmp    f8dc06 <apply_dir_move+0x776>
0862   f8dcf2:	48 8d 7b 48          	lea    0x48(%rbx),%rdi
0866   f8dcf6:	4d 85 e4             	test   %r12,%r12
0869   f8dcf9:	48 89 f8             	mov    %rdi,%rax
086c   f8dcfc:	4d 0f 44 e6          	cmove  %r14,%r12
0870   f8dd00:	48 c1 e8 03          	shr    $0x3,%rax
0874   f8dd04:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0878   f8dd08:	0f 85 b8 0f 00 00    	jne    f8ecc6 <apply_dir_move+0x1836>
087e   f8dd0e:	48 8d 84 24 60 01 00 00 	lea    0x160(%rsp),%rax
0886   f8dd16:	48 8b 7b 48          	mov    0x48(%rbx),%rdi
088a   f8dd1a:	4d 89 f8             	mov    %r15,%r8
088d   f8dd1d:	48 8d 8c 24 20 01 00 00 	lea    0x120(%rsp),%rcx
0895   f8dd25:	48 8d 50 a0          	lea    -0x60(%rax),%rdx
0899   f8dd29:	4c 89 f6             	mov    %r14,%rsi
089c   f8dd2c:	e8 df 48 ff ff       	call   f82610 <get_first_ref>
08a1   f8dd31:	41 89 c0             	mov    %eax,%r8d
08a4   f8dd34:	e9 ce fc ff ff       	jmp    f8da07 <apply_dir_move+0x577>
08a9   f8dd39:	49 8d 7f 18          	lea    0x18(%r15),%rdi
08ad   f8dd3d:	48 89 f9             	mov    %rdi,%rcx
08b0   f8dd40:	48 c1 e9 03          	shr    $0x3,%rcx
08b4   f8dd44:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
08b8   f8dd48:	84 c9                	test   %cl,%cl
08ba   f8dd4a:	74 09                	je     f8dd55 <apply_dir_move+0x8c5>
08bc   f8dd4c:	80 f9 01             	cmp    $0x1,%cl
08bf   f8dd4f:	0f 8e 7b 0f 00 00    	jle    f8ecd0 <apply_dir_move+0x1840>
08c5   f8dd55:	41 0f b7 4f 18       	movzwl 0x18(%r15),%ecx
08ca   f8dd5a:	81 e1 ff 7f 00 00    	and    $0x7fff,%ecx
08d0   f8dd60:	48 8d 44 08 ff       	lea    -0x1(%rax,%rcx,1),%rax
08d5   f8dd65:	4c 89 f9             	mov    %r15,%rcx
08d8   f8dd68:	48 c1 e9 03          	shr    $0x3,%rcx
08dc   f8dd6c:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
08e0   f8dd70:	0f 85 94 0f 00 00    	jne    f8ed0a <apply_dir_move+0x187a>
08e6   f8dd76:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
08eb   f8dd7b:	49 89 07             	mov    %rax,(%r15)
08ee   f8dd7e:	48 c1 e9 03          	shr    $0x3,%rcx
08f2   f8dd82:	80 3c 29 00          	cmpb   $0x0,(%rcx,%rbp,1)
08f6   f8dd86:	0f 85 bb 0f 00 00    	jne    f8ed47 <apply_dir_move+0x18b7>
08fc   f8dd8c:	48 89 c1             	mov    %rax,%rcx
08ff   f8dd8f:	49 89 47 08          	mov    %rax,0x8(%r15)
0903   f8dd93:	48 89 c7             	mov    %rax,%rdi
0906   f8dd96:	48 c1 e9 03          	shr    $0x3,%rcx
090a   f8dd9a:	83 e7 07             	and    $0x7,%edi
090d   f8dd9d:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx
0911   f8dda1:	40 38 f9             	cmp    %dil,%cl
0914   f8dda4:	0f 8f 79 fb ff ff    	jg     f8d923 <apply_dir_move+0x493>
091a   f8ddaa:	84 c9                	test   %cl,%cl
091c   f8ddac:	0f 84 71 fb ff ff    	je     f8d923 <apply_dir_move+0x493>
0922   f8ddb2:	48 89 c7             	mov    %rax,%rdi
0925   f8ddb5:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
092d   f8ddbd:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
0935   f8ddc5:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
093d   f8ddcd:	e8 00 00 00 00       	call   f8ddd2 <apply_dir_move+0x942>	f8ddce: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0942   f8ddd2:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
094a   f8ddda:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
0952   f8dde2:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
095a   f8ddea:	e9 34 fb ff ff       	jmp    f8d923 <apply_dir_move+0x493>
095f   f8ddef:	4d 89 fd             	mov    %r15,%r13
0962   f8ddf2:	45 85 c0             	test   %r8d,%r8d
0965   f8ddf5:	0f 84 6b 01 00 00    	je     f8df66 <apply_dir_move+0xad6>
096b   f8ddfb:	4c 8d b4 24 40 01 00 00 	lea    0x140(%rsp),%r14
0973   f8de03:	4c 89 b4 24 40 01 00 00 	mov    %r14,0x140(%rsp)
097b   f8de0b:	4c 89 b4 24 48 01 00 00 	mov    %r14,0x148(%rsp)
0983   f8de13:	49 81 fc 00 01 00 00 	cmp    $0x100,%r12
098a   f8de1a:	0f 86 00 00 00 00    	jbe    f8de20 <apply_dir_move+0x990>	f8de1c: R_X86_64_PC32	.text.unlikely+0x67f3f
0990   f8de20:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
0995   f8de25:	48 8b 34 24          	mov    (%rsp),%rsi
0999   f8de29:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09a3   f8de33:	0f b6 84 24 9b 00 00 00 	movzbl 0x9b(%rsp),%eax
09ab   f8de3b:	48 c1 e9 03          	shr    $0x3,%rcx
09af   f8de3f:	4c 8d 46 40          	lea    0x40(%rsi),%r8
09b3   f8de43:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
09b7   f8de47:	0f 85 aa 0c 00 00    	jne    f8eaf7 <apply_dir_move+0x1667>
09bd   f8de4d:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
09c2   f8de52:	48 8b 34 24          	mov    (%rsp),%rsi
09c6   f8de56:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
09d0   f8de60:	48 c1 e9 03          	shr    $0x3,%rcx
09d4   f8de64:	4c 8b 7e 38          	mov    0x38(%rsi),%r15
09d8   f8de68:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1)
09dc   f8de6c:	0f 85 64 0c 00 00    	jne    f8ead6 <apply_dir_move+0x1646>
09e2   f8de72:	48 8b 34 24          	mov    (%rsp),%rsi
09e6   f8de76:	4c 89 fa             	mov    %r15,%rdx
09e9   f8de79:	4d 89 f1             	mov    %r14,%r9
09ec   f8de7c:	4c 89 e1             	mov    %r12,%rcx
09ef   f8de7f:	48 89 df             	mov    %rbx,%rdi
09f2   f8de82:	48 8b 76 30          	mov    0x30(%rsi),%rsi
09f6   f8de86:	50                   	push   %rax
09f7   f8de87:	e8 54 37 ff ff       	call   f815e0 <add_pending_dir_move>
09fc   f8de8c:	41 89 c7             	mov    %eax,%r15d
09ff   f8de8f:	58                   	pop    %rax
0a00   f8de90:	45 85 ff             	test   %r15d,%r15d
0a03   f8de93:	78 08                	js     f8de9d <apply_dir_move+0xa0d>
0a05   f8de95:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
0a0b   f8de9b:	75 07                	jne    f8dea4 <apply_dir_move+0xa14>
0a0d   f8de9d:	31 ed                	xor    %ebp,%ebp
0a0f   f8de9f:	e9 2d fc ff ff       	jmp    f8dad1 <apply_dir_move+0x641>
0a14   f8dea4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a1e   f8deae:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
0a23   f8deb3:	48 c1 ea 03          	shr    $0x3,%rdx
0a27   f8deb7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0a2b   f8debb:	0f 85 06 0c 00 00    	jne    f8eac7 <apply_dir_move+0x1637>
0a31   f8dec1:	48 8b 04 24          	mov    (%rsp),%rax
0a35   f8dec5:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0a3a   f8deca:	4c 8b 70 30          	mov    0x30(%rax),%r14
0a3e   f8dece:	48 c1 ea 03          	shr    $0x3,%rdx
0a42   f8ded2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a4c   f8dedc:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0a50   f8dee0:	0f 85 d2 0b 00 00    	jne    f8eab8 <apply_dir_move+0x1628>
0a56   f8dee6:	48 8b ab a0 01 00 00 	mov    0x1a0(%rbx),%rbp
0a5d   f8deed:	48 85 ed             	test   %rbp,%rbp
0a60   f8def0:	0f 84 33 03 00 00    	je     f8e229 <apply_dir_move+0xd99>
0a66   f8def6:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0a70   f8df00:	eb 23                	jmp    f8df25 <apply_dir_move+0xa95>
0a72   f8df02:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
0a76   f8df06:	48 89 f8             	mov    %rdi,%rax
0a79   f8df09:	48 c1 e8 03          	shr    $0x3,%rax
0a7d   f8df0d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a82   f8df12:	0f 85 72 0a 00 00    	jne    f8e98a <apply_dir_move+0x14fa>
0a88   f8df18:	48 8b 6d 10          	mov    0x10(%rbp),%rbp
0a8c   f8df1c:	48 85 ed             	test   %rbp,%rbp
0a8f   f8df1f:	0f 84 04 03 00 00    	je     f8e229 <apply_dir_move+0xd99>
0a95   f8df25:	48 8d 7d 18          	lea    0x18(%rbp),%rdi
0a99   f8df29:	48 89 f8             	mov    %rdi,%rax
0a9c   f8df2c:	48 c1 e8 03          	shr    $0x3,%rax
0aa0   f8df30:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0aa5   f8df35:	0f 85 73 0b 00 00    	jne    f8eaae <apply_dir_move+0x161e>
0aab   f8df3b:	4c 3b 75 18          	cmp    0x18(%rbp),%r14
0aaf   f8df3f:	72 c1                	jb     f8df02 <apply_dir_move+0xa72>
0ab1   f8df41:	0f 86 fc 02 00 00    	jbe    f8e243 <apply_dir_move+0xdb3>
0ab7   f8df47:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
0abb   f8df4b:	48 89 f8             	mov    %rdi,%rax
0abe   f8df4e:	48 c1 e8 03          	shr    $0x3,%rax
0ac2   f8df52:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0ac7   f8df57:	0f 85 23 0a 00 00    	jne    f8e980 <apply_dir_move+0x14f0>
0acd   f8df5d:	48 8b 6d 08          	mov    0x8(%rbp),%rbp
0ad1   f8df61:	eb b9                	jmp    f8df1c <apply_dir_move+0xa8c>
0ad3   f8df63:	4d 89 fd             	mov    %r15,%r13
0ad6   f8df66:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ae0   f8df70:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
0ae5   f8df75:	48 89 f2             	mov    %rsi,%rdx
0ae8   f8df78:	83 e6 07             	and    $0x7,%esi
0aeb   f8df7b:	48 c1 ea 03          	shr    $0x3,%rdx
0aef   f8df7f:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0af3   f8df83:	40 38 f0             	cmp    %sil,%al
0af6   f8df86:	7f 0e                	jg     f8df96 <apply_dir_move+0xb06>
0af8   f8df88:	84 c0                	test   %al,%al
0afa   f8df8a:	74 0a                	je     f8df96 <apply_dir_move+0xb06>
0afc   f8df8c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0b01   f8df91:	e8 00 00 00 00       	call   f8df96 <apply_dir_move+0xb06>	f8df92: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b06   f8df96:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
0b0b   f8df9b:	41 0f b6 6d 19       	movzbl 0x19(%r13),%ebp
0b10   f8dfa0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b1a   f8dfaa:	48 c1 ea 03          	shr    $0x3,%rdx
0b1e   f8dfae:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0b22   f8dfb2:	0f 85 91 09 00 00    	jne    f8e949 <apply_dir_move+0x14b9>
0b28   f8dfb8:	4d 8b 65 10          	mov    0x10(%r13),%r12
0b2c   f8dfbc:	40 84 ed             	test   %bpl,%bpl
0b2f   f8dfbf:	0f 88 b8 04 00 00    	js     f8e47d <apply_dir_move+0xfed>
0b35   f8dfc5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b3f   f8dfcf:	4c 89 ea             	mov    %r13,%rdx
0b42   f8dfd2:	48 c1 ea 03          	shr    $0x3,%rdx
0b46   f8dfd6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0b4a   f8dfda:	0f 85 5c 09 00 00    	jne    f8e93c <apply_dir_move+0x14ac>
0b50   f8dfe0:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0b55   f8dfe5:	4d 89 65 00          	mov    %r12,0x0(%r13)
0b59   f8dfe9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b63   f8dff3:	48 c1 ea 03          	shr    $0x3,%rdx
0b67   f8dff7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0b6b   f8dffb:	0f 85 2f 08 00 00    	jne    f8e830 <apply_dir_move+0x13a0>
0b71   f8e001:	4c 89 e2             	mov    %r12,%rdx
0b74   f8e004:	4d 89 65 08          	mov    %r12,0x8(%r13)
0b78   f8e008:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b82   f8e012:	48 c1 ea 03          	shr    $0x3,%rdx
0b86   f8e016:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0b8a   f8e01a:	4c 89 e2             	mov    %r12,%rdx
0b8d   f8e01d:	83 e2 07             	and    $0x7,%edx
0b90   f8e020:	38 d0                	cmp    %dl,%al
0b92   f8e022:	7f 0c                	jg     f8e030 <apply_dir_move+0xba0>
0b94   f8e024:	84 c0                	test   %al,%al
0b96   f8e026:	74 08                	je     f8e030 <apply_dir_move+0xba0>
0b98   f8e028:	4c 89 e7             	mov    %r12,%rdi
0b9b   f8e02b:	e8 00 00 00 00       	call   f8e030 <apply_dir_move+0xba0>	f8e02c: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
0ba0   f8e030:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0baa   f8e03a:	41 c6 04 24 00       	movb   $0x0,(%r12)
0baf   f8e03f:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
0bb4   f8e044:	48 c1 ea 03          	shr    $0x3,%rdx
0bb8   f8e048:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0bbc   f8e04c:	0f 85 1f 09 00 00    	jne    f8e971 <apply_dir_move+0x14e1>
0bc2   f8e052:	48 8b 04 24          	mov    (%rsp),%rax
0bc6   f8e056:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
0bcb   f8e05b:	4c 8b 60 38          	mov    0x38(%rax),%r12
0bcf   f8e05f:	48 c1 ea 03          	shr    $0x3,%rdx
0bd3   f8e063:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0bdd   f8e06d:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0be1   f8e071:	0f 85 eb 08 00 00    	jne    f8e962 <apply_dir_move+0x14d2>
0be7   f8e077:	48 8b 04 24          	mov    (%rsp),%rax
0beb   f8e07b:	4c 89 e9             	mov    %r13,%rcx
0bee   f8e07e:	4c 89 e2             	mov    %r12,%rdx
0bf1   f8e081:	48 89 df             	mov    %rbx,%rdi
0bf4   f8e084:	48 8b 70 30          	mov    0x30(%rax),%rsi
0bf8   f8e088:	e8 c3 81 ff ff       	call   f86250 <get_cur_path>
0bfd   f8e08d:	41 89 c7             	mov    %eax,%r15d
0c00   f8e090:	85 c0                	test   %eax,%eax
0c02   f8e092:	0f 88 d1 00 00 00    	js     f8e169 <apply_dir_move+0xcd9>
0c08   f8e098:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
0c0d   f8e09d:	4c 89 ea             	mov    %r13,%rdx
0c10   f8e0a0:	48 89 df             	mov    %rbx,%rdi
0c13   f8e0a3:	e8 28 50 ff ff       	call   f830d0 <send_rename>
0c18   f8e0a8:	41 89 c7             	mov    %eax,%r15d
0c1b   f8e0ab:	85 c0                	test   %eax,%eax
0c1d   f8e0ad:	0f 88 b6 00 00 00    	js     f8e169 <apply_dir_move+0xcd9>
0c23   f8e0b3:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
0c29   f8e0b9:	0f 84 35 02 00 00    	je     f8e2f4 <apply_dir_move+0xe64>
0c2f   f8e0bf:	48 8d bb a8 01 00 00 	lea    0x1a8(%rbx),%rdi
0c36   f8e0c6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0c40   f8e0d0:	48 89 fa             	mov    %rdi,%rdx
0c43   f8e0d3:	48 c1 ea 03          	shr    $0x3,%rdx
0c47   f8e0d7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0c4b   f8e0db:	0f 85 c3 09 00 00    	jne    f8eaa4 <apply_dir_move+0x1614>
0c51   f8e0e1:	4c 8b b3 a8 01 00 00 	mov    0x1a8(%rbx),%r14
0c58   f8e0e8:	4d 85 f6             	test   %r14,%r14
0c5b   f8e0eb:	0f 84 03 02 00 00    	je     f8e2f4 <apply_dir_move+0xe64>
0c61   f8e0f1:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0c6b   f8e0fb:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
0c70   f8e100:	eb 23                	jmp    f8e125 <apply_dir_move+0xc95>
0c72   f8e102:	49 8d 7e 10          	lea    0x10(%r14),%rdi
0c76   f8e106:	48 89 f8             	mov    %rdi,%rax
0c79   f8e109:	48 c1 e8 03          	shr    $0x3,%rax
0c7d   f8e10d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0c82   f8e112:	0f 85 a9 08 00 00    	jne    f8e9c1 <apply_dir_move+0x1531>
0c88   f8e118:	4d 8b 76 10          	mov    0x10(%r14),%r14
0c8c   f8e11c:	4d 85 f6             	test   %r14,%r14
0c8f   f8e11f:	0f 84 cf 01 00 00    	je     f8e2f4 <apply_dir_move+0xe64>
0c95   f8e125:	49 8d 7e 18          	lea    0x18(%r14),%rdi
0c99   f8e129:	48 89 f8             	mov    %rdi,%rax
0c9c   f8e12c:	48 c1 e8 03          	shr    $0x3,%rax
0ca0   f8e130:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0ca5   f8e135:	0f 85 5f 09 00 00    	jne    f8ea9a <apply_dir_move+0x160a>
0cab   f8e13b:	4d 39 7e 18          	cmp    %r15,0x18(%r14)
0caf   f8e13f:	77 c1                	ja     f8e102 <apply_dir_move+0xc72>
0cb1   f8e141:	0f 83 68 01 00 00    	jae    f8e2af <apply_dir_move+0xe1f>
0cb7   f8e147:	49 8d 7e 08          	lea    0x8(%r14),%rdi
0cbb   f8e14b:	48 89 f8             	mov    %rdi,%rax
0cbe   f8e14e:	48 c1 e8 03          	shr    $0x3,%rax
0cc2   f8e152:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0cc7   f8e157:	0f 85 e2 06 00 00    	jne    f8e83f <apply_dir_move+0x13af>
0ccd   f8e15d:	4d 8b 76 08          	mov    0x8(%r14),%r14
0cd1   f8e161:	eb b9                	jmp    f8e11c <apply_dir_move+0xc8c>
0cd3   f8e163:	41 bf f4 ff ff ff    	mov    $0xfffffff4,%r15d
0cd9   f8e169:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0cde   f8e16e:	48 8d 78 10          	lea    0x10(%rax),%rdi
0ce2   f8e172:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0cec   f8e17c:	48 89 fa             	mov    %rdi,%rdx
0cef   f8e17f:	48 c1 ea 03          	shr    $0x3,%rdx
0cf3   f8e183:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0cf7   f8e187:	0f 85 cb 07 00 00    	jne    f8e958 <apply_dir_move+0x14c8>
0cfd   f8e18d:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0d02   f8e192:	4c 89 ed             	mov    %r13,%rbp
0d05   f8e195:	48 8b 78 10          	mov    0x10(%rax),%rdi
0d09   f8e199:	48 83 c0 1a          	add    $0x1a,%rax
0d0d   f8e19d:	48 39 c7             	cmp    %rax,%rdi
0d10   f8e1a0:	0f 85 98 f9 ff ff    	jne    f8db3e <apply_dir_move+0x6ae>
0d16   f8e1a6:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
0d1b   f8e1ab:	e8 00 00 00 00       	call   f8e1b0 <apply_dir_move+0xd20>	f8e1ac: R_X86_64_PLT32	kfree-0x4
0d20   f8e1b0:	e9 9d f9 ff ff       	jmp    f8db52 <apply_dir_move+0x6c2>
0d25   f8e1b5:	4d 85 e4             	test   %r12,%r12
0d28   f8e1b8:	4d 89 fd             	mov    %r15,%r13
0d2b   f8e1bb:	4d 0f 44 e6          	cmove  %r14,%r12
0d2f   f8e1bf:	e9 37 fc ff ff       	jmp    f8ddfb <apply_dir_move+0x96b>
0d34   f8e1c4:	4d 89 fd             	mov    %r15,%r13
0d37   f8e1c7:	31 ed                	xor    %ebp,%ebp
0d39   f8e1c9:	45 89 c7             	mov    %r8d,%r15d
0d3c   f8e1cc:	e9 00 f9 ff ff       	jmp    f8dad1 <apply_dir_move+0x641>
0d41   f8e1d1:	4d 85 ed             	test   %r13,%r13
0d44   f8e1d4:	0f 85 fb 07 00 00    	jne    f8e9d5 <apply_dir_move+0x1545>
0d4a   f8e1da:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
0d50   f8e1e0:	0f 84 cc 03 00 00    	je     f8e5b2 <apply_dir_move+0x1122>
0d56   f8e1e6:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0d5b   f8e1eb:	48 8d 78 10          	lea    0x10(%rax),%rdi
0d5f   f8e1ef:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0d69   f8e1f9:	48 89 fa             	mov    %rdi,%rdx
0d6c   f8e1fc:	48 c1 ea 03          	shr    $0x3,%rdx
0d70   f8e200:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0d74   f8e204:	0f 85 53 06 00 00    	jne    f8e85d <apply_dir_move+0x13cd>
0d7a   f8e20a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0d7f   f8e20f:	48 8b 78 10          	mov    0x10(%rax),%rdi
0d83   f8e213:	48 83 c0 1a          	add    $0x1a,%rax
0d87   f8e217:	48 39 c7             	cmp    %rax,%rdi
0d8a   f8e21a:	74 7e                	je     f8e29a <apply_dir_move+0xe0a>
0d8c   f8e21c:	31 ed                	xor    %ebp,%ebp
0d8e   f8e21e:	41 bf f4 ff ff ff    	mov    $0xfffffff4,%r15d
0d94   f8e224:	e9 15 f9 ff ff       	jmp    f8db3e <apply_dir_move+0x6ae>
0d99   f8e229:	ba e2 0d 00 00       	mov    $0xde2,%edx
0d9e   f8e22e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	f8e231: R_X86_64_32S	.rodata+0x28a4c0
0da5   f8e235:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f8e238: R_X86_64_32S	.rodata+0x28ac40
0dac   f8e23c:	31 ed                	xor    %ebp,%ebp
0dae   f8e23e:	e8 00 00 00 00       	call   f8e243 <apply_dir_move+0xdb3>	f8e23f: R_X86_64_PLT32	btrfs_assertfail-0x4
0db3   f8e243:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0dbd   f8e24d:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
0dc1   f8e251:	48 89 fa             	mov    %rdi,%rdx
0dc4   f8e254:	48 c1 ea 03          	shr    $0x3,%rdx
0dc8   f8e258:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0dcc   f8e25c:	0f 85 69 07 00 00    	jne    f8e9cb <apply_dir_move+0x153b>
0dd2   f8e262:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0dd7   f8e267:	48 8d 7d 28          	lea    0x28(%rbp),%rdi
0ddb   f8e26b:	48 89 fa             	mov    %rdi,%rdx
0dde   f8e26e:	48 89 45 20          	mov    %rax,0x20(%rbp)
0de2   f8e272:	48 c1 ea 03          	shr    $0x3,%rdx
0de6   f8e276:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0df0   f8e280:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0df4   f8e284:	0f 85 ab 07 00 00    	jne    f8ea35 <apply_dir_move+0x15a5>
0dfa   f8e28a:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
0dff   f8e28f:	48 89 45 28          	mov    %rax,0x28(%rbp)
0e03   f8e293:	31 ed                	xor    %ebp,%ebp
0e05   f8e295:	e9 37 f8 ff ff       	jmp    f8dad1 <apply_dir_move+0x641>
0e0a   f8e29a:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
0e0f   f8e29f:	41 bf f4 ff ff ff    	mov    $0xfffffff4,%r15d
0e15   f8e2a5:	e8 00 00 00 00       	call   f8e2aa <apply_dir_move+0xe1a>	f8e2a6: R_X86_64_PLT32	kfree-0x4
0e1a   f8e2aa:	e9 dc f8 ff ff       	jmp    f8db8b <apply_dir_move+0x6fb>
0e1f   f8e2af:	49 8d 7e 20          	lea    0x20(%r14),%rdi
0e23   f8e2b3:	48 89 f8             	mov    %rdi,%rax
0e26   f8e2b6:	48 c1 e8 03          	shr    $0x3,%rax
0e2a   f8e2ba:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e2f   f8e2bf:	0f 85 84 05 00 00    	jne    f8e849 <apply_dir_move+0x13b9>
0e35   f8e2c5:	49 8b 6e 20          	mov    0x20(%r14),%rbp
0e39   f8e2c9:	48 3b 6c 24 78       	cmp    0x78(%rsp),%rbp
0e3e   f8e2ce:	0f 86 83 01 00 00    	jbe    f8e457 <apply_dir_move+0xfc7>
0e44   f8e2d4:	49 8d 7e 10          	lea    0x10(%r14),%rdi
0e48   f8e2d8:	48 89 f8             	mov    %rdi,%rax
0e4b   f8e2db:	48 c1 e8 03          	shr    $0x3,%rax
0e4f   f8e2df:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e54   f8e2e4:	0f 84 2e fe ff ff    	je     f8e118 <apply_dir_move+0xc88>
0e5a   f8e2ea:	e8 00 00 00 00       	call   f8e2ef <apply_dir_move+0xe5f>	f8e2eb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e5f   f8e2ef:	e9 24 fe ff ff       	jmp    f8e118 <apply_dir_move+0xc88>
0e64   f8e2f4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e6e   f8e2fe:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
0e73   f8e303:	48 c1 ea 03          	shr    $0x3,%rdx
0e77   f8e307:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0e7b   f8e30b:	0f 85 a1 06 00 00    	jne    f8e9b2 <apply_dir_move+0x1522>
0e81   f8e311:	48 8b 04 24          	mov    (%rsp),%rax
0e85   f8e315:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
0e8a   f8e31a:	4c 8b 60 38          	mov    0x38(%rax),%r12
0e8e   f8e31e:	48 c1 ea 03          	shr    $0x3,%rdx
0e92   f8e322:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0e9c   f8e32c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0ea0   f8e330:	0f 85 6d 06 00 00    	jne    f8e9a3 <apply_dir_move+0x1513>
0ea6   f8e336:	4c 8b 34 24          	mov    (%rsp),%r14
0eaa   f8e33a:	4c 89 e2             	mov    %r12,%rdx
0ead   f8e33d:	48 89 df             	mov    %rbx,%rdi
0eb0   f8e340:	49 8b 76 30          	mov    0x30(%r14),%rsi
0eb4   f8e344:	e8 17 ac ff ff       	call   f88f60 <send_utimes>
0eb9   f8e349:	41 89 c7             	mov    %eax,%r15d
0ebc   f8e34c:	85 c0                	test   %eax,%eax
0ebe   f8e34e:	0f 88 15 fe ff ff    	js     f8e169 <apply_dir_move+0xcd9>
0ec4   f8e354:	49 8d 46 40          	lea    0x40(%r14),%rax
0ec8   f8e358:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0ecd   f8e35d:	48 c1 e8 03          	shr    $0x3,%rax
0ed1   f8e361:	48 89 c2             	mov    %rax,%rdx
0ed4   f8e364:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ede   f8e36e:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0ee2   f8e372:	0f 85 1c 06 00 00    	jne    f8e994 <apply_dir_move+0x1504>
0ee8   f8e378:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)
0ef1   f8e381:	48 8b 04 24          	mov    (%rsp),%rax
0ef5   f8e385:	4c 8b 60 40          	mov    0x40(%rax),%r12
0ef9   f8e389:	4c 3b 64 24 08       	cmp    0x8(%rsp),%r12
0efe   f8e38e:	0f 84 d5 fd ff ff    	je     f8e169 <apply_dir_move+0xcd9>
0f04   f8e394:	48 8d 43 40          	lea    0x40(%rbx),%rax
0f08   f8e398:	4d 89 e7             	mov    %r12,%r15
0f0b   f8e39b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0f15   f8e3a5:	48 89 04 24          	mov    %rax,(%rsp)
0f19   f8e3a9:	48 c1 e8 03          	shr    $0x3,%rax
0f1d   f8e3ad:	48 8d 04 28          	lea    (%rax,%rbp,1),%rax
0f21   f8e3b1:	49 89 c4             	mov    %rax,%r12
0f24   f8e3b4:	eb 65                	jmp    f8e41b <apply_dir_move+0xf8b>
0f26   f8e3b6:	85 c0                	test   %eax,%eax
0f28   f8e3b8:	0f 88 a5 01 00 00    	js     f8e563 <apply_dir_move+0x10d3>
0f2e   f8e3be:	49 8d 7f 28          	lea    0x28(%r15),%rdi
0f32   f8e3c2:	48 89 f8             	mov    %rdi,%rax
0f35   f8e3c5:	48 c1 e8 03          	shr    $0x3,%rax
0f39   f8e3c9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0f3d   f8e3cd:	0f 85 6c 06 00 00    	jne    f8ea3f <apply_dir_move+0x15af>
0f43   f8e3d3:	4c 89 f0             	mov    %r14,%rax
0f46   f8e3d6:	49 8b 57 28          	mov    0x28(%r15),%rdx
0f4a   f8e3da:	48 c1 e8 03          	shr    $0x3,%rax
0f4e   f8e3de:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0f52   f8e3e2:	0f 85 76 06 00 00    	jne    f8ea5e <apply_dir_move+0x15ce>
0f58   f8e3e8:	49 8b 77 20          	mov    0x20(%r15),%rsi
0f5c   f8e3ec:	48 89 df             	mov    %rbx,%rdi
0f5f   f8e3ef:	e8 6c ab ff ff       	call   f88f60 <send_utimes>
0f64   f8e3f4:	85 c0                	test   %eax,%eax
0f66   f8e3f6:	0f 88 67 01 00 00    	js     f8e563 <apply_dir_move+0x10d3>
0f6c   f8e3fc:	4c 89 fa             	mov    %r15,%rdx
0f6f   f8e3ff:	48 c1 ea 03          	shr    $0x3,%rdx
0f73   f8e403:	80 3c 2a 00          	cmpb   $0x0,(%rdx,%rbp,1)
0f77   f8e407:	0f 85 3c 06 00 00    	jne    f8ea49 <apply_dir_move+0x15b9>
0f7d   f8e40d:	4d 8b 3f             	mov    (%r15),%r15
0f80   f8e410:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
0f85   f8e415:	0f 84 48 01 00 00    	je     f8e563 <apply_dir_move+0x10d3>
0f8b   f8e41b:	4d 8d 77 20          	lea    0x20(%r15),%r14
0f8f   f8e41f:	4c 89 f0             	mov    %r14,%rax
0f92   f8e422:	48 c1 e8 03          	shr    $0x3,%rax
0f96   f8e426:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0f9a   f8e42a:	0f 85 5d 06 00 00    	jne    f8ea8d <apply_dir_move+0x15fd>
0fa0   f8e430:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
0fa5   f8e435:	49 8b 77 20          	mov    0x20(%r15),%rsi
0fa9   f8e439:	0f 85 36 06 00 00    	jne    f8ea75 <apply_dir_move+0x15e5>
0faf   f8e43f:	48 8b 7b 40          	mov    0x40(%rbx),%rdi
0fb3   f8e443:	31 d2                	xor    %edx,%edx
0fb5   f8e445:	e8 96 04 ff ff       	call   f7e8e0 <get_inode_info>
0fba   f8e44a:	83 f8 fe             	cmp    $0xfffffffe,%eax
0fbd   f8e44d:	0f 85 63 ff ff ff    	jne    f8e3b6 <apply_dir_move+0xf26>
0fc3   f8e453:	31 c0                	xor    %eax,%eax
0fc5   f8e455:	eb a5                	jmp    f8e3fc <apply_dir_move+0xf6c>
0fc7   f8e457:	0f 83 ee 01 00 00    	jae    f8e64b <apply_dir_move+0x11bb>
0fcd   f8e45d:	49 8d 7e 08          	lea    0x8(%r14),%rdi
0fd1   f8e461:	48 89 f8             	mov    %rdi,%rax
0fd4   f8e464:	48 c1 e8 03          	shr    $0x3,%rax
0fd8   f8e468:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0fdd   f8e46d:	0f 84 ea fc ff ff    	je     f8e15d <apply_dir_move+0xccd>
0fe3   f8e473:	e8 00 00 00 00       	call   f8e478 <apply_dir_move+0xfe8>	f8e474: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fe8   f8e478:	e9 e0 fc ff ff       	jmp    f8e15d <apply_dir_move+0xccd>
0fed   f8e47d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ff7   f8e487:	49 8d 7d 18          	lea    0x18(%r13),%rdi
0ffb   f8e48b:	48 89 fa             	mov    %rdi,%rdx
0ffe   f8e48e:	48 c1 ea 03          	shr    $0x3,%rdx
1002   f8e492:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
1006   f8e496:	84 c0                	test   %al,%al
1008   f8e498:	74 08                	je     f8e4a2 <apply_dir_move+0x1012>
100a   f8e49a:	3c 01                	cmp    $0x1,%al
100c   f8e49c:	0f 8e b1 03 00 00    	jle    f8e853 <apply_dir_move+0x13c3>
1012   f8e4a2:	41 0f b7 45 18       	movzwl 0x18(%r13),%eax
1017   f8e4a7:	4c 89 ea             	mov    %r13,%rdx
101a   f8e4aa:	48 c1 ea 03          	shr    $0x3,%rdx
101e   f8e4ae:	25 ff 7f 00 00       	and    $0x7fff,%eax
1023   f8e4b3:	4d 8d 64 04 ff       	lea    -0x1(%r12,%rax,1),%r12
1028   f8e4b8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1032   f8e4c2:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1036   f8e4c6:	0f 85 5c 05 00 00    	jne    f8ea28 <apply_dir_move+0x1598>
103c   f8e4cc:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1041   f8e4d1:	4d 89 65 00          	mov    %r12,0x0(%r13)
1045   f8e4d5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
104f   f8e4df:	48 c1 ea 03          	shr    $0x3,%rdx
1053   f8e4e3:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1057   f8e4e7:	0f 85 2c 05 00 00    	jne    f8ea19 <apply_dir_move+0x1589>
105d   f8e4ed:	4c 89 e2             	mov    %r12,%rdx
1060   f8e4f0:	4d 89 65 08          	mov    %r12,0x8(%r13)
1064   f8e4f4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
106e   f8e4fe:	48 c1 ea 03          	shr    $0x3,%rdx
1072   f8e502:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
1076   f8e506:	4c 89 e2             	mov    %r12,%rdx
1079   f8e509:	83 e2 07             	and    $0x7,%edx
107c   f8e50c:	38 d0                	cmp    %dl,%al
107e   f8e50e:	0f 8f 1c fb ff ff    	jg     f8e030 <apply_dir_move+0xba0>
1084   f8e514:	84 c0                	test   %al,%al
1086   f8e516:	0f 84 14 fb ff ff    	je     f8e030 <apply_dir_move+0xba0>
108c   f8e51c:	4c 89 e7             	mov    %r12,%rdi
108f   f8e51f:	e8 00 00 00 00       	call   f8e524 <apply_dir_move+0x1094>	f8e520: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
1094   f8e524:	e9 07 fb ff ff       	jmp    f8e030 <apply_dir_move+0xba0>
1099   f8e529:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
10a1   f8e531:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
10a9   f8e539:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
10b1   f8e541:	e8 00 00 00 00       	call   f8e546 <apply_dir_move+0x10b6>	f8e542: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
10b6   f8e546:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
10be   f8e54e:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
10c6   f8e556:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
10ce   f8e55e:	e9 f7 f3 ff ff       	jmp    f8d95a <apply_dir_move+0x4ca>
10d3   f8e563:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
10d9   f8e569:	41 89 c7             	mov    %eax,%r15d
10dc   f8e56c:	0f 84 f7 fb ff ff    	je     f8e169 <apply_dir_move+0xcd9>
10e2   f8e572:	4c 89 ed             	mov    %r13,%rbp
10e5   f8e575:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
10ea   f8e57a:	49 8d 45 10          	lea    0x10(%r13),%rax
10ee   f8e57e:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
10f3   f8e583:	e9 49 f5 ff ff       	jmp    f8dad1 <apply_dir_move+0x641>
10f8   f8e588:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
1100   f8e590:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
1108   f8e598:	e8 00 00 00 00       	call   f8e59d <apply_dir_move+0x110d>	f8e599: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
110d   f8e59d:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
1115   f8e5a5:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
111d   f8e5ad:	e9 04 f4 ff ff       	jmp    f8d9b6 <apply_dir_move+0x526>
1122   f8e5b2:	41 bf f4 ff ff ff    	mov    $0xfffffff4,%r15d
1128   f8e5b8:	e9 ce f5 ff ff       	jmp    f8db8b <apply_dir_move+0x6fb>
112d   f8e5bd:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
1135   f8e5c5:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
113d   f8e5cd:	e8 00 00 00 00       	call   f8e5d2 <apply_dir_move+0x1142>	f8e5ce: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1142   f8e5d2:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
114a   f8e5da:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
1152   f8e5e2:	e9 ee f3 ff ff       	jmp    f8d9d5 <apply_dir_move+0x545>
1157   f8e5e7:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
115f   f8e5ef:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
1167   f8e5f7:	e8 00 00 00 00       	call   f8e5fc <apply_dir_move+0x116c>	f8e5f8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
116c   f8e5fc:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
1174   f8e604:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
117c   f8e60c:	e9 19 f6 ff ff       	jmp    f8dc2a <apply_dir_move+0x79a>
1181   f8e611:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1189   f8e619:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
1191   f8e621:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
1199   f8e629:	e8 00 00 00 00       	call   f8e62e <apply_dir_move+0x119e>	f8e62a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
119e   f8e62e:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
11a6   f8e636:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
11ae   f8e63e:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
11b6   f8e646:	e9 2e f3 ff ff       	jmp    f8d979 <apply_dir_move+0x4e9>
11bb   f8e64b:	48 8b 94 24 80 00 00 00 	mov    0x80(%rsp),%rdx
11c3   f8e653:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
11cd   f8e65d:	48 c1 ea 03          	shr    $0x3,%rdx
11d1   f8e661:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
11d5   f8e665:	0f 85 bf 02 00 00    	jne    f8e92a <apply_dir_move+0x149a>
11db   f8e66b:	48 8b 8b 80 00 00 00 	mov    0x80(%rbx),%rcx
11e2   f8e672:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
11e7   f8e677:	48 89 ea             	mov    %rbp,%rdx
11ea   f8e67a:	48 89 df             	mov    %rbx,%rdi
11ed   f8e67d:	e8 ce 18 ff ff       	call   f7ff50 <can_rmdir>
11f2   f8e682:	41 89 c7             	mov    %eax,%r15d
11f5   f8e685:	85 c0                	test   %eax,%eax
11f7   f8e687:	0f 88 dc fa ff ff    	js     f8e169 <apply_dir_move+0xcd9>
11fd   f8e68d:	0f 84 61 fc ff ff    	je     f8e2f4 <apply_dir_move+0xe64>
1203   f8e693:	e8 e8 f7 fe ff       	call   f7de80 <fs_path_alloc>
1208   f8e698:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
120d   f8e69d:	49 89 c6             	mov    %rax,%r14
1210   f8e6a0:	48 85 c0             	test   %rax,%rax
1213   f8e6a3:	0f 84 ba fa ff ff    	je     f8e163 <apply_dir_move+0xcd3>
1219   f8e6a9:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
121e   f8e6ae:	48 89 c1             	mov    %rax,%rcx
1221   f8e6b1:	48 89 ea             	mov    %rbp,%rdx
1224   f8e6b4:	48 89 df             	mov    %rbx,%rdi
1227   f8e6b7:	e8 94 7b ff ff       	call   f86250 <get_cur_path>
122c   f8e6bc:	41 89 c7             	mov    %eax,%r15d
122f   f8e6bf:	85 c0                	test   %eax,%eax
1231   f8e6c1:	0f 88 ab fe ff ff    	js     f8e572 <apply_dir_move+0x10e2>
1237   f8e6c7:	4c 89 f6             	mov    %r14,%rsi
123a   f8e6ca:	48 89 df             	mov    %rbx,%rdi
123d   f8e6cd:	e8 6e 48 ff ff       	call   f82f40 <send_rmdir>
1242   f8e6d2:	41 89 c7             	mov    %eax,%r15d
1245   f8e6d5:	85 c0                	test   %eax,%eax
1247   f8e6d7:	0f 88 95 fe ff ff    	js     f8e572 <apply_dir_move+0x10e2>
124d   f8e6dd:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
1252   f8e6e2:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
1257   f8e6e7:	48 c1 e0 2a          	shl    $0x2a,%rax
125b   f8e6eb:	48 c1 ea 03          	shr    $0x3,%rdx
125f   f8e6ef:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
1263   f8e6f3:	74 0a                	je     f8e6ff <apply_dir_move+0x126f>
1265   f8e6f5:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
126a   f8e6fa:	e8 00 00 00 00       	call   f8e6ff <apply_dir_move+0x126f>	f8e6fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
126f   f8e6ff:	48 8b 04 24          	mov    (%rsp),%rax
1273   f8e703:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
1278   f8e708:	4c 8b 60 38          	mov    0x38(%rax),%r12
127c   f8e70c:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
1281   f8e711:	48 c1 ea 03          	shr    $0x3,%rdx
1285   f8e715:	48 c1 e0 2a          	shl    $0x2a,%rax
1289   f8e719:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
128d   f8e71d:	74 0a                	je     f8e729 <apply_dir_move+0x1299>
128f   f8e71f:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1294   f8e724:	e8 00 00 00 00       	call   f8e729 <apply_dir_move+0x1299>	f8e725: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1299   f8e729:	4c 8b 34 24          	mov    (%rsp),%r14
129d   f8e72d:	4c 89 e2             	mov    %r12,%rdx
12a0   f8e730:	48 89 df             	mov    %rbx,%rdi
12a3   f8e733:	49 8b 76 30          	mov    0x30(%r14),%rsi
12a7   f8e737:	e8 24 a8 ff ff       	call   f88f60 <send_utimes>
12ac   f8e73c:	41 89 c7             	mov    %eax,%r15d
12af   f8e73f:	85 c0                	test   %eax,%eax
12b1   f8e741:	0f 88 2b fe ff ff    	js     f8e572 <apply_dir_move+0x10e2>
12b7   f8e747:	49 8d 46 40          	lea    0x40(%r14),%rax
12bb   f8e74b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
12c0   f8e750:	48 c1 e8 03          	shr    $0x3,%rax
12c4   f8e754:	48 89 c2             	mov    %rax,%rdx
12c7   f8e757:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
12cc   f8e75c:	48 c1 e0 2a          	shl    $0x2a,%rax
12d0   f8e760:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
12d4   f8e764:	74 0a                	je     f8e770 <apply_dir_move+0x12e0>
12d6   f8e766:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
12db   f8e76b:	e8 00 00 00 00       	call   f8e770 <apply_dir_move+0x12e0>	f8e76c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12e0   f8e770:	48 8b 04 24          	mov    (%rsp),%rax
12e4   f8e774:	4c 8b 60 40          	mov    0x40(%rax),%r12
12e8   f8e778:	4c 39 64 24 08       	cmp    %r12,0x8(%rsp)
12ed   f8e77d:	0f 85 11 fc ff ff    	jne    f8e394 <apply_dir_move+0xf04>
12f3   f8e783:	e9 ea fd ff ff       	jmp    f8e572 <apply_dir_move+0x10e2>
12f8   f8e788:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1300   f8e790:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
1308   f8e798:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
1310   f8e7a0:	e8 00 00 00 00       	call   f8e7a5 <apply_dir_move+0x1315>	f8e7a1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1315   f8e7a5:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
131d   f8e7ad:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
1325   f8e7b5:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
132d   f8e7bd:	e9 86 f4 ff ff       	jmp    f8dc48 <apply_dir_move+0x7b8>
1332   f8e7c2:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
133a   f8e7ca:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
1342   f8e7d2:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
134a   f8e7da:	e8 00 00 00 00       	call   f8e7df <apply_dir_move+0x134f>	f8e7db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
134f   f8e7df:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
1357   f8e7e7:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
135f   f8e7ef:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
1367   f8e7f7:	e9 0a f4 ff ff       	jmp    f8dc06 <apply_dir_move+0x776>
136c   f8e7fc:	49 8d 45 19          	lea    0x19(%r13),%rax
1370   f8e800:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
1375   f8e805:	49 8d 45 10          	lea    0x10(%r13),%rax
1379   f8e809:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
137e   f8e80e:	49 8d 45 08          	lea    0x8(%r13),%rax
1382   f8e812:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
1387   f8e817:	e9 4a f7 ff ff       	jmp    f8df66 <apply_dir_move+0xad6>
138c   f8e81c:	e8 00 00 00 00       	call   f8e821 <apply_dir_move+0x1391>	f8e81d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1391   f8e821:	e9 e3 ed ff ff       	jmp    f8d609 <apply_dir_move+0x179>
1396   f8e826:	e8 00 00 00 00       	call   f8e82b <apply_dir_move+0x139b>	f8e827: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
139b   f8e82b:	e9 b8 ed ff ff       	jmp    f8d5e8 <apply_dir_move+0x158>
13a0   f8e830:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
13a5   f8e835:	e8 00 00 00 00       	call   f8e83a <apply_dir_move+0x13aa>	f8e836: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
13aa   f8e83a:	e9 c2 f7 ff ff       	jmp    f8e001 <apply_dir_move+0xb71>
13af   f8e83f:	e8 00 00 00 00       	call   f8e844 <apply_dir_move+0x13b4>	f8e840: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13b4   f8e844:	e9 14 f9 ff ff       	jmp    f8e15d <apply_dir_move+0xccd>
13b9   f8e849:	e8 00 00 00 00       	call   f8e84e <apply_dir_move+0x13be>	f8e84a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13be   f8e84e:	e9 72 fa ff ff       	jmp    f8e2c5 <apply_dir_move+0xe35>
13c3   f8e853:	e8 00 00 00 00       	call   f8e858 <apply_dir_move+0x13c8>	f8e854: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
13c8   f8e858:	e9 45 fc ff ff       	jmp    f8e4a2 <apply_dir_move+0x1012>
13cd   f8e85d:	e8 00 00 00 00       	call   f8e862 <apply_dir_move+0x13d2>	f8e85e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13d2   f8e862:	e9 a3 f9 ff ff       	jmp    f8e20a <apply_dir_move+0xd7a>
13d7   f8e867:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
13dc   f8e86c:	e8 00 00 00 00       	call   f8e871 <apply_dir_move+0x13e1>	f8e86d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
13e1   f8e871:	e9 4c ef ff ff       	jmp    f8d7c2 <apply_dir_move+0x332>
13e6   f8e876:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
13eb   f8e87b:	e8 00 00 00 00       	call   f8e880 <apply_dir_move+0x13f0>	f8e87c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13f0   f8e880:	e9 6c ef ff ff       	jmp    f8d7f1 <apply_dir_move+0x361>
13f5   f8e885:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
13fa   f8e88a:	e8 00 00 00 00       	call   f8e88f <apply_dir_move+0x13ff>	f8e88b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13ff   f8e88f:	e9 25 ed ff ff       	jmp    f8d5b9 <apply_dir_move+0x129>
1404   f8e894:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1409   f8e899:	e8 00 00 00 00       	call   f8e89e <apply_dir_move+0x140e>	f8e89a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
140e   f8e89e:	e9 77 ee ff ff       	jmp    f8d71a <apply_dir_move+0x28a>
1413   f8e8a3:	e8 00 00 00 00       	call   f8e8a8 <apply_dir_move+0x1418>	f8e8a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1418   f8e8a8:	e9 2e ee ff ff       	jmp    f8d6db <apply_dir_move+0x24b>
141d   f8e8ad:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
1422   f8e8b2:	e8 00 00 00 00       	call   f8e8b7 <apply_dir_move+0x1427>	f8e8b3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1427   f8e8b7:	e9 32 f2 ff ff       	jmp    f8daee <apply_dir_move+0x65e>
142c   f8e8bc:	e8 00 00 00 00       	call   f8e8c1 <apply_dir_move+0x1431>	f8e8bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1431   f8e8c1:	e9 bd ed ff ff       	jmp    f8d683 <apply_dir_move+0x1f3>
1436   f8e8c6:	e8 00 00 00 00       	call   f8e8cb <apply_dir_move+0x143b>	f8e8c7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
143b   f8e8cb:	e9 59 ed ff ff       	jmp    f8d629 <apply_dir_move+0x199>
1440   f8e8d0:	e8 00 00 00 00       	call   f8e8d5 <apply_dir_move+0x1445>	f8e8d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1445   f8e8d5:	e9 52 f2 ff ff       	jmp    f8db2c <apply_dir_move+0x69c>
144a   f8e8da:	e8 00 00 00 00       	call   f8e8df <apply_dir_move+0x144f>	f8e8db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
144f   f8e8df:	e9 8d f2 ff ff       	jmp    f8db71 <apply_dir_move+0x6e1>
1454   f8e8e4:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
1459   f8e8e9:	e8 00 00 00 00       	call   f8e8ee <apply_dir_move+0x145e>	f8e8ea: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
145e   f8e8ee:	e9 b5 f2 ff ff       	jmp    f8dba8 <apply_dir_move+0x718>
1463   f8e8f3:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1468   f8e8f8:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
146d   f8e8fd:	e8 00 00 00 00       	call   f8e902 <apply_dir_move+0x1472>	f8e8fe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1472   f8e902:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1477   f8e907:	e9 0a ef ff ff       	jmp    f8d816 <apply_dir_move+0x386>
147c   f8e90c:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1481   f8e911:	e8 00 00 00 00       	call   f8e916 <apply_dir_move+0x1486>	f8e912: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1486   f8e916:	e9 6f ec ff ff       	jmp    f8d58a <apply_dir_move+0xfa>
148b   f8e91b:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
1490   f8e920:	e8 00 00 00 00       	call   f8e925 <apply_dir_move+0x1495>	f8e921: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1495   f8e925:	e9 08 ec ff ff       	jmp    f8d532 <apply_dir_move+0xa2>
149a   f8e92a:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
14a2   f8e932:	e8 00 00 00 00       	call   f8e937 <apply_dir_move+0x14a7>	f8e933: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14a7   f8e937:	e9 2f fd ff ff       	jmp    f8e66b <apply_dir_move+0x11db>
14ac   f8e93c:	4c 89 ef             	mov    %r13,%rdi
14af   f8e93f:	e8 00 00 00 00       	call   f8e944 <apply_dir_move+0x14b4>	f8e940: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
14b4   f8e944:	e9 97 f6 ff ff       	jmp    f8dfe0 <apply_dir_move+0xb50>
14b9   f8e949:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
14be   f8e94e:	e8 00 00 00 00       	call   f8e953 <apply_dir_move+0x14c3>	f8e94f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14c3   f8e953:	e9 60 f6 ff ff       	jmp    f8dfb8 <apply_dir_move+0xb28>
14c8   f8e958:	e8 00 00 00 00       	call   f8e95d <apply_dir_move+0x14cd>	f8e959: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14cd   f8e95d:	e9 2b f8 ff ff       	jmp    f8e18d <apply_dir_move+0xcfd>
14d2   f8e962:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
14d7   f8e967:	e8 00 00 00 00       	call   f8e96c <apply_dir_move+0x14dc>	f8e968: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14dc   f8e96c:	e9 06 f7 ff ff       	jmp    f8e077 <apply_dir_move+0xbe7>
14e1   f8e971:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
14e6   f8e976:	e8 00 00 00 00       	call   f8e97b <apply_dir_move+0x14eb>	f8e977: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14eb   f8e97b:	e9 d2 f6 ff ff       	jmp    f8e052 <apply_dir_move+0xbc2>
14f0   f8e980:	e8 00 00 00 00       	call   f8e985 <apply_dir_move+0x14f5>	f8e981: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14f5   f8e985:	e9 d3 f5 ff ff       	jmp    f8df5d <apply_dir_move+0xacd>
14fa   f8e98a:	e8 00 00 00 00       	call   f8e98f <apply_dir_move+0x14ff>	f8e98b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
14ff   f8e98f:	e9 84 f5 ff ff       	jmp    f8df18 <apply_dir_move+0xa88>
1504   f8e994:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
1509   f8e999:	e8 00 00 00 00       	call   f8e99e <apply_dir_move+0x150e>	f8e99a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
150e   f8e99e:	e9 d5 f9 ff ff       	jmp    f8e378 <apply_dir_move+0xee8>
1513   f8e9a3:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
1518   f8e9a8:	e8 00 00 00 00       	call   f8e9ad <apply_dir_move+0x151d>	f8e9a9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
151d   f8e9ad:	e9 84 f9 ff ff       	jmp    f8e336 <apply_dir_move+0xea6>
1522   f8e9b2:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1527   f8e9b7:	e8 00 00 00 00       	call   f8e9bc <apply_dir_move+0x152c>	f8e9b8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
152c   f8e9bc:	e9 50 f9 ff ff       	jmp    f8e311 <apply_dir_move+0xe81>
1531   f8e9c1:	e8 00 00 00 00       	call   f8e9c6 <apply_dir_move+0x1536>	f8e9c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1536   f8e9c6:	e9 4d f7 ff ff       	jmp    f8e118 <apply_dir_move+0xc88>
153b   f8e9cb:	e8 00 00 00 00       	call   f8e9d0 <apply_dir_move+0x1540>	f8e9cc: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1540   f8e9d0:	e9 8d f8 ff ff       	jmp    f8e262 <apply_dir_move+0xdd2>
1545   f8e9d5:	49 8d 7d 10          	lea    0x10(%r13),%rdi
1549   f8e9d9:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
154e   f8e9de:	48 89 fa             	mov    %rdi,%rdx
1551   f8e9e1:	48 c1 e0 2a          	shl    $0x2a,%rax
1555   f8e9e5:	48 c1 ea 03          	shr    $0x3,%rdx
1559   f8e9e9:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
155d   f8e9ed:	74 05                	je     f8e9f4 <apply_dir_move+0x1564>
155f   f8e9ef:	e8 00 00 00 00       	call   f8e9f4 <apply_dir_move+0x1564>	f8e9f0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1564   f8e9f4:	49 8b 7d 10          	mov    0x10(%r13),%rdi
1568   f8e9f8:	49 8d 45 1a          	lea    0x1a(%r13),%rax
156c   f8e9fc:	48 39 c7             	cmp    %rax,%rdi
156f   f8e9ff:	74 05                	je     f8ea06 <apply_dir_move+0x1576>
1571   f8ea01:	e8 00 00 00 00       	call   f8ea06 <apply_dir_move+0x1576>	f8ea02: R_X86_64_PLT32	kfree-0x4
1576   f8ea06:	4c 89 ef             	mov    %r13,%rdi
1579   f8ea09:	41 bf f4 ff ff ff    	mov    $0xfffffff4,%r15d
157f   f8ea0f:	e8 00 00 00 00       	call   f8ea14 <apply_dir_move+0x1584>	f8ea10: R_X86_64_PLT32	kfree-0x4
1584   f8ea14:	e9 72 f1 ff ff       	jmp    f8db8b <apply_dir_move+0x6fb>
1589   f8ea19:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
158e   f8ea1e:	e8 00 00 00 00       	call   f8ea23 <apply_dir_move+0x1593>	f8ea1f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1593   f8ea23:	e9 c5 fa ff ff       	jmp    f8e4ed <apply_dir_move+0x105d>
1598   f8ea28:	4c 89 ef             	mov    %r13,%rdi
159b   f8ea2b:	e8 00 00 00 00       	call   f8ea30 <apply_dir_move+0x15a0>	f8ea2c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
15a0   f8ea30:	e9 97 fa ff ff       	jmp    f8e4cc <apply_dir_move+0x103c>
15a5   f8ea35:	e8 00 00 00 00       	call   f8ea3a <apply_dir_move+0x15aa>	f8ea36: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
15aa   f8ea3a:	e9 4b f8 ff ff       	jmp    f8e28a <apply_dir_move+0xdfa>
15af   f8ea3f:	e8 00 00 00 00       	call   f8ea44 <apply_dir_move+0x15b4>	f8ea40: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15b4   f8ea44:	e9 8a f9 ff ff       	jmp    f8e3d3 <apply_dir_move+0xf43>
15b9   f8ea49:	4c 89 ff             	mov    %r15,%rdi
15bc   f8ea4c:	89 44 24 18          	mov    %eax,0x18(%rsp)
15c0   f8ea50:	e8 00 00 00 00       	call   f8ea55 <apply_dir_move+0x15c5>	f8ea51: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15c5   f8ea55:	8b 44 24 18          	mov    0x18(%rsp),%eax
15c9   f8ea59:	e9 af f9 ff ff       	jmp    f8e40d <apply_dir_move+0xf7d>
15ce   f8ea5e:	4c 89 f7             	mov    %r14,%rdi
15d1   f8ea61:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
15d6   f8ea66:	e8 00 00 00 00       	call   f8ea6b <apply_dir_move+0x15db>	f8ea67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15db   f8ea6b:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
15e0   f8ea70:	e9 73 f9 ff ff       	jmp    f8e3e8 <apply_dir_move+0xf58>
15e5   f8ea75:	48 8b 3c 24          	mov    (%rsp),%rdi
15e9   f8ea79:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
15ee   f8ea7e:	e8 00 00 00 00       	call   f8ea83 <apply_dir_move+0x15f3>	f8ea7f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15f3   f8ea83:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
15f8   f8ea88:	e9 b2 f9 ff ff       	jmp    f8e43f <apply_dir_move+0xfaf>
15fd   f8ea8d:	4c 89 f7             	mov    %r14,%rdi
1600   f8ea90:	e8 00 00 00 00       	call   f8ea95 <apply_dir_move+0x1605>	f8ea91: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1605   f8ea95:	e9 96 f9 ff ff       	jmp    f8e430 <apply_dir_move+0xfa0>
160a   f8ea9a:	e8 00 00 00 00       	call   f8ea9f <apply_dir_move+0x160f>	f8ea9b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
160f   f8ea9f:	e9 97 f6 ff ff       	jmp    f8e13b <apply_dir_move+0xcab>
1614   f8eaa4:	e8 00 00 00 00       	call   f8eaa9 <apply_dir_move+0x1619>	f8eaa5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1619   f8eaa9:	e9 33 f6 ff ff       	jmp    f8e0e1 <apply_dir_move+0xc51>
161e   f8eaae:	e8 00 00 00 00       	call   f8eab3 <apply_dir_move+0x1623>	f8eaaf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1623   f8eab3:	e9 83 f4 ff ff       	jmp    f8df3b <apply_dir_move+0xaab>
1628   f8eab8:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
162d   f8eabd:	e8 00 00 00 00       	call   f8eac2 <apply_dir_move+0x1632>	f8eabe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1632   f8eac2:	e9 1f f4 ff ff       	jmp    f8dee6 <apply_dir_move+0xa56>
1637   f8eac7:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
163c   f8eacc:	e8 00 00 00 00       	call   f8ead1 <apply_dir_move+0x1641>	f8eacd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1641   f8ead1:	e9 eb f3 ff ff       	jmp    f8dec1 <apply_dir_move+0xa31>
1646   f8ead6:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
164b   f8eadb:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
1650   f8eae0:	89 44 24 10          	mov    %eax,0x10(%rsp)
1654   f8eae4:	e8 00 00 00 00       	call   f8eae9 <apply_dir_move+0x1659>	f8eae5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1659   f8eae9:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
165e   f8eaee:	8b 44 24 10          	mov    0x10(%rsp),%eax
1662   f8eaf2:	e9 7b f3 ff ff       	jmp    f8de72 <apply_dir_move+0x9e2>
1667   f8eaf7:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
166c   f8eafc:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
1671   f8eb01:	89 44 24 10          	mov    %eax,0x10(%rsp)
1675   f8eb05:	e8 00 00 00 00       	call   f8eb0a <apply_dir_move+0x167a>	f8eb06: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
167a   f8eb0a:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
167f   f8eb0f:	8b 44 24 10          	mov    0x10(%rsp),%eax
1683   f8eb13:	e9 35 f3 ff ff       	jmp    f8de4d <apply_dir_move+0x9bd>
1688   f8eb18:	48 89 c7             	mov    %rax,%rdi
168b   f8eb1b:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1693   f8eb23:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
169b   f8eb2b:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
16a3   f8eb33:	e8 00 00 00 00       	call   f8eb38 <apply_dir_move+0x16a8>	f8eb34: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
16a8   f8eb38:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
16b0   f8eb40:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
16b8   f8eb48:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
16c0   f8eb50:	e9 ce ed ff ff       	jmp    f8d923 <apply_dir_move+0x493>
16c5   f8eb55:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
16ca   f8eb5a:	44 89 84 24 90 00 00 00 	mov    %r8d,0x90(%rsp)
16d2   f8eb62:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
16da   f8eb6a:	e8 00 00 00 00       	call   f8eb6f <apply_dir_move+0x16df>	f8eb6b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16df   f8eb6f:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
16e7   f8eb77:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
16ef   f8eb7f:	e9 b5 ed ff ff       	jmp    f8d939 <apply_dir_move+0x4a9>
16f4   f8eb84:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
16f9   f8eb89:	e8 00 00 00 00       	call   f8eb8e <apply_dir_move+0x16fe>	f8eb8a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16fe   f8eb8e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
1703   f8eb93:	e9 b7 eb ff ff       	jmp    f8d74f <apply_dir_move+0x2bf>
1708   f8eb98:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
1710   f8eba0:	e8 00 00 00 00       	call   f8eba5 <apply_dir_move+0x1715>	f8eba1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1715   f8eba5:	e9 f0 eb ff ff       	jmp    f8d79a <apply_dir_move+0x30a>
171a   f8ebaa:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
171f   f8ebaf:	e8 00 00 00 00       	call   f8ebb4 <apply_dir_move+0x1724>	f8ebb0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1724   f8ebb4:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
1729   f8ebb9:	e9 a0 ee ff ff       	jmp    f8da5e <apply_dir_move+0x5ce>
172e   f8ebbe:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
1733   f8ebc3:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
173b   f8ebcb:	e8 00 00 00 00       	call   f8ebd0 <apply_dir_move+0x1740>	f8ebcc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1740   f8ebd0:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
1748   f8ebd8:	e9 b8 ed ff ff       	jmp    f8d995 <apply_dir_move+0x505>
174d   f8ebdd:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1752   f8ebe2:	44 89 84 24 90 00 00 00 	mov    %r8d,0x90(%rsp)
175a   f8ebea:	48 89 94 24 88 00 00 00 	mov    %rdx,0x88(%rsp)
1762   f8ebf2:	e8 00 00 00 00       	call   f8ebf7 <apply_dir_move+0x1767>	f8ebf3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1767   f8ebf7:	44 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%r8d
176f   f8ebff:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
1777   f8ec07:	e9 b2 ec ff ff       	jmp    f8d8be <apply_dir_move+0x42e>
177c   f8ec0c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
1781   f8ec11:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1789   f8ec19:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
1791   f8ec21:	88 8c 24 88 00 00 00 	mov    %cl,0x88(%rsp)
1798   f8ec28:	e8 00 00 00 00       	call   f8ec2d <apply_dir_move+0x179d>	f8ec29: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
179d   f8ec2d:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
17a5   f8ec35:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
17ad   f8ec3d:	0f b6 8c 24 88 00 00 00 	movzbl 0x88(%rsp),%ecx
17b5   f8ec45:	e9 84 ec ff ff       	jmp    f8d8ce <apply_dir_move+0x43e>
17ba   f8ec4a:	4c 89 ff             	mov    %r15,%rdi
17bd   f8ec4d:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
17c5   f8ec55:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
17cd   f8ec5d:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
17d5   f8ec65:	e8 00 00 00 00       	call   f8ec6a <apply_dir_move+0x17da>	f8ec66: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
17da   f8ec6a:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
17e2   f8ec72:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
17ea   f8ec7a:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
17f2   f8ec82:	e9 64 ec ff ff       	jmp    f8d8eb <apply_dir_move+0x45b>
17f7   f8ec87:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
17fc   f8ec8c:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1804   f8ec94:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
180c   f8ec9c:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
1814   f8eca4:	e8 00 00 00 00       	call   f8eca9 <apply_dir_move+0x1819>	f8eca5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1819   f8eca9:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
1821   f8ecb1:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
1829   f8ecb9:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
1831   f8ecc1:	e9 3b ec ff ff       	jmp    f8d901 <apply_dir_move+0x471>
1836   f8ecc6:	e8 00 00 00 00       	call   f8eccb <apply_dir_move+0x183b>	f8ecc7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
183b   f8eccb:	e9 3e f0 ff ff       	jmp    f8dd0e <apply_dir_move+0x87e>
1840   f8ecd0:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1848   f8ecd8:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
1850   f8ece0:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
1858   f8ece8:	e8 00 00 00 00       	call   f8eced <apply_dir_move+0x185d>	f8ece9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
185d   f8eced:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
1865   f8ecf5:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
186d   f8ecfd:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
1875   f8ed05:	e9 4b f0 ff ff       	jmp    f8dd55 <apply_dir_move+0x8c5>
187a   f8ed0a:	4c 89 ff             	mov    %r15,%rdi
187d   f8ed0d:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
1885   f8ed15:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
188d   f8ed1d:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
1895   f8ed25:	e8 00 00 00 00       	call   f8ed2a <apply_dir_move+0x189a>	f8ed26: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
189a   f8ed2a:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
18a2   f8ed32:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
18aa   f8ed3a:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
18b2   f8ed42:	e9 2f f0 ff ff       	jmp    f8dd76 <apply_dir_move+0x8e6>
18b7   f8ed47:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
18bc   f8ed4c:	44 89 84 24 9c 00 00 00 	mov    %r8d,0x9c(%rsp)
18c4   f8ed54:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
18cc   f8ed5c:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
18d4   f8ed64:	e8 00 00 00 00       	call   f8ed69 <apply_dir_move+0x18d9>	f8ed65: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
18d9   f8ed69:	44 8b 84 24 9c 00 00 00 	mov    0x9c(%rsp),%r8d
18e1   f8ed71:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
18e9   f8ed79:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
18f1   f8ed81:	e9 06 f0 ff ff       	jmp    f8dd8c <apply_dir_move+0x8fc>
18f6   f8ed86:	e8 00 00 00 00       	call   f8ed8b <apply_dir_move+0x18fb>	f8ed87: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
18fb   f8ed8b:	e9 1d e9 ff ff       	jmp    f8d6ad <apply_dir_move+0x21d>
0000 0000000000067f43 <apply_dir_move.cold>:
0000    67f43:	ba da 0d 00 00       	mov    $0xdda,%edx
0005    67f48:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	67f4b: R_X86_64_32S	.rodata+0x28a4c0
000c    67f4f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	67f52: R_X86_64_32S	.rodata+0x28abe0
0013    67f56:	e8 00 00 00 00       	call   67f5b <apply_dir_move.cold+0x18>	67f57: R_X86_64_PLT32	btrfs_assertfail-0x4
0018    67f5b:	e9 00 00 00 00       	jmp    67f60 <apply_dir_move.cold+0x1d>	67f5c: R_X86_64_PC32	.text+0xf8de1c
001d    67f60:	bf 20 00 00 00       	mov    $0x20,%edi
0022    67f65:	e8 00 00 00 00       	call   67f6a <apply_dir_move.cold+0x27>	67f66: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0027    67f6a:	48 8b 04 25 20 00 00 00 	mov    0x20,%rax
002f    67f72:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0034    67f77:	48 b8 05 00 00 00 00 fc ff df 	movabs $0xdffffc0000000005,%rax
003e    67f81:	80 38 00             	cmpb   $0x0,(%rax)
0041    67f84:	74 0a                	je     67f90 <apply_dir_move.cold+0x4d>
0043    67f86:	bf 28 00 00 00       	mov    $0x28,%edi
0048    67f8b:	e8 00 00 00 00       	call   67f90 <apply_dir_move.cold+0x4d>	67f8c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
004d    67f90:	48 8b 04 25 28 00 00 00 	mov    0x28,%rax
0055    67f98:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
005a    67f9d:	a0 06 00 00 00 00 fc ff df 	movabs 0xdffffc0000000006,%al
0063    67fa6:	84 c0                	test   %al,%al
0065    67fa8:	74 02                	je     67fac <apply_dir_move.cold+0x69>
0067    67faa:	7e 14                	jle    67fc0 <apply_dir_move.cold+0x7d>
0069    67fac:	0f b6 04 25 30 00 00 00 	movzbl 0x30,%eax
0071    67fb4:	88 84 24 9b 00 00 00 	mov    %al,0x9b(%rsp)
0078    67fbb:	e9 00 00 00 00       	jmp    67fc0 <apply_dir_move.cold+0x7d>	67fbc: R_X86_64_PC32	.text+0xf8d6f9
007d    67fc0:	bf 30 00 00 00       	mov    $0x30,%edi
0082    67fc5:	e8 00 00 00 00       	call   67fca <apply_dir_move.cold+0x87>	67fc6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0087    67fca:	eb e0                	jmp    67fac <apply_dir_move.cold+0x69>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
