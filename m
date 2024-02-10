Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCE05F49C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 19:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707593981; cv=none; b=EsQ36Lyjc/xoAwpmFyj0ffgz1AHkkYtRV0cGx5XFukrawrwQ4RSVv/H2qerXE5MCxVYs7PlV6ZnVgLe3QE7LtwMgOQG+z1hRCzYsi3bEkOTJAZPvaCemk0pnX7X99vCW31GF6wLAGINN76E1wHiB38ynt2oMwvhiLf1fTtiNKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707593981; c=relaxed/simple;
	bh=IMjEGLOhdCt6AJPrg+1ffj94MTaOo0XdqTmaqxGaNJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tfjsefkan22fMR0e33DrsCJqGj+o4TEGcppVJvW8Lc7Jbcxpt9JvCJ4pD5BymD2kSilCh69W3scKRAu7P/l/y4BDCaVZpmMApZ5yPvHQ+GifvoTew6sjZYxNJCJwZm9+9mV6mNe4O2yPIPI2WjLdeOsaWNdN5mMAjqZVho6TsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed8pyV6Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed8pyV6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707593978; x=1739129978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMjEGLOhdCt6AJPrg+1ffj94MTaOo0XdqTmaqxGaNJc=;
  b=ed8pyV6QQHfpwc/+7eqd+xyYA53Jeo8ltqg0J67xOMmw5l/Q1bkpPJvf
   jUGD2fZbUcQRHJpe6Y2A4yA5KmYbjh38sziz35IrbzOznItcnvL9AYoSS
   /clc6iv1kEpjtBQZiWgGcjWcwZ4lXBYJLYbLc/+zbbJ4bPDLXCKf3L4ER
   B2NGSh3OMqR8Dd33tcMKRdkAwqpitkVqln7qoo6THxi+N3aDf75bEOOJF
   QgREICKgQ0FXFDiME3nfRvpPams2WZ79QQQ1cSQvtoKgTFXTbnwd86Sko
   C/1GNtq6qxgmQIT2XMqyC3fdGtkhc7hEKW2WOtybHAL1K7WxvTZZGObgr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="5432192"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="5432192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 11:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2524031"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2024 11:39:36 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYtCI-00061K-0t;
	Sat, 10 Feb 2024 19:39:34 +0000
Date: Sun, 11 Feb 2024 03:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 87/94] fs/bcachefs/fsck.c:1812:39:
 sparse: sparse: cast to restricted __le32
Message-ID: <202402110322.zn654S7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   bee7b5a4fa2135c9ec9d1c9424018ee494500bb5
commit: e4ed89728107b08a3899496f2a50d9d217c2e27d [87/94] bcachefs: bch_subvolume::fs_path_parent
config: x86_64-randconfig-123-20240210 (https://download.01.org/0day-ci/archive/20240211/202402110322.zn654S7e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110322.zn654S7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110322.zn654S7e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fsck.c: note: in included file:
   fs/bcachefs/bcachefs.h:1013:9: sparse: sparse: array of flexible structures
   fs/bcachefs/fsck.c:1702:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] d_parent_subvol @@     got unsigned int [usertype] bi_parent_subvol @@
   fs/bcachefs/fsck.c:1702:46: sparse:     expected restricted __le32 [usertype] d_parent_subvol
   fs/bcachefs/fsck.c:1702:46: sparse:     got unsigned int [usertype] bi_parent_subvol
   fs/bcachefs/fsck.c:1703:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] d_child_subvol @@     got unsigned int [usertype] bi_subvol @@
   fs/bcachefs/fsck.c:1703:45: sparse:     expected restricted __le32 [usertype] d_child_subvol
   fs/bcachefs/fsck.c:1703:45: sparse:     got unsigned int [usertype] bi_subvol
   fs/bcachefs/fsck.c:1705:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] d_inum @@     got unsigned long long [usertype] bi_inum @@
   fs/bcachefs/fsck.c:1705:37: sparse:     expected restricted __le64 [usertype] d_inum
   fs/bcachefs/fsck.c:1705:37: sparse:     got unsigned long long [usertype] bi_inum
