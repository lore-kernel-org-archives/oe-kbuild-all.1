Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6410216E37
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427058; cv=none; b=u4f9cHQRZUTgNCaFBpu/zals00Fm7OqzBgdTEWq75MGNf84+0aaBLUkdVoLHHDLT6IK0xJx/mjIob/COM71GYSwNXxY+KKOCo3IjzeMVN3yNS9xO5DF9S59u29Bi86bx+gy+1Q5HOxBRMwGFyoKTXxBWG+47gNCCoZ1ZcxYV8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427058; c=relaxed/simple;
	bh=1zSKPvGj+Wuk4KRCCOJv2gyrd4PzQjTfp+XHgiXt+5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZglPt9w5htphlyy4YDg2veQn3NkyR5SwG7egTzvRHtLfZGZji9+/XSqHtg6BYr34lngR9MKeg0aBgzUVRGmwUSAEYGMjqwp8uo4UUhNxUYdnZ3O5fh1Nux7PZcLmEac79bV25LKR4f0ahQMaNd692+M8uE2aFEtBoBTbIxO7IQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/upJycq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/upJycq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736427057; x=1767963057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1zSKPvGj+Wuk4KRCCOJv2gyrd4PzQjTfp+XHgiXt+5c=;
  b=b/upJycqOGCv0JqNDZ6IGV4RAiT8050gT7CCFjJPi6cOONMjbUc40ccj
   GOMth5Sf3Vt3VLRLc6+OqSsBRnp6wBylnlzt1hdG9wMC0jTLCZUEk6xmQ
   DjeiYZwBpQHDs+1+1+NU4ZwzpYkUrLxkXWuryJc4xbzFcueyEzv3kS/k/
   vROMFUXbzEznU5EjGsg8jfAAHf678MiKzfaLjOmBcHBTT4i/KCFhJKbFE
   N30BDUK11GMWV/t4KvcIXmq+tlMVsRNf6WzZg58/KHuSchYLEn7WBEWwK
   zFyKgqEwwZHYmAbfpoxYF3lQf1aFTOyv1eJYXgFIteLnpKmWFAW7jLjpD
   A==;
X-CSE-ConnectionGUID: CdTzjJJqQmm2GDGkR3CnhA==
X-CSE-MsgGUID: 4wb9aRTmTLKpzz7MJpu8ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36379439"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36379439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:50:56 -0800
X-CSE-ConnectionGUID: ePEbsu58S+2WPO60KZak5A==
X-CSE-MsgGUID: PA0xyLTaROivI55SIdacSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103364852"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2025 04:50:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVrzx-000HXH-0O;
	Thu, 09 Jan 2025 12:50:53 +0000
Date: Thu, 9 Jan 2025 20:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-10 0/9] block/blk-cgroup.c:1811:
 warning: Function parameter or member 'disk' not described in
 'blkcg_schedule_throttle'
Message-ID: <202501092027.yL5cw2OT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-10
head:   0a2208320e2390d1a532c35ba9d5a3d7f21e8157
commit: de185b56e8a62822d4e1cdb3e068b38ca709aa47 [0/9] blk-cgroup: pass a gendisk to blkcg_schedule_throttle
config: i386-randconfig-054-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092027.yL5cw2OT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092027.yL5cw2OT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092027.yL5cw2OT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-cgroup.c:1811: warning: Function parameter or member 'disk' not described in 'blkcg_schedule_throttle'
>> block/blk-cgroup.c:1811: warning: Excess function parameter 'gendisk' description in 'blkcg_schedule_throttle'


vim +1811 block/blk-cgroup.c

