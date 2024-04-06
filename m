Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2646424
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712440795; cv=none; b=W/2An7IyWywQh0osZFe615vxoNo7jNMuipDF+nLBUiy6YQDktIWlJSI1Be8FgVqLR/ParHmMAlBtjfW1ALzV59KZbGrDHdKlGol91ZKbbVJc+iM2C9I+pWpc+D1zJWJjOPE9GrQbAuoYuVjr0e6EYWSVWlUEA1sOrlHuQw0j9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712440795; c=relaxed/simple;
	bh=C3nkdfwm3PbYXhWcowjoSFhElcOTxVqMRs8iZDzJYwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNd7bkWdZRZmHnDksmJQ4wgX2Vs/dOrgr5CsckfhAIBQhJ3HaXXkHLem/NZPGxdduLFBczR8rVtwO9E4+ZW7CMgeP+35IdRYqU3YjIBxBm7ur1EezWiH0SaSUatIaWyMoFCEdSMoKnrEc5rQOCFcT4tgDagF/pxJu+ndQXMZ6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrcpuvrc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrcpuvrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712440793; x=1743976793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C3nkdfwm3PbYXhWcowjoSFhElcOTxVqMRs8iZDzJYwg=;
  b=YrcpuvrcUc9C5srKVwTwmdIMcN6i8VbxYLwW8Yo+SMznBtX9tCPzov/q
   I27WoMK4SQhUVEO/+7MJzK+bnf3Ck/KaBUASJX/jva84NjL+xo3UAk9GA
   1tjBHtrw8Z75qj1otp73VsgDuaDo6XjYaGObEisnBs2a2CDQ2WDHDopgV
   SN+MrcEOiJdEJiqu82FfEygCXT1iJeYCN+lcTP8hZ88kLyTM6/RZZNMzn
   d7IerlXJUF+rC1ThczgsKl2V30SzkwBTznFtf61k2XQ5VenCJMCfLxZIt
   UiG/Ym2hDSN/1dIfe2Vra/eVVbbvT3UydLHhJYXCiCgOrxZI2CcqLHqal
   Q==;
X-CSE-ConnectionGUID: HIb0nhBhR62JfBfePZcuGg==
X-CSE-MsgGUID: t1IWhnyWSRqsGai6qysfVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="18318125"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="18318125"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 14:59:52 -0700
X-CSE-ConnectionGUID: b9TuwPjKQtatBfLwgmavJQ==
X-CSE-MsgGUID: inO1P1GZQeuC7mpFx7MK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="23977348"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2024 14:59:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtE4i-0003sg-0b;
	Sat, 06 Apr 2024 21:59:48 +0000
Date: Sun, 7 Apr 2024 05:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 83/126] drivers/misc/mei/main.c:170: warning:
 Function parameter or struct member 'iocb' not described in 'mei_read'
Message-ID: <202404070537.liI2CnG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1a95bcd36c1c2fd1c92f33b5ea95c2e0a5667100
commit: d49389b36002d6eaf722805fa21dd95d0f550bf2 [83/126] drivers/misc/mei: convert to read/write iterators
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240407/202404070537.liI2CnG5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070537.liI2CnG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070537.liI2CnG5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/mei/main.c:170: warning: Function parameter or struct member 'iocb' not described in 'mei_read'
>> drivers/misc/mei/main.c:170: warning: Function parameter or struct member 'to' not described in 'mei_read'
>> drivers/misc/mei/main.c:170: warning: Excess function parameter 'file' description in 'mei_read'
>> drivers/misc/mei/main.c:170: warning: Excess function parameter 'ubuf' description in 'mei_read'
>> drivers/misc/mei/main.c:170: warning: Excess function parameter 'length' description in 'mei_read'
>> drivers/misc/mei/main.c:170: warning: Excess function parameter 'offset' description in 'mei_read'
>> drivers/misc/mei/main.c:308: warning: Function parameter or struct member 'iocb' not described in 'mei_write'
>> drivers/misc/mei/main.c:308: warning: Function parameter or struct member 'from' not described in 'mei_write'
>> drivers/misc/mei/main.c:308: warning: Excess function parameter 'file' description in 'mei_write'
>> drivers/misc/mei/main.c:308: warning: Excess function parameter 'ubuf' description in 'mei_write'
>> drivers/misc/mei/main.c:308: warning: Excess function parameter 'length' description in 'mei_write'
>> drivers/misc/mei/main.c:308: warning: Excess function parameter 'offset' description in 'mei_write'


