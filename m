Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449328E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712296717; cv=none; b=u2DuawggDcl9Zuj4E3lHDAvGXwphaLIuAKdoH59AumdmoS6BYvwbzc6qFxZtvSpzV3l2Mn70Qzu//vA46vAdMcXiPb38hrYNkqTpSXrWyqmRTxK6Prm3UcutsYFb/e+IHYI9mbajsjaZN5ORI6bB34dqoueSzGl8yunUYnH/2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712296717; c=relaxed/simple;
	bh=iQax4IcqZXbJdBB10rufVmdsLmMgCuInbxBbXp5Wseo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPm5EU7M9Z9fwr1lLzfaGfguu17RW1SHE/gsUqNfGlkQsTXfJw/Ox3qGetCHwfHUI57waFHP2S/xZzVH3br2UkW+U+JGfnfsiHPKzdUZ914whYnou8G5/Tawwf372ejOZJ9PFz2htOYdfcmmAP3tjJ9EZkuiuPzkWGDfY2I1hdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDMm/1ol; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDMm/1ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712296715; x=1743832715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQax4IcqZXbJdBB10rufVmdsLmMgCuInbxBbXp5Wseo=;
  b=oDMm/1oleYbb7Mbv6csvQ2iWaDNDDhlowu+PiQ91c4QPIN2Z28qlQLMb
   jlFjW7Iw0L26TtlAa7Qx+RvuESNW9EBHXrOsALm71xdBgM1qBV4SSUZHL
   aoRbuG1UVEMEa4C5d/rW5lZ9DCj2YXL7TXzAOtFPsAavKmCPANVQaXb7I
   raOAUExtcgfdws8PweKEe12xeLjypHFHAyPXIWk7mL5IqiUh0W+yZwg+5
   emFdF7SGCnOU+sGn6oxSpu+RRPjTMQ+drEbhVsuGuQS4HIDCgaMoUktj4
   YnsF149kIvG0PBBmvHfz+KabjuYqQIoin5VOwU/vwQ9Z8KTAgD8f5rS2J
   A==;
X-CSE-ConnectionGUID: e0jzH3K7TRaKBayuvGq5lg==
X-CSE-MsgGUID: CyMBCKv6S+GHm1OXM6cuTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18966828"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18966828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 22:58:32 -0700
X-CSE-ConnectionGUID: Egzl5u98Q8KduD3wZfz79Q==
X-CSE-MsgGUID: h8ABkUQSRQGTm1mc7s6OCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="42228960"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Apr 2024 22:58:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rscaq-0001xL-2T;
	Fri, 05 Apr 2024 05:58:28 +0000
Date: Fri, 5 Apr 2024 13:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/37]
 drivers/staging/axis-fifo/axis-fifo.c:349: warning: Function parameter or
 struct member 'iocb' not described in 'axis_fifo_read'
Message-ID: <202404051317.OHoUjsgk-lkp@intel.com>
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
commit: 9bddfc061dffa3ca19b6e971ef1f1281458ee8a3 [15/37] staging: convert drivers to read/write iterators
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404051317.OHoUjsgk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051317.OHoUjsgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051317.OHoUjsgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Function parameter or struct member 'iocb' not described in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Function parameter or struct member 'to' not described in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Excess function parameter 'f' description in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Excess function parameter 'buf' description in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Excess function parameter 'len' description in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:349: warning: Excess function parameter 'off' description in 'axis_fifo_read'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Function parameter or struct member 'iocb' not described in 'axis_fifo_write'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Function parameter or struct member 'from' not described in 'axis_fifo_write'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Excess function parameter 'f' description in 'axis_fifo_write'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Excess function parameter 'buf' description in 'axis_fifo_write'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Excess function parameter 'len' description in 'axis_fifo_write'
>> drivers/staging/axis-fifo/axis-fifo.c:468: warning: Excess function parameter 'off' description in 'axis_fifo_write'


vim +349 drivers/staging/axis-fifo/axis-fifo.c

