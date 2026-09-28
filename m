Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D927E05F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599902; cv=none; b=WdADplt3FSvg32tmxs/JwTOmlN6Xaih6VI2zhU/Repn0oFytimGLMtehPw2x5AiGzrYOxFk1vJxOrUq8po8362tJloBf5tEcgHOAAiiSJKnu1sJIyXglS4R41tAaLHO4jSVNhxUCdZXtgnNelUvKeDdMbpRi73TZ0PjPcqKGQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599902; c=relaxed/simple;
	bh=kFi6shb+Qg8MNo4O3dNzCmIWgsDt/UwPmWPIWHr3dD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B2AUMio8uTETjfpGdOA8f3MPRddvUMy+H7FpsxxQe/F3EOwOU+KyAXOquzXXBEMN59cQTbXspxJ845QSQF+sfEl590SNCw988+OQf615aK0MVS0sTibkdCvAXDKSkWNLHOznxxTdYl/ZIeccIt5XcNhin0yn36pqlS2fSmj1TR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPZ/G3ga; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPZ/G3ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790599901; x=1822135901;
  h=date:from:to:cc:subject:message-id;
  bh=kFi6shb+Qg8MNo4O3dNzCmIWgsDt/UwPmWPIWHr3dD0=;
  b=YPZ/G3gaXRPFKznNO7omhDE+Wy64YnljQLclYbhLl736EWfvVv32nFSM
   Q5Dqq7HAz/THn1FfxQ62fuFkALxVQWEhL0bneLp+GPyOW2K1e0RmBuDYI
   o1cXJfhbZNcPel0W1Acv2ZrOpsECmcKrKDSzTEhn1XXKfN2/KULWD490T
   OQqGWTtZq2qhoFcxYctCQZz6r62zUbJ5JCwhtfXsWDekmLFqgKyJqfNNk
   gz89XG2+xuFIJ1Tkfz+YiVmFvVatb9omIiw/tXxd5AfXDiBd+fguraDR4
   zOrKcUz62yeH2OlW6XRpISpvab/xOCKfH9/qPBbH+nd3ORTMiRRvd5AcW
   A==;
X-CSE-ConnectionGUID: NHDQi32JQ6eKWscwlpRwsA==
X-CSE-MsgGUID: kvygxaT8Qgedwj4/ePtTXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90250578"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90250578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:51:40 -0700
X-CSE-ConnectionGUID: qxJKEbCOSkeeC3oTKqbtHg==
X-CSE-MsgGUID: ilVd73P4QMSau62YPvprBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="275080134"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2026 05:51:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBApT-00000000107-05Fl;
	Mon, 28 Sep 2026 12:51:35 +0000
Date: Mon, 28 Sep 2026 14:51:11 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 5/17] ld:
 kernel/bpf/verifier.c:20778:undefined reference to `bpf_typed_arena_put'
Message-ID: <202609281432.AGee6FU1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 8888450621df54338133ec7cb64dfa0c4483d06a [5/17] bpf: Add the typed_arena_cast instruction
config: i386-randconfig-r2107-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281432.AGee6FU1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281432.AGee6FU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281432.AGee6FU1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `release_typed_arenas':
   kernel/bpf/verifier.c:20778:(.text+0x5f34): undefined reference to `bpf_prog_arena'
>> ld: kernel/bpf/verifier.c:20778:(.text+0x5f3c): undefined reference to `bpf_typed_arena_put'
   ld: kernel/bpf/verifier.o: in function `typed_arena_register':
   kernel/bpf/verifier.c:17051:(.text+0xfddb): undefined reference to `bpf_prog_arena'
>> ld: kernel/bpf/verifier.c:17051:(.text+0xfdf6): undefined reference to `bpf_typed_arena_get'
   ld: kernel/bpf/fixups.o: in function `bpf_lower_typed_arena_insns':
   kernel/bpf/fixups.c:900:(.text+0x354b): undefined reference to `bpf_typed_arena_cast_insns'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
