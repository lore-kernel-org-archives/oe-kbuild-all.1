Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD918A6B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732141613; cv=none; b=EHf5nkzpciL/WyQEZW3GANZKPc9QpEoGUbRfBNXZXkeSENhAA3B2/rvNCJM/MRg5woQtIh3RR5JLlPX0UmadjBWfwo4QfXfOwZjJY98+h1/8r4hAeI7BxAx9oWUw7+frPo46CfLW8JSPa+2r85tyCjOSTkIZ8IyZGu1PncIrNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732141613; c=relaxed/simple;
	bh=BO0L4AWnY5WvtuBPzTOUA36UsSoB4OvYEz/SlKBDowo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOhZxM/1q994ogiXqkU4JKzfySvFRlcf9iB4idW5rHiUyPB7q7P3a7/j0YuPOQINF9khVtvr/EmChMNLaJo+bum66InJNyxt+KS4LgEkrvYmm5bDUUAlUytKmFlYprvmM94Vj3AbxZyD6XCzuIjgTiAh5emtzVX9nNcj5WyrVOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+CZZIK5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+CZZIK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732141611; x=1763677611;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BO0L4AWnY5WvtuBPzTOUA36UsSoB4OvYEz/SlKBDowo=;
  b=b+CZZIK5vHSXJAc1aBWhhImwWkXERuDTfvMhJq+zqa9z5fMWExndCkDg
   ecu890/OGu9ptC8CIiSa2A2+54PXHvv5oDu3RkP94eXXT6d0VIKQrSPHL
   bcJEmPBBPBhTLDKFh9xRZIbIbIKL1GnRxVUnNoFavZM8DLOMnqeDZn3Um
   rqoXo0OSR/yJrwUE8v3Norqz6xYghdkwabP1bOHmwgoMdsGJ4qQrgvW+a
   B5WNlBqmFFX1W0gRHmyhY5pz7EWaRShBmZ9mJ6FF7ISEHuNEZOrRrBwbJ
   uQIbzrq748c1jlHQVJ0q4+78GXeeYUVX36vHOH99E92CzCyoSZ17XpCl7
   A==;
X-CSE-ConnectionGUID: AAI0zvWwQe22mOzCyvn1nw==
X-CSE-MsgGUID: f6u5ED+WSw+M7HKQdYpWiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54727775"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="54727775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 14:26:48 -0800
X-CSE-ConnectionGUID: f5jypCwQQbiDeZphJRBR2g==
X-CSE-MsgGUID: DHDK+YC7QtyceFDRC1aoFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="89849971"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 14:26:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDt9p-0001CM-2I;
	Wed, 20 Nov 2024 22:26:45 +0000
Date: Thu, 21 Nov 2024 06:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 86/91] include/linux/riscv_sse.h:65:17:
 error: 'EOPNOTSUPP' undeclared
Message-ID: <202411210632.MlmqitjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   1327ec8b5a02d00ad7ac1ce8e4d0591487ea884f
commit: 81bb986dce08d54e4f8d3d6971dae18608b99244 [86/91] riscv: Introduce HEST SSE notification handlers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241121/202411210632.MlmqitjL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210632.MlmqitjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210632.MlmqitjL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sse.h: In function 'sse_event_register':
>> include/linux/riscv_sse.h:65:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      65 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h:65:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/riscv_sse.h: In function 'sse_event_set_target_cpu':
   include/linux/riscv_sse.h:73:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      73 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_event_enable':
   include/linux/riscv_sse.h:78:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      78 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: At top level:
>> include/linux/riscv_sse.h:83:44: warning: 'struct ghes' declared inside parameter list will not be visible outside of this definition or declaration
      83 | static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
         |                                            ^~~~
   include/linux/riscv_sse.h: In function 'sse_register_ghes':
   include/linux/riscv_sse.h:86:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      86 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: At top level:
   include/linux/riscv_sse.h:89:46: warning: 'struct ghes' declared inside parameter list will not be visible outside of this definition or declaration
      89 | static inline int sse_unregister_ghes(struct ghes *ghes)
         |                                              ^~~~
   include/linux/riscv_sse.h: In function 'sse_unregister_ghes':
   include/linux/riscv_sse.h:91:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      91 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~


vim +/EOPNOTSUPP +65 include/linux/riscv_sse.h

9fb4ca437efa2c Clément Léger    2023-06-13  57  
d8850d34eb078f Himanshu Chauhan 2023-10-26  58  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
d8850d34eb078f Himanshu Chauhan 2023-10-26  59  		      sse_event_handler *hi_cb);
d8850d34eb078f Himanshu Chauhan 2023-10-26  60  int sse_unregister_ghes(struct ghes *ghes);
9fb4ca437efa2c Clément Léger    2023-06-13  61  #else
9fb4ca437efa2c Clément Léger    2023-06-13  62  static inline int sse_event_register(struct sse_event *evt, u32 priority,
9fb4ca437efa2c Clément Léger    2023-06-13  63  				     sse_event_handler *handler, void *arg)
9fb4ca437efa2c Clément Léger    2023-06-13  64  {
9fb4ca437efa2c Clément Léger    2023-06-13 @65  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  66  }
9fb4ca437efa2c Clément Léger    2023-06-13  67  
9fb4ca437efa2c Clément Léger    2023-06-13  68  static inline void sse_event_unregister(struct sse_event *evt) {}
9fb4ca437efa2c Clément Léger    2023-06-13  69  
9fb4ca437efa2c Clément Léger    2023-06-13  70  static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
9fb4ca437efa2c Clément Léger    2023-06-13  71  					   unsigned int cpu)
9fb4ca437efa2c Clément Léger    2023-06-13  72  {
9fb4ca437efa2c Clément Léger    2023-06-13  73  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  74  }
9fb4ca437efa2c Clément Léger    2023-06-13  75  
9fb4ca437efa2c Clément Léger    2023-06-13  76  static inline int sse_event_enable(struct sse_event *sse_evt)
9fb4ca437efa2c Clément Léger    2023-06-13  77  {
9fb4ca437efa2c Clément Léger    2023-06-13  78  	return -EOPNOTSUPP;
9fb4ca437efa2c Clément Léger    2023-06-13  79  }
9fb4ca437efa2c Clément Léger    2023-06-13  80  
9fb4ca437efa2c Clément Léger    2023-06-13  81  static inline void sse_event_disable(struct sse_event *sse_evt) {}
9fb4ca437efa2c Clément Léger    2023-06-13  82  
d8850d34eb078f Himanshu Chauhan 2023-10-26 @83  static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
d8850d34eb078f Himanshu Chauhan 2023-10-26  84  				    sse_event_handler *hi_cb)
d8850d34eb078f Himanshu Chauhan 2023-10-26  85  {
d8850d34eb078f Himanshu Chauhan 2023-10-26  86  	return -EOPNOTSUPP;
d8850d34eb078f Himanshu Chauhan 2023-10-26  87  }
d8850d34eb078f Himanshu Chauhan 2023-10-26  88  

:::::: The code at line 65 was first introduced by commit
:::::: 9fb4ca437efa2cc79d5cc0e2c775dda48271faea riscv: add support for SBI Supervisor Software Events extension

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
