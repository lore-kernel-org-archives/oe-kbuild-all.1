Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02E1DA28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 23:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705448499; cv=none; b=G+0zZktkZRvzJ3ks2JCGfSB+qnABC7a45fMQXjvSuDKKUYYfCEvPs+XXYrulPSOmpRF3o22G82K3LnUzGPJ3662d3WKfjBuI0DrbzPsxvhT463As/iw5Pv953fry0qSzb/WJ7OuaqI7zKx+/mOpYvksdhPvzt2j69sCEd9ZOP20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705448499; c=relaxed/simple;
	bh=l4xEB1xA47KHUCZkdnjrnn4f53ZUp8bxu1UzDnOICb0=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=BBJzpp5N3v2SCtpJCRaFL/H63xppge/z6AsxQeBm321v2RgHeukIQvuO2rih6FvMFCmqajRv1QsI/BckKGPYRjq3/84FIO+3GPiHM+WzUijGeJTh73raOnMuch+O/w0K/y/SwSbLvT8ETNS54MJK5aDizJNHCqQpBf5AofumQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iy9Eqvsl; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy9Eqvsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705448497; x=1736984497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4xEB1xA47KHUCZkdnjrnn4f53ZUp8bxu1UzDnOICb0=;
  b=Iy9Eqvsltrfw7h6jqx5q0ou2M2j9YXqvhYsAwqftcuO2yntf2tYZtc3m
   Ccf8BY3EHHACS9IQyO9K5MllhtXDp4uIIbyNpF0jUOP6o3YUdoA15Gw5r
   craMU+XSjRWnLou/1PsAx90KOwz30SLUAlqoaLkg92t2CuqOPXyFiTFlV
   7G1wSDUugfE+T5wlGEzli62lXDk+s3gkBi4th/IuesLSYKPoA6ZrViQnh
   UfLXYpkgXCDV29H0Y9H56y3GeOvQxufNSYp0IiZGJaVD4pJmd0MJKfeco
   11/TUYKBAP0rN7lFSeUs/EwXoQrQb9YTHw7TxpxJj+FxfMV1bdskCjjZ/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431181780"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="431181780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 15:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="25973550"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 15:41:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPt3l-0001MT-1C;
	Tue, 16 Jan 2024 23:41:33 +0000
Date: Wed, 17 Jan 2024 07:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:master 7/8] kernel/sched/fair.c:9769: warning: Function
 parameter or struct member 'sd' not described in '_sched_asym'
Message-ID: <202401170738.dCIK1Ssb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git master
head:   2669828cf33eb2f62d8b52a1c1e73fa03d921498
commit: 897ed5bd9fb059d29348b23ed4ccfeb790fe503c [7/8] sched/fair: add a func _sched_asym
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240117/202401170738.dCIK1Ssb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170738.dCIK1Ssb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170738.dCIK1Ssb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:9769: warning: Function parameter or struct member 'sd' not described in '_sched_asym'
>> kernel/sched/fair.c:9769: warning: Function parameter or struct member 'dst_cpu' not described in '_sched_asym'
>> kernel/sched/fair.c:9769: warning: Function parameter or struct member 'repl_cpu' not described in '_sched_asym'
>> kernel/sched/fair.c:9769: warning: expecting prototype for sched_asym(). Prototype was for _sched_asym() instead


vim +9769 kernel/sched/fair.c

eefefa716c9fa6 Ricardo Neri   2023-04-06  9747  
4006a72bdd93b1 Ricardo Neri   2021-09-10  9748  /**
c9ca07886aaa40 Ricardo Neri   2023-04-06  9749   * sched_asym - Check if the destination CPU can do asym_packing load balance
c9ca07886aaa40 Ricardo Neri   2023-04-06  9750   * @env:	The load balancing environment
4006a72bdd93b1 Ricardo Neri   2021-09-10  9751   * @sgs:	Load-balancing statistics of the candidate busiest group
c9ca07886aaa40 Ricardo Neri   2023-04-06  9752   * @group:	The candidate busiest group
4006a72bdd93b1 Ricardo Neri   2021-09-10  9753   *
c9ca07886aaa40 Ricardo Neri   2023-04-06  9754   * @env::dst_cpu can do asym_packing if it has higher priority than the
c9ca07886aaa40 Ricardo Neri   2023-04-06  9755   * preferred CPU of @group.
4006a72bdd93b1 Ricardo Neri   2021-09-10  9756   *
c9ca07886aaa40 Ricardo Neri   2023-04-06  9757   * SMT is a special case. If we are balancing load between cores, @env::dst_cpu
c9ca07886aaa40 Ricardo Neri   2023-04-06  9758   * can do asym_packing balance only if all its SMT siblings are idle. Also, it
c9ca07886aaa40 Ricardo Neri   2023-04-06  9759   * can only do it if @group is an SMT group and has exactly on busy CPU. Larger
c9ca07886aaa40 Ricardo Neri   2023-04-06  9760   * imbalances in the number of CPUS are dealt with in find_busiest_group().
eefefa716c9fa6 Ricardo Neri   2023-04-06  9761   *
f577cd57bfaa88 Peter Zijlstra 2023-07-12  9762   * If we are balancing load within an SMT core, or at PKG domain level, always
c9ca07886aaa40 Ricardo Neri   2023-04-06  9763   * proceed.
4006a72bdd93b1 Ricardo Neri   2021-09-10  9764   *
c9ca07886aaa40 Ricardo Neri   2023-04-06  9765   * Return: true if @env::dst_cpu can do with asym_packing load balance. False
c9ca07886aaa40 Ricardo Neri   2023-04-06  9766   * otherwise.
ef7657d4d2d6a8 Ricardo Neri   2023-04-06  9767   */
897ed5bd9fb059 Alex Shi       2024-01-16  9768  static inline bool _sched_asym(sched_domain *sd, int dst_cpu, int repl_cpu)
aafc917a3c31dc Ricardo Neri   2021-09-10 @9769  {
eefefa716c9fa6 Ricardo Neri   2023-04-06  9770  	/* Ensure that the whole local core is idle, if applicable. */
897ed5bd9fb059 Alex Shi       2024-01-16  9771  	return sched_use_asym_prio(sd, dst_cpu) &&
897ed5bd9fb059 Alex Shi       2024-01-16  9772  			sched_asym_prefer(dst_cpu, repl_cpu);
897ed5bd9fb059 Alex Shi       2024-01-16  9773  }
eefefa716c9fa6 Ricardo Neri   2023-04-06  9774  

:::::: The code at line 9769 was first introduced by commit
:::::: aafc917a3c31dcc76cb0279cd7617dda11b15f2a sched/fair: Carve out logic to mark a group for asymmetric packing

:::::: TO: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
