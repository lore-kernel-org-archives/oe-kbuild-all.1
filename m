Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A083B2BA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772683243; cv=none; b=c4EY3YcgqYt7CVCXpwBqijKzV1v6vebyGX7oO2OmsiHL5mv8tl8lDD2fJn5/U3Y+YJvoQsZy4zoVli6p88jc/KBA7cibT7VJGM4Arwr/F8j9BkDQ8Cw/hJCviPqpwiVft8HVu74uOmc79tyBmQ96lQVFLYIRZiaKYK+lhtlNt2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772683243; c=relaxed/simple;
	bh=VXa+VxXrxz4RGn0G7/gaP+o0dUAF0ers0gFlvSXsW3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HVCPG/5GSTX++D6KLJyKHlthAQDpZ+nhqa8a6t/71+ro4RbEvl00XLJTG8ZWPZMnjGPs/qahOuFtm+QY2d1+YuajK+QxQ+b4FINSQHmr/0epLP3KS3wESU2x4miN4a3Dp53lD+ese4ON/6OVHvu4ftkhgVAk8hcWU4GvuDlzwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vw0qyyEp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vw0qyyEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772683241; x=1804219241;
  h=date:from:to:cc:subject:message-id;
  bh=VXa+VxXrxz4RGn0G7/gaP+o0dUAF0ers0gFlvSXsW3U=;
  b=Vw0qyyEpHorknUgqSfQ/szbMuj+u9B30cVeNQGXGk4yvhF3Uirdm8Btj
   Ca1ytVt3qkfOYryn08RPwQsSa7lqIN/wYa/72x6Ap3/kr+vGBokwJwZHQ
   77zpsNcV4IjIlrpgnyxL/uLGX4Ep2ZrrLnBsV+xP4nrqtqPC8XQRBO/Pe
   MWJQFUnUSJiKIv5qXuY5ECBhGqwUPes6jdjqjPuJk5YmrNteInNTEf797
   JulI4PcjzhOBIaENVrKuRLtKaccO54i10tCRsqnM4mn/Jvx4MTCD2H4lz
   i9zCJNVK+PKSy4BPPQ7lkCJeB0NwTBCHahs+QbBONaqRloNnBWZBKSCYX
   Q==;
X-CSE-ConnectionGUID: XsoYkx0JQFemZHaXcrsdIg==
X-CSE-MsgGUID: 5pKLMKLhTumaDdmtlIxrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84393937"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84393937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:00:41 -0800
X-CSE-ConnectionGUID: TCZG5CfVSr23TiF2ZtzHjQ==
X-CSE-MsgGUID: CPMTMkKCTfi/kt+ICAYMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215833105"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 20:00:40 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzss-0000000002P-0E4d;
	Thu, 05 Mar 2026 04:00:26 +0000
Date: Thu, 05 Mar 2026 11:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.10.y 0/334]
 drivers/scsi/scsi_lib.c:321:16: warning: mixing declarations and code is a
 C99 extension
Message-ID: <202603051152.AzF904IE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.10.y
head:   aed5c3b77cd53ba74f66767b03bfb9177662af4b
commit: cc872e35c0df80062abc71268d690a2f749e542e [0/334] scsi: core: Wake up the error handler when final completions race against each other
config: x86_64-buildonly-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051152.AzF904IE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051152.AzF904IE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051152.AzF904IE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_lib.c:321:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
     321 |                 unsigned int busy = scsi_host_busy(shost);
         |                              ^
   1 warning generated.


vim +321 drivers/scsi/scsi_lib.c

392160335c798b James Bottomley   2005-06-15  296  
3bd6f43f5cb371 Bart Van Assche   2017-12-04  297  /*
6eb045e092efef Ming Lei          2019-10-25  298   * Wake up the error handler if necessary. Avoid as follows that the error
6eb045e092efef Ming Lei          2019-10-25  299   * handler is not woken up if host in-flight requests number ==
6eb045e092efef Ming Lei          2019-10-25  300   * shost->host_failed: use call_rcu() in scsi_eh_scmd_add() in combination
6eb045e092efef Ming Lei          2019-10-25  301   * with an RCU read lock in this function to ensure that this function in
6eb045e092efef Ming Lei          2019-10-25  302   * its entirety either finishes before scsi_eh_scmd_add() increases the
3bd6f43f5cb371 Bart Van Assche   2017-12-04  303   * host_failed counter or that it notices the shost state change made by
3bd6f43f5cb371 Bart Van Assche   2017-12-04  304   * scsi_eh_scmd_add().
3bd6f43f5cb371 Bart Van Assche   2017-12-04  305   */
6eb045e092efef Ming Lei          2019-10-25  306  static void scsi_dec_host_busy(struct Scsi_Host *shost, struct scsi_cmnd *cmd)
^1da177e4c3f41 Linus Torvalds    2005-04-16  307  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  308  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  309  
3bd6f43f5cb371 Bart Van Assche   2017-12-04  310  	rcu_read_lock();
6eb045e092efef Ming Lei          2019-10-25  311  	__clear_bit(SCMD_STATE_INFLIGHT, &cmd->state);
3bd6f43f5cb371 Bart Van Assche   2017-12-04  312  	if (unlikely(scsi_host_in_recovery(shost))) {
cc872e35c0df80 David Jeffery     2026-01-13  313  		/*
cc872e35c0df80 David Jeffery     2026-01-13  314  		 * Ensure the clear of SCMD_STATE_INFLIGHT is visible to
cc872e35c0df80 David Jeffery     2026-01-13  315  		 * other CPUs before counting busy requests. Otherwise,
cc872e35c0df80 David Jeffery     2026-01-13  316  		 * reordering can cause CPUs to race and miss an eh wakeup
cc872e35c0df80 David Jeffery     2026-01-13  317  		 * when no CPU sees all busy requests as done or timed out.
cc872e35c0df80 David Jeffery     2026-01-13  318  		 */
cc872e35c0df80 David Jeffery     2026-01-13  319  		smp_mb();
cc872e35c0df80 David Jeffery     2026-01-13  320  
9878c660d1f0d3 Ming Lei          2024-02-03 @321  		unsigned int busy = scsi_host_busy(shost);
9878c660d1f0d3 Ming Lei          2024-02-03  322  
74665016086615 Christoph Hellwig 2014-01-22  323  		spin_lock_irqsave(shost->host_lock, flags);
3bd6f43f5cb371 Bart Van Assche   2017-12-04  324  		if (shost->host_failed || shost->host_eh_scheduled)
9878c660d1f0d3 Ming Lei          2024-02-03  325  			scsi_eh_wakeup(shost, busy);
74665016086615 Christoph Hellwig 2014-01-22  326  		spin_unlock_irqrestore(shost->host_lock, flags);
74665016086615 Christoph Hellwig 2014-01-22  327  	}
3bd6f43f5cb371 Bart Van Assche   2017-12-04  328  	rcu_read_unlock();
3bd6f43f5cb371 Bart Van Assche   2017-12-04  329  }
3bd6f43f5cb371 Bart Van Assche   2017-12-04  330  

:::::: The code at line 321 was first introduced by commit
:::::: 9878c660d1f0d37715547668adf241b5fb171dc1 scsi: core: Move scsi_host_busy() out of host lock if it is for per-command

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
