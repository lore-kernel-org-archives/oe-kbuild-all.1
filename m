Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32120B80A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 11:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733398957; cv=none; b=ERLkrmmCpREDddRrr2tSdCtNzrzlK1eadXA/bFFvpwy6Brggo1e/BdjbQmKfiWXeyvjem3naG7Yvv238BjSkN49p7tf8tK1bDeZ8nf0yeGKPCFGzZyE4cede6+f0Tb7CS7bqyBXcUUNL3odQZsuoVYIw3kIaxVQqsMGgRc6Bjfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733398957; c=relaxed/simple;
	bh=1J3E6HczhGXjecHt46NWH0h2hPPXBLtmgPjwVTbhOOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZW3BhEuXtfabTKs3fY7COwjvOT2/l9rYgVShMt/2necwSGtvJ4XorSl4UfcsdkzmOVOhWPh8srHVK3jKOCAL2365SPmKZ2f7YXlmi4QO7MeiS6VybPXpgHcK4fXPWu0a2XfDJ7bq6BLScWp7hCmhTmhUGFHso52VNvKwJ0QQR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kk1ax3Iu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk1ax3Iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733398956; x=1764934956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1J3E6HczhGXjecHt46NWH0h2hPPXBLtmgPjwVTbhOOk=;
  b=Kk1ax3IuWkL5/Exhrg/LaaALARfmE9GbAE1hIDYQBmhUvGZnmxcGCx/N
   n/8vjFiyylaPwRtTrQagUGaxfozwBMSF2/RBY4xvqdcMHFKj2SOGrNQzW
   9UDL0VAmwWA1AYflOfIpIK0UoaFJgEX6OA1yF3GUcMvgNyY+Qm4khdYx8
   qWmYqagBTvWtxaYaR1JvbMsjBy09l8Lhr97u/p+PzZK58bSxtQITmSVhK
   ExqWfpV68PFo7/LkVoz8jClXOWRNoIXKsTnXRomN1ZQ8aeO7kwPzuUYlB
   rliOHujguRUO+YeU187vGlKR6IvzhQL6ETtkPnmgvZ47FkN/Pc5FU48AZ
   w==;
X-CSE-ConnectionGUID: DaO6UB2IS0ONCJ/7AGlWew==
X-CSE-MsgGUID: 22iI9/M5RkaQVr+hZ0wZSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33624780"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33624780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 03:42:32 -0800
X-CSE-ConnectionGUID: 3Or0vSmPRaScG8sdAO1mtw==
X-CSE-MsgGUID: 3vitBbYfTs+JqLLvD4rTTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93759597"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2024 03:42:31 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJAFY-000489-28;
	Thu, 05 Dec 2024 11:42:28 +0000
Date: Thu, 5 Dec 2024 19:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 185/187]
 fs/bcachefs/journal_io.c:1447:55: sparse: sparse: cast to restricted __le64
Message-ID: <202412051929.2rdR5ENN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c245b4245468d2e9c7092bcca7a8a4da66c9d034
commit: ed76395059b49ba846b70861b3fac6ded3b8596d [185/187] bcachefs: Journal write path refactoring, debug improvements
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20241205/202412051929.2rdR5ENN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051929.2rdR5ENN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051929.2rdR5ENN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal_io.c: note: in included file:
   fs/bcachefs/bcachefs.h:998:9: sparse: sparse: array of flexible structures
   fs/bcachefs/journal_io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1277:38: sparse: sparse: array of flexible structures
>> fs/bcachefs/journal_io.c:1447:55: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/journal_io.c:1542:86: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long long [usertype] seq @@     got restricted __le64 [usertype] seq @@
   fs/bcachefs/journal_io.c:1542:86: sparse:     expected unsigned long long [usertype] seq
   fs/bcachefs/journal_io.c:1542:86: sparse:     got restricted __le64 [usertype] seq
   fs/bcachefs/journal_io.c:2101:9: sparse: sparse: context imbalance in 'bch2_journal_write' - different lock contexts for basic block

