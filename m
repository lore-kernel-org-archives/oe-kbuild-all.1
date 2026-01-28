Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4A33ADAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590649; cv=none; b=Gq6obZK7lNL0ri0wul5PfRLBSv2ljs8OvX65XJGN8EhDFsDOg2LnVSBGo2fjJEfa6bjuMMOJHBl9ybj0s0ofRlbZUm+HzLbSHdVs3f0gcvV63bHWOzSH9NzbcYzH2caJN1NfuPDRgGqCxLFSa8maBf0FB9xAG3Q1gZz8SUZyg58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590649; c=relaxed/simple;
	bh=XA6UjBGtiFG9jBe8bpwCq9ZHPwdUQiv6+YEY+4B41n8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j1ZlNsfc5aoyvchLTXCgog2SbuDRi9REx6u7UjyTJamnQvrDznLQzmHzZKsMTXT0qZNWz359OP4zbMyQF0y/LvYYW4GmrgpNEVzQbMN6Z/RgWb+jWMv9q+eNiCvVU5/L2QapuhDv3FrEUSZn1bJh1gaNf1E5v9u7Oo5ZDuPy6y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzWPH/tm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzWPH/tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769590648; x=1801126648;
  h=date:from:to:cc:subject:message-id;
  bh=XA6UjBGtiFG9jBe8bpwCq9ZHPwdUQiv6+YEY+4B41n8=;
  b=YzWPH/tmP0D7nlnFekIT4lhfmwJICXOAbLRbbudzxGpBIMLhSwhacmfo
   +anWelrdZSQ3e3vK/x7DyZb+IJCxcuhlKs7dW+V6Wx/nx3u8YNNfT0ENM
   d6AdBC0otJEiAxhEaDKdqOe41axFh0+qdDVJWxD1caXYiUKvmqNGECifW
   AaGtbs15WO3nqv89JduLODaxys834rX5prQ0PPgVj4d1+XZPxSLiW7NQU
   GOJecPTGm3Z705+8FWsN6r2p6B70pivBMGxu0AiITemGyrhVVVl/PBn6O
   VOtwYMkyXWYb1BAs9CpmuA4GnS/y4+W+w21LZ6hPbnEKpoBARN4hvn+NQ
   w==;
X-CSE-ConnectionGUID: aK/TYjDPTJ6xOhtUbYmdFQ==
X-CSE-MsgGUID: 4NfLKbGPSj+aw8luMjCViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88372837"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88372837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:57:28 -0800
X-CSE-ConnectionGUID: LgIw7xSySmSzRqDQqjo5eQ==
X-CSE-MsgGUID: OkWwNfNETzC54T54Qop7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213079397"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 00:57:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl1Ma-00000000ZU0-0y6x;
	Wed, 28 Jan 2026 08:57:24 +0000
Date: Wed, 28 Jan 2026 16:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 24/38]
 arch/hexagon/kernel/smp.c:25:1: sparse: sparse: symbol '__pcpu_scope_ipi_irq'
 was not declared. Should it be static?
Message-ID: <202601281612.gRcZ4j23-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 1a649d9c9e2ed1a173b803ded2b4a2a997c42aef [24/38] hexagon: add debug infrastructure
config: hexagon-randconfig-r111-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281612.gRcZ4j23-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281612.gRcZ4j23-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281612.gRcZ4j23-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/smp.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/smp.c:25:1: sparse: sparse: symbol '__pcpu_scope_ipi_irq' was not declared. Should it be static?
>> arch/hexagon/kernel/smp.c:28:1: sparse: sparse: symbol '__pcpu_scope_vpid' was not declared. Should it be static?

vim +/__pcpu_scope_ipi_irq +25 arch/hexagon/kernel/smp.c

    24	
  > 25	DEFINE_PER_CPU(u32, ipi_irq);
    26	
    27	/*  Virtual Processor ID storage  */
  > 28	DEFINE_PER_CPU(u32, vpid);
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
