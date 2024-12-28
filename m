Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882E22066
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735362160; cv=none; b=k2+CXq+Ca1t0RAmfLnSLd1qn6yVbj09O+GGqwFK+XHPRyfUNAK7aRPXkir5+k8crrgHxyPJZdrKVKu1t7nfbXOajQ5D2w2coVGIW3waZJeqiobDNsWS7xbqVcIppCfbD+n0mf5u50l4Yz6ONoHgbTIFZvNu0m+OWXy56ZNZjnUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735362160; c=relaxed/simple;
	bh=NoPapJ0JME84m0NOiddNYfjgti5oKKHw0AMZcMJhhFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOq8o1zQSL/YnhAxldqMLoP0PeFR91+cUBrpBmekAtC6aEjV2RO84i17sotwFN17GN5O9Yp1trBONN1YSRf3aB/6/WGsIz0ZhvJ28Ojxy9PKYOhFgtfc+uq11PUHTuCBduJ28sWkcKgGbkpLKBcffEICsMgfbq5SVQJIkW1cJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko+t33qD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko+t33qD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735362156; x=1766898156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NoPapJ0JME84m0NOiddNYfjgti5oKKHw0AMZcMJhhFs=;
  b=ko+t33qDyIsSETbZpNQ0MJBplPszrY9n7OsXrre0NeIsPEhLc7LsYBjT
   DmHIPrgkIr2+zRtu3qO7hNbYLy9SLayagXeccw3gJSMUIeR3fz117UjkD
   0ext/m5/RA1pUH7rlBkT3DqiqDWSls9NsiaeZGZoOi+uOBKz1tqwf3p4m
   dwKmD3/pMjX3CACMEvKRtlRpEiRHQTvDNXbVlETyPCmwCP82kM+icXXUm
   M1EavFuf2MVXJ0tI/pogVmOzm83AEl8Kx81uG+xyxsWcTM1U8wDD7FwxL
   O+PlKHKOf0jwN3wX18dRMwCVYPWe8EbbAm/VIZpjg6NI0wOd+mhO/FZXz
   g==;
X-CSE-ConnectionGUID: hKHQqX3TRLqSSVTT1JwHfg==
X-CSE-MsgGUID: xS73Pjc3QUqQNMbWa3+isw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35649646"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35649646"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:02:33 -0800
X-CSE-ConnectionGUID: nSOuKV7FTq+a7RFLyodXAg==
X-CSE-MsgGUID: yY6KFez7RpiO19M05edjsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100139418"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 21:02:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tROy5-0003ri-1b;
	Sat, 28 Dec 2024 05:02:29 +0000
Date: Sat, 28 Dec 2024 13:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355]
 drivers/irqchip/irq-gic-phytium-2500.c:172:29: sparse: sparse: dereference
 of noderef expression
