Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F089D2DB7A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775889736; cv=none; b=ioJYOui6fECDiEqMFCHk+9wI6ta/at4E1LOJ9Qmq4AeRLEscGng+7I7YSMyM5ZPzoLcZcstaCK3t45cv/7HDJYShv2rtoIl/jpr9xgzRBjDXuo+kdgQ13AWJC5BfU/4aTQYfVLX50gF1X8c08+HqbErXvXmiEzqo3XOSXUCV7x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775889736; c=relaxed/simple;
	bh=ZrBU55wIZNL4O2cc4dMlryENmHdKdCFSxf19wsdmX0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PcNp1e8mVcfHIchMMK9wbVc1et+mknypiwrRpFr8ZgVlnfdxnFXyCL71W3VHbiID/Dhs4Sm9/aj4bSUN4iLeZ4GnFFY6u8Gj6RhxAlbDIYn3RNLXjHEIi80KfcbftNMSLRr5qvoepqsj/VIedmLhHj9hw7uKEpyLw7zn/mC1LXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTr/+EYS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTr/+EYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775889733; x=1807425733;
  h=date:from:to:cc:subject:message-id;
  bh=ZrBU55wIZNL4O2cc4dMlryENmHdKdCFSxf19wsdmX0M=;
  b=hTr/+EYSvRvYsUeAgoqKrOv0MRURVFyeG/cv3L1/2Beo+Pb6ELK2SXv3
   KZqB+s/M6kc63SLSiiiNnvs0jvlUfBX6W5+oiHW9NjIEgqRXCyTu9WiQz
   2NPwOjTv06p3LX6n4aHsjohKBYLw8rOKY8wVlMNl02qJ9kLplFucoY6wQ
   Cw0CwRdDNhCE8Cdzok3ygcyeb7P6uDwBl7SLKiZmJ2PNjNmljC3EDhZkK
   JluPAUL1bfw9tmgGsrXPaNxrw8OYY/23dt9rZZBZM4DONXdxOaZ6SkzLF
   kSkHOHKhSZ/OOcaU2wUZCXAYzQExrxSBhqV8kxkNN8jiN6NowUiiXmTQD
   g==;
X-CSE-ConnectionGUID: 2FsrIThUTieu7dqL3g7/jg==
X-CSE-MsgGUID: HPoQxeuwRDehEdhNDp6pzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87533293"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="87533293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 23:42:12 -0700
X-CSE-ConnectionGUID: omFb5B03RZGZlSDQHvAArg==
X-CSE-MsgGUID: SO94jVHISSaaH2TjC1x6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228262731"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Apr 2026 23:42:11 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBS2i-000000000vZ-1LNc;
	Sat, 11 Apr 2026 06:42:08 +0000
Date: Sat, 11 Apr 2026 14:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 650/799]
 fs/bcachefs/data/read.c:1525:1: warning: the frame size of 1328 bytes is
 larger than 1280 bytes
Message-ID: <202604111421.G7R7nzYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: bd81e2e05e7fc17b3d463c5d9a33d98ddab39617 [650/799] bcachefs: kill bch2_bkey_get_iter()
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604111421.G7R7nzYt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111421.G7R7nzYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111421.G7R7nzYt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/read.c: In function '__bch2_read':
>> fs/bcachefs/data/read.c:1525:1: warning: the frame size of 1328 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1525 | }
         | ^


vim +1525 fs/bcachefs/data/read.c

