Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D935446A9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712429509; cv=none; b=ojsznVeDpyQ+33ARjpxIIF6g0ioBGYdF8RwZUHI0KPgQ12BoQpeXsnOWn3sw4SHP0qA3+EQGFadSq0jURoRi3sIwLiygjesZGnIttFJZkocUDP+HZs15kl8BH6Yzhp+5JXjFoChpPQ8JESzNfZmmPVlSqq1F4kzoMzUmqXd+Xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712429509; c=relaxed/simple;
	bh=omXU5jw595Ok7//88DPqXp4ui1nHeyo9DPQMKWZ7t30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtYtM3W9wwsyr/U//cXn6g8tkfv27u5AI5fOKH2H56dlgdIcx+L5SWiYBvGxUkk8tcca2TDuhyjOJ6ERc3riyjFztylUKmYYniVqchXCqmSVRXxymlT4M4Rj3rIO/PN+x4ktJuOsZFDRkg5S/TzlkJDCNHVpvbIy0441eaTRU/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqOQyg4N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqOQyg4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712429507; x=1743965507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omXU5jw595Ok7//88DPqXp4ui1nHeyo9DPQMKWZ7t30=;
  b=MqOQyg4NXLx5DpKNQqpMxFc2tHXSJg7fiwnNwLsCUYqrenZMBFkpM8NP
   2r+iPEimTKSFYzIabYY/5ingcpjSng2MbxwhLflEoPVUBuMXvSjLjLnjL
   7fN+a8o/+xuln8W7WZrLZocXJ3Mh07CeVlgWYSyFLEGua02cQmWaa+biU
   o7N8vZMMYKE5GSRaNInLvuQREwA3jMvJGWfu49I3kwPgSF6Y4NX/Gjkuy
   y0hLLsLobp2dgelzBtJxzO0smT3ejNtTtJcKn0ZxO6ADUIYH/EarEjZdY
   AGVZl6N3OKv+CIkqtoNMTvhcpleYkRXlXT+HH5Ey+CiM3kzoU0+m0g/2s
   g==;
X-CSE-ConnectionGUID: XPDZ3lSVSJe5OGvW/U8c8A==
X-CSE-MsgGUID: VfxRkBF2TRSRDuhBZnk8Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="11516346"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="11516346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 11:51:46 -0700
X-CSE-ConnectionGUID: GHd1903NS+qVqPW8RtV7HA==
X-CSE-MsgGUID: XNiJWgqTRDirtX+VAKoNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="23958908"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2024 11:51:45 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtB8g-0003ls-2F;
	Sat, 06 Apr 2024 18:51:42 +0000
Date: Sun, 7 Apr 2024 02:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 106/106] drivers/hid/usbhid/hiddev.c:849:25:
 error: initialization of 'int (*)(struct inode *, struct file *)' from
 incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,
  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long
 int ...