vim +170 drivers/misc/mei/main.c

ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  157  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  158  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  159  /**
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  160   * mei_read - the read function.
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  161   *
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  162   * @file: pointer to file structure
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  163   * @ubuf: pointer to user buffer
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  164   * @length: buffer length
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  165   * @offset: data offset in buffer
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  166   *
a8605ea2c20c2b drivers/misc/mei/main.c    Alexander Usyskin 2014-09-29  167   * Return: >=0 data length on success , <0 on error
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  168   */
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  169  static ssize_t mei_read(struct kiocb *iocb, struct iov_iter *to)
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15 @170  {
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  171  	struct file *file = iocb->ki_filp;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  172  	struct mei_cl *cl = file->private_data;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  173  	struct mei_device *dev;
a9bed61053af13 drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  174  	struct mei_cl_cb *cb = NULL;
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  175  	bool nonblock = !!(iocb->ki_filp->f_flags & O_NONBLOCK);
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  176  	size_t length = iov_iter_count(to);
5151e2b578e92f drivers/misc/mei/main.c    Tomas Winkler     2018-07-12  177  	ssize_t rets;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  178  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  179  	if (WARN_ON(!cl || !cl->dev))
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  180  		return -ENODEV;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  181  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  182  	dev = cl->dev;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  183  
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  184  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  185  	mutex_lock(&dev->device_lock);
b210d7506f416e drivers/misc/mei/main.c    Tomas Winkler     2012-08-07  186  	if (dev->dev_state != MEI_DEV_ENABLED) {
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  187  		rets = -ENODEV;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  188  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  189  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  190  
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  191  	if (length == 0) {
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  192  		rets = 0;
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  193  		goto out;
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  194  	}
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  195  
a9bed61053af13 drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  196  	cb = mei_cl_read_cb(cl, file);
8b2458f413c429 drivers/misc/mei/main.c    Alexander Usyskin 2016-01-07  197  	if (cb)
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  198  		goto copy_buffer;
8b2458f413c429 drivers/misc/mei/main.c    Alexander Usyskin 2016-01-07  199  
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  200  	if (iocb->ki_pos > 0)
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  201  		iocb->ki_pos = 0;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  202  
ff1586a7ea57a4 drivers/misc/mei/main.c    Alexander Usyskin 2016-07-26  203  	rets = mei_cl_read_start(cl, length, file);
ff1586a7ea57a4 drivers/misc/mei/main.c    Alexander Usyskin 2016-07-26  204  	if (rets && rets != -EBUSY) {
5151e2b578e92f drivers/misc/mei/main.c    Tomas Winkler     2018-07-12  205  		cl_dbg(dev, cl, "mei start read failure status = %zd\n", rets);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  206  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  207  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  208  
ff1586a7ea57a4 drivers/misc/mei/main.c    Alexander Usyskin 2016-07-26  209  	if (nonblock) {
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  210  		rets = -EAGAIN;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  211  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  212  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  213  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  214  	mutex_unlock(&dev->device_lock);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  215  	if (wait_event_interruptible(cl->rx_wait,
d1376f3d89d517 drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  216  				     mei_cl_read_cb(cl, file) ||
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  217  				     !mei_cl_is_connected(cl))) {
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  218  		if (signal_pending(current))
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  219  			return -EINTR;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  220  		return -ERESTARTSYS;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  221  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  222  	mutex_lock(&dev->device_lock);
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  223  
6a84d63d22a0ac drivers/misc/mei/main.c    Tomas Winkler     2015-03-27  224  	if (!mei_cl_is_connected(cl)) {
2d4d5481e2d6f9 drivers/misc/mei/main.c    Tomas Winkler     2016-06-23  225  		rets = -ENODEV;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  226  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  227  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  228  
a9bed61053af13 drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  229  	cb = mei_cl_read_cb(cl, file);
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  230  	if (!cb) {
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  231  		rets = 0;
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  232  		goto out;
cb97fbbcac1598 drivers/misc/mei/main.c    Alexander Usyskin 2017-02-08  233  	}
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  234  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  235  copy_buffer:
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  236  	/* now copy the data to user space */
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  237  	if (cb->status) {
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  238  		rets = cb->status;
5151e2b578e92f drivers/misc/mei/main.c    Tomas Winkler     2018-07-12  239  		cl_dbg(dev, cl, "read operation failed %zd\n", rets);
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  240  		goto free;
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  241  	}
3d33ff2457355a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  242  
35bf7692e765c2 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-17  243  	cl_dbg(dev, cl, "buf.size = %zu buf.idx = %zu offset = %lld\n",
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  244  	       cb->buf.size, cb->buf_idx, iocb->ki_pos);
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  245  	if (iocb->ki_pos  >= cb->buf_idx) {
8b2458f413c429 drivers/misc/mei/main.c    Alexander Usyskin 2016-01-07  246  		rets = 0;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  247  		goto free;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  248  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  249  
ebb108ef93605a drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  250  	/* length is being truncated to PAGE_SIZE,
ebb108ef93605a drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  251  	 * however buf_idx may point beyond that */
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  252  	length = min_t(size_t, length, cb->buf_idx - iocb->ki_pos);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  253  
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  254  	if (!copy_to_iter(cb->buf.data + iocb->ki_pos, length, to)) {
2bf94cabb199f7 drivers/misc/mei/main.c    Tomas Winkler     2014-09-29  255  		dev_dbg(dev->dev, "failed to copy data to userland\n");
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  256  		rets = -EFAULT;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  257  		goto free;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  258  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  259  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  260  	rets = length;
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  261  	iocb->ki_pos += length;
f862b6b24f0ffd drivers/misc/mei/main.c    Tomas Winkler     2016-02-07  262  	/* not all data was read, keep the cb */
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  263  	if (iocb->ki_pos < cb->buf_idx)
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  264  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  265  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  266  free:
d1376f3d89d517 drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  267  	mei_cl_del_rd_completed(cl, cb);
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  268  	iocb->ki_pos = 0;
928fa6664b362a drivers/misc/mei/main.c    Tomas Winkler     2015-02-10  269  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  270  out:
5151e2b578e92f drivers/misc/mei/main.c    Tomas Winkler     2018-07-12  271  	cl_dbg(dev, cl, "end mei read rets = %zd\n", rets);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  272  	mutex_unlock(&dev->device_lock);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  273  	return rets;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  274  }
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  275  
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  276  /**
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  277   * mei_cl_vtag_by_fp - obtain the vtag by file pointer
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  278   *
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  279   * @cl: host client
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  280   * @fp: pointer to file structure
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  281   *
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  282   * Return: vtag value on success, otherwise 0
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  283   */
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  284  static u8 mei_cl_vtag_by_fp(const struct mei_cl *cl, const struct file *fp)
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  285  {
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  286  	struct mei_cl_vtag *cl_vtag;
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  287  
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  288  	if (!fp)
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  289  		return 0;
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  290  
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  291  	list_for_each_entry(cl_vtag, &cl->vtag_map, list)
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  292  		if (cl_vtag->fp == fp)
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  293  			return cl_vtag->vtag;
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  294  	return 0;
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  295  }
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  296  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  297  /**
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  298   * mei_write - the write function.
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  299   *
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  300   * @file: pointer to file structure
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  301   * @ubuf: pointer to user buffer
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  302   * @length: buffer length
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  303   * @offset: data offset in buffer
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  304   *
a8605ea2c20c2b drivers/misc/mei/main.c    Alexander Usyskin 2014-09-29  305   * Return: >=0 data length on success , <0 on error
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  306   */
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  307  static ssize_t mei_write(struct kiocb *iocb, struct iov_iter *from)
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15 @308  {
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  309  	struct file *file = iocb->ki_filp;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  310  	struct mei_cl *cl = file->private_data;
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  311  	size_t length = iov_iter_count(from);
6cbb097fd3903f drivers/misc/mei/main.c    Alexander Usyskin 2016-02-10  312  	struct mei_cl_cb *cb;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  313  	struct mei_device *dev;
5151e2b578e92f drivers/misc/mei/main.c    Tomas Winkler     2018-07-12  314  	ssize_t rets;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  315  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  316  	if (WARN_ON(!cl || !cl->dev))
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  317  		return -ENODEV;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  318  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  319  	dev = cl->dev;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  320  
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  321  	mutex_lock(&dev->device_lock);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  322  
b210d7506f416e drivers/misc/mei/main.c    Tomas Winkler     2012-08-07  323  	if (dev->dev_state != MEI_DEV_ENABLED) {
75f0ee1559c5d5 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  324  		rets = -ENODEV;
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  325  		goto out;
75f0ee1559c5d5 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  326  	}
75f0ee1559c5d5 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  327  
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  328  	if (!mei_cl_is_connected(cl)) {
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  329  		cl_err(dev, cl, "is not connected");
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  330  		rets = -ENODEV;
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  331  		goto out;
75f0ee1559c5d5 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  332  	}
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  333  
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  334  	if (!mei_me_cl_is_active(cl->me_cl)) {
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  335  		rets = -ENOTTY;
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  336  		goto out;
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  337  	}
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  338  
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  339  	if (length > mei_cl_mtu(cl)) {
dd5de1f165ade4 drivers/misc/mei/main.c    Tomas Winkler     2013-09-02  340  		rets = -EFBIG;
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  341  		goto out;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  342  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  343  
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  344  	if (length == 0) {
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  345  		rets = 0;
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  346  		goto out;
75f0ee1559c5d5 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  347  	}
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  348  
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  349  	while (cl->tx_cb_queued >= dev->tx_queue_limit) {
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  350  		if (file->f_flags & O_NONBLOCK) {
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  351  			rets = -EAGAIN;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  352  			goto out;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  353  		}
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  354  		mutex_unlock(&dev->device_lock);
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  355  		rets = wait_event_interruptible(cl->tx_wait,
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  356  				cl->writing_state == MEI_WRITE_COMPLETE ||
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  357  				(!mei_cl_is_connected(cl)));
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  358  		mutex_lock(&dev->device_lock);
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  359  		if (rets) {
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  360  			if (signal_pending(current))
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  361  				rets = -EINTR;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  362  			goto out;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  363  		}
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  364  		if (!mei_cl_is_connected(cl)) {
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  365  			rets = -ENODEV;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  366  			goto out;
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  367  		}
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  368  	}
af336cabe08363 drivers/misc/mei/main.c    Alexander Usyskin 2018-02-25  369  
6cbb097fd3903f drivers/misc/mei/main.c    Alexander Usyskin 2016-02-10  370  	cb = mei_cl_alloc_cb(cl, length, MEI_FOP_WRITE, file);
6cbb097fd3903f drivers/misc/mei/main.c    Alexander Usyskin 2016-02-10  371  	if (!cb) {
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  372  		rets = -ENOMEM;
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  373  		goto out;
33d28c92052574 drivers/misc/mei/main.c    Tomas Winkler     2012-10-09  374  	}
f35fe5f47ed0ea drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  375  	cb->vtag = mei_cl_vtag_by_fp(cl, file);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  376  
d49389b36002d6 drivers/misc/mei/main.c    Jens Axboe        2024-04-06  377  	rets = !copy_from_iter_full(cb->buf.data, length, from);
d8b29efa27de17 drivers/misc/mei/main.c    Alexander Usyskin 2013-09-02  378  	if (rets) {
2bf94cabb199f7 drivers/misc/mei/main.c    Tomas Winkler     2014-09-29  379  		dev_dbg(dev->dev, "failed to copy data from userland\n");
d8b29efa27de17 drivers/misc/mei/main.c    Alexander Usyskin 2013-09-02  380  		rets = -EFAULT;
6cbb097fd3903f drivers/misc/mei/main.c    Alexander Usyskin 2016-02-10  381  		mei_io_cb_free(cb);
4234a6deb5ab04 drivers/misc/mei/main.c    Tomas Winkler     2013-04-08  382  		goto out;
d8b29efa27de17 drivers/misc/mei/main.c    Alexander Usyskin 2013-09-02  383  	}
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  384  
83f47eea742c11 drivers/misc/mei/main.c    Alexander Usyskin 2022-11-16  385  	rets = mei_cl_write(cl, cb, MAX_SCHEDULE_TIMEOUT);
b0d0cf77e72a9d drivers/misc/mei/main.c    Tomas Winkler     2012-11-01  386  out:
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  387  	mutex_unlock(&dev->device_lock);
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  388  	return rets;
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  389  }
ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  390  

:::::: The code at line 170 was first introduced by commit
:::::: ab841160d907bfc2305d3bf66d8275e807838e1a staging/mei: PCI device and char driver support.

:::::: TO: Oren Weil <oren.jer.weil@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
