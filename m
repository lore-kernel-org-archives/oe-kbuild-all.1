Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3263B1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 05:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXHILBGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699679220; x=1731215220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiH8jKuegcMMv9Gy2PeqTMWi9jBKDxHHWqk1pBT49lY=;
  b=TXHILBGRVB5mcl4rpp4aGYQzgS7N2pY1Z/XDImNeEpXxYVbVHr+RCeBi
   rXrqxRltaJdjdJY2EZpeZ4Xz9dXO0DqcGhLbxeZJ4m3kI77YEOblRYJyY
   SH7IZNAtmj1jXkH3owwvEoeSw1SnPqjPs/8ZPbKClUYdBXMq0EVNHkj4R
   f78DqL5LbmuQyJr0BtMIhfgokTdAIugjk/EDLv1hvr/noJADk6Nbxf2e6
   rPsgSsz+cGUFxGj7AYWtAq/tKFyY+JvOYMW/P+K/DaebN079CALwV7U2h
   oEMn0PTUQjCDkBiCrqfiwYGTfReD84b+qCtQ8VJoHHspVUoc+tuAKDnFE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="8907102"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="8907102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 21:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011096627"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="1011096627"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 21:06:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1gCt-000ADs-0e;
	Sat, 11 Nov 2023 05:06:55 +0000
Date: Sat, 11 Nov 2023 13:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7 335/336]
 drivers/tty/hvc/hvc_iucv.c:1038:5: warning: no previous prototype for
 'hvc_iucv_free'
Message-ID: <202311111317.Y9M42gXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   a4b755e29c5eea2a696d7ec17a623dcb675a9897
commit: 61caa2dc47b1faa31a67192533f7bfaf1277db54 [335/336] fixup function pointers
config: s390-defconfig (https://download.01.org/0day-ci/archive/20231111/202311111317.Y9M42gXw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111317.Y9M42gXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111317.Y9M42gXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/hvc/hvc_iucv.c:1038:5: warning: no previous prototype for 'hvc_iucv_free' [-Wmissing-prototypes]
    1038 | int hvc_iucv_free(void *data)
         |     ^~~~~~~~~~~~~
   drivers/tty/hvc/hvc_iucv.c: In function 'hvc_iucv_alloc':
   drivers/tty/hvc/hvc_iucv.c:1104:28: error: assignment to 'void (*)(struct device *)' from incompatible pointer type 'int (*)(void *)' [-Werror=incompatible-pointer-types]
    1104 |         priv->dev->release = hvc_iucv_free;
         |                            ^
   drivers/tty/hvc/hvc_iucv.c: In function 'hvc_iucv_free':
>> drivers/tty/hvc/hvc_iucv.c:1041:1: warning: control reaches end of non-void function [-Wreturn-type]
    1041 | }
         | ^
   cc1: some warnings being treated as errors


vim +/hvc_iucv_free +1038 drivers/tty/hvc/hvc_iucv.c

  1037	
> 1038	int hvc_iucv_free(void *data)
  1039	{
  1040		kfree(data);
> 1041	}
  1042	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
