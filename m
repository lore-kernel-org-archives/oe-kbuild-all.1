Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6281553BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 09:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712741435; cv=none; b=lMeF6ivl7aaSTvn5iYi+UrFL5baewXuquweXXfUN4Zkkfh53diB8GrCtQaeUljctqaH5tmS9j0TzXzIYSTmAZWgJYL/9auteOSSDn7Ltkn4OznUtZPeIQuHcsOWwddZXjdGcE2Bo1FPvYGro+FyCK74tJNvfXAGzkpYjRRDfKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712741435; c=relaxed/simple;
	bh=u74wVRfVHijcNwFumE9/6Hl+1x2zOqC3DfmF8JpFwCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2rQNuIZi5N1bU0Zlar/wPNS+z6/VuawKS8jap49PYxeXwXcdeosp7Y6VO6x2kz33gVw5OSofmpXX/Ewjq6vC8xKCuLRmT13WwzpfHFIEbsAGJjr/M+NFM5UX/nxn7KZuVhdBTfbTgR3wkhKqw9GEG4Q0qBwUHqjxWEzzeVA0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtMRwIH1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtMRwIH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712741433; x=1744277433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u74wVRfVHijcNwFumE9/6Hl+1x2zOqC3DfmF8JpFwCE=;
  b=mtMRwIH1AoXLpX9olXvglVxjnzG7puct3CtSiaVqEsVYtDh48XBiJGFo
   nc6ognJ3JcnMH+xc0QM9cvzi3GS1AM+0TMgnhGyh023IU6BxgcBl1KnDG
   ONQuxtb/NE53qCJRwMH2apRBwhA9qGBa5Trb4HlcHckTpj5e8RmAIyCQ/
   LofNdhDjGqGMy5GK2uESghfn90Qin7XBnNiftTyuNTBknf0RTpk9WDcxi
   FoqIa206gpLnB8AFMlzkdM4hw6anU1V5tdypGWbtvJbjYq3v0B75pMoKB
   z6X08Ha3ciumboohPq3mKHhHHYwCJ3+gIRKQDcF1Yn/JspEjeKkugD5ew
   w==;
X-CSE-ConnectionGUID: nS3j51MCSSSTJWhIEMjHmg==
X-CSE-MsgGUID: H0t4B7ORRz2GIBCWGRKC5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7949935"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7949935"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:30:33 -0700
X-CSE-ConnectionGUID: asidX8qwTJKlLxA65cTc4A==
X-CSE-MsgGUID: EdOwPNUeTG2TtjrKhNZsTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20588938"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2024 02:30:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruUHl-0007AM-2j;
	Wed, 10 Apr 2024 09:30:29 +0000
Date: Wed, 10 Apr 2024 17:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 328/367] drivers/macintosh/adb.c:744:21: error:
 'file' undeclared
