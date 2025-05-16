Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB015665C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437520; cv=none; b=DFvybI3eeelXbxw20OvLo/hT1eUvEplSjXESvgMw7EbGhTaCxlKq7yCXW5l7KcFhk2VffOjMCJ14P+ozG2dtZBInPuEADz5EsR+qB6pIcK3G+hrsYdTXMWcCWAOsXOrODxzFmM6XfjbD7/6gwGTpkM/LrBH8NMttk7MfS/L0BXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437520; c=relaxed/simple;
	bh=wUMwRaS90krwkioahgWErDYneRaYIkp8P71PBn/9UNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJebpVL7kSrX4qUEpUZepcZ0zkUxop7kAB9owk0bQBmrYlpTX/0ymvspaibyKe8w4F/MYvw3rZi0leouLbAxffeGKgkHagQVJV8EpvYvDnptAS/U12naaA2yQEzRq9jY3ce7S7PKBcIjAMSc+NbouyCJVnDzB7/9Wm8/2sJ5FRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEGU2VS9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEGU2VS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747437518; x=1778973518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUMwRaS90krwkioahgWErDYneRaYIkp8P71PBn/9UNQ=;
  b=fEGU2VS9Quq3tMYrWIQ/acQrtUvs/zA5OfshvKXXOuQPAfquKwM11Z8c
   UvPRIlDF0xlxtCTFfqpblbv7YJV4HwPt8w1wjPA7BzbmzNoyGGpau7ORo
   aG7aOe6fehZRcozx9xpyQvrzNxx5eDt5MnPaVg+Rt43AU4XNXY2Hsks3W
   ZhEnEvWIRmzfkCb+hlKCf1TiZmXME3jOccY5KFMlBqLWGfOSoBq5RrH88
   dKR1W8hQudYwijktKH6g1yTvBC9W6ygAYHshA0NnzCeLCIl4t6VwJZP4F
   CT8i7NS8Ysmi9KkvcWDSAycQI1Nc7XUDVt1tTbvFz75MyaXGhDBszgyKp
   A==;
X-CSE-ConnectionGUID: UW10mpFlTl2+toUxbjGIvQ==
X-CSE-MsgGUID: 6C84tT//SkKE7fgalPWrwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60814777"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="60814777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 16:18:38 -0700
X-CSE-ConnectionGUID: 2e9HKZ/3TMKqap1I/qgTmw==
X-CSE-MsgGUID: LzxZcaFGTk2Fa1vQVh8oYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="169857722"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 16:18:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4K2-000Jmb-2S;
	Fri, 16 May 2025 23:18:34 +0000
Date: Sat, 17 May 2025 07:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:cpumask_next 22/33] drivers/net/wireguard/queueing.h:107:20:
 error: 'cpu' undeclared
Message-ID: <202505170753.TAEYmvkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux cpumask_next
head:   0577ced82818590ec7abe2f40119b340c1124a55
commit: 04ae3062fb41ac0c5445a26ddc6c1b0ca2562e8e [22/33] wireguard/queueing: simplify wg_cpumask_next_online()
config: um-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170753.TAEYmvkT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170753.TAEYmvkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170753.TAEYmvkT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/uapi/asm/swab.h:6,
                    from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:14,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/linux/unaligned.h:10,
                    from include/crypto/utils.h:10,
                    from include/crypto/algapi.h:10,
                    from include/crypto/curve25519.h:9,
                    from drivers/net/wireguard/messages.h:9,
                    from drivers/net/wireguard/noise.h:8,
                    from drivers/net/wireguard/device.h:9,
                    from drivers/net/wireguard/peer.h:9,
                    from drivers/net/wireguard/peer.c:6:
   drivers/net/wireguard/queueing.h: In function 'wg_cpumask_choose_online':
>> drivers/net/wireguard/queueing.h:107:20: error: 'cpu' undeclared (first use in this function)
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |                    ^~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/net/wireguard/queueing.h:107:9: note: in expansion of macro 'if'
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |         ^~
   include/linux/compiler.h:44:26: note: in expansion of macro '__branch_check__'
      44 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/queueing.h:107:13: note: in expansion of macro 'likely'
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |             ^~~~~~
   drivers/net/wireguard/queueing.h:107:20: note: each undeclared identifier is reported only once for each function it appears in
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |                    ^~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/net/wireguard/queueing.h:107:9: note: in expansion of macro 'if'
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |         ^~
   include/linux/compiler.h:44:26: note: in expansion of macro '__branch_check__'
      44 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   drivers/net/wireguard/queueing.h:107:13: note: in expansion of macro 'likely'
     107 |         if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
         |             ^~~~~~


vim +/cpu +107 drivers/net/wireguard/queueing.h

   104	
   105	static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
   106	{
 > 107		if (likely(cpu <= nr_cpu_ids && cpumask_test_cpu(cpu, cpu_online_mask)))
   108			return cpu;
   109	
   110		*stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
   111		return *stored_cpu;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
