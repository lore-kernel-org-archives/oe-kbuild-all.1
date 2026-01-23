Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380753168F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162882; cv=none; b=XRv4tXE10Jvt3gHh82tYKXQscwrn8/o31/6zuXERMCy7T368Q+dPkbZWFPLHEY5SuoEFU1lEQTXm+4bxyPFq8ShUVgal6fg0H72L+aIJt4+aXzBsbKz0gXT3n6AZE21JqFomJTKkC5zx1lEAr8EdQlQCogCMv0qqasJf/hs8ujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162882; c=relaxed/simple;
	bh=ghTcNLKkvfg7ynxGKqqcXZDiqJKojuOqqBBwoC5rNrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKIzXj4h6bW7qf/iwxe85XO0WzEUnv0uRV1raqA+Ew4mn5nyVis+ODA697WEBjjCKUSL9D9kRHOiU25sPNJeOnpkm1fwCJ6SqgQCdeb3V03wzk0nGNos15mOC+xW+RfoVA/YNazEsEP1oFriZoyhUPoJRnY0JCGTvQB46t6Wq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfdaeJdd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfdaeJdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769162871; x=1800698871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ghTcNLKkvfg7ynxGKqqcXZDiqJKojuOqqBBwoC5rNrQ=;
  b=TfdaeJddyGRpE/4odD7Ohgyu6yrysNx73DBqhar28gmyY9J0xXoJipYU
   tlNmKyIFE9Gh2bjtM/PSO3vwqMLTKXNKAaVijoDtvvGuYmXqvriTe5RmJ
   xFuMf/HHbdDD2oy5u+tAWBmKte5ikFSQarbd3pE++7GKdNnrwdJnL8gjh
   HYCde8Q1Buc1aBHgugAjepAWtb9BYFoN9F6vAEIPGB802fYtfI0bJmvLA
   20SekS0brCuSaRK5LPjia8RnzWb1B5ZvsMhaI04nDS/HGQC5yPUqJqvrb
   KrWtghUxvzMVrISk8YXZCrQml790eakAlp56BHYDxaAVaO14G4FWZogO7
   A==;
X-CSE-ConnectionGUID: IVhHxJ5gT9+dK3EXVSliwQ==
X-CSE-MsgGUID: CUs3GgaDRDaNeJtNV8rCPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70467466"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70467466"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 02:07:47 -0800
X-CSE-ConnectionGUID: 7l2D8T5tSm6G0d1m8WrMJg==
X-CSE-MsgGUID: JOI5GuIeT4SndfJqiv9R0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211113805"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2026 02:07:44 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjE4r-000000000gv-069v;
	Fri, 23 Jan 2026 10:07:41 +0000
Date: Fri, 23 Jan 2026 11:07:05 +0100
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, rafael@kernel.org, dakr@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org, lenb@kernel.org,
	neelx@suse.com, atomlin@atomlin.com, sean@ashe.io,
	mproche@gmail.com, chjohnst@gmail.com, nick.lange@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] PM: QoS: Introduce boot parameter
 pm_qos_resume_latency_us
