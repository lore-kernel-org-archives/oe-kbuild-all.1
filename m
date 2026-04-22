Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640B336C5AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841870; cv=none; b=XFoHU1lUgNOj4lwLaI5bovfQjWZdCDqYSyTcHYRpPwtPZOASzObpfNhtkSxDpZZjY3Y7k2TjWfN9fxNGxiz3S2xVBh+rlNjv3Iq5lThlHQ8IjWCZ3JkFegRDel7BE3YKAhvoCnsytXItrcCdGHs20xzs7AcHYMj7jbQVpjymjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841870; c=relaxed/simple;
	bh=u76iHu70pRRqPyJQIGXcrbxJgusNs2JcCZSI9P2Lyug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZyRkbC0u0DE5igffkt8Co3LSEJEHglBrmMND//OQA2Vi9uEh8npl6OXc7HSq58X8eiju2jSDnOoB5VRJmdwyY+ROolABoM2Oz0jwwyC/+zY0+XpphkbEN79Z2S3ykQ7ryvZkTARwH9ZsqG8BDdbzM40Y32BReDEUxsunw4/scqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTE2mh/l; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTE2mh/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776841868; x=1808377868;
  h=date:from:to:cc:subject:message-id;
  bh=u76iHu70pRRqPyJQIGXcrbxJgusNs2JcCZSI9P2Lyug=;
  b=FTE2mh/lZKwk7GfhBDn1s76Q+n3hBMO26yPSZ4B6yKu+jTFS7f16Dp+A
   lEDFIL3lRRMyj7sS3YMYwKEhU8N+20tR6aLP/g+NCMNiqX0JLZHOiqCBO
   ditrM0wTBaEwhns6J5ERYsAaQelZoeVXzUbU0je2Dml1Yolw59T3WKTHa
   3A+OiLSglt9PVKzrh5ms1BMYci7kyxJR73JlxA3INqIePXzdyMXPt5Nr5
   5qdtuDhlZnh69BimOvgAexWQ61/MQhOGZzQ/Wvocxq3dTd3ZKS95n2dM0
   ViUx6U+hu0G63ZBkj2vtMniaLO6duC9EY0jdiTo0rFSlJO+cHMlI7/eG+
   g==;
X-CSE-ConnectionGUID: Hcv/IwtiRX6we2jgeIWEYw==
X-CSE-MsgGUID: gxBagdmaTWq3/iEghn9ErQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77491780"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77491780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 00:11:08 -0700
X-CSE-ConnectionGUID: m87ety+USri2F2RioVvflw==
X-CSE-MsgGUID: m2Rx4BqyT3+T8X5S/CpN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227681153"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2026 00:11:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFRjj-000000000Gb-3026;
	Wed, 22 Apr 2026 07:11:03 +0000
Date: Wed, 22 Apr 2026 15:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 1/5]
 kernel/time/timer_migration.c:1847:35: warning: variable 'state' set but not
 used
Message-ID: <202604221526.5bh1O87y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   31929c6c4b7bdb172e369237738337340a4bcfb9
commit: 215893969671582f7c0d7e0fd5bd419b96ee01c6 [1/5] timers/migration: Fix hotplug activation race
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604221526.5bh1O87y-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604221526.5bh1O87y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604221526.5bh1O87y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/timer_migration.c: In function 'tmigr_setup_groups':
>> kernel/time/timer_migration.c:1847:35: warning: variable 'state' set but not used [-Wunused-but-set-variable]
    1847 |                 union tmigr_state state;
         |                                   ^~~~~


vim +/state +1847 kernel/time/timer_migration.c

