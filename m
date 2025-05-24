Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5137E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748062941; cv=none; b=Xhmynrnax/fUGtFF47kWdS5A+aszKdeplrL6ZwUruuBD5oAdEmngzD7Pa6Wk7CAng/BpBrdIF7JCNYlE2Z+Z75hjPHlfkiRWjbrhXqKEa9UdIA92d3UDwjbx+P2Dg2HveXdkRqFPU4P4gKcdoXyVae0TIuhdAmFgA/qsKgu+0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748062941; c=relaxed/simple;
	bh=CMkH2PbuQjNXMsaWm+1n6mnLDJ01MHREZG6XTyRUTZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZI2MHbqQXLyJcwcK/dKx+SXxcnFjd/sar0gkzRublWNfjJV423RvJKIqBh/nEDsHyed2pGB4fVp2w1N2XpsK5T72DtMrQjyasfRccEK6/PGGD4zAeK9h5HdQ1q4/XzhRYQ+JL6OaugpJNJcFiSajF3Pc7rd1D+XN1ul6D2NksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhAaXeuK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhAaXeuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748062938; x=1779598938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMkH2PbuQjNXMsaWm+1n6mnLDJ01MHREZG6XTyRUTZ8=;
  b=nhAaXeuKVFa52p0Hhc8tcNv/GhLhOZsR44o/r4LYzyK73oTYZ97kYE8U
   Wr/N3lrQ1b4+S5brpWthklYj1utxgB3M4akJIrBUGLpOQ2xak6veho6g8
   lpX89kU76fACbb9ETPjOHwji7oqg95Jxs7Hej7uJAvA+UPloi2p8chVbz
   24V9VYoLvx7lAKP+753o5YjGhwEuaYJfcty6YUP0CmjItC/SfetV9X+8z
   OwiHDolwq7adswwXk4E0JOb/LpS7lBbRTHG62rPl276ZHCK+Q72iMfpxl
   +XCzGULbGJwHgZHBHYAk0ccoehdLD0NCgjy6Vc8TP6pqaS+WxTiQpdXpL
   g==;
X-CSE-ConnectionGUID: eDmi58nFRhWz7sN+QX6vNw==
X-CSE-MsgGUID: fVTPmhiXQJ2NDOY7fATu1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50000323"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50000323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 22:02:17 -0700
X-CSE-ConnectionGUID: jmP3eX4fSti+aSZBBbmIHg==
X-CSE-MsgGUID: C1nVnEG/QCmU+8Rs2agdjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141294803"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2025 22:02:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIh1T-000Qwy-0p;
	Sat, 24 May 2025 05:02:15 +0000
Date: Sat, 24 May 2025 13:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [jlayton:uek-localio 2035/2262] fs/dcache.c:1577:14: warning:
 variable 'last_n_neg' set but not used
Message-ID: <202505241248.6Nt8XSGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: e1acd9346cb93ba4b4d1547147c6815e229bdbdb [2035/2262] fs/dcache: schedule only one instance of negative dentry shrinker
config: x86_64-buildonly-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241248.6Nt8XSGI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241248.6Nt8XSGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241248.6Nt8XSGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/dcache.c: In function 'prune_negative_dentry':
   fs/dcache.c:1578:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
    1578 |         unsigned long start;
         |                       ^~~~~
>> fs/dcache.c:1577:14: warning: variable 'last_n_neg' set but not used [-Wunused-but-set-variable]
    1577 |         long last_n_neg, excess, count;
         |              ^~~~~~~~~~


vim +/last_n_neg +1577 fs/dcache.c

  1566	
  1567	
  1568	/*
  1569	 * A workqueue function to prune negative dentry.
  1570	 *
  1571	 * The pruning is done gradually over time so as to have as little
  1572	 * performance impact as possible.
  1573	 */
  1574	static void prune_negative_dentry(struct work_struct *work)
  1575	{
  1576		int cpu, limit_pc, ncpus;
> 1577		long last_n_neg, excess, count;
  1578		unsigned long start;
  1579		struct prune_negative_ctrl ctrl;
  1580	
  1581		cpu = smp_processor_id();
  1582		limit_pc = READ_ONCE(neg_dentry_pc);
  1583		ncpus = num_possible_cpus();
  1584		count = get_nr_dentry_negative();
  1585	
  1586		if (!limit_pc)
  1587			goto stop_pruning;
  1588	
  1589		/* Check if negative dentry number is within the limit */
  1590		if (count <= ncpus * neg_dentry_percpu_limit)
  1591			goto requeue_work;
  1592	
  1593		last_n_neg = ndblk.n_neg;
  1594		ctrl.prune_count = 0;
  1595		ctrl.prune_percent = limit_pc;
  1596		ctrl.prune_ncpus = ncpus;
  1597		start = jiffies;
  1598	
  1599		/*
  1600		 * Get the total count of super blocks to prune.
  1601		 * We need this to estimate the number of detries
  1602		 * to prune. This may need further improvement...
  1603		 */
  1604		iterate_supers(inc_nsupers_cnt, &ctrl);
  1605	
  1606		/*
  1607		 * iterate_supers() will take a read lock on the supers blocking
  1608		 * concurrent umount.
  1609		 */
  1610		iterate_supers(prune_negative_one_sb, &ctrl);
  1611	
  1612	requeue_work:
  1613		/*
  1614		 * If the negative dentry count in the current cpu is less than the
  1615		 * per_cpu limit, schedule the pruning in the next cpu if it has
  1616		 * more negative dentries. This will make the negative dentry count
  1617		 * reduction spread more evenly across multiple per-cpu counters.
  1618		 */
  1619		excess = neg_dentry_percpu_limit - __this_cpu_read(nr_dentry_negative);
  1620		if (excess > 0) {
  1621			int next_cpu = cpumask_next(cpu, cpu_online_mask);
  1622	
  1623			if (next_cpu >= nr_cpu_ids)
  1624				next_cpu = cpumask_first(cpu_online_mask);
  1625			if (per_cpu(nr_dentry_negative, next_cpu) >
  1626			    __this_cpu_read(nr_dentry_negative)) {
  1627				cpu = next_cpu;
  1628	
  1629				/*
  1630				 * Transfer some of the excess negative dentry count
  1631				 * to the free pool if the current percpu pool is less
  1632				 * than 3/4 of the limit.
  1633				 */
  1634				if ((excess > neg_dentry_percpu_limit/4) &&
  1635				    raw_spin_trylock(&ndblk.nfree_lock)) {
  1636					WRITE_ONCE(ndblk.nfree,
  1637						   ndblk.nfree + NEG_DENTRY_BATCH);
  1638					__this_cpu_add(nr_dentry_negative, NEG_DENTRY_BATCH);
  1639					raw_spin_unlock(&ndblk.nfree_lock);
  1640				}
  1641			}
  1642		}
  1643	
  1644		schedule_delayed_work_on(cpu, &prune_neg_dentry_work,
  1645						NEGATIVE_DENTRY_CHECK_PERIOD);
  1646		return;
  1647	stop_pruning:
  1648		ndblk.n_neg = 0;
  1649		return;
  1650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
