Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3376763E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 04:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682914442; x=1714450442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lX5woe59lhKW9/OwiHmb3c4OCfJcv08OYcoFW6uqjAY=;
  b=EMmwIYDse5zZ+ccI5L7WXx4xtZKkX7z5JURdnxYU17bK+yvi8W1m2ZBP
   Yfpz18Oj+meNMLPyEdDO7uPpD5iaIvgK7KiZ8d+dS3WWqf66xFj6Z+tMF
   ghsSL+vdvaKSCVicX85WHHOtMC3NdJVSuZpWc/isw5QLyGHynzpa4Ccvx
   upUALdWV75xiUig1ru8SFEWGN1AWPkx0glRtb3es1peQWNANI4nKGuTpH
   YU6JclJNYui3e1xZRRi6uQe4Rsy/p8tnYezzJXwGJl9I0IftbrmSkx0pw
   U4yfWMzzi58iKZ+yrIWiBdJN4Ik/b/cXl3cazP6PZXWaekT55AjNlCjR8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350154165"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350154165"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 21:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="726222423"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="726222423"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2023 21:13:57 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptKvE-0000IX-2p;
	Mon, 01 May 2023 04:13:56 +0000
Date: Mon, 1 May 2023 12:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.10.y 978/9999] fs/f2fs/super.c:3632:9: warning:
 'memcpy' reading 16 bytes from a region of size 0
