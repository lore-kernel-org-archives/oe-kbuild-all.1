Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23A205AC4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 14:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591833; cv=none; b=eTzEIcXGnwqgRazAGwbE+LEZZPlQZoUs6oOx7tmLc1B1/2Dp7/cD1LYMloRf+kThWM+vP/QDhNiQB1VLeVtWjZTY3Kuzpg6sPqSmW4MMMRWE7N+qh3gh3HDe00d6gpYPsD4fz2rN7SKXMWzfYJB6pqKfNqOPlY/ZKl56r0DlCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591833; c=relaxed/simple;
	bh=GeJ6kRwFFsTpR5ZQ0pRd9CQvZm7GuMC6mmR0K4ABVtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWepfqJ5bYol4dXCfnLv192ykrKrNdf6gRDHciaoSEWjVEmS1d4otyFroPvy/LjgydqxYU8f7qeJMHbYRQxAU5MNlAlK4vvOMAWO06Je/awbOfrguBtSiZOtea3NNkehci843k3/yYJMLLQEnlCpEqQKcZqIircLniK0AnNut24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDhs72FZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDhs72FZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591832; x=1770127832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GeJ6kRwFFsTpR5ZQ0pRd9CQvZm7GuMC6mmR0K4ABVtQ=;
  b=iDhs72FZBYS3KkLGalTCDTxc6PKDL4k7l3N0TewmzvDQlL9KaUQnbbBA
   vuyYBqBle03fW+xm8yirxTkYBIcfYdyWxF0H1SVQVe8So1flvlDYAoaal
   QKaBeS2A6d2gytObu5uyAbXKoQEwHm4TnVxOer1Fqm6SdheWPLnOkaGbK
   eXJCjMZiESV7JbudtRI2q0eYLSZ1efxyvvM71VxS8miT8x7wqpP4EKkn3
   pfe6Thd2HkYQ04hwpR29E6Exgzab+yeMwNJXopDI3kPbn1maBlwPgCDOY
   uCO3ovNPaB5y+vXk82xFNf3xe05bhmNpfmJuyZNPlFfqV82BVJ2Io9nhj
   A==;
X-CSE-ConnectionGUID: vCCttkixSNKQMFxobkqkrQ==
X-CSE-MsgGUID: blCYRNvxRXmaEzxjotTgGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39115414"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39115414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:10:32 -0800
X-CSE-ConnectionGUID: dPOUwV+YTxm94kKTBWkMcQ==
X-CSE-MsgGUID: zBwZhg9hRW6XCDPOQrLkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115332369"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 06:10:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tex9f-000r1a-2H;
	Mon, 03 Feb 2025 14:10:27 +0000
Date: Mon, 3 Feb 2025 22:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfs-data-crc 20/21] fs/xfs/xfs_data_csum.c:45:2: error:
 call to undeclared function 'bip_set_seed'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202502032220.9zFtSmB5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git xfs-data-crc
head:   99d5f00e7209b1efbf51c27f4746718c27104289
commit: 5b8b054ee57196ffbbd33ca472328041d4485762 [20/21] xfs: support T10 protection information
config: powerpc-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032220.9zFtSmB5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032220.9zFtSmB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032220.9zFtSmB5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_data_csum.c:45:2: error: call to undeclared function 'bip_set_seed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           bip_set_seed(bip, bio->bi_iter.bi_sector);
           ^
   fs/xfs/xfs_data_csum.c:45:2: note: did you mean 'bio_set_dev'?
   include/linux/bio.h:466:20: note: 'bio_set_dev' declared here
   static inline void bio_set_dev(struct bio *bio, struct block_device *bdev)
                      ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +/bip_set_seed +45 fs/xfs/xfs_data_csum.c

    16	
    17	void *
    18	xfs_data_csum_alloc(
    19		struct bio		*bio)
    20	{
    21		struct blk_integrity	*bi = blk_get_integrity(bio->bi_bdev->bd_disk);
    22		struct bio_integrity_payload *bip;
    23		unsigned int		buf_size;
    24		void			*buf;
    25	
    26		if (!bi)
    27			return NULL;
    28	
    29		buf_size = bio_integrity_bytes(bi, bio_sectors(bio));
    30		/* XXX: this needs proper mempools */
    31		/* XXX: needs (partial) zeroing if tuple_size > csum_size */
    32		buf = kmalloc(buf_size, GFP_NOFS | __GFP_NOFAIL);
    33		bip = bio_integrity_alloc(bio, GFP_NOFS | __GFP_NOFAIL, 1);
    34		if (!bio_integrity_add_page(bio, virt_to_page(buf), buf_size,
    35				offset_in_page(buf)))
    36			WARN_ON_ONCE(1);
    37	
    38		if (bi->csum_type) {
    39			if (bi->csum_type == BLK_INTEGRITY_CSUM_IP)
    40				bip->bip_flags |= BIP_IP_CHECKSUM;
    41			bip->bip_flags |= BIP_CHECK_GUARD;
    42		}
    43		if (bi->flags & BLK_INTEGRITY_REF_TAG)
    44			bip->bip_flags |= BIP_CHECK_REFTAG;
  > 45		bip_set_seed(bip, bio->bi_iter.bi_sector);
    46	
    47		return buf;
    48	}
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
