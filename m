Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA25158B1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570920; cv=none; b=kl/UdV4craI3coxPA9ZLamDrRtdPk0YSvWHP/8yaoZkhlcegvT7rWMHlKzet9xWV5HZViQFCBIHxyVH9AN4752FAjFBn3C/u9NFLsrzdDI3g2IQfz4j/qimLA8RI6NCNEvn20yLGKVTMKmjbxJc/ItOavd26QgrcQcH9uHYv5yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570920; c=relaxed/simple;
	bh=jfZbDVnQSK4bJ9h5w104isLsWhfxKr6wLm64glIf6NU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kIvsr4xG9ei7AZ3svwp194HhBFJtmeXFHe9w+0NzNI7kWba0lVv5QIlbyU4aqm8/dipV87DXAKjMtb9DU4Tt+FeqPDkFZU9DJoQrWbopxS/j0LhpsoM8mOA9BUpKrJ7mUKBOgH5pMdarzEVL6FwqzSM3IbVR3Ew2ZTqbirJurOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9TTGgHR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9TTGgHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791570916; x=1823106916;
  h=date:from:to:cc:subject:message-id;
  bh=jfZbDVnQSK4bJ9h5w104isLsWhfxKr6wLm64glIf6NU=;
  b=N9TTGgHRuiymXJufevX8bKWZBw+sjzdqkelqbNSo4DAeEKHmLtXEQRvd
   Fbc0siEFQT+mNQvuQKmhWQiABliP8BnozdjFi4Iohz5SjwaHg3gveeZZB
   ZGBYI08cq70Iv/5DW7wshBOgR1+WDjPn3FrG+IkkSdEghhukVHP+LmHMX
   zzYCn9VQK1X0rp3bAXXe2InTtihgMvLlQLRkmuR8ZXtG05CMCD5LrHTnH
   osRHuWjhq63Re+JSa0XxTjVI+xA4fVdQssg9nvHjf1+pMaGozG+w4jceW
   g/1DS988DblAlMdeLmGEGYh3OLA2uuxDYOu+joh9zma74gL+6E0Pd/oGk
   A==;
X-CSE-ConnectionGUID: P/He+jnDTUijBJxnUq7xHg==
X-CSE-MsgGUID: vNrvb5EWQiaC4oUi8zt/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="276509"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="276509"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 11:35:15 -0700
X-CSE-ConnectionGUID: bAj5kBLYQUK/0giwArmMhg==
X-CSE-MsgGUID: s6hWR9cDQLCM9vuna/WPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2215932"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 09 Oct 2026 11:35:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFFR1-000000007F1-3MdK;
	Fri, 09 Oct 2026 18:35:11 +0000
Date: Fri, 09 Oct 2026 20:34:44 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/2]
 arch/x86/kernel/cpu/mtrr/mtrr.c:178:64: error: passing argument 3 of
 'stop_machine_cpuslocked' from incompatible pointer type
Message-ID: <202610092006.2b5UM7Re-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   ef852f3cb44950ae7ca8efd1eb384c8a36367a38
commit: 370a49ead30e94bf8e92ed3415ba86be14b8b292 [1/2] stop_machine: Add post function to execute while other CPUs can exit
config: x86_64-randconfig-2300-20261009 (https://download.01.org/0day-ci/archive/20261009/202610092006.2b5UM7Re-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610092006.2b5UM7Re-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092006.2b5UM7Re-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mtrr/mtrr.c: In function 'set_mtrr':
>> arch/x86/kernel/cpu/mtrr/mtrr.c:178:64: error: passing argument 3 of 'stop_machine_cpuslocked' from incompatible pointer type [-Wincompatible-pointer-types]
     178 |         stop_machine_cpuslocked(mtrr_rendezvous_handler, NULL, &data,
         |                                                                ^~~~~
         |                                                                |
         |                                                                struct set_mtrr_data *
   In file included from arch/x86/kernel/cpu/mtrr/mtrr.c:23:
   include/linux/stop_machine.h:167:65: note: expected 'const struct cpumask *' but argument is of type 'struct set_mtrr_data *'
     167 |                                           const struct cpumask *cpus)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/x86/kernel/cpu/mtrr/mtrr.c:178:9: error: too many arguments to function 'stop_machine_cpuslocked'
     178 |         stop_machine_cpuslocked(mtrr_rendezvous_handler, NULL, &data,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stop_machine.h:166:28: note: declared here
     166 | static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, void *data,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/stop_machine_cpuslocked +178 arch/x86/kernel/cpu/mtrr/mtrr.c

   134	
   135	/**
   136	 * set_mtrr - update mtrrs on all processors
   137	 * @reg:	mtrr in question
   138	 * @base:	mtrr base
   139	 * @size:	mtrr size
   140	 * @type:	mtrr type
   141	 *
   142	 * This is kinda tricky, but fortunately, Intel spelled it out for us cleanly:
   143	 *
   144	 * 1. Queue work to do the following on all processors:
   145	 * 2. Disable Interrupts
   146	 * 3. Wait for all procs to do so
   147	 * 4. Enter no-fill cache mode
   148	 * 5. Flush caches
   149	 * 6. Clear PGE bit
   150	 * 7. Flush all TLBs
   151	 * 8. Disable all range registers
   152	 * 9. Update the MTRRs
   153	 * 10. Enable all range registers
   154	 * 11. Flush all TLBs and caches again
   155	 * 12. Enter normal cache mode and reenable caching
   156	 * 13. Set PGE
   157	 * 14. Wait for buddies to catch up
   158	 * 15. Enable interrupts.
   159	 *
   160	 * What does that mean for us? Well, stop_machine() will ensure that
   161	 * the rendezvous handler is started on each CPU. And in lockstep they
   162	 * do the state transition of disabling interrupts, updating MTRR's
   163	 * (the CPU vendors may each do it differently, so we call mtrr_if->set()
   164	 * callback and let them take care of it.) and enabling interrupts.
   165	 *
   166	 * Note that the mechanism is the same for UP systems, too; all the SMP stuff
   167	 * becomes nops.
   168	 */
   169	static void set_mtrr(unsigned int reg, unsigned long base, unsigned long size,
   170			     mtrr_type type)
   171	{
   172		struct set_mtrr_data data = { .smp_reg = reg,
   173					      .smp_base = base,
   174					      .smp_size = size,
   175					      .smp_type = type
   176					    };
   177	
 > 178		stop_machine_cpuslocked(mtrr_rendezvous_handler, NULL, &data,
   179					cpu_online_mask);
   180	
   181		generic_rebuild_map();
   182	}
   183	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
