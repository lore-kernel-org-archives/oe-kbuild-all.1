Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E119E7D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470315; cv=none; b=IkIkGZ4/cK9Z+JWyVqo2NkJMeHxqS7by5d/Ja2TOckTwvst3CXmuYGchyukSb6V9JdnZR8wMq58BR4yZUahnvpBPLxsTrISVvT/KrbRxNO/2RX8gmwkKXjQDcG6sMUdAouHih5zdFgIsrKKI+eALfbfkEOq4JL5/2iknGPE+nrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470315; c=relaxed/simple;
	bh=OgUnvoCeMldm5e3W0LCjwc+jaVK2aqiKKEMX3l+OfmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqxH6biLujJzrh9cqJrRnIrZ/QXepjeo9/sEwR9JlP7XPKzIwff2B0gsCR5YDdlVpLOXMNVpA9PA1fZF2/7y8fQQqOacmUFPoKJuCH8nGYspg++g9BHvn3a5xoHrCejCTz8Gvy9YgFI4kIBKtXbbov0WI7vjOCibMq2LImaO1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEgZ6n16; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEgZ6n16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760470313; x=1792006313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgUnvoCeMldm5e3W0LCjwc+jaVK2aqiKKEMX3l+OfmI=;
  b=NEgZ6n16nh4FiuypQX7O56uC77RyKAQ+AB88bsU3rgl8/WquMhd7tSbk
   70RiX9M+o//mgFCGwZLPSjUQRO2A7/RlAlDFXbdB+XvYbrXO+NQuv/kwi
   y7qDcemZbkbTURLGBZNI8hYqGZNUb2qz20iPm4z/I6cQoeZ92dJb9FHsc
   9T063xQaAvLokXObPF4LRvyWV5di3ZgVc0tSllwqjJw/rOJbwsq8DS3gp
   Ps3QfBuxZ1ncyV2G0RFCZr2tcL1YM1KlELN6i3/LyuuI/CRM0TyoSbWsG
   8umq2DlpWFDAAbKLa2qk2XbOU7D9U0upn+nwpq/gq/XoKD1WWkfmGd8ON
   w==;
X-CSE-ConnectionGUID: nnawwM0vQCOmN7g2o1CIyQ==
X-CSE-MsgGUID: TEEeUuxSR8WgOmim0hhXQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62673238"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62673238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:31:52 -0700
X-CSE-ConnectionGUID: iQTlxKl0Qcy7Qa5tAJaOWg==
X-CSE-MsgGUID: feuah0kZSyOrLGeobrcbEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="212585781"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2025 12:31:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8kkO-00037Z-2r;
	Tue, 14 Oct 2025 19:31:48 +0000
Date: Wed, 15 Oct 2025 03:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 561/576]
 fs/bcachefs/data/read.c:1504:1: warning: the frame size of 1296 bytes is
 larger than 1280 bytes
Message-ID: <202510150345.6cylsp92-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   2430312cc25d4fa50da60c11179bc5d13acd3ca0
commit: 6e9e4d71796392908ead325e551438ea7ec33984 [561/576] bcachefs: Improve read error messages
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251015/202510150345.6cylsp92-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150345.6cylsp92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150345.6cylsp92-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/read.c: In function '__bch2_read':
>> fs/bcachefs/data/read.c:1504:1: warning: the frame size of 1296 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1504 | }
         | ^


vim +1504 fs/bcachefs/data/read.c

