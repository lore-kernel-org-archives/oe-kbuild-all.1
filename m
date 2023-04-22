Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B785944E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 20:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682195155; x=1713731155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MZIRgDFvGSDGbqFcePrHmsc3+cHUd2fLaaaqZaFwJno=;
  b=NLMJ4j1VvSdkc8PMgM34Pl5/RBncbbbA2UIVjCeODkjv+acdJjTj/seb
   HzZGyv7U0a30k/1b74kvBncqHnA5QwhMbaxU5GOIBdp8ghne02JN7b2i4
   gl8NQHsITJVXr8Ni3wFjg9jS2sQUlUi7+R1hDUi+uf1XE7+rEky/Q0RbW
   Ltf2Y0iV8bEUepaRXXuqpDU3WzCQOHr6gbcI+jMVGRu0q6KN9op1tEvDf
   os9udL1QT5qJykcG8+Imh4d7x+8htgaAn6CqlId4hp8AY72sEOl8fvTxR
   xBP4Q37FxKpV75hxRCfnR5Ye76zMYFryuDjAmagg+ABTt6U4b8yhCLwuw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="326522744"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="326522744"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 13:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="816779079"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="816779079"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2023 13:25:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqJnr-000hU0-2r;
	Sat, 22 Apr 2023 20:25:51 +0000
Date: Sun, 23 Apr 2023 04:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10] f2fs: support errors=remount-ro|continue|panic
 mountoption
Message-ID: <202304230433.F38eIga1-lkp@intel.com>
References: <20230422120754.97345-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422120754.97345-1-chao@kernel.org>

