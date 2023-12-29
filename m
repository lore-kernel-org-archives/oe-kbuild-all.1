Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C533A1385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 02:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zoi7GGIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703815209; x=1735351209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AE6it2PnqK4MWFQhdTttYxxMxTZiNIKizMF55CnWIvA=;
  b=Zoi7GGIbgxg0T+NgG9svlal2VYudixQzQRtoHXAlMIi9RTyW6fDzERaK
   49BnBKsGx/IlnHYo0aLh9kLUrp1cbZXaHAPg2/kZmF4xOfkq3oi2jMz5U
   YuVKnjQ3TFEYeSK23EMb84RSekBhwiOhvF3kgO48cUJX9hI+DLpFi9BUA
   m1zhBWzutp/5LLIjRgduYLeSivO56UrsQ0LlRTahZ8lshFz+32emiLAhK
   w+TyAih+pvLIMArq7ae8h0hakjJSAAmE57f9y8vIieQlOgGwu2CBk6L8o
   OSOlMmuJnDWt7kiIQpgS4ssrxVyKcCKkOZOqnrT6VdaeFUBpr00I3NP/K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="396331935"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="396331935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 18:00:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="27014894"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2023 18:00:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ2AG-000Gzi-2i;
	Fri, 29 Dec 2023 01:59:58 +0000
Date: Fri, 29 Dec 2023 09:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 26/45] virtio_blk.c:undefined reference to
 `blk_revalidate_disk_zones'
Message-ID: <202312290910.YmhrKjBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git blk-limits
head:   337f45dec9ea74309924c682e15eeef50d86b1d9
commit: 0bf4a65ecbc1e08c6794b08c66b3f7f922969b40 [26/45] virtio_blk: pass queue_limits to blk_mq_alloc_disk
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231229/202312290910.YmhrKjBN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290910.YmhrKjBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290910.YmhrKjBN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtblk_probe':
>> virtio_blk.c:(.text+0x8cd2c0): undefined reference to `blk_revalidate_disk_zones'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