d09d8df3a29403 Josef Bacik       2018-07-03  1792  
d09d8df3a29403 Josef Bacik       2018-07-03  1793  /**
d09d8df3a29403 Josef Bacik       2018-07-03  1794   * blkcg_schedule_throttle - this task needs to check for throttling
de185b56e8a628 Christoph Hellwig 2022-09-21  1795   * @gendisk: disk to throttle
537d71b3f774c3 Bart Van Assche   2019-03-20  1796   * @use_memdelay: do we charge this to memory delay for PSI
d09d8df3a29403 Josef Bacik       2018-07-03  1797   *
d09d8df3a29403 Josef Bacik       2018-07-03  1798   * This is called by the IO controller when we know there's delay accumulated
d09d8df3a29403 Josef Bacik       2018-07-03  1799   * for the blkg for this task.  We do not pass the blkg because there are places
d09d8df3a29403 Josef Bacik       2018-07-03  1800   * we call this that may not have that information, the swapping code for
de185b56e8a628 Christoph Hellwig 2022-09-21  1801   * instance will only have a block_device at that point.  This set's the
d09d8df3a29403 Josef Bacik       2018-07-03  1802   * notify_resume for the task to check and see if it requires throttling before
d09d8df3a29403 Josef Bacik       2018-07-03  1803   * returning to user space.
d09d8df3a29403 Josef Bacik       2018-07-03  1804   *
d09d8df3a29403 Josef Bacik       2018-07-03  1805   * We will only schedule once per syscall.  You can call this over and over
d09d8df3a29403 Josef Bacik       2018-07-03  1806   * again and it will only do the check once upon return to user space, and only
d09d8df3a29403 Josef Bacik       2018-07-03  1807   * throttle once.  If the task needs to be throttled again it'll need to be
d09d8df3a29403 Josef Bacik       2018-07-03  1808   * re-set at the next time we see the task.
d09d8df3a29403 Josef Bacik       2018-07-03  1809   */
de185b56e8a628 Christoph Hellwig 2022-09-21  1810  void blkcg_schedule_throttle(struct gendisk *disk, bool use_memdelay)
d09d8df3a29403 Josef Bacik       2018-07-03 @1811  {
de185b56e8a628 Christoph Hellwig 2022-09-21  1812  	struct request_queue *q = disk->queue;
de185b56e8a628 Christoph Hellwig 2022-09-21  1813  
d09d8df3a29403 Josef Bacik       2018-07-03  1814  	if (unlikely(current->flags & PF_KTHREAD))
d09d8df3a29403 Josef Bacik       2018-07-03  1815  		return;
d09d8df3a29403 Josef Bacik       2018-07-03  1816  
49d1822bc05e70 Chunguang Xu      2021-01-25  1817  	if (current->throttle_queue != q) {
d09d8df3a29403 Josef Bacik       2018-07-03  1818  		if (!blk_get_queue(q))
d09d8df3a29403 Josef Bacik       2018-07-03  1819  			return;
d09d8df3a29403 Josef Bacik       2018-07-03  1820  
d09d8df3a29403 Josef Bacik       2018-07-03  1821  		if (current->throttle_queue)
d09d8df3a29403 Josef Bacik       2018-07-03  1822  			blk_put_queue(current->throttle_queue);
d09d8df3a29403 Josef Bacik       2018-07-03  1823  		current->throttle_queue = q;
49d1822bc05e70 Chunguang Xu      2021-01-25  1824  	}
49d1822bc05e70 Chunguang Xu      2021-01-25  1825  
d09d8df3a29403 Josef Bacik       2018-07-03  1826  	if (use_memdelay)
d09d8df3a29403 Josef Bacik       2018-07-03  1827  		current->use_memdelay = use_memdelay;
d09d8df3a29403 Josef Bacik       2018-07-03  1828  	set_notify_resume(current);
d09d8df3a29403 Josef Bacik       2018-07-03  1829  }
d09d8df3a29403 Josef Bacik       2018-07-03  1830  

:::::: The code at line 1811 was first introduced by commit
:::::: d09d8df3a29403693d9d20cc34ed101f2c558e2b blkcg: add generic throttling mechanism

:::::: TO: Josef Bacik <jbacik@fb.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