1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1414  
35de2abc222746 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1415  int __bch2_read(struct btree_trans *trans, struct bch_read_bio *rbio,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1416  		struct bvec_iter bvec_iter, subvol_inum inum,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1417  		struct bch_io_failures *failed,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1418  		struct bkey_buf *prev_read,
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1419  		unsigned flags)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1420  {
35de2abc222746 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1421  	struct bch_fs *c = trans->c;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1422  	struct bkey_s_c k;
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1423  	enum btree_id data_btree;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1424  	int ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1425  
3fb8bacb14b6fb fs/bcachefs/io_read.c   Kent Overstreet 2025-03-12  1426  	EBUG_ON(rbio->data_update);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1427  
37e899798a1e91 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1428  	struct bkey_buf sk __cleanup(bch2_bkey_buf_exit);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1429  	bch2_bkey_buf_init(&sk);
37e899798a1e91 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1430  
9c734c4857e939 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1431  	CLASS(btree_iter, iter)(trans, BTREE_ID_extents,
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1432  				POS(inum.inum, bvec_iter.bi_sector),
5dd8c60e1e0448 fs/bcachefs/io_read.c   Kent Overstreet 2024-04-07  1433  				BTREE_ITER_slots);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1434  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1435  	while (1) {
760be1ad5e71b3 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1436  		data_btree = BTREE_ID_extents;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1437  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1438  		bch2_trans_begin(trans);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1439  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1440  		u32 snapshot;
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1441  		ret = bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1442  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1443  			goto err;
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1444  
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1445  		bch2_btree_iter_set_snapshot(&iter, snapshot);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1446  
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1447  		bch2_btree_iter_set_pos(&iter,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1448  				POS(inum.inum, bvec_iter.bi_sector));
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1449  
7c84dc243819ab fs/bcachefs/io_read.c   Kent Overstreet 2025-07-30  1450  		k = bch2_btree_iter_peek_slot(&iter);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1451  		ret = bkey_err(k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1452  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1453  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1454  
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1455  		s64 offset_into_extent = iter.pos.offset -
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1456  			bkey_start_offset(k.k);
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1457  		unsigned sectors = k.k->size - offset_into_extent;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1458  
ac63dcd59be8a3 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1459  		bch2_bkey_buf_reassemble(&sk, k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1460  
6bd68ec266ad71 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-12  1461  		ret = bch2_read_indirect_extent(trans, &data_btree,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1462  					&offset_into_extent, &sk);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1463  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1464  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1465  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1466  		k = bkey_i_to_s_c(sk.k);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1467  
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1468  		if (unlikely(flags & BCH_READ_in_retry)) {
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1469  			if (!bkey_and_val_eq(k, bkey_i_to_s_c(prev_read->k)))
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1470  				failed->nr = 0;
ac63dcd59be8a3 fs/bcachefs/data/read.c Kent Overstreet 2025-10-08  1471  			bch2_bkey_buf_copy(prev_read, sk.k);
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1472  		}
6659ba3b18f712 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-10  1473  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1474  		/*
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1475  		 * With indirect extents, the amount of data to read is the min
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1476  		 * of the original extent and the indirect extent:
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1477  		 */
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1478  		sectors = min_t(unsigned, sectors, k.k->size - offset_into_extent);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1479  
7579c85d9cc3b2 fs/bcachefs/io_read.c   Kent Overstreet 2024-10-20  1480  		unsigned bytes = min(sectors, bvec_iter_sectors(bvec_iter)) << 9;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1481  		swap(bvec_iter.bi_size, bytes);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1482  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1483  		if (bvec_iter.bi_size == bytes)
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1484  			flags |= BCH_READ_last_fragment;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1485  
6bd68ec266ad71 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-12  1486  		ret = __bch2_read_extent(trans, rbio, bvec_iter, iter.pos,
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1487  					 data_btree, k,
ca24130ee412d9 fs/bcachefs/io_read.c   Kent Overstreet 2024-12-28  1488  					 offset_into_extent, failed, flags, -1);
3ba0240a8789f8 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-24  1489  		swap(bvec_iter.bi_size, bytes);
3ba0240a8789f8 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-24  1490  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1491  		if (ret)
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1492  			goto err;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1493  
9157b3ddfb151d fs/bcachefs/io_read.c   Kent Overstreet 2025-01-17  1494  		if (flags & BCH_READ_last_fragment)
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1495  			break;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1496  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1497  		bio_advance_iter(&rbio->bio, &bvec_iter, bytes);
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1498  err:
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1499  		if (ret == -BCH_ERR_data_read_retry_csum_err_maybe_userspace)
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1500  			flags |= BCH_READ_must_bounce;
e75993b0bf8baa fs/bcachefs/io_read.c   Kent Overstreet 2025-03-11  1501  
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1502  		if (ret &&
1d18b5cabc89f9 fs/bcachefs/io_read.c   Kent Overstreet 2024-07-14  1503  		    !bch2_err_matches(ret, BCH_ERR_transaction_restart) &&
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1504  		    !bch2_err_matches(ret, BCH_ERR_data_read_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1505  			break;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1506  	}
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1507  
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1508  	if (unlikely(ret)) {
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1509  		if (!(flags & BCH_READ_in_retry) &&
54f229a0df604d fs/bcachefs/data/read.c Kent Overstreet 2025-10-16  1510  		    ret != -BCH_ERR_extent_poisoned) {
ec1f2d2073b058 fs/bcachefs/io_read.c   Kent Overstreet 2025-07-14  1511  			CLASS(printbuf, buf)();
943e1dc4daf3d7 fs/bcachefs/data/read.c Kent Overstreet 2025-10-13  1512  			bch2_read_err_msg_trans(trans, &buf, rbio, POS(inum.inum, bvec_iter.bi_sector));
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1513  			prt_printf(&buf, "data read error: %s", bch2_err_str(ret));
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1514  			bch_err_ratelimited(c, "%s", buf.buf);
a06459657e4ecc fs/bcachefs/io_read.c   Kent Overstreet 2025-04-15  1515  		}
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1516  
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1517  		rbio->bio.bi_status	= BLK_STS_IOERR;
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1518  		rbio->ret		= ret;
943f0cfb1559ac fs/bcachefs/io_read.c   Kent Overstreet 2025-03-07  1519  
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1520  		if (!(flags & BCH_READ_in_retry))
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1521  			bch2_rbio_done(rbio);
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1522  	}
f7727a6767277a fs/bcachefs/io_read.c   Kent Overstreet 2024-09-28  1523  
de73677ff8e677 fs/bcachefs/io_read.c   Kent Overstreet 2025-03-08  1524  	return ret;
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10 @1525  }
1809b8cba756d3 fs/bcachefs/io_read.c   Kent Overstreet 2023-09-10  1526  

:::::: The code at line 1525 was first introduced by commit
:::::: 1809b8cba756d32bd6e976ed4ee64efdf66c6d94 bcachefs: Break up io.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
