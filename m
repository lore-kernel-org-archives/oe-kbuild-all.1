Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8CC2AE77
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 04:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728363397; cv=none; b=mtQDNDPKXXIYtCccZ0DebzvzCi7j46P5T9VxVAcgkqFaamo0A4FE2WSL3xNIGn3rXiTWOqdOSZ5qtBQ0vZCtLx33Aixc2FYXv3tHV+s8VEmtk+C/dpSvEqa9GCLAxJGgSjWmaQBIY4fyLgupb5WoPegDET9TEU8pkKiYG8xYpgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728363397; c=relaxed/simple;
	bh=u9fNn400oQNvDNsRlHhYAVnIxIAc1j0bTxTPEoNUy9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcNW/hxtIOoIZQ9gUb8nOHyJjghMsNjJBady3EJMq/oGclZDx5Au90WKkboHxoWvzlWlRnvVawlOH0SRQkqB+urq4Bo9cJ9tl4NWm0gnCK+wY8gaukjLzHJ+7oZ0R65wRER/eVjtI6mkjJYcU+N1ykDYqQustXO0DPpSuKgtdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikLqkhV/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikLqkhV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728363396; x=1759899396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u9fNn400oQNvDNsRlHhYAVnIxIAc1j0bTxTPEoNUy9c=;
  b=ikLqkhV/JJOWDRSmlX2q5KD0gKXE8Qnqbfqtc175lqrW61ISEhDuFU8X
   SBEhdoyS9G1KtjcmuU1YOzwiKfuKu/VOEPNr5oZxqwdKTgnmezx7lnoCH
   mtq0lJjmUBEXRK9/S5aDbWXBuJNbq/PGHVYzQcVYqNaDuvS+SYrNvwWfg
   asxQ7Pmt2HatYdbQ1KIwhsxaIOcgDnYldXQetYRi+/2FrzC7d8AS4YrNX
   v2bPH6CcUuQBFoe7vdAp+Cl9Mcgq816WX8nijA5zx+X3h/1AMUlWvwG8l
   b7BlPX0R7gtr84AZiO+U07HHvdDwPRTDK8d6hBFioeaLvXUVf+UCgfm0j
   Q==;
X-CSE-ConnectionGUID: cfYAsqd4RiO/kl8L59OOqQ==
X-CSE-MsgGUID: W4oYbCfhRYuTgPo+2U0S0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27415234"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27415234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 21:56:36 -0700
X-CSE-ConnectionGUID: olvyCHuySM6k13afwdyEWQ==
X-CSE-MsgGUID: DmRefVN4To2q1wwhPwlp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="80314418"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Oct 2024 21:56:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy2Gu-0005uo-15;
	Tue, 08 Oct 2024 04:56:32 +0000
Date: Tue, 8 Oct 2024 12:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.12-rc1 64/132] drivers/acpi/pptt.c:412:
 warning: Function parameter or struct member 'acpi_cpu_id' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202410081207.goLQgEZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: 82e2351aec9814862d8f72b738ca1916714593c2 [64/132] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410081207.goLQgEZj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081207.goLQgEZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081207.goLQgEZj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/pptt.c:343: warning: Function parameter or struct member 'callback' not described in 'acpi_pptt_for_each_container'
   drivers/acpi/pptt.c:343: warning: Function parameter or struct member 'arg' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:412: warning: Function parameter or struct member 'acpi_cpu_id' not described in 'acpi_pptt_get_cpus_from_container'
>> drivers/acpi/pptt.c:412: warning: Function parameter or struct member 'cpus' not described in 'acpi_pptt_get_cpus_from_container'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +412 drivers/acpi/pptt.c

   401	
   402	/**
   403	 * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
   404	 * 					 processor containers
   405	 *
   406	 * Find the specified Processor Container, and fill cpus with all the cpus
   407	 * below it.
   408	 *
   409	 * Return: 0 for a complete walk, or an error if the mask is incomplete.
   410	 */
   411	int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 > 412	{
   413		struct __cpus_from_container_arg params;
   414	
   415		params.acpi_cpu_id = acpi_cpu_id;
   416		params.cpus = cpus;
   417	
   418		cpumask_clear(cpus);
   419		return acpi_pptt_for_each_container(&__cpus_from_container, &params);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
