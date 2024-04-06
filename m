Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B41772F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712387005; cv=none; b=s6v5xQOymmg0CIrZARe9Ubq3aV1LVx0PRDzUQh4p8A7F+l3rG4LXJF01mlWbmOWUAzCQYdHbs9Gjfe8tSZFaktMSN9Sf8VHk+z4JGvxfN3sMaCjwGDitxVUDJWI+7R3eJcQ3UWicn5Z8iQrFR30Hzs+VQBQ7ljvxR37EMaL1i24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712387005; c=relaxed/simple;
	bh=0Rj2R2jYvDDil0oNfcDlp45BXtQf4QMP3iL5MQ5QWrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SWNsVCp6Q6HtE9Skl0rtmHqlqQ8Ilq/dqacwaMoIIcHlLGlMbLYF3/EVkowLo2AAYeLZOnYDOpZWdD/cZUt33ShcE7tkQNC2OrJNtvFNqmrIy/rQr5OVjsiuyVrRnAQ6ISeILdzqr0/BW5LvYHbPJg5yyms7ujndFFAhBc7Ah30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfWG5j4G; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfWG5j4G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712387004; x=1743923004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Rj2R2jYvDDil0oNfcDlp45BXtQf4QMP3iL5MQ5QWrU=;
  b=OfWG5j4GTb1b8USDH6GIkX4UROs9CsIqGM0M+YRdtOsxJbn1SQwSOuj1
   MpcHIdgUR11tocuGJUb97qW+Qr73YbDktw9VEKweJboI+HjGbt8mMcrH5
   5gBlR2/Vbilh5CPnBQhHfKB7goijLHwhAdOBlP5gE+YMgA7R3aF3fMH1p
   zTYfvs/zoEuHhCkuCBnMctl/sb3zqIGt4EX6SVPKM8tOKEHh3yV+WeQMA
   KF//Ob9UIJDJZpvxR7S5B/eE8XqC14JtiAVwwu7WsTNhub/o/dnyo2zqN
   kFkK0NsUIMcHV3tsPJtUaqV41Utqnt2nhQpxcr+9/wf3TqgD1uAbopYHa
   w==;
X-CSE-ConnectionGUID: Ywjn2HikQrabvTWPz3SavQ==
X-CSE-MsgGUID: VQo/xQ5BSGOgEWC5FbW9Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="25163893"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="25163893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 00:03:23 -0700
X-CSE-ConnectionGUID: 0VcKLsBITb+qBNcPEZ7KFQ==
X-CSE-MsgGUID: 3Z/lRvdfTICmgVYmYK+Q6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19397859"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2024 00:03:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt059-0003DY-0v;
	Sat, 06 Apr 2024 07:03:19 +0000
Date: Sat, 6 Apr 2024 15:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 73/100]
 drivers/misc/lis3lv02d/lis3lv02d.c:604:17: error: implicit declaration of
 function 'iov_iter_count'; did you mean 'softirq_count'?
Message-ID: <202404061455.uI8el7OZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 3da0a9ea5378904e1a669a4b7e7130204b5bce95 [73/100] misc: lis3lv02d: convert to iterators
config: i386-randconfig-014-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061455.uI8el7OZ-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061455.uI8el7OZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061455.uI8el7OZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/lis3lv02d/lis3lv02d.c: In function 'lis3lv02d_misc_read':
>> drivers/misc/lis3lv02d/lis3lv02d.c:604:17: error: implicit declaration of function 'iov_iter_count'; did you mean 'softirq_count'? [-Werror=implicit-function-declaration]
     size_t count = iov_iter_count(to);
                    ^~~~~~~~~~~~~~
                    softirq_count
>> drivers/misc/lis3lv02d/lis3lv02d.c:641:7: error: implicit declaration of function 'copy_to_iter_full'; did you mean 'copy_to_user_nofault'? [-Werror=implicit-function-declaration]
     if (!copy_to_iter_full(&byte_data, sizeof(byte_data), to))
          ^~~~~~~~~~~~~~~~~
          copy_to_user_nofault
   cc1: some warnings being treated as errors


vim +604 drivers/misc/lis3lv02d/lis3lv02d.c

   598	
   599	static ssize_t lis3lv02d_misc_read(struct kiocb *iocb, struct iov_iter *to)
   600	{
   601		struct lis3lv02d *lis3 = container_of(iocb->ki_filp->private_data,
   602						      struct lis3lv02d, miscdev);
   603	
 > 604		size_t count = iov_iter_count(to);
   605		DECLARE_WAITQUEUE(wait, current);
   606		u32 data;
   607		unsigned char byte_data;
   608		ssize_t retval = 1;
   609	
   610		if (count < 1)
   611			return -EINVAL;
   612	
   613		add_wait_queue(&lis3->misc_wait, &wait);
   614		while (true) {
   615			set_current_state(TASK_INTERRUPTIBLE);
   616			data = atomic_xchg(&lis3->count, 0);
   617			if (data)
   618				break;
   619	
   620			if (iocb->ki_filp->f_flags & O_NONBLOCK) {
   621				retval = -EAGAIN;
   622				goto out;
   623			}
   624	
   625			if (signal_pending(current)) {
   626				retval = -ERESTARTSYS;
   627				goto out;
   628			}
   629	
   630			schedule();
   631		}
   632	
   633		if (data < 255)
   634			byte_data = data;
   635		else
   636			byte_data = 255;
   637	
   638		/* make sure we are not going into copy_to_user() with
   639		 * TASK_INTERRUPTIBLE state */
   640		set_current_state(TASK_RUNNING);
 > 641		if (!copy_to_iter_full(&byte_data, sizeof(byte_data), to))
   642			retval = -EFAULT;
   643	
   644	out:
   645		__set_current_state(TASK_RUNNING);
   646		remove_wait_queue(&lis3->misc_wait, &wait);
   647	
   648		return retval;
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
