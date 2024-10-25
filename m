Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953421A4BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875623; cv=none; b=WeMPuQordiXCeA3PYxkkj48zsgUlEMhq/kTFT3bAGTjpu7sYjYlY/cfRq+cfh/rc0hR8/nRQNe4g8yVEUJqBeZo9yp954IEDbxpLfwhpm1Q8DAmcSTNrm9HS1D1cgoXTJWBX0TLN9GSXOe65RgnS9mxuTqgKD/25RGqAa0W4Pjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875623; c=relaxed/simple;
	bh=BxxJwS/mKssbWbyl/Rd9kUHBemtteh0nnUkSBFkxbmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAfL+xdkMALKrzmKulLCZUxcz41/cDckw60cjTXNmm5yYQB8JbFd/RwgYrIEHQ4fuDn+VKmDRsdXZXz39AYSk+o9eY1L396PQn+wmIu29wYVMWSw3Ir0n4ddp3Tk5YBEl759VjOIcoJ8YbDcx8MyQBB0wV6ZhscD2JBCwNagx7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1u1B3DL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1u1B3DL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729875621; x=1761411621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BxxJwS/mKssbWbyl/Rd9kUHBemtteh0nnUkSBFkxbmM=;
  b=i1u1B3DLRqFCBZhBQLuevXZfl+qqZLct+TVIt5vzempE3nhtSEHDrLJ0
   UnT9NG7LbD6jIkVm4s+YLphQqRcfNviJt77QPAsOuM8mZJDLc8AHOjd2i
   MMuA24vChSWPRqfG4bDzgtxWJLYGToOofXfA9kdQapAEZ5+Mu5Bpfjc+9
   2IKlGSINQ9K+IWs3RUHFpRLYY7+554tKj0PRvCLmMDTV685rZv5h0rBx9
   k1y4cqU+Vi1bcjkDJTDbxOhlBWe+P2OnOxpVM7HxokauEM1K/YjBwVRf8
   c550g6D+ThgNo+B3/zRlrvBYQasDIRbLYwCg9QcNEnZHDKQmbnG9vUVZC
   A==;
X-CSE-ConnectionGUID: j7q0MYC2TqiSaumtsu91Hg==
X-CSE-MsgGUID: vz/yEDZNQ7CeM7V1LZDWrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40655868"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40655868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 10:00:21 -0700
X-CSE-ConnectionGUID: hpeAB6o/RFaDtA/SDuKxMg==
X-CSE-MsgGUID: rDi5UjlISZCAV/IDjRGq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="111797513"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2024 10:00:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Nfc-000Ye3-2Q;
	Fri, 25 Oct 2024 17:00:16 +0000
Date: Sat, 26 Oct 2024 00:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 16/17] traps.c:undefined reference to
 `unwind_ctx_ctr'
Message-ID: <202410260032.20kMKPsO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   7f54f6a91246a746ba799c52c97effb41e28a88b
commit: 7a409ba76d997448b80fddf0b3fc96f554aeff14 [16/17] ctx_ctr
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20241026/202410260032.20kMKPsO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260032.20kMKPsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260032.20kMKPsO-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `do_trap_ecall_m':
>> traps.c:(.noinstr.text+0x890): undefined reference to `unwind_ctx_ctr'
   riscv64-linux-ld: kernel/fork.o: in function `mmput':
   fork.c:(.text+0xbbc): undefined reference to `unwind_task_free'
   riscv64-linux-ld: kernel/fork.o: in function `copy_process':
   fork.c:(.text+0x16e2): undefined reference to `unwind_task_init'
   riscv64-linux-ld: kernel/entry/common.o: in function `syscall_enter_from_user_mode_prepare':
>> common.c:(.noinstr.text+0x40): undefined reference to `unwind_ctx_ctr'
   riscv64-linux-ld: kernel/entry/common.o: in function `syscall_exit_to_user_mode':
   common.c:(.noinstr.text+0x114): undefined reference to `unwind_ctx_ctr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
