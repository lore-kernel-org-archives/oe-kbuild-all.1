Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E01AB6F1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762604633; cv=none; b=bUIyqivwlEaLD7AOskJ66yMXlSCiL/5H1JyQmWkm9w1HLx51eZt6Bfhlk+9pMtrZqp+hP6M7A27dwkoD+7joJVN+VrOYpX5/bM9GxqnUQABcp7nkrHG8LsbTfA0ECKMq5IfGDIKWpHIE9sZGxfWGCZ/onERCwvOQXHZE3OtzN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762604633; c=relaxed/simple;
	bh=JlDK2o9HYfY2kaS2RyAChzMdN1TtF/Cd0RWBi7o4VvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okpRtvY5vbjZMKBJrQXPu9p/DWWACoNsQq4ady2Un9F89AXXWtwjhQUlhu3IoJIaFoY5p44sWu6eB497xhMMDbQ323YlD6B7HDcy/zcTQYIQJ4f2avMqcM163KBkOcv1TjDAaJnOU0xqZiQkzD1pKJ5CoIL4OCu8TdGFzxjI6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQjpj1Ye; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQjpj1Ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762604631; x=1794140631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlDK2o9HYfY2kaS2RyAChzMdN1TtF/Cd0RWBi7o4VvY=;
  b=lQjpj1Yew6xN833NW2Stf6JorcfEl9diSbE/SW46jbARxAvaKMX7v99E
   pF7dEvoTBA4kBer+IKXaVCbKhdHdiSgrcpcTtqXqPrQ4+/3Wgh9wHT4MP
   0l6dhwGV64nzRhqVA3g96yCf3MsVH9wf7In8I1nwCIGBBc92q46W6B4Nc
   9pCQGt6XN886orT0K64kUUqkFeOG2UENP8D81/1xkmbYg87I1ZYZKoQdy
   9vKXAB74FYrwKEplYyK2xEqsq+Y4fMwQgmP3cPHlNj7IVQfrebyyJoMGH
   VV2I20IPUowM//MONHxLLX5VtvXvD5oP5Ul6aPERgusAsKVJIUcGAgZu7
   w==;
X-CSE-ConnectionGUID: QPOg49izQbWCzfkQZJLRfg==
X-CSE-MsgGUID: 9enJqgktRw6w4XDvd15mag==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="63743759"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="63743759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 04:23:51 -0800
X-CSE-ConnectionGUID: RYFPoGpDSRWGk5Hfbrdbkw==
X-CSE-MsgGUID: bh2zDC7rSviN1J1ul7zowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="193445303"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2025 04:23:44 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHhyn-0000ut-2b;
	Sat, 08 Nov 2025 12:23:41 +0000
Date: Sat, 8 Nov 2025 20:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
	wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
	sshegde@linux.ibm.com, akpm@linux-foundation.org, macro@orcam.me.uk,
	ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
	bigeasy@linutronix.de, segher@kernel.crashing.org,
	thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
	ankur.a.arora@oracle.com, peterz@infradead.org,
	namcao@linutronix.de, tglx@linutronix.de, mingo@kernel.org,
	atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
	coltonlewis@google.com, rppt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <202511082018.EpqTt1zo-lkp@intel.com>
