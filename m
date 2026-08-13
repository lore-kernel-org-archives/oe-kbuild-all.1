Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0731F99C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589798; cv=none; b=tIoC2eF7Kduah+boEnAhtWdUa8I194hJCEhlust7E10conwaON7GUWGg1fphKbgqzcKLqB6einEG1yZFQHBqemNDxNTcn9trglnPVctaasXeLp7t2YvnbRLauWLYSXnbGOH+hDO+ifBmeHTwW9ogulHIQpuv1pwd4REHaCgPV4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589798; c=relaxed/simple;
	bh=W/jalZmNInMCwP372MtR+XNkwQdMDrWhKoLFv5dQG+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWRsSx9Yz5zShd7P1dEbg2RsVz5aRCYUMi4/lRxm4H2g/aBzOUMsFqq3jiMQtSPZzuHdy7uDdkUQLe1/dGxhlDhzg5OiGEG0nr1GlwL0oycIhIOXGb9sgQEwGwk6jUqMJC2GTgDQPfmNwKORduv0/A6C6JH+E451zct6nMaeBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5aM9YP/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5aM9YP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786589795; x=1818125795;
  h=date:from:to:cc:subject:message-id;
  bh=W/jalZmNInMCwP372MtR+XNkwQdMDrWhKoLFv5dQG+s=;
  b=P5aM9YP/a9peVX5QZwRkpuFOhQOoiAKxrNXmvQ6H/76xNQE4DofehvjC
   +YugtVuTvQN6UntHa3uBa6EqX60LtNbHHsPthCvVsPNEz/j/Ozk8VjbW6
   8PP/LAB60YUVuKSZCkGdKjfH427Tw5zmXn8PT+zSviRv9XLpnJyLVPb9y
   muwRltR+y8IrYka73gOmdGaPv4kNagnE8yf5N8wuSSWGszJQVWPCbymIQ
   aUN4MQ93YnbAv135MmHf3I3TgCNJ+nWiVImqquNn2Dbs2Ojzbxl6tUMW1
   iNLSd3cPfpBbNFpgv/PlE72421CUiCqXzZxvKFgeRhagCtyUBM1ZAjJpZ
   Q==;
X-CSE-ConnectionGUID: Pd83YFDVTxGejKVgcum0zQ==
X-CSE-MsgGUID: fwT6n116TwCS0pG9QUY7SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97822090"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97822090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 19:56:35 -0700
X-CSE-ConnectionGUID: 9E6hoXprRN2eQ04u5wDKGQ==
X-CSE-MsgGUID: AHC4KqWGSei0e70yF8b2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="262507834"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 19:56:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuLcN-00000000SbW-3pPI;
	Thu, 13 Aug 2026 02:56:31 +0000
Date: Thu, 13 Aug 2026 10:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-kptr 6/11] arm-linux-gnueabi-ld:
 syscall.c:undefined reference to `bpf_arena_types_put'
Message-ID: <202608131033.nXaXUmTV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-kptr
head:   637d14126b38da5a1a081d12522c8dd5bd465eee
commit: b9c38e0bd60f01bffa8cc5656fdd1e721b7bb4ec [6/11] bpf: Allocate map-owned typed arena cages
config: arm-randconfig-003-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131033.nXaXUmTV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131033.nXaXUmTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131033.nXaXUmTV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/bpf/syscall.o: in function `__bpf_prog_put_noref':
   syscall.c:(.text+0xbcc): undefined reference to `bpf_prog_arena'
>> arm-linux-gnueabi-ld: syscall.c:(.text+0xbd8): undefined reference to `bpf_arena_types_put'
   arm-linux-gnueabi-ld: kernel/bpf/verifier.o: in function `release_maps':
   verifier.c:(.text+0x5086): undefined reference to `bpf_prog_arena'
>> arm-linux-gnueabi-ld: verifier.c:(.text+0x5094): undefined reference to `bpf_arena_types_put'
   arm-linux-gnueabi-ld: kernel/bpf/verifier.o: in function `bpf_check':
   verifier.c:(.text+0x18af0): undefined reference to `bpf_prog_arena'
>> arm-linux-gnueabi-ld: verifier.c:(.text+0x18bba): undefined reference to `bpf_prog_arena'
>> arm-linux-gnueabi-ld: verifier.c:(.text+0x18d40): undefined reference to `bpf_arena_type_get'
   arm-linux-gnueabi-ld: verifier.c:(.text+0x18dea): undefined reference to `bpf_prog_arena'
   arm-linux-gnueabi-ld: verifier.c:(.text+0x18df2): undefined reference to `bpf_arena_types_put'
   arm-linux-gnueabi-ld: verifier.c:(.text+0x19b82): undefined reference to `bpf_prog_arena'
   arm-linux-gnueabi-ld: verifier.c:(.text+0x19b8a): undefined reference to `bpf_arena_types_put'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
