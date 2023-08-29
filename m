Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E4360
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 02:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693276445; x=1724812445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xvw2GHtkQQB/M2SP3xJGIWwJ83Z7EeGbSwfRXHzlv3Q=;
  b=jgvcXAJ5kgnNgHhQ1XBaAO4xxwYi0xFfQY6YMghzA4je2ic9bIHUjPGD
   CdqoqKCuDHiWytOLKwgs9QmNjXjHJm4VdH7DBISB92lv8KwmL2cnpw2AT
   FYIOMWcujGk19YbHZjNWzYMyJEGleZVzbCgf4fHf4mFNmnLcqmm/6B1CS
   pSobkiG+P3l+ANRzB7DojfK7eroAnb9Z9+5cR8qpInyUvyAalgSGHHaiA
   iAw+RZXy2YBZqDRjGpPXAE3D9HgreAJF45lrahTi4YSn0Qpf//uJQMkLe
   KFtA1N/0aL53KuTf6cN6KqsZs8r8tKFMuD3yhyVsllPqg+ooaiS7xc2st
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375224661"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="375224661"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 19:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="741641506"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="741641506"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 19:33:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaoYE-0008IZ-0N;
	Tue, 29 Aug 2023 02:33:54 +0000
Date: Tue, 29 Aug 2023 10:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, cluster-devel@redhat.com
Subject: [gfs2:for-next 22/25] fs/gfs2/util.c:155:25: error: implicit
 declaration of function 'kthread_stop'
