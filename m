Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E031E5713
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932747; cv=none; b=gpqpi1p5wnXjJWaExLSlby95NL6h0NQB1FslWzaMz7Nm4ZdS5aQ4KpqGK5aMW1ykSkcqGxbyaWDveRUnh6nsDg0UvQWmsoC86xhk2W5qDRLpIj1IGDgaMNgvsNsJaDp2NXfoN4vNJ08KQnwQZiRK3dedOXvL4vm07HI+hZtxPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932747; c=relaxed/simple;
	bh=RorqNPFrZiLjbMQ4dE8WDLzVn5AbFrwSpXvSaSzh5xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJWyIxRlCMguAZ1DVXL8KvnisSCXLOOk1EE4xoCZRbcd0T/q/cTzRLuBPtlCqAmgfkA1olPVN9UzEqe20zUrpHzFggYXQTQEI6Buznav2eJGY8i9us52iOn4o2aUweI4kSd/l64o0iz4wvMv+vp5Tq1mlgxj1XvYiq7M0loBElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVZYyDfg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVZYyDfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740932745; x=1772468745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RorqNPFrZiLjbMQ4dE8WDLzVn5AbFrwSpXvSaSzh5xw=;
  b=bVZYyDfgoaqk7YuoKhUFC4NtFPMv8Vb5vp6w2xXdWdBuNXdGmOlIZJ07
   Yo12xG6TX4IznaqmTH/77JzYybpIqP9LVCmc55tuoB5djnG7gJnK2fEmz
   yiFXozdhvGxMRH2HFC240r1K9qrQ9evXwAnd+huiaQKubzA9vWy9KjI6H
   uNZ6p70zeOgyUqjkt8RNBECu0fh/KRa0jO0lGn1Ewpgnj9gabSkq+uO80
   INoGM3LVzLIkkBohOK40dT2MXG3eNPnpOZ/26k9MEoh24yx5k2byjX6bv
   ZR5lVXvn/fcDyFuVF3yFMHX0KVL7XxxamoiKAtePGj03k++k4Cw8Hgvb5
   w==;
X-CSE-ConnectionGUID: rGqDSrTZT6K4zsasZ4PaiQ==
X-CSE-MsgGUID: LP2Bg03WRpuGrnwdKg6R+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42062027"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="42062027"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 08:25:43 -0800
X-CSE-ConnectionGUID: qaDLpFsTSg6G7g2n1nKfZw==
X-CSE-MsgGUID: yMqsU9CoTS2yb2Q+CO1l1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="117595259"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2025 08:25:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tom8K-000HS6-2Q;
	Sun, 02 Mar 2025 16:25:40 +0000
Date: Mon, 3 Mar 2025 00:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:timed-may-goto 1/1] vmlinux.o: warning: objtool:
 arch_bpf_timed_may_goto+0x24: 'naked' return found in MITIGATION_RETHUNK
 build
Message-ID: <202503030030.6pMxpW2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux timed-may-goto
head:   45ff7356c9ab73e7534fd1a2aca784c8bab7eedb
commit: 45ff7356c9ab73e7534fd1a2aca784c8bab7eedb [1/1] bpf: Implement timed may_goto support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250303/202503030030.6pMxpW2c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030030.6pMxpW2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030030.6pMxpW2c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: arch_bpf_timed_may_goto+0x24: 'naked' return found in MITIGATION_RETHUNK build
   vmlinux.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function __cfi_nvmet_ctrl_host_traddr_open()
   vmlinux.o: warning: objtool: amd_set_spi_freq() falls through to next function amd_spi_busy_wait()
   vmlinux.o: warning: objtool: tw28_set_ctrl_val() falls through to next function __cfi_tw28_get_ctrl_val()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
