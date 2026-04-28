Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B96B1E9B35
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777335995; cv=none; b=tItFGXQXkOGdlf0tPEXChsw+qZZExNbskW5CKvZzwy+zRCQbdRBWff46QsGQEp7S/97vuWQ8buDwBv47bsVN3WsQwuGx8+dyv7rCVARWECmTec7XY04slzOdGC+ObEsNjsB+q9Vb9p6zvpMcO+o+BCD2gLQKJ6Mqv5DNPH5zYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777335995; c=relaxed/simple;
	bh=boLaqaB25sacIW3StDZg1qwb7wYB91mqsLPxTOgQ6ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t1xTUexCbtQhJYoZ+EK4mLklHa+3gKM+GzyNrDQdDvGACLowy2UTjUN37qVobjFwOLxaSWTbFhnL8Bb4oSHNy20w6LIp2KZzYt6ehmgxt0Iuu9Y4lJrKVj9/uyHxNw3kcBTCIW5TPjhOsxg+zsCQ1c4zvSDWNKHZIVSK7jMhgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK9Ob3ss; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK9Ob3ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777335993; x=1808871993;
  h=date:from:to:cc:subject:message-id;
  bh=boLaqaB25sacIW3StDZg1qwb7wYB91mqsLPxTOgQ6ww=;
  b=bK9Ob3sskI3G2AlycT7T0f0gFbKR2clktypVXbr741SXXxj313SXZFpG
   +UVXSj0dPh6wZ3HZsP9/aL4nsyHKtVwH2y+l21TwjVDVmlTutNWKWyIJS
   j2/m4HxIT7qO2zsp4nT9B3KoP9711liG55opJ//qsPpV7o1hfgo3CWe8p
   sKAtB32DgrOxCqfK5lp0pZom3B+XtLf6bWVTH514t3UQKb0pn7nPioUTO
   A2xf51HVfU55uRwrQu+qjzECz+orEJ3i1TuPmzM14UPOL1EIjaD1k3R2C
   eS/RsdowQStRXH5rfDtfv8HtB8ptEMdK0luWGd90XhBQ8b8WNfIjl4VH6
   Q==;
X-CSE-ConnectionGUID: iu6ekURSQf6K7q2mgNHH8A==
X-CSE-MsgGUID: MxD3SbePTMq4T57niHc78g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89323582"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="89323582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 17:26:33 -0700
X-CSE-ConnectionGUID: fq/8nIhvRpmTZpW+LlhIUg==
X-CSE-MsgGUID: oAPq80CFRca7pFTC8QH3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="229437925"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Apr 2026 17:26:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHWHV-000000009MD-1oBE;
	Tue, 28 Apr 2026 00:26:29 +0000
Date: Tue, 28 Apr 2026 08:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry'
 attribute directive ignored
Message-ID: <202604280852.WNl5T0n3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   4fcf139fede307507092418da31055dc046daf0c
commit: e77aff67170b3289f944fb39f1e81b2ff8a5e40a [1/1] ANDROID: KVM: arm64: Nop padding for ftrace support in the pKVM hyp
config: arm64-randconfig-004-20260428 (https://download.01.org/0day-ci/archive/20260428/202604280852.WNl5T0n3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280852.WNl5T0n3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280852.WNl5T0n3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry' attribute directive ignored [-Wattributes]
    {
    ^


vim +/patchable_function_entry +38 arch/arm64/kvm/hyp/nvhe/clock.c

97c14dba6f96234 Vincent Donnefort 2024-09-11  35  
97c14dba6f96234 Vincent Donnefort 2024-09-11  36  /* Using host provided data. Do not use for anything else than debugging. */
e77aff67170b328 Vincent Donnefort 2024-10-01  37  u64 __attribute__((patchable_function_entry(0, 0))) trace_clock(void)
97c14dba6f96234 Vincent Donnefort 2024-09-11 @38  {

:::::: The code at line 38 was first introduced by commit
:::::: 97c14dba6f96234c7120802f9d727a4ccfd17367 FROMLIST: KVM: arm64: Add clock support in the nVHE hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Keir Fraser <keirf@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
