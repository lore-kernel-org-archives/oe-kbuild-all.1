Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5765F20E005
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766453560; cv=none; b=eydrCSs29JNSGX5XcqCQuOVXmWyjo3GOuOizQrOAklG+8B57zjwuz7ZJ1JPW+k9mlx0xn1uHsW/ySsztooCRyeIKo99Dc7SF7q0mq56PjiXFI3vxv/2FRJn4f4QIEDhKweEfoQqB2+EcNimTqPB6MEiU1a2mBzTpZl+tYALWDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766453560; c=relaxed/simple;
	bh=ZNIBSKkG8sG8Mx6LBWCaMKYEX8WTuit7eMeId5+/gDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QF23l1n2vVR/kxB8/TUrGrjf9Q+VR/DACyXYwTLz0x3H6MWD7xihsyo5AHRrnCnmeGpxyqSDHMTgSUPojBP7JQGKkods8CowSODzPn6SUfBZVCLyth70XWyoeE8lMSeOUVAfj0qLqjy0nE90E4LbYO8Fl578sOHxiDJTiQr7qro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEDoa5qd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEDoa5qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766453557; x=1797989557;
  h=date:from:to:cc:subject:message-id;
  bh=ZNIBSKkG8sG8Mx6LBWCaMKYEX8WTuit7eMeId5+/gDM=;
  b=JEDoa5qdhO8Zwfb5sWSD3IGTDu8BAuDvRUxWsdlKWuZCjrB2Ou/r6WMJ
   nd+XEdyIpz4a/mhWeH8qLr2lXXYP2lZyKHO0wX4arsutS3dQBJK8frL2A
   LR3nIamLM1cHXqclAKEjdmDi7EaA6MLOLA4+gQ0qNsQKYC1k5qWBygwy8
   4rt4v7Dbhwis03f/j3N/fKy86ENb5Ozsidmh99MDCA1Zt1Dt3eCdyPXD1
   yO0nvFZMoaUweK7mU3FqsTo/sXIZpc3NNIlw0ciC+sFm1fEbu7W6vFJI/
   VP7LDl/VSKSHsjaiRCfCE2oWveQG0XvqF8f0UqlnLpJjVhlqoTTW8jxg7
   g==;
X-CSE-ConnectionGUID: 6q4q0AzHRLCRywCv/7Bm2A==
X-CSE-MsgGUID: pRiFbtI4TPCMNWp667ATNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68348495"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68348495"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:32:36 -0800
X-CSE-ConnectionGUID: zaQ++TjvRJmRTJCJLPNzQQ==
X-CSE-MsgGUID: Z8Wxm22xT3aUvhYxtAp2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198905108"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 17:30:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXrEe-000000001IR-0Dm7;
	Tue, 23 Dec 2025 01:30:48 +0000
Date: Tue, 23 Dec 2025 09:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 560/799]
 fs/bcachefs/data/read.c:1504:1: warning: the frame size of 1296 bytes is
 larger than 1280 bytes
Message-ID: <202512230946.BbHS9G6j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 943e1dc4daf3d763b338fb99f7217256076b6768 [560/799] bcachefs: Improve read error messages
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512230946.BbHS9G6j-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230946.BbHS9G6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230946.BbHS9G6j-lkp@intel.com/

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
37e899798a1e91 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1408  	struct bkey_buf sk __cleanup(bch2_bkey_buf_exit);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1409  	bch2_bkey_buf_init(&sk);
37e899798a1e91 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1410  
9c734c4857e939 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1411  	CLASS(btree_iter, iter)(trans, BTREE_ID_extents,
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
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1425  		bch2_btree_iter_set_snapshot(&iter, snapshot);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1426  
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1427  		bch2_btree_iter_set_pos(&iter,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1428  				POS(inum.inum, bvec_iter.bi_sector));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1429  
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1430  		k = bch2_btree_iter_peek_slot(&iter);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1431  		ret = bkey_err(k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1432  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1433  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1434  
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1435  		s64 offset_into_extent = iter.pos.offset -
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1436  			bkey_start_offset(k.k);
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1437  		unsigned sectors = k.k->size - offset_into_extent;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1438  
ac63dcd59be8a3 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1439  		bch2_bkey_buf_reassemble(&sk, k);
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
ac63dcd59be8a3 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1451  			bch2_bkey_buf_copy(prev_read, sk.k);
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
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1490  			CLASS(printbuf, buf)();
943e1dc4daf3d7 fs/bcachefs/data/read.c Kent Overstreet 2025-10-13  1491  			bch2_read_err_msg_trans(trans, &buf, rbio, POS(inum.inum, bvec_iter.bi_sector));
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
