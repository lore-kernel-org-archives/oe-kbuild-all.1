Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979281F2C44
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 18:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748196256; cv=none; b=OhM3PK0/VygpoSrPG2JkieAZTg0aYDMDyeYg3Nn9DG/ZLpGJPW/GBQIP4x9eQY5BKhbG7RxdS99FgGUp4e+zvWt5RH6OTRwnGO8Pr51gr8B4QUHzzMmG5ilkILB1unZqj/JtO6T9R9GyhH5dvnAdTqa/ua9c/YPHabR/mj02q7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748196256; c=relaxed/simple;
	bh=KMAEfiL9aM9jSs+eIN3D6723oG4AXAhXX2OSDl8C3Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9L9blpsOBwRtwW7sgnal6MILBGDSIO29F8Bee2dhxC8X0D998ZxmUx0Vwazozx8U80oZ8wW+H5nmJykaSeD2sI3Z1yQI1L35Ci+f8Bxq1yNTDSPH4F6O6hRFU6vj0Tk+zKSOgN+VKMxwN0HY7lGRDSpKteORcXg7FdOJzfv2YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4AEQlPw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4AEQlPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748196254; x=1779732254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMAEfiL9aM9jSs+eIN3D6723oG4AXAhXX2OSDl8C3Y4=;
  b=G4AEQlPwWTiUC8uhmPMMatYJ4LUHhoCRhczb5zo05FNsutwMPsPmXQEI
   VMR0pNjpmh4RUSWRUyEZTdN+/euA8hNgJvNtm3DDr8nHSNbwqbOY16Ol7
   dmulojR43IZcm8s/sCT6lCvhEy1dcZ1rzv6VA3bulye+4U7tb3sYBDWTB
   7Ecs/eQBwQiPZigHGBthctRrkhdVXyAmJS7BlJ8KlgRhbEfQWTV8CIgRa
   ZhY2i7HQIUu00duhQd/fOPo+XKHrsoh84PNb5XPlXiERCl+D24H5mID55
   cuLUzZ/L2+MjMFssAm31LkyuZKbZ1+N2fbL/tOs+hB3JmuAaapoCxu2dI
   A==;
X-CSE-ConnectionGUID: utv3ORMoS+K7tFDwG5Dbyg==
X-CSE-MsgGUID: pfoMB/ACQLeH9d4+mYIqGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60836805"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="60836805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 11:04:11 -0700
X-CSE-ConnectionGUID: NzQ6q+05S0agLpgHVK3maA==
X-CSE-MsgGUID: 8Ih2PDOZSS2UPVIeZ1LV8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="172948892"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 11:04:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJFhf-000Rws-0X;
	Sun, 25 May 2025 18:04:07 +0000
Date: Mon, 26 May 2025 02:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 303/304]
 fs/bcachefs/super.c:933:25: warning: result of comparison of constant 65536
 with expression of type 'u16' (aka 'unsigned short') is always false
Message-ID: <202505260149.ljJgDOQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a65e0ec5d1fc367a41e153f173cc1e5fb78e46b5
commit: feadc56c6a5834a0c2304a7a3b083da03753ba50 [303/304] bcachefs: CLASS(printbuf)
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250526/202505260149.ljJgDOQa-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260149.ljJgDOQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260149.ljJgDOQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/super.c:950:3: error: cannot jump from this goto statement to its label
     950 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
   fs/bcachefs/super.c:936:3: error: cannot jump from this goto statement to its label
     936 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
   fs/bcachefs/super.c:928:3: error: cannot jump from this goto statement to its label
     928 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
   fs/bcachefs/super.c:914:3: error: cannot jump from this goto statement to its label
     914 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
   fs/bcachefs/super.c:908:3: error: cannot jump from this goto statement to its label
     908 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
   fs/bcachefs/super.c:829:3: error: cannot jump from this goto statement to its label
     829 |                 goto out;
         |                 ^
   fs/bcachefs/super.c:953:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
     953 |         CLASS(printbuf, name)();
         |                         ^
