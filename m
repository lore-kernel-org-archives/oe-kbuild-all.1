Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75D130E4A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219965; cv=none; b=Tzv9/Cg9EH/kH3dfWbjYiePT96rbWJp+Bz8VP6Nb03P8E7IkebZvkFo7BtHIFAizz64YM9Pv7lgmi/dXUGnrjLxTbFLcnXIOqDm8yGa1ocZ4rOhdGqMFqBN5lmaIvzf4aqJHjCjM39BrHzfBztchaN5RshzBi2oz7SmE9D9SyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219965; c=relaxed/simple;
	bh=VuXg/EM8vRRBIDF9k++uopiFTMoSprRFp8Cb5yjHjgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1o6EorlBBWRtge8pBIlqaA5bBpuueDczPv7ruLVYuxsqgHh/Mgsw6CkPAV6sE3H8Zsxpga+41GTuyc9ncYgoI9hqMKF029+Z22mFsxN+zqPqYWK8FhbAlzkKMBxAxjfMu9rcP0CHfejFkQ5fYX/dNbTh/BXK+/ZU3YIf+De0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edeXiML4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edeXiML4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707219964; x=1738755964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuXg/EM8vRRBIDF9k++uopiFTMoSprRFp8Cb5yjHjgc=;
  b=edeXiML46ncMYyQyaYNxfhIUYH1l8fLO1PaT1woReit3GkkLeScVEvkh
   ygjZT3EIs6tcKliqihWCstgA0PQ+j0a6VwQParg9y4CpWvy3bnQ/rbHfF
   N/1B+90ym4KZm+r2/NKdJ00GIVg1UYYIxOfUHSH9koouLShMk6vk/6ULe
   UGiyZu30invCPvqee7RbQbNYceYEYwsxpxUVCE4PtNzTVtz1F2Sdy0gx0
   rivEDDap1kk2+eRK2rNPytXz1ZpJQych4glKk8r0tbXCfCivq0eOn6Faa
   UWHw9YQJiJ6AohWd6yXaoX2gQ9iE15FFEZgyro7mYS8sSktfuOMBNyL3N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="630372"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="630372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="998458"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2024 03:46:01 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXJtm-0001KS-39;
	Tue, 06 Feb 2024 11:45:58 +0000
Date: Tue, 6 Feb 2024 19:45:10 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Jianjian <wangjianjian3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jan Kara <jack@suse.cz>
Subject: [linux-next:master 4146/4465] fs/quota/dquot.c:1699:25: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202402061900.rTuYDlo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: d0aa72604fbd80c8aabb46eda00535ed35570f1f [4146/4465] quota: Fix potential NULL pointer dereference
config: x86_64-randconfig-122-20240206 (https://download.01.org/0day-ci/archive/20240206/202402061900.rTuYDlo6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061900.rTuYDlo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061900.rTuYDlo6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/quota/dquot.c:1699:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1699:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1699:25: sparse:    struct dquot *
   fs/quota/dquot.c:1710:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1710:41: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1710:41: sparse:    struct dquot *
   fs/quota/dquot.c:1760:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1760:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1760:25: sparse:    struct dquot *
   fs/quota/dquot.c:1766:41: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1766:41: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1766:41: sparse:    struct dquot *
   fs/quota/dquot.c:1810:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1810:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1810:25: sparse:    struct dquot *
   fs/quota/dquot.c:1852:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1852:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1852:25: sparse:    struct dquot *
   fs/quota/dquot.c:1901:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1901:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1901:25: sparse:    struct dquot *
   fs/quota/dquot.c:1949:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:1949:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:1949:25: sparse:    struct dquot *
   fs/quota/dquot.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *
   fs/quota/dquot.c:409:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/quota/dquot.c:409:25: sparse:    struct dquot [noderef] __rcu *
   fs/quota/dquot.c:409:25: sparse:    struct dquot *

vim +1699 fs/quota/dquot.c

  1659	
  1660	/*
  1661	 * This functions updates i_blocks+i_bytes fields and quota information
  1662	 * (together with appropriate checks).
  1663	 *
  1664	 * NOTE: We absolutely rely on the fact that caller dirties the inode
  1665	 * (usually helpers in quotaops.h care about this) and holds a handle for
  1666	 * the current transaction so that dquot write and inode write go into the
  1667	 * same transaction.
  1668	 */
  1669	
  1670	/*
  1671	 * This operation can block, but only after everything is updated
  1672	 */
  1673	int __dquot_alloc_space(struct inode *inode, qsize_t number, int flags)
  1674	{
  1675		int cnt, ret = 0, index;
  1676		struct dquot_warn warn[MAXQUOTAS];
  1677		int reserve = flags & DQUOT_SPACE_RESERVE;
  1678		struct dquot **dquots;
  1679		struct dquot *dquot;
  1680	
  1681		if (!inode_quota_active(inode)) {
  1682			if (reserve) {
  1683				spin_lock(&inode->i_lock);
  1684				*inode_reserved_space(inode) += number;
  1685				spin_unlock(&inode->i_lock);
  1686			} else {
  1687				inode_add_bytes(inode, number);
  1688			}
  1689			goto out;
  1690		}
  1691	
  1692		for (cnt = 0; cnt < MAXQUOTAS; cnt++)
  1693			warn[cnt].w_type = QUOTA_NL_NOWARN;
  1694	
  1695		dquots = i_dquot(inode);
  1696		index = srcu_read_lock(&dquot_srcu);
  1697		spin_lock(&inode->i_lock);
  1698		for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
> 1699			dquot = srcu_dereference(dquots[cnt], &dquot_srcu);
  1700			if (!dquot)
  1701				continue;
  1702			if (reserve) {
  1703				ret = dquot_add_space(dquot, 0, number, flags, &warn[cnt]);
  1704			} else {
  1705				ret = dquot_add_space(dquot, number, 0, flags, &warn[cnt]);
  1706			}
  1707			if (ret) {
  1708				/* Back out changes we already did */
  1709				for (cnt--; cnt >= 0; cnt--) {
  1710					dquot = srcu_dereference(dquots[cnt], &dquot_srcu);
  1711					if (!dquot)
  1712						continue;
  1713					spin_lock(&dquot->dq_dqb_lock);
  1714					if (reserve)
  1715						dquot_free_reserved_space(dquot, number);
  1716					else
  1717						dquot_decr_space(dquot, number);
  1718					spin_unlock(&dquot->dq_dqb_lock);
  1719				}
  1720				spin_unlock(&inode->i_lock);
  1721				goto out_flush_warn;
  1722			}
  1723		}
  1724		if (reserve)
  1725			*inode_reserved_space(inode) += number;
  1726		else
  1727			__inode_add_bytes(inode, number);
  1728		spin_unlock(&inode->i_lock);
  1729	
  1730		if (reserve)
  1731			goto out_flush_warn;
  1732		mark_all_dquot_dirty(dquots);
  1733	out_flush_warn:
  1734		srcu_read_unlock(&dquot_srcu, index);
  1735		flush_warnings(warn);
  1736	out:
  1737		return ret;
  1738	}
  1739	EXPORT_SYMBOL(__dquot_alloc_space);
  1740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