vim +1447 fs/bcachefs/journal_io.c

  1422	
  1423	static void journal_advance_devs_to_next_bucket(struct journal *j,
  1424							struct dev_alloc_list *devs,
  1425							unsigned sectors, u64 seq)
  1426	{
  1427		struct bch_fs *c = container_of(j, struct bch_fs, journal);
  1428	
  1429		darray_for_each(*devs, i) {
  1430			struct bch_dev *ca = rcu_dereference(c->devs[*i]);
  1431			if (!ca)
  1432				continue;
  1433	
  1434			struct journal_device *ja = &ca->journal;
  1435	
  1436			if (sectors > ja->sectors_free &&
  1437			    sectors <= ca->mi.bucket_size &&
  1438			    bch2_journal_dev_buckets_available(j, ja,
  1439						journal_space_discarded)) {
  1440				ja->cur_idx = (ja->cur_idx + 1) % ja->nr;
  1441				ja->sectors_free = ca->mi.bucket_size;
  1442	
  1443				/*
  1444				 * ja->bucket_seq[ja->cur_idx] must always have
  1445				 * something sensible:
  1446				 */
> 1447				ja->bucket_seq[ja->cur_idx] = le64_to_cpu(seq);
  1448			}
  1449		}
  1450	}
  1451	
  1452	static void __journal_write_alloc(struct journal *j,
  1453					  struct journal_buf *w,
  1454					  struct dev_alloc_list *devs,
  1455					  unsigned sectors,
  1456					  unsigned *replicas,
  1457					  unsigned replicas_want)
  1458	{
  1459		struct bch_fs *c = container_of(j, struct bch_fs, journal);
  1460	
  1461		darray_for_each(*devs, i) {
  1462			struct bch_dev *ca = rcu_dereference(c->devs[*i]);
  1463			if (!ca)
  1464				continue;
  1465	
  1466			struct journal_device *ja = &ca->journal;
  1467	
  1468			/*
  1469			 * Check that we can use this device, and aren't already using
  1470			 * it:
  1471			 */
  1472			if (!ca->mi.durability ||
  1473			    ca->mi.state != BCH_MEMBER_STATE_rw ||
  1474			    !ja->nr ||
  1475			    bch2_bkey_has_device_c(bkey_i_to_s_c(&w->key), ca->dev_idx) ||
  1476			    sectors > ja->sectors_free)
  1477				continue;
  1478	
  1479			bch2_dev_stripe_increment(ca, &j->wp.stripe);
  1480	
  1481			bch2_bkey_append_ptr(&w->key,
  1482				(struct bch_extent_ptr) {
  1483					  .offset = bucket_to_sector(ca,
  1484						ja->buckets[ja->cur_idx]) +
  1485						ca->mi.bucket_size -
  1486						ja->sectors_free,
  1487					  .dev = ca->dev_idx,
  1488			});
  1489	
  1490			ja->sectors_free -= sectors;
  1491			ja->bucket_seq[ja->cur_idx] = le64_to_cpu(w->data->seq);
  1492	
  1493			*replicas += ca->mi.durability;
  1494	
  1495			if (*replicas >= replicas_want)
  1496				break;
  1497		}
  1498	}
  1499	
  1500	/**
  1501	 * journal_write_alloc - decide where to write next journal entry
  1502	 *
  1503	 * @j:		journal object
  1504	 * @w:		journal buf (entry to be written)
  1505	 *
  1506	 * Returns: 0 on success, or -EROFS on failure
  1507	 */
  1508	static int journal_write_alloc(struct journal *j, struct journal_buf *w)
  1509	{
  1510		struct bch_fs *c = container_of(j, struct bch_fs, journal);
  1511		struct bch_devs_mask devs;
  1512		struct dev_alloc_list devs_sorted;
  1513		unsigned sectors = vstruct_sectors(w->data, c->block_bits);
  1514		unsigned target = c->opts.metadata_target ?:
  1515			c->opts.foreground_target;
  1516		unsigned replicas = 0, replicas_want =
  1517			READ_ONCE(c->opts.metadata_replicas);
  1518		unsigned replicas_need = min_t(unsigned, replicas_want,
  1519					       READ_ONCE(c->opts.metadata_replicas_required));
  1520		bool advance_done = false;
  1521	
  1522		rcu_read_lock();
  1523	
  1524		/* We might run more than once if we have to stop and do discards: */
  1525		struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(bkey_i_to_s_c(&w->key));
  1526		bkey_for_each_ptr(ptrs, p) {
  1527			struct bch_dev *ca = bch2_dev_rcu_noerror(c, p->dev);
  1528			if (ca)
  1529				replicas += ca->mi.durability;
  1530		}
  1531	
  1532	retry_target:
  1533		devs = target_rw_devs(c, BCH_DATA_journal, target);
  1534		devs_sorted = bch2_dev_alloc_list(c, &j->wp.stripe, &devs);
  1535	retry_alloc:
  1536		__journal_write_alloc(j, w, &devs_sorted, sectors, &replicas, replicas_want);
  1537	
  1538		if (likely(replicas >= replicas_want))
  1539			goto done;
  1540	
  1541		if (!advance_done) {
> 1542			journal_advance_devs_to_next_bucket(j, &devs_sorted, sectors, w->data->seq);
  1543			advance_done = true;
  1544			goto retry_alloc;
  1545		}
  1546	
  1547		if (replicas < replicas_want && target) {
  1548			/* Retry from all devices: */
  1549			target = 0;
  1550			advance_done = false;
  1551			goto retry_target;
  1552		}
  1553	done:
  1554		rcu_read_unlock();
  1555	
  1556		BUG_ON(bkey_val_u64s(&w->key.k) > BCH_REPLICAS_MAX);
  1557	
  1558		return replicas >= replicas_need ? 0 : -BCH_ERR_insufficient_journal_devices;
  1559	}
  1560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
