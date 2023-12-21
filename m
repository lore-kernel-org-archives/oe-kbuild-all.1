Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D2520317
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Dec 2023 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVUY+FBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703187778; x=1734723778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsAQLGNZnIMKHCJURGx5LaLjG73WWJxEJ/9JQvfEjF4=;
  b=eVUY+FBwQiX4YGnlM/QGmkUR0+tWPYpfkjYlDKZwtMA4GhXWajWwQNyO
   Xu6CHtvC1spZnt6NL+EyaLoF1Ce0FbpJTw8G8PoPOJB8oBmHEVbT/E8OS
   0Kki1mn3Sm1Sh12zVBXhsuVlkK7ky4TKQjdPmwnmMAEAEMSKt5W5w8GZc
   KYUWgQQIWkHnKcq6orQ/7flpXGf4rBVWHftRJMaLi8vE6/mqWw66ggMLd
   n0MjZXddHvRa9h5/AsutbsX50CQnMvB9oaTfXVyKGeAXhIcGguEFUXnYO
   eXTe34rhsqORE5rpBaM3c1d5BSNW+OXzuBZIO4GUiWq9Rwy3+NA6jhwxU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="398810986"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="398810986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 11:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="811090553"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="811090553"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Dec 2023 11:42:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGOwV-0008f7-2D;
	Thu, 21 Dec 2023 19:42:53 +0000
Date: Fri, 22 Dec 2023 03:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.7-rc2 46/110] include/linux/resctrl.h:291:
 undefined reference to `lockdep_is_cpus_held'
Message-ID: <202312220309.YiWk3bZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.7-rc2
head:   b530deed244d9b45f3bce3cccde91f6ed0ebf7ea
commit: ffd2335a26f1fc7f1ce70d260728885c5fda89a8 [46/110] x86/resctrl: Claim get_domain_from_cpu() for resctrl
config: i386-randconfig-012-20231221 (https://download.01.org/0day-ci/archive/20231222/202312220309.YiWk3bZq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231222/202312220309.YiWk3bZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220309.YiWk3bZq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `resctrl_get_domain_from_cpu':
>> include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/rdtgroup.o: in function `resctrl_get_domain_from_cpu':
>> include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/monitor.o: in function `resctrl_get_domain_from_cpu':
>> include/linux/resctrl.h:291: undefined reference to `lockdep_is_cpus_held'


vim +291 include/linux/resctrl.h

   274	
   275	/*
   276	 * Caller must be in a RCU read-side critical section, or hold the
   277	 * cpuhp read lock to prevent the struct rdt_domain being freed.
   278	 */
   279	static inline struct rdt_domain *
   280	resctrl_get_domain_from_cpu(int cpu, struct rdt_resource *r)
   281	{
   282		struct rdt_domain *d;
   283	
   284		/*
   285		 * Walking r->domains, ensure it can't race with cpuhp.
   286		 * Because this is called via IPI by rdt_ctrl_update(), assertions
   287		 * about locks this thread holds will lead to false positives. Check
   288		 * someone is holding the CPUs lock.
   289		 */
   290		if (IS_ENABLED(CONFIG_LOCKDEP))
 > 291			lockdep_is_cpus_held();
   292	
   293		list_for_each_entry_rcu(d, &r->domains, list) {
   294			/* Find the domain that contains this CPU */
   295			if (cpumask_test_cpu(cpu, &d->cpu_mask))
   296				return d;
   297		}
   298	
   299		return NULL;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
