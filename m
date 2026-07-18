Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A821E0BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784404359; cv=none; b=OJxiHRpkrgNb5km4QqMt7riKKjP0lKjnN17Nf81+1Hsu5ipABLZ1Jq5yTilj7eR+wyvMTAQLqS2qrGqVbhNMUq3nMeF4sIUiK4hcMGgvzgUUSE8A4TXk1S9hTP91QA9tXgPWjAI+xHk/PhXE4USeQU+TEPkYZKL+wzNxg+KJVbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784404359; c=relaxed/simple;
	bh=VgA4J1fYwZEYMLbBFM7zq/NdAURN2J0D2Nwen7JYrLc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GBy3bjX6ZiRXdQX8qXHIv/XHeVEP4EAK5QWwtkLbfY3XHCXahxM4jpXydSmW5HVxhdLZjoQFlqHetFCBqMWTQmYgUeCxOZUH5UNiYBsGB8O382rI118FzoUh1N3X/1jgfDzwSpUoF9cGqBHfYNXhkZUX6D+8pp0co/5CfOM3f10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxZstgoE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxZstgoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784404356; x=1815940356;
  h=date:from:to:cc:subject:message-id;
  bh=VgA4J1fYwZEYMLbBFM7zq/NdAURN2J0D2Nwen7JYrLc=;
  b=kxZstgoE8tXUQ8+68+EAxuC3esTQos2izq+UlyRbiPEFFDTuzxjat9u1
   87m8DMUWGE+Kt+qT/azyPAOk1E5XlWUSdrDh+tb5Id9KRgFiR7AWIjHWF
   EFYDLelJOc6YYHt2tF0lecjebtSN0IIbItHUiOjpBrPsd2aLM44LtbWk8
   bdRD9CepLypMHAS09enniOvuaq/14gSke12DYFRmPngf5QG4CPM0WTbb3
   kCQM4slbRUvrR3Ss5CHx7CtZZU1Z/9KU4wrr+lF7UI+M68T656ICYD4X5
   UKGN20SfgHr/fwrejtKWKyUlUUT0ZIqOSFgDPRR/N9XppNip+wdIzGB5O
   g==;
X-CSE-ConnectionGUID: /T0kGmvQSau1gKkgJ2ajNA==
X-CSE-MsgGUID: SOGJLKUbQCWWUVprPmX5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84810575"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84810575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 12:52:35 -0700
X-CSE-ConnectionGUID: jdT39vz/R4++4ZeMQTZkfA==
X-CSE-MsgGUID: IULBzeIxQqes+9wXKwkUmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="281540953"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2026 12:52:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlB5J-00000000V4r-0411;
	Sat, 18 Jul 2026 19:52:29 +0000
Date: Sun, 19 Jul 2026 03:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 0/2]
 fs/binfmt_elf.c:2131:13: error: no member named 'min_coredump' in 'struct
 linux_binfmt'
Message-ID: <202607190316.FfxhBXBL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   4e87aca2a955df4237063eed20202662113446d9
commit: 7964dc9503054b0e617a38f92e9751a60c6ce975 [0/2] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-randconfig-075-20260716 (https://download.01.org/0day-ci/archive/20260719/202607190316.FfxhBXBL-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190316.FfxhBXBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190316.FfxhBXBL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/compat_binfmt_elf.c:154:
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
