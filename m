Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97C353ED7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160353; cv=none; b=N2YSmPM5oVEdCNdQZNgxbb+HKfDG2m8WoLuni8zv4egx6vv3VGvkkjgMdTL1AVqajfDmUPW4IbY+vvxRuHxfVtoTarywOYG6m2ACoqP7SQ14JuTvJA3Y2ECSGc5lpVvV3ZyND590ZypWYY+8Xu0zbohRU3Pm7FfEdzIkqtyP2nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160353; c=relaxed/simple;
	bh=nZMmrQF506mmGcgbTW6IBw6ESdd4aYCgv8ylm7pg2HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxwRZy3SsA4JJ8UDzfloW25YIKlh9iO9xOazjETsf3iwW9327G6OZdIcnYWGby61kVW8MvRj2diybH3kNnnnWT7+PRBNdJDaZ9KWXHvF5xadWoMk7SGHBbjBQ2TGuti0GXbpfFT3i5xLsoItvTMbHCtuAi/9n35Ri/12SIUFZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJMmfuC1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJMmfuC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769160349; x=1800696349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZMmrQF506mmGcgbTW6IBw6ESdd4aYCgv8ylm7pg2HU=;
  b=OJMmfuC1XZ6d9tQGQyNn2CRIwfYFJTqPus8YIpXM3kjAHW1XiRcfeJQZ
   P6b4U+dPCee0lcLnME0IUsRPb0RgEwxusWEIjOBjXCE18BAvUgES5DyGq
   8rgmLpHC9IaUgYnyfT+YVTqqmGTEpRkEe4kwL8vdWWAY6FxM8mfnBFjPk
   xRvhJMEw809N7M+ygbWdXWSRlIEvmoIyXhmNHl2dhum+frwVSK3mQeabB
   9N7AK5GcIg8YjSurKs4hPk456WAFDNgYiFEVRIT5daXolorAAo6qrKcT2
   MQ9K/+4Qw2VHXf13v//JdkFXpGLwhkJDjuukyzZhXRZCV+k4p8rDG+tet
   A==;
X-CSE-ConnectionGUID: b5rVRsSgRzqLQZyHSYnhKw==
X-CSE-MsgGUID: A11131u3SkCp3LKDrnwLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="74044352"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74044352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 01:25:47 -0800
X-CSE-ConnectionGUID: g2gvRI1FQymwQm4FEa2gxA==
X-CSE-MsgGUID: ip+6azuIQMKg3JxxxVjyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244595213"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 01:25:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjDQD-00000000Tks-0bbX;
	Fri, 23 Jan 2026 09:25:41 +0000
Date: Fri, 23 Jan 2026 17:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, rafael@kernel.org, dakr@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pavel@kernel.org, lenb@kernel.org,
	neelx@suse.com, atomlin@atomlin.com, sean@ashe.io,
	mproche@gmail.com, chjohnst@gmail.com, nick.lange@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] PM: QoS: Introduce boot parameter
 pm_qos_resume_latency_us
Message-ID: <202601231700.admSdObE-lkp@intel.com>
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
config: arm64-randconfig-r072-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231700.admSdObE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231700.admSdObE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231700.admSdObE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/power/qos.c: In function 'init_pm_qos_latency_us_setup':
>> kernel/power/qos.c:268:6: error: 'boot_option_idle_override' undeclared (first use in this function)
     if (boot_option_idle_override == IDLE_POLL) {
         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/power/qos.c:268:6: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/power/qos.c:268:35: error: 'IDLE_POLL' undeclared (first use in this function); did you mean 'SIL_POLL'?
     if (boot_option_idle_override == IDLE_POLL) {
                                      ^~~~~~~~~
                                      SIL_POLL


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
