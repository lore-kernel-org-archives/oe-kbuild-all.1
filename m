Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB84D5B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707776405; cv=none; b=hAPJAjGM2haftUWygn5Im6qa6UB+PsU8pHQNgZ+RP7W0wSrCZ+KKBFBvF2C6l8x49BwlvZzMwQcxtgTCy+tVisf59kja+98wUoxzbjHobsrT2bTwP9k+OEbhpxHfI91f3q0zu6ef7d4yD0U0kEy7hbBZSNs88peBTeJd4LWpkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707776405; c=relaxed/simple;
	bh=OKc5Fo0XeOFgeqtXV2OfxX3rmCu3XLNuQpAaSKSjdfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZgv4q3uJ4mS02Sas8T7bJmtKP2AKn77+P6r0EDFmC1HSvvTNuxpzJDUwbYPqAI5sJl1hAjvqIlsI7i8RjE1VMf24QRDiseKQx7BhZLOdiAmQ5773oRwXDraZi9xlWQJqvH5mDLp51iEmxG1ZS4/m+aTs0arU0SElr64s4Xm6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKPdblFX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKPdblFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707776404; x=1739312404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKc5Fo0XeOFgeqtXV2OfxX3rmCu3XLNuQpAaSKSjdfc=;
  b=QKPdblFXfzc7VzJluvNLNkwGvWBeQcf4xgiQ4GRuziJJmqyrxgPfCdX5
   Ddfx4dI3SvgizQcuhCjgmxoTLepnYpuQrdl1u/ZBYX1uq1YVk2s00TS8s
   LZ2ivhxqbRXCDYgcQyo5RtLRgpJWmybY4rx2Yn535hkTIPRaljdvDvqRG
   ROTu8r89d+L6jfeQ+BsHfCanuyrpBgHTKoII8TpEynLqpRaf3ocKqYuV0
   FP42fzTIi4CXMEe3DGiYg7bOynZnqZffLcEd6ovbSiyIgQW7aE3KhDfrk
   yR6ELKh6MXMtPAXQuyecWteAkuQ7//hQ0e4j6/R+/dh8Wey+P/uZcbF3e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19186393"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="19186393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 14:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7338857"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2024 14:20:00 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZeec-0007OI-0Y;
	Mon, 12 Feb 2024 22:19:58 +0000
