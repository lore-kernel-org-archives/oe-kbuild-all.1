Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F6DDD4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690738910; x=1722274910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Xy15xdZB09DpFKAgnlMQN5iWT7WX+IVS2v/zX1UFPE=;
  b=lAnZOvPNB2tR2Bau0Noc9/j45PpY6K51bxNM85HYmQtGCn1QK56cnlP8
   rpuDGXgyxWHkI6wEivw6dUIa2Yf2rqeIFoCy6/SVvC89buA1E3lWiKAQr
   ANYsmcDaUtbWXF2rEz55VRqPM7lX5iBCZR5sf8hWj6QOfZpzai4mp9Bdg
   l2gGIvSu1jHgg4REcyHBLr/6aQwdQ/drR80iB+LtM4IgtyHFqs9x1j9rz
   jhTjp4Trc0o4YivV6HvOpduuNnRu/iJqiRaLX7p7OFZGrfRFlL/Vjjyug
   CO6pQRu01MTq7H9/ALKV1unC3jtkRT67gfX5A7DtHMbFOFawgNEGbHGKK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="368874351"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="368874351"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 10:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678076893"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="678076893"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 10:41:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQAQN-0004id-23;
	Sun, 30 Jul 2023 17:41:47 +0000
Date: Mon, 31 Jul 2023 01:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 4/8] fs/f2fs/file.c:323:17: error: implicit
 declaration of function 'stat_inc_cp_call_count'; did you mean
 'stat_inc_gc_call_count'?
Message-ID: <202307310148.sWNKb0Qe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   e116872fdeb425635580ffa6b237b96c39bc6611
commit: 1a73e225829f7724fcac9191f47e4ac41c6ef2e3 [4/8] f2fs: fix to account cp stats correctly
config: i386-randconfig-i011-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310148.sWNKb0Qe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310148.sWNKb0Qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310148.sWNKb0Qe-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/file.c: In function 'f2fs_do_sync_file':
>> fs/f2fs/file.c:323:17: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
     323 |                 stat_inc_cp_call_count(sbi, FOREGROUND);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 stat_inc_gc_call_count
   cc1: some warnings being treated as errors
--
   fs/f2fs/namei.c: In function 'f2fs_create':
>> fs/f2fs/namei.c:387:17: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
     387 |                 stat_inc_cp_call_count(sbi, FOREGROUND);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 stat_inc_gc_call_count
   cc1: some warnings being treated as errors
--
   fs/f2fs/super.c: In function 'f2fs_put_super':
>> fs/f2fs/super.c:1604:17: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
    1604 |                 stat_inc_cp_call_count(sbi, FOREGROUND);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 stat_inc_gc_call_count
   cc1: some warnings being treated as errors
--
   fs/f2fs/recovery.c: In function 'f2fs_recover_fsync_data':
>> fs/f2fs/recovery.c:927:25: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
     927 |                         stat_inc_cp_call_count(sbi, FOREGROUND);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         stat_inc_gc_call_count
   cc1: some warnings being treated as errors
--
   fs/f2fs/gc.c: In function 'f2fs_gc':
>> fs/f2fs/gc.c:1843:25: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
    1843 |                         stat_inc_cp_call_count(sbi, FOREGROUND);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         stat_inc_gc_call_count
   cc1: some warnings being treated as errors
--
   fs/f2fs/segment.c: In function 'f2fs_balance_fs_bg':
>> fs/f2fs/segment.c:516:9: error: implicit declaration of function 'stat_inc_cp_call_count'; did you mean 'stat_inc_gc_call_count'? [-Werror=implicit-function-declaration]
     516 |         stat_inc_cp_call_count(sbi, from_bg ? BACKGROUND : FOREGROUND);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         stat_inc_gc_call_count
   cc1: some warnings being treated as errors


