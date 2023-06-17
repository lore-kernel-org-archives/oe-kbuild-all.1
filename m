Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293F1859
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 04:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686977778; x=1718513778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVluXgJex83kDSq9XjOu1fnF5GBICFIBdEPyZszIDv0=;
  b=WG/PKZwxK9uWxeMxKEO6498V4WscUKsathqJxpHnHPMJo2Un7j/AEkat
   o1NWiLTDqEqfnxnDYzStUJvlWd8V394AJZ4euqCE3+Dk4HcWQBmqQRdZp
   XLs/L8EPA5gtDYEJi4YNuwnub210/kqFW8HA+xYntobSYe9aZjI6BBAmB
   hn0lpP1/dRNELUAT8PKtmMVdkQoGBSY+Llom+ZtHuD65G7D52W+eviAR5
   lgfxIZdU/4e7H77/hEJJzswjpqKBrwFofHUIdSq1nEWANhmlXYEmXXOeS
   ylSFbG4Dlvu+ebicjvd0EC6E8tlziwxtyZxuj8mj9z5Pu/fE1KgyORCop
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="423016243"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="423016243"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 21:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="663407471"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="663407471"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2023 21:56:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qANyx-0002Ic-15;
	Sat, 17 Jun 2023 04:56:15 +0000
Date: Sat, 17 Jun 2023 12:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230616-hacks 3/38] block/fops.c:604:16:
 error: 'struct task_struct' has no member named 'backing_dev_info'
Message-ID: <202306171214.aQiiAlLY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
head:   5416cb31017b28b25627f4f5b8292af96bb65f58
commit: 62bfaecc35641804b36660d656020acd8fc4672d [3/38] block: open code __generic_file_write_iter for blkdev writes
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230617/202306171214.aQiiAlLY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171214.aQiiAlLY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171214.aQiiAlLY-lkp@intel.com/

Note: the mcgrof-next/large-block-20230616-hacks HEAD 5416cb31017b28b25627f4f5b8292af96bb65f58 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_write_iter':
>> block/fops.c:604:16: error: 'struct task_struct' has no member named 'backing_dev_info'
     604 |         current->backing_dev_info = bdev->bd_disk->bdi;
         |                ^~
   block/fops.c:613:16: error: 'struct task_struct' has no member named 'backing_dev_info'
     613 |         current->backing_dev_info = NULL;
         |                ^~


vim +604 block/fops.c

   558	
   559	/*
   560	 * Write data to the block device.  Only intended for the block device itself
   561	 * and the raw driver which basically is a fake block device.
   562	 *
   563	 * Does not take i_mutex for the write and thus is not for general purpose
   564	 * use.
   565	 */
   566	static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
   567	{
   568		struct block_device *bdev = I_BDEV(iocb->ki_filp->f_mapping->host);
   569		struct file *file = iocb->ki_filp;
   570		struct inode *bd_inode = bdev->bd_inode;
   571		loff_t size = bdev_nr_bytes(bdev);
   572		size_t shorted = 0;
   573		ssize_t ret;
   574	
   575		if (bdev_read_only(bdev))
   576			return -EPERM;
   577	
   578		if (IS_SWAPFILE(bd_inode) && !is_hibernate_resume_dev(bd_inode->i_rdev))
   579			return -ETXTBSY;
   580	
   581		if (!iov_iter_count(from))
   582			return 0;
   583	
   584		if (iocb->ki_pos >= size)
   585			return -ENOSPC;
   586	
   587		if ((iocb->ki_flags & (IOCB_NOWAIT | IOCB_DIRECT)) == IOCB_NOWAIT)
   588			return -EOPNOTSUPP;
   589	
   590		ret = file_remove_privs(file);
   591		if (ret)
   592			return ret;
   593	
   594		ret = file_update_time(file);
   595		if (ret)
   596			return ret;
   597	
   598		size -= iocb->ki_pos;
   599		if (iov_iter_count(from) > size) {
   600			shorted = iov_iter_count(from) - size;
   601			iov_iter_truncate(from, size);
   602		}
   603	
 > 604		current->backing_dev_info = bdev->bd_disk->bdi;
   605		if (iocb->ki_flags & IOCB_DIRECT) {
   606			ret = blkdev_direct_write(iocb, from);
   607			if (ret >= 0 && iov_iter_count(from))
   608				ret = direct_write_fallback(iocb, from, ret,
   609						generic_perform_write(iocb, from));
   610		} else {
   611			ret = generic_perform_write(iocb, from);
   612		}
   613		current->backing_dev_info = NULL;
   614	
   615		if (ret > 0)
   616			ret = generic_write_sync(iocb, ret);
   617		iov_iter_reexpand(from, iov_iter_count(from) + shorted);
   618		return ret;
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
