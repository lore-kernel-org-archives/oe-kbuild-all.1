Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA932C94A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768642554; cv=none; b=MpHLXep0ejtkx04hTqVkdkys1BRE4N7XnctKBYc0DRKHnA+cnQa/4VxwNGBxxR+4yklAiL1P2VFeoIGLymDlwWaW3c8PY/wVvnc/fVEI+48uPE13PIA+eT8rKKchViBrVqgouuLxaktUUSMnO1caAf7HMwB8wTaDiFXMM4b/1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768642554; c=relaxed/simple;
	bh=qbGdZ4+v4H1d/KXts3J9jizqZZ2UZFfsM5AyZl8cBH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=COMRqaULNn/g/6iS1APvYA+xKDjGfLkDEhrk1KxPZosAZX1YA198tnfxMn9WXXT87SG+hxZYlYvNDI3/COSE5MhVlSVtDdkear/EafECbg9hHo1ZFRtXzd+qXv7scj5ookcINBxehpylnGBlRnXFxiCIpbyysUiMBJ2sfoZCGPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeXLWXy5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeXLWXy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768642552; x=1800178552;
  h=date:from:to:cc:subject:message-id;
  bh=qbGdZ4+v4H1d/KXts3J9jizqZZ2UZFfsM5AyZl8cBH0=;
  b=JeXLWXy5n4otrbLFeKSeVu486L3BsVrOS6YEuctgx26kOZ8xRMfd1BMC
   Abc7vL5zY6ElUGl+vSuITYU709nzbDEIliLcxmnA+GgNioLf+vfyTDsD4
   vC9aOT4T/bWcKtgtK5spztnLVS4JllbPC7GD24iGo9fEOroKQIu++AFNN
   fJa3KPunoltnuYD1JNkj1VrgIS3Ap7huC3wAC0KBluwu5JVUs/8xd6/53
   JMU+kxWCITarBSQ6EUEE8PsZ9PzT4yAowxlneJ/OhZSdK9zOh9vNFFyDl
   lT668OWKgB+N/EdFfB7LayVnrTqdJTGu+6Rv6SCdzN4Oq4REFx2Vj3fK2
   Q==;
X-CSE-ConnectionGUID: pXj4COHkQCSeJ8iHRuxgFw==
X-CSE-MsgGUID: sQCqbj2gRqGRAUAHL4SbAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69992012"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69992012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:35:51 -0800
X-CSE-ConnectionGUID: aIxjA1msTo2VFAiGjWOEEQ==
X-CSE-MsgGUID: h+/fV3BQTqyRxKKrTN908w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="204598815"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 01:35:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2ig-00000000Liu-3Z5e;
	Sat, 17 Jan 2026 09:35:46 +0000
Date: Sat, 17 Jan 2026 17:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/kernel/prom_init.c:2888:22: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202601171708.EMbFwrWA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 200f22fa48a8c670a1ba66d18d810c51055e6ae9 powerpc/prom_init: Use IS_ENABLED()
date:   1 year ago
config: powerpc-randconfig-r123-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171708.EMbFwrWA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171708.EMbFwrWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171708.EMbFwrWA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/powerpc/kernel/prom_init.c:2265:23: sparse: sparse: cast to restricted __be32
>> arch/powerpc/kernel/prom_init.c:2888:22: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 [usertype] val @@     got int @@
   arch/powerpc/kernel/prom_init.c:2888:22: sparse:     expected restricted __be32 [usertype] val
   arch/powerpc/kernel/prom_init.c:2888:22: sparse:     got int

vim +2888 arch/powerpc/kernel/prom_init.c

cf89c9434af122 Michael Ellerman 2024-11-26  2885  
cf89c9434af122 Michael Ellerman 2024-11-26  2886  static void __init fixup_device_tree_pmac(void)
cf89c9434af122 Michael Ellerman 2024-11-26  2887  {
cf89c9434af122 Michael Ellerman 2024-11-26 @2888  	__be32 val = 1;
cf89c9434af122 Michael Ellerman 2024-11-26  2889  	char type[8];
cf89c9434af122 Michael Ellerman 2024-11-26  2890  	phandle node;
cf89c9434af122 Michael Ellerman 2024-11-26  2891  
cf89c9434af122 Michael Ellerman 2024-11-26  2892  	// Some pmacs are missing #size-cells on escc nodes
cf89c9434af122 Michael Ellerman 2024-11-26  2893  	for (node = 0; prom_next_node(&node); ) {
cf89c9434af122 Michael Ellerman 2024-11-26  2894  		type[0] = '\0';
cf89c9434af122 Michael Ellerman 2024-11-26  2895  		prom_getprop(node, "device_type", type, sizeof(type));
cf89c9434af122 Michael Ellerman 2024-11-26  2896  		if (prom_strcmp(type, "escc"))
cf89c9434af122 Michael Ellerman 2024-11-26  2897  			continue;
cf89c9434af122 Michael Ellerman 2024-11-26  2898  
cf89c9434af122 Michael Ellerman 2024-11-26  2899  		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
cf89c9434af122 Michael Ellerman 2024-11-26  2900  			continue;
cf89c9434af122 Michael Ellerman 2024-11-26  2901  
cf89c9434af122 Michael Ellerman 2024-11-26  2902  		prom_setprop(node, NULL, "#size-cells", &val, sizeof(val));
cf89c9434af122 Michael Ellerman 2024-11-26  2903  	}
cf89c9434af122 Michael Ellerman 2024-11-26  2904  }
9b6b563c0d2d25 Paul Mackerras   2005-10-06  2905  

:::::: The code at line 2888 was first introduced by commit
:::::: cf89c9434af122f28a3552e6f9cc5158c33ce50a powerpc/prom_init: Fixup missing powermac #size-cells

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Madhavan Srinivasan <maddy@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