Hi Chao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev next-20230421]
[cannot apply to linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-support-errors-remount-ro-continue-panic-mountoption/20230422-200811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230422120754.97345-1-chao%40kernel.org
patch subject: [PATCH v10] f2fs: support errors=remount-ro|continue|panic mountoption
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e9d2110ffe178cd6c5499b8f126190d25f2061a0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chao-Yu/f2fs-support-errors-remount-ro-continue-panic-mountoption/20230422-200811
        git checkout e9d2110ffe178cd6c5499b8f126190d25f2061a0
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230433.F38eIga1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/f2fs.rst:359: WARNING: Unexpected indentation.

vim +359 Documentation/filesystems/f2fs.rst

   106	
   107	
   108	======================== ============================================================
   109	background_gc=%s	 Turn on/off cleaning operations, namely garbage
   110				 collection, triggered in background when I/O subsystem is
   111				 idle. If background_gc=on, it will turn on the garbage
   112				 collection and if background_gc=off, garbage collection
   113				 will be turned off. If background_gc=sync, it will turn
   114				 on synchronous garbage collection running in background.
   115				 Default value for this option is on. So garbage
   116				 collection is on by default.
   117	gc_merge		 When background_gc is on, this option can be enabled to
   118				 let background GC thread to handle foreground GC requests,
   119				 it can eliminate the sluggish issue caused by slow foreground
   120				 GC operation when GC is triggered from a process with limited
   121				 I/O and CPU resources.
   122	nogc_merge		 Disable GC merge feature.
   123	disable_roll_forward	 Disable the roll-forward recovery routine
   124	norecovery		 Disable the roll-forward recovery routine, mounted read-
   125				 only (i.e., -o ro,disable_roll_forward)
   126	discard/nodiscard	 Enable/disable real-time discard in f2fs, if discard is
   127				 enabled, f2fs will issue discard/TRIM commands when a
   128				 segment is cleaned.
   129	no_heap			 Disable heap-style segment allocation which finds free
   130				 segments for data from the beginning of main area, while
   131				 for node from the end of main area.
   132	nouser_xattr		 Disable Extended User Attributes. Note: xattr is enabled
   133				 by default if CONFIG_F2FS_FS_XATTR is selected.
   134	noacl			 Disable POSIX Access Control List. Note: acl is enabled
   135				 by default if CONFIG_F2FS_FS_POSIX_ACL is selected.
   136	active_logs=%u		 Support configuring the number of active logs. In the
   137				 current design, f2fs supports only 2, 4, and 6 logs.
   138				 Default number is 6.
   139	disable_ext_identify	 Disable the extension list configured by mkfs, so f2fs
   140				 is not aware of cold files such as media files.
   141	inline_xattr		 Enable the inline xattrs feature.
   142	noinline_xattr		 Disable the inline xattrs feature.
   143	inline_xattr_size=%u	 Support configuring inline xattr size, it depends on
   144				 flexible inline xattr feature.
   145	inline_data		 Enable the inline data feature: Newly created small (<~3.4k)
   146				 files can be written into inode block.
   147	inline_dentry		 Enable the inline dir feature: data in newly created
   148				 directory entries can be written into inode block. The
   149				 space of inode block which is used to store inline
   150				 dentries is limited to ~3.4k.
   151	noinline_dentry		 Disable the inline dentry feature.
   152	flush_merge		 Merge concurrent cache_flush commands as much as possible
   153				 to eliminate redundant command issues. If the underlying
   154				 device handles the cache_flush command relatively slowly,
   155				 recommend to enable this option.
   156	nobarrier		 This option can be used if underlying storage guarantees
   157				 its cached data should be written to the novolatile area.
   158				 If this option is set, no cache_flush commands are issued
   159				 but f2fs still guarantees the write ordering of all the
   160				 data writes.
   161	barrier			 If this option is set, cache_flush commands are allowed to be
   162				 issued.
   163	fastboot		 This option is used when a system wants to reduce mount
   164				 time as much as possible, even though normal performance
   165				 can be sacrificed.
   166	extent_cache		 Enable an extent cache based on rb-tree, it can cache
   167				 as many as extent which map between contiguous logical
   168				 address and physical address per inode, resulting in
   169				 increasing the cache hit ratio. Set by default.
   170	noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
   171				 the above extent_cache mount option.
   172	noinline_data		 Disable the inline data feature, inline data feature is
   173				 enabled by default.
   174	data_flush		 Enable data flushing before checkpoint in order to
   175				 persist data of regular and symlink.
   176	reserve_root=%d		 Support configuring reserved space which is used for
   177				 allocation from a privileged user with specified uid or
   178				 gid, unit: 4KB, the default limit is 0.2% of user blocks.
   179	resuid=%d		 The user ID which may use the reserved blocks.
   180	resgid=%d		 The group ID which may use the reserved blocks.
   181	fault_injection=%d	 Enable fault injection in all supported types with
   182				 specified injection rate.
   183	fault_type=%d		 Support configuring fault injection type, should be
   184				 enabled with fault_injection option, fault type value
   185				 is shown below, it supports single or combined type.
   186	
   187				 ===================	  ===========
   188				 Type_Name		  Type_Value
   189				 ===================	  ===========
   190				 FAULT_KMALLOC		  0x000000001
   191				 FAULT_KVMALLOC		  0x000000002
   192				 FAULT_PAGE_ALLOC	  0x000000004
   193				 FAULT_PAGE_GET		  0x000000008
   194				 FAULT_ALLOC_BIO	  0x000000010 (obsolete)
   195				 FAULT_ALLOC_NID	  0x000000020
   196				 FAULT_ORPHAN		  0x000000040
   197				 FAULT_BLOCK		  0x000000080
   198				 FAULT_DIR_DEPTH	  0x000000100
   199				 FAULT_EVICT_INODE	  0x000000200
   200				 FAULT_TRUNCATE		  0x000000400
   201				 FAULT_READ_IO		  0x000000800
   202				 FAULT_CHECKPOINT	  0x000001000
   203				 FAULT_DISCARD		  0x000002000
   204				 FAULT_WRITE_IO		  0x000004000
   205				 FAULT_SLAB_ALLOC	  0x000008000
   206				 FAULT_DQUOT_INIT	  0x000010000
   207				 FAULT_LOCK_OP		  0x000020000
   208				 FAULT_BLKADDR		  0x000040000
   209				 ===================	  ===========
   210	mode=%s			 Control block allocation mode which supports "adaptive"
   211				 and "lfs". In "lfs" mode, there should be no random
   212				 writes towards main area.
   213				 "fragment:segment" and "fragment:block" are newly added here.
   214				 These are developer options for experiments to simulate filesystem
   215				 fragmentation/after-GC situation itself. The developers use these
   216				 modes to understand filesystem fragmentation/after-GC condition well,
   217				 and eventually get some insights to handle them better.
   218				 In "fragment:segment", f2fs allocates a new segment in ramdom
   219				 position. With this, we can simulate the after-GC condition.
   220				 In "fragment:block", we can scatter block allocation with
   221				 "max_fragment_chunk" and "max_fragment_hole" sysfs nodes.
   222				 We added some randomness to both chunk and hole size to make
   223				 it close to realistic IO pattern. So, in this mode, f2fs will allocate
   224				 1..<max_fragment_chunk> blocks in a chunk and make a hole in the
   225				 length of 1..<max_fragment_hole> by turns. With this, the newly
   226				 allocated blocks will be scattered throughout the whole partition.
   227				 Note that "fragment:block" implicitly enables "fragment:segment"
   228				 option for more randomness.
   229				 Please, use these options for your experiments and we strongly
   230				 recommend to re-format the filesystem after using these options.
   231	io_bits=%u		 Set the bit size of write IO requests. It should be set
   232				 with "mode=lfs".
   233	usrquota		 Enable plain user disk quota accounting.
   234	grpquota		 Enable plain group disk quota accounting.
   235	prjquota		 Enable plain project quota accounting.
   236	usrjquota=<file>	 Appoint specified file and type during mount, so that quota
   237	grpjquota=<file>	 information can be properly updated during recovery flow,
   238	prjjquota=<file>	 <quota file>: must be in root directory;
   239	jqfmt=<quota type>	 <quota type>: [vfsold,vfsv0,vfsv1].
   240	offusrjquota		 Turn off user journalled quota.
   241	offgrpjquota		 Turn off group journalled quota.
   242	offprjjquota		 Turn off project journalled quota.
   243	quota			 Enable plain user disk quota accounting.
   244	noquota			 Disable all plain disk quota option.
   245	alloc_mode=%s		 Adjust block allocation policy, which supports "reuse"
   246				 and "default".
   247	fsync_mode=%s		 Control the policy of fsync. Currently supports "posix",
   248				 "strict", and "nobarrier". In "posix" mode, which is
   249				 default, fsync will follow POSIX semantics and does a
   250				 light operation to improve the filesystem performance.
   251				 In "strict" mode, fsync will be heavy and behaves in line
   252				 with xfs, ext4 and btrfs, where xfstest generic/342 will
   253				 pass, but the performance will regress. "nobarrier" is
   254				 based on "posix", but doesn't issue flush command for
   255				 non-atomic files likewise "nobarrier" mount option.
   256	test_dummy_encryption
   257	test_dummy_encryption=%s
   258				 Enable dummy encryption, which provides a fake fscrypt
   259				 context. The fake fscrypt context is used by xfstests.
   260				 The argument may be either "v1" or "v2", in order to
   261				 select the corresponding fscrypt policy version.
   262	checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enable"
   263				 to reenable checkpointing. Is enabled by default. While
   264				 disabled, any unmounting or unexpected shutdowns will cause
   265				 the filesystem contents to appear as they did when the
   266				 filesystem was mounted with that option.
   267				 While mounting with checkpoint=disable, the filesystem must
   268				 run garbage collection to ensure that all available space can
   269				 be used. If this takes too much time, the mount may return
   270				 EAGAIN. You may optionally add a value to indicate how much
   271				 of the disk you would be willing to temporarily give up to
   272				 avoid additional garbage collection. This can be given as a
   273				 number of blocks, or as a percent. For instance, mounting
   274				 with checkpoint=disable:100% would always succeed, but it may
   275				 hide up to all remaining free space. The actual space that
   276				 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
   277				 This space is reclaimed once checkpoint=enable.
   278	checkpoint_merge	 When checkpoint is enabled, this can be used to create a kernel
   279				 daemon and make it to merge concurrent checkpoint requests as
   280				 much as possible to eliminate redundant checkpoint issues. Plus,
   281				 we can eliminate the sluggish issue caused by slow checkpoint
   282				 operation when the checkpoint is done in a process context in
   283				 a cgroup having low i/o budget and cpu shares. To make this
   284				 do better, we set the default i/o priority of the kernel daemon
   285				 to "3", to give one higher priority than other kernel threads.
   286				 This is the same way to give a I/O priority to the jbd2
   287				 journaling thread of ext4 filesystem.
   288	nocheckpoint_merge	 Disable checkpoint merge feature.
   289	compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
   290				 "lz4", "zstd" and "lzo-rle" algorithm.
   291	compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
   292				 "lz4" and "zstd" support compress level config.
   293				 algorithm	level range
   294				 lz4		3 - 16
   295				 zstd		1 - 22
   296	compress_log_size=%u	 Support configuring compress cluster size. The size will
   297				 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
   298	compress_extension=%s	 Support adding specified extension, so that f2fs can enable
   299				 compression on those corresponding files, e.g. if all files
   300				 with '.ext' has high compression rate, we can set the '.ext'
   301				 on compression extension list and enable compression on
   302				 these file by default rather than to enable it via ioctl.
   303				 For other files, we can still enable compression via ioctl.
   304				 Note that, there is one reserved special extension '*', it
   305				 can be set to enable compression for all files.
   306	nocompress_extension=%s	 Support adding specified extension, so that f2fs can disable
   307				 compression on those corresponding files, just contrary to compression extension.
   308				 If you know exactly which files cannot be compressed, you can use this.
   309				 The same extension name can't appear in both compress and nocompress
   310				 extension at the same time.
   311				 If the compress extension specifies all files, the types specified by the
   312				 nocompress extension will be treated as special cases and will not be compressed.
   313				 Don't allow use '*' to specifie all file in nocompress extension.
   314				 After add nocompress_extension, the priority should be:
   315				 dir_flag < comp_extention,nocompress_extension < comp_file_flag,no_comp_file_flag.
   316				 See more in compression sections.
   317	
   318	compress_chksum		 Support verifying chksum of raw data in compressed cluster.
   319	compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
   320				 modes. In "fs" mode (default), f2fs does automatic compression
   321				 on the compression enabled files. In "user" mode, f2fs disables
   322				 the automaic compression and gives the user discretion of
   323				 choosing the target file and the timing. The user can do manual
   324				 compression/decompression on the compression enabled files using
   325				 ioctls.
   326	compress_cache		 Support to use address space of a filesystem managed inode to
   327				 cache compressed block, in order to improve cache hit ratio of
   328				 random read.
   329	inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
   330				 files using the blk-crypto framework rather than
   331				 filesystem-layer encryption. This allows the use of
   332				 inline encryption hardware. The on-disk format is
   333				 unaffected. For more details, see
   334				 Documentation/block/inline-encryption.rst.
   335	atgc			 Enable age-threshold garbage collection, it provides high
   336				 effectiveness and efficiency on background GC.
   337	discard_unit=%s		 Control discard unit, the argument can be "block", "segment"
   338				 and "section", issued discard command's offset/size will be
   339				 aligned to the unit, by default, "discard_unit=block" is set,
   340				 so that small discard functionality is enabled.
   341				 For blkzoned device, "discard_unit=section" will be set by
   342				 default, it is helpful for large sized SMR or ZNS devices to
   343				 reduce memory cost by getting rid of fs metadata supports small
   344				 discard.
   345	memory=%s		 Control memory mode. This supports "normal" and "low" modes.
   346				 "low" mode is introduced to support low memory devices.
   347				 Because of the nature of low memory devices, in this mode, f2fs
   348				 will try to save memory sometimes by sacrificing performance.
   349				 "normal" mode is the default mode and same as before.
   350	age_extent_cache	 Enable an age extent cache based on rb-tree. It records
   351				 data block update frequency of the extent per inode, in
   352				 order to provide better temperature hints for data block
   353				 allocation.
   354	errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
   355				 "panic", "continue" and "remount-ro", respectively, trigger
   356				 panic immediately, continue without doing anything, and remount
   357				 the partition in read-only mode. By default it uses "continue"
   358				 mode.
 > 359				 			continue	remount-ro	panic
   360				 access ops		normal		noraml		N/A
   361				 syscall errors		-EIO		-EROFS		N/A
   362				 mount option		rw		ro		N/A
   363				 pending dir write	keep		keep		N/A
   364				 pending non-dir write	drop		keep		N/A
   365				 pending node write	drop		keep		N/A
   366				 pending meta write	keep		keep		N/A
   367	======================== ============================================================
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
