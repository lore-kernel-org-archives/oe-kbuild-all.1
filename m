Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B406116
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721985467; cv=none; b=IZVmYCn3RElO9kV7QyorFxhDaV/ZdwutgfyC7q4bxXOkydiIfoyJFtUHq2jJZB7MvWwJNGVy/Bnxt3R9lL1M+ac72fG3NVwTvUx2XaJAPQwB51lT+Uzsvo1nA8P9uQU0jUXhmOhoH85NTNkjT8B3RcdV8w4Zx4B7mlzuAnFbWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721985467; c=relaxed/simple;
	bh=6NbgbpH4bZ7s4OXK6c6/j9d1YNUH2mMIXoC4Ssi4s7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mi1WqB2QiQNWJEXqp4aegWUT83PN7r42aGgKUJl5eYCW8aniAv0/WausQfVeY2Rj2stzwdOgGCygj/PABzmzrHo3oOgRi8wV31x38f3Qp6tKEhWb5y0Z7Oea+cUQYAS7wo5mDuhwY2dPceqKnqALgVg0fdnz4oulmMO14aswi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSR09qbP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSR09qbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721985466; x=1753521466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6NbgbpH4bZ7s4OXK6c6/j9d1YNUH2mMIXoC4Ssi4s7w=;
  b=JSR09qbP9HSXHFeJIErU0uFzGXoNTChs7wluKfMKFvpAd0TDUwYhDPm5
   bhQQVPMvQYK9yazP871o1MxBEN4MH6VKVPScKVR/9Ig11g2DYFf4ZD0VR
   vdJ77vxm8AkLIlSuJiN4AVB5U5hf32coCa82KPoIUQ89Gn2jlYZ4QBjUM
   Bq6FsEfASqmOEgMrwCCmqQM1XxCgm4tPlh69nQQcPRxUs2tS0SOKiy+lv
   sAr4e+EQDoGxQA40PrT5QvPh6rdOlMXiJm0rB3tH776rDCgnPH/U0+NaD
   /S++YsKBNwlAyfECrY6qwVnOxywy8yHU3SnO2F/NsHoEUqjW5bUtzb2aI
   Q==;
X-CSE-ConnectionGUID: +c04x6/eSOG+hvvWM5XwMw==
X-CSE-MsgGUID: qLAKuD2LSFWvdMW9Y6xy4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19643790"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="19643790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 02:17:45 -0700
X-CSE-ConnectionGUID: rkD79VqdQqe7PgjGbKhK5g==
X-CSE-MsgGUID: UB23KJe2SjGqcszjay5lew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="53122264"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2024 02:17:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXH54-000ovc-0i;
	Fri, 26 Jul 2024 09:17:42 +0000
Date: Fri, 26 Jul 2024 17:16:47 +0800
From: kernel test robot <lkp@intel.com>
To: Haifeng Xu <haifeng.xu@shopee.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.misc 5/5] fs/fs-writeback.c:1144: warning: Function
 parameter or struct member 'sb' not described in 'cgroup_writeback_umount'
Message-ID: <202407261749.LkRbgZxK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   5f307d17dc72e6d40b9343338f9901372cdcdd11
commit: 5f307d17dc72e6d40b9343338f9901372cdcdd11 [5/5] fs: don't flush in-flight wb switches for superblocks without cgroup writeback
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240726/202407261749.LkRbgZxK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407261749.LkRbgZxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407261749.LkRbgZxK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:1144: warning: Function parameter or struct member 'sb' not described in 'cgroup_writeback_umount'


vim +1144 fs/fs-writeback.c

d62241c7a406f0 Tejun Heo      2019-08-26  1132  
a1a0e23e49037c Tejun Heo      2016-02-29  1133  /**
a1a0e23e49037c Tejun Heo      2016-02-29  1134   * cgroup_writeback_umount - flush inode wb switches for umount
a1a0e23e49037c Tejun Heo      2016-02-29  1135   *
a1a0e23e49037c Tejun Heo      2016-02-29  1136   * This function is called when a super_block is about to be destroyed and
a1a0e23e49037c Tejun Heo      2016-02-29  1137   * flushes in-flight inode wb switches.  An inode wb switch goes through
a1a0e23e49037c Tejun Heo      2016-02-29  1138   * RCU and then workqueue, so the two need to be flushed in order to ensure
a1a0e23e49037c Tejun Heo      2016-02-29  1139   * that all previously scheduled switches are finished.  As wb switches are
a1a0e23e49037c Tejun Heo      2016-02-29  1140   * rare occurrences and synchronize_rcu() can take a while, perform
a1a0e23e49037c Tejun Heo      2016-02-29  1141   * flushing iff wb switches are in flight.
a1a0e23e49037c Tejun Heo      2016-02-29  1142   */
5f307d17dc72e6 Haifeng Xu     2024-07-26  1143  void cgroup_writeback_umount(struct super_block *sb)
a1a0e23e49037c Tejun Heo      2016-02-29 @1144  {
5f307d17dc72e6 Haifeng Xu     2024-07-26  1145  
5f307d17dc72e6 Haifeng Xu     2024-07-26  1146  	if (!(sb->s_bdi->capabilities & BDI_CAP_WRITEBACK))
5f307d17dc72e6 Haifeng Xu     2024-07-26  1147  		return;
5f307d17dc72e6 Haifeng Xu     2024-07-26  1148  
592fa002180af3 Roman Gushchin 2021-06-28  1149  	/*
592fa002180af3 Roman Gushchin 2021-06-28  1150  	 * SB_ACTIVE should be reliably cleared before checking
592fa002180af3 Roman Gushchin 2021-06-28  1151  	 * isw_nr_in_flight, see generic_shutdown_super().
592fa002180af3 Roman Gushchin 2021-06-28  1152  	 */
592fa002180af3 Roman Gushchin 2021-06-28  1153  	smp_mb();
592fa002180af3 Roman Gushchin 2021-06-28  1154  
a1a0e23e49037c Tejun Heo      2016-02-29  1155  	if (atomic_read(&isw_nr_in_flight)) {
ec084de929e419 Jiufei Xue     2019-05-17  1156  		/*
ec084de929e419 Jiufei Xue     2019-05-17  1157  		 * Use rcu_barrier() to wait for all pending callbacks to
ec084de929e419 Jiufei Xue     2019-05-17  1158  		 * ensure that all in-flight wb switches are in the workqueue.
ec084de929e419 Jiufei Xue     2019-05-17  1159  		 */
ec084de929e419 Jiufei Xue     2019-05-17  1160  		rcu_barrier();
a1a0e23e49037c Tejun Heo      2016-02-29  1161  		flush_workqueue(isw_wq);
a1a0e23e49037c Tejun Heo      2016-02-29  1162  	}
a1a0e23e49037c Tejun Heo      2016-02-29  1163  }
a1a0e23e49037c Tejun Heo      2016-02-29  1164  

:::::: The code at line 1144 was first introduced by commit
:::::: a1a0e23e49037c23ea84bc8cc146a03584d13577 writeback: flush inode cgroup wb switches instead of pinning super_block

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