7ee988770326fc Anna-Maria Behnsen  2024-02-22  1759  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1760  static int tmigr_setup_groups(unsigned int cpu, unsigned int node,
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1761  			      struct tmigr_group *start, bool activate)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1762  {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1763  	struct tmigr_group *group, *child, **stack;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1764  	int i, top = 0, err = 0, start_lvl = 0;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1765  	bool root_mismatch = false;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1766  
bf4afc53b77aea Linus Torvalds      2026-02-21  1767  	stack = kzalloc_objs(*stack, tmigr_hierarchy_levels);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1768  	if (!stack)
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1769  		return -ENOMEM;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1770  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1771  	if (start) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1772  		stack[start->level] = start;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1773  		start_lvl = start->level + 1;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1774  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1775  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1776  	if (tmigr_root)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1777  		root_mismatch = tmigr_root->numa_node != node;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1778  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1779  	for (i = start_lvl; i < tmigr_hierarchy_levels; i++) {
93643b90d6c141 Frederic Weisbecker 2025-10-24  1780  		group = tmigr_get_group(node, i);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1781  		if (IS_ERR(group)) {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1782  			err = PTR_ERR(group);
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1783  			i--;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1784  			break;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1785  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1786  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1787  		top = i;
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1788  		stack[i] = group;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1789  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1790  		/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1791  		 * When booting only less CPUs of a system than CPUs are
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1792  		 * available, not all calculated hierarchy levels are required,
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1793  		 * unless a node mismatch is detected.
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1794  		 *
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1795  		 * The loop is aborted as soon as the highest level, which might
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1796  		 * be different from tmigr_hierarchy_levels, contains only a
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1797  		 * single group, unless the nodes mismatch below tmigr_crossnode_level
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1798  		 */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1799  		if (group->parent)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1800  			break;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1801  		if ((!root_mismatch || i >= tmigr_crossnode_level) &&
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1802  		    list_is_singular(&tmigr_level_list[i]))
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1803  			break;
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1804  	}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1805  
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1806  	/* Assert single root without parent */
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1807  	if (WARN_ON_ONCE(i >= tmigr_hierarchy_levels))
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1808  		return -EINVAL;
868c9037df626b Frederic Weisbecker 2025-02-05  1809  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1810  	for (; i >= start_lvl; i--) {
6c181b5667eea3 Frederic Weisbecker 2025-10-24  1811  		group = stack[i];
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1812  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1813  		if (err < 0) {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1814  			list_del(&group->list);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1815  			kfree(group);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1816  			continue;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1817  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1818  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1819  		WARN_ON_ONCE(i != group->level);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1820  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1821  		/*
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1822  		 * Update tmc -> group / child -> group connection
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1823  		 */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1824  		if (i == 0) {
10a0e6f3d3db7d Anna-Maria Behnsen  2024-07-17  1825  			struct tmigr_cpu *tmc = per_cpu_ptr(&tmigr_cpu, cpu);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1826  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1827  			tmc->tmgroup = group;
835a9a67f54f01 Anna-Maria Behnsen  2024-07-16  1828  			tmc->groupmask = BIT(group->num_children++);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1829  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1830  			tmigr_init_root(group, activate);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1831  
36e40df35d2c18 Anna-Maria Behnsen  2024-02-22  1832  			trace_tmigr_connect_cpu_parent(tmc);
36e40df35d2c18 Anna-Maria Behnsen  2024-02-22  1833  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1834  			/* There are no children that need to be connected */
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1835  			continue;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1836  		} else {
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1837  			child = stack[i - 1];
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1838  			tmigr_connect_child_parent(child, group, activate);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1839  		}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1840  	}
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1841  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1842  	if (err < 0)
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1843  		goto out;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1844  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1845  	if (activate) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1846  		struct tmigr_walk data;
3c8eb36e2a4678 Frederic Weisbecker 2025-10-24 @1847  		union tmigr_state state;
868c9037df626b Frederic Weisbecker 2025-02-05  1848  
868c9037df626b Frederic Weisbecker 2025-02-05  1849  		/*
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1850  		 * To prevent inconsistent states, active children need to be active in
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1851  		 * the new parent as well. Inactive children are already marked inactive
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1852  		 * in the parent group:
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1853  		 *
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1854  		 * * When new groups were created by tmigr_setup_groups() starting from
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1855  		 *   the lowest level, then they are not active. They will be set active
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1856  		 *   when the new online CPU comes active.
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1857  		 *
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1858  		 * * But if new groups above the current top level are required, it is
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1859  		 *   mandatory to propagate the active state of the already existing
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1860  		 *   child to the new parents. So tmigr_active_up() activates the
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1861  		 *   new parents while walking up from the old root to the new.
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1862  		 *
21589396967158 Frederic Weisbecker 2026-04-21  1863  		 * * It is ensured that @start is active, (or on the way to be activated
21589396967158 Frederic Weisbecker 2026-04-21  1864  		 *   by another CPU that woke up before the current one) as this setup path
21589396967158 Frederic Weisbecker 2026-04-21  1865  		 *   is executed in hotplug prepare callback. This is executed by an already
21589396967158 Frederic Weisbecker 2026-04-21  1866  		 *   connected and !idle CPU in the hierarchy.
21589396967158 Frederic Weisbecker 2026-04-21  1867  		 *
21589396967158 Frederic Weisbecker 2026-04-21  1868  		 * * The below RmW atomic operation ensures that:
21589396967158 Frederic Weisbecker 2026-04-21  1869  		 *
21589396967158 Frederic Weisbecker 2026-04-21  1870  		 *   1) If the old root has been completely activated, the latest state is
21589396967158 Frederic Weisbecker 2026-04-21  1871  		 *      acquired (the below implicit acquire pairs with the implicit release
21589396967158 Frederic Weisbecker 2026-04-21  1872  		 *      from cmpxchg() in tmigr_active_up()).
21589396967158 Frederic Weisbecker 2026-04-21  1873  		 *
21589396967158 Frederic Weisbecker 2026-04-21  1874  		 *   2) If the old root is still on the way to be activated, the lagging behind
21589396967158 Frederic Weisbecker 2026-04-21  1875  		 *      CPU performing the activation will acquire the links up to the new root.
21589396967158 Frederic Weisbecker 2026-04-21  1876  		 *      (The below implicit release pairs with the implicit acquire from cmpxchg()
21589396967158 Frederic Weisbecker 2026-04-21  1877  		 *      in tmigr_active_up()).
21589396967158 Frederic Weisbecker 2026-04-21  1878  		 *
21589396967158 Frederic Weisbecker 2026-04-21  1879  		 *   3) Every subsequent CPU below the old root will acquire the new links while
21589396967158 Frederic Weisbecker 2026-04-21  1880  		 *      walking through the old root (The below implicit release pairs with the
21589396967158 Frederic Weisbecker 2026-04-21  1881  		 *      implicit acquire from cmpxchg() in either tmigr_active_up()) or
21589396967158 Frederic Weisbecker 2026-04-21  1882  		 *      tmigr_inactive_up().
10a0e6f3d3db7d Anna-Maria Behnsen  2024-07-17  1883  		 */
21589396967158 Frederic Weisbecker 2026-04-21  1884  		state.state = atomic_fetch_or(0, &start->migr_state);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1885  		WARN_ON_ONCE(!start->parent);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1886  		data.childmask = start->groupmask;
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1887  		__walk_groups_from(tmigr_active_up, &data, start, start->parent);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1888  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1889  
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1890  	/* Root update */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1891  	if (list_is_singular(&tmigr_level_list[top])) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1892  		group = list_first_entry(&tmigr_level_list[top],
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1893  					 typeof(*group), list);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1894  		WARN_ON_ONCE(group->parent);
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1895  		if (tmigr_root) {
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1896  			/* Old root should be the same or below */
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1897  			WARN_ON_ONCE(tmigr_root->level > top);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1898  		}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1899  		tmigr_root = group;
d7ad05c86e2191 Levi Yun            2024-05-06  1900  	}
5eb579dfd46b49 Frederic Weisbecker 2025-10-24  1901  out:
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1902  	kfree(stack);
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1903  
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1904  	return err;
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1905  }
7ee988770326fc Anna-Maria Behnsen  2024-02-22  1906  

:::::: The code at line 1847 was first introduced by commit
:::::: 3c8eb36e2a46786d50dbef417ef782ff37b372ca timers/migration: Assert that hotplug preparing CPU is part of stable active hierarchy

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
