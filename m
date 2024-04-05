Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC716C680
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712317008; cv=none; b=urF27xRPLD7r7T+e1+ZEC/9v+b5E/HzzxColsCUn21W+ugXO5JWyDh1MmXtgZHf0MUIMP6WxwpKCDJkKyFWXlmLfh8P9gdTAAcIVgoaJPpsY/bl8RhPEYrfjc53R7gLBpNr9ZGOEPk9B3+ZOdyRCk//0dba6e+uZsEZSHhu6xKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712317008; c=relaxed/simple;
	bh=cgjEeRQG0YpuNzlQSJNbT++ZX6gLa7QO8KlfN++xESY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cewry64SBIpwcVcKfZE570w7yAYld25QaRe782/l8wojHCEgVVVylUOIlooJy/ucWMJfpQsOZnlxyzwAvUWy1+NIDA8MmkPb5oryYNP9nTIWewZFBmeoztAJEZ9qheOei2kOlAmeswFMavjBGvyP0OPZfl//eyyo5kOhZHZZcsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNt5SSFb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNt5SSFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712317007; x=1743853007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgjEeRQG0YpuNzlQSJNbT++ZX6gLa7QO8KlfN++xESY=;
  b=lNt5SSFbDvQscBIqcSpKAAxrvmi2adHadDwR0G2hC185EbXB0y6AKnHt
   m12EQS4v8jHL/jSLchekcCu+vbRrbxA2KTEb/Rv/8HSewqCz06cgtC/Rj
   /tFRACrpyJWYa2ssVB/3H3IWN3P9nDsBYGs5uTJIEc9m8WJAFjGSvoo2H
   yerwKsEtB0fd5gO1PS4xbGplVCJp41q6P85u7BBScWFqA49GEQqpfT/Rl
   WE5naRh8d6xUXiTVlGbel8DSLCltxylxnhQmcEWHlF9N6mr1Y2U2pxFOD
   SvW5jFcIYRJihu/v/8CVb/0Q+99XvDucppIewnMn+3dFvtUkEax7HJc9P
   w==;
X-CSE-ConnectionGUID: GoKiQF53THm/byqPMj8bjw==
X-CSE-MsgGUID: /TeoxYuIQkOR/UHjwl4SRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7875558"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7875558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:36:44 -0700
X-CSE-ConnectionGUID: IA2rFdWiSlSvkAT1T7wTXA==
X-CSE-MsgGUID: OmMOVcr0R/OxKE14ER4xdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="56602278"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2024 04:36:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshs8-0002DO-1h;
	Fri, 05 Apr 2024 11:36:40 +0000
Date: Fri, 5 Apr 2024 19:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 36/37]
 drivers/platform/chrome/wilco_ec/event.c:353: warning: Function parameter or
 struct member 'iocb' not described in 'event_read'
Message-ID: <202404051906.tYrc6YfH-lkp@intel.com>
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
commit: dbaa1b36908ea0eb20ad9121edb794f883380366 [36/37] drivers/platform: convert to ->read_iter and ->write_iter
config: x86_64-randconfig-006-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051906.tYrc6YfH-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051906.tYrc6YfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051906.tYrc6YfH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Function parameter or struct member 'iocb' not described in 'event_read'
>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Function parameter or struct member 'to' not described in 'event_read'
>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Excess function parameter 'filp' description in 'event_read'
>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Excess function parameter 'buf' description in 'event_read'
>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Excess function parameter 'count' description in 'event_read'
>> drivers/platform/chrome/wilco_ec/event.c:353: warning: Excess function parameter 'pos' description in 'event_read'


vim +353 drivers/platform/chrome/wilco_ec/event.c

