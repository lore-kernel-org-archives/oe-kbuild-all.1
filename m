Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49AA45BFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 11:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708603086; cv=none; b=g8Vp9auwZTpq0z37DnuLLmJzW1uxkQegIHvQzHraTRi4O3HzVgcMSsq1xE3Wx7Zv+kgOKVjVT5vqKVb0AqsCFep+p2sd/BwZMrRjl8xt1Sivnw+d/i5vYUIaxrAlldFICRRTO3M6WI9CH6PZd5KJu2lRJKbhLoFfrURhBVyx6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708603086; c=relaxed/simple;
	bh=qiRf6fxhBbLmfJerkHfkkxJN4Ma7ajAnw0XOreDx7ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2//nuaWiOuu7ir8IQoZTxpwmjGBofkRokgz1tror3lDf8ZVOZOb2egLKANzmFyIaw3L97p/ihE33JJancvvsKRK3WLQZgVtlGATy+/51u1I8Mq/cuqwgHEmD8XGmk3Ov95uNu2v067hus57X0eo4v/s6+J2Q45OI3p3MMDX/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFtMdDZ/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFtMdDZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708603084; x=1740139084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiRf6fxhBbLmfJerkHfkkxJN4Ma7ajAnw0XOreDx7ns=;
  b=CFtMdDZ/eBUU/dc2udYM+h/Hc/U6VcwKa6e19KyBXY1m6rx+L4Kz5iXm
   pZXjC94mk8f/ucJL/9ySuKzkrzuYV/gATFfEA0UuRrYykKB22k8Es0sB8
   6A6hCwBTLkIIZ5qoKlB5maE/Iu0zrAHVUUyY4XDoQfmI+Is+oYn/n9n27
   0gHZQj5YAwsR+IBMVpqmgYRbYxGSKsrdVXKBysByrsmZqnbmJmeqt/dps
   XxOiBp1/bgVc8DtWi3GP/3Gvagz8UF2rezYIAe9Gbcvo/Ge3B6UZvHUba
   1T67isGQ/ewm1hafwUjr5PgohJzW+M5W7KR2SWd8LYz2T0dQrwKRluL5a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6600060"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6600060"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10109737"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Feb 2024 03:57:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7hz-0006HA-2d;
	Thu, 22 Feb 2024 11:57:50 +0000
Date: Thu, 22 Feb 2024 19:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/kernel/smp.c:515:20: warning:
 'is_phytium_kdump_cpu_need_bypass' defined but not used
Message-ID: <202402221949.HcMjboec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: c80a7b3863680beaa77709cb33861f8691c29239 arm64/phytium-2500: make sure that there is at least one online cpu on each node for kdump
date:   1 year, 5 months ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240222/202402221949.HcMjboec-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221949.HcMjboec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221949.HcMjboec-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cache.h:8,
                    from include/linux/cache.h:6,
                    from include/linux/printk.h:9,
                    from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from arch/arm64/kernel/smp.c:9:
   arch/arm64/kernel/smp.c: In function 'is_phytium_kdump_cpu_need_bypass':
   arch/arm64/include/asm/cputype.h:125:48: error: 'ARM_CPU_IMP_PHYTIUM' undeclared (first use in this function); did you mean 'ARM_CPU_IMP_CAVIUM'?
     125 | #define MIDR_FT_2500            MIDR_CPU_MODEL(ARM_CPU_IMP_PHYTIUM, PHYTIUM_CPU_PART_2500)
         |                                                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:44:12: note: in definition of macro 'MIDR_CPU_MODEL'
      44 |         (((imp)                 << MIDR_IMPLEMENTOR_SHIFT) | \
         |            ^~~
   arch/arm64/kernel/smp.c:517:56: note: in expansion of macro 'MIDR_FT_2500'
     517 |         if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_FT_2500)
         |                                                        ^~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:125:48: note: each undeclared identifier is reported only once for each function it appears in
     125 | #define MIDR_FT_2500            MIDR_CPU_MODEL(ARM_CPU_IMP_PHYTIUM, PHYTIUM_CPU_PART_2500)
         |                                                ^~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:44:12: note: in definition of macro 'MIDR_CPU_MODEL'
      44 |         (((imp)                 << MIDR_IMPLEMENTOR_SHIFT) | \
         |            ^~~
   arch/arm64/kernel/smp.c:517:56: note: in expansion of macro 'MIDR_FT_2500'
     517 |         if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_FT_2500)
         |                                                        ^~~~~~~~~~~~
   arch/arm64/kernel/smp.c: At top level:
   arch/arm64/kernel/smp.c:857:6: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
     857 | void arch_irq_work_raise(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:878:6: warning: no previous prototype for 'panic_smp_self_stop' [-Wmissing-prototypes]
     878 | void panic_smp_self_stop(void)
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/smp.c:515:20: warning: 'is_phytium_kdump_cpu_need_bypass' defined but not used [-Wunused-function]
     515 | static bool __init is_phytium_kdump_cpu_need_bypass(u64 hwid)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/is_phytium_kdump_cpu_need_bypass +515 arch/arm64/kernel/smp.c

   504	
   505	#ifdef CONFIG_ARCH_PHYTIUM
   506	/*
   507	 * On phytium S2500 multi-socket server, for example 2-socket(2P), there are
   508	 * socekt0 and socket1 on the server:
   509	 * If storage device(like SAS controller and disks to save vmcore into) is
   510	 * installed on socket1 and second kernel brings up 2 CPUs both on socket0 with
   511	 * nr_cpus=2, then vmcore will fail to be saved into the disk.
   512	 * To avoid this issue, Bypass other non-cpu0 to ensure that each cpu0 on each
   513	 * socket can bootup and handle interrupt when booting the second kernel.
   514	 */
 > 515	static bool __init is_phytium_kdump_cpu_need_bypass(u64 hwid)
   516	{
   517		if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_FT_2500)
   518			return false;
   519	
   520		/*
   521		 * Bypass other non-cpu0 to ensure second kernel can bring up each cpu0
   522		 * on each socket
   523		 */
   524		if (is_kdump_kernel() && (hwid & 0xffff) != (cpu_logical_map(0) & 0xffff))
   525			return true;
   526	
   527		return false;
   528	}
   529	#endif
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