>> fs/bcachefs/fsck.c:1812:39: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/fsck.c:1812:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] fs_path_parent @@     got unsigned int [usertype] @@
   fs/bcachefs/fsck.c:1812:37: sparse:     expected restricted __le32 [usertype] fs_path_parent
   fs/bcachefs/fsck.c:1812:37: sparse:     got unsigned int [usertype]

vim +1812 fs/bcachefs/fsck.c

  1671	
  1672	static int check_dirent_target(struct btree_trans *trans,
  1673				       struct btree_iter *iter,
  1674				       struct bkey_s_c_dirent d,
  1675				       struct bch_inode_unpacked *target,
  1676				       u32 target_snapshot)
  1677	{
  1678		struct bch_fs *c = trans->c;
  1679		struct bkey_i_dirent *n;
  1680		struct printbuf buf = PRINTBUF;
  1681		int ret = 0;
  1682	
  1683		ret = check_dirent_inode_dirent(trans, iter, d, target, target_snapshot);
  1684		if (ret)
  1685			goto err;
  1686	
  1687		if (fsck_err_on(d.v->d_type != inode_d_type(target),
  1688				c, dirent_d_type_wrong,
  1689				"incorrect d_type: got %s, should be %s:\n%s",
  1690				bch2_d_type_str(d.v->d_type),
  1691				bch2_d_type_str(inode_d_type(target)),
  1692				(printbuf_reset(&buf),
  1693				 bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf))) {
  1694			n = bch2_trans_kmalloc(trans, bkey_bytes(d.k));
  1695			ret = PTR_ERR_OR_ZERO(n);
  1696			if (ret)
  1697				goto err;
  1698	
  1699			bkey_reassemble(&n->k_i, d.s_c);
  1700			n->v.d_type = inode_d_type(target);
  1701			if (n->v.d_type == DT_SUBVOL) {
> 1702				n->v.d_parent_subvol = target->bi_parent_subvol;
  1703				n->v.d_child_subvol = target->bi_subvol;
  1704			} else {
  1705				n->v.d_inum = target->bi_inum;
  1706			}
  1707	
  1708			ret = bch2_trans_update(trans, iter, &n->k_i, 0);
  1709			if (ret)
  1710				goto err;
  1711	
  1712			d = dirent_i_to_s_c(n);
  1713		}
  1714	err:
  1715	fsck_err:
  1716		printbuf_exit(&buf);
  1717		bch_err_fn(c, ret);
  1718		return ret;
  1719	}
  1720	
  1721	/* find a subvolume that's a descendent of @snapshot: */
  1722	static int find_snapshot_subvol(struct btree_trans *trans, u32 snapshot, u32 *subvolid)
  1723	{
  1724		struct btree_iter iter;
  1725		struct bkey_s_c k;
  1726		int ret;
  1727	
  1728		for_each_btree_key_norestart(trans, iter, BTREE_ID_subvolumes, POS_MIN, 0, k, ret) {
  1729			if (k.k->type != KEY_TYPE_subvolume)
  1730				continue;
  1731	
  1732			struct bkey_s_c_subvolume s = bkey_s_c_to_subvolume(k);
  1733			if (bch2_snapshot_is_ancestor(trans->c, le32_to_cpu(s.v->snapshot), snapshot)) {
  1734				bch2_trans_iter_exit(trans, &iter);
  1735				*subvolid = k.k->p.offset;
  1736				goto found;
  1737			}
  1738		}
  1739		if (!ret)
  1740			ret = -ENOENT;
  1741	found:
  1742		bch2_trans_iter_exit(trans, &iter);
  1743		return ret;
  1744	}
  1745	
  1746	static int check_dirent_to_subvol(struct btree_trans *trans, struct btree_iter *iter,
  1747					  struct bkey_s_c_dirent d)
  1748	{
  1749		struct bch_fs *c = trans->c;
  1750		struct btree_iter subvol_iter = {};
  1751		struct bch_inode_unpacked subvol_root;
  1752		u32 parent_subvol = le32_to_cpu(d.v->d_parent_subvol);
  1753		u32 target_subvol = le32_to_cpu(d.v->d_child_subvol);
  1754		u32 parent_snapshot;
  1755		u64 parent_inum;
  1756		struct printbuf buf = PRINTBUF;
  1757		int ret = 0;
  1758	
  1759		ret = subvol_lookup(trans, parent_subvol, &parent_snapshot, &parent_inum);
  1760		if (ret && !bch2_err_matches(ret, ENOENT))
  1761			return ret;
  1762	
  1763		if (fsck_err_on(ret, c, dirent_to_missing_parent_subvol,
  1764				"dirent parent_subvol points to missing subvolume\n%s",
  1765				(bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf)) ||
  1766		    fsck_err_on(!ret && !bch2_snapshot_is_ancestor(c, parent_snapshot, d.k->p.snapshot),
  1767				c, dirent_not_visible_in_parent_subvol,
  1768				"dirent not visible in parent_subvol (not an ancestor of subvol snap %u)\n%s",
  1769				parent_snapshot,
  1770				(bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf))) {
  1771			u32 new_parent_subvol;
  1772			ret = find_snapshot_subvol(trans, d.k->p.snapshot, &new_parent_subvol);
  1773			if (ret)
  1774				goto err;
  1775	
  1776			struct bkey_i_dirent *new_dirent = bch2_bkey_make_mut_typed(trans, iter, &d.s_c, 0, dirent);
  1777			ret = PTR_ERR_OR_ZERO(new_dirent);
  1778			if (ret)
  1779				goto err;
  1780	
  1781			new_dirent->v.d_parent_subvol = cpu_to_le32(new_parent_subvol);
  1782		}
  1783	
  1784		struct bkey_s_c_subvolume s =
  1785			bch2_bkey_get_iter_typed(trans, &subvol_iter,
  1786						 BTREE_ID_subvolumes, POS(0, target_subvol),
  1787						 0, subvolume);
  1788		ret = bkey_err(s.s_c);
  1789		if (ret && !bch2_err_matches(ret, ENOENT))
  1790			return ret;
  1791	
  1792		if (ret) {
  1793			if (fsck_err(c, dirent_to_missing_subvol,
  1794				     "dirent points to missing subvolume\n%s",
  1795				     (bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf)))
  1796				return __remove_dirent(trans, d.k->p);
  1797			ret = 0;
  1798			goto out;
  1799		}
  1800	
  1801		if (fsck_err_on(le32_to_cpu(s.v->fs_path_parent) != parent_subvol,
  1802				c, subvol_fs_path_parent_wrong,
  1803				"subvol with wrong fs_path_parent, should be be %u\n%s",
  1804				parent_subvol,
  1805				(bch2_bkey_val_to_text(&buf, c, s.s_c), buf.buf))) {
  1806			struct bkey_i_subvolume *n =
  1807				bch2_bkey_make_mut_typed(trans, &subvol_iter, &s.s_c, 0, subvolume);
  1808			ret = PTR_ERR_OR_ZERO(n);
  1809			if (ret)
  1810				goto err;
  1811	
> 1812			n->v.fs_path_parent = le32_to_cpu(parent_subvol);
  1813		}
  1814	
  1815		u64 target_inum = le64_to_cpu(s.v->inode);
  1816		u32 target_snapshot = le32_to_cpu(s.v->snapshot);
  1817	
  1818		ret = lookup_inode(trans, target_inum, &subvol_root, &target_snapshot);
  1819		if (ret && !bch2_err_matches(ret, ENOENT))
  1820			return ret;
  1821	
  1822		if (fsck_err_on(parent_subvol != subvol_root.bi_parent_subvol,
  1823				c, inode_bi_parent_wrong,
  1824				"subvol root %llu has wrong bi_parent_subvol: got %u, should be %u",
  1825				target_inum,
  1826				subvol_root.bi_parent_subvol, parent_subvol)) {
  1827			subvol_root.bi_parent_subvol = parent_subvol;
  1828			ret = __bch2_fsck_write_inode(trans, &subvol_root, target_snapshot);
  1829			if (ret)
  1830				return ret;
  1831		}
  1832	
  1833		ret = check_dirent_target(trans, iter, d, &subvol_root,
  1834					  target_snapshot);
  1835		if (ret)
  1836			return ret;
  1837	out:
  1838	err:
  1839	fsck_err:
  1840		bch2_trans_iter_exit(trans, &subvol_iter);
  1841		printbuf_exit(&buf);
  1842		return ret;
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