f7b0bc5eafa449 Nick Crews 2019-05-23  335  
f7b0bc5eafa449 Nick Crews 2019-05-23  336  /**
f7b0bc5eafa449 Nick Crews 2019-05-23  337   * event_read() - Callback for passing event data to userspace via read().
f7b0bc5eafa449 Nick Crews 2019-05-23  338   * @filp: The file we are reading from.
f7b0bc5eafa449 Nick Crews 2019-05-23  339   * @buf: Pointer to userspace buffer to fill with one event.
f7b0bc5eafa449 Nick Crews 2019-05-23  340   * @count: Number of bytes requested. Must be at least EC_ACPI_MAX_EVENT_SIZE.
f7b0bc5eafa449 Nick Crews 2019-05-23  341   * @pos: File position pointer, irrelevant since we don't support seeking.
f7b0bc5eafa449 Nick Crews 2019-05-23  342   *
1d333ef3d59902 Nick Crews 2019-06-24  343   * Removes the first event from the queue, places it in the passed buffer.
f7b0bc5eafa449 Nick Crews 2019-05-23  344   *
3de7203115af2f Jiang Jian 2022-06-22  345   * If there are no events in the queue, then one of two things happens,
f7b0bc5eafa449 Nick Crews 2019-05-23  346   * depending on if the file was opened in nonblocking mode: If in nonblocking
f7b0bc5eafa449 Nick Crews 2019-05-23  347   * mode, then return -EAGAIN to say there's no data. If in blocking mode, then
f7b0bc5eafa449 Nick Crews 2019-05-23  348   * block until an event is available.
f7b0bc5eafa449 Nick Crews 2019-05-23  349   *
f7b0bc5eafa449 Nick Crews 2019-05-23  350   * Return: Number of bytes placed in buffer, negative error code on failure.
f7b0bc5eafa449 Nick Crews 2019-05-23  351   */
dbaa1b36908ea0 Jens Axboe 2024-04-04  352  static ssize_t event_read(struct kiocb *iocb, struct iov_iter *to)
f7b0bc5eafa449 Nick Crews 2019-05-23 @353  {
dbaa1b36908ea0 Jens Axboe 2024-04-04  354  	struct event_device_data *dev_data = iocb->ki_filp->private_data;
dbaa1b36908ea0 Jens Axboe 2024-04-04  355  	size_t count = iov_iter_count(to);
1d333ef3d59902 Nick Crews 2019-06-24  356  	struct ec_event *event;
f7b0bc5eafa449 Nick Crews 2019-05-23  357  	ssize_t n_bytes_written = 0;
f7b0bc5eafa449 Nick Crews 2019-05-23  358  	int err;
f7b0bc5eafa449 Nick Crews 2019-05-23  359  
f7b0bc5eafa449 Nick Crews 2019-05-23  360  	/* We only will give them the entire event at once */
f7b0bc5eafa449 Nick Crews 2019-05-23  361  	if (count != 0 && count < EC_ACPI_MAX_EVENT_SIZE)
f7b0bc5eafa449 Nick Crews 2019-05-23  362  		return -EINVAL;
f7b0bc5eafa449 Nick Crews 2019-05-23  363  
1d333ef3d59902 Nick Crews 2019-06-24  364  	spin_lock(&dev_data->queue_lock);
1d333ef3d59902 Nick Crews 2019-06-24  365  	while (event_queue_empty(dev_data->events)) {
1d333ef3d59902 Nick Crews 2019-06-24  366  		spin_unlock(&dev_data->queue_lock);
dbaa1b36908ea0 Jens Axboe 2024-04-04  367  		if (iocb->ki_filp->f_flags & O_NONBLOCK)
f7b0bc5eafa449 Nick Crews 2019-05-23  368  			return -EAGAIN;
1d333ef3d59902 Nick Crews 2019-06-24  369  
f7b0bc5eafa449 Nick Crews 2019-05-23  370  		err = wait_event_interruptible(dev_data->wq,
1d333ef3d59902 Nick Crews 2019-06-24  371  					!event_queue_empty(dev_data->events) ||
1d333ef3d59902 Nick Crews 2019-06-24  372  					!dev_data->exist);
f7b0bc5eafa449 Nick Crews 2019-05-23  373  		if (err)
f7b0bc5eafa449 Nick Crews 2019-05-23  374  			return err;
f7b0bc5eafa449 Nick Crews 2019-05-23  375  
f7b0bc5eafa449 Nick Crews 2019-05-23  376  		/* Device was removed as we waited? */
f7b0bc5eafa449 Nick Crews 2019-05-23  377  		if (!dev_data->exist)
f7b0bc5eafa449 Nick Crews 2019-05-23  378  			return -ENODEV;
1d333ef3d59902 Nick Crews 2019-06-24  379  		spin_lock(&dev_data->queue_lock);
f7b0bc5eafa449 Nick Crews 2019-05-23  380  	}
1d333ef3d59902 Nick Crews 2019-06-24  381  	event = event_queue_pop(dev_data->events);
1d333ef3d59902 Nick Crews 2019-06-24  382  	spin_unlock(&dev_data->queue_lock);
1d333ef3d59902 Nick Crews 2019-06-24  383  	n_bytes_written = ec_event_size(event);
dbaa1b36908ea0 Jens Axboe 2024-04-04  384  	if (!copy_to_iter_full(event, n_bytes_written, to))
aa8b8f9f9bef46 Nick Crews 2019-06-14  385  		n_bytes_written = -EFAULT;
1d333ef3d59902 Nick Crews 2019-06-24  386  	kfree(event);
f7b0bc5eafa449 Nick Crews 2019-05-23  387  
f7b0bc5eafa449 Nick Crews 2019-05-23  388  	return n_bytes_written;
f7b0bc5eafa449 Nick Crews 2019-05-23  389  }
f7b0bc5eafa449 Nick Crews 2019-05-23  390  

:::::: The code at line 353 was first introduced by commit
:::::: f7b0bc5eafa44941ddf92df6f46dd82cbfacec3e platform/chrome: wilco_ec: Add event handling

:::::: TO: Nick Crews <ncrews@chromium.org>
:::::: CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
