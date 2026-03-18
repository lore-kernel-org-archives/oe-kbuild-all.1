Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4648C364927
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 06:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773816581; cv=none; b=o6ZM3io1ZfdUKfvT296dRQCjBpeM1CArLY/Nmj3OKmDRWg5wl28GzxFELgBa/zb4CQ//xEHJNjtVtcCG0eTUvw1d/PTc8TmT6+pfnP1Nw3RyOH/gd17GOXtVtIzJia65fuVXrKKs20VVv1y3UX92ZKiZezT1d5kj8P3jtJvGNYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773816581; c=relaxed/simple;
	bh=aexNjzHJxnPIAqcfxs21DNUct43us5kaeDG8XFT3J9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k74fqurjxD2tox5Y5Q9r0clQDkhUlliVZ7Z8eT3bcSaiefqnLe2GYvaHig7XGL4Z2+2J2uoq7g+e9inQ8nxsvlvuEANZJSELFDkyQAAHBQ/LIWrArDj50tCGe0YAJwz7C9bsvbTqHNMqGasIUCRmVYmQk+FzxDe7Q0NhgO28PLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltlKKEOV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltlKKEOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773816579; x=1805352579;
  h=date:from:to:cc:subject:message-id;
  bh=aexNjzHJxnPIAqcfxs21DNUct43us5kaeDG8XFT3J9w=;
  b=ltlKKEOVDdTXxVT7armouBPIUBngELzuJS3DOkPcmgPA7VopSxHjeTRN
   ZtXSvCefWcAxxkJqQ7+sVUrc10jj7s2jwxUYaE2Ct6y30uFUn42d3eQjJ
   wOicmjOCkLvGwAMJijrOdqA47rtqfbVYjsWyiLdXIJSDVvGbcaO/VC/oQ
   d/qfpCAU3QA+12qtNQyURTgY7b4wU+FJfsDzhxPIkZYGf8RAQiKNNfVeP
   3qQx0/xqqXAmnAd+++wrGYz25kWuSkKLJvPFqn85mrbWqpu8AIDFqT1ZU
   uAEQYDCavD+78Fdkl8PrSzpXVLxCz+351uI+Z810jqLFp51+PKTs7Qb6O
   A==;
X-CSE-ConnectionGUID: fsadZ3a2T160EeTL0Xd5Fg==
X-CSE-MsgGUID: Dr1KrN+KS2uKBgKKyKPdFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92246097"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92246097"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 23:49:36 -0700
X-CSE-ConnectionGUID: xe8hdm+DSimYLJbfcrkhdA==
X-CSE-MsgGUID: R5WTmGOZTuqODui3UH/g2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="224617524"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 23:49:35 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2kih-000000002dj-457R;
	Wed, 18 Mar 2026 06:49:31 +0000
Date: Wed, 18 Mar 2026 14:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Garry <john.g.garry@oracle.com>
Subject: drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted
 blk_opf_t
Message-ID: <202603181439.atBWgPQu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a989fde763f4f24209e4702f50a45be572340e68
commit: de67c139b3846ece6b8bbb62abf1f010ae85c083 dm: test for REQ_ATOMIC in dm_accept_partial_bio()
date:   3 months ago
config: mips-randconfig-r113-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181439.atBWgPQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181439.atBWgPQu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted blk_opf_t
   drivers/md/dm.c:689:16: sparse: sparse: context imbalance in 'dm_get_live_table' - wrong count at exit

vim +1324 drivers/md/dm.c

  1283	
  1284	/*
  1285	 * A target may call dm_accept_partial_bio only from the map routine.  It is
  1286	 * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_* zone management
  1287	 * operations, zone append writes (native with REQ_OP_ZONE_APPEND or emulated
  1288	 * with write BIOs flagged with BIO_EMULATES_ZONE_APPEND) and any bio serviced
  1289	 * by __send_duplicate_bios().
  1290	 *
  1291	 * dm_accept_partial_bio informs the dm that the target only wants to process
  1292	 * additional n_sectors sectors of the bio and the rest of the data should be
  1293	 * sent in a next bio.
  1294	 *
  1295	 * A diagram that explains the arithmetics:
  1296	 * +--------------------+---------------+-------+
  1297	 * |         1          |       2       |   3   |
  1298	 * +--------------------+---------------+-------+
  1299	 *
  1300	 * <-------------- *tio->len_ptr --------------->
  1301	 *                      <----- bio_sectors ----->
  1302	 *                      <-- n_sectors -->
  1303	 *
  1304	 * Region 1 was already iterated over with bio_advance or similar function.
  1305	 *	(it may be empty if the target doesn't use bio_advance)
  1306	 * Region 2 is the remaining bio size that the target wants to process.
  1307	 *	(it may be empty if region 1 is non-empty, although there is no reason
  1308	 *	 to make it empty)
  1309	 * The target requires that region 3 is to be sent in the next bio.
  1310	 *
  1311	 * If the target wants to receive multiple copies of the bio (via num_*bios, etc),
  1312	 * the partially processed part (the sum of regions 1+2) must be the same for all
  1313	 * copies of the bio.
  1314	 */
  1315	void dm_accept_partial_bio(struct bio *bio, unsigned int n_sectors)
  1316	{
  1317		struct dm_target_io *tio = clone_to_tio(bio);
  1318		struct dm_io *io = tio->io;
  1319		unsigned int bio_sectors = bio_sectors(bio);
  1320	
  1321		BUG_ON(dm_tio_flagged(tio, DM_TIO_IS_DUPLICATE_BIO));
  1322		BUG_ON(bio_sectors > *tio->len_ptr);
  1323		BUG_ON(n_sectors > bio_sectors);
> 1324		BUG_ON(bio->bi_opf & REQ_ATOMIC);
  1325	
  1326		if (static_branch_unlikely(&zoned_enabled) &&
  1327		    unlikely(bdev_is_zoned(bio->bi_bdev))) {
  1328			enum req_op op = bio_op(bio);
  1329	
  1330			BUG_ON(op_is_zone_mgmt(op));
  1331			BUG_ON(op == REQ_OP_WRITE);
  1332			BUG_ON(op == REQ_OP_WRITE_ZEROES);
  1333			BUG_ON(op == REQ_OP_ZONE_APPEND);
  1334		}
  1335	
  1336		*tio->len_ptr -= bio_sectors - n_sectors;
  1337		bio->bi_iter.bi_size = n_sectors << SECTOR_SHIFT;
  1338	
  1339		/*
  1340		 * __split_and_process_bio() may have already saved mapped part
  1341		 * for accounting but it is being reduced so update accordingly.
  1342		 */
  1343		dm_io_set_flag(io, DM_IO_WAS_SPLIT);
  1344		io->sectors = n_sectors;
  1345		io->sector_offset = bio_sectors(io->orig_bio);
  1346	}
  1347	EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
  1348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