Message-ID: <202305011207.BV7FBLHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   f1b32fda06d2cfb8eea9680b0ba7a8b0d5b81eeb
commit: a49e402f23096d21362b25d7224206a45288072a [978/9999] f2fs: fix to reserve space for IO align feature
config: ia64-randconfig-r021-20230430 (https://download.01.org/0day-ci/archive/20230501/202305011207.BV7FBLHX-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a49e402f23096d21362b25d7224206a45288072a
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout a49e402f23096d21362b25d7224206a45288072a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011207.BV7FBLHX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:154,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from fs/f2fs/super.c:10:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:137:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     137 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   fs/f2fs/super.c: In function 'f2fs_fill_super':
>> fs/f2fs/super.c:3632:9: warning: 'memcpy' reading 16 bytes from a region of size 0 [-Wstringop-overread]
    3632 |         memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcpy +3632 fs/f2fs/super.c

0abd675e97e60d Chao Yu            2017-07-09  3618  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3619  	sb->s_op = &f2fs_sops;
643fa9612bf1a2 Chandan Rajendra   2018-12-12  3620  #ifdef CONFIG_FS_ENCRYPTION
0b81d077907269 Jaegeuk Kim        2015-05-15  3621  	sb->s_cop = &f2fs_cryptops;
95ae251fe82838 Eric Biggers       2019-07-22  3622  #endif
95ae251fe82838 Eric Biggers       2019-07-22  3623  #ifdef CONFIG_FS_VERITY
95ae251fe82838 Eric Biggers       2019-07-22  3624  	sb->s_vop = &f2fs_verityops;
ffcc41829ae043 Eric Biggers       2017-10-09  3625  #endif
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3626  	sb->s_xattr = f2fs_xattr_handlers;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3627  	sb->s_export_op = &f2fs_export_ops;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3628  	sb->s_magic = F2FS_SUPER_MAGIC;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3629  	sb->s_time_gran = 1;
1751e8a6cb935e Linus Torvalds     2017-11-27  3630  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
1751e8a6cb935e Linus Torvalds     2017-11-27  3631  		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
85787090a21eb7 Christoph Hellwig  2017-05-10 @3632  	memcpy(&sb->s_uuid, raw_super->uuid, sizeof(raw_super->uuid));
578c647879f74c Yufen Yu           2018-01-09  3633  	sb->s_iflags |= SB_I_CGROUPWB;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3634  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3635  	/* init f2fs-specific super block info */
e8240f656d4d5d Chao Yu            2015-12-15  3636  	sbi->valid_super_block = valid_super_block;
fb24fea75ca5ce Chao Yu            2020-01-14  3637  	init_rwsem(&sbi->gc_lock);
853137cef46ccc Jaegeuk Kim        2018-08-09  3638  	mutex_init(&sbi->writepages);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3639  	mutex_init(&sbi->cp_mutex);
b3582c68920105 Chao Yu            2014-07-03  3640  	init_rwsem(&sbi->node_write);
59c9081bc86ef0 Yunlei He          2017-03-13  3641  	init_rwsem(&sbi->node_change);
315df8398e3636 Jaegeuk Kim        2015-08-11  3642  
315df8398e3636 Jaegeuk Kim        2015-08-11  3643  	/* disallow all the data/node/meta page writes */
315df8398e3636 Jaegeuk Kim        2015-08-11  3644  	set_sbi_flag(sbi, SBI_POR_DOING);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3645  	spin_lock_init(&sbi->stat_lock);
971767caf63219 Jaegeuk Kim        2013-11-18  3646  
b0af6d491a6b5f Chao Yu            2017-08-02  3647  	/* init iostat info */
b0af6d491a6b5f Chao Yu            2017-08-02  3648  	spin_lock_init(&sbi->iostat_lock);
b0af6d491a6b5f Chao Yu            2017-08-02  3649  	sbi->iostat_enable = false;
2bc4bea33848e4 Daeho Jeong        2020-03-30  3650  	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
b0af6d491a6b5f Chao Yu            2017-08-02  3651  
458e6197c37de5 Jaegeuk Kim        2013-12-11  3652  	for (i = 0; i < NR_PAGE_TYPE; i++) {
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3653  		int n = (i == META) ? 1: NR_TEMP_TYPE;
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3654  		int j;
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3655  
c86065938aab56 Kees Cook          2018-06-12  3656  		sbi->write_io[i] =
c86065938aab56 Kees Cook          2018-06-12  3657  			f2fs_kmalloc(sbi,
c86065938aab56 Kees Cook          2018-06-12  3658  				     array_size(n,
c86065938aab56 Kees Cook          2018-06-12  3659  						sizeof(struct f2fs_bio_info)),
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3660  				     GFP_KERNEL);
b63def9112cd8b Christophe JAILLET 2017-06-11  3661  		if (!sbi->write_io[i]) {
b63def9112cd8b Christophe JAILLET 2017-06-11  3662  			err = -ENOMEM;
0b2103e886e6de Chao Yu            2018-09-05  3663  			goto free_bio_info;
b63def9112cd8b Christophe JAILLET 2017-06-11  3664  		}
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3665  
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3666  		for (j = HOT; j < n; j++) {
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3667  			init_rwsem(&sbi->write_io[i][j].io_rwsem);
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3668  			sbi->write_io[i][j].sbi = sbi;
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3669  			sbi->write_io[i][j].bio = NULL;
fb830fc5cfc90b Chao Yu            2017-05-19  3670  			spin_lock_init(&sbi->write_io[i][j].io_lock);
fb830fc5cfc90b Chao Yu            2017-05-19  3671  			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
0b20fcec865156 Chao Yu            2019-09-30  3672  			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
0b20fcec865156 Chao Yu            2019-09-30  3673  			init_rwsem(&sbi->write_io[i][j].bio_list_lock);
a912b54d3aaa01 Jaegeuk Kim        2017-05-10  3674  		}
458e6197c37de5 Jaegeuk Kim        2013-12-11  3675  	}
971767caf63219 Jaegeuk Kim        2013-11-18  3676  
b873b798af6386 Jaegeuk Kim        2016-08-04  3677  	init_rwsem(&sbi->cp_rwsem);
db6ec53b7e0320 Jaegeuk Kim        2019-05-29  3678  	init_rwsem(&sbi->quota_sem);
fb51b5ef9c0784 Changman Lee       2013-11-07  3679  	init_waitqueue_head(&sbi->cp_wait);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3680  	init_sb_info(sbi);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3681  
523be8a6b3418e Jaegeuk Kim        2016-05-13  3682  	err = init_percpu_info(sbi);
523be8a6b3418e Jaegeuk Kim        2016-05-13  3683  	if (err)
d7997e63684c98 Chao Yu            2018-01-17  3684  		goto free_bio_info;
523be8a6b3418e Jaegeuk Kim        2016-05-13  3685  
c72db71ed61ff5 Chao Yu            2019-07-12  3686  	if (F2FS_IO_ALIGNED(sbi)) {
0a595ebaaa6b53 Jaegeuk Kim        2016-12-14  3687  		sbi->write_io_dummy =
a3ebfe4fd89794 Chao Yu            2017-02-27  3688  			mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
1727f317219bfc Chao Yu            2017-06-12  3689  		if (!sbi->write_io_dummy) {
1727f317219bfc Chao Yu            2017-06-12  3690  			err = -ENOMEM;
d7997e63684c98 Chao Yu            2018-01-17  3691  			goto free_percpu;
0a595ebaaa6b53 Jaegeuk Kim        2016-12-14  3692  		}
1727f317219bfc Chao Yu            2017-06-12  3693  	}
0a595ebaaa6b53 Jaegeuk Kim        2016-12-14  3694  
a999150f4fe3ab Chao Yu            2020-02-25  3695  	/* init per sbi slab cache */
a999150f4fe3ab Chao Yu            2020-02-25  3696  	err = f2fs_init_xattr_caches(sbi);
a999150f4fe3ab Chao Yu            2020-02-25  3697  	if (err)
a999150f4fe3ab Chao Yu            2020-02-25  3698  		goto free_io_dummy;
31083031709eea Chao Yu            2020-09-14  3699  	err = f2fs_init_page_array_cache(sbi);
31083031709eea Chao Yu            2020-09-14  3700  	if (err)
31083031709eea Chao Yu            2020-09-14  3701  		goto free_xattr_cache;
a999150f4fe3ab Chao Yu            2020-02-25  3702  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3703  	/* get an inode for meta space */
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3704  	sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3705  	if (IS_ERR(sbi->meta_inode)) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3706  		f2fs_err(sbi, "Failed to read F2FS meta data inode");
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3707  		err = PTR_ERR(sbi->meta_inode);
31083031709eea Chao Yu            2020-09-14  3708  		goto free_page_array_cache;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3709  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3710  
4d57b86dd86404 Chao Yu            2018-05-30  3711  	err = f2fs_get_valid_checkpoint(sbi);
a07ef784356cf9 Namjae Jeon        2012-12-30  3712  	if (err) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3713  		f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3714  		goto free_meta_inode;
a07ef784356cf9 Namjae Jeon        2012-12-30  3715  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3716  
af033b2aa8a874 Chao Yu            2018-09-20  3717  	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
af033b2aa8a874 Chao Yu            2018-09-20  3718  		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
db610a640eeeb2 Jaegeuk Kim        2019-01-24  3719  	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_DISABLED_QUICK_FLAG)) {
db610a640eeeb2 Jaegeuk Kim        2019-01-24  3720  		set_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
db610a640eeeb2 Jaegeuk Kim        2019-01-24  3721  		sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_QUICK_INTERVAL;
db610a640eeeb2 Jaegeuk Kim        2019-01-24  3722  	}
af033b2aa8a874 Chao Yu            2018-09-20  3723  
04f0b2eaa3b3ee Qiuyang Sun        2019-06-05  3724  	if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_FSCK_FLAG))
04f0b2eaa3b3ee Qiuyang Sun        2019-06-05  3725  		set_sbi_flag(sbi, SBI_NEED_FSCK);
04f0b2eaa3b3ee Qiuyang Sun        2019-06-05  3726  
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3727  	/* Initialize device list */
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3728  	err = f2fs_scan_devices(sbi);
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3729  	if (err) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3730  		f2fs_err(sbi, "Failed to find devices");
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3731  		goto free_devices;
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3732  	}
3c62be17d4f562 Jaegeuk Kim        2016-10-06  3733  
4c8ff7095bef64 Chao Yu            2019-11-01  3734  	err = f2fs_init_post_read_wq(sbi);
4c8ff7095bef64 Chao Yu            2019-11-01  3735  	if (err) {
4c8ff7095bef64 Chao Yu            2019-11-01  3736  		f2fs_err(sbi, "Failed to initialize post read workqueue");
4c8ff7095bef64 Chao Yu            2019-11-01  3737  		goto free_devices;
4c8ff7095bef64 Chao Yu            2019-11-01  3738  	}
4c8ff7095bef64 Chao Yu            2019-11-01  3739  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3740  	sbi->total_valid_node_count =
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3741  				le32_to_cpu(sbi->ckpt->valid_node_count);
513c5f3735a9bd Jaegeuk Kim        2016-05-16  3742  	percpu_counter_set(&sbi->total_valid_inode_count,
513c5f3735a9bd Jaegeuk Kim        2016-05-16  3743  				le32_to_cpu(sbi->ckpt->valid_inode_count));
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3744  	sbi->user_block_count = le64_to_cpu(sbi->ckpt->user_block_count);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3745  	sbi->total_valid_block_count =
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3746  				le64_to_cpu(sbi->ckpt->valid_block_count);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3747  	sbi->last_valid_block_count = sbi->total_valid_block_count;
daeb433e42de97 Chao Yu            2017-06-26  3748  	sbi->reserved_blocks = 0;
80d421450187e8 Yunlong Song       2017-10-27  3749  	sbi->current_reserved_blocks = 0;
7e65be49ed94f8 Jaegeuk Kim        2017-12-27  3750  	limit_reserve_root(sbi);
1ae18f71cb5226 Jaegeuk Kim        2020-05-15  3751  	adjust_unusable_cap_perc(sbi);
41382ec43255b5 Jaegeuk Kim        2016-05-16  3752  
c227f912732f20 Chao Yu            2015-12-16  3753  	for (i = 0; i < NR_INODE_TYPE; i++) {
c227f912732f20 Chao Yu            2015-12-16  3754  		INIT_LIST_HEAD(&sbi->inode_list[i]);
c227f912732f20 Chao Yu            2015-12-16  3755  		spin_lock_init(&sbi->inode_lock[i]);
c227f912732f20 Chao Yu            2015-12-16  3756  	}
040d2bb318d1ae Chao Yu            2019-05-20  3757  	mutex_init(&sbi->flush_lock);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3758  
4d57b86dd86404 Chao Yu            2018-05-30  3759  	f2fs_init_extent_cache_info(sbi);
1dcc336b02bff3 Chao Yu            2015-02-05  3760  
4d57b86dd86404 Chao Yu            2018-05-30  3761  	f2fs_init_ino_entry_info(sbi);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3762  
50fa53eccf9f91 Chao Yu            2018-08-02  3763  	f2fs_init_fsync_node_info(sbi);
50fa53eccf9f91 Chao Yu            2018-08-02  3764  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3765  	/* setup f2fs internal modules */
4d57b86dd86404 Chao Yu            2018-05-30  3766  	err = f2fs_build_segment_manager(sbi);
a07ef784356cf9 Namjae Jeon        2012-12-30  3767  	if (err) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3768  		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
dcbb4c10e6d969 Joe Perches        2019-06-18  3769  			 err);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3770  		goto free_sm;
a07ef784356cf9 Namjae Jeon        2012-12-30  3771  	}
4d57b86dd86404 Chao Yu            2018-05-30  3772  	err = f2fs_build_node_manager(sbi);
a07ef784356cf9 Namjae Jeon        2012-12-30  3773  	if (err) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3774  		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
dcbb4c10e6d969 Joe Perches        2019-06-18  3775  			 err);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3776  		goto free_nm;
a07ef784356cf9 Namjae Jeon        2012-12-30  3777  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3778  
a49e402f23096d Chao Yu            2021-12-11  3779  	err = adjust_reserved_segment(sbi);
a49e402f23096d Chao Yu            2021-12-11  3780  	if (err)
a49e402f23096d Chao Yu            2021-12-11  3781  		goto free_nm;
a49e402f23096d Chao Yu            2021-12-11  3782  
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3783  	/* For write statistics */
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3784  	if (sb->s_bdev->bd_part)
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3785  		sbi->sectors_written_start =
dbae2c551377b6 Michael Callahan   2018-07-18  3786  			(u64)part_stat_read(sb->s_bdev->bd_part,
dbae2c551377b6 Michael Callahan   2018-07-18  3787  					    sectors[STAT_WRITE]);
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3788  
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3789  	/* Read accumulated write IO statistics if exists */
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3790  	seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3791  	if (__exist_node_summaries(sbi))
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3792  		sbi->kbytes_written =
b2dde6fca37e94 Shuoran Liu        2016-03-29  3793  			le64_to_cpu(seg_i->journal->info.kbytes_written);
8f1dbbbbdfe9ba Shuoran Liu        2016-01-27  3794  
4d57b86dd86404 Chao Yu            2018-05-30  3795  	f2fs_build_gc_manager(sbi);
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3796  
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3797  	err = f2fs_build_stats(sbi);
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3798  	if (err)
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3799  		goto free_nm;
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3800  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3801  	/* get an inode for node space */
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3802  	sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3803  	if (IS_ERR(sbi->node_inode)) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3804  		f2fs_err(sbi, "Failed to read node inode");
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3805  		err = PTR_ERR(sbi->node_inode);
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3806  		goto free_stats;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3807  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3808  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3809  	/* read root inode and dentry */
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3810  	root = f2fs_iget(sb, F2FS_ROOT_INO(sbi));
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3811  	if (IS_ERR(root)) {
dcbb4c10e6d969 Joe Perches        2019-06-18  3812  		f2fs_err(sbi, "Failed to read root inode");
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3813  		err = PTR_ERR(root);
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3814  		goto free_node_inode;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3815  	}
bcbfbd604dcba4 Chao Yu            2018-06-29  3816  	if (!S_ISDIR(root->i_mode) || !root->i_blocks ||
bcbfbd604dcba4 Chao Yu            2018-06-29  3817  			!root->i_size || !root->i_nlink) {
9d847950770da7 Chao Yu            2014-07-25  3818  		iput(root);
8f99a946f360c4 Chao Yu            2013-11-28  3819  		err = -EINVAL;
60aa4d5536ab7f Sahitya Tummala    2018-12-26  3820  		goto free_node_inode;
8f99a946f360c4 Chao Yu            2013-11-28  3821  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3822  
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3823  	sb->s_root = d_make_root(root); /* allocate root dentry */
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3824  	if (!sb->s_root) {
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3825  		err = -ENOMEM;
025cdb166c1e6a Chengguang Xu      2019-01-23  3826  		goto free_node_inode;
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3827  	}
aff063e266cbf4 Jaegeuk Kim        2012-11-02  3828  
dc6b20551044a0 Jaegeuk Kim        2017-07-26  3829  	err = f2fs_register_sysfs(sbi);
b59d0bae6ca30c Namjae Jeon        2013-08-04  3830  	if (err)
a398101aa11335 Chao Yu            2017-06-14  3831  		goto free_root_inode;
b59d0bae6ca30c Namjae Jeon        2013-08-04  3832  

:::::: The code at line 3632 was first introduced by commit
:::::: 85787090a21eb749d8b347eaf9ff1a455637473c fs: switch ->s_uuid to uuid_t

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
