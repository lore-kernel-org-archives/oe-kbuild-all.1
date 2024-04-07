Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00D6FC7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712470145; cv=none; b=A2gPMHuVFevsDITl4KTJeNehkkfnvjGPqEcRSs2W/ZvrZI6ry8GsFA/YKjt4VD414PqRX/2IqRATP/3bbGVtDsFq+K4Xq0OdD9r0SkAeQJArkX+Y05PpkoY72a7yhmlDoOJA8Sq0wBWgyWsk+KABjlTGuxtE7T/wmkpHyu1E1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712470145; c=relaxed/simple;
	bh=Mmd/soq35MjQckly6RAUshcmg+xD1j1HY//Yq40xmAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UlhRYr++YwPWWVAZAPsHubSMqNCWJ9AYSsbmHy/IsXs3BF/IKB/NLSfAAicBQZ5mWL35ErVfX6LQ2nbcXqRV5dgxfyT39Ev0o+BmEYmpd2sVbYquXD8eI1WmfMYeWqQUmHXSV1FnpeUkKV1pwhMVmqWAH0DTEiLoWpi12Bk2Gfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhnHdq52; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhnHdq52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712470143; x=1744006143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mmd/soq35MjQckly6RAUshcmg+xD1j1HY//Yq40xmAk=;
  b=bhnHdq521LKZNTeaWI65g1Mc+5UrZezb6LLV0nEBQkp6KcUPDyi7dPUQ
   D9QGakhw+v+w+5W7B0Vae7e6yUHvenUvHywuLotEO060bf3Di7hC229Ck
   nznBNCua6xjuxIH1FYiyZymA1GYe6q+g3zXaWtZMfMtYuYEncQAyvpTu6
   DgO3/D/cIl5/LKBxEebO69JQCXS7Ofa7w9J4TpM2JFWcNp6HyC0HUOm32
   Fg2d+EYQsZKi6Ml9LIIhBQk/I3Xc+Xf5yd8NEdFoUUrR3RY4CYFn4cxw6
   NjzYENgMa5mnnvrKTYDYu94xhbjfHkbZXoUY3Pp3ydfOAAcTEC0xkV0S8
   A==;
X-CSE-ConnectionGUID: VsYdZLC/QvGSJTbqtZD/EQ==
X-CSE-MsgGUID: uSOoPz7GSrqtMowaVZPbdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7884631"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7884631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 23:09:03 -0700
X-CSE-ConnectionGUID: uWVpZ7VsSH6TXDNCtePiQQ==
X-CSE-MsgGUID: kBm1Vwo7RmuUJmymidQ9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19994622"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Apr 2024 23:09:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtLi7-0004B0-28;
	Sun, 07 Apr 2024 06:08:59 +0000
Date: Sun, 7 Apr 2024 14:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 134/134]
 drivers/video/fbdev/pxa3xx-gcu.c:572:10: error: 'const struct
 file_operations' has no member named 'write'
Message-ID: <202404071343.nnUMH2HD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   d889b9c9cd608c45267cf168270c6dd8ca4880d9
commit: d889b9c9cd608c45267cf168270c6dd8ca4880d9 [134/134] REMOVE ->read() and ->write()
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20240407/202404071343.nnUMH2HD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404071343.nnUMH2HD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404071343.nnUMH2HD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/pxa3xx-gcu.c:572:10: error: 'const struct file_operations' has no member named 'write'
     572 |         .write =                pxa3xx_gcu_write,
         |          ^~~~~
>> drivers/video/fbdev/pxa3xx-gcu.c:572:33: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     572 |         .write =                pxa3xx_gcu_write,
         |                                 ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/pxa3xx-gcu.c:572:33: note: (near initialization for 'pxa3xx_gcu_miscdev_fops')
>> drivers/video/fbdev/pxa3xx-gcu.c:572:33: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, const char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/video/fbdev/pxa3xx-gcu.c:572:33: note: (near initialization for 'pxa3xx_gcu_miscdev_fops.flush')
   cc1: some warnings being treated as errors


vim +572 drivers/video/fbdev/pxa3xx-gcu.c

364dbdf3b6c31a drivers/video/pxa3xx-gcu.c Daniel Mack 2010-11-04  568  
109393afc87388 drivers/video/pxa3xx-gcu.c Daniel Mack 2014-03-05  569  static const struct file_operations pxa3xx_gcu_miscdev_fops = {
264bd6602edd9f drivers/video/pxa3xx-gcu.c Al Viro     2013-04-05  570  	.owner =		THIS_MODULE,
3437b2b83f3bdb drivers/video/pxa3xx-gcu.c Daniel Mack 2014-03-05  571  	.open =			pxa3xx_gcu_open,
109393afc87388 drivers/video/pxa3xx-gcu.c Daniel Mack 2014-03-05 @572  	.write =		pxa3xx_gcu_write,
109393afc87388 drivers/video/pxa3xx-gcu.c Daniel Mack 2014-03-05  573  	.unlocked_ioctl =	pxa3xx_gcu_ioctl,
109393afc87388 drivers/video/pxa3xx-gcu.c Daniel Mack 2014-03-05  574  	.mmap =			pxa3xx_gcu_mmap,
264bd6602edd9f drivers/video/pxa3xx-gcu.c Al Viro     2013-04-05  575  };
264bd6602edd9f drivers/video/pxa3xx-gcu.c Al Viro     2013-04-05  576  

:::::: The code at line 572 was first introduced by commit
:::::: 109393afc87388b6dbbdaa59a290c5a977841f8d video: pxa3xx-gcu: rename some symbols

:::::: TO: Daniel Mack <zonque@gmail.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