Message-ID: <202404101754.qWuw8Uks-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: 2cb50c421cec952eb178386979f1ca7fa7cfdc79 [328/367] macintosh: adb: convert to read/write iterators
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101754.qWuw8Uks-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101754.qWuw8Uks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101754.qWuw8Uks-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/macintosh/adb.c: In function 'adb_read':
>> drivers/macintosh/adb.c:744:21: error: 'file' undeclared (first use in this function)
     744 |                 if (file->f_flags & O_NONBLOCK) {
         |                     ^~~~
   drivers/macintosh/adb.c:744:21: note: each undeclared identifier is reported only once for each function it appears in


vim +/file +744 drivers/macintosh/adb.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  715  
2cb50c421cec95 Jens Axboe       2024-04-09  716  static ssize_t adb_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds   2005-04-16  717  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  718  	int ret = 0;
2cb50c421cec95 Jens Axboe       2024-04-09  719  	struct adbdev_state *state = iocb->ki_filp->private_data;
2cb50c421cec95 Jens Axboe       2024-04-09  720  	size_t count = iov_iter_count(to);
^1da177e4c3f41 Linus Torvalds   2005-04-16  721  	struct adb_request *req;
e7f345a2a36754 Robert P. J. Day 2013-06-22  722  	DECLARE_WAITQUEUE(wait, current);
^1da177e4c3f41 Linus Torvalds   2005-04-16  723  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds   2005-04-16  724  
^1da177e4c3f41 Linus Torvalds   2005-04-16  725  	if (count < 2)
^1da177e4c3f41 Linus Torvalds   2005-04-16  726  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  727  	if (count > sizeof(req->reply))
^1da177e4c3f41 Linus Torvalds   2005-04-16  728  		count = sizeof(req->reply);
^1da177e4c3f41 Linus Torvalds   2005-04-16  729  
^1da177e4c3f41 Linus Torvalds   2005-04-16  730  	req = NULL;
^1da177e4c3f41 Linus Torvalds   2005-04-16  731  	spin_lock_irqsave(&state->lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  732  	add_wait_queue(&state->wait_queue, &wait);
64f8c13561fbd2 majianpeng       2012-02-03  733  	set_current_state(TASK_INTERRUPTIBLE);
^1da177e4c3f41 Linus Torvalds   2005-04-16  734  
^1da177e4c3f41 Linus Torvalds   2005-04-16  735  	for (;;) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  736  		req = state->completed;
^1da177e4c3f41 Linus Torvalds   2005-04-16  737  		if (req != NULL)
^1da177e4c3f41 Linus Torvalds   2005-04-16  738  			state->completed = req->next;
^1da177e4c3f41 Linus Torvalds   2005-04-16  739  		else if (atomic_read(&state->n_pending) == 0)
^1da177e4c3f41 Linus Torvalds   2005-04-16  740  			ret = -EIO;
^1da177e4c3f41 Linus Torvalds   2005-04-16  741  		if (req != NULL || ret != 0)
^1da177e4c3f41 Linus Torvalds   2005-04-16  742  			break;
^1da177e4c3f41 Linus Torvalds   2005-04-16  743  		
^1da177e4c3f41 Linus Torvalds   2005-04-16 @744  		if (file->f_flags & O_NONBLOCK) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  745  			ret = -EAGAIN;
^1da177e4c3f41 Linus Torvalds   2005-04-16  746  			break;
^1da177e4c3f41 Linus Torvalds   2005-04-16  747  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  748  		if (signal_pending(current)) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  749  			ret = -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds   2005-04-16  750  			break;
^1da177e4c3f41 Linus Torvalds   2005-04-16  751  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  752  		spin_unlock_irqrestore(&state->lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  753  		schedule();
^1da177e4c3f41 Linus Torvalds   2005-04-16  754  		spin_lock_irqsave(&state->lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  755  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  756  
64f8c13561fbd2 majianpeng       2012-02-03  757  	set_current_state(TASK_RUNNING);
^1da177e4c3f41 Linus Torvalds   2005-04-16  758  	remove_wait_queue(&state->wait_queue, &wait);
^1da177e4c3f41 Linus Torvalds   2005-04-16  759  	spin_unlock_irqrestore(&state->lock, flags);
^1da177e4c3f41 Linus Torvalds   2005-04-16  760  	
^1da177e4c3f41 Linus Torvalds   2005-04-16  761  	if (ret)
^1da177e4c3f41 Linus Torvalds   2005-04-16  762  		return ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  763  
^1da177e4c3f41 Linus Torvalds   2005-04-16  764  	ret = req->reply_len;
^1da177e4c3f41 Linus Torvalds   2005-04-16  765  	if (ret > count)
^1da177e4c3f41 Linus Torvalds   2005-04-16  766  		ret = count;
2cb50c421cec95 Jens Axboe       2024-04-09  767  	if (ret > 0 && !copy_to_iter_full(req->reply, ret, to))
^1da177e4c3f41 Linus Torvalds   2005-04-16  768  		ret = -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  769  
^1da177e4c3f41 Linus Torvalds   2005-04-16  770  	kfree(req);
^1da177e4c3f41 Linus Torvalds   2005-04-16  771  	return ret;
^1da177e4c3f41 Linus Torvalds   2005-04-16  772  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  773  

:::::: The code at line 744 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
