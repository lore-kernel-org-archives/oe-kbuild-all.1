Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E0291E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742770393; cv=none; b=uVFRa25PjhGA0p3ouCA3z/jeNrq7niEZFNlY9DRYwFSasMK+LXcxKEkGXkIjOWiT93uU9pmFAt2VLXLlV0pRRYWqJHYbLFaABZ/B2AspuUO3I3uMUo9b0oVx7HxkM2ZrInuP3zqZ4l+4k21pdRWrlwoWgJQ/zzHXJkzYnkgnKaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742770393; c=relaxed/simple;
	bh=MBx622sc6v86GHi0MZLWf09RRQXd5k/PqVML0S8q+vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atDR0B7Mjg9Fk2lR2T3o9vAQV8pqUH/EoxDmRPYfVXKC3EeMa/CND2zlAxxj3CdYx508ocvrF2EIV8x7q+vGb+NxG0UdUWAetMtFi/EmrPyqpSdGk7+YNIMjCYiaJC3N5RH7+TZ6KqnZkUFpv0Epv1W1yPiygDuEfxAOmye336M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu2otU2Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu2otU2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742770391; x=1774306391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBx622sc6v86GHi0MZLWf09RRQXd5k/PqVML0S8q+vM=;
  b=Fu2otU2Y3pVsP1LaFkcFPou3jOS5Dw30UzIhP3WDy5XSf155RORRFLGR
   uspSJhYgPpX5HZVpH6H7beyoQZjHNZ36f2FLVaWBDudBY+nbiKpCJLDIk
   hpEh/FxkbLOjQ1ZnE3Q2iM0QnXUNoDymaj0EjlRMMErAYL7AHKx4nlh7g
   MTHtUjjbqGOrPNRzCjslSk7x8aiQgxdO+00l3zGAC8iiHgCxVkqWC0LVU
   GAj1Tk+IXcZ+iyhRZpLzxTrouYdTx46B1sfoFNV2USFd91Cq941VbpGfr
   ItdmJuyF8Q/lgs/iWrx9538RW1VsnXtmSITiAo/9zZPIFz2wCfgANxCgD
   w==;
X-CSE-ConnectionGUID: JSNqx0WnQuS0UaStvMMc2g==
X-CSE-MsgGUID: GMKIi36VRiGVmj7c6n5ihg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43126622"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43126622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 15:53:10 -0700
X-CSE-ConnectionGUID: 678aseSmRWqY3C9apfkLiQ==
X-CSE-MsgGUID: 64Vj/jMeRI+/A/gYE7MU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="154783742"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2025 15:53:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twUBm-0002zs-0o;
	Sun, 23 Mar 2025 22:53:06 +0000
Date: Mon, 24 Mar 2025 06:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/block 75/76] drivers/block/loop.c:388:6-25:
 WARNING: atomic_dec_and_test variation before object free at line 395.
Message-ID: <202503240625.LfSMQqA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/block
head:   4c3f4bad7a6e9022489a9f8392f7147ed3ce74b1
commit: dfc77a934a3acdb13dadf237b7417c6a31b19da8 [75/76] loop: try to handle loop aio command via NOWAIT IO first
config: i386-randconfig-052-20250323 (https://download.01.org/0day-ci/archive/20250324/202503240625.LfSMQqA2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240625.LfSMQqA2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/loop.c:388:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.

vim +388 drivers/block/loop.c

bc07c10a3603a5 Ming Lei          2015-08-17  383  
92d773324b7edb Shaohua Li        2017-09-01  384  static void lo_rw_aio_do_completion(struct loop_cmd *cmd)
92d773324b7edb Shaohua Li        2017-09-01  385  {
1894e916546df0 Jens Axboe        2018-04-13  386  	struct request *rq = blk_mq_rq_from_pdu(cmd);
1894e916546df0 Jens Axboe        2018-04-13  387  
92d773324b7edb Shaohua Li        2017-09-01 @388  	if (!atomic_dec_and_test(&cmd->ref))
92d773324b7edb Shaohua Li        2017-09-01  389  		return;
dfc77a934a3acd Ming Lei          2025-03-22  390  
dfc77a934a3acd Ming Lei          2025-03-22  391  	/* -EAGAIN could be returned from bdev's ->ki_complete */
dfc77a934a3acd Ming Lei          2025-03-22  392  	if (cmd->ret == -EAGAIN) {
dfc77a934a3acd Ming Lei          2025-03-22  393  		struct loop_device *lo = rq->q->queuedata;
dfc77a934a3acd Ming Lei          2025-03-22  394  
dfc77a934a3acd Ming Lei          2025-03-22 @395  		loop_queue_work(lo, cmd);
dfc77a934a3acd Ming Lei          2025-03-22  396  		return;
dfc77a934a3acd Ming Lei          2025-03-22  397  	}
dfc77a934a3acd Ming Lei          2025-03-22  398  
92d773324b7edb Shaohua Li        2017-09-01  399  	kfree(cmd->bvec);
15f73f5b3e5958 Christoph Hellwig 2020-06-11  400  	if (likely(!blk_should_fake_timeout(rq->q)))
1894e916546df0 Jens Axboe        2018-04-13  401  		blk_mq_complete_request(rq);
92d773324b7edb Shaohua Li        2017-09-01  402  }
92d773324b7edb Shaohua Li        2017-09-01  403  

:::::: The code at line 388 was first introduced by commit
:::::: 92d773324b7edbd36bf0c28c1e0157763aeccc92 block/loop: fix use after free

:::::: TO: Shaohua Li <shli@fb.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
