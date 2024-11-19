Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2620D20E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731990715; cv=none; b=nqNHglZRiEM9HGu+O+2uGx+0WNogTNhzgFKdx6PKpuGvO+Qtmk4q5j1sZ+8+T0AVFvFfQBVSrxYQ8lLlt3MJQcSAvr0HJuOcOsN8Mv9LN8OPxbnYlRB1ufblIcvmazcNNCB2f5WMHxJQIw90Jp5UB83/CwzcM5LaxjW//H2n/qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731990715; c=relaxed/simple;
	bh=jitXBJTRsWrqBbQ7vyPrapjd/dqZEXNZJBVAUb/ykKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFTLrMW2UpGRVS8MRHnvAZhF7UwL1gdtvcXusEvgEgYwO/0kLMA/i6pyRyYnLaIwfZVF9IL2hv9a9IhGRAsHBs521Xl2Q5xPiVBbw/3TFDh3XaGzw7WFPyxx3yx8uAiD142mG2vxTy3Lw8uLBWldQSblA7UmHcbhlouRapfQDlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIeciN6N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIeciN6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731990713; x=1763526713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jitXBJTRsWrqBbQ7vyPrapjd/dqZEXNZJBVAUb/ykKs=;
  b=dIeciN6NshX7qMNrRFn2IkpDfq4MoqqUq2OxgJxD2Wf8eP+X1glGYJ6L
   CCRTH2GiI9rCGA5NjOnLBZ/t2bXpk/V0eJ5PFypBO8yG0l83XOv5s8YKg
   w0XqhyGTWbreOTJtR4/O4TXVRKknBUxCQwYrcjBgA8FjOJ4p4vqpgGEtP
   xm6/vcERmqmUWT+FNgp0ejWznDaUrh0n4sCnXHcXlYDPJZGILUYfFk3yx
   nUbL5yXLsvu+7HI8Pzz9/ZyHvlDif1lZ5voBh2+kkiEdNXyo20zRsUXlK
   xUrvtyD9hfUEI4D4OQgoVn5mInuJfw0eUYcdUTX/QoOPs/zS3zXNcGsI7
   A==;
X-CSE-ConnectionGUID: wn6ZXPAGQAKLKoCy1z5VvQ==
X-CSE-MsgGUID: rVA4QnX+TnqzhCw9PHG1IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32077541"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="32077541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 20:31:52 -0800
X-CSE-ConnectionGUID: d+vpuc0OQTCmryAgzEE24g==
X-CSE-MsgGUID: Bhrx0hO3Qimd+VI6t/D7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89454804"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2024 20:31:52 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDFu1-00006Y-1r;
	Tue, 19 Nov 2024 04:31:49 +0000
Date: Tue, 19 Nov 2024 12:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 11/12] ld.lld: error: undefined symbol:
 __tracepoint_cros_vfs_rename_exit
Message-ID: <202411191208.G62uoepD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   88ae4c0585c1cbf6bcc0d9aeadb3e8f207530c9f
commit: a6725d3a987f03c22ed97a67a8ab6b5c63243807 [11/12] CHROMIUM: add cros file rename tracepoints for bpf
config: arm64-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241119/202411191208.G62uoepD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191208.G62uoepD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191208.G62uoepD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __traceiter_cros_vfs_rename_exit
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced by cros_file.h:68 (include/trace/events/cros_file.h:68)
   >>>               fs/namei.o:(vfs_rename) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: __tracepoint_cros_vfs_rename_exit
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x8) in archive vmlinux.a
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x18) in archive vmlinux.a
   >>> referenced by namei.c
   >>>               fs/namei.o:(__jump_table+0x28) in archive vmlinux.a
   >>> referenced 3 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
