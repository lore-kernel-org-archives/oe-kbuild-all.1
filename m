Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4332B2E832
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712357591; cv=none; b=e7DsFFqXyigSLye79InwW8sk5iuLPCtwT5kwr3UkCoEl2QISM6R7UhutrxhWg3Vb4ovJo96C1h6gxPVGXAr5EIznvYR1t4QSxXQnHrsY8VL/nSCZ7EpX5cfyY8CpQGrYO5tyb798RP6JKELewUHzCzCSrKOWn9e4JoIfbxpIlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712357591; c=relaxed/simple;
	bh=PdJPUMA1kNR1s2dPEMetciJRE8SQVRkCE0vgPX7yXsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzC3FYSAuwbGw6Ou2aq3XJ8rPdPIIUTjZi/jtkMtlDLu2mIgTeUgciBGihJgR6LbCVI1HO0uUknznqriACw2WrPJgml8bL8ikPaEWW0P1+2FC08Zhl98TGU8zZuifckwAy55CpLAnUqv++Ya7PfCrVQ0KvLzUzX2u3cuEzWM5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL6bv1MI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL6bv1MI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712357589; x=1743893589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PdJPUMA1kNR1s2dPEMetciJRE8SQVRkCE0vgPX7yXsA=;
  b=iL6bv1MIkAfYKDPKrzEr7mNfhRPLrK0afan9obZ72TLwt//zC8UU2Xvr
   sfN5oqyMlxnVaskX6itjkhP5q60Xwtgx89BvLe3uRQnuhJcqBG4gYWAFo
   sFN2kv9hVz1jRYOc5jU9EyYu6zX88akWqXWe+ieeO2DDjtcIoYHmMLD6X
   Gj+bC4mTukroP2/92kQ8rkXZ5djYLCias93w2Tl9Oe97NY15NB2qNiT/W
   e31FVaQGvBuxGQBKKG00jDoCLdpPQQGfUJzdGAZ5MxTFd+AV6eLr7aUt1
   hX5dQi6l44TI2saYEd9m2gXTMPE/9wJgB2JtfRHnO9QkhR+mthd79P0Mw
   A==;
X-CSE-ConnectionGUID: umR/AT+5R8Ksn2Lvwg3idw==
X-CSE-MsgGUID: gXej8A5lTxWdqEkFBhLpng==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7548397"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7548397"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:53:09 -0700
X-CSE-ConnectionGUID: V4oBHRA2QZamEJure/ZfCA==
X-CSE-MsgGUID: q7WyNytvTFiF17EJbN4KaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19742275"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2024 15:53:07 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rssQi-0002pu-2t;
	Fri, 05 Apr 2024 22:53:04 +0000
Date: Sat, 6 Apr 2024 06:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 53/93] drivers/gpu/drm/drm_file.c:542: warning:
 Function parameter or struct member 'iocb' not described in 'drm_read'
Message-ID: <202404060605.9f9QE98y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: 006113b249eac4c98b4ad16c1c3d1b6aae90fcda [53/93] drivers/gpu: convert to ->read_iter and ->write_iter
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060605.9f9QE98y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060605.9f9QE98y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060605.9f9QE98y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:542: warning: Function parameter or struct member 'iocb' not described in 'drm_read'
>> drivers/gpu/drm/drm_file.c:542: warning: Function parameter or struct member 'to' not described in 'drm_read'
>> drivers/gpu/drm/drm_file.c:542: warning: Excess function parameter 'filp' description in 'drm_read'
>> drivers/gpu/drm/drm_file.c:542: warning: Excess function parameter 'buffer' description in 'drm_read'
>> drivers/gpu/drm/drm_file.c:542: warning: Excess function parameter 'count' description in 'drm_read'
>> drivers/gpu/drm/drm_file.c:542: warning: Excess function parameter 'offset' description in 'drm_read'


vim +542 drivers/gpu/drm/drm_file.c