4a965c5f89decd Jacob Feder       2018-07-22  332  
0443b3f4436321 Quentin Deslandes 2020-01-21  333  /**
bbf40b2f6e38d0 Lee Jones         2021-04-14  334   * axis_fifo_read() - Read a packet from AXIS-FIFO character device.
c848434c629db5 Lee Jones         2021-04-14  335   * @f: Open file.
c848434c629db5 Lee Jones         2021-04-14  336   * @buf: User space buffer to read to.
c848434c629db5 Lee Jones         2021-04-14  337   * @len: User space buffer length.
c848434c629db5 Lee Jones         2021-04-14  338   * @off: Buffer offset.
0443b3f4436321 Quentin Deslandes 2020-01-21  339   *
0443b3f4436321 Quentin Deslandes 2020-01-21  340   * As defined by the device's documentation, we need to check the device's
0443b3f4436321 Quentin Deslandes 2020-01-21  341   * occupancy before reading the length register and then the data. All these
0443b3f4436321 Quentin Deslandes 2020-01-21  342   * operations must be executed atomically, in order and one after the other
0443b3f4436321 Quentin Deslandes 2020-01-21  343   * without missing any.
0443b3f4436321 Quentin Deslandes 2020-01-21  344   *
0443b3f4436321 Quentin Deslandes 2020-01-21  345   * Returns the number of bytes read from the device or negative error code
0443b3f4436321 Quentin Deslandes 2020-01-21  346   *	on failure.
0443b3f4436321 Quentin Deslandes 2020-01-21  347   */
9bddfc061dffa3 Jens Axboe        2024-04-03  348  static ssize_t axis_fifo_read(struct kiocb *iocb, struct iov_iter *to)
4a965c5f89decd Jacob Feder       2018-07-22 @349  {
9bddfc061dffa3 Jens Axboe        2024-04-03  350  	struct axis_fifo *fifo = iocb->ki_filp->private_data;
9bddfc061dffa3 Jens Axboe        2024-04-03  351  	size_t len = iov_iter_count(to);
4a965c5f89decd Jacob Feder       2018-07-22  352  	size_t bytes_available;
4a965c5f89decd Jacob Feder       2018-07-22  353  	unsigned int words_available;
4a965c5f89decd Jacob Feder       2018-07-22  354  	unsigned int copied;
4a965c5f89decd Jacob Feder       2018-07-22  355  	unsigned int copy;
4a965c5f89decd Jacob Feder       2018-07-22  356  	unsigned int i;
4a965c5f89decd Jacob Feder       2018-07-22  357  	int ret;
4a965c5f89decd Jacob Feder       2018-07-22  358  	u32 tmp_buf[READ_BUF_SIZE];
4a965c5f89decd Jacob Feder       2018-07-22  359  
4a965c5f89decd Jacob Feder       2018-07-22  360  	if (fifo->read_flags & O_NONBLOCK) {
0443b3f4436321 Quentin Deslandes 2020-01-21  361  		/*
0443b3f4436321 Quentin Deslandes 2020-01-21  362  		 * Device opened in non-blocking mode. Try to lock it and then
0443b3f4436321 Quentin Deslandes 2020-01-21  363  		 * check if any packet is available.
4a965c5f89decd Jacob Feder       2018-07-22  364  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  365  		if (!mutex_trylock(&fifo->read_lock))
4a965c5f89decd Jacob Feder       2018-07-22  366  			return -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  367  
0443b3f4436321 Quentin Deslandes 2020-01-21  368  		if (!ioread32(fifo->base_addr + XLLF_RDFO_OFFSET)) {
0443b3f4436321 Quentin Deslandes 2020-01-21  369  			ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  370  			goto end_unlock;
0443b3f4436321 Quentin Deslandes 2020-01-21  371  		}
4a965c5f89decd Jacob Feder       2018-07-22  372  	} else {
4a965c5f89decd Jacob Feder       2018-07-22  373  		/* opened in blocking mode
4a965c5f89decd Jacob Feder       2018-07-22  374  		 * wait for a packet available interrupt (or timeout)
4a965c5f89decd Jacob Feder       2018-07-22  375  		 * if nothing is currently available
4a965c5f89decd Jacob Feder       2018-07-22  376  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  377  		mutex_lock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  378  		ret = wait_event_interruptible_timeout(fifo->read_queue,
4a965c5f89decd Jacob Feder       2018-07-22  379  			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
752cbd8f191678 Khadija Kamran    2023-03-17  380  			read_timeout);
4a965c5f89decd Jacob Feder       2018-07-22  381  
0443b3f4436321 Quentin Deslandes 2020-01-21  382  		if (ret <= 0) {
4a965c5f89decd Jacob Feder       2018-07-22  383  			if (ret == 0) {
0443b3f4436321 Quentin Deslandes 2020-01-21  384  				ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  385  			} else if (ret != -ERESTARTSYS) {
4a965c5f89decd Jacob Feder       2018-07-22  386  				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in read (ret=%i)\n",
4a965c5f89decd Jacob Feder       2018-07-22  387  					ret);
0443b3f4436321 Quentin Deslandes 2020-01-21  388  			}
0443b3f4436321 Quentin Deslandes 2020-01-21  389  
0443b3f4436321 Quentin Deslandes 2020-01-21  390  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  391  		}
4a965c5f89decd Jacob Feder       2018-07-22  392  	}
4a965c5f89decd Jacob Feder       2018-07-22  393  
4a965c5f89decd Jacob Feder       2018-07-22  394  	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
4a965c5f89decd Jacob Feder       2018-07-22  395  	if (!bytes_available) {
4a965c5f89decd Jacob Feder       2018-07-22  396  		dev_err(fifo->dt_device, "received a packet of length 0 - fifo core will be reset\n");
4a965c5f89decd Jacob Feder       2018-07-22  397  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  398  		ret = -EIO;
0443b3f4436321 Quentin Deslandes 2020-01-21  399  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  400  	}
4a965c5f89decd Jacob Feder       2018-07-22  401  
4a965c5f89decd Jacob Feder       2018-07-22  402  	if (bytes_available > len) {
4a965c5f89decd Jacob Feder       2018-07-22  403  		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu) - fifo core will be reset\n",
4a965c5f89decd Jacob Feder       2018-07-22  404  			bytes_available, len);
4a965c5f89decd Jacob Feder       2018-07-22  405  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  406  		ret = -EINVAL;
0443b3f4436321 Quentin Deslandes 2020-01-21  407  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  408  	}
4a965c5f89decd Jacob Feder       2018-07-22  409  
4a965c5f89decd Jacob Feder       2018-07-22  410  	if (bytes_available % sizeof(u32)) {
4a965c5f89decd Jacob Feder       2018-07-22  411  		/* this probably can't happen unless IP
4a965c5f89decd Jacob Feder       2018-07-22  412  		 * registers were previously mishandled
4a965c5f89decd Jacob Feder       2018-07-22  413  		 */
4a965c5f89decd Jacob Feder       2018-07-22  414  		dev_err(fifo->dt_device, "received a packet that isn't word-aligned - fifo core will be reset\n");
4a965c5f89decd Jacob Feder       2018-07-22  415  		reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  416  		ret = -EIO;
0443b3f4436321 Quentin Deslandes 2020-01-21  417  		goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  418  	}
4a965c5f89decd Jacob Feder       2018-07-22  419  
4a965c5f89decd Jacob Feder       2018-07-22  420  	words_available = bytes_available / sizeof(u32);
4a965c5f89decd Jacob Feder       2018-07-22  421  
4a965c5f89decd Jacob Feder       2018-07-22  422  	/* read data into an intermediate buffer, copying the contents
4a965c5f89decd Jacob Feder       2018-07-22  423  	 * to userspace when the buffer is full
4a965c5f89decd Jacob Feder       2018-07-22  424  	 */
4a965c5f89decd Jacob Feder       2018-07-22  425  	copied = 0;
4a965c5f89decd Jacob Feder       2018-07-22  426  	while (words_available > 0) {
4a965c5f89decd Jacob Feder       2018-07-22  427  		copy = min(words_available, READ_BUF_SIZE);
4a965c5f89decd Jacob Feder       2018-07-22  428  
4a965c5f89decd Jacob Feder       2018-07-22  429  		for (i = 0; i < copy; i++) {
4a965c5f89decd Jacob Feder       2018-07-22  430  			tmp_buf[i] = ioread32(fifo->base_addr +
4a965c5f89decd Jacob Feder       2018-07-22  431  					      XLLF_RDFD_OFFSET);
4a965c5f89decd Jacob Feder       2018-07-22  432  		}
4a965c5f89decd Jacob Feder       2018-07-22  433  
9bddfc061dffa3 Jens Axboe        2024-04-03  434  		if (!copy_to_iter_full(tmp_buf, copy * sizeof(u32), to)) {
4a965c5f89decd Jacob Feder       2018-07-22  435  			reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  436  			ret = -EFAULT;
0443b3f4436321 Quentin Deslandes 2020-01-21  437  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  438  		}
4a965c5f89decd Jacob Feder       2018-07-22  439  
4a965c5f89decd Jacob Feder       2018-07-22  440  		copied += copy;
4a965c5f89decd Jacob Feder       2018-07-22  441  		words_available -= copy;
4a965c5f89decd Jacob Feder       2018-07-22  442  	}
4a965c5f89decd Jacob Feder       2018-07-22  443  
0443b3f4436321 Quentin Deslandes 2020-01-21  444  	ret = bytes_available;
0443b3f4436321 Quentin Deslandes 2020-01-21  445  
0443b3f4436321 Quentin Deslandes 2020-01-21  446  end_unlock:
0443b3f4436321 Quentin Deslandes 2020-01-21  447  	mutex_unlock(&fifo->read_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  448  
0443b3f4436321 Quentin Deslandes 2020-01-21  449  	return ret;
4a965c5f89decd Jacob Feder       2018-07-22  450  }
4a965c5f89decd Jacob Feder       2018-07-22  451  
0443b3f4436321 Quentin Deslandes 2020-01-21  452  /**
0443b3f4436321 Quentin Deslandes 2020-01-21  453   * axis_fifo_write() - Write buffer to AXIS-FIFO character device.
c848434c629db5 Lee Jones         2021-04-14  454   * @f: Open file.
c848434c629db5 Lee Jones         2021-04-14  455   * @buf: User space buffer to write to the device.
c848434c629db5 Lee Jones         2021-04-14  456   * @len: User space buffer length.
c848434c629db5 Lee Jones         2021-04-14  457   * @off: Buffer offset.
0443b3f4436321 Quentin Deslandes 2020-01-21  458   *
0443b3f4436321 Quentin Deslandes 2020-01-21  459   * As defined by the device's documentation, we need to write to the device's
0443b3f4436321 Quentin Deslandes 2020-01-21  460   * data buffer then to the device's packet length register atomically. Also,
0443b3f4436321 Quentin Deslandes 2020-01-21  461   * we need to lock before checking if the device has available space to avoid
0443b3f4436321 Quentin Deslandes 2020-01-21  462   * any concurrency issue.
0443b3f4436321 Quentin Deslandes 2020-01-21  463   *
0443b3f4436321 Quentin Deslandes 2020-01-21  464   * Returns the number of bytes written to the device or negative error code
0443b3f4436321 Quentin Deslandes 2020-01-21  465   *	on failure.
0443b3f4436321 Quentin Deslandes 2020-01-21  466   */
9bddfc061dffa3 Jens Axboe        2024-04-03  467  static ssize_t axis_fifo_write(struct kiocb *iocb, struct iov_iter *from)
4a965c5f89decd Jacob Feder       2018-07-22 @468  {
9bddfc061dffa3 Jens Axboe        2024-04-03  469  	struct axis_fifo *fifo = iocb->ki_filp->private_data;
9bddfc061dffa3 Jens Axboe        2024-04-03  470  	size_t len = iov_iter_count(from);
4a965c5f89decd Jacob Feder       2018-07-22  471  	unsigned int words_to_write;
4a965c5f89decd Jacob Feder       2018-07-22  472  	unsigned int copied;
4a965c5f89decd Jacob Feder       2018-07-22  473  	unsigned int copy;
4a965c5f89decd Jacob Feder       2018-07-22  474  	unsigned int i;
4a965c5f89decd Jacob Feder       2018-07-22  475  	int ret;
4a965c5f89decd Jacob Feder       2018-07-22  476  	u32 tmp_buf[WRITE_BUF_SIZE];
4a965c5f89decd Jacob Feder       2018-07-22  477  
4a965c5f89decd Jacob Feder       2018-07-22  478  	if (len % sizeof(u32)) {
4a965c5f89decd Jacob Feder       2018-07-22  479  		dev_err(fifo->dt_device,
4a965c5f89decd Jacob Feder       2018-07-22  480  			"tried to send a packet that isn't word-aligned\n");
4a965c5f89decd Jacob Feder       2018-07-22  481  		return -EINVAL;
4a965c5f89decd Jacob Feder       2018-07-22  482  	}
4a965c5f89decd Jacob Feder       2018-07-22  483  
4a965c5f89decd Jacob Feder       2018-07-22  484  	words_to_write = len / sizeof(u32);
4a965c5f89decd Jacob Feder       2018-07-22  485  
4a965c5f89decd Jacob Feder       2018-07-22  486  	if (!words_to_write) {
4a965c5f89decd Jacob Feder       2018-07-22  487  		dev_err(fifo->dt_device,
4a965c5f89decd Jacob Feder       2018-07-22  488  			"tried to send a packet of length 0\n");
4a965c5f89decd Jacob Feder       2018-07-22  489  		return -EINVAL;
4a965c5f89decd Jacob Feder       2018-07-22  490  	}
4a965c5f89decd Jacob Feder       2018-07-22  491  
4a965c5f89decd Jacob Feder       2018-07-22  492  	if (words_to_write > fifo->tx_fifo_depth) {
4a965c5f89decd Jacob Feder       2018-07-22  493  		dev_err(fifo->dt_device, "tried to write more words [%u] than slots in the fifo buffer [%u]\n",
4a965c5f89decd Jacob Feder       2018-07-22  494  			words_to_write, fifo->tx_fifo_depth);
4a965c5f89decd Jacob Feder       2018-07-22  495  		return -EINVAL;
4a965c5f89decd Jacob Feder       2018-07-22  496  	}
4a965c5f89decd Jacob Feder       2018-07-22  497  
4a965c5f89decd Jacob Feder       2018-07-22  498  	if (fifo->write_flags & O_NONBLOCK) {
0443b3f4436321 Quentin Deslandes 2020-01-21  499  		/*
0443b3f4436321 Quentin Deslandes 2020-01-21  500  		 * Device opened in non-blocking mode. Try to lock it and then
0443b3f4436321 Quentin Deslandes 2020-01-21  501  		 * check if there is any room to write the given buffer.
4a965c5f89decd Jacob Feder       2018-07-22  502  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  503  		if (!mutex_trylock(&fifo->write_lock))
0443b3f4436321 Quentin Deslandes 2020-01-21  504  			return -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  505  
4a965c5f89decd Jacob Feder       2018-07-22  506  		if (words_to_write > ioread32(fifo->base_addr +
4a965c5f89decd Jacob Feder       2018-07-22  507  					      XLLF_TDFV_OFFSET)) {
0443b3f4436321 Quentin Deslandes 2020-01-21  508  			ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  509  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  510  		}
4a965c5f89decd Jacob Feder       2018-07-22  511  	} else {
4a965c5f89decd Jacob Feder       2018-07-22  512  		/* opened in blocking mode */
4a965c5f89decd Jacob Feder       2018-07-22  513  
4a965c5f89decd Jacob Feder       2018-07-22  514  		/* wait for an interrupt (or timeout) if there isn't
4a965c5f89decd Jacob Feder       2018-07-22  515  		 * currently enough room in the fifo
4a965c5f89decd Jacob Feder       2018-07-22  516  		 */
0443b3f4436321 Quentin Deslandes 2020-01-21  517  		mutex_lock(&fifo->write_lock);
0443b3f4436321 Quentin Deslandes 2020-01-21  518  		ret = wait_event_interruptible_timeout(fifo->write_queue,
4a965c5f89decd Jacob Feder       2018-07-22  519  			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
4a965c5f89decd Jacob Feder       2018-07-22  520  				 >= words_to_write,
752cbd8f191678 Khadija Kamran    2023-03-17  521  			write_timeout);
4a965c5f89decd Jacob Feder       2018-07-22  522  
0443b3f4436321 Quentin Deslandes 2020-01-21  523  		if (ret <= 0) {
4a965c5f89decd Jacob Feder       2018-07-22  524  			if (ret == 0) {
0443b3f4436321 Quentin Deslandes 2020-01-21  525  				ret = -EAGAIN;
0443b3f4436321 Quentin Deslandes 2020-01-21  526  			} else if (ret != -ERESTARTSYS) {
0443b3f4436321 Quentin Deslandes 2020-01-21  527  				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
4a965c5f89decd Jacob Feder       2018-07-22  528  					ret);
0443b3f4436321 Quentin Deslandes 2020-01-21  529  			}
0443b3f4436321 Quentin Deslandes 2020-01-21  530  
0443b3f4436321 Quentin Deslandes 2020-01-21  531  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  532  		}
4a965c5f89decd Jacob Feder       2018-07-22  533  	}
4a965c5f89decd Jacob Feder       2018-07-22  534  
4a965c5f89decd Jacob Feder       2018-07-22  535  	/* write data from an intermediate buffer into the fifo IP, refilling
4a965c5f89decd Jacob Feder       2018-07-22  536  	 * the buffer with userspace data as needed
4a965c5f89decd Jacob Feder       2018-07-22  537  	 */
4a965c5f89decd Jacob Feder       2018-07-22  538  	copied = 0;
4a965c5f89decd Jacob Feder       2018-07-22  539  	while (words_to_write > 0) {
4a965c5f89decd Jacob Feder       2018-07-22  540  		copy = min(words_to_write, WRITE_BUF_SIZE);
4a965c5f89decd Jacob Feder       2018-07-22  541  
9bddfc061dffa3 Jens Axboe        2024-04-03  542  		if (!copy_from_iter_full(tmp_buf, copy * sizeof(u32), from)) {
4a965c5f89decd Jacob Feder       2018-07-22  543  			reset_ip_core(fifo);
0443b3f4436321 Quentin Deslandes 2020-01-21  544  			ret = -EFAULT;
0443b3f4436321 Quentin Deslandes 2020-01-21  545  			goto end_unlock;
4a965c5f89decd Jacob Feder       2018-07-22  546  		}
4a965c5f89decd Jacob Feder       2018-07-22  547  
4a965c5f89decd Jacob Feder       2018-07-22  548  		for (i = 0; i < copy; i++)
4a965c5f89decd Jacob Feder       2018-07-22  549  			iowrite32(tmp_buf[i], fifo->base_addr +
4a965c5f89decd Jacob Feder       2018-07-22  550  				  XLLF_TDFD_OFFSET);
4a965c5f89decd Jacob Feder       2018-07-22  551  
4a965c5f89decd Jacob Feder       2018-07-22  552  		copied += copy;
4a965c5f89decd Jacob Feder       2018-07-22  553  		words_to_write -= copy;
4a965c5f89decd Jacob Feder       2018-07-22  554  	}
4a965c5f89decd Jacob Feder       2018-07-22  555  
0443b3f4436321 Quentin Deslandes 2020-01-21  556  	ret = copied * sizeof(u32);
0443b3f4436321 Quentin Deslandes 2020-01-21  557  
4a965c5f89decd Jacob Feder       2018-07-22  558  	/* write packet size to fifo */
0443b3f4436321 Quentin Deslandes 2020-01-21  559  	iowrite32(ret, fifo->base_addr + XLLF_TLR_OFFSET);
0443b3f4436321 Quentin Deslandes 2020-01-21  560  
0443b3f4436321 Quentin Deslandes 2020-01-21  561  end_unlock:
0443b3f4436321 Quentin Deslandes 2020-01-21  562  	mutex_unlock(&fifo->write_lock);
4a965c5f89decd Jacob Feder       2018-07-22  563  
0443b3f4436321 Quentin Deslandes 2020-01-21  564  	return ret;
4a965c5f89decd Jacob Feder       2018-07-22  565  }
4a965c5f89decd Jacob Feder       2018-07-22  566  

:::::: The code at line 349 was first introduced by commit
:::::: 4a965c5f89decd636129cddc47e5f2c61e8f13e6 staging: add driver for Xilinx AXI-Stream FIFO v4.1 IP core

:::::: TO: Jacob Feder <jacobsfeder@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
