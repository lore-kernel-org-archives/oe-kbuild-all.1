Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EC1226D1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738855; cv=none; b=eOuFovGOW2E58i9sTpHvgDC+Bli2ouIBbTikdIiMwS5KB4AMzgKF6Z9gwRWTuK3ZxJ/zpFdqMokhKuYFBUCa+xgxz5Jj/jmUs02XIhbGyfXRgNjbjKE9SLgWINISV6PUMLRvoZqtvhEVcniXxCqETfDDtfqYU9TohScWA7COOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738855; c=relaxed/simple;
	bh=Yje9xFgm75K8sEIzRUWMzA37l7Ty4OMxnBEYnAzp1A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hT7gRTVrWsc2wFQpupLyUvhNIDnJAJQlbYrgD61OLuwUhnHp/8Zir5r+KYcTFghjtJ9eLp9kKTW7JvPs98c1ld7mw94JRGD8BWmI7RBEwfzp3CRaJ1yeDeq5ObORQ6CkbUY+5B86UUEqJF7juQuOLaRhfw3N9LNLjZSelmsNoBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDXL2BVp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDXL2BVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761738855; x=1793274855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Yje9xFgm75K8sEIzRUWMzA37l7Ty4OMxnBEYnAzp1A0=;
  b=GDXL2BVpVDQEsMD8dcZfNPfpjFidaS2JbV2ghzp4EbKt8Ca3Ms5aGPKo
   p2jNW1tg2b7k5sFHzuu6B/xbRNaQMZ29297EEAe3A6AncCL3NBy8Fizze
   +Mt433j2nv6EP4K2wd4LN2XzL6Yx6o6FW2tQ7P1o57afVDgrGTcoTe9Kr
   4fJZSbEVcutkSEjOMh5a9MVfk1PgyPEKLjuqV3x4Af8U4g+aWXA2D+UR7
   LZdx2gBhzgUJQ0F2y1vfJUH2I6z7FKTMsfZpFYpJ4qqiaBcwOGUbzEWgU
   6SqyZP6/p1mlYjmZ/0HBPmIq0iEGVqHczybQmpaD6xNMah27J4Wjoe+0o
   Q==;
X-CSE-ConnectionGUID: Ff/IZczAQ/uuYwMrZowfWA==
X-CSE-MsgGUID: Z/W2AI+WTAG4EY7SRXi5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63558005"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63558005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:54:14 -0700
X-CSE-ConnectionGUID: qYSNYPrGTDKDokJgwriP2Q==
X-CSE-MsgGUID: xKliq3n7SpWY87QJy7hWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185273493"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 04:54:13 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE4kk-000000000v2-22ec;
	Wed, 29 Oct 2025 11:54:10 +0000
Date: Wed, 29 Oct 2025 12:53:38 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v2 41/57]
 include/linux/riscv_sbi_sse.h:44:16: error: implicit declaration of function
 'ERR_PTR'
Message-ID: <202510291221.8EMy7jVr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   005a50cd1be4398665affda2d7a63ce16c4eab01
commit: 9b88b132cc8aab2bb34e7e8dad4187c526e60d1e [41/57] riscv: Introduce HEST SSE notification handlers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510291221.8EMy7jVr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291221.8EMy7jVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291221.8EMy7jVr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sbi_sse.h: In function 'sse_event_register':
>> include/linux/riscv_sbi_sse.h:44:16: error: implicit declaration of function 'ERR_PTR' [-Wimplicit-function-declaration]
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
>> include/linux/riscv_sbi_sse.h:44:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h:44:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/riscv_sbi_sse.h: In function 'sse_event_set_target_cpu':
   include/linux/riscv_sbi_sse.h:52:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      52 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_register_ghes':
   include/linux/riscv_sbi_sse.h:58:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      58 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_unregister_ghes':
   include/linux/riscv_sbi_sse.h:63:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      63 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sbi_sse.h: In function 'sse_event_enable':
   include/linux/riscv_sbi_sse.h:68:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      68 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   In file included from include/linux/cleanup.h:6,
                    from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from drivers/acpi/apei/ghes.c:21:
   include/linux/err.h: At top level:
>> include/linux/err.h:39:35: error: conflicting types for 'ERR_PTR'; have 'void *(long int)'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^~~~~~~
   include/linux/riscv_sbi_sse.h:44:16: note: previous implicit declaration of 'ERR_PTR' with type 'int()'
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~


vim +/ERR_PTR +44 include/linux/riscv_sbi_sse.h

3e89594245fa2cf Clément Léger 2025-09-08  38  
3e89594245fa2cf Clément Léger 2025-09-08  39  #else
3e89594245fa2cf Clément Léger 2025-09-08  40  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
3e89594245fa2cf Clément Léger 2025-09-08  41  						   sse_event_handler_fn *handler,
3e89594245fa2cf Clément Léger 2025-09-08  42  						   void *arg)
3e89594245fa2cf Clément Léger 2025-09-08  43  {
3e89594245fa2cf Clément Léger 2025-09-08 @44  	return ERR_PTR(-EOPNOTSUPP);
3e89594245fa2cf Clément Léger 2025-09-08  45  }
3e89594245fa2cf Clément Léger 2025-09-08  46  

:::::: The code at line 44 was first introduced by commit
:::::: 3e89594245fa2cf4bd298955d807fcd625294f22 drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