Message-ID: <202601231132.HoRpyfUy-lkp@intel.com>
References: <20260123010024.3301276-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123010024.3301276-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master amd-pstate/linux-next amd-pstate/bleeding-edge v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/PM-QoS-Introduce-boot-parameter-pm_qos_resume_latency_us/20260123-090409
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20260123010024.3301276-1-atomlin%40atomlin.com
patch subject: [PATCH] PM: QoS: Introduce boot parameter pm_qos_resume_latency_us
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601231132.HoRpyfUy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231132.HoRpyfUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231132.HoRpyfUy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/power/qos.c:268:6: error: use of undeclared identifier 'boot_option_idle_override'
     268 |         if (boot_option_idle_override == IDLE_POLL) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/power/qos.c:268:35: error: use of undeclared identifier 'IDLE_POLL'; did you mean 'SIL_POLL'?
     268 |         if (boot_option_idle_override == IDLE_POLL) {
         |                                          ^~~~~~~~~
         |                                          SIL_POLL
   ./include/linux/signal.h:42:2: note: 'SIL_POLL' declared here
      42 |         SIL_POLL,
         |         ^
   kernel/power/qos.c:354:5: error: redefinition of 'pm_qos_get_boot_cpu_latency_limit'
     354 | s32 pm_qos_get_boot_cpu_latency_limit(unsigned int cpu)
         |     ^
   ./include/linux/pm_qos.h:222:19: note: previous definition is here
     222 | static inline s32 pm_qos_get_boot_cpu_latency_limit(unsigned int cpu)
         |                   ^
   3 errors generated.


vim +/boot_option_idle_override +268 kernel/power/qos.c

   245	
   246	/* init_pm_qos_latency_us_setup - Parse the pm_qos_latency_us boot parameter.
   247	 *
   248	 * Parses the kernel command line option "pm_qos_resume_latency_us=" to establish
   249	 * per-CPU resume latency constraints. These constraints are applied
   250	 * immediately when a CPU is registered.
   251	 *
   252	 * Syntax: pm_qos_resume_latency_us=<cpu-list>:<value>[,<cpu-list>:<value>...]
   253	 * Example: pm_qos_resume_latency_us=0-3:0,4-7:20
   254	 *
   255	 * The parsing logic enforces a "First Match Wins" policy. If a CPU is
   256	 * covered by multiple entries in the list, only the first valid entry
   257	 * applies. Any subsequent overlapping ranges for that CPU are ignored.
   258	 *
   259	 * Return: 0 on success, or a negative error code on failure.
   260	 */
   261	static int __init init_pm_qos_latency_us_setup(void)
   262	{
   263		char *token, *cmd = pm_qos_resume_latency_cmdline;
   264		struct pm_qos_boot_entry *entry, *tentry;
   265		cpumask_var_t covered;
   266		int ret;
   267	
 > 268		if (boot_option_idle_override == IDLE_POLL) {
   269			pr_warn("pm_qos: Cannot be used with idle=poll\n");
   270			return -EINVAL;
   271		}
   272	
   273		if (!zalloc_cpumask_var(&covered, GFP_KERNEL)) {
   274			pr_warn("pm_qos: Failed to allocate memory for parsing boot parameter\n");
   275			return -ENOMEM;
   276		}
   277	
   278		while ((token = strsep(&cmd, ",")) != NULL) {
   279			char *str_range, *str_val;
   280	
   281			str_range = strsep(&token, ":");
   282			str_val = token;
   283	
   284			if (!str_val) {
   285				pr_warn("pm_qos: Missing value range %s\n",
   286					str_range);
   287				continue;
   288			}
   289	
   290			entry = kzalloc(sizeof(*entry), GFP_KERNEL);
   291			if (!entry) {
   292				pr_warn("pm_qos: Failed to allocate memory for boot entry\n");
   293				goto cleanup;
   294			}
   295	
   296			if (cpulist_parse(str_range, &entry->mask)) {
   297				pr_warn("pm_qos: Failed to parse cpulist range %s\n",
   298					str_range);
   299				kfree(entry);
   300				continue;
   301			}
   302	
   303			cpumask_andnot(&entry->mask, &entry->mask, covered);
   304			if (cpumask_empty(&entry->mask)) {
   305				pr_warn("pm_qos: Entry %s already covered, ignoring\n",
   306					str_range);
   307				kfree(entry);
   308				continue;
   309			}
   310			cpumask_or(covered, covered, &entry->mask);
   311	
   312			if (kstrtos32(str_val, 0, &entry->latency)) {
   313				pr_warn("pm_qos: Invalid latency requirement value %s\n",
   314					str_val);
   315				kfree(entry);
   316				continue;
   317			}
   318	
   319			if (entry->latency < 0) {
   320				pr_warn("pm_qos: Latency requirement cannot be negative: %d\n",
   321					entry->latency);
   322				kfree(entry);
   323				continue;
   324			}
   325	
   326			list_add_tail(&entry->node, &pm_qos_boot_list);
   327		}
   328	
   329		free_cpumask_var(covered);
   330		return 0;
   331	
   332	cleanup:
   333		list_for_each_entry_safe(entry, tentry, &pm_qos_boot_list, node) {
   334			list_del(&entry->node);
   335			kfree(entry);
   336		}
   337	
   338		free_cpumask_var(covered);
   339		return ret;
   340	}
   341	early_initcall(init_pm_qos_latency_us_setup);
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
