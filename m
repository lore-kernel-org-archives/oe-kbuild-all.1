Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45B171091
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335500; cv=none; b=Bd3k9UEMZFXDsbKaPK+hNzYydfB5Uo2cLHEhj/FpLldXh0pbtMmwF3o1Hi13EQaz2Li8q2ULI4lD9ZWc8DyxfJoetHVrpR4BBnSlZv+PULuhbuCofCX0ZE0Iu5qpGOBeD+foWu7ruGLUfdQfa6142VaE8PZ6HRxP9hUC2oZYU2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335500; c=relaxed/simple;
	bh=heCY4Ia41ixWhlg7+tgzVsYhrkb4Rc3saxvX5gJ3aUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHlu6DUVKfMIqzIRiU825wwe0cP2xVPLo1uWRYcPRnaOG5jpDUPQO+qj/vOO0quJvSirh5tzDzgLRrnYlhvhwbRa1LFyUV51DCTnzuamvQ2WhfyTx4myTdslGTlyOn2bmy0Rra1Jz2VoiWTKu4NINyzmXwpX609VU4oNzZ23hME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHFmlKRv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHFmlKRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712335499; x=1743871499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heCY4Ia41ixWhlg7+tgzVsYhrkb4Rc3saxvX5gJ3aUY=;
  b=OHFmlKRve2Pn84JTjGyxNMWoSdAjjjSj2je01XEvffLdP9VuK33C9HYj
   dNF/DUrTLAI4WYrHohvcUZZjjx3svD7NPibNqpNvha5Vo/IFdrQx9VR4I
   D/y3WCX8vkQkuULbyy6pyCBT7J49wCb7WRVTaxG6x7El0VPjjvrsTjA2/
   hHoXi6GGTw+hhuwMY2p8serq0R77rrPCqZl/Q/n/t1GxvDJH8EhvGmpVQ
   n/jYfYwo1xrMpL2S3BVLd3HW7UQ1fye4d6fRTLNmo8VEKJtrDvP/2ZipU
   hH9zMDC75oTAvzgBAITCpWwMkX0+YqXu0o6CGjLgTS1DgdC18fqkKJXRC
   w==;
X-CSE-ConnectionGUID: +7vp9f1PQnOdp9ow2uuCHA==
X-CSE-MsgGUID: cV4BLTwvSwSrSqnx5q7l9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="33073530"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="33073530"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 09:44:56 -0700
X-CSE-ConnectionGUID: s8FTre/ySh+Mq//ZpI6VXg==
X-CSE-MsgGUID: 8LAr4oMaTzW1vufAhDWUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19299338"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2024 09:44:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsmgO-0002W2-1w;
	Fri, 05 Apr 2024 16:44:52 +0000
Date: Sat, 6 Apr 2024 00:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/40] drivers/char/ps3flash.c:249:24: warning:
 'ps3flash_user_write_iter' defined but not used
Message-ID: <202404060043.7yig5nre-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: a60eb2a07b5eb5064a5636204550c1df87d20751 [8/40] char: convert drivers to use ->read_iter() and ->write_iter()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404060043.7yig5nre-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060043.7yig5nre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060043.7yig5nre-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/ps3flash.c:315:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     315 |         .read_iter      = ps3flash_user_read,
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/char/ps3flash.c:315:27: note: (near initialization for 'ps3flash_fops.read_iter')
   drivers/char/ps3flash.c:316:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'long int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     316 |         .write_iter     = ps3flash_user_write,
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/char/ps3flash.c:316:27: note: (near initialization for 'ps3flash_fops.write_iter')
   In file included from drivers/char/ps3flash.c:9:
>> drivers/char/ps3flash.c:249:24: warning: 'ps3flash_user_write_iter' defined but not used [-Wunused-function]
     249 | FOPS_WRITE_ITER_HELPER(ps3flash_user_write);
         |                        ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:2153:16: note: in definition of macro 'FOPS_WRITE_ITER_HELPER'
    2153 | static ssize_t name## _iter(struct kiocb *iocb, struct iov_iter *from)  \
         |                ^~~~
>> drivers/char/ps3flash.c:242:23: warning: 'ps3flash_user_read_iter' defined but not used [-Wunused-function]
     242 | FOPS_READ_ITER_HELPER(ps3flash_user_read);
         |                       ^~~~~~~~~~~~~~~~~~
   include/linux/fs.h:2148:16: note: in definition of macro 'FOPS_READ_ITER_HELPER'
    2148 | static ssize_t name## _iter(struct kiocb *iocb, struct iov_iter *to)    \
         |                ^~~~
   cc1: some warnings being treated as errors


vim +/ps3flash_user_write_iter +249 drivers/char/ps3flash.c

   236	
   237	static ssize_t ps3flash_user_read(struct file *file, char __user *buf,
   238					  size_t count, loff_t *pos)
   239	{
   240		return ps3flash_read(buf, NULL, count, pos);
   241	}
 > 242	FOPS_READ_ITER_HELPER(ps3flash_user_read);
   243	
   244	static ssize_t ps3flash_user_write(struct file *file, const char __user *buf,
   245					   size_t count, loff_t *pos)
   246	{
   247		return ps3flash_write(buf, NULL, count, pos);
   248	}
 > 249	FOPS_WRITE_ITER_HELPER(ps3flash_user_write);
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
