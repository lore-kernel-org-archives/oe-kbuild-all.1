Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207736121
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712356990; cv=none; b=HijzKS9Ql3B9ynQCik2zU565vX+X/ABLLpWTeda2xot9LGujWuY9AmlqjSMG5WmPkm5wwa2qBUCjWr4owxZU2Ej2nzahF7158ySv9jzCaKQpRxgbgkRKdpj0BymqfnVkLA+Tj7G8bMZ8V6i1+YgNnB4YtPxo6QeILf0lOTPPbNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712356990; c=relaxed/simple;
	bh=2ak+YpZg2mfkgK5e4++cm8Sm2x42sS/MDkCLJXEK+DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swcB+OeUZcWkpysuMg+uEyg5H1ztzlLuAZ3slg61rFhw9opZZNrsUvotg0QGG16uMhhqgu9O8Y4iKdosA0CdRTPvf/1Z7TpwsM72Ok2t+DK0rtQ0v64fFCOyhxmVNLmKsHiB7qMUsFh79wnw4Fjo9ArxUMzUUDGCh5xzr837dIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSCXn4+2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSCXn4+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712356988; x=1743892988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ak+YpZg2mfkgK5e4++cm8Sm2x42sS/MDkCLJXEK+DQ=;
  b=SSCXn4+2IXnRCXY1EkML+QZID8lsfb8OGIqk9J0KBHuBAZKoX9G86OrR
   8Zmg0xU99Ff3pEFgzGHuTTNsyGIks8bFQJJ2SIU+SLPvFUosnN2lRgj1r
   z10U26t3UvETVjGAX6RwKCANi4GCO4uPOcCVEIss/nMqbI/cOnFGRVKd1
   DdbAAD7odcPhfOJ4lP0iA7Oeo1hPrvI0Ag7X1Vt73qmPoSJ9ntVLcpbhP
   Joh6FwB4DFm/aToU0Eu5k2w4RxwxMIcvoM/kuFIKVSCEQw7aT74gm5xne
   WfLk7QplvFcF+JJW1aTuy29D25yVr7Mhao7aku5nJ30n5a6M5GSeW92ST
   g==;
X-CSE-ConnectionGUID: UvLd2QbUR9q1N+cQd9fDjA==
X-CSE-MsgGUID: WgfAbuW3RuizTIpB/MAaZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11527728"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="11527728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 15:43:08 -0700
X-CSE-ConnectionGUID: P1J1SnuESHCGdHOWRDmMNw==
X-CSE-MsgGUID: M4eeb/HeQ32S4KOQ4EOnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19147370"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Apr 2024 15:43:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rssH1-0002nQ-2H;
	Fri, 05 Apr 2024 22:43:03 +0000
Date: Sat, 6 Apr 2024 06:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 53/93] drivers/gpu/drm/drm_file.c:545:24:
 error: implicit declaration of function 'iov_iter_count'
