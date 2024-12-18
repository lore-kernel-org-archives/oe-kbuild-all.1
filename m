Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6FC156991
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734505643; cv=none; b=c/DIKdPyh9D0QkMMbwJqIec82QpDHKjQ9zo9iNT95EXs61sWwaFD+BCs5ivhl7buCi2AXLQY/0MkE53lWx+cGVOuL/aFBJ0Hs27KlvKnGSHgHHw8T7+E6OMA837bAQeYQ+saPVNX3qu2ivmv89hTAiJyBZWmQMFPHyRozC0PuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734505643; c=relaxed/simple;
	bh=9/qyl1UdTT9UP/C2DlDLlu3RIKa6V38ESVKr1L7Fn4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4UP2K0oJTmpHs3fHswXiXZ6FEgXeAqtbEPzrNcF5EURYOGfIUoFH4et6kU9xw+Bwse4FOOxlOXYFXFnl3+KRNjYegY7FtkNA77bN7mF6Kko/8qgk5vD9fqY6Pq5Z2PqC125o1fxSMh7Q1Pfjnko3ZJgN9sdpNr9u82q0rz24ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2Az3vCv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2Az3vCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734505641; x=1766041641;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9/qyl1UdTT9UP/C2DlDLlu3RIKa6V38ESVKr1L7Fn4M=;
  b=N2Az3vCvGEpdmi4iQTqtvsBr6cN0wYVYMTpX7jk1r4YPhqDaAg/beLeA
   go7BwB1bS6fv2uZxSmF041G1Xm3ikZ/mU74hCj0BaLlbilip6SF9iCtrF
   W7YvlekrrXS7XTyDHe7YB9ZG81FdJ3dFZ1o3LO4G3PPfOz3cin43B61Ar
   szESBn6fi7HTm2b+e3SWvee74lRyTCGFmRVivznrvIozBV5EdbtC/8jO6
   3SROefHCP2J0SQ7cQyj60YjgtXbJxSCAwK/jvFo7nKflu8GCdhKSQEYva
   yCF22bqRLRArkI+/zkUh5DGwlhCYM6NdV7zNxJZgemrhji4IATLdf4ip4
   g==;
X-CSE-ConnectionGUID: kkVgIA+8RKi0zz5TZnBZyg==
X-CSE-MsgGUID: Q5zoxM8fT2GYERsDyciYrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37802249"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="37802249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 23:07:18 -0800
X-CSE-ConnectionGUID: jatEZCCmS+upOABLMhTq6Q==
X-CSE-MsgGUID: S2/us5FfSwqMKVRYlsiigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128753847"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2024 23:07:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNo9K-000GAg-05;
	Wed, 18 Dec 2024 07:07:14 +0000
Date: Wed, 18 Dec 2024 15:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 54/59] include/linux/riscv_sse.h:40:16:
 error: implicit declaration of function 'ERR_PTR'
Message-ID: <202412181703.Lt1RFtxU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 1246727818573869b528326a8ea0b79b7c430763 [54/59] riscv: Introduce HEST SSE notification handlers
config: x86_64-buildonly-randconfig-006-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181703.Lt1RFtxU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181703.Lt1RFtxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181703.Lt1RFtxU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sse.h: In function 'sse_event_register':
>> include/linux/riscv_sse.h:40:16: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
>> include/linux/riscv_sse.h:40:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^~~~~~~~~~
   include/linux/riscv_sse.h:40:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/riscv_sse.h: In function 'sse_event_set_target_cpu':
   include/linux/riscv_sse.h:48:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      48 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_event_enable':
   include/linux/riscv_sse.h:53:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      53 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_register_ghes':
   include/linux/riscv_sse.h:61:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      61 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_unregister_ghes':
   include/linux/riscv_sse.h:66:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      66 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   In file included from arch/x86/include/asm/processor.h:36,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from drivers/acpi/apei/ghes.c:21:
   include/linux/err.h: At top level:
>> include/linux/err.h:39:35: error: conflicting types for 'ERR_PTR'; have 'void *(long int)'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^~~~~~~
   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sse.h:40:16: note: previous implicit declaration of 'ERR_PTR' with type 'int()'
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
   cc1: some warnings being treated as errors


vim +/ERR_PTR +40 include/linux/riscv_sse.h

4552a7367be3171 Clément Léger    2024-12-06  31  
72590be23472547 Himanshu Chauhan 2023-10-26  32  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
72590be23472547 Himanshu Chauhan 2023-10-26  33  		      sse_event_handler *hi_cb);
72590be23472547 Himanshu Chauhan 2023-10-26  34  int sse_unregister_ghes(struct ghes *ghes);
4552a7367be3171 Clément Léger    2024-12-06  35  #else
4552a7367be3171 Clément Léger    2024-12-06  36  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
4552a7367be3171 Clément Léger    2024-12-06  37  						   sse_event_handler *handler,
4552a7367be3171 Clément Léger    2024-12-06  38  						   void *arg)
4552a7367be3171 Clément Léger    2024-12-06  39  {
4552a7367be3171 Clément Léger    2024-12-06 @40  	return ERR_PTR(-EOPNOTSUPP);
4552a7367be3171 Clément Léger    2024-12-06  41  }
4552a7367be3171 Clément Léger    2024-12-06  42  

:::::: The code at line 40 was first introduced by commit
:::::: 4552a7367be31713c5e06313f2a8e7233aceaafd drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
