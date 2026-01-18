Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B3E21E0AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768718833; cv=none; b=E8ELH+Rsv0WWdGuvfoJidhcMM8snE+D/bg+IX+pif72sd3ZlXfrTt1BdCC7TX/OIPzZj8EpPsORxjq/Fs9D58w//PZxkFaA2aRbGQoOPnA3COJwIreQcWrrWmrImn18qr1c0S22kEmx8LzLiyOKQEfvnWbjc8CNzPKk+6VHAIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768718833; c=relaxed/simple;
	bh=LEVSEHA29ruz5rX3OPbrViV53kqjyzeY6iWEkUBZceY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cKm00GgeY0hB3ljTkoTXBMKYzzfu8b+hMo41dEvnozlRB+YLq44mFEnoJylc4pKyz1LoTvAzDe2hy9KGFRz38ya2kL4olOIBpcpftJLF5zIV3TFX3rgbWvPMtLmVYrdXhh93i3RdUxIMfxyBPNm46RwQ+6+hpkj2cVmzGeD7kQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eN3NmMMg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eN3NmMMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768718832; x=1800254832;
  h=date:from:to:cc:subject:message-id;
  bh=LEVSEHA29ruz5rX3OPbrViV53kqjyzeY6iWEkUBZceY=;
  b=eN3NmMMgXoUaHi3u/6YrPUYOSGYgbnJXVXpPlh/PG3BeDXLh/jsu9z63
   B2GMaFBxPyYXilTe0lHXuI15IyjIcb3W0PE6TJ5JPkp/p3RBB0NctAwed
   JnJLAF2t9fhjVmHZuVMqwC9HVU9kpR0X0eEzgdgvdN71anLV4y4cM+1Nu
   a6+mL5h3ynABi1lCLpVgdWFqBjD6I/RM+2pHlF7o1lmIa5gKcJmxJIuJb
   CwRKkZJAwVNixL249zdJh19PknChmJkL09acjBVVWBGgSvO7k0T8mvNht
   UXGDRSeEE11AbkvxBVhybdttuTIT4Df1MtguDVLSZXBEOpKe5rLwW/n+A
   Q==;
X-CSE-ConnectionGUID: UGdb2MElRGSF4+wzJ8HIoA==
X-CSE-MsgGUID: Qc+yzBXkR1+sgdZdmQRrpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="70017694"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="70017694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:47:10 -0800
X-CSE-ConnectionGUID: DntRyz/jQCyYMdatHEkjvQ==
X-CSE-MsgGUID: f0CQmo+oTbqSpAz0UJ42lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="228534561"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2026 22:47:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhMZ0-00000000Mk6-2Ikg;
	Sun, 18 Jan 2026 06:47:06 +0000
Date: Sun, 18 Jan 2026 14:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-cbpf-restrictions 13/18]
 bpf_filter.c:undefined reference to `bpf_prog_create_from_user'
Message-ID: <202601181459.XmbAwXke-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-cbpf-restrictions
head:   0f8a03cfaae90d44799d4cd29cc308ffdd81d93e
commit: 5592bb2b6fab7adb19ebedac49d65820d92c8b04 [13/18] io_uring: add support for BPF filtering for opcode restrictions
config: powerpc-randconfig-002-20260118 (https://download.01.org/0day-ci/archive/20260118/202601181459.XmbAwXke-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181459.XmbAwXke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181459.XmbAwXke-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: io_uring/bpf_filter.o: in function `io_free_bpf_filters':
   bpf_filter.c:(.text+0x2e0): undefined reference to `bpf_prog_destroy'
   powerpc-linux-ld: io_uring/bpf_filter.o: in function `io_register_bpf_filter':
>> bpf_filter.c:(.text+0xa70): undefined reference to `bpf_prog_create_from_user'
>> powerpc-linux-ld: bpf_filter.c:(.text+0xd7c): undefined reference to `bpf_prog_destroy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