Date: Tue, 13 Feb 2024 06:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>
Subject: [linux-next:master 4687/6082] kernel/power/energy_model.c:247:45:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202402130633.bfNCWVeh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae00c445390b349e070a64dc62f08aa878db7248
commit: 977230d5d50314f9920d3ee6348773d8babbfb58 [4687/6082] PM: EM: Introduce em_dev_update_perf_domain() for EM updates
config: x86_64-randconfig-122-20240211 (https://download.01.org/0day-ci/archive/20240213/202402130633.bfNCWVeh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402130633.bfNCWVeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402130633.bfNCWVeh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:113:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:113:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:113:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:114:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:114:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:114:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:122:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:122:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:124:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:124:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:124:19: sparse:     got struct callback_head [noderef] __rcu *
   kernel/power/energy_model.c:135:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:135:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:135:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:153:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:153:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:153:15: sparse:     got void *
   kernel/power/energy_model.c:157:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:157:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:157:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:242:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:242:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:242:19: sparse:     got struct kref [noderef] __rcu *
>> kernel/power/energy_model.c:247:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:247:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:247:45: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:267:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:267:9: sparse:     expected void const *
   kernel/power/energy_model.c:267:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:267:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:267:9: sparse:     expected void const *
   kernel/power/energy_model.c:267:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:267:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:267:9: sparse:     expected void *p
   kernel/power/energy_model.c:267:9: sparse:     got struct em_perf_state [noderef] __rcu *

vim +247 kernel/power/energy_model.c

   137	
   138	/**
   139	 * em_table_alloc() - Allocate a new EM table
   140	 * @pd		: EM performance domain for which this must be done
   141	 *
   142	 * Allocate a new EM table and initialize its kref to indicate that it
   143	 * has a user.
   144	 * Returns allocated table or NULL.
   145	 */
   146	struct em_perf_table __rcu *em_table_alloc(struct em_perf_domain *pd)
   147	{
   148		struct em_perf_table __rcu *table;
   149		int table_size;
   150	
   151		table_size = sizeof(struct em_perf_state) * pd->nr_perf_states;
   152	
 > 153		table = kzalloc(sizeof(*table) + table_size, GFP_KERNEL);
   154		if (!table)
   155			return NULL;
   156	
   157		kref_init(&table->kref);
   158	
   159		return table;
   160	}
   161	
   162	static int em_compute_costs(struct device *dev, struct em_perf_state *table,
   163				    struct em_data_callback *cb, int nr_states,
   164				    unsigned long flags)
   165	{
   166		unsigned long prev_cost = ULONG_MAX;
   167		u64 fmax;
   168		int i, ret;
   169	
   170		/* Compute the cost of each performance state. */
   171		fmax = (u64) table[nr_states - 1].frequency;
   172		for (i = nr_states - 1; i >= 0; i--) {
   173			unsigned long power_res, cost;
   174	
   175			if ((flags & EM_PERF_DOMAIN_ARTIFICIAL) && cb->get_cost) {
   176				ret = cb->get_cost(dev, table[i].frequency, &cost);
   177				if (ret || !cost || cost > EM_MAX_POWER) {
   178					dev_err(dev, "EM: invalid cost %lu %d\n",
   179						cost, ret);
   180					return -EINVAL;
   181				}
   182			} else {
   183				power_res = table[i].power;
   184				cost = div64_u64(fmax * power_res, table[i].frequency);
   185			}
   186	
   187			table[i].cost = cost;
   188	
   189			if (table[i].cost >= prev_cost) {
   190				table[i].flags = EM_PERF_STATE_INEFFICIENT;
   191				dev_dbg(dev, "EM: OPP:%lu is inefficient\n",
   192					table[i].frequency);
   193			} else {
   194				prev_cost = table[i].cost;
   195			}
   196		}
   197	
   198		return 0;
   199	}
   200	
   201	static int em_allocate_perf_table(struct em_perf_domain *pd,
   202					  int nr_states)
   203	{
   204		pd->table = kcalloc(nr_states, sizeof(struct em_perf_state),
   205				    GFP_KERNEL);
   206		if (!pd->table)
   207			return -ENOMEM;
   208	
   209		return 0;
   210	}
   211	
   212	/**
   213	 * em_dev_update_perf_domain() - Update runtime EM table for a device
   214	 * @dev		: Device for which the EM is to be updated
   215	 * @new_table	: The new EM table that is going to be used from now
   216	 *
   217	 * Update EM runtime modifiable table for the @dev using the provided @table.
   218	 *
   219	 * This function uses a mutex to serialize writers, so it must not be called
   220	 * from a non-sleeping context.
   221	 *
   222	 * Return 0 on success or an error code on failure.
   223	 */
   224	int em_dev_update_perf_domain(struct device *dev,
   225				      struct em_perf_table __rcu *new_table)
   226	{
   227		struct em_perf_table __rcu *old_table;
   228		struct em_perf_domain *pd;
   229	
   230		if (!dev)
   231			return -EINVAL;
   232	
   233		/* Serialize update/unregister or concurrent updates */
   234		mutex_lock(&em_pd_mutex);
   235	
   236		if (!dev->em_pd) {
   237			mutex_unlock(&em_pd_mutex);
   238			return -EINVAL;
   239		}
   240		pd = dev->em_pd;
   241	
   242		kref_get(&new_table->kref);
   243	
   244		old_table = pd->em_table;
   245		rcu_assign_pointer(pd->em_table, new_table);
   246	
 > 247		em_cpufreq_update_efficiencies(dev, new_table->state);
   248	
   249		em_table_free(old_table);
   250	
   251		mutex_unlock(&em_pd_mutex);
   252		return 0;
   253	}
   254	EXPORT_SYMBOL_GPL(em_dev_update_perf_domain);
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
