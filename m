Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB651C40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEPaC43X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701358349; x=1732894349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBYCYr39+2HZ30tFMDoC7iEyYdwoEbLS55ajKdH+t3I=;
  b=YEPaC43Xj8p7p4IEWFL58KnKuOO7b999gcaSNNej6QcwG60u4iAbDRRk
   vziEPwWrqgOAcLfVX+wP4LFBJQP6fBOYwuP/7wITdfZlOp2Bn/ojBC2aL
   UvM2xAFWoiRASdwBZFIsnzsOak9OSsjSu8RR3kqTDmgjqSPtVG91jAgjn
   Oh1AFyz35qu2J8JJD2ixDYBFpFHDc+zL7Tmsj7DjGQpbRGg88ob2P0xWz
   a/5un35rI/FwldKf07pGg8KBuDDZdgRhK6FXDtLk4iR526XfUkmIIEOQO
   PdE+CtsorYFLgBYbB+HEhEF01AdhaRzejRsqfB5dU1yVV68qAaVdDjMCT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383736041"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="383736041"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="17439491"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2023 07:32:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8j1d-0002Dm-1E;
	Thu, 30 Nov 2023 15:32:25 +0000
Date: Thu, 30 Nov 2023 23:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 7/61] csky-linux-ld: main.c:undefined
 reference to `fscache_init'
Message-ID: <202311302356.tUTHf7ci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   ed72c33e807046e9a09965dba2d3524f5bc90ae9
commit: 4a074a2dc16acd135d805614cc807855ab7831f8 [7/61] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
config: csky-randconfig-002-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302356.tUTHf7ci-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302356.tUTHf7ci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302356.tUTHf7ci-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/netfs/main.o: in function `netfs_init':
   main.c:(.init.text+0x12): undefined reference to `fscache_init'
>> csky-linux-ld: main.c:(.init.text+0x34): undefined reference to `fscache_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