>> fs/bcachefs/super.c:933:25: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     933 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   fs/bcachefs/super.c:1884:3: error: cannot jump from this goto statement to its label
    1884 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:1886:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1886 |         guard(rwsem_write)(&c->state_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:89:1: note: expanded from here
      89 | __UNIQUE_ID_guard964
         | ^
   fs/bcachefs/super.c:1879:3: error: cannot jump from this goto statement to its label
    1879 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:1886:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1886 |         guard(rwsem_write)(&c->state_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:89:1: note: expanded from here
      89 | __UNIQUE_ID_guard964
         | ^
   fs/bcachefs/super.c:1874:3: error: cannot jump from this goto statement to its label
    1874 |                 goto err;
         |                 ^
   fs/bcachefs/super.c:1886:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1886 |         guard(rwsem_write)(&c->state_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:89:1: note: expanded from here
      89 | __UNIQUE_ID_guard964
         | ^
   fs/bcachefs/super.c:1868:4: error: cannot jump from this goto statement to its label
    1868 |                         goto err;
         |                         ^
   fs/bcachefs/super.c:1886:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1886 |         guard(rwsem_write)(&c->state_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:89:1: note: expanded from here
      89 | __UNIQUE_ID_guard964
         | ^
   fs/bcachefs/super.c:1854:4: error: cannot jump from this goto statement to its label
    1854 |                         goto err;
         |                         ^
   fs/bcachefs/super.c:1886:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1886 |         guard(rwsem_write)(&c->state_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)


vim +933 fs/bcachefs/super.c

d4d71b58e5139a Kent Overstreet 2025-04-05   818  
a349868b5e2503 Kent Overstreet 2025-04-28   819  static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts *opts,
58c36e6710d3b3 Kent Overstreet 2025-04-03   820  				    bch_sb_handles *sbs)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   821  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16   822  	struct bch_fs *c;
ecf37a4a80ec02 Kent Overstreet 2019-02-14   823  	unsigned i, iter_size;
7be9ab637fb9c5 Chris Webb      2021-11-04   824  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   825  
cb6fc943b650c4 Kent Overstreet 2024-02-01   826  	c = kvmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
7be9ab637fb9c5 Chris Webb      2021-11-04   827  	if (!c) {
65d48e35250fe4 Kent Overstreet 2023-03-14   828  		c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   829  		goto out;
7be9ab637fb9c5 Chris Webb      2021-11-04   830  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16   831  
a349868b5e2503 Kent Overstreet 2025-04-28   832  	c->stdio = (void *)(unsigned long) opts->stdio;
2b41226d7f4b3b Kent Overstreet 2023-12-04   833  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   834  	__module_get(THIS_MODULE);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   835  
505b7a4c2844d8 Kent Overstreet 2020-10-15   836  	closure_init(&c->cl, NULL);
505b7a4c2844d8 Kent Overstreet 2020-10-15   837  
505b7a4c2844d8 Kent Overstreet 2020-10-15   838  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 Kent Overstreet 2020-10-15   839  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   840  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   841  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   842  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e Daniel Hill     2022-03-15   843  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 Kent Overstreet 2020-10-15   844  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   845  	c->minor		= -1;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   846  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   847  
1ada160618d66b Kent Overstreet 2020-06-15   848  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   849  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   850  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   851  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   852  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   853  
63508b756443cb Kent Overstreet 2023-12-06   854  	refcount_set(&c->ro_ref, 1);
63508b756443cb Kent Overstreet 2023-12-06   855  	init_waitqueue_head(&c->ro_ref_wait);
63508b756443cb Kent Overstreet 2023-12-06   856  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   857  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d Kent Overstreet 2017-03-16   858  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   859  
b092dadd55fb24 Kent Overstreet 2018-11-04   860  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 Kent Overstreet 2018-11-04   861  	bch2_fs_allocator_foreground_init(c);
31813dcf379d7f Kent Overstreet 2025-04-05   862  	bch2_fs_btree_cache_init_early(&c->btree_cache);
a17e985be9831b Kent Overstreet 2025-04-05   863  	bch2_fs_btree_gc_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   864  	bch2_fs_btree_interior_update_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   865  	bch2_fs_btree_iter_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   866  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
a17e985be9831b Kent Overstreet 2025-04-05   867  	bch2_fs_btree_write_buffer_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   868  	bch2_fs_copygc_init(c);
84c72755b9aab3 Kent Overstreet 2022-04-09   869  	bch2_fs_ec_init_early(c);
a17e985be9831b Kent Overstreet 2025-04-05   870  	bch2_fs_journal_init_early(&c->journal);
31813dcf379d7f Kent Overstreet 2025-04-05   871  	bch2_fs_journal_keys_init(c);
b9fa375bab2786 Kent Overstreet 2023-03-11   872  	bch2_fs_move_init(c);
a17e985be9831b Kent Overstreet 2025-04-05   873  	bch2_fs_nocow_locking_init_early(c);
31813dcf379d7f Kent Overstreet 2025-04-05   874  	bch2_fs_quota_init(c);
001c1d146f3862 Kent Overstreet 2025-05-09   875  	bch2_fs_recovery_passes_init(c);
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   876  	bch2_fs_sb_errors_init_early(c);
15dbd0d8146356 Kent Overstreet 2025-05-01   877  	bch2_fs_snapshots_init_early(c);
a17e985be9831b Kent Overstreet 2025-04-05   878  	bch2_fs_subvolumes_init_early(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   879  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   880  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   881  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   882  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 Kent Overstreet 2021-03-16   883  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 Kent Overstreet 2023-09-29   884  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   885  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   886  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   887  
5b593ee172bd53 Kent Overstreet 2021-01-26   888  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 Kent Overstreet 2020-03-25   889  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   890  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 Kent Overstreet 2023-10-25   891  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   892  
5e82a9a1f4f82e Kent Overstreet 2019-02-10   893  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e Kent Overstreet 2019-02-10   894  
ef1b20924b0f58 Kent Overstreet 2021-05-18   895  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 Kent Overstreet 2021-05-18   896  
9edbcc72f6987b Kent Overstreet 2023-03-15   897  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b Kent Overstreet 2023-03-15   898  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b Kent Overstreet 2023-03-15   899  
991ba021129088 Kent Overstreet 2021-12-10   900  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 Kent Overstreet 2021-12-10   901  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d Kent Overstreet 2017-03-16   902  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d Kent Overstreet 2017-03-16   903  
fca1223ccfac2a Kent Overstreet 2020-12-03   904  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a Kent Overstreet 2020-12-03   905  
e2b605601ad569 Kent Overstreet 2021-11-05   906  	ret = percpu_init_rwsem(&c->mark_lock);
e2b605601ad569 Kent Overstreet 2021-11-05   907  	if (ret)
73e6ab95640a7d Kent Overstreet 2018-12-01   908  		goto err;
73e6ab95640a7d Kent Overstreet 2018-12-01   909  
0753f0d75f56e8 Kent Overstreet 2025-05-24   910  	scoped_guard(mutex, &c->sb_lock)
e2b605601ad569 Kent Overstreet 2021-11-05   911  		ret = bch2_sb_to_fs(c, sb);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   912  
e2b605601ad569 Kent Overstreet 2021-11-05   913  	if (ret)
e2b605601ad569 Kent Overstreet 2021-11-05   914  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   915  
2430e72f42778a Kent Overstreet 2021-12-04   916  	/* Compat: */
73bd774d28d2b2 Kent Overstreet 2023-07-06   917  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet 2021-12-04   918  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a Kent Overstreet 2021-12-04   919  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a Kent Overstreet 2021-12-04   920  
73bd774d28d2b2 Kent Overstreet 2023-07-06   921  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a Kent Overstreet 2021-12-04   922  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a Kent Overstreet 2021-12-04   923  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a Kent Overstreet 2021-12-04   924  
1c6fdbd8f2465d Kent Overstreet 2017-03-16   925  	c->opts = bch2_opts_default;
8244f3209b5b49 Kent Overstreet 2021-12-14   926  	ret = bch2_opts_from_sb(&c->opts, sb);
8244f3209b5b49 Kent Overstreet 2021-12-14   927  	if (ret)
8244f3209b5b49 Kent Overstreet 2021-12-14   928  		goto err;
8244f3209b5b49 Kent Overstreet 2021-12-14   929  
a349868b5e2503 Kent Overstreet 2025-04-28   930  	bch2_opts_apply(&c->opts, *opts);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   931  
9caea9208fc3fb Kent Overstreet 2025-05-23   932  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9caea9208fc3fb Kent Overstreet 2025-05-23  @933  	    c->opts.block_size > PAGE_SIZE) {
9caea9208fc3fb Kent Overstreet 2025-05-23   934  		bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
9caea9208fc3fb Kent Overstreet 2025-05-23   935  		ret = -EINVAL;
9caea9208fc3fb Kent Overstreet 2025-05-23   936  		goto err;
9caea9208fc3fb Kent Overstreet 2025-05-23   937  	}
9caea9208fc3fb Kent Overstreet 2025-05-23   938  
7c8f6f980dc85f Kent Overstreet 2022-01-12   939  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f Kent Overstreet 2022-01-12   940  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f Kent Overstreet 2022-01-12   941  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 Kent Overstreet 2023-08-27   942  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f Kent Overstreet 2022-01-12   943  
8244f3209b5b49 Kent Overstreet 2021-12-14   944  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d Kent Overstreet 2017-03-16   945  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   946  
7be9ab637fb9c5 Chris Webb      2021-11-04   947  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 Kent Overstreet 2021-11-05   948  		bch_err(c, "fs_alloc fault injected");
e2b605601ad569 Kent Overstreet 2021-11-05   949  		ret = -EFAULT;
1c6fdbd8f2465d Kent Overstreet 2017-03-16   950  		goto err;
7be9ab637fb9c5 Chris Webb      2021-11-04   951  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16   952  
feadc56c6a5834 Kent Overstreet 2025-05-25   953  	CLASS(printbuf, name)();
c02e5b57283ad6 Kent Overstreet 2025-04-02   954  	if (c->sb.multi_device)
58c36e6710d3b3 Kent Overstreet 2025-04-03   955  		pr_uuid(&name, c->sb.user_uuid.b);
58c36e6710d3b3 Kent Overstreet 2025-04-03   956  	else
58c36e6710d3b3 Kent Overstreet 2025-04-03   957  		prt_bdevname(&name, sbs->data[0].bdev);
58c36e6710d3b3 Kent Overstreet 2025-04-03   958  
58c36e6710d3b3 Kent Overstreet 2025-04-03   959  	ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
58c36e6710d3b3 Kent Overstreet 2025-04-03   960  	if (ret)
58c36e6710d3b3 Kent Overstreet 2025-04-03   961  		goto err;
58c36e6710d3b3 Kent Overstreet 2025-04-03   962  
58c36e6710d3b3 Kent Overstreet 2025-04-03   963  	strscpy(c->name, name.buf, sizeof(c->name));
58c36e6710d3b3 Kent Overstreet 2025-04-03   964  
ae2f17d5ad02bc Kent Overstreet 2019-12-14   965  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d Kent Overstreet 2017-03-16   966  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc Kent Overstreet 2019-12-14   967  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d Kent Overstreet 2017-03-16   968  
d4d71b58e5139a Kent Overstreet 2025-04-05   969  	if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
6b83aee8a41b12 Kent Overstreet 2024-01-22   970  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
c9b1d94a2196fc Kent Overstreet 2025-04-18   971  	    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
c9b1d94a2196fc Kent Overstreet 2025-04-18   972  				bch2_writes_disabled) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16   973  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16   974  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d Kent Overstreet 2017-03-16   975  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d Kent Overstreet 2017-03-16   976  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d Kent Overstreet 2017-03-16   977  			BIOSET_NEED_BVECS) ||
5663a4152138fd Kent Overstreet 2018-11-27   978  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
8bb8d683a4013f Kent Overstreet 2023-12-27   979  	    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
5e82a9a1f4f82e Kent Overstreet 2019-02-10   980  	    !(c->online_reserved = alloc_percpu(u64)) ||
cb6fc943b650c4 Kent Overstreet 2024-02-01   981  	    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
ec4edd7b9d2038 Kent Overstreet 2024-01-16   982  				       c->opts.btree_node_size) ||
df448ca355ce84 Kent Overstreet 2024-12-01   983  	    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048)) {
65d48e35250fe4 Kent Overstreet 2023-03-14   984  		ret = -BCH_ERR_ENOMEM_fs_other_alloc;
7be9ab637fb9c5 Chris Webb      2021-11-04   985  		goto err;
7be9ab637fb9c5 Chris Webb      2021-11-04   986  	}
7be9ab637fb9c5 Chris Webb      2021-11-04   987  
31813dcf379d7f Kent Overstreet 2025-04-05   988  	ret =
0499a82b18b5dd Kent Overstreet 2025-04-21   989  	    bch2_fs_async_obj_init(c) ?:
e2b605601ad569 Kent Overstreet 2021-11-05   990  	    bch2_fs_btree_cache_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   991  	    bch2_fs_btree_iter_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   992  	    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   993  	    bch2_fs_buckets_waiting_for_journal_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   994  	    bch2_io_clock_init(&c->io_clock[READ]) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   995  	    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
e2b605601ad569 Kent Overstreet 2021-11-05   996  	    bch2_fs_compress_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   997  	    bch2_fs_counters_init(c) ?:
e2b605601ad569 Kent Overstreet 2021-11-05   998  	    bch2_fs_ec_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05   999  	    bch2_fs_encryption_init(c) ?:
dbbfca9f41e869 Kent Overstreet 2023-08-03  1000  	    bch2_fs_fsio_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1001  	    bch2_fs_fs_io_direct_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1002  	    bch2_fs_io_read_init(c) ?:
96fc7d8adb7881 Kent Overstreet 2025-05-05  1003  	    bch2_fs_rebalance_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1004  	    bch2_fs_sb_errors_init(c) ?:
31813dcf379d7f Kent Overstreet 2025-04-05  1005  	    bch2_fs_vfs_init(c);
7be9ab637fb9c5 Chris Webb      2021-11-04  1006  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1007  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1008  

:::::: The code at line 933 was first introduced by commit
:::::: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
