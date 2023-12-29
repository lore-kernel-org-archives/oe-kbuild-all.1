Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829B23A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 02:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWQX79Ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703816011; x=1735352011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QnmlEUuv6Iz8VGHcJLyH5kNZNsqneecF77lgdC0j4+M=;
  b=JWQX79JiTPim7hDF8Xm/uK5nqw7T2/rxJ+NxvZg6KHsighY0cUIdVKvl
   iCNdeIRVaJ2VCBHQd76qmlIkrgtEfd6QJfIAgK6fenBzIT+Kufm7jqiha
   j5LhEvr8Qi2eUn5GgasJ5rePxbHD33USI9A4w/7y5lFSKV/bf7183yjNL
   Wq2YlT8/D8jYjOYKCqgo7ph8ElS2r1M2mTBYZKZbekde18qM+Pz70DU+E
   XQFjxMVS97U1u3Fyb5x1z5XrGTUtpLLcv7rRYR7NSPhOD9uxH4DQUVJHW
   GuwiHiwG3Tahd4pEQQ6PvHFg9dId8aCMAGhBaO1j/vB2JdFQ4KNaZhLzm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="460926295"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="460926295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 18:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="27017711"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2023 18:13:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ2Mm-000H0B-2k;
	Fri, 29 Dec 2023 02:13:07 +0000
Date: Fri, 29 Dec 2023 10:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:blk-limits 26/45] ld.lld: error: undefined symbol:
 blk_revalidate_disk_zones
Message-ID: <202312291036.aiiPA0Dx-lkp@intel.com>
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
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231229/202312291036.aiiPA0Dx-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 8a4266a626914765c0c69839e8a51be383013c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312291036.aiiPA0Dx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312291036.aiiPA0Dx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: blk_revalidate_disk_zones
   >>> referenced by virtio_blk.c
   >>>               drivers/block/virtio_blk.o:(virtblk_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
