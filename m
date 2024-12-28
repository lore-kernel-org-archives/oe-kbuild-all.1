Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165D35974
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735406783; cv=none; b=orQ3hLWKrhF3s5OTzbBgLCa7koUNiyhksOldKFae/DvHh5zzQghm5czonwmL1HMrBmCtDY6RTj3ukO49D2k2MI7kpd+LWaNMtNzupZtAH0gXQfm7mshdWhGIcdKZr3ZFP+Hrkw3FpnuntA95iNa2pFO4bIUGvP8V9v4TWtH/aAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735406783; c=relaxed/simple;
	bh=civ/UdcQmCqYND3XtEEvCY62qDpVI1Q1z24pK/NXLpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZE3QajepoXAff6rJIeXxlZWGXo6pz0ay0SGp8z3ZuMEdBfZ9Es6gO44wKjcZY2gQJExerplE0HjfBkfqh76POQqvL71LkJbiv2/afzkAX2onDNtUGhwRTPYS62eLwQDq8rbNQk/VAU90XdxUQR+C0ugOWyE0PvgyxZrZY7c/VtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ6OvW1s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ6OvW1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735406782; x=1766942782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=civ/UdcQmCqYND3XtEEvCY62qDpVI1Q1z24pK/NXLpY=;
  b=eJ6OvW1sSUVpdF2d518xtXyZFuRVVq+o+fnqihEWZe4bXdlipfekmSyZ
   7zOlr/Ks89gqOkOxb/P4cUkEpXxA2iXpzEKZFieHzzSJFOoOMf66v823b
   /vUqkrQxK5heFPx4bTwBiRmoNJAQKvwRvytVRa1drIUBE7yc1KoLKuEhO
   AOZWvu3JZhM5boSNvSabf9UQDakOV7KntYRQi90zb/B51lPE/uKKYlwrb
   aLut2bAvCsmZmYBAvwSi/O1uPc94mOInbVvaSuCcS+VWBDyEpt7r3mker
   ivsrSLs6gZaqS5MMgBjmDHsxYbxw3JQsnrT5wG/f+L+JMJ/f9Ps2j48ZK
   g==;
X-CSE-ConnectionGUID: NK/wj/lJQ82HAeAlXjDG9Q==
X-CSE-MsgGUID: 32CfrL6aSXCaflCc+FkD2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53163825"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="53163825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 09:26:21 -0800
X-CSE-ConnectionGUID: 6X4loMEUQz6tvdM45rMPWQ==
X-CSE-MsgGUID: HgFyMd6cSG+3945MsIkpHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="105380509"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Dec 2024 09:26:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRaZt-0004DY-0W;
	Sat, 28 Dec 2024 17:26:17 +0000
Date: Sun, 29 Dec 2024 01:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1358/1358] fs/ext4/super.c:4550:38:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202412290146.quOZpqaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 15f255ec0f768bebebd8e3d9dfaad0afb9e78d4d [1358/1358] ext4: fix use-after-free race in ext4_remount()'s error path
config: x86_64-randconfig-122-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290146.quOZpqaQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290146.quOZpqaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290146.quOZpqaQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/super.c:4550:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got char [noderef] __rcu * @@
   fs/ext4/super.c:4550:38: sparse:     expected void const *
   fs/ext4/super.c:4550:38: sparse:     got char [noderef] __rcu *

vim +4550 fs/ext4/super.c

