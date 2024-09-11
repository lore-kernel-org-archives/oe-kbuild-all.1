Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07B225D9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726017264; cv=none; b=cYvdqAvFr4xVRanjQVU2NYfreN82rQ+QCiLfyvq+m4PYxlvXX+cvjjA40Tc24LV7XbbLZdNK6XZRz0lSRfQ6Pneq1RLMkOOV/f6DkjnlvdfJaFeoAovy6ZTXWKKlcCOfW6h7hJcLfhcoChOEBnz8tEdHqw0Pd2F+ioA7h7fGjXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726017264; c=relaxed/simple;
	bh=X/G4gh4tmeKIqIM4YCF4iR3jmzn3Y8mKSPUZVQVwkcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClKWt5v+BB5MpTeWjEgAAaT7Dx6TgA2fAwCStqdGWAVB4dX426s8OOrexVSOoGK8Ha6QKcNFQXF67Yf4wCIIgX+9qRiOlLwhKZG/IMizkZCvC1INCFlpjYbOxLCCzRqu0TtF6j3Q3fw9CzmJGKvKPqu6vmyYhGGiN+xE1xhENq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDyE1D8K; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDyE1D8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726017263; x=1757553263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/G4gh4tmeKIqIM4YCF4iR3jmzn3Y8mKSPUZVQVwkcs=;
  b=fDyE1D8KVdbrLarvYbKRq5AHtdGBs5V91U6FGLmicqXl0zaKA2eTDkc8
   Q3v+bYpVSi+kUA6NGp2H2haLvkMecoC2d9/PZi9ulq2Qu0kbQQNw/HTBr
   VKCKJkwmAZM/hPhXGRigKWv20va1ovRrcTpojvnMhTzDp08uEVPYrz/ed
   /OA3QpVwlvI5XY8zB1kpeu8vwfqHPUEOV7vxVFUbmMi2y3K6+upQtFY8Q
   fQFScbp5RAVaBz9f6Yd+z7BWEVy8PtYkmt8DoKxuob7bA7/v9q0g8kDFF
   jGsJ8SA5+55be5QoMTyikS3Jke4WHjp/cCZqw4cBeCj6W4SQ7SwYXNlnF
   A==;
X-CSE-ConnectionGUID: SkUueI/kQmu5smDwtFaobw==
X-CSE-MsgGUID: 5E7WzMI8Rjm7eubcbH1wJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24615838"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24615838"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:14:22 -0700
X-CSE-ConnectionGUID: cmVeCdpqSN+HSGxp3bkz3Q==
X-CSE-MsgGUID: 8tifdJfORjGXBbLsgljJzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="98029187"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Sep 2024 18:14:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soBw2-0002uG-0f;
	Wed, 11 Sep 2024 01:14:18 +0000
Date: Wed, 11 Sep 2024 09:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26326/30000] fs/quota/dquot.c:1699:25: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202409110955.mmx8Aa4b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cbfb00d89c3b9971c3f0732b4f34d4e674bff5d8
commit: b6c35c29c4b795fa72f7acecb07e94502f159bec [26326/30000] quota: Fix potential NULL pointer dereference
config: x86_64-randconfig-122-20240910 (https://download.01.org/0day-ci/archive/20240911/202409110955.mmx8Aa4b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110955.mmx8Aa4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409110955.mmx8Aa4b-lkp@intel.com/

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