vim +323 fs/f2fs/file.c

   244	
   245	static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
   246							int datasync, bool atomic)
   247	{
   248		struct inode *inode = file->f_mapping->host;
   249		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   250		nid_t ino = inode->i_ino;
   251		int ret = 0;
   252		enum cp_reason_type cp_reason = 0;
   253		struct writeback_control wbc = {
   254			.sync_mode = WB_SYNC_ALL,
   255			.nr_to_write = LONG_MAX,
   256			.for_reclaim = 0,
   257		};
   258		unsigned int seq_id = 0;
   259	
   260		if (unlikely(f2fs_readonly(inode->i_sb)))
   261			return 0;
   262	
   263		trace_f2fs_sync_file_enter(inode);
   264	
   265		if (S_ISDIR(inode->i_mode))
   266			goto go_write;
   267	
   268		/* if fdatasync is triggered, let's do in-place-update */
   269		if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
   270			set_inode_flag(inode, FI_NEED_IPU);
   271		ret = file_write_and_wait_range(file, start, end);
   272		clear_inode_flag(inode, FI_NEED_IPU);
   273	
   274		if (ret || is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
   275			trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
   276			return ret;
   277		}
   278	
   279		/* if the inode is dirty, let's recover all the time */
   280		if (!f2fs_skip_inode_update(inode, datasync)) {
   281			f2fs_write_inode(inode, NULL);
   282			goto go_write;
   283		}
   284	
   285		/*
   286		 * if there is no written data, don't waste time to write recovery info.
   287		 */
   288		if (!is_inode_flag_set(inode, FI_APPEND_WRITE) &&
   289				!f2fs_exist_written_data(sbi, ino, APPEND_INO)) {
   290	
   291			/* it may call write_inode just prior to fsync */
   292			if (need_inode_page_update(sbi, ino))
   293				goto go_write;
   294	
   295			if (is_inode_flag_set(inode, FI_UPDATE_WRITE) ||
   296					f2fs_exist_written_data(sbi, ino, UPDATE_INO))
   297				goto flush_out;
   298			goto out;
   299		} else {
   300			/*
   301			 * for OPU case, during fsync(), node can be persisted before
   302			 * data when lower device doesn't support write barrier, result
   303			 * in data corruption after SPO.
   304			 * So for strict fsync mode, force to use atomic write semantics
   305			 * to keep write order in between data/node and last node to
   306			 * avoid potential data corruption.
   307			 */
   308			if (F2FS_OPTION(sbi).fsync_mode ==
   309					FSYNC_MODE_STRICT && !atomic)
   310				atomic = true;
   311		}
   312	go_write:
   313		/*
   314		 * Both of fdatasync() and fsync() are able to be recovered from
   315		 * sudden-power-off.
   316		 */
   317		f2fs_down_read(&F2FS_I(inode)->i_sem);
   318		cp_reason = need_do_checkpoint(inode);
   319		f2fs_up_read(&F2FS_I(inode)->i_sem);
   320	
   321		if (cp_reason) {
   322			/* all the dirty node pages should be flushed for POR */
 > 323			stat_inc_cp_call_count(sbi, FOREGROUND);
   324			ret = f2fs_sync_fs(inode->i_sb, 1);
   325	
   326			/*
   327			 * We've secured consistency through sync_fs. Following pino
   328			 * will be used only for fsynced inodes after checkpoint.
   329			 */
   330			try_to_fix_pino(inode);
   331			clear_inode_flag(inode, FI_APPEND_WRITE);
   332			clear_inode_flag(inode, FI_UPDATE_WRITE);
   333			goto out;
   334		}
   335	sync_nodes:
   336		atomic_inc(&sbi->wb_sync_req[NODE]);
   337		ret = f2fs_fsync_node_pages(sbi, inode, &wbc, atomic, &seq_id);
   338		atomic_dec(&sbi->wb_sync_req[NODE]);
   339		if (ret)
   340			goto out;
   341	
   342		/* if cp_error was enabled, we should avoid infinite loop */
   343		if (unlikely(f2fs_cp_error(sbi))) {
   344			ret = -EIO;
   345			goto out;
   346		}
   347	
   348		if (f2fs_need_inode_block_update(sbi, ino)) {
   349			f2fs_mark_inode_dirty_sync(inode, true);
   350			f2fs_write_inode(inode, NULL);
   351			goto sync_nodes;
   352		}
   353	
   354		/*
   355		 * If it's atomic_write, it's just fine to keep write ordering. So
   356		 * here we don't need to wait for node write completion, since we use
   357		 * node chain which serializes node blocks. If one of node writes are
   358		 * reordered, we can see simply broken chain, resulting in stopping
   359		 * roll-forward recovery. It means we'll recover all or none node blocks
   360		 * given fsync mark.
   361		 */
   362		if (!atomic) {
   363			ret = f2fs_wait_on_node_pages_writeback(sbi, seq_id);
   364			if (ret)
   365				goto out;
   366		}
   367	
   368		/* once recovery info is written, don't need to tack this */
   369		f2fs_remove_ino_entry(sbi, ino, APPEND_INO);
   370		clear_inode_flag(inode, FI_APPEND_WRITE);
   371	flush_out:
   372		if ((!atomic && F2FS_OPTION(sbi).fsync_mode != FSYNC_MODE_NOBARRIER) ||
   373		    (atomic && !test_opt(sbi, NOBARRIER) && f2fs_sb_has_blkzoned(sbi)))
   374			ret = f2fs_issue_flush(sbi, inode->i_ino);
   375		if (!ret) {
   376			f2fs_remove_ino_entry(sbi, ino, UPDATE_INO);
   377			clear_inode_flag(inode, FI_UPDATE_WRITE);
   378			f2fs_remove_ino_entry(sbi, ino, FLUSH_INO);
   379		}
   380		f2fs_update_time(sbi, REQ_TIME);
   381	out:
   382		trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
   383		return ret;
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
