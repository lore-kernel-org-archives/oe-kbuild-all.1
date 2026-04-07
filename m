Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B13BB9F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568958; cv=none; b=ZS7BjpHD7MaRHx2WB+ArMkvyy3DVymaJKfdcRyuhzWugGz/bpnECcZj9+xRm0gy+iO28j5Jg8l37NQvqqh+i/1OjzwSzJTqlrCMqFmCsJQM4eektvgGEZMgJrNzoZbpiBWgaWdLHjhFjXRNORfK6eNRdml2nlVvoSejLrh7iq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568958; c=relaxed/simple;
	bh=Oaq1Qxis9UDWT1U6PmLa+wFA0jCeQgRuJR7AgCM/JhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OmbyDhRAFwavYOI+Zn/ArwBTmq9eXUUsXXVWp/sxJSoQNPJrSQst56GEhmLXGsw8bL6J8B+n11Sz5B2rXPLIygB73N+9qAqOo4SJZm7VVoL6sxqk7kM/HefVJt8XRv2zLObb1rEB4fxSLIvINaLMeyX6z0crR75XXb6fQoHHsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ItN05pfv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ItN05pfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775568954; x=1807104954;
  h=date:from:to:cc:subject:message-id;
  bh=Oaq1Qxis9UDWT1U6PmLa+wFA0jCeQgRuJR7AgCM/JhM=;
  b=ItN05pfvZynFL+JrTqEN7bxc+s7sxfrAF8BZyc2n+OpheCZoXdhDVyNk
   VtpXrmavw1+ax++viCMcEJFKloIQK+5Di+PZEWnO1LvcklTMklHfLCNSs
   7GeDSbkD6+g07+3YRX52n8PyALHPQysZIcNvbJDcKWGwzWDQQgVVfrbeZ
   9/r2Tf3QspiSrwpDAsc33y9W0rLKG9agfeSLRHEFy2sBfx4/2qdaKvyHE
   y+M1atVJzFa+dL6toOAXRA2CWztk1DEDX/Z3IWWShBwG/VIEZ+g56/SsB
   +YGqk5GZXlesMm+NLBmgQPo17P3NjOF6oXpqBTZAgrNgXM0pkTei30pzs
   g==;
X-CSE-ConnectionGUID: aJDBhlOyRi2Yskdi+tnZRQ==
X-CSE-MsgGUID: cq4RxrRcTRS/EXHYmP8hOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="94110526"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="94110526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 06:35:52 -0700
X-CSE-ConnectionGUID: Jf8R+EGyTJC9XabRcKzHIQ==
X-CSE-MsgGUID: r7K5IZ5kQwKFsXs5bMlEPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232203242"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 06:35:50 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA6ap-000000000cZ-1WG7;
	Tue, 07 Apr 2026 13:35:47 +0000
Date: Tue, 07 Apr 2026 21:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:assert 4/6] arch/x86/kernel/nmi_selftest.c:27:8:
 error: unknown type name 'cpumask'; did you mean 'cpumask_t'?
Message-ID: <202604072149.txbSL5wq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux assert
head:   5e88fbeeb3c7355139ca86067d68ea8c77534b92
commit: 7a49ab0bc5eb96c752ad339794e476c19613cb5d [4/6] nmi_selftest
config: x86_64-buildonly-randconfig-001-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072149.txbSL5wq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072149.txbSL5wq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072149.txbSL5wq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/nmi_selftest.c:27:8: error: unknown type name 'cpumask'; did you mean 'cpumask_t'?
      27 | static cpumask nmi_ipi_mask  __initdata;
         |        ^~~~~~~
         |        cpumask_t
   arch/x86/kernel/nmi_selftest.c: In function 'test_nmi_ipi_callback':
