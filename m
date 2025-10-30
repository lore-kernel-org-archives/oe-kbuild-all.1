Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD331F4631
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 05:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761801591; cv=none; b=SNPlucwmSbVLa3GBBlk+T0IdLLLdjxk7QLcgx13f0FERbB5lrmDsG0JEYTTT0rgIn6pwxZMmJ3dsxKG/Sx44vwSfliRPybCK6czoEF9dk/tFah8WCzNXYJsbVC8v6q6EiEj2b2tnEh9QAUBhzgPFiQ0ymKrrav/as8xz/N+lU3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761801591; c=relaxed/simple;
	bh=b/sO6KM1sVpQb2wwfDBHrgXXRxwSFbUlcoR6Ken/Mio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2Fgxh+epf6Ee/KLYGXndbKaPRxWgqVmJcMzFw4vIIhB3lemDlWcByX0+lZ/Is/T8EsSCkz5Hms7VdBqa7dtxCeGGYFRvKL/qQVJ2MJ4BJRdgS9c/v4wBy8Gr6WTReRgCxcaGkLiwlWCVo8zxjHBKCjEIDJwROijfxW9salhdVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jibAMz3s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jibAMz3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761801589; x=1793337589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/sO6KM1sVpQb2wwfDBHrgXXRxwSFbUlcoR6Ken/Mio=;
  b=jibAMz3sdOv9QHoszsu06z7L7qhoijNHwJrfecWe8Yf9p51vwFj0eP49
   T8bYVIZCN/XX6qw8TswAfrSUEbsWdTRZ938CMNALvgFbGEwnpJj0n6iSI
   G1U9lzg+QnnCsXVwIQyoOBp9ey03Kaofa4rDYAmcyfAQewpot2KmY3ugL
   uEGXv/3Gfok2tuDrgRiJJ66nIFWOAypcXuz+4zMgtcMXm9y4OY1JL8nxg
   VYsi6ExBzxYaZudQmF6iiGpH+HqykTGgH7tOOURJqu6qncqCNchKLj7UG
   q7IIqXtjrOs92FM6ppnO4fbs9tn6jldTfd5KaRJpDoIidLoS9iVU+JCek
   Q==;
X-CSE-ConnectionGUID: aQ7HqOP4S4+7qbL8kY0eyw==
X-CSE-MsgGUID: EtfKvedhQcGz0TjNjpn4sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81353680"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="81353680"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 22:19:48 -0700
X-CSE-ConnectionGUID: 9sncIRj3Rf6u9FW0kRcVGw==
X-CSE-MsgGUID: xDDTn9FRRVK2TziJIkV1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="190190694"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Oct 2025 22:19:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEL4U-000LUM-2t;
	Thu, 30 Oct 2025 05:19:40 +0000
Date: Thu, 30 Oct 2025 13:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3067/3067] drivers/ub/ubfi/irq.c:11:5: warning:
 no previous prototype for 'ubrt_register_gsi'
Message-ID: <202510301347.pIaq0wY3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8894fa6a2898641fafc4ccaaa73f0078705a223e
commit: 6533f3af69cee90712f3481841901ab0a10f8339 [3067/3067] ub:ubfi: ubfi driver create ubc device
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510301347.pIaq0wY3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301347.pIaq0wY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301347.pIaq0wY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubfi/irq.c:11:5: warning: no previous prototype for 'ubrt_register_gsi' [-Wmissing-prototypes]
      11 | int ubrt_register_gsi(u32 hwirq, int trigger, int polarity, const char *name,
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubfi/irq.c:37:6: warning: no previous prototype for 'ubrt_unregister_gsi' [-Wmissing-prototypes]
      37 | void ubrt_unregister_gsi(u32 hwirq)
         |      ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/ubrt_register_gsi +11 drivers/ub/ubfi/irq.c

    10	
  > 11	int ubrt_register_gsi(u32 hwirq, int trigger, int polarity, const char *name,
    12			      struct resource *res)
    13	{
    14	#ifdef CONFIG_ACPI
    15		int irq;
    16	
    17		if (!res) {
    18			pr_err("ub register gsi, res is null\n");
    19			return -EINVAL;
    20		}
    21	
    22		irq = acpi_register_gsi(NULL, hwirq, trigger, polarity);
    23		if (irq <= 0) {
    24			pr_err("could not register ub gsi hwirq %u\n", hwirq);
    25			return -EINVAL;
    26		}
    27	
    28		res->name = name;
    29		res->start = irq;
    30		res->end = irq;
    31		res->flags = IORESOURCE_IRQ;
    32	#endif
    33		return 0;
    34	}
    35	EXPORT_SYMBOL_GPL(ubrt_register_gsi);
    36	
  > 37	void ubrt_unregister_gsi(u32 hwirq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
