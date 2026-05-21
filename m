Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE79376A10
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356158; cv=none; b=tEO1gm5LMUdOWrWzPPCg0LXHW2trw3uj55yN2IL92CifbdJrLnp+J3klTVly7oaE5WijabEMkvRR6hht4TByUKtQewDbCXWuZypa/zGBM4pn2KTLRjDFzfao7nfjDQePEhp759qJ76afzSqFz1FRsO7t+gNZgzTg19AXcSlNZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356158; c=relaxed/simple;
	bh=1phAAsYEWR8bt4oL6UVtm8dilN0Xvba/INAEmXa0/PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jKF8uno0m5QRDk5mO2PcBqvi+Cwsa1flox0bSarkO6Wp+sGicaECxVrXwx7tVTsdUKPnNDAoDEExWfmvVPrGUZ1zZX2n2qWWg2KsdMsWPgK1V4HkAGTpEceygdYM2b24JjKEKbDxXORkAI3L1Uad2kCyQTYyLd++UVL3q28rCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yzqk+Vnd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yzqk+Vnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779356157; x=1810892157;
  h=date:from:to:cc:subject:message-id;
  bh=1phAAsYEWR8bt4oL6UVtm8dilN0Xvba/INAEmXa0/PE=;
  b=Yzqk+Vndvz8rHpahKl28PKbVoGY0b5Hk9U8eTJk4eMTAuxQvHMA/3j4J
   AJgn/P4IKF7ijceZIW9nETFshXansatDge/zM64HBeB22fKQSrNAdw54l
   WMvcOMaI5n9i2DYVPEWSx0SSE+Q+K98JYuMLt1sxTQf+/uMReR2Wu39HB
   1y5XeKXGErlCEPEFTuZUNamr2LV8CBkc3V8QQ/LQhsUOq8Dw80ZGNJRGr
   X5ynabKI9fmyY4KO+PIC9f2QVvyflW7HgGU8+MmaBCVYAhFYBY2mKKZ/g
   WFngGagxYBHQl6WpjYxY/hZcJ8bH2lzq/fpwAvbX3nCXzpMQcEoYss7w/
   Q==;
X-CSE-ConnectionGUID: 9UeDJH0wRM6z6O3rvn10OA==
X-CSE-MsgGUID: g1jBwXjdR62kJsZClft6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97698834"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="97698834"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:35:56 -0700
X-CSE-ConnectionGUID: ZUiuvGVbTNqQSb4OI/QKIA==
X-CSE-MsgGUID: Z93wI8NSTzGN8liPD3ZZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="237457491"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 May 2026 02:35:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzom-00000000App-41JO;
	Thu, 21 May 2026 09:35:52 +0000
Date: Thu, 21 May 2026 11:35:16 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/linux/math64.h:184:undefined reference to
 `ntp_get_time_state'
Message-ID: <202605211131.4itLcRA7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/MAINTAINERS-Add-Miroslav-as-timekeeping-reviewer/20260520-221128
head:   9f455e02d06fb889c99cbc8e086de8a7e0e6ad23
commit: 9f455e02d06fb889c99cbc8e086de8a7e0e6ad23 kernel/time: Add /dev/vmclock_host miscdev
date:   19 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605211131.4itLcRA7-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211131.4itLcRA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211131.4itLcRA7-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-gnu-ld: kernel/time/timekeeping.o: in function `timekeeping_set_reference':
   kernel/time/timekeeping.c:2353:(.text+0xb9a): undefined reference to `ntp_get_status'
   riscv64-linux-gnu-ld: kernel/time/timekeeping.o: in function `mul_u64_u64_shr':
>> ./include/linux/math64.h:184:(.text+0xba6): undefined reference to `ntp_get_time_state'


vim +184 ./include/linux/math64.h

be5e610c0fd6ef Peter Zijlstra 2013-11-18  180  
35181e86df97e4 Haozhong Zhang 2015-10-20  181  #ifndef mul_u64_u64_shr
fc4a0db4149afc Peter Zijlstra 2023-05-19  182  static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
35181e86df97e4 Haozhong Zhang 2015-10-20  183  {
35181e86df97e4 Haozhong Zhang 2015-10-20 @184  	return (u64)(((unsigned __int128)a * mul) >> shift);
35181e86df97e4 Haozhong Zhang 2015-10-20  185  }
35181e86df97e4 Haozhong Zhang 2015-10-20  186  #endif /* mul_u64_u64_shr */
35181e86df97e4 Haozhong Zhang 2015-10-20  187  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