Message-ID: <202404060641.mjS5cECK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   025d6230e73400e8c46ec29a297b9bca08f36f6f
commit: 006113b249eac4c98b4ad16c1c3d1b6aae90fcda [53/93] drivers/gpu: convert to ->read_iter and ->write_iter
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240406/202404060641.mjS5cECK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060641.mjS5cECK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060641.mjS5cECK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_file.c: In function 'drm_read':
>> drivers/gpu/drm/drm_file.c:545:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     545 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_file.c:594:30: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     594 |                         if (!copy_to_iter_full(e->event, length, to)) {
         |                              ^~~~~~~~~~~~~~~~~
         |                              copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/drm_debugfs.c: In function 'connector_write':
>> drivers/gpu/drm/drm_debugfs.c:410:22: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     410 |         size_t len = iov_iter_count(from);
         |                      ^~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_debugfs.c:416:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     416 |         if (!copy_from_iter_full(buf, len, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/drm_debugfs_crc.c: In function 'crtc_crc_read':
>> drivers/gpu/drm/drm_debugfs_crc.c:289:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     289 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_debugfs_crc.c:339:14: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     339 |         if (!copy_to_iter_full(buf, LINE_LEN(crc->values_cnt), to))
         |              ^~~~~~~~~~~~~~~~~
         |              copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/nouveau/nouveau_debugfs.c: In function 'nouveau_debugfs_pstate_set':
>> drivers/gpu/drm/nouveau/nouveau_debugfs.c:149:22: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     149 |         size_t len = iov_iter_count(from);
         |                      ^~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_debugfs.c:158:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_page'? [-Werror=implicit-function-declaration]
     158 |         if (!copy_from_iter_full(buf, len, from))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_page
   cc1: some warnings being treated as errors


vim +/iov_iter_count +545 drivers/gpu/drm/drm_file.c

   515	
   516	/**
   517	 * drm_read - read method for DRM file
   518	 * @filp: file pointer
   519	 * @buffer: userspace destination pointer for the read
   520	 * @count: count in bytes to read
   521	 * @offset: offset to read
   522	 *
   523	 * This function must be used by drivers as their &file_operations.read
   524	 * method if they use DRM events for asynchronous signalling to userspace.
   525	 * Since events are used by the KMS API for vblank and page flip completion this
   526	 * means all modern display drivers must use it.
   527	 *
   528	 * @offset is ignored, DRM events are read like a pipe. Polling support is
   529	 * provided by drm_poll().
   530	 *
   531	 * This function will only ever read a full event. Therefore userspace must
   532	 * supply a big enough buffer to fit any event to ensure forward progress. Since
   533	 * the maximum event space is currently 4K it's recommended to just use that for
   534	 * safety.
   535	 *
   536	 * RETURNS:
   537	 *
   538	 * Number of bytes read (always aligned to full events, and can be 0) or a
   539	 * negative error code on failure.
   540	 */
   541	ssize_t drm_read(struct kiocb *iocb, struct iov_iter *to)
   542	{
   543		struct drm_file *file_priv = iocb->ki_filp->private_data;
   544		struct drm_device *dev = file_priv->minor->dev;
 > 545		size_t count = iov_iter_count(to);
   546		ssize_t ret;
   547	
   548		ret = mutex_lock_interruptible(&file_priv->event_read_lock);
   549		if (ret)
   550			return ret;
   551	
   552		for (;;) {
   553			struct drm_pending_event *e = NULL;
   554	
   555			spin_lock_irq(&dev->event_lock);
   556			if (!list_empty(&file_priv->event_list)) {
   557				e = list_first_entry(&file_priv->event_list,
   558						struct drm_pending_event, link);
   559				file_priv->event_space += e->event->length;
   560				list_del(&e->link);
   561			}
   562			spin_unlock_irq(&dev->event_lock);
   563	
   564			if (e == NULL) {
   565				if (ret)
   566					break;
   567	
   568				if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   569					ret = -EAGAIN;
   570					break;
   571				}
   572	
   573				mutex_unlock(&file_priv->event_read_lock);
   574				ret = wait_event_interruptible(file_priv->event_wait,
   575							       !list_empty(&file_priv->event_list));
   576				if (ret >= 0)
   577					ret = mutex_lock_interruptible(&file_priv->event_read_lock);
   578				if (ret)
   579					return ret;
   580			} else {
   581				unsigned length = e->event->length;
   582	
   583				if (length > count - ret) {
   584	put_back_event:
   585					spin_lock_irq(&dev->event_lock);
   586					file_priv->event_space -= length;
   587					list_add(&e->link, &file_priv->event_list);
   588					spin_unlock_irq(&dev->event_lock);
   589					wake_up_interruptible_poll(&file_priv->event_wait,
   590						EPOLLIN | EPOLLRDNORM);
   591					break;
   592				}
   593	
   594				if (!copy_to_iter_full(e->event, length, to)) {
   595					if (ret == 0)
   596						ret = -EFAULT;
   597					goto put_back_event;
   598				}
   599	
   600				ret += length;
   601				kfree(e);
   602			}
   603		}
   604		mutex_unlock(&file_priv->event_read_lock);
   605	
   606		return ret;
   607	}
   608	EXPORT_SYMBOL(drm_read);
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