Message-ID: <202404070216.MvAPpbvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f5a71066e2fa8ca66dd137e17bac2e2090b3802d
commit: 090493bbcca026ff83c5bffe43b0f6873fd05303 [106/106] REMOVE ->read() and ->write()
config: i386-randconfig-063-20240406 (https://download.01.org/0day-ci/archive/20240407/202404070216.MvAPpbvf-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070216.MvAPpbvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070216.MvAPpbvf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/usbhid/hiddev.c:849:10: error: 'const struct file_operations' has no member named 'read'
     849 |         .read =         hiddev_read,
         |          ^~~~
   drivers/hid/usbhid/hiddev.c:849:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     849 |         .read =         hiddev_read,
         |                         ^~~~~~~~~~~
   drivers/hid/usbhid/hiddev.c:849:25: note: (near initialization for 'hiddev_fops')
>> drivers/hid/usbhid/hiddev.c:849:25: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/hid/usbhid/hiddev.c:849:25: note: (near initialization for 'hiddev_fops.release')
   drivers/hid/usbhid/hiddev.c:850:10: error: 'const struct file_operations' has no member named 'write'
     850 |         .write =        hiddev_write,
         |          ^~~~~
   drivers/hid/usbhid/hiddev.c:850:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     850 |         .write =        hiddev_write,
         |                         ^~~~~~~~~~~~
   drivers/hid/usbhid/hiddev.c:850:25: note: (near initialization for 'hiddev_fops')
   drivers/hid/usbhid/hiddev.c:850:25: error: initialization of 'int (*)(struct file *, struct vm_area_struct *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/hid/usbhid/hiddev.c:850:25: note: (near initialization for 'hiddev_fops.mmap')
   drivers/hid/usbhid/hiddev.c:853:25: warning: initialized field overwritten [-Woverride-init]
     853 |         .release =      hiddev_release,
         |                         ^~~~~~~~~~~~~~
   drivers/hid/usbhid/hiddev.c:853:25: note: (near initialization for 'hiddev_fops.release')
   cc1: some warnings being treated as errors
--
   drivers/hid/hidraw.c:508:10: error: 'const struct file_operations' has no member named 'read'
     508 |         .read =         hidraw_read,
         |          ^~~~
   drivers/hid/hidraw.c:508:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     508 |         .read =         hidraw_read,
         |                         ^~~~~~~~~~~
   drivers/hid/hidraw.c:508:25: note: (near initialization for 'hidraw_ops')
>> drivers/hid/hidraw.c:508:25: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/hid/hidraw.c:508:25: note: (near initialization for 'hidraw_ops.release')
   drivers/hid/hidraw.c:509:10: error: 'const struct file_operations' has no member named 'write'
     509 |         .write =        hidraw_write,
         |          ^~~~~
   drivers/hid/hidraw.c:509:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     509 |         .write =        hidraw_write,
         |                         ^~~~~~~~~~~~
   drivers/hid/hidraw.c:509:25: note: (near initialization for 'hidraw_ops')
   drivers/hid/hidraw.c:509:25: error: initialization of 'int (*)(struct file *, struct vm_area_struct *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/hid/hidraw.c:509:25: note: (near initialization for 'hidraw_ops.mmap')
   drivers/hid/hidraw.c:512:25: warning: initialized field overwritten [-Woverride-init]
     512 |         .release =      hidraw_release,
         |                         ^~~~~~~~~~~~~~
   drivers/hid/hidraw.c:512:25: note: (near initialization for 'hidraw_ops.release')
   cc1: some warnings being treated as errors
--
   drivers/hid/hid-roccat.c:410:10: error: 'const struct file_operations' has no member named 'read'
     410 |         .read = roccat_read,
         |          ^~~~
   drivers/hid/hid-roccat.c:410:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     410 |         .read = roccat_read,
         |                 ^~~~~~~~~~~
   drivers/hid/hid-roccat.c:410:17: note: (near initialization for 'roccat_ops')
>> drivers/hid/hid-roccat.c:410:17: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/hid/hid-roccat.c:410:17: note: (near initialization for 'roccat_ops.release')
   drivers/hid/hid-roccat.c:413:20: warning: initialized field overwritten [-Woverride-init]
     413 |         .release = roccat_release,
         |                    ^~~~~~~~~~~~~~
   drivers/hid/hid-roccat.c:413:20: note: (near initialization for 'roccat_ops.release')
   cc1: some warnings being treated as errors
--
   drivers/rtc/rtc-m41t80.c:847:10: error: 'const struct file_operations' has no member named 'read'
     847 |         .read   = wdt_read,
         |          ^~~~
   drivers/rtc/rtc-m41t80.c:847:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     847 |         .read   = wdt_read,
         |                   ^~~~~~~~
   drivers/rtc/rtc-m41t80.c:847:19: note: (near initialization for 'wdt_fops')
>> drivers/rtc/rtc-m41t80.c:847:19: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/rtc/rtc-m41t80.c:847:19: note: (near initialization for 'wdt_fops.release')
   drivers/rtc/rtc-m41t80.c:850:10: error: 'const struct file_operations' has no member named 'write'
     850 |         .write  = wdt_write,
         |          ^~~~~
   drivers/rtc/rtc-m41t80.c:850:19: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     850 |         .write  = wdt_write,
         |                   ^~~~~~~~~
   drivers/rtc/rtc-m41t80.c:850:19: note: (near initialization for 'wdt_fops')
   drivers/rtc/rtc-m41t80.c:850:19: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/rtc/rtc-m41t80.c:850:19: note: (near initialization for 'wdt_fops.read_iter')
   drivers/rtc/rtc-m41t80.c:852:20: warning: initialized field overwritten [-Woverride-init]
     852 |         .release = wdt_release,
         |                    ^~~~~~~~~~~
   drivers/rtc/rtc-m41t80.c:852:20: note: (near initialization for 'wdt_fops.release')
   cc1: some warnings being treated as errors
--
   drivers/watchdog/watchdog_dev.c:994:10: error: 'const struct file_operations' has no member named 'write'
     994 |         .write          = watchdog_write,
         |          ^~~~~
   drivers/watchdog/watchdog_dev.c:994:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     994 |         .write          = watchdog_write,
         |                           ^~~~~~~~~~~~~~
   drivers/watchdog/watchdog_dev.c:994:27: note: (near initialization for 'watchdog_fops')
>> drivers/watchdog/watchdog_dev.c:994:27: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/watchdog/watchdog_dev.c:994:27: note: (near initialization for 'watchdog_fops.release')
   drivers/watchdog/watchdog_dev.c:998:27: warning: initialized field overwritten [-Woverride-init]
     998 |         .release        = watchdog_release,
         |                           ^~~~~~~~~~~~~~~~
   drivers/watchdog/watchdog_dev.c:998:27: note: (near initialization for 'watchdog_fops.release')
   cc1: some warnings being treated as errors


vim +849 drivers/hid/usbhid/hiddev.c

^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  846  
066202dd48cf32 drivers/usb/input/hiddev.c  Luiz Fernando N. Capitulino 2006-08-05  847  static const struct file_operations hiddev_fops = {
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  848  	.owner =	THIS_MODULE,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16 @849  	.read =		hiddev_read,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  850  	.write =	hiddev_write,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  851  	.poll =		hiddev_poll,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  852  	.open =		hiddev_open,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  853  	.release =	hiddev_release,
7961df16819085 drivers/hid/usbhid/hiddev.c Alan Cox                    2008-05-26  854  	.unlocked_ioctl =	hiddev_ioctl,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  855  	.fasync =	hiddev_fasync,
407e9ef72476e6 drivers/hid/usbhid/hiddev.c Arnd Bergmann               2018-09-11  856  	.compat_ioctl	= compat_ptr_ioctl,
6038f373a3dc1f drivers/hid/usbhid/hiddev.c Arnd Bergmann               2010-08-15  857  	.llseek		= noop_llseek,
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  858  };
^1da177e4c3f41 drivers/usb/input/hiddev.c  Linus Torvalds              2005-04-16  859  

:::::: The code at line 849 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