>> arch/x86/kernel/nmi_selftest.c:56:45: error: passing argument 2 of 'cpumask_test_and_clear_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
      56 |         if (cpumask_test_and_clear_cpu(cpu, &nmi_ipi_mask))
         |                                             ^~~~~~~~~~~~~
         |                                             |
         |                                             int *
   In file included from include/linux/smp.h:13,
                    from arch/x86/kernel/nmi_selftest.c:11:
   include/linux/cpumask.h:677:58: note: expected 'struct cpumask *' but argument is of type 'int *'
     677 | bool cpumask_test_and_clear_cpu(int cpu, struct cpumask *cpumask)
         |                                          ~~~~~~~~~~~~~~~~^~~~~~~
   arch/x86/kernel/nmi_selftest.c: In function 'remote_ipi':
>> arch/x86/kernel/nmi_selftest.c:92:22: error: passing argument 1 of 'cpumask_copy' from incompatible pointer type [-Wincompatible-pointer-types]
      92 |         cpumask_copy(&nmi_ipi_mask, cpu_online_mask);
         |                      ^~~~~~~~~~~~~
         |                      |
         |                      int *
   include/linux/cpumask.h:932:35: note: expected 'struct cpumask *' but argument is of type 'int *'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                   ~~~~~~~~~~~~~~~~^~~~
>> arch/x86/kernel/nmi_selftest.c:93:47: error: passing argument 2 of 'cpumask_clear_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
      93 |         cpumask_clear_cpu(smp_processor_id(), &nmi_ipi_mask);
         |                                               ^~~~~~~~~~~~~
         |                                               |
         |                                               int *
   include/linux/cpumask.h:629:72: note: expected 'struct cpumask *' but argument is of type 'int *'
     629 | static __always_inline void cpumask_clear_cpu(int cpu, struct cpumask *dstp)
         |                                                        ~~~~~~~~~~~~~~~~^~~~
>> arch/x86/kernel/nmi_selftest.c:94:28: error: passing argument 1 of 'cpumask_empty' from incompatible pointer type [-Wincompatible-pointer-types]
      94 |         if (!cpumask_empty(&nmi_ipi_mask))
         |                            ^~~~~~~~~~~~~
         |                            |
         |                            int *
   include/linux/cpumask.h:846:65: note: expected 'const struct cpumask *' but argument is of type 'int *'
     846 | static __always_inline bool cpumask_empty(const struct cpumask *srcp)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/x86/kernel/nmi_selftest.c:95:30: error: passing argument 1 of 'test_nmi_ipi' from incompatible pointer type [-Wincompatible-pointer-types]
      95 |                 test_nmi_ipi(&nmi_ipi_mask);
         |                              ^~~~~~~~~~~~~
         |                              |
         |                              int *
   arch/x86/kernel/nmi_selftest.c:62:49: note: expected 'struct cpumask *' but argument is of type 'int *'
      62 | static void __init test_nmi_ipi(struct cpumask *mask)
         |                                 ~~~~~~~~~~~~~~~~^~~~
   arch/x86/kernel/nmi_selftest.c: In function 'local_ipi':
>> arch/x86/kernel/nmi_selftest.c:100:23: error: passing argument 1 of 'cpumask_clear' from incompatible pointer type [-Wincompatible-pointer-types]
     100 |         cpumask_clear(&nmi_ipi_mask);
         |                       ^~~~~~~~~~~~~
         |                       |
         |                       int *
   include/linux/cpumask.h:699:59: note: expected 'struct cpumask *' but argument is of type 'int *'
     699 | static __always_inline void cpumask_clear(struct cpumask *dstp)
         |                                           ~~~~~~~~~~~~~~~~^~~~
>> arch/x86/kernel/nmi_selftest.c:101:45: error: passing argument 2 of 'cpumask_set_cpu' from incompatible pointer type [-Wincompatible-pointer-types]
     101 |         cpumask_set_cpu(smp_processor_id(), &nmi_ipi_mask);
         |                                             ^~~~~~~~~~~~~
         |                                             |
         |                                             int *
   include/linux/cpumask.h:600:56: note: expected 'struct cpumask *' but argument is of type 'int *'
     600 | void cpumask_set_cpu(unsigned int cpu, struct cpumask *dstp)
         |                                        ~~~~~~~~~~~~~~~~^~~~
   arch/x86/kernel/nmi_selftest.c:102:22: error: passing argument 1 of 'test_nmi_ipi' from incompatible pointer type [-Wincompatible-pointer-types]
     102 |         test_nmi_ipi(&nmi_ipi_mask);
         |                      ^~~~~~~~~~~~~
         |                      |
         |                      int *
   arch/x86/kernel/nmi_selftest.c:62:49: note: expected 'struct cpumask *' but argument is of type 'int *'
      62 | static void __init test_nmi_ipi(struct cpumask *mask)
         |                                 ~~~~~~~~~~~~~~~~^~~~


