Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF620CCCA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 19:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761334964; cv=none; b=cNgqSUAdVc5cv/3R/i87i1u4R+zVbgyaSn3ixz+dSOxqRVzfjKrUm1Thakc0K4T+nFRG0PmAiP2+xiPA8KLGxIoasZDPO9rruFjEl39qi18EBpVPbPPrEsb/IZie1L16hPlsNr77mFfY4cbicxjEOqiGoXF6SZAHF+U+P5Pkvf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761334964; c=relaxed/simple;
	bh=3qT2UkPS/SH8v6/yHh89jwCuE5E4XXYGUvyrCYGynQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yuse5EvvUpYegqmsboXbVopkBZqLheXGKdy9GBao9/hgw/J9pYohe6axr2fCPT8xwWlGL1BZIPHwjuVYLNpb0UDbnuzyStu/s54aS4oAtK+2F0dUw9BwMy3kpxOAiwFqKPWx3Sghd90NY9+JmmnPPTyz1mImbrbtrDCQiTfqZ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUk0xWAC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUk0xWAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761334963; x=1792870963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qT2UkPS/SH8v6/yHh89jwCuE5E4XXYGUvyrCYGynQs=;
  b=RUk0xWACNlRzRK97cd75Jrus6Q2/5LfJobQuWJ9a+sKXQh2KKjen97i8
   0NSbpysmaLotiO9jq5gIVlceEnXuFL+vzWM6CqCUFe9A3tcKexmuMnTmX
   SlvQw4S0tjMAgzufCByl8to9O5SgL6fx9ZXyxlLR+1lkPDFdGylhPH/kG
   1ZBLPz9EtPADgtALkvyxaocne5MCp+iZ9IRx/+ITslhDjzM/FWmfWEia2
   REijrTqijZFe/7/Wgc9/jtWzhopFiW38uYVFTDleK2RhIRuHUmvazjt2c
   4lkkZUgCXdqhUOuwxoZoNL0H3hrW3JffX3UowZ9IDHMjINQh0rct2bdNF
   w==;
X-CSE-ConnectionGUID: meliMi6tSo+d8ps1oymvdg==
X-CSE-MsgGUID: gAeq7Z/ISWm+k/VVZZCiTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63671602"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63671602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 12:42:43 -0700
X-CSE-ConnectionGUID: sdJCn96IQtGKmKNgmv5snA==
X-CSE-MsgGUID: GUXk2VFKTruVkcIGrW3cbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="221711928"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Oct 2025 12:42:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCNgM-000EpN-2w;
	Fri, 24 Oct 2025 19:42:38 +0000
Date: Sat, 25 Oct 2025 03:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 632/675]
 fs/bcachefs/data/write.c:1681:17: error: implicit declaration of function
 '__WARN'; did you mean '__warn'?
Message-ID: <202510250304.9D3wi8Cg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   7de4e3e4d957a28f5457ab940b2f44afd84cc470
commit: 1ac51de3b5327ce2d597e30a39ff7e6809349a93 [632/675] bcachefs: Warn on misaligned write
config: x86_64-buildonly-randconfig-003-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250304.9D3wi8Cg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250304.9D3wi8Cg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250304.9D3wi8Cg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/data/write.c: In function 'bch2_write':
>> fs/bcachefs/data/write.c:1681:17: error: implicit declaration of function '__WARN'; did you mean '__warn'? [-Wimplicit-function-declaration]
    1681 |                 __WARN();
         |                 ^~~~~~
         |                 __warn


vim +1681 fs/bcachefs/data/write.c

  1638	
  1639	/**
  1640	 * bch2_write() - handle a write to a cache device or flash only volume
  1641	 * @cl:		&bch_write_op->cl
  1642	 *
  1643	 * This is the starting point for any data to end up in a cache device; it could
  1644	 * be from a normal write, or a writeback write, or a write to a flash only
  1645	 * volume - it's also used by the moving garbage collector to compact data in
  1646	 * mostly empty buckets.
  1647	 *
  1648	 * It first writes the data to the cache, creating a list of keys to be inserted
  1649	 * (if the data won't fit in a single open bucket, there will be multiple keys);
  1650	 * after the data is written it calls bch_journal, and after the keys have been
  1651	 * added to the next journal write they're inserted into the btree.
  1652	 *
  1653	 * If op->discard is true, instead of inserting the data it invalidates the
  1654	 * region of the cache represented by op->bio and op->inode.
  1655	 */
  1656	CLOSURE_CALLBACK(bch2_write)
  1657	{
  1658		closure_type(op, struct bch_write_op, cl);
  1659		struct bio *bio = &op->wbio.bio;
  1660		struct bch_fs *c = op->c;
  1661		unsigned data_len;
  1662	
  1663		EBUG_ON(op->cl.parent);
  1664		BUG_ON(!op->nr_replicas);
  1665		BUG_ON(!op->write_point.v);
  1666		BUG_ON(bkey_eq(op->pos, POS_MAX));
  1667	
  1668		async_object_list_add(c, write_op, op, &op->list_idx);
  1669	
  1670		if (op->flags & BCH_WRITE_only_specified_devs)
  1671			op->flags |= BCH_WRITE_alloc_nowait;
  1672	
  1673		op->nr_replicas_required = min_t(unsigned, op->nr_replicas_required, op->nr_replicas);
  1674		op->start_time = local_clock();
  1675		bch2_keylist_init(&op->insert_keys, op->inline_keys);
  1676		wbio_init(bio)->put_bio = false;
  1677	
  1678		if (unlikely(bio->bi_iter.bi_size & (c->opts.block_size - 1))) {
  1679			bch2_write_op_error(op, op->pos.offset, "misaligned write");
  1680			op->error = bch_err_throw(c, data_write_misaligned);
> 1681			__WARN();
  1682			goto err;
  1683		}
  1684	
  1685		if (c->opts.nochanges) {
  1686			op->error = bch_err_throw(c, erofs_no_writes);
  1687			goto err;
  1688		}
  1689	
  1690		if (!(op->flags & BCH_WRITE_move) &&
  1691		    !enumerated_ref_tryget(&c->writes, BCH_WRITE_REF_write)) {
  1692			op->error = bch_err_throw(c, erofs_no_writes);
  1693			goto err;
  1694		}
  1695	
  1696		if (!(op->flags & BCH_WRITE_move))
  1697			this_cpu_add(c->counters[BCH_COUNTER_io_write], bio_sectors(bio));
  1698		bch2_increment_clock(c, bio_sectors(bio), WRITE);
  1699	
  1700		data_len = min_t(u64, bio->bi_iter.bi_size,
  1701				 op->new_i_size - (op->pos.offset << 9));
  1702	
  1703		if (c->opts.inline_data &&
  1704		    data_len <= min(block_bytes(c) / 2, 1024U)) {
  1705			bch2_write_data_inline(op, data_len);
  1706			return;
  1707		}
  1708	
  1709		__bch2_write(op);
  1710		return;
  1711	err:
  1712		bch2_disk_reservation_put(c, &op->res);
  1713	
  1714		closure_debug_destroy(&op->cl);
  1715		async_object_list_del(c, write_op, op->list_idx);
  1716		if (op->end_io)
  1717			op->end_io(op);
  1718	}
  1719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