References: <20251102115358.1744304-9-mkchauras@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102115358.1744304-9-mkchauras@linux.ibm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251102-195716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251102115358.1744304-9-mkchauras%40linux.ibm.com
patch subject: [PATCH 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
config: powerpc-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511082018.EpqTt1zo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511082018.EpqTt1zo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511082018.EpqTt1zo-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: init/main.o: in function `do_one_initcall':
>> main.c:(.text+0x2418): undefined reference to `memcpy'
   powerpc-linux-ld: init/initramfs_test.o: in function `initramfs_test_many':
>> initramfs_test.c:(.init.text+0x130): undefined reference to `memset'
   powerpc-linux-ld: init/initramfs_test.o: in function `initramfs_test_hardlink':
   initramfs_test.c:(.init.text+0x5a0): undefined reference to `memset'
   powerpc-linux-ld: init/initramfs_test.o: in function `initramfs_test_csum':
   initramfs_test.c:(.init.text+0x1054): undefined reference to `memset'
   powerpc-linux-ld: init/initramfs_test.o: in function `initramfs_test_fname_overrun':
   initramfs_test.c:(.init.text+0x21dc): undefined reference to `memset'
   powerpc-linux-ld: init/initramfs_test.o: in function `initramfs_test_extract':
   initramfs_test.c:(.init.text+0x2798): undefined reference to `memset'
   powerpc-linux-ld: init/initramfs_test.o:initramfs_test.c:(.init.text+0x27a8): more undefined references to `memset' follow
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `arch_dup_task_struct':
>> process.c:(.text+0x238c): undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `copy_thread':
   process.c:(.text+0x2630): undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/signal.o: in function `do_signal':
>> signal.c:(.text+0xc0): undefined reference to `memset'
>> powerpc-linux-ld: signal.c:(.text+0x62c): undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `register_decrementer_clockevent.constprop.0':
>> time.c:(.text+0xc00): undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `rtc_init':
>> time.c:(.init.text+0x218): undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/mem.o: in function `execmem_arch_setup':
>> mem.c:(.init.text+0x9ec): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
>> fork.c:(.text+0x2f34): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `arch_dup_task_struct':
>> fork.c:(.text+0x4abc): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
   fork.c:(.text+0x5664): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `create_io_thread':
   fork.c:(.text+0xbdc8): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `kernel_thread':
   fork.c:(.text+0xc894): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `user_mode_thread':
   fork.c:(.text+0xc998): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `sys_fork':
   fork.c:(.text+0xca6c): undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o:fork.c:(.text+0xcb14): more undefined references to `memset' follow
   powerpc-linux-ld: kernel/kallsyms.o: in function `__sprint_symbol.isra.0':
>> kallsyms.c:(.text+0x1c38): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/acct.o: in function `acct_collect':
>> acct.c:(.text+0x29fc): undefined reference to `memset'
   powerpc-linux-ld: kernel/cgroup/cgroup.o: in function `features_show':
>> cgroup.c:(.text+0x5ca8): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/trace/trace_events_synth.o: in function `print_synth_event':
>> trace_events_synth.c:(.text+0x347c): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/trace/trace_events_hist.o: in function `hist_trigger_print_val':
>> trace_events_hist.c:(.text+0x1e02c): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/events/core.o: in function `perf_event_namespaces.part.0':
>> core.c:(.text+0xd0d0): undefined reference to `memset'
   powerpc-linux-ld: kernel/events/core.o: in function `perf_event_addr_filters_apply':
   core.c:(.text+0xdc10): undefined reference to `memset'
   powerpc-linux-ld: kernel/events/core.o: in function `perf_event_alloc.part.0':
>> core.c:(.text+0x20450): undefined reference to `memcpy'
   powerpc-linux-ld: kernel/events/core.o: in function `perf_event_mmap':
   core.c:(.text+0x3d584): undefined reference to `memset'
   powerpc-linux-ld: mm/filemap.o: in function `filemap_invalidate_inode':
>> filemap.c:(.text+0x6c60): undefined reference to `memset'
   powerpc-linux-ld: mm/filemap.o: in function `__filemap_fdatawrite_range':
   filemap.c:(.text+0x1022c): undefined reference to `memset'
   powerpc-linux-ld: mm/filemap.o: in function `filemap_splice_read':
   filemap.c:(.text+0x1c0b8): undefined reference to `memset'
   powerpc-linux-ld: mm/oom_kill.o: in function `__oom_reap_task_mm':
>> oom_kill.c:(.text+0x47e8): undefined reference to `memset'
   powerpc-linux-ld: mm/page-writeback.o:page-writeback.c:(.text+0x6640): more undefined references to `memset' follow
   powerpc-linux-ld: fs/exec.o: in function `exec_test_bprm_stack_limits':
>> exec.c:(.text+0x1644): undefined reference to `memcpy'
   powerpc-linux-ld: fs/ioctl.o: in function `ioctl_get_fs_sysfs_path':
   ioctl.c:(.text+0x5b0): undefined reference to `memset'
   powerpc-linux-ld: fs/readdir.o: in function `sys_getdents':
   readdir.c:(.text+0x1d84): undefined reference to `memset'
   powerpc-linux-ld: fs/readdir.o: in function `sys_getdents64':
   readdir.c:(.text+0x20ec): undefined reference to `memset'
   powerpc-linux-ld: fs/inode.o: in function `dump_mapping':
   inode.c:(.text+0xe484): undefined reference to `memset'
   powerpc-linux-ld: fs/seq_file.o: in function `seq_read':
   seq_file.c:(.text+0x54f4): undefined reference to `memset'
   powerpc-linux-ld: fs/fs-writeback.o:fs-writeback.c:(.text+0x1de74): more undefined references to `memset' follow
   powerpc-linux-ld: fs/verity/hash_algs.o: in function `fsverity_hash_block':
   hash_algs.c:(.text+0x808): undefined reference to `memcpy'
   powerpc-linux-ld: fs/binfmt_misc.o: in function `bm_entry_read':
   binfmt_misc.c:(.text+0x9f0): undefined reference to `memcpy'
   powerpc-linux-ld: binfmt_misc.c:(.text+0xdbc): undefined reference to `memcpy'
   powerpc-linux-ld: fs/binfmt_elf.o: in function `elf_core_dump':
   binfmt_elf.c:(.text+0x88e8): undefined reference to `memset'
   powerpc-linux-ld: fs/coredump.o: in function `dump_vma_snapshot':
   coredump.c:(.text+0x1ff4): undefined reference to `memset'
   powerpc-linux-ld: fs/coredump.o: in function `vfs_coredump':
   coredump.c:(.text+0x5614): undefined reference to `memset'
   powerpc-linux-ld: fs/iomap/buffered-io.o: in function `iomap_page_mkwrite':
   buffered-io.c:(.text+0xbec): undefined reference to `memset'
   powerpc-linux-ld: fs/iomap/buffered-io.o: in function `iomap_read_folio':
   buffered-io.c:(.text+0x6608): undefined reference to `memset'
   powerpc-linux-ld: fs/iomap/buffered-io.o:buffered-io.c:(.text+0x6ae0): more undefined references to `memset' follow
   powerpc-linux-ld: crypto/sha512.o: in function `__crypto_sha512_export':
   sha512.c:(.text+0x620): undefined reference to `memcpy'
   powerpc-linux-ld: crypto/sha3_generic.o: in function `crypto_sha3_finup':
   sha3_generic.c:(.text+0x1654): undefined reference to `memset'
   powerpc-linux-ld: sha3_generic.c:(.text+0x17b8): undefined reference to `memset'
   powerpc-linux-ld: crypto/drbg.o: in function `drbg_seed':
   drbg.c:(.text+0x19ec): undefined reference to `memset'
   powerpc-linux-ld: crypto/drbg.o: in function `drbg_kcapi_random':
   drbg.c:(.text+0x2634): undefined reference to `memset'
   powerpc-linux-ld: crypto/jitterentropy-kcapi.o: in function `jent_kcapi_cleanup':
   jitterentropy-kcapi.c:(.text+0x118): undefined reference to `memset'
   powerpc-linux-ld: crypto/jitterentropy-kcapi.o:jitterentropy-kcapi.c:(.text+0xc5c): more undefined references to `memset' follow
   powerpc-linux-ld: block/elevator.o: in function `elv_iosched_show':
   elevator.c:(.text+0x50fc): undefined reference to `memcpy'
   powerpc-linux-ld: elevator.c:(.text+0x5274): undefined reference to `memcpy'
   powerpc-linux-ld: elevator.c:(.text+0x52cc): undefined reference to `memcpy'
   powerpc-linux-ld: block/blk-core.o: in function `blk_alloc_queue':
   blk-core.c:(.text+0xe6d4): undefined reference to `memcpy'
   powerpc-linux-ld: block/blk-sysfs.o: in function `queue_attr_store':
   blk-sysfs.c:(.text+0x3d90): undefined reference to `memcpy'
   powerpc-linux-ld: block/blk-settings.o:blk-settings.c:(.text+0x216c): more undefined references to `memcpy' follow
   powerpc-linux-ld: block/blk-mq.o: in function `blk_mq_alloc_queue':
   blk-mq.c:(.text+0x27528): undefined reference to `memset'
   powerpc-linux-ld: block/genhd.o: in function `__blk_alloc_disk':
   genhd.c:(.text+0x6ea4): undefined reference to `memset'
   powerpc-linux-ld: block/partitions/core.o: in function `check_partition':
   core.c:(.text+0x1b20): undefined reference to `memcpy'
   powerpc-linux-ld: block/blk-rq-qos.o: in function `rq_qos_wait':
   blk-rq-qos.c:(.text+0x1598): undefined reference to `memset'
   powerpc-linux-ld: block/disk-events.o: in function `disk_events_show':
   disk-events.c:(.text+0x17c): undefined reference to `memcpy'
   powerpc-linux-ld: block/disk-events.o: in function `disk_events_poll_msecs_show':
   disk-events.c:(.text+0xd8c): undefined reference to `memcpy'
   powerpc-linux-ld: block/blk-cgroup.o: in function `__blkg_clear_stat':
   blk-cgroup.c:(.text+0x52b0): undefined reference to `memset'
   powerpc-linux-ld: block/blk-cgroup-rwstat.o: in function `blkg_prfill_rwstat':
   blk-cgroup-rwstat.c:(.text+0x430): undefined reference to `memset'
   powerpc-linux-ld: block/blk-integrity.o: in function `flag_store':
   blk-integrity.c:(.text+0x1050): undefined reference to `memcpy'
   powerpc-linux-ld: blk-integrity.c:(.text+0x1060): undefined reference to `memcpy'
   powerpc-linux-ld: block/sed-opal.o: in function `sed_ioctl':
   sed-opal.c:(.text+0x10340): undefined reference to `memcpy'
   powerpc-linux-ld: sed-opal.c:(.text+0x11810): undefined reference to `memset'
   powerpc-linux-ld: io_uring/io_uring.o: in function `sys_io_uring_enter':
   io_uring.c:(.text+0x25670): undefined reference to `memset'
   powerpc-linux-ld: io_uring/msg_ring.o: in function `io_uring_sync_msg_ring':
   msg_ring.c:(.text+0x2068): undefined reference to `memset'
   powerpc-linux-ld: io_uring/register.o: in function `io_register_resize_rings':
   register.c:(.text+0xc4): undefined reference to `memset'
   powerpc-linux-ld: register.c:(.text+0xd4): undefined reference to `memset'
   powerpc-linux-ld: lib/kunit/test.o:test.c:(.text+0x1f04): more undefined references to `memset' follow
   powerpc-linux-ld: lib/lz4/lz4_decompress.o: in function `LZ4_decompress_safe_partial':
   lz4_decompress.c:(.text+0xa60): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0xb00): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0xb10): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0xc1c): undefined reference to `memmove'
   powerpc-linux-ld: lz4_decompress.c:(.text+0xc94): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x1288): undefined reference to `memmove'
   powerpc-linux-ld: lib/lz4/lz4_decompress.o: in function `LZ4_decompress_safe':
   lz4_decompress.c:(.text+0x15c4): undefined reference to `memmove'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x1664): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x1700): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x1710): undefined reference to `memcpy'
   powerpc-linux-ld: lib/lz4/lz4_decompress.o: in function `LZ4_decompress_fast':
   lz4_decompress.c:(.text+0x2a40): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x2ae4): undefined reference to `memcpy'
   powerpc-linux-ld: lib/lz4/lz4_decompress.o:lz4_decompress.c:(.text+0x2af4): more undefined references to `memcpy' follow
   powerpc-linux-ld: lib/lz4/lz4_decompress.o: in function `LZ4_decompress_fast':
   lz4_decompress.c:(.text+0x2c48): undefined reference to `memmove'
   powerpc-linux-ld: lib/lz4/lz4_decompress.o: in function `LZ4_decompress_safe_withPrefix64k':
   lz4_decompress.c:(.text+0x4744): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x47d4): undefined reference to `memcpy'
   powerpc-linux-ld: lz4_decompress.c:(.text+0x47e4): undefined reference to `memcpy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