vim +27 arch/x86/kernel/nmi_selftest.c

  > 11	#include <linux/smp.h>
    12	#include <linux/cpumask.h>
    13	#include <linux/delay.h>
    14	#include <linux/init.h>
    15	#include <linux/percpu.h>
    16	
    17	#include <asm/apic.h>
    18	#include <asm/nmi.h>
    19	
    20	#define SUCCESS		0
    21	#define FAILURE		1
    22	#define TIMEOUT		2
    23	
    24	static int __initdata nmi_fail;
    25	
    26	/* check to see if NMI IPIs work on this machine */
  > 27	static cpumask nmi_ipi_mask  __initdata;
    28	
    29	static int __initdata testcase_total;
    30	static int __initdata testcase_successes;
    31	static int __initdata unexpected_testcase_failures;
    32	static int __initdata unexpected_testcase_unknowns;
    33	
    34	static int __init nmi_unk_cb(unsigned int val, struct pt_regs *regs)
    35	{
    36		unexpected_testcase_unknowns++;
    37		return NMI_HANDLED;
    38	}
    39	
    40	static void __init init_nmi_testsuite(void)
    41	{
    42		/* trap all the unknown NMIs we may generate */
    43		register_nmi_handler(NMI_UNKNOWN, nmi_unk_cb, 0, "nmi_selftest_unk",
    44				__initdata);
    45	}
    46	
    47	static void __init cleanup_nmi_testsuite(void)
    48	{
    49		unregister_nmi_handler(NMI_UNKNOWN, "nmi_selftest_unk");
    50	}
    51	
    52	static int __init test_nmi_ipi_callback(unsigned int val, struct pt_regs *regs)
    53	{
    54	        int cpu = raw_smp_processor_id();
    55	
  > 56	        if (cpumask_test_and_clear_cpu(cpu, &nmi_ipi_mask))
    57	                return NMI_HANDLED;
    58	
    59	        return NMI_DONE;
    60	}
    61	
    62	static void __init test_nmi_ipi(struct cpumask *mask)
    63	{
    64		unsigned long timeout;
    65	
    66		if (register_nmi_handler(NMI_LOCAL, test_nmi_ipi_callback,
    67					 NMI_FLAG_FIRST, "nmi_selftest", __initdata)) {
    68			nmi_fail = FAILURE;
    69			return;
    70		}
    71	
    72		/* sync above data before sending NMI */
    73		wmb();
    74	
    75		__apic_send_IPI_mask(mask, NMI_VECTOR);
    76	
    77		/* Don't wait longer than a second */
    78		timeout = USEC_PER_SEC;
    79		while (!cpumask_empty(mask) && --timeout)
    80		        udelay(1);
    81	
    82		/* What happens if we timeout, do we still unregister?? */
    83		unregister_nmi_handler(NMI_LOCAL, "nmi_selftest");
    84	
    85		if (!timeout)
    86			nmi_fail = TIMEOUT;
    87		return;
    88	}
    89	
    90	static void __init remote_ipi(void)
    91	{
  > 92		cpumask_copy(&nmi_ipi_mask, cpu_online_mask);
  > 93		cpumask_clear_cpu(smp_processor_id(), &nmi_ipi_mask);
  > 94		if (!cpumask_empty(&nmi_ipi_mask))
  > 95			test_nmi_ipi(&nmi_ipi_mask);
    96	}
    97	
    98	static void __init local_ipi(void)
    99	{
 > 100		cpumask_clear(&nmi_ipi_mask);
 > 101		cpumask_set_cpu(smp_processor_id(), &nmi_ipi_mask);
   102		test_nmi_ipi(&nmi_ipi_mask);
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
