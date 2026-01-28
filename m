Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D071A3029
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 03:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571853; cv=none; b=YrjaHv8zRvOzusLduWKqRDH6mbvx21J+dJU7+n5IXoi/2W1c4om2qrQBM9n2QLTW10PCOp/c1wAZLU9pbkQCQhYbvXxXH3ZbrgSi+xfkfSJkYBjLp5P99AhUppsPG4ct/4zpfAZmQqTj6SMeE/k/9d+HDbb47AEnK6gG36BRLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571853; c=relaxed/simple;
	bh=DTr3uHL8wfcs2OhhMk33vq0jBHf/3fAKunpDrVjGMJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWQ2WnyPN60nxvvZYHVBgJXfJ2QE6qh62pVaWEMUU1clrC2yhjCOAxE2CGOrS1kfS4huDwA37u0btoprkpPibX2WwJnU9RnsGUuiIzbIUFzpoVs3/oDmcrRmA9XjhQbO0iIo/7q/gxnm2fTCw9VQZzjcc7fCgCXLI9F00ZFvOyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsbLroI3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsbLroI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769571852; x=1801107852;
  h=date:from:to:cc:subject:message-id;
  bh=DTr3uHL8wfcs2OhhMk33vq0jBHf/3fAKunpDrVjGMJA=;
  b=HsbLroI3u15Iu/a5kRhAaSZY9SrsjjGRBnLcQSPFbW2ckq+5H049OIB1
   iYX+GaMMISrwgGS4mt1Ie3ZQsEMyhu3ziWsDkAeC9NXDrlQ+K5SrtkJMy
   +4QYUywAMywezcd3RrVQcZHxA0zkv6VXaZypo6z6Ao4DHteXOnOw9med0
   dIcVNyMtXMKxj3AKatvcUXjO0+L0XB+XaCKuPRMscmAHoRPDo/AfRW2n4
   CxorTJhSxbqrClW8B8BQSJN0CQF118SeMJyA06EWkwHXr7aOugxtDC7HX
   Ltt59BoKbOndU7d4qvOVOSecSOLAcRcK+5Ca2KXhuijIIYWTKQSu6xRQb
   Q==;
X-CSE-ConnectionGUID: o8t4tli8TfeDbBcHhBMKgg==
X-CSE-MsgGUID: Eh+UrE7LQHuJ3TCX5wutCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70682022"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70682022"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:44:12 -0800
X-CSE-ConnectionGUID: fFV3t2kSQ6mt+a23vTCpSA==
X-CSE-MsgGUID: +2+lcZdmQHGmMS+zxZW4sQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 19:44:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkwTP-00000000ZCW-3eAR;
	Wed, 28 Jan 2026 03:44:07 +0000
Date: Wed, 28 Jan 2026 11:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Kuo <rkuo@quicinc.com>
Subject: [bcain:bcain/boot_qemu 12/38]
 arch/hexagon/kernel/irq_cpu.c:17:1: sparse: sparse: symbol
 '__pcpu_scope_ie_cached' was not declared. Should it be static?
Message-ID: <202601281108.di4zvKj5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 1fd131cebc8a8c23d5560e17e69cc0060c27b7e6 [12/38] hexagon: update IRQ and trap handling
config: hexagon-randconfig-r111-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281108.di4zvKj5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281108.di4zvKj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281108.di4zvKj5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/irq_cpu.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/irq_cpu.c:17:1: sparse: sparse: symbol '__pcpu_scope_ie_cached' was not declared. Should it be static?

vim +/__pcpu_scope_ie_cached +17 arch/hexagon/kernel/irq_cpu.c

    16	
  > 17	DEFINE_PER_CPU(long, ie_cached);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
