Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC592EC0A2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 23:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804584; cv=none; b=FESL1rJBeDBlIEAL4Uij3SSnbVOE3IzaTXggQTMKBOopExAmthHZrVmglKZ3GBdo472bKTEqKYTRE1UHE+z7qQdllq9YyTlXknBlg0CvC7ansDnJEqFCfAxcQDz9+bg90AVfkPfx8jPQquvu4OQfCG2NJY6rucIQQ1qc8Pykomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804584; c=relaxed/simple;
	bh=rPs7F1KXHMpEarxG9ANxtb/1ZoixWIOb/sE5acNb7+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mP7NSyo32cTxrMhRogNHymYtRndlqq0fD4mz6v/NB9J7DfStwmDZ/CB9MDGKvQvqrldtvbRtNtdihBR6TCxJWGq9AA3ANMnwKWkrW1Nbspt82kQQep+ZtbgOnH0joTc/SVB/Ni/zP6XQtRejwGyRJygXDVKXXhShHAS8K26+b0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVxQuGJX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVxQuGJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764804581; x=1796340581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPs7F1KXHMpEarxG9ANxtb/1ZoixWIOb/sE5acNb7+o=;
  b=hVxQuGJX3JonUZD2iKO1z1MgOnNlmXQBzkqVUkwGmXqwdTXBWSAx/H3C
   QVT0267mp8JJIQndsXWl3DgQ+VH1u/QUeWhOLmRfcGcub5AVlty+pblfe
   hSRevrhfJ8NN96LBkOPHJH62PCOoe3f6W4XWxPeuNv3VEHcjDkQ101CoT
   ZY2Yq5iAze6F+bvOahpwHEJ8HKMwNcfD7Rf0Vdm3m2KSsPc9xpNtMRKH7
   xZFxeZ7LSfId2/Sn6VZ1uYEAmyOCQm0DNh9UYgvabU8m8zgxqFvpfFwrW
   iRCXKAMUL8e64kFsMV/GvUIpdUvX7+EfSBAcBj3incaMco5ceX4LIBXt4
   g==;
X-CSE-ConnectionGUID: khPUIQBYRN2jHNpLj9SZCA==
X-CSE-MsgGUID: NrT5JznOSuGJrFnXcb63yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77495900"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77495900"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:29:40 -0800
X-CSE-ConnectionGUID: Nel8gPZmQI+rAvOE3C2swg==
X-CSE-MsgGUID: ddbiyjNmRpWPVhLsOpDMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="195235690"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Dec 2025 15:29:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQwHx-00000000DHJ-0VUm;
	Wed, 03 Dec 2025 23:29:37 +0000
Date: Thu, 4 Dec 2025 07:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 630/1068]
 fs/bcachefs/data/write.c:1681:3: error: call to undeclared function
 '__WARN'; ISO C99 and later do not support implicit function declarations
Message-ID: <202512040701.EhvzEOmJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   92092a7729703f2285902b56aacaae199a3517eb
commit: 7a6389fc045a2f9b5e42a79da34e2b6a03ca0ba4 [630/1068] bcachefs: Warn on misaligned write
config: hexagon-randconfig-r123-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040701.EhvzEOmJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040701.EhvzEOmJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040701.EhvzEOmJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/data/write.c:1681:3: error: call to undeclared function '__WARN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1681 |                 __WARN();
         |                 ^
   1 error generated.


vim +/__WARN +1681 fs/bcachefs/data/write.c

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
