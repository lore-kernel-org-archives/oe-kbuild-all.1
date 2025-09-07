Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDD95223
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 01:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757208237; cv=none; b=BZY+g2mw9v7w8wC7EXaLm7bhZVEPS8eNsiB0noGk2M0MlwrZUstkO3UicdqhhMkig0lG4M7OFH1K9ii3ZxI3P7g+TjNZBqrUklseLWqQswxOMKdRrBOVIDAZlHYFlHp/m3UL6WRZKFOMgMcFFfiK3leteAMpzzlSzC5uRl9lEAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757208237; c=relaxed/simple;
	bh=jWoemDSb1yO++WkZTIaFkN4l3ULb8dN5DbBuBLOgaYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0ReH1fiaOrbMJNKKZ3VjSe3S1uPVAQblLXaefyinjCyf1y8BF4hURxbF0GdRHc6wPb01PDT20jCuVxJwju1h8cVb3kzRryVg/wa/AdUhgjelvU6fYDFH+A0v3LwZN+w1gshuxLH2iy4lnvFWQz+gSagYfq97NeLk4U0ILZke+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjX+MWrS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjX+MWrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757208236; x=1788744236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWoemDSb1yO++WkZTIaFkN4l3ULb8dN5DbBuBLOgaYE=;
  b=fjX+MWrS1ZXY5IZu/i3HiLrCAvjhE4ygCArP3w7wnHunRiT2onY+DfYb
   D3INHGxgk0R00FWfP9diTR1o3q3pz9HrZUj+z5kp2ZxJgVwyfAvHKmfKC
   IlSMpLrQqPjfXkE+mDJkoOee4NJBPUAw9CgKvwXdMlR9YGYh41ZkFI8WG
   awxrK6kUig/jgd0X7KfXpgQJ6qasK3NFv1H+V7Rl+Oa3vNFp6/aH9TSZD
   dVwiHM9SFb0bYdv/hcdN8J9eCvVVP/Mnqe1poYxUJSaq0eXVL0jj0CP10
   QS62E3NoMrt8FEzHRTkBieNt99ZrAKSOkEbrg0k+bduAcGq4V4duSiwQT
   A==;
X-CSE-ConnectionGUID: /GTqSScYTd6RHqSsKnmDlg==
X-CSE-MsgGUID: OoRTzF7lQ+2YPmPZQ3mQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="84943128"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="84943128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 18:23:55 -0700
X-CSE-ConnectionGUID: /7oFV1bfSvK5+2Rm1Wb2rQ==
X-CSE-MsgGUID: 9/atdobNQEGZ3GZ12IB5EQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2025 18:23:54 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv48G-0001ux-1Y;
	Sun, 07 Sep 2025 01:23:52 +0000
Date: Sun, 7 Sep 2025 09:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 366/366]
 fs/bcachefs/io_write.c:1576:10: warning: missing terminating ' character
