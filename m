Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3417167C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 18:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712341084; cv=none; b=i3KqYog16ECW0sB1UYnuP+v+rp/bITOhqINxP3Cpr/Ndsz/LG60u/ZPu5jPr8VEAF25v5oEMWPOjFN7nCRNenlt8ffiXtMx7Ex4/V/ss+V3wrUYt3uRg1HmnRxGHFgCmGnCaIY3SkV5QsD7CE6MPnx2snzVvvxYSOWH4D6OJKEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712341084; c=relaxed/simple;
	bh=9cfoJoRa5sdEhrU9/OtSBELO/6zX3I9iRxQMhDQ9SaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uNZVIRWZDy48/9TEtKVjnbkpaBTkuWTmQpuVsx+Ymk6XIRvVFhx49vFDEOM8XMxip9KOdJYVxNZIfCxTVWFZVoafQB9xC3xgXsA7eXUHgZYtNF0wmIQaGJKzLZ5F/voWdEbCdwQ21EIU7LupOcvxRfE226BVlD9+vXqy7KDyHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3H+XnJv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3H+XnJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712341083; x=1743877083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9cfoJoRa5sdEhrU9/OtSBELO/6zX3I9iRxQMhDQ9SaU=;
  b=A3H+XnJvDNz+xtmA/reCbwvpbnL6VF8l0eKGFoyFBIRAWMBfcHKvQG3c
   NmPkxYOaqCyemR+ONcW9nHJa9DfXfXrBrpRLe/QXzU+jxw6rix94yACcv
   hMsQ/8Y9SldYPuOEbx9aLId+WqPhWYCiPBIbEenZcWn78E5VSwhBWxKq6
   m1UjBX3+mwoxQ2zPwBFPWE4IZAYyXg+mzaxzODHS6yGWcdm5MiAVoISdX
   qpfX2rjURl/K/u9Deq8nZovdOzCvuSD60EaVR8xVvwoOmXEPIfgU4PbDz
   Q2cVEp917Ttas2mf/RPOxoatqTRIQ4PjXrVMRAMe0lRxJ+2zkLZ8rMXjU
   A==;
X-CSE-ConnectionGUID: I52qEZWlTP2+R8h8gJH/Uw==
X-CSE-MsgGUID: TpYtr/mnQxO9oYthY256UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18414821"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="18414821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 11:18:01 -0700
X-CSE-ConnectionGUID: LvGfoTqjTAebQbKBF+Ew1Q==
X-CSE-MsgGUID: YPZStIz2Sfq3yTLm+VvFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19154284"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2024 11:17:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rso8R-0002ao-0A;
	Fri, 05 Apr 2024 18:17:55 +0000
Date: Sat, 6 Apr 2024 02:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 38/40] drivers/scsi/lpfc/lpfc_debugfs.c:2554:
 warning: Function parameter or struct member 'iocb' not described in
 'lpfc_debugfs_read'
Message-ID: <202404060222.wrkac6LB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   a9cbf952fcac761bffbb44eab7d5ef86b310c71c
commit: 984d0f9f624b50b7e18ff827c57cfaf9af04e352 [38/40] drivers/scsi: convert to ->read_iter and ->write_iter
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404060222.wrkac6LB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060222.wrkac6LB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060222.wrkac6LB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Function parameter or struct member 'iocb' not described in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Function parameter or struct member 'to' not described in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'file' description in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'buf' description in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'nbytes' description in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2554: warning: Excess function parameter 'ppos' description in 'lpfc_debugfs_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Function parameter or struct member 'iocb' not described in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Function parameter or struct member 'from' not described in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'file' description in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'buf' description in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'nbytes' description in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:2601: warning: Excess function parameter 'ppos' description in 'lpfc_debugfs_multixripools_write'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Excess function parameter 'file' description in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Excess function parameter 'buf' description in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3290: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_pcicfg_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_baracc_read'
>> drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'file' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'buf' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:3584: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_baracc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Excess function parameter 'file' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Excess function parameter 'buf' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4039: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_queinfo_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Excess function parameter 'file' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Excess function parameter 'buf' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4246: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_queacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Excess function parameter 'file' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Excess function parameter 'buf' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4619: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_drbacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Excess function parameter 'file' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Excess function parameter 'buf' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:4837: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_ctlacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Excess function parameter 'file' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Excess function parameter 'buf' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5030: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_mbxacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Function parameter or struct member 'iocb' not described in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Function parameter or struct member 'to' not described in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Excess function parameter 'file' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Excess function parameter 'buf' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Excess function parameter 'nbytes' description in 'lpfc_idiag_extacc_read'
   drivers/scsi/lpfc/lpfc_debugfs.c:5395: warning: Excess function parameter 'ppos' description in 'lpfc_idiag_extacc_read'


