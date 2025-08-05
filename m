Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A51A1F460B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414753; cv=none; b=D1805RKIfQwQqhL1LO+62Vo8NriJukVBmTUG4wMps2uY07s++LuiIlXOQScIMI3o9wxZ5hAZV/8zAVbpPgS8j8dloRsyWialmcitr1l3rxRKLT7wuJl3Ly/H1zVtevmN9xMJDe2Cpt/efl2QD7dsTm78kDv9Gmb+8R6cs8xmm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414753; c=relaxed/simple;
	bh=JT4rp9wLVC++CxaeO0uRL81JtSwPC3eyEY3/opU3kKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ckuu/p5PPmDNmWXGf3iJZz2b5OwMOKAX6ab5wj1YCdPmdZWTJI8Xm6iQHj3QnXmBbxH9jcQvfSasGl+2CszeXWEfFX3kgSBtTOJxdin4R4VfrUXzz7lWVdF7Vm2e46tQLrU6BtCFDK5bHoHdeDi8elD1Gs/m+ePHhRsIlUBc4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW10rFPW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW10rFPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754414752; x=1785950752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JT4rp9wLVC++CxaeO0uRL81JtSwPC3eyEY3/opU3kKM=;
  b=bW10rFPWJmoZiUmC0rHBM9XAdI1biIKCzwxBg5UclqzFjmXLE1FRkzNg
   WjWKsrnct4vKoSt/nBqi3BkvPBEgTDqHT5Y3pxEDqmwgSk1aGavIpQ5GU
   Nxn6chOk+n0TwYoVSjLqUK9Yfuw3mXjMgTqceLILYmtGVtwdVbkLZIbID
   7SrQ9L9YNK/BcDCsb9j8hkwh92A91WdYCS+sVtS6+HBCHmLmghpVdNFFs
   7TSj9wCYadL3v7XzkdTZaALlakwcUmN84ME721UjW3gMFwo2QG/cSbcLU
   UcO3FJjOYjsGBxI64CWqtr3Cn7TKjMyeWmOJgjGT9Z/treYmjQUlXrb8x
   g==;
X-CSE-ConnectionGUID: qp9sfoibSzO3tap/7+esww==
X-CSE-MsgGUID: 9IpEpWD1ST2CTLdWn2ev/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60356234"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="60356234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 10:25:51 -0700
X-CSE-ConnectionGUID: pEpczqclTU20i2LJ6b3Zmg==
X-CSE-MsgGUID: yH1kNG0yRFOIdgzJXxLIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164450516"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2025 10:25:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujLQ3-00022V-19;
	Tue, 05 Aug 2025 17:25:47 +0000
Date: Tue, 5 Aug 2025 19:25:45 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743] fs/block_dev.c:1075:5:
 warning: no previous prototype for 'bd_prepare_to_claim'
Message-ID: <202508051928.DGkSyfnv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   58693b1f5fa8f02b34ab9a02096472232731e864
commit: fb5186196e267b3cd58b3ef31951427e8b153d05 [1743/1743] block: fix scan partition for exclusively open device again
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508051928.DGkSyfnv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051928.DGkSyfnv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051928.DGkSyfnv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/block_dev.c:1075:5: warning: no previous prototype for 'bd_prepare_to_claim' [-Wmissing-prototypes]
    1075 | int bd_prepare_to_claim(struct block_device *bdev,
         |     ^~~~~~~~~~~~~~~~~~~
   fs/block_dev.c:1123:6: warning: no previous prototype for 'bd_abort_claiming' [-Wmissing-prototypes]
    1123 | void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
         |      ^~~~~~~~~~~~~~~~~


vim +/bd_prepare_to_claim +1075 fs/block_dev.c

  1061	
  1062	/**
  1063	 * bd_prepare_to_claim - claim a block device
  1064	 * @bdev: block device of interest
  1065	 * @whole: the whole device containing @bdev, may equal @bdev
  1066	 * @holder: holder trying to claim @bdev
  1067	 *
  1068	 * Claim @bdev.  This function fails if @bdev is already claimed by another
  1069	 * holder and waits if another claiming is in progress. return, the caller
  1070	 * has ownership of bd_claiming and bd_holder[s].
  1071	 *
  1072	 * RETURNS:
  1073	 * 0 if @bdev can be claimed, -EBUSY otherwise.
  1074	 */
> 1075	int bd_prepare_to_claim(struct block_device *bdev,
  1076				struct block_device *whole, void *holder)
  1077	{
  1078	retry:
  1079		spin_lock(&bdev_lock);
  1080		/* if someone else claimed, fail */
  1081		if (!bd_may_claim(bdev, whole, holder)) {
  1082			spin_unlock(&bdev_lock);
  1083			return -EBUSY;
  1084		}
  1085	
  1086		/* if claiming is already in progress, wait for it to finish */
  1087		if (whole->bd_claiming) {
  1088			wait_queue_head_t *wq = bit_waitqueue(&whole->bd_claiming, 0);
  1089			DEFINE_WAIT(wait);
  1090	
  1091			prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
  1092			spin_unlock(&bdev_lock);
  1093			schedule();
  1094			finish_wait(wq, &wait);
  1095			goto retry;
  1096		}
  1097	
  1098		/* yay, all mine */
  1099		whole->bd_claiming = holder;
  1100		spin_unlock(&bdev_lock);
  1101		return 0;
  1102	}
  1103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
