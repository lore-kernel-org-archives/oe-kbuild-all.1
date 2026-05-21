Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43403360EFA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378429; cv=none; b=gaqfJKWD7BczLUu+6Cr9Ov4HMJvedHIIaUyf+2G/2qOAbFpZNhf7Ytwvm0LaYF0/Kw3yENRx77vdjKpofB0cnYT4InpKyJD0CbehJWw/lpUx2hABTW9Y5KGbU+npP8BA5a3zWIZoqszXLdGwVpUQnjIta2r6A3u+7fqoLVMrEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378429; c=relaxed/simple;
	bh=IAyqQTZVMrOE3f5uI9fonLS8/z8ycPuML3K1X9E+G8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BD0JHopUi28NuCbf+uXTOzHngfOB34os3M+KIcHP8riCKoW1pcxxliIQrLfEV9KHMPAN4M3QEf06lISRuFYu5apK375Kw8yuDFb3YLjS4b3wpqT4cXO48cZfr3ojMeRPiIWlRM7y11Ld7zQux3/miVlPB8ymwGbXybh/1HfsRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoZxJ0Lc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoZxJ0Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779378426; x=1810914426;
  h=date:from:to:cc:subject:message-id;
  bh=IAyqQTZVMrOE3f5uI9fonLS8/z8ycPuML3K1X9E+G8k=;
  b=PoZxJ0LcWFd1ANvMLeyrzK52kNvsHomx5+8JiNI/q9ioEHDOta4gUCVY
   0tN/OtwRYuhGQ3TNrSJcTMTXS+819UgqsUej+YdMWvR0YR6EzNbv9jA8h
   bHr/LQ45aQ3oDu4jqWx0gKIjNRRPvA4p8x3XisHQ1YToaHjMrOSlEbhyd
   XjkJdXk/Xzk1QFOj09njmP4l/XbY9dBtczM3gKmZF6GDJDUJT5wqxhj2M
   ZBRffKu7POTVVHX1IAvmlsErNT91haIZCZjH8w0SDbP9P9GMiT+F52PUp
   H6EWe6aPiTQU0xlXrrXB+UUeYyZyKeYIVaxnVaDHHS6L1+e7wyj+HRT2j
   Q==;
X-CSE-ConnectionGUID: oXygnC2YQYmQHXSwziCWhw==
X-CSE-MsgGUID: Ia2N/XTzRiahuEx3fu88jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80281335"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="80281335"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:47:06 -0700
X-CSE-ConnectionGUID: z/ouNdbDTr+NWqMP/V6a6g==
X-CSE-MsgGUID: Td8JORFmSSmrg+AXhbrJOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="264357532"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 08:46:51 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5bl-000000000ig-0eRm;
	Thu, 21 May 2026 15:46:49 +0000
Date: Thu, 21 May 2026 23:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 John Garry <john.g.garry@oracle.com>
Subject: drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted
 blk_opf_t
Message-ID: <202605212337.mycdFkcd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bc67e4db64aa72732c474b44ea8622062c903f0
commit: de67c139b3846ece6b8bbb62abf1f010ae85c083 dm: test for REQ_ATOMIC in dm_accept_partial_bio()
date:   5 months ago
config: mips-randconfig-r134-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212337.mycdFkcd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212337.mycdFkcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de67c139b384 ("dm: test for REQ_ATOMIC in dm_accept_partial_bio()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212337.mycdFkcd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm.c:1324:9: sparse: sparse: cast from restricted blk_opf_t

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
