Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFB3BE49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705450479; cv=none; b=qIDOrj4bC6PTPSObdiIemwokp9NLRkvwqZfo+aakiLmTXifj40guZ5R6MggrrHbo7P0+tTJaDkuKHlaYdiosaRmlCOklx/83kv9lnMv79cQctHvPZkMVXPX5hZD4rG/efJX0DNz6M91epZGIWblnKMemimTLFq9/Jv8U5nOBTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705450479; c=relaxed/simple;
	bh=3Zw2X9nxtfnqIz/p0XB1ubV4t0bIvxRx/y1svr7ip54=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=IYYBUOOIdXKtQenXnI/tsKzVhprYzdiHWttrNj0+I1p+F4MFb8rJGSTp9w/UNnz0cJZFmCcABSnAHWhMgsz7gTxcY5xHcIMesXvq2uzDYXWy0nitBw1UGm2GLuXMLpSWf8nCCyiSC3AgQLYXe4oeXCRh4MRRt+bRizowrH5bb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHVzGV1s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHVzGV1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705450477; x=1736986477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Zw2X9nxtfnqIz/p0XB1ubV4t0bIvxRx/y1svr7ip54=;
  b=oHVzGV1stwWej6/bGib40M7dmQeUBzOFQl9kuypfEsCsg9UpDKdgGF5Y
   GXEvUBkLI8nEbJUYN7NxA6kQpVIk5RyHU+1d2PU7DHAFVyp+g+vExd+DB
   c3j55w160ID/bSnxbB1NZGDdTgY03RZOnNtT3cXFSFNYTSZgc6LZQvZ61
   yF7Pl7v4DE69d/qhdJSTKnJKqn3BD/ox816PCAc9WEo7iok+IQhzxoo/4
   Xe1hfXM+WcV0IUorfGCVdKivuyWxTvDqYNaPXmvCXdLQACEaoKVBKkRqB
   49xRAwMdEMXZVEdo3H26cmHKMlIU9GrIZGccGh7CAXH7Bu1nU+m2ErQlf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6736907"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6736907"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 16:14:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927670021"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="927670021"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2024 16:14:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPtZh-0001Nq-37;
	Wed, 17 Jan 2024 00:14:33 +0000
Date: Wed, 17 Jan 2024 08:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:master 7/8] kernel/sched/fair.c:9768:32: error: unknown
 type name 'sched_domain'; did you mean 'sched_domain_mask_f'?
Message-ID: <202401170859.ZvmCANPD-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240117/202401170859.ZvmCANPD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170859.ZvmCANPD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170859.ZvmCANPD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:9768:32: error: unknown type name 'sched_domain'; did you mean 'sched_domain_mask_f'?
    9768 | static inline bool _sched_asym(sched_domain *sd, int dst_cpu, int repl_cpu)
         |                                ^~~~~~~~~~~~
         |                                sched_domain_mask_f
   kernel/sched/fair.c: In function 'sched_asym':
>> kernel/sched/fair.c:9784:17: error: implicit declaration of function '_sched_asym'; did you mean 'sched_asym'? [-Werror=implicit-function-declaration]
    9784 |                 _sched_asym(env->sd, env->dst_cpu, group->asym_prefer_cpu);
         |                 ^~~~~~~~~~~
         |                 sched_asym
   cc1: some warnings being treated as errors


vim +9768 kernel/sched/fair.c

  9747	
  9748	/**
  9749	 * sched_asym - Check if the destination CPU can do asym_packing load balance
  9750	 * @env:	The load balancing environment
  9751	 * @sgs:	Load-balancing statistics of the candidate busiest group
  9752	 * @group:	The candidate busiest group
  9753	 *
  9754	 * @env::dst_cpu can do asym_packing if it has higher priority than the
  9755	 * preferred CPU of @group.
  9756	 *
  9757	 * SMT is a special case. If we are balancing load between cores, @env::dst_cpu
  9758	 * can do asym_packing balance only if all its SMT siblings are idle. Also, it
  9759	 * can only do it if @group is an SMT group and has exactly on busy CPU. Larger
  9760	 * imbalances in the number of CPUS are dealt with in find_busiest_group().
  9761	 *
  9762	 * If we are balancing load within an SMT core, or at PKG domain level, always
  9763	 * proceed.
  9764	 *
  9765	 * Return: true if @env::dst_cpu can do with asym_packing load balance. False
  9766	 * otherwise.
  9767	 */
> 9768	static inline bool _sched_asym(sched_domain *sd, int dst_cpu, int repl_cpu)
  9769	{
  9770		/* Ensure that the whole local core is idle, if applicable. */
  9771		return sched_use_asym_prio(sd, dst_cpu) &&
  9772				sched_asym_prefer(dst_cpu, repl_cpu);
  9773	}
  9774	
  9775	static inline bool
  9776	sched_asym(struct lb_env *env, struct sg_lb_stats *sgs, struct sched_group *group)
  9777	{
  9778		/*
  9779		 * CPU priorities does not make sense for SMT cores with more than one
  9780		 * busy sibling.
  9781		 */
  9782		return !(group->flags & SD_SHARE_CPUCAPACITY &&
  9783				sgs->group_weight - sgs->idle_cpus != 1) &&
> 9784			_sched_asym(env->sd, env->dst_cpu, group->asym_prefer_cpu);
  9785	}
  9786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