7a2c65dd32b1cf drivers/gpu/drm/drm_file.c Chris Wilson       2020-01-24  515  
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  516  /**
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  517   * drm_read - read method for DRM file
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  518   * @filp: file pointer
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  519   * @buffer: userspace destination pointer for the read
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  520   * @count: count in bytes to read
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  521   * @offset: offset to read
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  522   *
b93658f83fa7f8 drivers/gpu/drm/drm_file.c Daniel Vetter      2017-03-08  523   * This function must be used by drivers as their &file_operations.read
0ae865ef92f192 drivers/gpu/drm/drm_file.c Cai Huoqing        2021-07-30  524   * method if they use DRM events for asynchronous signalling to userspace.
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  525   * Since events are used by the KMS API for vblank and page flip completion this
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  526   * means all modern display drivers must use it.
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  527   *
868941b1444128 drivers/gpu/drm/drm_file.c Jason A. Donenfeld 2022-06-29  528   * @offset is ignored, DRM events are read like a pipe. Polling support is
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  529   * provided by drm_poll().
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  530   *
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  531   * This function will only ever read a full event. Therefore userspace must
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  532   * supply a big enough buffer to fit any event to ensure forward progress. Since
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  533   * the maximum event space is currently 4K it's recommended to just use that for
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  534   * safety.
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  535   *
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  536   * RETURNS:
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  537   *
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  538   * Number of bytes read (always aligned to full events, and can be 0) or a
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  539   * negative error code on failure.
bcb877e4dcf21c drivers/gpu/drm/drm_fops.c Daniel Vetter      2016-01-11  540   */
006113b249eac4 drivers/gpu/drm/drm_file.c Jens Axboe         2024-04-05  541  ssize_t drm_read(struct kiocb *iocb, struct iov_iter *to)
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12 @542  {
006113b249eac4 drivers/gpu/drm/drm_file.c Jens Axboe         2024-04-05  543  	struct drm_file *file_priv = iocb->ki_filp->private_data;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  544  	struct drm_device *dev = file_priv->minor->dev;
006113b249eac4 drivers/gpu/drm/drm_file.c Jens Axboe         2024-04-05  545  	size_t count = iov_iter_count(to);
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  546  	ssize_t ret;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  547  
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  548  	ret = mutex_lock_interruptible(&file_priv->event_read_lock);
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  549  	if (ret)
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  550  		return ret;
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  551  
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  552  	for (;;) {
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  553  		struct drm_pending_event *e = NULL;
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  554  
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  555  		spin_lock_irq(&dev->event_lock);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  556  		if (!list_empty(&file_priv->event_list)) {
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  557  			e = list_first_entry(&file_priv->event_list,
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  558  					struct drm_pending_event, link);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  559  			file_priv->event_space += e->event->length;
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  560  			list_del(&e->link);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  561  		}
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  562  		spin_unlock_irq(&dev->event_lock);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  563  
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  564  		if (e == NULL) {
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  565  			if (ret)
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  566  				break;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  567  
006113b249eac4 drivers/gpu/drm/drm_file.c Jens Axboe         2024-04-05  568  			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  569  				ret = -EAGAIN;
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  570  				break;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  571  			}
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  572  
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  573  			mutex_unlock(&file_priv->event_read_lock);
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  574  			ret = wait_event_interruptible(file_priv->event_wait,
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  575  						       !list_empty(&file_priv->event_list));
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  576  			if (ret >= 0)
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  577  				ret = mutex_lock_interruptible(&file_priv->event_read_lock);
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  578  			if (ret)
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  579  				return ret;
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  580  		} else {
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  581  			unsigned length = e->event->length;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  582  
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  583  			if (length > count - ret) {
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  584  put_back_event:
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  585  				spin_lock_irq(&dev->event_lock);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  586  				file_priv->event_space -= length;
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  587  				list_add(&e->link, &file_priv->event_list);
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  588  				spin_unlock_irq(&dev->event_lock);
87189b78959c10 drivers/gpu/drm/drm_file.c Kenny Levinsen     2020-04-24  589  				wake_up_interruptible_poll(&file_priv->event_wait,
87189b78959c10 drivers/gpu/drm/drm_file.c Kenny Levinsen     2020-04-24  590  					EPOLLIN | EPOLLRDNORM);
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  591  				break;
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  592  			}
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  593  
006113b249eac4 drivers/gpu/drm/drm_file.c Jens Axboe         2024-04-05  594  			if (!copy_to_iter_full(e->event, length, to)) {
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  595  				if (ret == 0)
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  596  					ret = -EFAULT;
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  597  				goto put_back_event;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  598  			}
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  599  
83eb64c85b8095 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  600  			ret += length;
1b47aaf9a93a69 drivers/gpu/drm/drm_fops.c Gustavo Padovan    2016-06-02  601  			kfree(e);
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  602  		}
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  603  	}
9b2c0b7fb4ce79 drivers/gpu/drm/drm_fops.c Chris Wilson       2015-11-25  604  	mutex_unlock(&file_priv->event_read_lock);
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  605  
cdd1cf799bd24a drivers/gpu/drm/drm_fops.c Chris Wilson       2014-12-04  606  	return ret;
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  607  }
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  608  EXPORT_SYMBOL(drm_read);
c9a9c5e02aedc1 drivers/gpu/drm/drm_fops.c Kristian Høgsberg  2009-09-12  609  

:::::: The code at line 542 was first introduced by commit
:::::: c9a9c5e02aedc1a2815877b0268f886d2640b771 drm: Add async event synchronization for drmWaitVblank

:::::: TO: Kristian Høgsberg <krh@bitplanet.net>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
