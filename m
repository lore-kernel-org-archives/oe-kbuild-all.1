Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019823E8C5A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543609; cv=none; b=bbQ9XJzbbfeMCrPCANehi2V2cGb0Ix1gt8EW8PZ2TU/XEpRPzfdyNE1B+gGGJ81h/GWlliWCUq4b3nwNyeT5wj22gNhqMmM9h9cx6E4owHIawCiukrzy6Qbxz6l076ACOd9NYyA5D3vZPbbQQF0tzSHucLzMPn8KaOsp/4B+UtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543609; c=relaxed/simple;
	bh=MSbli/puMCyGzpyf92iXSnWSCs0dWY+zEp74GsDqi1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQBD862zPJX2t8pA1lWvTc2b0J3FCoGFfsUMFA/MNjVp/LrohXP2RVFd4qAFpJZ7hUROEsJCEjZQAaRYumNzvo1r1y0KgEMc7TVL6JQQeLOlWkCQ+0Vi1xk6ipcxlzxbF2SWyz7VPkHKotuN8gF9Q8gVnDi7Dqu9MxMy3dGYQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQ5ILeND; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQ5ILeND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783543608; x=1815079608;
  h=date:from:to:cc:subject:message-id;
  bh=MSbli/puMCyGzpyf92iXSnWSCs0dWY+zEp74GsDqi1s=;
  b=mQ5ILeNDvr2SvduB7Py/Jog+HA0Y5eltaeKS4ohnAx0NdnYBZ4IMBQc0
   6AxwZocKML2vGnyC3CvowhyvzgawzkfZPjQuwZnXCUaGcCurWmilQNiQR
   p/5nkr8UTESe30r3iUOqEP9CD7wJ7SxHAdkLpeAuQ6edoOJB/Zmg9MXmN
   rnVk40ovnL3IDYNOzQrxQpjp6EA60FLCs+NPyr/5SSlW2Cx+Iaf82UE7V
   knGh4gqEfN7OGrVyZ6X1UeBLTmsFIn92SuKtXhTRbPripR2r4BMQIDE1t
   1TSXsjWntH0pmXKDRLbrRQjf/TEPd+8JAL8jB99T2mI9u4LO4/PEWRrdL
   g==;
X-CSE-ConnectionGUID: n8Xr2X3nQT+QwSOdOeoScA==
X-CSE-MsgGUID: 2dVdJZ6VRkOoDM3fW/syYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94866400"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94866400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 13:46:47 -0700
X-CSE-ConnectionGUID: j/HyOxYHRY+ysMU5yBK70g==
X-CSE-MsgGUID: mhoUipvpS1au0/nFPARwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="259290212"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jul 2026 13:46:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whZAJ-00000000GrD-1ykA;
	Wed, 08 Jul 2026 20:46:43 +0000
Date: Thu, 09 Jul 2026 04:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] fs/binfmt_elf.c:2131:13:
 error: no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202607090427.qyeRPirq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7ba0fe5e0c658eb07a0e28e4715858cc6652fb7b
commit: 7964dc9503054b0e617a38f92e9751a60c6ce975 [1/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-buildonly-randconfig-001-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090427.qyeRPirq-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090427.qyeRPirq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090427.qyeRPirq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2131:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2131 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.


vim +2131 fs/binfmt_elf.c

  2128	
  2129	static int __init init_elf_binfmt(void)
  2130	{
> 2131		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2132		register_binfmt(&elf_format);
  2133		return 0;
  2134	}
  2135	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
