Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F437DEAA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205784; cv=none; b=W7EkUlR8UeG4TJOWfXn4zOBbXCJziALHtkikCOK+Z7oeWmtM7hpdw1CP9XUG3jvqsSvTCxLQIk0IxVnzyYXZsqlEubpNTMQ6S0pJMlCy6FFgknXBY95duYtgSpqKYmgyF5Q35Y/alAuqjhdMoruDv9ZXl6siGTCbb7WXUU4b3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205784; c=relaxed/simple;
	bh=3KslAifDDlEjhU26F5rCjOdbH+r+PwgCtaJUVNMNprU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJNDt7zLTtb2CujVHpsGhTo3r8Oar5XPDAGqvArXtvghcGGp37pIRBTxjC6tcaVbSDIn+ZqTulxAosfjvfniYQ6aijgetlyQxdHm5gGUEmobiHBwO70bsGxL6gkM96pYO+VWZ9ofAGZXtmlXT8dLaBZ/BLPtO1xb0B0N8qzeyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy6BF1nU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy6BF1nU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205782; x=1806741782;
  h=date:from:to:cc:subject:message-id;
  bh=3KslAifDDlEjhU26F5rCjOdbH+r+PwgCtaJUVNMNprU=;
  b=Oy6BF1nUv27lfL36qurEkBT9DUtXz8qUoeU9QsVE2golKj2QhaaImLJa
   4oCmWt+tsJwdVqt02X+cZBeGLSHDXEfvlPFZhJed4/qJWk95w35K7v4JB
   tngJRqK9z8NjV3zfPfM+Fdrn3O0gzREmyo16wb0+PM2CdplOhYNB2m1Rg
   zSlFEpIAC78g483PNDLr+HZjK6iCcE/fpFy2FHa/Lnv268t+qFEgGo/AN
   9y53XlRGec6gyTMG2Ww4uY413/cKfsicYvl/jHzM0m7+KV8bC/wJpHlTj
   gUpnl2Iq4M/Bf+Q6K+kIXoSpByjvfi4x/3Ykmb/K/PGcIW4OQH9ch8VLm
   g==;
X-CSE-ConnectionGUID: cueqkE/9SLuTQRswMDjIGQ==
X-CSE-MsgGUID: K0bl4zkcQH2VQqxMu7WQ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311894"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311894"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: 3KyphI/nT7mqBbBqb3kQfA==
X-CSE-MsgGUID: KbEsJ3jhTeCKr1b30pAg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286602"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013m-2LW8;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-wq:for-7.1 14/18] kernel/workqueue.c:8289:34: warning:
 array subscript 1 is above array bounds of 'int[1]'
Message-ID: <202604022343.GQtkF2vO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.1
head:   41e3ccca00b374b7f39cf68e818b59a921cd7069
commit: 5920d046f7ae3bf9cf51b9d915c1fff13d299d84 [14/18] workqueue: add WQ_AFFN_CACHE_SHARD affinity scope
config: nios2-randconfig-001-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022343.GQtkF2vO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022343.GQtkF2vO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022343.GQtkF2vO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'workqueue_init_topology':
>> kernel/workqueue.c:8289:34: warning: array subscript 1 is above array bounds of 'int[1]' [-Warray-bounds]
       cpu_shard_id[c] = cpu_shard_id[cpumask_first(sibling_cpus)];
                         ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +8289 kernel/workqueue.c

  8251	
  8252	/**
  8253	 * llc_populate_cpu_shard_id - populate cpu_shard_id[] for each CPU in an LLC pod
  8254	 * @pod_cpus:  the cpumask of CPUs in the LLC pod
  8255	 * @smt_pods:  the SMT pod type, used to identify sibling groups
  8256	 * @nr_cores:  number of distinct cores in @pod_cpus (from llc_count_cores())
  8257	 *
  8258	 * Walks @pod_cpus in order. At each SMT group leader, advances to the next
  8259	 * shard once the current shard is full. Results are written to cpu_shard_id[].
  8260	 */
  8261	static void __init llc_populate_cpu_shard_id(const struct cpumask *pod_cpus,
  8262						     struct wq_pod_type *smt_pods,
  8263						     int nr_cores)
  8264	{
  8265		struct llc_shard_layout layout = llc_calc_shard_layout(nr_cores);
  8266		const struct cpumask *sibling_cpus;
  8267		/* Count the number of cores in the current shard_id */
  8268		int cores_in_shard = 0;
  8269		/* This is a cursor for the shards. Go from zero to nr_shards - 1*/
  8270		int shard_id = 0;
  8271		int c;
  8272	
  8273		/* Iterate at every CPU for a given LLC pod, and assign it a shard */
  8274		for_each_cpu(c, pod_cpus) {
  8275			sibling_cpus = smt_pods->pod_cpus[smt_pods->cpu_pod[c]];
  8276			if (cpumask_first(sibling_cpus) == c) {
  8277				/* This is the CPU leader for the siblings */
  8278				if (llc_shard_is_full(cores_in_shard, shard_id, &layout)) {
  8279					shard_id++;
  8280					cores_in_shard = 0;
  8281				}
  8282				cores_in_shard++;
  8283				cpu_shard_id[c] = shard_id;
  8284			} else {
  8285				/*
  8286				 * The siblings' shard MUST be the same as the leader.
  8287				 * never split threads in the same core.
  8288				 */
> 8289				cpu_shard_id[c] = cpu_shard_id[cpumask_first(sibling_cpus)];
  8290			}
  8291		}
  8292	
  8293		WARN_ON_ONCE(shard_id != (layout.nr_shards - 1));
  8294	}
  8295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
