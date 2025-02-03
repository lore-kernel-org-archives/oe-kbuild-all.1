Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8E204C01
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 12:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587384; cv=none; b=uE3lUqsE7CYp6behZaLjRLebro6gvJvZuywX9jTS7gR27AdZT/e/wVKMnt2VdQLr2KTWyRfqwK0EXFFufeIgMASw1BZYgAZWn6reTLymy29yoAqD8YLiQi7l8qjKlSQmclD8bS3FKFtC+0PhqOGGH8pH5R6t+sg783A3uX8djDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587384; c=relaxed/simple;
	bh=6w0a2l2KUweq2eYumfq2rqOz/koTC2nVH5tHo0xcLas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JXTs8ORrjoXAxhvnK1txOnwnU2NulUd6xHkpDR03EnapM+7HhI11kBt1BnR1JSwunOpnrIvWIu6A0xKpeJ20ICWWSJDmKSaYWDyILOpJjQEMpzguJEp1uloptTivvKGw4CRp0pwVM7a6h2oWFY8iiuoCyzoJNQthcyQ0stdJY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgRfrY3i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgRfrY3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738587382; x=1770123382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6w0a2l2KUweq2eYumfq2rqOz/koTC2nVH5tHo0xcLas=;
  b=XgRfrY3iiFepJqt8a4CXCcV72gRfh7z/kD19NrXpLaRoAsUBtyVBBmk1
   c4nd5HScKNyJGxoOgbJNOLUiobUZ1qUnDLRNT7exSO0W6fu5I8rYBpisS
   4WJyy5o8p9YX/vQ+viS1LNekE4O5NCo6a+7PPx098pwi5v0Z70AZoDLE9
   JD1DokaXaJrCadtYSTvm6zFECn1Uh+spycGumfl6m12R2MUnxEWKmWgwn
   iEWGtoZqCc1fUcH2g+4SxLlrlrU6H1P37/z0OUHsDMpIbNJKQjLanGLBr
   FOLqXy/P1ksAddNKiJAGMA4xIu1FwW2TA9wjAmGNljDcyLKX68hYvuAXA
   w==;
X-CSE-ConnectionGUID: rtNxHiLFT/W+1ctra2D++g==
X-CSE-MsgGUID: zoh8yAcISNG6BXYz9408AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49680932"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49680932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:56:21 -0800
X-CSE-ConnectionGUID: wqo8dsv+QhuT5eArpAa8jQ==
X-CSE-MsgGUID: jFOK9K/mRjCAsbJjjfjh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110454035"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2025 04:56:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tevzu-000qvJ-11;
	Mon, 03 Feb 2025 12:56:18 +0000
Date: Mon, 3 Feb 2025 20:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfs-data-crc 20/21] fs/xfs/xfs_data_csum.c:45:9: error:
 implicit declaration of function 'bip_set_seed'; did you mean 'bio_set_dev'?
Message-ID: <202502032042.pJ4DgAsr-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032042.pJ4DgAsr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502032042.pJ4DgAsr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502032042.pJ4DgAsr-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_data_csum.c: In function 'xfs_data_csum_alloc':
>> fs/xfs/xfs_data_csum.c:45:9: error: implicit declaration of function 'bip_set_seed'; did you mean 'bio_set_dev'? [-Werror=implicit-function-declaration]
      45 |         bip_set_seed(bip, bio->bi_iter.bi_sector);
         |         ^~~~~~~~~~~~
         |         bio_set_dev
   cc1: some warnings being treated as errors


vim +45 fs/xfs/xfs_data_csum.c

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
