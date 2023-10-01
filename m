Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95F20E0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696200597; x=1727736597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7GDrXTlOCEiPtEJ/+N/469vk1xYTR27jXeNhjLn/qg=;
  b=dtVcia0MKw8BNo0h/6Tcdx+BBZPSwhvOoOfhRKQYePzfDV79iSxW7OfQ
   8MTz73xdYes7979uROAqSjQU7qSNUTfNBSqbB7W30WCJ3eGQQOwNx2Tni
   bI5hx5X0zztv6zQQ5blFe+mX6OBLI9DSSu/VeSneboNivrIvyKdj5wp21
   mCCelkLLYab8yMS80N0a1oZTQPCz5NKKouZj9E5CXqfBgXmhW5TyQR7Bx
   lTxBSCt/VlQAcElSpiZO9/6SUzGEyIN8Ui6OdxOZTKSsF0FBBaZIjQlvk
   xTEAeKujFYE/sV+x+adCPYLhPJgttyn5yanNq0wKwBau9WgJbhFxPda92
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="382467431"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="382467431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 15:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="785624033"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="785624033"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 01 Oct 2023 15:49:54 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn5G4-0005VE-0s;
	Sun, 01 Oct 2023 22:49:52 +0000
Date: Mon, 2 Oct 2023 06:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fwestphal-nf:nft_set_gc_query_08 9/9] fs/ubifs/tnc.c:1640:11:
 error: 'struct bu_info' has no member named 'gc_seq'
Message-ID: <202310020658.kKqNpKoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fwestphal/nf.git nft_set_gc_query_08
head:   a55eb7fa0cf0fd120ed2a36c12278b57f23e9c6c
commit: a55eb7fa0cf0fd120ed2a36c12278b57f23e9c6c [9/9] netfilter: nf_tables: remove gc sequence counter
config: powerpc-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231002/202310020658.kKqNpKoM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020658.kKqNpKoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020658.kKqNpKoM-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ubifs/tnc.c: In function 'ubifs_tnc_get_bu_keys':
>> fs/ubifs/tnc.c:1640:11: error: 'struct bu_info' has no member named 'gc_seq'
    1640 |         bu->gc_seq = c->gc_seq;
         |           ^~
   fs/ubifs/tnc.c: In function 'ubifs_tnc_bulk_read':
   fs/ubifs/tnc.c:1809:39: error: 'struct bu_info' has no member named 'gc_seq'
    1809 |         if (maybe_leb_gced(c, lnum, bu->gc_seq))
         |                                       ^~


vim +1640 fs/ubifs/tnc.c

