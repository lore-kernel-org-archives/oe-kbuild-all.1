Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218D33EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 02:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204223; cv=none; b=FGy8Xv6dQiRMFgEoh346l7Dqnpthb7B9h7HI2D19cIJNhRQz6y3Su9qM8DnttLqv3s1KyodALwIiP1NGc2rR09AGmVY9y88L1PD2A81d/i9kj2Oj/rjA57IOMdgndAFUMgF6d1ENpKghQZNTcHuKeQwXAFKKF9vK/SvwUFInUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204223; c=relaxed/simple;
	bh=izXyJ1Rmzcay94CjFkxtUaEga1lLnqr34T4iRRfgpzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRoJHRxF26J+uA9nVM1SGViIBR4qFoX1moMbTTKeGlPsuzlGoQ/d0hN7+TwSJK09FwjTYXlPwqYI2mvFeJ3SZKCnz5nmcT6/5QSBK7qVP3TOcb1pmjnlX2taKHzTddHAZ0FnvZ6T62DakcZP55uNw5IRu/84X2nWvlaNSrd1+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O36Jd/gm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O36Jd/gm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745204222; x=1776740222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=izXyJ1Rmzcay94CjFkxtUaEga1lLnqr34T4iRRfgpzc=;
  b=O36Jd/gm0ikP3F4QKbGFuhdV/5MaJKFR/xx7uJ9b3ckh3ebQ6J+Ik7FG
   4kPxwOz5HjlmGJ3feLXJu17/giw+AbJzB6p3VtQQHdY+gT9AV1zYuBbuj
   isAZ1qNseY99rO+O8cfySliWhZy0L+a3Yos11VSDgsHJ6xb8nQY8cs3Z4
   G2toqNoKu1y+BEqmybmNsArefI8LARiMmnJEOw6fY/EQ+EG8yXfz0c4Z0
   x8UKwPI7bDS3+uMMXolJuvWzgql3HLGiTFf1+OcA3z1xbBSbrMPRe0726
   zTzvxvEjICdVC2RtTk1Hp62wT9mRDmu72JXFaPAOy+rkSmv/++D80WfbT
   w==;
X-CSE-ConnectionGUID: 5F2KJJcRQ26WvCkEZVhDXw==
X-CSE-MsgGUID: nzME6HdCQbmpYEs3QbV+hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50530285"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="50530285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 19:57:01 -0700
X-CSE-ConnectionGUID: jPOVrmBmSmqrOAVArXAwdw==
X-CSE-MsgGUID: GHuMdzMtRvWO4x/OpT4g7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136565439"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Apr 2025 19:56:59 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6hL7-00004F-1g;
	Mon, 21 Apr 2025 02:56:57 +0000
Date: Mon, 21 Apr 2025 10:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:for-next 8/88]
 fs/bcachefs/recovery_passes.c:310:25: error: implicit declaration of
 function 'bch2_copygc_wakeup'; did you mean 'bch2_copygc_stop'?
Message-ID: <202504211050.9JWjtwUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs for-next
head:   48a36d7314e1e3926a0182c64148b463fbf567a6
commit: 16dc3473761933886977054b31d2bb3e171ad603 [8/88] bcachefs: Start copygc, rebalance threads earlier
config: csky-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211050.9JWjtwUN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211050.9JWjtwUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211050.9JWjtwUN-lkp@intel.com/

Note: the koverstreet-bcachefs/for-next HEAD 48a36d7314e1e3926a0182c64148b463fbf567a6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/bcachefs/recovery_passes.c: In function 'bch2_run_recovery_passes':
>> fs/bcachefs/recovery_passes.c:310:25: error: implicit declaration of function 'bch2_copygc_wakeup'; did you mean 'bch2_copygc_stop'? [-Wimplicit-function-declaration]
     310 |                         bch2_copygc_wakeup(c);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         bch2_copygc_stop
>> fs/bcachefs/recovery_passes.c:311:25: error: implicit declaration of function 'bch2_rebalance_wakeup'; did you mean 'bch2_rebalance_stop'? [-Wimplicit-function-declaration]
     311 |                         bch2_rebalance_wakeup(c);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         bch2_rebalance_stop
--
   fs/bcachefs/recovery.c: In function 'bch2_fs_initialize':
   fs/bcachefs/recovery.c:1198:9: error: implicit declaration of function 'bch2_copygc_wakeup'; did you mean 'bch2_copygc_stop'? [-Wimplicit-function-declaration]
    1198 |         bch2_copygc_wakeup(c);
         |         ^~~~~~~~~~~~~~~~~~
         |         bch2_copygc_stop
>> fs/bcachefs/recovery.c:1199:9: error: implicit declaration of function 'bch2_rebalance_wakeup'; did you mean 'bch2_rebalance_stop'? [-Wimplicit-function-declaration]
    1199 |         bch2_rebalance_wakeup(c);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         bch2_rebalance_stop


vim +310 fs/bcachefs/recovery_passes.c

   255	
   256	int bch2_run_recovery_passes(struct bch_fs *c)
   257	{
   258		int ret = 0;
   259	
   260		/*
   261		 * We can't allow set_may_go_rw to be excluded; that would cause us to
   262		 * use the journal replay keys for updates where it's not expected.
   263		 */
   264		c->opts.recovery_passes_exclude &= ~BCH_RECOVERY_PASS_set_may_go_rw;
   265	
   266		while (c->curr_recovery_pass < ARRAY_SIZE(recovery_pass_fns) && !ret) {
   267			spin_lock_irq(&c->recovery_pass_lock);
   268			unsigned prev_done = c->recovery_pass_done;
   269			unsigned pass = c->curr_recovery_pass;
   270	
   271			c->next_recovery_pass = pass + 1;
   272	
   273			if (c->opts.recovery_pass_last &&
   274			    c->curr_recovery_pass > c->opts.recovery_pass_last) {
   275				spin_unlock_irq(&c->recovery_pass_lock);
   276				break;
   277			}
   278	
   279			if (should_run_recovery_pass(c, pass)) {
   280				spin_unlock_irq(&c->recovery_pass_lock);
   281	
   282				ret =   bch2_run_recovery_pass(c, pass) ?:
   283					bch2_journal_flush(&c->journal);
   284	
   285				if (!ret && !test_bit(BCH_FS_error, &c->flags))
   286					bch2_clear_recovery_pass_required(c, pass);
   287	
   288				spin_lock_irq(&c->recovery_pass_lock);
   289			}
   290	
   291			if (c->next_recovery_pass < c->curr_recovery_pass) {
   292				/*
   293				 * bch2_run_explicit_recovery_pass() was called: we
   294				 * can't always catch -BCH_ERR_restart_recovery because
   295				 * it may have been called from another thread (btree
   296				 * node read completion)
   297				 */
   298				ret = 0;
   299				c->recovery_passes_complete &= ~(~0ULL << c->curr_recovery_pass);
   300			} else {
   301				c->recovery_passes_complete |= BIT_ULL(pass);
   302				c->recovery_pass_done = max(c->recovery_pass_done, pass);
   303			}
   304			c->curr_recovery_pass = c->next_recovery_pass;
   305	
   306			spin_unlock_irq(&c->recovery_pass_lock);
   307	
   308			if (prev_done <= BCH_RECOVERY_PASS_check_snapshots &&
   309			    c->recovery_pass_done > BCH_RECOVERY_PASS_check_snapshots) {
 > 310				bch2_copygc_wakeup(c);
 > 311				bch2_rebalance_wakeup(c);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
