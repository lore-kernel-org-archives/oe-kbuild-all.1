Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015516420
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gen7IC2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700819418; x=1732355418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmCtAocorbltM3VkRipVgCK7k1SB1QkEo1ecDjf/nbk=;
  b=Gen7IC2GqF9W/Lx3gHKKjbrRYp7W+hzvMDQ3FiyWEGChmt4LGYlnjla6
   NDoaEYxwlhMOBunt10hrDyNveW2PUyTji4T1YhQ+JLOT5qkycLXGPyGJb
   NoKL+4UqWfJA5Yj+7uJ/DvXWd56JYEDMLr7KA64rsVUxgVCNu/f4xj8YD
   F9Ffw8qWv+p7j3S3jvo9fMRDkUz2hUKZljaJ/S/4BZlJURCAf5tEq/kC+
   rPVALP//i+QVFnm5ozmSihOOz6CGc8vprwVWUKSfwyth2fg+sC4lQahKV
   nHCzisqz9Wrr6U8CWmcz7kdxzwkQ+3xjCifWlc+VLp3beXh78kmrahm74
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372559192"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="372559192"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885228019"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="885228019"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2023 01:50:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Sp8-0002LR-0H;
	Fri, 24 Nov 2023 09:50:10 +0000
Date: Fri, 24 Nov 2023 17:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 4/56] main.c:undefined reference to
 `fscache_init'
Message-ID: <202311241337.d7Y1Lufd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   43d25b256ce0f02be1a82781479564cf3133700f
commit: 1393e680d493f18bc2c9537e7dceb14df64d0773 [4/56] netfs, fscache: Move /proc/fs/fscache to /proc/fs/netfs and put in a symlink
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231124/202311241337.d7Y1Lufd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241337.d7Y1Lufd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241337.d7Y1Lufd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `netfs_init':
>> main.c:(.init.text+0x436ec): undefined reference to `fscache_init'
   ld: vmlinux.o: in function `netfs_exit':
>> main.c:(.exit.text+0x4d5): undefined reference to `fscache_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