Message-ID: <202509070936.kO9U7Vh2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   bcb962ee56e4a6c6d8a7372fbc0304f44de6f615
commit: d5531ee98e248bbda777f82e44dc6088adab96ec [366/366] bcachefs: __bch2_write() waits synchronously on allocator
config: arc-randconfig-002-20250907 (https://download.01.org/0day-ci/archive/20250907/202509070936.kO9U7Vh2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509070936.kO9U7Vh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070936.kO9U7Vh2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/io_write.c: In function '__bch2_write':
>> fs/bcachefs/io_write.c:1576:10: warning: missing terminating ' character
      XXX: it's currently possible for the allocator to return success
             ^


vim +1576 fs/bcachefs/io_write.c

  1514	
  1515	static void __bch2_write(struct bch_write_op *op)
  1516	{
  1517		struct bch_fs *c = op->c;
  1518		struct write_point *wp = NULL;
  1519		struct bio *bio = NULL;
  1520		unsigned nofs_flags;
  1521		int ret;
  1522	
  1523		struct closure alloc_cl;
  1524		closure_init_stack(&alloc_cl);
  1525	
  1526		nofs_flags = memalloc_nofs_save();
  1527	
  1528		if (unlikely(op->opts.nocow && c->opts.nocow_enabled)) {
  1529			bch2_nocow_write(op);
  1530			if (op->flags & BCH_WRITE_submitted)
  1531				goto out_nofs_restore;
  1532		}
  1533	again:
  1534		memset(&op->failed, 0, sizeof(op->failed));
  1535	
  1536		do {
  1537			struct bkey_i *key_to_write;
  1538			unsigned key_to_write_offset = op->insert_keys.top_p -
  1539				op->insert_keys.keys_p;
  1540	
  1541			/* +1 for possible cache device: */
  1542			if (op->open_buckets.nr + op->nr_replicas + 1 >
  1543			    ARRAY_SIZE(op->open_buckets.v))
  1544				break;
  1545	
  1546			if (bch2_keylist_realloc(&op->insert_keys,
  1547						op->inline_keys,
  1548						ARRAY_SIZE(op->inline_keys),
  1549						BKEY_EXTENT_U64s_MAX))
  1550				break;
  1551	
  1552			/*
  1553			 * The copygc thread is now global, which means it's no longer
  1554			 * freeing up space on specific disks, which means that
  1555			 * allocations for specific disks may hang arbitrarily long:
  1556			 */
  1557			ret = bch2_trans_do(c,
  1558				bch2_alloc_sectors_start_trans(trans,
  1559					op->target,
  1560					op->opts.erasure_code && !(op->flags & BCH_WRITE_cached),
  1561					op->write_point,
  1562					&op->devs_have,
  1563					op->nr_replicas,
  1564					op->nr_replicas_required,
  1565					op->watermark,
  1566					op->flags,
  1567					&alloc_cl, &wp));
  1568	
  1569	
  1570			if (bch2_err_matches(ret, BCH_ERR_operation_blocked)) {
  1571				bch2_wait_on_allocator(c, &alloc_cl);
  1572				continue;
  1573			}
  1574	
  1575	#if 0
> 1576			XXX: it's currently possible for the allocator to return success
  1577			with cl on a waitlist, this is a bug and should be resolved by
  1578			the allocator flow control rework
  1579	
  1580			BUG_ON(closure_nr_remaining(&alloc_cl) > 1);
  1581	#endif
  1582	
  1583			if (unlikely(ret))
  1584				goto err;
  1585	
  1586			EBUG_ON(!wp);
  1587	
  1588			bch2_open_bucket_get(c, wp, &op->open_buckets);
  1589			ret = bch2_write_extent(op, wp, &bio);
  1590	
  1591			bch2_alloc_sectors_done_inlined(c, wp);
  1592	err:
  1593			if (ret <= 0) {
  1594				op->flags |= BCH_WRITE_submitted;
  1595	
  1596				if (unlikely(ret < 0)) {
  1597					if (!(op->flags & BCH_WRITE_alloc_nowait))
  1598						bch2_write_op_error(op, op->pos.offset,
  1599								    "%s(): %s", __func__, bch2_err_str(ret));
  1600					op->error = ret;
  1601					break;
  1602				}
  1603			}
  1604	
  1605			bio->bi_end_io	= bch2_write_endio;
  1606			bio->bi_private	= &op->cl;
  1607			bio->bi_opf |= REQ_OP_WRITE;
  1608	
  1609			closure_get(bio->bi_private);
  1610	
  1611			key_to_write = (void *) (op->insert_keys.keys_p +
  1612						 key_to_write_offset);
  1613	
  1614			bch2_submit_wbio_replicas(to_wbio(bio), c, BCH_DATA_user,
  1615						  key_to_write, false);
  1616		} while (ret);
  1617	
  1618		/*
  1619		 * Sync or no?
  1620		 *
  1621		 * If we're running asynchronously, wne may still want to block
  1622		 * synchronously here if we weren't able to submit all of the IO at
  1623		 * once, as that signals backpressure to the caller.
  1624		 */
  1625		if ((op->flags & BCH_WRITE_sync) ||
  1626		    (!(op->flags & BCH_WRITE_submitted) &&
  1627		     !(op->flags & BCH_WRITE_in_worker))) {
  1628			bch2_wait_on_allocator(c, &op->cl);
  1629	
  1630			__bch2_write_index(op);
  1631	
  1632			if (!(op->flags & BCH_WRITE_submitted))
  1633				goto again;
  1634			bch2_write_done(&op->cl);
  1635		} else {
  1636			bch2_write_queue(op, wp);
  1637			continue_at(&op->cl, bch2_write_index, NULL);
  1638		}
  1639	out_nofs_restore:
  1640		memalloc_nofs_restore(nofs_flags);
  1641	}
  1642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
