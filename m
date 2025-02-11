Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6D1F3FD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269195; cv=none; b=PTaQxwblVXFc/dPjT4SJuecy2JmhpX6GJVkNNnSKlUDaa8H7xn5nLr/2VmZefRe08BTwvo7hJC2KKovFhEGAqYPwAWTY+cKlYdYv85nhQfSny09+GTJoeUrtyN7putlVZuuNC7jd3eDE6JVHPbc7JZxm+ImPTfHYX3A8FNp1P2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269195; c=relaxed/simple;
	bh=tKi1b/J+6mgYwTkiF7hzrI3I2yPrzHDNRC6KC5aiJUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1isJBSeYZfc4MOrSOXecNGRAZN7EhKgR5I+5EtH6TvxbKm3GHTW62Xc4d7H6Pw76093u3p3fN4PhZp4hzcUSKHuwAt1ZbC3STD6wthB0XhbFSzFFCis7UWvce2AQaZw5trY/RQi78Enw9w0UzNs++0EZKJ66TGXHIj0AcsXWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GCk1qH+P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GCk1qH+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739269194; x=1770805194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKi1b/J+6mgYwTkiF7hzrI3I2yPrzHDNRC6KC5aiJUw=;
  b=GCk1qH+PXbhgPqtVb7rbigeoQxA4bTU3EBrcUXF07HKgJYJMIsNYDqzW
   kt4lYIIetjRL+hZb7jQfOZVtNE8Kk7NqDmJuWyFKJgZX7JXynDobU41Co
   teWo8SnFYNY1kxMKA1zE8jFNY83e0YzghLvqk8JMUZIctsjzlGxrYzS9u
   pZoq11nNTcdhEng4pm9IaTl14wTzXvf6cOiER8pnumm+weoUkBQKMOtdw
   7jE93a7kBIa7KAbZ2sOHhlGefx2TZtaRVxac2dhRzdbeRFjP+dfI6aUA6
   +I+4aEfKvPLR8VOfSYMW1cRBDiKzMmTyI4cHTUqOPNps/KwCr/HBs2f43
   Q==;
X-CSE-ConnectionGUID: ytMR/1ZHT7GfsPYdmqkt6g==
X-CSE-MsgGUID: /WBs/g9QRj+EkUNkQpiX3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50863960"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50863960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:19:53 -0800
X-CSE-ConnectionGUID: ysYydUSNR7yUqzf7uOfQWQ==
X-CSE-MsgGUID: z8QFJUDaT5qq8EVb9wFm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117499321"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2025 02:19:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thnMq-00141J-2F;
	Tue, 11 Feb 2025 10:19:48 +0000
Date: Tue, 11 Feb 2025 18:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>
Subject: [djiang:cxl/fwctl 19/26] drivers/cxl/core/features.c:387:undefined
 reference to `_fwctl_alloc_device'
Message-ID: <202502111855.pX4aQbi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   f1c28027be3e76704befbc3e0fdb1839b60e62dd
commit: 56c76248f0a108679d5be9c5cd652fb08e444b22 [19/26] cxl: Add support for FWCTL get driver information callback
config: xtensa-randconfig-r064-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111855.pX4aQbi2-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111855.pX4aQbi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111855.pX4aQbi2-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/cxl/core/features.o: in function `cxl_get_supported_features_count':
   include/uapi/linux/swab.h:51:(.text+0x3c0): undefined reference to `fwctl_unregister'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `cxl_get_supported_features_count':
   drivers/cxl/core/features.c:62:(.text+0x3e2): undefined reference to `fwctl_unregister'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `__devm_add_action_or_reset':
   include/linux/device.h:430:(.text+0x418): undefined reference to `_fwctl_alloc_device'
   xtensa-linux-ld: include/linux/device.h:430:(.text+0x41c): undefined reference to `fwctl_register'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `free_memdev_fwctl':
>> drivers/cxl/core/features.c:387:(.text+0x494): undefined reference to `_fwctl_alloc_device'
   xtensa-linux-ld: drivers/cxl/core/features.o: in function `free_memdev_fwctl':
   include/linux/fwctl.h:114:(.text+0x4c3): undefined reference to `fwctl_register'


vim +387 drivers/cxl/core/features.c

21969e46c91286 Dave Jiang 2025-02-05  385  
21969e46c91286 Dave Jiang 2025-02-05  386  static void free_memdev_fwctl(void *_fwctl_dev)
21969e46c91286 Dave Jiang 2025-02-05 @387  {
21969e46c91286 Dave Jiang 2025-02-05  388  	struct fwctl_device *fwctl_dev = _fwctl_dev;
21969e46c91286 Dave Jiang 2025-02-05  389  
21969e46c91286 Dave Jiang 2025-02-05  390  	fwctl_unregister(fwctl_dev);
21969e46c91286 Dave Jiang 2025-02-05  391  	fwctl_put(fwctl_dev);
21969e46c91286 Dave Jiang 2025-02-05  392  }
21969e46c91286 Dave Jiang 2025-02-05  393  

:::::: The code at line 387 was first introduced by commit
:::::: 21969e46c91286ed183be11d5fd30cd28c7daf7b cxl: Add FWCTL support to CXL

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