1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1537  
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1538  /**
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1539   * ubifs_tnc_get_bu_keys - lookup keys for bulk-read.
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1540   * @c: UBIFS file-system description object
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1541   * @bu: bulk-read parameters and results
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1542   *
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1543   * Lookup consecutive data node keys for the same inode that reside
6c0c42cdfd73fb1 Artem Bityutskiy 2008-11-18  1544   * consecutively in the same LEB. This function returns zero in case of success
6c0c42cdfd73fb1 Artem Bityutskiy 2008-11-18  1545   * and a negative error code in case of failure.
6c0c42cdfd73fb1 Artem Bityutskiy 2008-11-18  1546   *
6c0c42cdfd73fb1 Artem Bityutskiy 2008-11-18  1547   * Note, if the bulk-read buffer length (@bu->buf_len) is known, this function
6c0c42cdfd73fb1 Artem Bityutskiy 2008-11-18  1548   * makes sure bulk-read nodes fit the buffer. Otherwise, this function prepares
6f7ab6d458bbfc2 Artem Bityutskiy 2009-01-27  1549   * maximum possible amount of nodes for bulk-read.
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1550   */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1551  int ubifs_tnc_get_bu_keys(struct ubifs_info *c, struct bu_info *bu)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1552  {
3f649ab728cda80 Kees Cook        2020-06-03  1553  	int n, err = 0, lnum = -1, offs;
3f649ab728cda80 Kees Cook        2020-06-03  1554  	int len;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1555  	unsigned int block = key_block(c, &bu->key);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1556  	struct ubifs_znode *znode;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1557  
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1558  	bu->cnt = 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1559  	bu->blk_cnt = 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1560  	bu->eof = 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1561  
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1562  	mutex_lock(&c->tnc_mutex);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1563  	/* Find first key */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1564  	err = ubifs_lookup_level0(c, &bu->key, &znode, &n);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1565  	if (err < 0)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1566  		goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1567  	if (err) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1568  		/* Key found */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1569  		len = znode->zbranch[n].len;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1570  		/* The buffer must be big enough for at least 1 node */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1571  		if (len > bu->buf_len) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1572  			err = -EINVAL;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1573  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1574  		}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1575  		/* Add this key */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1576  		bu->zbranch[bu->cnt++] = znode->zbranch[n];
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1577  		bu->blk_cnt += 1;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1578  		lnum = znode->zbranch[n].lnum;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1579  		offs = ALIGN(znode->zbranch[n].offs + len, 8);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1580  	}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1581  	while (1) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1582  		struct ubifs_zbranch *zbr;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1583  		union ubifs_key *key;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1584  		unsigned int next_block;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1585  
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1586  		/* Find next key */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1587  		err = tnc_next(c, &znode, &n);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1588  		if (err)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1589  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1590  		zbr = &znode->zbranch[n];
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1591  		key = &zbr->key;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1592  		/* See if there is another data key for this file */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1593  		if (key_inum(c, key) != key_inum(c, &bu->key) ||
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1594  		    key_type(c, key) != UBIFS_DATA_KEY) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1595  			err = -ENOENT;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1596  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1597  		}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1598  		if (lnum < 0) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1599  			/* First key found */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1600  			lnum = zbr->lnum;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1601  			offs = ALIGN(zbr->offs + zbr->len, 8);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1602  			len = zbr->len;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1603  			if (len > bu->buf_len) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1604  				err = -EINVAL;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1605  				goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1606  			}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1607  		} else {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1608  			/*
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1609  			 * The data nodes must be in consecutive positions in
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1610  			 * the same LEB.
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1611  			 */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1612  			if (zbr->lnum != lnum || zbr->offs != offs)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1613  				goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1614  			offs += ALIGN(zbr->len, 8);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1615  			len = ALIGN(len, 8) + zbr->len;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1616  			/* Must not exceed buffer length */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1617  			if (len > bu->buf_len)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1618  				goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1619  		}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1620  		/* Allow for holes */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1621  		next_block = key_block(c, key);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1622  		bu->blk_cnt += (next_block - block - 1);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1623  		if (bu->blk_cnt >= UBIFS_MAX_BULK_READ)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1624  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1625  		block = next_block;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1626  		/* Add this key */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1627  		bu->zbranch[bu->cnt++] = *zbr;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1628  		bu->blk_cnt += 1;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1629  		/* See if we have room for more */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1630  		if (bu->cnt >= UBIFS_MAX_BULK_READ)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1631  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1632  		if (bu->blk_cnt >= UBIFS_MAX_BULK_READ)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1633  			goto out;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1634  	}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1635  out:
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1636  	if (err == -ENOENT) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1637  		bu->eof = 1;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1638  		err = 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1639  	}
4793e7c5e1c8838 Adrian Hunter    2008-09-02 @1640  	bu->gc_seq = c->gc_seq;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1641  	mutex_unlock(&c->tnc_mutex);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1642  	if (err)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1643  		return err;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1644  	/*
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1645  	 * An enormous hole could cause bulk-read to encompass too many
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1646  	 * page cache pages, so limit the number here.
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1647  	 */
63c300b68fd93a9 Adrian Hunter    2008-09-17  1648  	if (bu->blk_cnt > UBIFS_MAX_BULK_READ)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1649  		bu->blk_cnt = UBIFS_MAX_BULK_READ;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1650  	/*
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1651  	 * Ensure that bulk-read covers a whole number of page cache
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1652  	 * pages.
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1653  	 */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1654  	if (UBIFS_BLOCKS_PER_PAGE == 1 ||
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1655  	    !(bu->blk_cnt & (UBIFS_BLOCKS_PER_PAGE - 1)))
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1656  		return 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1657  	if (bu->eof) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1658  		/* At the end of file we can round up */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1659  		bu->blk_cnt += UBIFS_BLOCKS_PER_PAGE - 1;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1660  		return 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1661  	}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1662  	/* Exclude data nodes that do not make up a whole page cache page */
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1663  	block = key_block(c, &bu->key) + bu->blk_cnt;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1664  	block &= ~(UBIFS_BLOCKS_PER_PAGE - 1);
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1665  	while (bu->cnt) {
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1666  		if (key_block(c, &bu->zbranch[bu->cnt - 1].key) < block)
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1667  			break;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1668  		bu->cnt -= 1;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1669  	}
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1670  	return 0;
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1671  }
4793e7c5e1c8838 Adrian Hunter    2008-09-02  1672  

:::::: The code at line 1640 was first introduced by commit
:::::: 4793e7c5e1c88382ead18db5ca072bac54467318 UBIFS: add bulk-read facility

:::::: TO: Adrian Hunter <ext-adrian.hunter@nokia.com>
:::::: CC: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
