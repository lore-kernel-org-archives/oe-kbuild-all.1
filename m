Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5C2F546E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271539; cv=none; b=dtapOrzghmJRVQM+Yp/2vGJ1U3PgtU2NsUAt86YdDcCTSTONyH1RtJ/ejd7jrRdV1mYu344GACrU+cT+B8arQMo0T26Q2j4aWgi1BcVcM+V2abxRimPpdA0omjDV/xwG3fKitbDhnTjL5RanxlXBii1E6I7ZO0tUg27ETBFmQSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271539; c=relaxed/simple;
	bh=LrLaJ2szQ+mufL9HqAbm2CC4A6ES8YtFwNISIKJ8Icc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDXCIyiZ/HA20if348WBUF4akEoKKra4M0dsfFMkIBXVXbzNz5GSCp0vPVa018k7Htv7jCnWfCnliSNcIBl+UOIPwemlSrzye4XUvVOTV5t0RxlN22nZgGexkgY205shvCupJxfshdrgdLppceSzB2/kWW1947+ZM3om2DngjsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsX+JlOJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsX+JlOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750271538; x=1781807538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrLaJ2szQ+mufL9HqAbm2CC4A6ES8YtFwNISIKJ8Icc=;
  b=GsX+JlOJ6A5ylgbzcPDC1HT25DdHBxu3gl3PiWX1MkwpqwB4DeofWLn0
   zkBiUjpRbCwqFu93J/DvaHjUWxIG4YD62xo+OwKL3N5JhqAbGckJWYXrT
   lBLT6JKSBYAB9Tl9Osap3HCsHO/D8xXeLyqca9+asogmlrSGAoD0hgFDZ
   U93r4AG1NrsbuF6B5iDUxHPgV5F4QmsVROp/veVqc1WMVikz/THtx22Cf
   B80dJLSDb6SRFPSNk2tkkLYo9865riJJOGrsZ2MRjzbqDyqEnZ1upZy3T
   BiNXa+0dn5DuWO7p/isO/8VitcBjTzZ0b9jlZSmjSGSNIX6tto9htiSNj
   g==;
X-CSE-ConnectionGUID: 6DRFnfrPQZqLhhREiO2NgQ==
X-CSE-MsgGUID: +gPbKDK/QoqCP/JSHXvZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51737389"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="51737389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:32:17 -0700
X-CSE-ConnectionGUID: aA4ojjEyTxmKDDugmHPQGQ==
X-CSE-MsgGUID: 4wloR2NzRPiWKn/mLunQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="150697091"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2025 11:32:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRxa1-000K35-1x;
	Wed, 18 Jun 2025 18:32:13 +0000
Date: Thu, 19 Jun 2025 02:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-upstream-xen 5/22]
 drivers/virtio/virtio_msg_user.c:29:27: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'size_t {aka unsigned
 int}'
Message-ID: <202506190246.TzyIStDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-upstream-xen
head:   23c322bc5695bdc33cb8fec142609fddd9a07994
commit: 017f0ae6be5ed18dc44fb4973817b4ffa23dea8d [5/22] virtio-msg: Add support for loopback bus
config: arm-randconfig-003-20250619 (https://download.01.org/0day-ci/archive/20250619/202506190246.TzyIStDC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190246.TzyIStDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190246.TzyIStDC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15:0,
                    from include/linux/miscdevice.h:7,
                    from drivers/virtio/virtio_msg_user.c:13:
   drivers/virtio/virtio_msg_user.c: In function 'vmsg_miscdev_read':
>> drivers/virtio/virtio_msg_user.c:29:27: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
      dev_err(vmudev->parent, "Trying to read message of incorrect size: %ld\n",
                              ^
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:154:49: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                    ^~~~~~~
   drivers/virtio/virtio_msg_user.c:29:3: note: in expansion of macro 'dev_err'
      dev_err(vmudev->parent, "Trying to read message of incorrect size: %ld\n",
      ^~~~~~~
   drivers/virtio/virtio_msg_user.c: In function 'vmsg_miscdev_write':
   drivers/virtio/virtio_msg_user.c:58:27: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
      dev_err(vmudev->parent, "Trying to write message of incorrect size: %ld\n",
                              ^
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:154:49: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                    ^~~~~~~
   drivers/virtio/virtio_msg_user.c:58:3: note: in expansion of macro 'dev_err'
      dev_err(vmudev->parent, "Trying to write message of incorrect size: %ld\n",
      ^~~~~~~


vim +29 drivers/virtio/virtio_msg_user.c

b590c30586a047 Viresh Kumar 2024-11-26  20  
b590c30586a047 Viresh Kumar 2024-11-26  21  static ssize_t vmsg_miscdev_read(struct file *file, char __user *buf,
b590c30586a047 Viresh Kumar 2024-11-26  22  				 size_t count, loff_t *pos)
b590c30586a047 Viresh Kumar 2024-11-26  23  {
b590c30586a047 Viresh Kumar 2024-11-26  24  	struct miscdevice *misc = file->private_data;
b590c30586a047 Viresh Kumar 2024-11-26  25  	struct virtio_msg_user_device *vmudev = to_virtio_msg_user_device(misc);
b590c30586a047 Viresh Kumar 2024-11-26  26  	int ret;
b590c30586a047 Viresh Kumar 2024-11-26  27  
b590c30586a047 Viresh Kumar 2024-11-26  28  	if (count < VIRTIO_MSG_MIN_SIZE) {
b590c30586a047 Viresh Kumar 2024-11-26 @29  		dev_err(vmudev->parent, "Trying to read message of incorrect size: %ld\n",
b590c30586a047 Viresh Kumar 2024-11-26  30  			count);
b590c30586a047 Viresh Kumar 2024-11-26  31  		return 0;
b590c30586a047 Viresh Kumar 2024-11-26  32  	}
b590c30586a047 Viresh Kumar 2024-11-26  33  
b590c30586a047 Viresh Kumar 2024-11-26  34  	/* Wait to receive a message from the guest */
b590c30586a047 Viresh Kumar 2024-11-26  35  	ret = virtio_msg_async_wait(&vmudev->r_async, vmudev->parent, 0);
b590c30586a047 Viresh Kumar 2024-11-26  36  	if (ret < 0)
b590c30586a047 Viresh Kumar 2024-11-26  37  		return 0;
b590c30586a047 Viresh Kumar 2024-11-26  38  
b590c30586a047 Viresh Kumar 2024-11-26  39  	BUG_ON(!vmudev->msg);
b590c30586a047 Viresh Kumar 2024-11-26  40  
b590c30586a047 Viresh Kumar 2024-11-26  41  	/* The "msg" pointer is filled by the bus driver before waking up */
b590c30586a047 Viresh Kumar 2024-11-26  42  	if (copy_to_user(buf, vmudev->msg, count) != 0)
b590c30586a047 Viresh Kumar 2024-11-26  43  		return 0;
b590c30586a047 Viresh Kumar 2024-11-26  44  
b590c30586a047 Viresh Kumar 2024-11-26  45  	vmudev->msg = NULL;
b590c30586a047 Viresh Kumar 2024-11-26  46  
b590c30586a047 Viresh Kumar 2024-11-26  47  	return count;
b590c30586a047 Viresh Kumar 2024-11-26  48  }
b590c30586a047 Viresh Kumar 2024-11-26  49  

:::::: The code at line 29 was first introduced by commit
:::::: b590c30586a04766121b3588e67baa3470771aea virtio-msg: Add userspace interface to read/write messages

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