vim +2554 drivers/scsi/lpfc/lpfc_debugfs.c

bd2cdd5e400f59 James Smart 2017-02-12  2535  
bd2cdd5e400f59 James Smart 2017-02-12  2536  /**
bd2cdd5e400f59 James Smart 2017-02-12  2537   * lpfc_debugfs_read - Read a debugfs file
bd2cdd5e400f59 James Smart 2017-02-12  2538   * @file: The file pointer to read from.
bd2cdd5e400f59 James Smart 2017-02-12  2539   * @buf: The buffer to copy the data to.
bd2cdd5e400f59 James Smart 2017-02-12  2540   * @nbytes: The number of bytes to read.
bd2cdd5e400f59 James Smart 2017-02-12  2541   * @ppos: The position in the file to start reading from.
bd2cdd5e400f59 James Smart 2017-02-12  2542   *
bd2cdd5e400f59 James Smart 2017-02-12  2543   * Description:
bd2cdd5e400f59 James Smart 2017-02-12  2544   * This routine reads data from from the buffer indicated in the private_data
bd2cdd5e400f59 James Smart 2017-02-12  2545   * field of @file. It will start reading at @ppos and copy up to @nbytes of
bd2cdd5e400f59 James Smart 2017-02-12  2546   * data to @buf.
bd2cdd5e400f59 James Smart 2017-02-12  2547   *
bd2cdd5e400f59 James Smart 2017-02-12  2548   * Returns:
bd2cdd5e400f59 James Smart 2017-02-12  2549   * This function returns the amount of data that was read (this could be less
bd2cdd5e400f59 James Smart 2017-02-12  2550   * than @nbytes if the end of the file was reached) or a negative error value.
bd2cdd5e400f59 James Smart 2017-02-12  2551   **/
bd2cdd5e400f59 James Smart 2017-02-12  2552  static ssize_t
984d0f9f624b50 Jens Axboe  2024-04-05  2553  lpfc_debugfs_read(struct kiocb *iocb, struct iov_iter *to)
bd2cdd5e400f59 James Smart 2017-02-12 @2554  {
984d0f9f624b50 Jens Axboe  2024-04-05  2555  	struct lpfc_debug *debug = iocb->ki_filp->private_data;
bd2cdd5e400f59 James Smart 2017-02-12  2556  
984d0f9f624b50 Jens Axboe  2024-04-05  2557  	return simple_copy_from_iter(debug->buffer, &iocb->ki_pos, debug->len,
984d0f9f624b50 Jens Axboe  2024-04-05  2558  					to);
bd2cdd5e400f59 James Smart 2017-02-12  2559  }
bd2cdd5e400f59 James Smart 2017-02-12  2560  
bd2cdd5e400f59 James Smart 2017-02-12  2561  /**
bd2cdd5e400f59 James Smart 2017-02-12  2562   * lpfc_debugfs_release - Release the buffer used to store debugfs file data
bd2cdd5e400f59 James Smart 2017-02-12  2563   * @inode: The inode pointer that contains a vport pointer. (unused)
bd2cdd5e400f59 James Smart 2017-02-12  2564   * @file: The file pointer that contains the buffer to release.
bd2cdd5e400f59 James Smart 2017-02-12  2565   *
bd2cdd5e400f59 James Smart 2017-02-12  2566   * Description:
bd2cdd5e400f59 James Smart 2017-02-12  2567   * This routine frees the buffer that was allocated when the debugfs file was
bd2cdd5e400f59 James Smart 2017-02-12  2568   * opened.
bd2cdd5e400f59 James Smart 2017-02-12  2569   *
bd2cdd5e400f59 James Smart 2017-02-12  2570   * Returns:
bd2cdd5e400f59 James Smart 2017-02-12  2571   * This function returns zero.
bd2cdd5e400f59 James Smart 2017-02-12  2572   **/
bd2cdd5e400f59 James Smart 2017-02-12  2573  static int
bd2cdd5e400f59 James Smart 2017-02-12  2574  lpfc_debugfs_release(struct inode *inode, struct file *file)
bd2cdd5e400f59 James Smart 2017-02-12  2575  {
bd2cdd5e400f59 James Smart 2017-02-12  2576  	struct lpfc_debug *debug = file->private_data;
bd2cdd5e400f59 James Smart 2017-02-12  2577  
bd2cdd5e400f59 James Smart 2017-02-12  2578  	kfree(debug->buffer);
bd2cdd5e400f59 James Smart 2017-02-12  2579  	kfree(debug);
bd2cdd5e400f59 James Smart 2017-02-12  2580  
bd2cdd5e400f59 James Smart 2017-02-12  2581  	return 0;
bd2cdd5e400f59 James Smart 2017-02-12  2582  }
bd2cdd5e400f59 James Smart 2017-02-12  2583  
c490850a094794 James Smart 2019-01-28  2584  /**
c490850a094794 James Smart 2019-01-28  2585   * lpfc_debugfs_multixripools_write - Clear multi-XRI pools statistics
c490850a094794 James Smart 2019-01-28  2586   * @file: The file pointer to read from.
c490850a094794 James Smart 2019-01-28  2587   * @buf: The buffer to copy the user data from.
c490850a094794 James Smart 2019-01-28  2588   * @nbytes: The number of bytes to get.
c490850a094794 James Smart 2019-01-28  2589   * @ppos: The position in the file to start reading from.
c490850a094794 James Smart 2019-01-28  2590   *
c490850a094794 James Smart 2019-01-28  2591   * Description:
c490850a094794 James Smart 2019-01-28  2592   * This routine clears multi-XRI pools statistics when buf contains "clear".
c490850a094794 James Smart 2019-01-28  2593   *
c490850a094794 James Smart 2019-01-28  2594   * Return Value:
c490850a094794 James Smart 2019-01-28  2595   * It returns the @nbytges passing in from debugfs user space when successful.
c490850a094794 James Smart 2019-01-28  2596   * In case of error conditions, it returns proper error code back to the user
c490850a094794 James Smart 2019-01-28  2597   * space.
c490850a094794 James Smart 2019-01-28  2598   **/
c490850a094794 James Smart 2019-01-28  2599  static ssize_t
984d0f9f624b50 Jens Axboe  2024-04-05  2600  lpfc_debugfs_multixripools_write(struct kiocb *iocb, struct iov_iter *from)
c490850a094794 James Smart 2019-01-28 @2601  {
984d0f9f624b50 Jens Axboe  2024-04-05  2602  	struct lpfc_debug *debug = iocb->ki_filp->private_data;
984d0f9f624b50 Jens Axboe  2024-04-05  2603  	size_t nbytes = iov_iter_count(from);
c490850a094794 James Smart 2019-01-28  2604  	struct lpfc_hba *phba = (struct lpfc_hba *)debug->i_private;
c490850a094794 James Smart 2019-01-28  2605  	char mybuf[64];
c490850a094794 James Smart 2019-01-28  2606  	char *pbuf;
c490850a094794 James Smart 2019-01-28  2607  	u32 i;
c490850a094794 James Smart 2019-01-28  2608  	u32 hwq_count;
c490850a094794 James Smart 2019-01-28  2609  	struct lpfc_sli4_hdw_queue *qp;
c490850a094794 James Smart 2019-01-28  2610  	struct lpfc_multixri_pool *multixri_pool;
c490850a094794 James Smart 2019-01-28  2611  
f8191d40aa6129 James Smart 2022-07-01  2612  	if (nbytes > sizeof(mybuf) - 1)
f8191d40aa6129 James Smart 2022-07-01  2613  		nbytes = sizeof(mybuf) - 1;
c490850a094794 James Smart 2019-01-28  2614  
c490850a094794 James Smart 2019-01-28  2615  	memset(mybuf, 0, sizeof(mybuf));
c490850a094794 James Smart 2019-01-28  2616  
984d0f9f624b50 Jens Axboe  2024-04-05  2617  	if (!copy_from_iter_full(mybuf, nbytes, from))
c490850a094794 James Smart 2019-01-28  2618  		return -EFAULT;
c490850a094794 James Smart 2019-01-28  2619  	pbuf = &mybuf[0];
c490850a094794 James Smart 2019-01-28  2620  
c490850a094794 James Smart 2019-01-28  2621  	if ((strncmp(pbuf, "clear", strlen("clear"))) == 0) {
c490850a094794 James Smart 2019-01-28  2622  		hwq_count = phba->cfg_hdw_queue;
c490850a094794 James Smart 2019-01-28  2623  		for (i = 0; i < hwq_count; i++) {
c490850a094794 James Smart 2019-01-28  2624  			qp = &phba->sli4_hba.hdwq[i];
c490850a094794 James Smart 2019-01-28  2625  			multixri_pool = qp->p_multixri_pool;
c490850a094794 James Smart 2019-01-28  2626  			if (!multixri_pool)
c490850a094794 James Smart 2019-01-28  2627  				continue;
c490850a094794 James Smart 2019-01-28  2628  
c490850a094794 James Smart 2019-01-28  2629  			qp->empty_io_bufs = 0;
c490850a094794 James Smart 2019-01-28  2630  			multixri_pool->pbl_empty_count = 0;
c490850a094794 James Smart 2019-01-28  2631  #ifdef LPFC_MXP_STAT
c490850a094794 James Smart 2019-01-28  2632  			multixri_pool->above_limit_count = 0;
c490850a094794 James Smart 2019-01-28  2633  			multixri_pool->below_limit_count = 0;
c490850a094794 James Smart 2019-01-28  2634  			multixri_pool->stat_max_hwm = 0;
c490850a094794 James Smart 2019-01-28  2635  			multixri_pool->local_pbl_hit_count = 0;
c490850a094794 James Smart 2019-01-28  2636  			multixri_pool->other_pbl_hit_count = 0;
c490850a094794 James Smart 2019-01-28  2637  
c490850a094794 James Smart 2019-01-28  2638  			multixri_pool->stat_pbl_count = 0;
c490850a094794 James Smart 2019-01-28  2639  			multixri_pool->stat_pvt_count = 0;
c490850a094794 James Smart 2019-01-28  2640  			multixri_pool->stat_busy_count = 0;
c490850a094794 James Smart 2019-01-28  2641  			multixri_pool->stat_snapshot_taken = 0;
c490850a094794 James Smart 2019-01-28  2642  #endif
c490850a094794 James Smart 2019-01-28  2643  		}
c490850a094794 James Smart 2019-01-28  2644  		return strlen(pbuf);
c490850a094794 James Smart 2019-01-28  2645  	}
c490850a094794 James Smart 2019-01-28  2646  
c490850a094794 James Smart 2019-01-28  2647  	return -EINVAL;
c490850a094794 James Smart 2019-01-28  2648  }
bd2cdd5e400f59 James Smart 2017-02-12  2649  

:::::: The code at line 2554 was first introduced by commit
:::::: bd2cdd5e400f5914bc30d5cfb0a0185cf51e4424 scsi: lpfc: NVME Initiator: Add debugfs support

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
