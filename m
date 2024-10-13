Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A947E574
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 20:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728849787; cv=none; b=SryfnRJbpUJqBMe+gnW+r9QDF3gdoiydp75DV5W6dBAeCslbA0A+OzRjm8x3e273Oq8o2KI809esBEI72h+VPVj0l7FxFsMV4nmx+jiE3TYXjlkIgZ4NbFVoVyQKnstG2SRnszGVY/lUXNrwcALUAehDMTRQGz3VkvM+IOCKzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728849787; c=relaxed/simple;
	bh=YhmPVMln76HPJg3mJB/QCdftiZzI6jT4ZQzFc03Rtls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQyieYnyhoh/U7MGlwr/MP84xjhVgLnjUjKaU4Q/Q4YmhJMxJxGW/pBa1aQKR9EHL/iBXnYMMm3xwWzZyGHFiLe0Htsf82nKkvJWuit17ntnxCpP1XAKq4AQpgoxruEFfD7Dbfp2chvN/5FcCXW2epDuanm83v7PNt+pm/uQd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxVTucDa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxVTucDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728849785; x=1760385785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhmPVMln76HPJg3mJB/QCdftiZzI6jT4ZQzFc03Rtls=;
  b=QxVTucDav5qbMaHD8MaWPsTmpuZtdD+4sTD86gIS+xknRCQ631mp0Oly
   wH5YimI4MilE0og6UJD9QQdevdz6tePiMYwbeTGeTcMG3m8yTMQpabOGR
   CwmQjRpWVtgAPkbCPpOkq6xzBbkWDCqO8aOpDsenPJFmwOcX3+y/C9Wlh
   K26/c1h+mbF3juA/w9Kzs/nKQg3K0akFfnzAuku4h+Tr8EYIA2iUwiGcP
   7IV94RJqQ8glud1oXzUCKeisjOei298EPGYKvrHfQ/cTqIZkX5A1PMDgM
   EVdHxlR57cEC4pOSPBtgeuwN28y3OWLJ1Lh9QQEX4yyjZsTW5u03hOhVK
   w==;
X-CSE-ConnectionGUID: GE0cowNYQhSvOkZodRmEEw==
X-CSE-MsgGUID: DfrKx+qBTTu91FIGS4U1eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="31074420"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="31074420"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 13:03:05 -0700
X-CSE-ConnectionGUID: OqE8zIdRRUSL43hA5OttcQ==
X-CSE-MsgGUID: S1ktmfFuTWWtCpiafqr+gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82173817"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2024 13:03:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t04nt-000Ef9-0S;
	Sun, 13 Oct 2024 20:03:01 +0000
Date: Mon, 14 Oct 2024 04:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 2/6]
 arch/x86/kernel/cpu/zhaoxin.c:39:53: error: macro "rdmsr" requires 3
 arguments, but only 2 given
Message-ID: <202410140314.6VyfbjgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   e5a67a380b17d57cd761a88882e1d30104311f9a
commit: 8b0c24035def46b9bedbc0aec87c7d35f3511015 [2/6] x86/msr: Replace wrmsr() with wrmsrl()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241014/202410140314.6VyfbjgT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410140314.6VyfbjgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410140314.6VyfbjgT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/zhaoxin.c: In function 'init_zhaoxin_cap':
>> arch/x86/kernel/cpu/zhaoxin.c:39:53: error: macro "rdmsr" requires 3 arguments, but only 2 given
      39 |                         rdmsr(MSR_ZHAOXIN_FCR57, val);
         |                                                     ^
   In file included from arch/x86/include/asm/tsc.h:10,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:21,
                    from include/linux/notifier.h:16,
                    from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:50,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from arch/x86/include/asm/cpu.h:5,
                    from arch/x86/kernel/cpu/zhaoxin.c:5:
   arch/x86/include/asm/msr.h:247: note: macro "rdmsr" defined here
     247 | #define rdmsr(msr, low, high)                                   \
         | 
>> arch/x86/kernel/cpu/zhaoxin.c:39:25: error: 'rdmsr' undeclared (first use in this function)
      39 |                         rdmsr(MSR_ZHAOXIN_FCR57, val);
         |                         ^~~~~
   arch/x86/kernel/cpu/zhaoxin.c:39:25: note: each undeclared identifier is reported only once for each function it appears in


vim +/rdmsr +39 arch/x86/kernel/cpu/zhaoxin.c

     4	
   > 5	#include <asm/cpu.h>
     6	#include <asm/cpufeature.h>
     7	
     8	#include "cpu.h"
     9	
    10	#define MSR_ZHAOXIN_FCR57 0x00001257
    11	
    12	#define ACE_PRESENT	(1 << 6)
    13	#define ACE_ENABLED	(1 << 7)
    14	#define ACE_FCR		(1 << 7)	/* MSR_ZHAOXIN_FCR */
    15	
    16	#define RNG_PRESENT	(1 << 2)
    17	#define RNG_ENABLED	(1 << 3)
    18	#define RNG_ENABLE	(1 << 8)	/* MSR_ZHAOXIN_RNG */
    19	
    20	static void init_zhaoxin_cap(struct cpuinfo_x86 *c)
    21	{
    22		u64 val;
    23	
    24		/* Test for Extended Feature Flags presence */
    25		if (cpuid_eax(0xC0000000) >= 0xC0000001) {
    26			u32 tmp = cpuid_edx(0xC0000001);
    27	
    28			/* Enable ACE unit, if present and disabled */
    29			if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
    30				rdmsrl(MSR_ZHAOXIN_FCR57, val);
    31				/* Enable ACE unit */
    32				val |= ACE_FCR;
    33				wrmsrl(MSR_ZHAOXIN_FCR57, val);
    34				pr_info("CPU: Enabled ACE h/w crypto\n");
    35			}
    36	
    37			/* Enable RNG unit, if present and disabled */
    38			if ((tmp & (RNG_PRESENT | RNG_ENABLED)) == RNG_PRESENT) {
  > 39				rdmsr(MSR_ZHAOXIN_FCR57, val);
    40				/* Enable RNG unit */
    41				val |= RNG_ENABLE;
    42				wrmsrl(MSR_ZHAOXIN_FCR57, val);
    43				pr_info("CPU: Enabled h/w RNG\n");
    44			}
    45	
    46			/*
    47			 * Store Extended Feature Flags as word 5 of the CPU
    48			 * capability bit array
    49			 */
    50			c->x86_capability[CPUID_C000_0001_EDX] = cpuid_edx(0xC0000001);
    51		}
    52	
    53		if (c->x86 >= 0x6)
    54			set_cpu_cap(c, X86_FEATURE_REP_GOOD);
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
