Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6819CC39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 01:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756343315; cv=none; b=VsIaHmW1VLUyvKO0nRFGBL2ptOp2zWZgtHe0PNC8o6DzjmMobk2Pao0F7yFaktwnm7V5/SKZOT9q5iddeLb9mDEo75dUgIACO1EC99DpK2UEsVv5slCQ3qD8HByV7Tyau3qNG3YyMEk4ST2t3G13t+9VyJ6ZAOAx4He2c+FKDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756343315; c=relaxed/simple;
	bh=EHUPRS3v22IJTAGxduelikQFFC29JQa0uuN0akHoYz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9oCe3Wpbvpq/IAPlpzShItqhg0EBdnSwspyockUjgs6rgyyolP/gHbW0wnc67XhQDxTwqHHsjeJ+NBQBW0hG6/mvvgqf3vA0G4FjOceNLy2gscBpYRTp+wc4ZmLN4bdaw1FPcrsMUuSMhD3FSXOxrJoNWVS+V0qPm0XVT7gY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrTyb9CA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrTyb9CA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756343314; x=1787879314;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EHUPRS3v22IJTAGxduelikQFFC29JQa0uuN0akHoYz8=;
  b=OrTyb9CAPscb+V6xgx8ocQXn8K6YVIdtKnAWW/Tv0FHAZTKkacREnIDM
   cL1L06ETSHj2wYJfNn9nUPYkp/WCUFF0hp5BM6+NBNK9hCGjUgPj2Zp+u
   sNt3QRDPZvtwLUf0MIdFzRmMTbelg0iAs9vYnRr6B+KUtnpmMPYea9xd2
   uqv0GLM55iJHFlJGlq9Ub0hsWJajtkcG9wpgNZzO+BKURVuff3tX1EPC1
   84cN+aWrvWP7g0XubqMGRu2gr04wgaStrayl0eskTzTNeQTlUOGrHxpIz
   E11srdXeTzOXbirWbFvHnn7p6AYN38ebvlmRCCWg7jKJ97I5IgzJIHZKR
   Q==;
X-CSE-ConnectionGUID: LQ/L7VgSRcCRY74s+nVsng==
X-CSE-MsgGUID: NZ5F3JH6QP+Kf8RCgiR8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62247827"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62247827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 18:08:33 -0700
X-CSE-ConnectionGUID: jdUkBHfMRdGIsL8wfAW1iA==
X-CSE-MsgGUID: VnJzwkAlSi2aOwaaSRiJLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169579482"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2025 18:08:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urR7t-000TJY-1i;
	Thu, 28 Aug 2025 01:08:29 +0000
Date: Thu, 28 Aug 2025 09:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/1]
 drivers/block/virtio_blk.c:2725:37: warning: 'virtblk_chr_fops' defined but
 not used
Message-ID: <202508280954.V1BWqeV3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3fe510ec8500eb78ffe2c1a747db0c27d2257130
commit: afb76076d69f73b48b18395cdb6b2552d07e0dd6 [0/1] anolis: virtio-blk: make chardev only exposed to specific devices
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250828/202508280954.V1BWqeV3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280954.V1BWqeV3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280954.V1BWqeV3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c: In function 'virtblk_probe':
   drivers/block/virtio_blk.c:2845:25: warning: unused variable 'i' [-Wunused-variable]
    2845 |         int err, index, i;
         |                         ^
   At top level:
>> drivers/block/virtio_blk.c:2725:37: warning: 'virtblk_chr_fops' defined but not used [-Wunused-const-variable=]
    2725 | static const struct file_operations virtblk_chr_fops = {
         |                                     ^~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:2667:12: warning: 'virtblk_cdev_add' defined but not used [-Wunused-function]
    2667 | static int virtblk_cdev_add(struct virtio_blk *vblk,
         |            ^~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:2661:13: warning: 'virtblk_cdev_del' defined but not used [-Wunused-function]
    2661 | static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
         |             ^~~~~~~~~~~~~~~~


vim +/virtblk_chr_fops +2725 drivers/block/virtio_blk.c

f0eeb0941b6027 Ferry Meng 2025-05-10  2724  
f0eeb0941b6027 Ferry Meng 2025-05-10 @2725  static const struct file_operations virtblk_chr_fops = {
f0eeb0941b6027 Ferry Meng 2025-05-10  2726  	.owner		= THIS_MODULE,
f0eeb0941b6027 Ferry Meng 2025-05-10  2727  	.open		= virtblk_chr_open,
f0eeb0941b6027 Ferry Meng 2025-05-10  2728  	.release	= virtblk_chr_release,
9c7e3e8e2c2ed3 Ferry Meng 2025-05-10  2729  	.uring_cmd	= virtblk_chr_uring_cmd,
0a3f5314e6d2d1 Ferry Meng 2025-05-10  2730  	.uring_cmd_iopoll = virtblk_chr_uring_cmd_iopoll,
f0eeb0941b6027 Ferry Meng 2025-05-10  2731  };
f0eeb0941b6027 Ferry Meng 2025-05-10  2732  

:::::: The code at line 2725 was first introduced by commit
:::::: f0eeb0941b60279a141674daaba4f88204850c2b anolis: virtio-blk: add virtio-blk chardev support

:::::: TO: Ferry Meng <mengferry@linux.alibaba.com>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
