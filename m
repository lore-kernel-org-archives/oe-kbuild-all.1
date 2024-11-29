Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DB53224
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732906907; cv=none; b=eUEFDxLYu065anUbH0x3RhXD2eLIWYQwi+gy19VazICdAD2LyRrujcAij5a7VbX2EStYyOPyQUizBcplFGERzihSc1MbOGsT36HSpetBM3q9NdlEbjAWiEGUXXvcH9GPkmhXNt1KhvOQy4PE39UDrdxbxkUmSI2/DEPxzUZr9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732906907; c=relaxed/simple;
	bh=dpVquUc7/jFNQMUP53StFcR/Ux7KYGqZOGV90cavUcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gmIcTwLp2P+UFrTxxq54WMwRi13U9LKQkn+zv4bWGTnwvOxM/NVJcxtoAW58kwWh+Adfp+pSdmcBB1AbUimnkDW+gqIJWaYz3s0mSeIrV2ON/VFQl1xOmLbsBvsR69easSde3IFCbZnBAKshUUEnfBmWypEbu4FjjUdgaIUGjsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1plGPNo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1plGPNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732906905; x=1764442905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dpVquUc7/jFNQMUP53StFcR/Ux7KYGqZOGV90cavUcY=;
  b=U1plGPNoc4gsB/LBP69jXwXAdE0jLZMtR6BSPrNCp5fxnlbqcPo2P8JB
   WmrmzatWe7kGz2d23dQ/vAh9j1C/TGYUITEpU3MXNRj2dxTJ/6VO7U49X
   v0ovxgQYcZ3IZPtA2e3QcP68SOcnS0hYcF/AHL9Q9zPoWwBzdVeEOam/s
   LS0vMnHN/qeXcvHPuOAp1UKiaU/8IGYXg5rZYJIn+uyEDVEQ9RiWVt1UV
   TUslkBMCNcpsRaPCfqkYLCIK4ubS7GMcXP8vyj338mw0HHXFM9BgvgAtL
   w/0mPu71a+O0x0LUfYR/pcl5c8ii18dZb7K6ZqY1BA9g0OcZ8eqoHtaW3
   Q==;
X-CSE-ConnectionGUID: DXCxrq7OQ3mNPjdRySW81A==
X-CSE-MsgGUID: Aue7AlAiS3q3+cGcM3W8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43812857"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="43812857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 11:01:44 -0800
X-CSE-ConnectionGUID: RrNog1rdRqCzjwSnudVv3A==
X-CSE-MsgGUID: TjetfK73RgqLP+wC0cMKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="93387460"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2024 11:01:43 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH6FI-0000dR-2C;
	Fri, 29 Nov 2024 19:01:40 +0000
Date: Sat, 30 Nov 2024 03:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Kanchan Joshi <joshi.k@samsung.com>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>
Subject: [axboe-block:for-6.14/io_uring 22/29]
 include/linux/bio-integrity.h:104:12: warning: 'bio_integrity_map_user'
 defined but not used
Message-ID: <202411300229.y7h60mDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.14/io_uring
head:   a757ddcd74c4b78403e4b46080de6eb73a17ab9e
commit: 465f05a6462bb67ff51c663759ca9b4952718205 [22/29] block: modify bio_integrity_map_user to accept iov_iter as argument
config: sh-kfr2r09-romimage_defconfig (https://download.01.org/0day-ci/archive/20241130/202411300229.y7h60mDg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300229.y7h60mDg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300229.y7h60mDg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/blk-integrity.h:6,
                    from block/bdev.c:15:
>> include/linux/bio-integrity.h:104:12: warning: 'bio_integrity_map_user' defined but not used [-Wunused-function]
     104 | static int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/bio_integrity_map_user +104 include/linux/bio-integrity.h

   103	
 > 104	static int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
   105	{
   106		return -EINVAL;
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