1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1394  
35de2abc222746 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1395  int __bch2_read(struct btree_trans *trans, struct bch_read_bio *rbio,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1396  		struct bvec_iter bvec_iter, subvol_inum inum,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1397  		struct bch_io_failures *failed,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1398  		struct bkey_buf *prev_read,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1399  		unsigned flags)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1400  {
35de2abc222746 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1401  	struct bch_fs *c = trans->c;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1402  	struct bkey_s_c k;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1403  	enum btree_id data_btree;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1404  	int ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1405  
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1406  	EBUG_ON(rbio->data_update);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1407  
16be4726af8a1c fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1408  	struct bkey_buf sk __cleanup(bch2_bkey_buf_exit);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1409  	bch2_bkey_buf_init(&sk);
16be4726af8a1c fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1410  
a7731e79bac561 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1411  	CLASS(btree_iter, iter)(trans, BTREE_ID_extents,
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1412  				POS(inum.inum, bvec_iter.bi_sector),
5dd8c60e1e0448 fs/bcachefs/io_read.c   Kent Overstreet 2024-04-07  1413  				BTREE_ITER_slots);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1414  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1415  	while (1) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1416  		data_btree = BTREE_ID_extents;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1417  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1418  		bch2_trans_begin(trans);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1419  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1420  		u32 snapshot;
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1421  		ret = bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1422  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1423  			goto err;
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1424  
f68e453b6c94c5 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1425  		bch2_btree_iter_set_snapshot(&iter, snapshot);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1426  
f68e453b6c94c5 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1427  		bch2_btree_iter_set_pos(&iter,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1428  				POS(inum.inum, bvec_iter.bi_sector));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1429  
f68e453b6c94c5 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1430  		k = bch2_btree_iter_peek_slot(&iter);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1431  		ret = bkey_err(k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1432  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1433  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1434  
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1435  		s64 offset_into_extent = iter.pos.offset -
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1436  			bkey_start_offset(k.k);
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1437  		unsigned sectors = k.k->size - offset_into_extent;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1438  
8dfdc3e8bd6031 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1439  		bch2_bkey_buf_reassemble(&sk, k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1440  
6bd68ec266ad71 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-12  1441  		ret = bch2_read_indirect_extent(trans, &data_btree,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1442  					&offset_into_extent, &sk);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1443  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1444  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1445  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1446  		k = bkey_i_to_s_c(sk.k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1447  
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1448  		if (unlikely(flags & BCH_READ_in_retry)) {
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1449  			if (!bkey_and_val_eq(k, bkey_i_to_s_c(prev_read->k)))
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1450  				failed->nr = 0;
8dfdc3e8bd6031 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1451  			bch2_bkey_buf_copy(prev_read, sk.k);
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1452  		}
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1453  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1454  		/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1455  		 * With indirect extents, the amount of data to read is the min
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1456  		 * of the original extent and the indirect extent:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1457  		 */
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1458  		sectors = min_t(unsigned, sectors, k.k->size - offset_into_extent);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1459  
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1460  		unsigned bytes = min(sectors, bvec_iter_sectors(bvec_iter)) << 9;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1461  		swap(bvec_iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1462  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1463  		if (bvec_iter.bi_size == bytes)
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1464  			flags |= BCH_READ_last_fragment;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1465  
6bd68ec266ad71 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-12  1466  		ret = __bch2_read_extent(trans, rbio, bvec_iter, iter.pos,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1467  					 data_btree, k,
ca24130ee412d9 fs/bcachefs/io_read.c   Kent Overstreet 2024-12-28  1468  					 offset_into_extent, failed, flags, -1);
3ba0240a8789f8 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-24  1469  		swap(bvec_iter.bi_size, bytes);
3ba0240a8789f8 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-24  1470  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1471  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1472  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1473  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1474  		if (flags & BCH_READ_last_fragment)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1475  			break;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1476  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1477  		bio_advance_iter(&rbio->bio, &bvec_iter, bytes);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1478  err:
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1479  		if (ret == -BCH_ERR_data_read_retry_csum_err_maybe_userspace)
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1480  			flags |= BCH_READ_must_bounce;
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1481  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1482  		if (ret &&
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1483  		    !bch2_err_matches(ret, BCH_ERR_transaction_restart) &&
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1484  		    !bch2_err_matches(ret, BCH_ERR_data_read_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1485  			break;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1486  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1487  
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1488  	if (unlikely(ret)) {
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1489  		if (ret != -BCH_ERR_extent_poisoned) {
6005004fd4aa42 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1490  			CLASS(printbuf, buf)();
6e9e4d71796392 fs/bcachefs/data/read.c Kent Overstreet 2025-10-13  1491  			bch2_read_err_msg_trans(trans, &buf, rbio, POS(inum.inum, bvec_iter.bi_sector));
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1492  			prt_printf(&buf, "data read error: %s", bch2_err_str(ret));
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1493  			bch_err_ratelimited(c, "%s", buf.buf);
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1494  		}
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1495  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1496  		rbio->bio.bi_status	= BLK_STS_IOERR;
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1497  		rbio->ret		= ret;
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1498  
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1499  		if (!(flags & BCH_READ_in_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1500  			bch2_rbio_done(rbio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1501  	}
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1502  
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1503  	return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10 @1504  }
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1505  

:::::: The code at line 1504 was first introduced by commit
:::::: 1809b8cba756d32bd6e976ed4ee64efdf66c6d94 bcachefs: Break up io.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
