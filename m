Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988B824B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712928678; cv=none; b=URaDmwZFxo43BQbot7GFus7dDLxEsiAyqhh9+WVf3blYKNoMbZCvGeY1qzcdtTAXWnmLZirHjSqtfxzwPfaMX1TqhPuP54J2C42HuFzKbAP5KFESEi0zdcoWfCtNoN+XypAh3Ba/leK1ETok7hF/d76EHK44+UwdA/++tARzo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712928678; c=relaxed/simple;
	bh=HYSfmzaegIk4bXKHBvaLBzddmNkxdBUWyCBGkPSkSbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dg/OGcRGUIHfIN1yLJJ/37O29kiXzAnUqQEmpB10E4RBMmw/DARUR9D2DhmeFXVFVKd0MGUg9II1GzyTGdtx0Fb9gvR4/fdRSjyY4uufZsGnvX/43k1OxIGtdfRSAFnv2e9voa9k8iH5yKxWPHljnfszXAhS1hJXpubehJgA1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVtBu+tX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVtBu+tX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712928676; x=1744464676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HYSfmzaegIk4bXKHBvaLBzddmNkxdBUWyCBGkPSkSbU=;
  b=bVtBu+tXXyyXQ6YoqISr+mOGGIqSXihcnBL8/rP4BnbJCjHtOcdVg1v/
   VmO78I6++I9rr9iBqvCX24WqJTpBcr0Hdi3WVTW8pIYeral8F0EPSS0+M
   yYYb+8Nr7axkaSvn+JjybkpSMij4ASFKsdV8Nh2LSCMX3mWvOphIyV5Uf
   U78Z+C2b5cJU2YSnLba1s8nGXEQZ3iEQQ8Sbdc1JOtGdq9IpYC/BMC1BK
   zOnh4ePWLhWBWZQtNREKAzqz+NrBPvN8TLHcA104IpvTgOxsk21sEF+6P
   /Lon6CxdgAJx4pBYuR2uCP7GiaJy6CPkAw+qvtfTOIYcAWquNh6rafv3k
   A==;
X-CSE-ConnectionGUID: pBv9hMeSRPW1Rru+8TLNsw==
X-CSE-MsgGUID: 6xeEnD+yS6eGcpk977o3gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8937378"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8937378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:31:15 -0700
X-CSE-ConnectionGUID: yBWJ6yvUQb+k2y4nadU7Hw==
X-CSE-MsgGUID: JyDYfyWmQQe8t4PjFZeLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="21149357"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2024 06:31:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvGzn-0009nR-2H;
	Fri, 12 Apr 2024 13:31:11 +0000
Date: Fri, 12 Apr 2024 21:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 150/438]
 drivers/gpu/drm/omapdrm/dss/dss.c:919:27: error: initialization of 'ssize_t
 (*)(struct kiocb *, struct iov_iter *)' {aka 'int (*)(struct kiocb *, struct
 iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *,
 char *, size_t,  loff_t *)' {...
Message-ID: <202404122100.qM0FdqEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: 029abf734442b22f55ea6dd1766a2fdb813033ee [150/438] drm: omap: convert to read/write iterators
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240412/202404122100.qM0FdqEl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122100.qM0FdqEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122100.qM0FdqEl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/dss.c:919:27: error: initialization of 'ssize_t (*)(struct kiocb *, struct iov_iter *)' {aka 'int (*)(struct kiocb *, struct iov_iter *)'} from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'int (*)(struct file *, char *, unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
     919 |         .read_iter      = seq_read,
         |                           ^~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.c:919:27: note: (near initialization for 'dss_debug_fops.read_iter')
   cc1: some warnings being treated as errors


vim +919 drivers/gpu/drm/omapdrm/dss/dss.c

   916	
   917	static const struct file_operations dss_debug_fops = {
   918		.open		= dss_debug_open,
 > 919		.read_iter	= seq_read,
   920		.llseek		= seq_lseek,
   921		.release	= single_release,
   922	};
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
