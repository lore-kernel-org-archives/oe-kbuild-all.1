Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD26F510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271200; cv=none; b=HMzq9x7wNnt2HpqhE3u6NhZzT/4O/SHhBqZV6aSY/vM3wL/htVJ8U0qG49HgWHkzh2sQ61/Sm8MOWx5Nr/ukeR1P0Wx1Jvb9M/PZsH0w/ALBsb9PPykAoL81XmzxZusDSf4jGeJYh/jDUbrrPBurQt88nzh1GdtuEAAWWMNFlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271200; c=relaxed/simple;
	bh=4bcaTTJc2liEtbgpAyn5PER27mFGFLEKLOrP7m6W3z4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkcLg/NOT91MUrAOwy08/F6PyEEAru45x5HBEY1NUJo88skZMqB7P/PdY1ywV8vsk9wzQuF2WiU1k8KIig/84cRZixJPXM9nOZ3Ycun/Zx51S/n19QdvcbckACiLTQ7JIMES3Rf9EtnJnIJY8cb7GUr+7544/Tlo1VYKUaQBAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6ibMVRa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6ibMVRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271199; x=1743807199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bcaTTJc2liEtbgpAyn5PER27mFGFLEKLOrP7m6W3z4=;
  b=B6ibMVRa16dt+zGrniIbtRfWd+A8xZQImRxgqW10UhbUdgCh7YVCpVFO
   mO7v1B0DOLnjjDE410CiUimVAtjA60MPzAr4vgmGYQAYMfzptSP0MzxDm
   X3Z6p228L0jWHZHrkPEfQQUWBufZP6UjRBQxdrKPSFfTke5c+EA5hhxe8
   oVUaaQeCVLp7I8QG67oiMY/UYHMGM0m3Rfzumyojb5y9ym6IP62ymYOkC
   Dgfn0TJdZgtHboZZID0UJcSOryvCalTLMVSMkS9hfhmJFG+nyeQ50jqqB
   nsAmE1RewCONFvrAgUyzkoh8u0s1Zgp5hA/1qSU8OWwEQIDMHQmQyQvW7
   A==;
X-CSE-ConnectionGUID: deDs0/Y4QZe4EBxvqGHEaQ==
X-CSE-MsgGUID: Fv1ynZVdRmWCwbgQcRadHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7747166"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7747166"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:53:16 -0700
X-CSE-ConnectionGUID: tqZKmQpZQb2bXuzODcNWRg==
X-CSE-MsgGUID: KiEoBgcoT1Wby6Sgp33KZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50191959"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 15:53:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVxH-0001b4-2Z;
	Thu, 04 Apr 2024 22:53:11 +0000
Date: Fri, 5 Apr 2024 06:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 17/28] sound/core/control.c:1990:24: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404050626.DIOxkHKZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 05f15eff60a663c24903bdfdb5ccb3faa4712ad9 [17/28] sound: convert drivers to read/write iterators
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050626.DIOxkHKZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050626.DIOxkHKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050626.DIOxkHKZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/core/control.c: In function 'snd_ctl_read':
>> sound/core/control.c:1990:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    1990 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> sound/core/control.c:2032:22: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
    2032 |                 if (!copy_to_iter_full(&ev, sizeof(struct snd_ctl_event), to)) {
         |                      ^~~~~~~~~~~~~~~~~
         |                      copy_to_user_nofault
   cc1: some warnings being treated as errors
--
   sound/core/timer.c: In function 'snd_timer_user_read':
>> sound/core/timer.c:2071:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    2071 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> sound/core/timer.c:2138:30: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
    2138 |                         if (!copy_to_iter_full(tread,
         |                              ^~~~~~~~~~~~~~~~~
         |                              copy_to_user_nofault
   cc1: some warnings being treated as errors


vim +/iov_iter_count +1990 sound/core/control.c

  1987	
  1988	static ssize_t snd_ctl_read(struct kiocb *iocb, struct iov_iter *to)
  1989	{
> 1990		size_t count = iov_iter_count(to);
  1991		struct snd_ctl_file *ctl;
  1992		int err = 0;
  1993		ssize_t result = 0;
  1994	
  1995		ctl = iocb->ki_filp->private_data;
  1996		if (snd_BUG_ON(!ctl || !ctl->card))
  1997			return -ENXIO;
  1998		if (!ctl->subscribed)
  1999			return -EBADFD;
  2000		if (count < sizeof(struct snd_ctl_event))
  2001			return -EINVAL;
  2002		spin_lock_irq(&ctl->read_lock);
  2003		while (count >= sizeof(struct snd_ctl_event)) {
  2004			struct snd_ctl_event ev;
  2005			struct snd_kctl_event *kev;
  2006			while (list_empty(&ctl->events)) {
  2007				wait_queue_entry_t wait;
  2008				if ((iocb->ki_filp->f_flags & O_NONBLOCK) != 0 ||
  2009				    result > 0) {
  2010					err = -EAGAIN;
  2011					goto __end_lock;
  2012				}
  2013				init_waitqueue_entry(&wait, current);
  2014				add_wait_queue(&ctl->change_sleep, &wait);
  2015				set_current_state(TASK_INTERRUPTIBLE);
  2016				spin_unlock_irq(&ctl->read_lock);
  2017				schedule();
  2018				remove_wait_queue(&ctl->change_sleep, &wait);
  2019				if (ctl->card->shutdown)
  2020					return -ENODEV;
  2021				if (signal_pending(current))
  2022					return -ERESTARTSYS;
  2023				spin_lock_irq(&ctl->read_lock);
  2024			}
  2025			kev = snd_kctl_event(ctl->events.next);
  2026			ev.type = SNDRV_CTL_EVENT_ELEM;
  2027			ev.data.elem.mask = kev->mask;
  2028			ev.data.elem.id = kev->id;
  2029			list_del(&kev->list);
  2030			spin_unlock_irq(&ctl->read_lock);
  2031			kfree(kev);
> 2032			if (!copy_to_iter_full(&ev, sizeof(struct snd_ctl_event), to)) {
  2033				err = -EFAULT;
  2034				goto __end;
  2035			}
  2036			spin_lock_irq(&ctl->read_lock);
  2037			count -= sizeof(struct snd_ctl_event);
  2038			result += sizeof(struct snd_ctl_event);
  2039		}
  2040	      __end_lock:
  2041		spin_unlock_irq(&ctl->read_lock);
  2042	      __end:
  2043	      	return result > 0 ? result : err;
  2044	}
  2045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