Message-ID: <202308291017.TSHEZ18E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   0c7b3cb2302dfd54309d5d34b8737c70c22601fb
commit: 19bbc3ff1cb60e32a602937480708099238ea034 [22/25] gfs2: Stop using gfs2_make_fs_ro for withdraw
config: powerpc64-randconfig-r015-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291017.TSHEZ18E-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291017.TSHEZ18E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291017.TSHEZ18E-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/util.c: In function 'signal_our_withdraw':
>> fs/gfs2/util.c:155:25: error: implicit declaration of function 'kthread_stop' [-Werror=implicit-function-declaration]
     155 |                         kthread_stop(sdp->sd_quotad_process);
         |                         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kthread_stop +155 fs/gfs2/util.c

   116	
   117	static void signal_our_withdraw(struct gfs2_sbd *sdp)
   118	{
   119		struct gfs2_glock *live_gl = sdp->sd_live_gh.gh_gl;
   120		struct inode *inode;
   121		struct gfs2_inode *ip;
   122		struct gfs2_glock *i_gl;
   123		u64 no_formal_ino;
   124		int ret = 0;
   125		int tries;
   126	
   127		if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) || !sdp->sd_jdesc)
   128			return;
   129	
   130		gfs2_ail_drain(sdp); /* frees all transactions */
   131		inode = sdp->sd_jdesc->jd_inode;
   132		ip = GFS2_I(inode);
   133		i_gl = ip->i_gl;
   134		no_formal_ino = ip->i_no_formal_ino;
   135	
   136		/* Prevent any glock dq until withdraw recovery is complete */
   137		set_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
   138		/*
   139		 * Don't tell dlm we're bailing until we have no more buffers in the
   140		 * wind. If journal had an IO error, the log code should just purge
   141		 * the outstanding buffers rather than submitting new IO. Making the
   142		 * file system read-only will flush the journal, etc.
   143		 *
   144		 * During a normal unmount, gfs2_make_fs_ro calls gfs2_log_shutdown
   145		 * which clears SDF_JOURNAL_LIVE. In a withdraw, we must not write
   146		 * any UNMOUNT log header, so we can't call gfs2_log_shutdown, and
   147		 * therefore we need to clear SDF_JOURNAL_LIVE manually.
   148		 */
   149		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
   150		if (!sb_rdonly(sdp->sd_vfs)) {
   151			bool locked = mutex_trylock(&sdp->sd_freeze_mutex);
   152	
   153			if (sdp->sd_quotad_process &&
   154			    current != sdp->sd_quotad_process) {
 > 155				kthread_stop(sdp->sd_quotad_process);
   156				sdp->sd_quotad_process = NULL;
   157			}
   158	
   159			if (sdp->sd_logd_process &&
   160			    current != sdp->sd_logd_process) {
   161				kthread_stop(sdp->sd_logd_process);
   162				sdp->sd_logd_process = NULL;
   163			}
   164	
   165			wait_event_timeout(sdp->sd_log_waitq,
   166					   gfs2_log_is_empty(sdp),
   167					   HZ * 5);
   168	
   169			sdp->sd_vfs->s_flags |= SB_RDONLY;
   170	
   171			if (locked)
   172				mutex_unlock(&sdp->sd_freeze_mutex);
   173	
   174			/*
   175			 * Dequeue any pending non-system glock holders that can no
   176			 * longer be granted because the file system is withdrawn.
   177			 */
   178			gfs2_gl_dq_holders(sdp);
   179		}
   180	
   181		if (sdp->sd_lockstruct.ls_ops->lm_lock == NULL) { /* lock_nolock */
   182			if (!ret)
   183				ret = -EIO;
   184			clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
   185			goto skip_recovery;
   186		}
   187		/*
   188		 * Drop the glock for our journal so another node can recover it.
   189		 */
   190		if (gfs2_holder_initialized(&sdp->sd_journal_gh)) {
   191			gfs2_glock_dq_wait(&sdp->sd_journal_gh);
   192			gfs2_holder_uninit(&sdp->sd_journal_gh);
   193		}
   194		sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
   195		gfs2_glock_dq(&sdp->sd_jinode_gh);
   196		gfs2_thaw_freeze_initiator(sdp->sd_vfs);
   197		wait_on_bit(&i_gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
   198	
   199		/*
   200		 * holder_uninit to force glock_put, to force dlm to let go
   201		 */
   202		gfs2_holder_uninit(&sdp->sd_jinode_gh);
   203	
   204		/*
   205		 * Note: We need to be careful here:
   206		 * Our iput of jd_inode will evict it. The evict will dequeue its
   207		 * glock, but the glock dq will wait for the withdraw unless we have
   208		 * exception code in glock_dq.
   209		 */
   210		iput(inode);
   211		sdp->sd_jdesc->jd_inode = NULL;
   212		/*
   213		 * Wait until the journal inode's glock is freed. This allows try locks
   214		 * on other nodes to be successful, otherwise we remain the owner of
   215		 * the glock as far as dlm is concerned.
   216		 */
   217		if (i_gl->gl_ops->go_free) {
   218			set_bit(GLF_FREEING, &i_gl->gl_flags);
   219			wait_on_bit(&i_gl->gl_flags, GLF_FREEING, TASK_UNINTERRUPTIBLE);
   220		}
   221	
   222		/*
   223		 * Dequeue the "live" glock, but keep a reference so it's never freed.
   224		 */
   225		gfs2_glock_hold(live_gl);
   226		gfs2_glock_dq_wait(&sdp->sd_live_gh);
   227		/*
   228		 * We enqueue the "live" glock in EX so that all other nodes
   229		 * get a demote request and act on it. We don't really want the
   230		 * lock in EX, so we send a "try" lock with 1CB to produce a callback.
   231		 */
   232		fs_warn(sdp, "Requesting recovery of jid %d.\n",
   233			sdp->sd_lockstruct.ls_jid);
   234		gfs2_holder_reinit(LM_ST_EXCLUSIVE,
   235				   LM_FLAG_TRY_1CB | LM_FLAG_NOEXP | GL_NOPID,
   236				   &sdp->sd_live_gh);
   237		msleep(GL_GLOCK_MAX_HOLD);
   238		/*
   239		 * This will likely fail in a cluster, but succeed standalone:
   240		 */
   241		ret = gfs2_glock_nq(&sdp->sd_live_gh);
   242	
   243		/*
   244		 * If we actually got the "live" lock in EX mode, there are no other
   245		 * nodes available to replay our journal. So we try to replay it
   246		 * ourselves. We hold the "live" glock to prevent other mounters
   247		 * during recovery, then just dequeue it and reacquire it in our
   248		 * normal SH mode. Just in case the problem that caused us to
   249		 * withdraw prevents us from recovering our journal (e.g. io errors
   250		 * and such) we still check if the journal is clean before proceeding
   251		 * but we may wait forever until another mounter does the recovery.
   252		 */
   253		if (ret == 0) {
   254			fs_warn(sdp, "No other mounters found. Trying to recover our "
   255				"own journal jid %d.\n", sdp->sd_lockstruct.ls_jid);
   256			if (gfs2_recover_journal(sdp->sd_jdesc, 1))
   257				fs_warn(sdp, "Unable to recover our journal jid %d.\n",
   258					sdp->sd_lockstruct.ls_jid);
   259			gfs2_glock_dq_wait(&sdp->sd_live_gh);
   260			gfs2_holder_reinit(LM_ST_SHARED,
   261					   LM_FLAG_NOEXP | GL_EXACT | GL_NOPID,
   262					   &sdp->sd_live_gh);
   263			gfs2_glock_nq(&sdp->sd_live_gh);
   264		}
   265	
   266		gfs2_glock_queue_put(live_gl); /* drop extra reference we acquired */
   267		clear_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
   268	
   269		/*
   270		 * At this point our journal is evicted, so we need to get a new inode
   271		 * for it. Once done, we need to call gfs2_find_jhead which
   272		 * calls gfs2_map_journal_extents to map it for us again.
   273		 *
   274		 * Note that we don't really want it to look up a FREE block. The
   275		 * GFS2_BLKST_FREE simply overrides a block check in gfs2_inode_lookup
   276		 * which would otherwise fail because it requires grabbing an rgrp
   277		 * glock, which would fail with -EIO because we're withdrawing.
   278		 */
   279		inode = gfs2_inode_lookup(sdp->sd_vfs, DT_UNKNOWN,
   280					  sdp->sd_jdesc->jd_no_addr, no_formal_ino,
   281					  GFS2_BLKST_FREE);
   282		if (IS_ERR(inode)) {
   283			fs_warn(sdp, "Reprocessing of jid %d failed with %ld.\n",
   284				sdp->sd_lockstruct.ls_jid, PTR_ERR(inode));
   285			goto skip_recovery;
   286		}
   287		sdp->sd_jdesc->jd_inode = inode;
   288		d_mark_dontcache(inode);
   289	
   290		/*
   291		 * Now wait until recovery is complete.
   292		 */
   293		for (tries = 0; tries < 10; tries++) {
   294			ret = check_journal_clean(sdp, sdp->sd_jdesc, false);
   295			if (!ret)
   296				break;
   297			msleep(HZ);
   298			fs_warn(sdp, "Waiting for journal recovery jid %d.\n",
   299				sdp->sd_lockstruct.ls_jid);
   300		}
   301	skip_recovery:
   302		if (!ret)
   303			fs_warn(sdp, "Journal recovery complete for jid %d.\n",
   304				sdp->sd_lockstruct.ls_jid);
   305		else
   306			fs_warn(sdp, "Journal recovery skipped for jid %d until next "
   307				"mount.\n", sdp->sd_lockstruct.ls_jid);
   308		fs_warn(sdp, "Glock dequeues delayed: %lu\n", sdp->sd_glock_dqs_held);
   309		sdp->sd_glock_dqs_held = 0;
   310		wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_RECOVERY);
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