Message-ID: <202412281248.l2Nmmpui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d7e5d3f944b7f5d2cee0b8e46a829a04dd6066f3
commit: 7981e396b80981a5757aae9b858bb480e940838a [1355/1355] irqchip: phytium-2500: Add interrupt controller driver
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281248.l2Nmmpui-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412281248.l2Nmmpui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281248.l2Nmmpui-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-phytium-2500.c:172:29: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:194:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:271:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:290:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:140:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:510:24: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:796:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:797:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c:983:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500.c: In function 'gic_cpumask_select':
   drivers/irqchip/irq-gic-phytium-2500.c:1112:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    1112 |                 if ((skt >= 0) && (skt < MAX_MARS3_SOC_COUNT))
         |                          ^~
   drivers/irqchip/irq-gic-phytium-2500.c:1137:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    1137 |                 if ((skt >= 0) && (skt < MAX_MARS3_SOC_COUNT)) {
         |                          ^~
   In file included from arch/arm64/include/asm/cputype.h:125,
                    from arch/arm64/include/asm/cache.h:19,
                    from include/linux/cache.h:6,
                    from include/linux/printk.h:9,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from drivers/irqchip/irq-gic-phytium-2500.c:22:
   drivers/irqchip/irq-gic-phytium-2500.c: In function 'gic_cpu_sys_reg_init':
   arch/arm64/include/asm/sysreg.h:769:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     769 |         asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));               29-      |         ^~~
   arch/arm64/include/asm/arch_gicv3.h:31:41: note: in expansion of macro 'write_sysreg_s'
      31 | #define write_gicreg(v, r)              write_sysreg_s(v, SYS_ ## r)
         |                                         ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:903:25: note: in expansion of macro 'write_gicreg'
     903 |                         write_gicreg(0, ICC_AP0R2_EL1);
         |                         ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:904:17: note: here
     904 |                 case 6:
         |                 ^~~~
   arch/arm64/include/asm/sysreg.h:769:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     769 |         asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));               41-      |         ^~~
   arch/arm64/include/asm/arch_gicv3.h:31:41: note: in expansion of macro 'write_sysreg_s'
      31 | #define write_gicreg(v, r)              write_sysreg_s(v, SYS_ ## r)
         |                                         ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:905:25: note: in expansion of macro 'write_gicreg'
     905 |                         write_gicreg(0, ICC_AP0R1_EL1);
         |                         ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:906:17: note: here
     906 |                 case 5:
         |                 ^~~~
   arch/arm64/include/asm/sysreg.h:769:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     769 |         asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));               53-      |         ^~~
   arch/arm64/include/asm/arch_gicv3.h:31:41: note: in expansion of macro 'write_sysreg_s'
      31 | #define write_gicreg(v, r)              write_sysreg_s(v, SYS_ ## r)
         |                                         ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:918:17: note: in expansion of macro 'write_gicreg'
     918 |                 write_gicreg(0, ICC_AP1R2_EL1);
         |                 ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:919:9: note: here
     919 |         case 6:
         |         ^~~~
   arch/arm64/include/asm/sysreg.h:769:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     769 |         asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));               65-      |         ^~~
   arch/arm64/include/asm/arch_gicv3.h:31:41: note: in expansion of macro 'write_sysreg_s'
      31 | #define write_gicreg(v, r)              write_sysreg_s(v, SYS_ ## r)
         |                                         ^~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:920:17: note: in expansion of macro 'write_gicreg'
     920 |                 write_gicreg(0, ICC_AP1R1_EL1);
         |                 ^~~~~~~~~~~~
   drivers/irqchip/irq-gic-phytium-2500.c:921:9: note: here
     921 |         case 5:
         |         ^~~~
--
   drivers/irqchip/irq-gic-phytium-2500-its.c:1736:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:1736:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2123:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2123:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3804:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3804:19: sparse: sparse: dereference of noderef expression
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
>> drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:431:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:432:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:433:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __le64 [usertype] @@
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     expected unsigned long long
   drivers/irqchip/irq-gic-phytium-2500-its.c:434:25: sparse:     got restricted __le64 [usertype]
   drivers/irqchip/irq-gic-phytium-2500-its.c:1736:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:1736:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:1736:23: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2123:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2123:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2123:15: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2148:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2179:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2184:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2194:40: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2195:17: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2200:21: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2253:43: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2279:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2280:9: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2315:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2318:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2873:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2920:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:2952:35: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3030:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3070:26: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3804:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3804:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3804:19: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3809:31: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c:3829:13: sparse: sparse: dereference of noderef expression
   drivers/irqchip/irq-gic-phytium-2500-its.c: In function 'its_cpumask_select':
   drivers/irqchip/irq-gic-phytium-2500-its.c:1169:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    1169 |                 if ((skt >= 0) && (skt < MAX_MARS3_SKT_COUNT))
         |                          ^~
   drivers/irqchip/irq-gic-phytium-2500-its.c:1195:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    1195 |                 if ((skt >= 0) && (skt < MAX_MARS3_SKT_COUNT)) {
         |                          ^~
   drivers/irqchip/irq-gic-phytium-2500-its.c: In function 'its_cpu_init_collection':
   drivers/irqchip/irq-gic-phytium-2500-its.c:2289:29: warning: variable 'skt_id' set but not used [-Wunused-but-set-variable]
    2289 |         unsigned long mpid, skt_id;
         |                             ^~~~~~
   drivers/irqchip/irq-gic-phytium-2500-its.c:2289:23: warning: variable 'mpid' set but not used [-Wunused-but-set-variable]
    2289 |         unsigned long mpid, skt_id;
         |                       ^~~~
   drivers/irqchip/irq-gic-phytium-2500-its.c: In function 'its_cpumask_first':
   drivers/irqchip/irq-gic-phytium-2500-its.c:2679:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    2679 |                 if ((skt >= 0) && (skt < MAX_MARS3_SKT_COUNT))
         |                          ^~
   drivers/irqchip/irq-gic-phytium-2500-its.c:2705:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    2705 |                 if ((skt >= 0) && (skt < MAX_MARS3_SKT_COUNT)) {
         |                          ^~

vim +172 drivers/irqchip/irq-gic-phytium-2500.c

   168	
   169	/* Wait for completion of a redistributor change */
   170	static void gic_redist_wait_for_rwp(void)
   171	{
 > 172		gic_do_wait_for_rwp(gic_data_rdist_rd_base());
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