9b2ff35753c051 Jan Kara        2013-03-02  4449  
617ba13b31fbf5 Mingming Cao    2006-10-11  4450  	EXT4_SB(sb)->s_mount_state |= EXT4_ORPHAN_FS;
617ba13b31fbf5 Mingming Cao    2006-10-11  4451  	ext4_orphan_cleanup(sb, es);
617ba13b31fbf5 Mingming Cao    2006-10-11  4452  	EXT4_SB(sb)->s_mount_state &= ~EXT4_ORPHAN_FS;
0390131ba84fd3 Frank Mayhar    2009-01-07  4453  	if (needs_recovery) {
b31e15527a9bb7 Eric Sandeen    2009-06-04  4454  		ext4_msg(sb, KERN_INFO, "recovery complete");
617ba13b31fbf5 Mingming Cao    2006-10-11  4455  		ext4_mark_recovery_complete(sb, es);
0390131ba84fd3 Frank Mayhar    2009-01-07  4456  	}
0390131ba84fd3 Frank Mayhar    2009-01-07  4457  	if (EXT4_SB(sb)->s_journal) {
0390131ba84fd3 Frank Mayhar    2009-01-07  4458  		if (test_opt(sb, DATA_FLAGS) == EXT4_MOUNT_JOURNAL_DATA)
0390131ba84fd3 Frank Mayhar    2009-01-07  4459  			descr = " journalled data mode";
0390131ba84fd3 Frank Mayhar    2009-01-07  4460  		else if (test_opt(sb, DATA_FLAGS) == EXT4_MOUNT_ORDERED_DATA)
0390131ba84fd3 Frank Mayhar    2009-01-07  4461  			descr = " ordered data mode";
0390131ba84fd3 Frank Mayhar    2009-01-07  4462  		else
0390131ba84fd3 Frank Mayhar    2009-01-07  4463  			descr = " writeback data mode";
0390131ba84fd3 Frank Mayhar    2009-01-07  4464  	} else
0390131ba84fd3 Frank Mayhar    2009-01-07  4465  		descr = "out journal";
0390131ba84fd3 Frank Mayhar    2009-01-07  4466  
79add3a3f795e6 Lukas Czerner   2012-11-08  4467  	if (test_opt(sb, DISCARD)) {
79add3a3f795e6 Lukas Czerner   2012-11-08  4468  		struct request_queue *q = bdev_get_queue(sb->s_bdev);
79add3a3f795e6 Lukas Czerner   2012-11-08  4469  		if (!blk_queue_discard(q))
79add3a3f795e6 Lukas Czerner   2012-11-08  4470  			ext4_msg(sb, KERN_WARNING,
79add3a3f795e6 Lukas Czerner   2012-11-08  4471  				 "mounting with \"discard\" option, but "
79add3a3f795e6 Lukas Czerner   2012-11-08  4472  				 "the device does not support discard");
79add3a3f795e6 Lukas Czerner   2012-11-08  4473  	}
79add3a3f795e6 Lukas Czerner   2012-11-08  4474  
e294a5371b2e0b Theodore Ts'o   2015-08-15  4475  	if (___ratelimit(&ext4_mount_msg_ratelimit, "EXT4-fs mount"))
d4c402d9fd97a5 Curt Wohlgemuth 2010-05-16  4476  		ext4_msg(sb, KERN_INFO, "mounted filesystem with%s. "
5aee0f8a3f42c9 Theodore Ts'o   2016-11-18  4477  			 "Opts: %.*s%s%s", descr,
5aee0f8a3f42c9 Theodore Ts'o   2016-11-18  4478  			 (int) sizeof(sbi->s_es->s_mount_opts),
5aee0f8a3f42c9 Theodore Ts'o   2016-11-18  4479  			 sbi->s_es->s_mount_opts,
8b67f04ab9de5d Theodore Ts'o   2010-08-01  4480  			 *sbi->s_es->s_mount_opts ? "; " : "", orig_data);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4481  
66e61a9e9504f6 Theodore Ts'o   2010-07-27  4482  	if (es->s_error_count)
66e61a9e9504f6 Theodore Ts'o   2010-07-27  4483  		mod_timer(&sbi->s_err_report, jiffies + 300*HZ); /* 5 minutes */
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4484  
efbed4dc5857f8 Theodore Ts'o   2013-10-17  4485  	/* Enable message ratelimiting. Default is 10 messages per 5 secs. */
efbed4dc5857f8 Theodore Ts'o   2013-10-17  4486  	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f8 Theodore Ts'o   2013-10-17  4487  	ratelimit_state_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f8 Theodore Ts'o   2013-10-17  4488  	ratelimit_state_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f8 Theodore Ts'o   2013-10-17  4489  
d4c402d9fd97a5 Curt Wohlgemuth 2010-05-16  4490  	kfree(orig_data);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4491  	return 0;
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4492  
617ba13b31fbf5 Mingming Cao    2006-10-11  4493  cantfind_ext4:
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4494  	if (!silent)
b31e15527a9bb7 Eric Sandeen    2009-06-04  4495  		ext4_msg(sb, KERN_ERR, "VFS: Can't find ext4 filesystem");
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4496  	goto failed_mount;
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4497  
72ba74508b2857 Theodore Ts'o   2013-01-24  4498  #ifdef CONFIG_QUOTA
72ba74508b2857 Theodore Ts'o   2013-01-24  4499  failed_mount8:
ebd173beb8db5b Theodore Ts'o   2015-09-23  4500  	ext4_unregister_sysfs(sb);
72ba74508b2857 Theodore Ts'o   2013-01-24  4501  #endif
dcf2d804ed6ffe Tao Ma          2011-10-06  4502  failed_mount7:
dcf2d804ed6ffe Tao Ma          2011-10-06  4503  	ext4_unregister_li_request(sb);
dcf2d804ed6ffe Tao Ma          2011-10-06  4504  failed_mount6:
f9ae9cf5d72b39 Theodore Ts'o   2014-07-11  4505  	ext4_mb_release(sb);
d5e03cbb0c88cd Theodore Ts'o   2014-07-15  4506  	if (sbi->s_flex_groups)
b93b41d4c7338d Al Viro         2014-11-20  4507  		kvfree(sbi->s_flex_groups);
d5e03cbb0c88cd Theodore Ts'o   2014-07-15  4508  	percpu_counter_destroy(&sbi->s_freeclusters_counter);
d5e03cbb0c88cd Theodore Ts'o   2014-07-15  4509  	percpu_counter_destroy(&sbi->s_freeinodes_counter);
d5e03cbb0c88cd Theodore Ts'o   2014-07-15  4510  	percpu_counter_destroy(&sbi->s_dirs_counter);
d5e03cbb0c88cd Theodore Ts'o   2014-07-15  4511  	percpu_counter_destroy(&sbi->s_dirtyclusters_counter);
007649375f6af2 Azat Khuzhin    2014-04-07  4512  failed_mount5:
f9ae9cf5d72b39 Theodore Ts'o   2014-07-11  4513  	ext4_ext_release(sb);
f9ae9cf5d72b39 Theodore Ts'o   2014-07-11  4514  	ext4_release_system_zone(sb);
f9ae9cf5d72b39 Theodore Ts'o   2014-07-11  4515  failed_mount4a:
94bf608a18fa44 Al Viro         2012-01-09  4516  	dput(sb->s_root);
32a9bb57d7c1fd Manish Katiyar  2011-02-27  4517  	sb->s_root = NULL;
94bf608a18fa44 Al Viro         2012-01-09  4518  failed_mount4:
b31e15527a9bb7 Eric Sandeen    2009-06-04  4519  	ext4_msg(sb, KERN_ERR, "mount failed");
2e8fa54e3b48e4 Jan Kara        2013-06-04  4520  	if (EXT4_SB(sb)->rsv_conversion_wq)
2e8fa54e3b48e4 Jan Kara        2013-06-04  4521  		destroy_workqueue(EXT4_SB(sb)->rsv_conversion_wq);
4c0425ff68b1b8 Mingming Cao    2009-09-28  4522  failed_mount_wq:
dec214d00e0d78 Tahsin Erdogan  2017-06-22  4523  	if (sbi->s_ea_inode_cache) {
dec214d00e0d78 Tahsin Erdogan  2017-06-22  4524  		ext4_xattr_destroy_cache(sbi->s_ea_inode_cache);
dec214d00e0d78 Tahsin Erdogan  2017-06-22  4525  		sbi->s_ea_inode_cache = NULL;
dec214d00e0d78 Tahsin Erdogan  2017-06-22  4526  	}
47387409ee2e09 Tahsin Erdogan  2017-06-22  4527  	if (sbi->s_ea_block_cache) {
47387409ee2e09 Tahsin Erdogan  2017-06-22  4528  		ext4_xattr_destroy_cache(sbi->s_ea_block_cache);
47387409ee2e09 Tahsin Erdogan  2017-06-22  4529  		sbi->s_ea_block_cache = NULL;
82939d7999dfc1 Jan Kara        2016-02-22  4530  	}
0390131ba84fd3 Frank Mayhar    2009-01-07  4531  	if (sbi->s_journal) {
dab291af8d6307 Mingming Cao    2006-10-11  4532  		jbd2_journal_destroy(sbi->s_journal);
47b4a50bebfd34 Jan Kara        2008-07-11  4533  		sbi->s_journal = NULL;
0390131ba84fd3 Frank Mayhar    2009-01-07  4534  	}
50460fe8c6d1d9 Darrick J. Wong 2014-10-30  4535  failed_mount3a:
d3922a777f9b4c Zheng Liu       2013-07-01  4536  	ext4_es_unregister_shrinker(sbi);
eb68d0e2fc5a4e Zheng Liu       2014-09-01  4537  failed_mount3:
9105bb149bbbc5 Al Viro         2013-12-08  4538  	del_timer_sync(&sbi->s_err_report);
c5e06d101aaf72 Johann Lombardi 2011-05-24  4539  	if (sbi->s_mmp_tsk)
c5e06d101aaf72 Johann Lombardi 2011-05-24  4540  		kthread_stop(sbi->s_mmp_tsk);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4541  failed_mount2:
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4542  	for (i = 0; i < db_count; i++)
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4543  		brelse(sbi->s_group_desc[i]);
b93b41d4c7338d Al Viro         2014-11-20  4544  	kvfree(sbi->s_group_desc);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4545  failed_mount:
0441984a339897 Darrick J. Wong 2012-04-29  4546  	if (sbi->s_chksum_driver)
0441984a339897 Darrick J. Wong 2012-04-29  4547  		crypto_free_shash(sbi->s_chksum_driver);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4548  #ifdef CONFIG_QUOTA
a2d4a646e61954 Jan Kara        2014-09-11  4549  	for (i = 0; i < EXT4_MAXQUOTAS; i++)
ac27a0ec112a08 Dave Kleikamp   2006-10-11 @4550  		kfree(sbi->s_qf_names[i]);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4551  #endif
617ba13b31fbf5 Mingming Cao    2006-10-11  4552  	ext4_blkdev_remove(sbi);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4553  	brelse(bh);
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4554  out_fail:
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4555  	sb->s_fs_info = NULL;
f68301656b5f5d Manish Katiyar  2009-05-17  4556  	kfree(sbi->s_blockgroup_lock);
5aee0f8a3f42c9 Theodore Ts'o   2016-11-18  4557  out_free_base:
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4558  	kfree(sbi);
d4c402d9fd97a5 Curt Wohlgemuth 2010-05-16  4559  	kfree(orig_data);
5e405595e5bf4c Dan Williams    2017-08-24  4560  	fs_put_dax(dax_dev);
07aa2ea13814ea Lukas Czerner   2012-11-08  4561  	return err ? err : ret;
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4562  }
ac27a0ec112a08 Dave Kleikamp   2006-10-11  4563  

:::::: The code at line 4550 was first introduced by commit
:::::: ac27a0ec112a089f1a5102bc8dffc79c8c815571 [PATCH] ext4: initial copy of files from ext3

:::::: TO: Dave Kleikamp <shaggy@austin.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
