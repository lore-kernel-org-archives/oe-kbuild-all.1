Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD2242910
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114292; cv=none; b=GLVYvgqNxNJUdYDDLotQf/wO6CAg52sfiIlKzA7Cyi45OnA0nbDb1TWZIZyndRlZ0pmB2tABR0/nnQyW77Rjymr/h1vyPugyGpLr0a26UnuNTb4muPEV28UMkDO+Lgje1Q+UN5M0VawOClnNc28bDNwf62jJayWzlahlGBWIlBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114292; c=relaxed/simple;
	bh=DlWPojRUYuKQMKLitrIhTOoPDcoSMwAX8nvTZpMyKUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IIRz2Hjp30RMdi6r4e5mP9EUdYiErM5LXRXve7TZi6UyQmTlTeVYg71reHXz6NYkQFCfdo7UDlb0o6bbFMh9Pemew+xNS0Kvoei9onvbiKWR5K4YGFsjQdobTCxK1vg5rgou3PUqWq2XB15pxgx3juqIXQvKsggo3oV6qLPIc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLdogQnI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLdogQnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788114289; x=1819650289;
  h=date:from:to:cc:subject:message-id;
  bh=DlWPojRUYuKQMKLitrIhTOoPDcoSMwAX8nvTZpMyKUQ=;
  b=nLdogQnIMdyhqCvLEGQ0ctVgza7egjbIx+yOTEJjZ2axSgCXC2dlJtRv
   79aAuGyIl83UF08BVL6S0JXbQL9n5oU4V1wjpNYwsa64ps9e2urLJrOFX
   EJF0b+jiDSyfXWU5KUpblFcrnYQRdcFgawpmiT4JCoo+H4BDM0hWjgp7Z
   GQqMTX+sSVyx7yUob0dkrGE38YbyZUwprb2I/zhv7dS3lQWuIGJzXqmHn
   QaYCbUjBdWdU7W9fMC05gHeXa0ohK/D6dLXCM0Q7EDoDQK+KXpzPolnID
   OVVWtEQUPH7VdEi0xBb0vf+yQLeyq7H+j4/LoPqq0YXj2l2HLNvAUs+5g
   g==;
X-CSE-ConnectionGUID: wv0XDeFoRWqyNeapTiaIxg==
X-CSE-MsgGUID: cHov2PVRRMGzQh2z+0JAzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88406391"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88406391"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 11:24:49 -0700
X-CSE-ConnectionGUID: IvgvLScCRjeVaCR7FEujqw==
X-CSE-MsgGUID: 169RxWTCTDO8MynXvnX7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262483579"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2026 11:24:45 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0kCt-00000000E9Y-1EEl;
	Sun, 30 Aug 2026 18:24:40 +0000
Date: Mon, 31 Aug 2026 02:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/kelvin_subpage 21/22] WARNING: modpost:
 vmlinux: section mismatch in reference: filemap_unaccount_folio+0x338
 (section: .text.filemap_unaccount_folio) -> task_iter_init (section:
 .init.text)
