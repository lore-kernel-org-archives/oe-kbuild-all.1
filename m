Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9230F92F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093806; cv=none; b=ajx/OqBEssGnM/SnXcvauLraZk0NI7ddc+3HYJB3wCg+bE1vni8yvGxZnw3tZeL+s/t04i6LhW+MLtiSVHbAt14U1YTj6k8Kv2ZQIykj+ih9CyR6pcE4n7Etj6NXTHiW/eY8T82pWxPzpwF2vxtRlfgssbLz2cnTMvNXqqH0GmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093806; c=relaxed/simple;
	bh=5sHi3bFMDiwX0tmxanhx4jyjqbwPRr5gyqoAJgQPGvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Had+mxjBGoLE83+0vmXWMoHGVKyIRruWmvPPihT4A1HMQFv0sZ8ViRnW1YxtEIOx+G3LNYOWmSQ20GlViIn/q3bAJsSLQ/a8ZXk73ksYkYfWgs30pDlG63rnZI9NJd96+SJz+CRlIHmsObYGYmUsTElNixRHX9ZADSRK5ArOog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajK6TyRF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajK6TyRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766093796; x=1797629796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5sHi3bFMDiwX0tmxanhx4jyjqbwPRr5gyqoAJgQPGvE=;
  b=ajK6TyRFGmnTPyhzkhsh1gXGRmRbAz5b2gJi8TtdgR1HpS6VGd9Qr310
   HBTjlC7V7k2HGzYi8/qnvKltIAa4DgcmdH88NNlfxnxj/eCHSyplY2Mwp
   x181PZX0u5A6fW7ULwqEEfs4s0bHq4evEI6eZSWTw3sZ3vUtpg/o9Kw7F
   YwyVVZeTBo4ZLwGFYqR2IqqvdsCK9jjeBWdNk8t/v20tm1skSFVOLQhOX
   lrs6bteN8Oe6G9iW3DD80N+I6a7LQDcdHWtmPyI8THUMKXd2+sC1BDnbC
   AC4Hodmq9qrnM8SGGJzIYhNpGPxDLWcphgnpTtq0r9xNrvsmv0BZbCWJq
   Q==;
X-CSE-ConnectionGUID: Jb1c+o62TuefRA+g7KdMYA==
X-CSE-MsgGUID: rnA5QMekSXWBA/4yvzY05w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78692872"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78692872"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:36:32 -0800
X-CSE-ConnectionGUID: eeqTbE4ZSR+xVuD4GyBLdQ==
X-CSE-MsgGUID: YhvwjWEASQiGCYyx3oeOtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198752449"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Dec 2025 13:36:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLfg-000000002g9-364M;
	Thu, 18 Dec 2025 21:36:28 +0000
Date: Fri, 19 Dec 2025 05:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 arch/arm64/mm/mmu.c:1499:5: warning: no previous prototype for
 'check_range_driver_managed'
Message-ID: <202512190511.Bh62PB13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sudarshan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 1b4aca7d82ae9b40145484fa09ceab38a6a06062 [4/4] ANDROID: arm64/mm: implement {populate/depopulate}_range_driver_managed
config: arm64-randconfig-003-20251219 (https://download.01.org/0day-ci/archive/20251219/202512190511.Bh62PB13-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190511.Bh62PB13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190511.Bh62PB13-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:1499:5: warning: no previous prototype for 'check_range_driver_managed' [-Wmissing-prototypes]
    1499 | int check_range_driver_managed(u64 start, u64 size, const char *resource_name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:16,
                    from arch/arm64/mm/mmu.c:11:
   arch/arm64/mm/mmu.c: In function 'check_range_driver_managed':
   include/linux/kern_levels.h:5:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
         |                  ^~~~~~~~
   include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
     343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~
   arch/arm64/mm/mmu.c:1509:3: note: in expansion of macro 'pr_err'
    1509 |   pr_err("%s: couldn't find memory resource for start 0x%lx\n",
         |   ^~~~~~
   arch/arm64/mm/mmu.c:1509:59: note: format string is defined here
    1509 |   pr_err("%s: couldn't find memory resource for start 0x%lx\n",
         |                                                         ~~^
         |                                                           |
         |                                                           long unsigned int
         |                                                         %llx


vim +/check_range_driver_managed +1499 arch/arm64/mm/mmu.c

  1498	
> 1499	int check_range_driver_managed(u64 start, u64 size, const char *resource_name)
  1500	{
  1501		struct mem_section *ms;
  1502		unsigned long pfn = __phys_to_pfn(start);
  1503		unsigned long end_pfn = __phys_to_pfn(start + size);
  1504		struct resource *res;
  1505		unsigned long flags;
  1506	
  1507		res = lookup_resource(&iomem_resource, start);
  1508		if (!res) {
  1509			pr_err("%s: couldn't find memory resource for start 0x%lx\n",
  1510				   __func__, start);
  1511			return -EINVAL;
  1512		}
  1513	
  1514		flags = res->flags;
  1515	
  1516		if (!(flags & IORESOURCE_SYSRAM_DRIVER_MANAGED) ||
  1517		    strstr(resource_name, "System RAM (") != resource_name)
  1518			return -EINVAL;
  1519	
  1520		for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
  1521			ms = __pfn_to_section(pfn);
  1522			if (early_section(ms))
  1523				return -EINVAL;
  1524		}
  1525	
  1526		return 0;
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
