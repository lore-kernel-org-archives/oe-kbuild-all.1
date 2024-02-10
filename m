Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEC36AF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707577706; cv=none; b=uplk7bzwbviktEeKry0BuajHYKlVXL++aSkRDtypr+g4Wx91NjkraN0PHRx2R/XuLtSbMOVr+u93Pi8IT41orRzECqSp0rItlpFCc4/RelmFvqwtn1sZdqyIogbt+gUiYDN63wvNF8prQQypwoMwfbWn5AlGLImNn8dUwd8ncEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707577706; c=relaxed/simple;
	bh=5q2rrbgYbD7RhmMdobjesoetbwS9efNgAK+1Oxf1Hz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VYARlx8w85D/7I6NOs7S4LJ80ykco4jQPz0a7VERhi0YA3GJ9/gWwPZI4azlV390VB+vKznGEjEkI38IJox4lqfWRykWqh2H24a0U+rMu2Gz3tntth8d6be4Zj0kmz47fV89iZ7odhGNBj6q6bi2aXZnWvhPn6hYOsjGlYdVOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHkuBZLL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHkuBZLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707577704; x=1739113704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5q2rrbgYbD7RhmMdobjesoetbwS9efNgAK+1Oxf1Hz4=;
  b=oHkuBZLLeBVxClCaxlTg5+kqoMoOPG31CcQtNUDthBVwCGXK7E9mj7qh
   tJjmwP7vsLvU0QutjFOw2TeRd9GTE31EtMERBG1L1Yu81Y9oNxIbRjzbD
   VYvtBDsmWsXQVHXTGDRVUHYeQALTawTGq61EW8EvvBeaYIr+0SgoqlLQ/
   Hi4vBg+RZVEkB8UPeHq4gFXCnlr3r7Ehha3yoP79h3mUqDxs2geilcLBw
   QW9atNGMsyaebke7H6FPPKaWPYllZ0yUSZVrea8S6qpFmnqZOUQ91ffgS
   bH2xsbw+J2utKP0BRJ5QI4OzM8Odsahc6KkwCIa9zfDHOdDC3gWKekVSv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1445730"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1445730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 07:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2166538"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2024 07:08:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYoxo-0005lO-16;
	Sat, 10 Feb 2024 15:08:20 +0000
Date: Sat, 10 Feb 2024 23:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 78/87] fs/bcachefs/fsck.c:1685:46:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202402102330.oICpc8hd-lkp@intel.com>
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
commit: fac16774d45aea5acbd2057b8d5f4348484fe280 [78/87] bcachefs: Repair subvol dirents that point to non subvols
config: x86_64-randconfig-123-20240210 (https://download.01.org/0day-ci/archive/20240210/202402102330.oICpc8hd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102330.oICpc8hd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102330.oICpc8hd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/fsck.c: note: in included file:
   fs/bcachefs/bcachefs.h:1013:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/fsck.c:1685:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] d_parent_subvol @@     got unsigned int [usertype] bi_parent_subvol @@
   fs/bcachefs/fsck.c:1685:46: sparse:     expected restricted __le32 [usertype] d_parent_subvol
   fs/bcachefs/fsck.c:1685:46: sparse:     got unsigned int [usertype] bi_parent_subvol
>> fs/bcachefs/fsck.c:1686:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] d_child_subvol @@     got unsigned int [usertype] bi_subvol @@
   fs/bcachefs/fsck.c:1686:45: sparse:     expected restricted __le32 [usertype] d_child_subvol
   fs/bcachefs/fsck.c:1686:45: sparse:     got unsigned int [usertype] bi_subvol
>> fs/bcachefs/fsck.c:1688:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] d_inum @@     got unsigned long long [usertype] bi_inum @@
   fs/bcachefs/fsck.c:1688:37: sparse:     expected restricted __le64 [usertype] d_inum
   fs/bcachefs/fsck.c:1688:37: sparse:     got unsigned long long [usertype] bi_inum

vim +1685 fs/bcachefs/fsck.c

  1654	
  1655	static int check_dirent_target(struct btree_trans *trans,
  1656				       struct btree_iter *iter,
  1657				       struct bkey_s_c_dirent d,
  1658				       struct bch_inode_unpacked *target,
  1659				       u32 target_snapshot)
  1660	{
  1661		struct bch_fs *c = trans->c;
  1662		struct bkey_i_dirent *n;
  1663		struct printbuf buf = PRINTBUF;
  1664		int ret = 0;
  1665	
  1666		ret = check_dirent_inode_dirent(trans, iter, d, target, target_snapshot);
  1667		if (ret)
  1668			goto err;
  1669	
  1670		if (fsck_err_on(d.v->d_type != inode_d_type(target),
  1671				c, dirent_d_type_wrong,
  1672				"incorrect d_type: got %s, should be %s:\n%s",
  1673				bch2_d_type_str(d.v->d_type),
  1674				bch2_d_type_str(inode_d_type(target)),
  1675				(printbuf_reset(&buf),
  1676				 bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf))) {
  1677			n = bch2_trans_kmalloc(trans, bkey_bytes(d.k));
  1678			ret = PTR_ERR_OR_ZERO(n);
  1679			if (ret)
  1680				goto err;
  1681	
  1682			bkey_reassemble(&n->k_i, d.s_c);
  1683			n->v.d_type = inode_d_type(target);
  1684			if (n->v.d_type == DT_SUBVOL) {
> 1685				n->v.d_parent_subvol = target->bi_parent_subvol;
> 1686				n->v.d_child_subvol = target->bi_subvol;
  1687			} else {
> 1688				n->v.d_inum = target->bi_inum;
  1689			}
  1690	
  1691			ret = bch2_trans_update(trans, iter, &n->k_i, 0);
  1692			if (ret)
  1693				goto err;
  1694	
  1695			d = dirent_i_to_s_c(n);
  1696		}
  1697	err:
  1698	fsck_err:
  1699		printbuf_exit(&buf);
  1700		bch_err_fn(c, ret);
  1701		return ret;
  1702	}
  1703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