Message-ID: <202608310236.uXxkLfk8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/kelvin_subpage
head:   c1bd92d1f34a6b496c203d87db044e61059c28ae
commit: 4ec08172d9f6b1739a6f7a5d82bdceac9d9cffa6 [21/22] f2fs: support fscrypt on subpage block filesystems
config: mips-randconfig-r052-20260830 (https://download.01.org/0day-ci/archive/20260831/202608310236.uXxkLfk8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 52774473867e49b5891ab9381accf4e5a3ce0024)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310236.uXxkLfk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310236.uXxkLfk8-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: 0x1958 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1958 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1960 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1960 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1968 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1968 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1970 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1970 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1978 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1978 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1980 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1980 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1988 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1988 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1990 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1990 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1998 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1998 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x19a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x19a0 references non-executable section '.debug_str'
>> WARNING: modpost: vmlinux: section mismatch in reference: filemap_unaccount_folio+0x338 (section: .text.filemap_unaccount_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: replace_page_cache_folio+0x208 (section: .text.replace_page_cache_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __filemap_add_folio+0x5e8 (section: .text.__filemap_add_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: folio_end_writeback+0xa4 (section: .text.folio_end_writeback) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: splice_folio_into_pipe+0x17c (section: .text.splice_folio_into_pipe) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: filemap_map_pages+0x264 (section: .text.filemap_map_pages) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: filemap_map_pages+0x4ac (section: .text.filemap_map_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: filemap_map_pages+0x6f8 (section: .text.filemap_map_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: filemap_map_pages+0x710 (section: .text.filemap_map_pages) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: read_pages+0x1cc (section: .text.read_pages) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __folio_batch_add_and_move+0xa0 (section: .text.__folio_batch_add_and_move) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: folio_isolate_lru+0x290 (section: .text.folio_isolate_lru) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: shmem_add_to_page_cache+0x43c (section: .text.shmem_add_to_page_cache) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: shmem_add_to_page_cache+0x44c (section: .text.shmem_add_to_page_cache) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: try_grab_folio+0x2c8 (section: .text.try_grab_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_grab_folio+0x2d8 (section: .text.try_grab_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_grab_folio+0x2ec (section: .text.try_grab_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: folio_add_pin+0x2ec (section: .text.folio_add_pin) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: folio_add_pin+0x300 (section: .text.folio_add_pin) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: copy_page_range+0x15b4 (section: .text.copy_page_range) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_page_range+0x15cc (section: .text.copy_page_range) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: copy_page_range+0x15fc (section: .text.copy_page_range) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: map_anon_folio_pte_nopf+0x1fc (section: .text.map_anon_folio_pte_nopf) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: finish_fault+0x6e4 (section: .text.finish_fault) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: handle_mm_fault+0x23a0 (section: .text.handle_mm_fault) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: handle_mm_fault+0x23f4 (section: .text.handle_mm_fault) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: insert_page_into_pte_locked+0x50c (section: .text.insert_page_into_pte_locked) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mlock_folio+0x20c (section: .text.mlock_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mlock_new_folio+0x1fc (section: .text.mlock_new_folio) -> task_iter_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: munlock_folio+0x16c (section: .text.munlock_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: special_mapping_fault+0x334 (section: .text.special_mapping_fault) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __page_frag_alloc_align+0x2e4 (section: .text.__page_frag_alloc_align) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: madvise_cold_or_pageout_pte_range+0x684 (section: .text.madvise_cold_or_pageout_pte_range) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: madvise_free_pte_range+0x6c8 (section: .text.madvise_free_pte_range) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: remove_migration_pte+0x67c (section: .text.remove_migration_pte) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __folio_migrate_mapping+0x604 (section: .text.__folio_migrate_mapping) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: migrate_huge_page_move_mapping+0x208 (section: .text.migrate_huge_page_move_mapping) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __migrate_folio+0x1b0 (section: .text.__migrate_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: generic_pipe_buf_get+0x18c (section: .text.generic_pipe_buf_get) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bdev_getblk+0x468 (section: .text.bdev_getblk) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: create_empty_buffers+0x184 (section: .text.create_empty_buffers) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: aio_migrate_folio+0x214 (section: .text.aio_migrate_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ifs_alloc+0x1b4 (section: .text.ifs_alloc) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: iomap_write_begin+0xb64 (section: .text.iomap_write_begin) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_mb_load_buddy_gfp+0x808 (section: .text.ext4_mb_load_buddy_gfp) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_mb_use_best_found+0x198 (section: .text.ext4_mb_use_best_found) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_mb_use_best_found+0x1a8 (section: .text.ext4_mb_use_best_found) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_mb_free_metadata+0x440 (section: .text.ext4_mb_free_metadata) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_mb_free_metadata+0x454 (section: .text.ext4_mb_free_metadata) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: jbd2_journal_commit_transaction+0x1688 (section: .text.jbd2_journal_commit_transaction) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: jffs2_garbage_collect_thread+0x394 (section: .text.jffs2_garbage_collect_thread) -> bpf_map_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: metapage_migrate_folio+0x388 (section: .text.metapage_migrate_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __get_metapage+0x3d4 (section: .text.__get_metapage) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: grab_metapage+0xd0 (section: .text.grab_metapage) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: force_metapage+0x144 (section: .text.force_metapage) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: metapage_write_one+0x164 (section: .text.metapage_write_one) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: put_metapage+0xb0 (section: .text.put_metapage) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: txLock+0x668 (section: .text.txLock) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_folio_extent_mapped+0xdc (section: .text.set_folio_extent_mapped) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: attach_extent_buffer_folio+0x224 (section: .text.attach_extent_buffer_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: attach_extent_buffer_folio+0x238 (section: .text.attach_extent_buffer_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_attach_folio_state+0x158 (section: .text.btrfs_attach_folio_state) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_init_inode_metadata+0x4bc (section: .text.f2fs_init_inode_metadata) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_defragment_range+0x580 (section: .text.f2fs_defragment_range) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __exchange_data_block+0xd64 (section: .text.__exchange_data_block) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: redirty_blocks+0x3b0 (section: .text.redirty_blocks) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_dirty_meta_folio+0x2d8 (section: .text.f2fs_dirty_meta_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_update_dirty_folio+0x2e4 (section: .text.f2fs_update_dirty_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_garbage_collect+0x1ad4 (section: .text.do_garbage_collect) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_garbage_collect+0x1ae8 (section: .text.do_garbage_collect) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_garbage_collect+0x2840 (section: .text.do_garbage_collect) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ffs_find_or_alloc+0x39c (section: .text.ffs_find_or_alloc) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_write_data_pages+0x1424 (section: .text.f2fs_write_data_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_write_data_pages+0x18bc (section: .text.f2fs_write_data_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_write_begin+0x104c (section: .text.f2fs_write_begin) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_write_end+0x5ac (section: .text.f2fs_write_end) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_fsync_node_pages+0x3e8 (section: .text.f2fs_fsync_node_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_wait_on_node_pages_writeback+0x100 (section: .text.f2fs_wait_on_node_pages_writeback) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_dirty_node_folio+0x2d8 (section: .text.f2fs_dirty_node_folio) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_add_fsync_node_entry+0x12c (section: .text.f2fs_add_fsync_node_entry) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_compress_write_end+0x170 (section: .text.f2fs_compress_write_end) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: f2fs_set_compressed_page+0xbc (section: .text.f2fs_set_compressed_page) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: folio_set_f2fs_data+0x100 (section: .text.folio_set_f2fs_data) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __iov_iter_get_pages_alloc+0x234 (section: .text.__iov_iter_get_pages_alloc) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __iov_iter_get_pages_alloc+0x5a8 (section: .text.__iov_iter_get_pages_alloc) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __iov_iter_get_pages_alloc+0xa20 (section: .text.__iov_iter_get_pages_alloc) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: test_free_pages+0x398 (section: .text.test_free_pages) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fb_deferred_io_fault+0x4c0 (section: .text.fb_deferred_io_fault) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pipe_to_sg+0x440 (section: .text.pipe_to_sg) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_fbdev_shmem_get_page+0x4fc (section: .text.drm_fbdev_shmem_get_page) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sg_vma_fault+0x37c (section: .text.sg_vma_fault) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: msc_mmap_fault+0x4d8 (section: .text.msc_mmap_fault) -> task_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: snd_pcm_mmap_data_fault+0x474 (section: .text.snd_pcm_mmap_data_fault) -> task_iter_init (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
