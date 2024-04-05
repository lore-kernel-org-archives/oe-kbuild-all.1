Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288D2E401
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712323611; cv=none; b=fbK2QWnKnFQBs67qnRwtTJh3c0B1BWe7eRL7vJAdTAv0jBSyv/myQFJD77b0mgyTQLD8K4HpSuh0dY5cF1z6A+/nRps5BJn0XvgsLr1JNdYLjqtsKrcQPgPZSY9Y8ra/HvZBbWfVfaDPBPbKumKP5XBVEa41xZy1t0ZYNyTZcxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712323611; c=relaxed/simple;
	bh=w7nzmalnSAZ3mlDOjk9uOQF3rN2ny36g+4a1Xwz6SlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o84XfxFB59bGChaVeqcWAe/vPWtll3CzqyRCPr4IB+MO61n9qTZpsMDhIJdlKZMK8gvPKA/nDl0xFMvgNxokEfDJNUz9GeekPtom7FZ1I8UF9Y/swP6W2znV9qBhvwYL/8kj938K/9+AqCEj5Rl5aOtxyug1Ld+Cm+Nv35zwkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9D8uZ4b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9D8uZ4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712323610; x=1743859610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7nzmalnSAZ3mlDOjk9uOQF3rN2ny36g+4a1Xwz6SlI=;
  b=e9D8uZ4ber8SsNGYXn+Y7gfKIYO8wJAv4g7KUZj43S1IEPYZF8jdIuOO
   WkwaVZOK8AdenYbHJSvwMReuwRHgLVqNLEiAC2WBGoiCyUjCCkmS4yQUk
   LS/Kcft6RCDEYl7O+i23cnbqxt7VUGold1FFTqn48JbSms4+Jo/l9Lzet
   1m6Hq1IS/paU3JRae87QH8MlVFtST9M6Opbx8BKiMJisvwRV6G5gW9P4/
   USuNF9hjSg5dloeOnnEXUdmA7u9PuDe3eHet/aGu7xp/Ldmz7vANZPaAF
   BtuFaNLBQt69bdeH3ZOvV+QfNNfQM6Vp+gqLagtHh/oyRV09ZGH8OEO83
   Q==;
X-CSE-ConnectionGUID: Ojo3T72pQm+TLGOYBFACcA==
X-CSE-MsgGUID: CC3linwiQtqnWobXlyWDxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19004838"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19004838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 06:26:49 -0700
X-CSE-ConnectionGUID: Xuwj1ejWTP6dM1XYmuJg3Q==
X-CSE-MsgGUID: rJN2+ah2QXqy3ah1WXYgoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19621646"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Apr 2024 06:26:48 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsjaf-0002Js-1U;
	Fri, 05 Apr 2024 13:26:45 +0000
Date: Fri, 5 Apr 2024 21:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 30/37] drivers/usb/host/ehci-dbg.c:970:38:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404052133.HjcHcVSm-lkp@intel.com>
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
commit: 32cd57aa11bcff56cc617bd01c4e00fbcf4a5ee7 [30/37] drivers/usb: convert to ->read_iter and ->write_iter
config: nios2-randconfig-r131-20240405 (https://download.01.org/0day-ci/archive/20240405/202404052133.HjcHcVSm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404052133.HjcHcVSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404052133.HjcHcVSm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/ehci-hcd.c: note: in included file:
>> drivers/usb/host/ehci-dbg.c:970:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *output_buf @@
   drivers/usb/host/ehci-dbg.c:970:38: sparse:     expected void const [noderef] __user *from
   drivers/usb/host/ehci-dbg.c:970:38: sparse:     got char *output_buf
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-q.c:1390:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-q.c:1390:27: sparse:     expected restricted __le32 [usertype] old_current
   drivers/usb/host/ehci-q.c:1390:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c:568:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     expected restricted __le32 [usertype] old_current
   drivers/usb/host/ehci-hcd.c:568:27: sparse:     got int

vim +970 drivers/usb/host/ehci-dbg.c

   954	
   955	static ssize_t debug_output(struct kiocb *iocb, struct iov_iter *to)
   956	{
   957		struct debug_buffer *buf = iocb->ki_filp->private_data;
   958		int ret;
   959	
   960		mutex_lock(&buf->mutex);
   961		if (buf->count == 0) {
   962			ret = fill_buffer(buf);
   963			if (ret != 0) {
   964				mutex_unlock(&buf->mutex);
   965				goto out;
   966			}
   967		}
   968		mutex_unlock(&buf->mutex);
   969	
 > 970		ret = simple_copy_to_iter(buf->output_buf, &iocb->ki_pos, buf->count, to);
   971	out:
   972		return ret;
   973	}
   974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
