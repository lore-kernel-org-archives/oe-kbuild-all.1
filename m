Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F9B4BCAA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322053; cv=none; b=BX4Ne8HuwtwfZcivn8jZiI/IGENojp6dHYYxazGvMAYgRlnUWsNMpntXbEWYNQfxzkWZ0f6HkhJ+sbsrMyB6ETDi9cByqA+4QOoZnuegpg6vm4h+y8vnfz2QXVJwQ95+pLMVnUDRv0ZEIaEnfDJiHDA0ZNXjF4WxJK5PoazInyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322053; c=relaxed/simple;
	bh=4OxbRXDdWQvlpkeA1Qikzur9zBgYk0g8yz75AKKjwoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/gShOlmXOfVSQNtH+jjKJFBltnwRw/mTDNYTGzZUX53aEJ/W7fMouQK2/Y9fCBogHhc6kbR1ram7mWCdX09nYT23JQCIvpJAJieeOaDsHZVJRtFSfCLzt7IQSKXGhNnZoMFGVeuIRz3+ei9lBJfsQ50vYyXjwsC/quSi4UPLuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0dcKt9F; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0dcKt9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787322050; x=1818858050;
  h=date:from:to:cc:subject:message-id;
  bh=4OxbRXDdWQvlpkeA1Qikzur9zBgYk0g8yz75AKKjwoU=;
  b=a0dcKt9F2M9dvF+nrTpAt4nxm21WkOXzbFIHbym835kWHQeCkYvZ48GB
   2c2kosqTN1YQjXqaLMczbH2wjpkkLf0N/k8psAqUsOHegTzk5/xebSrPr
   arbyWmiZF0Ot08sJq4tEuz0ZkOAU15X1G9B5blc/vze3s6+75UHQMABa9
   OuSBlcspc2417sKTnUk9q/EUQIRfsl4BzjMnYDBNSlFNToCzNhVLHOh2C
   dyXrCbWrNc90sHTlbTfrwlT8SzKeV7ezAVbdD7hXFBz3+VlCCsx2vbM8L
   kdIUwsc+01ghWeYfGYG4HFAZECw+X3qiXA1or4OPE8ws9wMme66E3cJF8
   w==;
X-CSE-ConnectionGUID: pDAX8EMGQDO/Tuakdrnb0A==
X-CSE-MsgGUID: v1nGTCNnTFi3q5hK1t3ckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="88074709"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="88074709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 07:20:47 -0700
X-CSE-ConnectionGUID: bGHyAiOoQ1Wludv9oKjVNQ==
X-CSE-MsgGUID: ySGo7D+6QoCZYPv/FdGK8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="266963840"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Aug 2026 07:20:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxQ6t-00000000q2L-3ltN;
	Fri, 21 Aug 2026 14:20:43 +0000
Date: Fri, 21 Aug 2026 22:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] mm/filemap.c:70:6:
 warning: no previous prototype for function
 '_trace_android_vh_unlock_mmap_bypass'
Message-ID: <202608212222.FRMr5QW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3e682e795cc26730ba615ad4e43667507583ad84
commit: 1b9b045a586245cc1c29b2747c6586234c7f5bad [6/6] ANDROID: mm: add vendor hook to bypass mmap_lock release in page fault
config: arm-randconfig-r073-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212222.FRMr5QW0-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212222.FRMr5QW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608212222.FRMr5QW0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:70:6: warning: no previous prototype for function '_trace_android_vh_unlock_mmap_bypass' [-Wmissing-prototypes]
      70 | void _trace_android_vh_unlock_mmap_bypass(struct vm_fault *vmf,
         |      ^
   mm/filemap.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | void _trace_android_vh_unlock_mmap_bypass(struct vm_fault *vmf,
         | ^
         | static 
   1 warning generated.


vim +/_trace_android_vh_unlock_mmap_bypass +70 mm/filemap.c

    64	
    65	/*
    66	 * trace_android_vh_unlock_mmap_bypass is called in mm/internal.h
    67	 * by including trace/hooks/mm.h directly, which will result in build-err.
    68	 * So we create func: _trace_android_vh_unlock_mmap_bypass.
    69	 */
  > 70	void _trace_android_vh_unlock_mmap_bypass(struct vm_fault *vmf,
    71			struct file *fpin, bool *bypass)
    72	{
    73		trace_android_vh_unlock_mmap_bypass(vmf, fpin, bypass);
    74	}
    75	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
