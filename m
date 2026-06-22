Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF63A4523
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143919; cv=none; b=TqDJSYDxxdPYwwkVSA9rTP5lp8QmOk/Giv9x6g8O2WURIV+3hrvuTVb74TrHhSzwvVgrg26I9IDTe3kOBRyQLiPmlVtZ5i9RbICXuIvjnhYO3vg/AB2ouYTicHTBzjzIK+L+jv7TKRAuJl+st10bNh9q65IeCt/K5+ZRh+vdwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143919; c=relaxed/simple;
	bh=wJKmMvmm5iTqFN9nHd1dWx/6My0JNAdcWZLJ7Ul0Z74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JZ3n/rpANmJITYWBSIEXRNAApY0ZxrsCS/9OW8PKlhryJnz0sIepyaWGBBPd3c+T3ArH9QIwjfMdNvbAhR7YEyn07oJuMPdvp1RpvDUDnvzSOcIQVioNY0MUS1AN1LzLHfbWLNQal+II9N5hxCrfvt9y/JxDIcSQ5uAcFX73v6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCpRP4xB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCpRP4xB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782143918; x=1813679918;
  h=date:from:to:cc:subject:message-id;
  bh=wJKmMvmm5iTqFN9nHd1dWx/6My0JNAdcWZLJ7Ul0Z74=;
  b=eCpRP4xBhfD5Q/PA8BprjuRhQfMgutLNER4S9vgKoYy9dxHJXMvCeOhP
   OJtP9X7nIyyjDZQ+oyOnRJ6NhMQDexu459037Ac2HU9vkgC61lYoPB2W7
   YXVwNwyvL24bzp99+IHuyqKZQsRv/RXaho5MHz05sVJ8Ujz0rEthnQtN7
   sCxvYbhA/LDc/R9mGMXy7CGWG4sqx9gsOQ86uwPBJ0s+WNtM85R3jzpvj
   ZfNvYkZ8OC2N1IxJNFN1aUwhPyovjVlDrFWh3VqKqNQY3ZWQE6zbm2kZ0
   daW0scS45rDPkOvCgPPMA6l15XRRIgAg6aZ2A/hqHWiP7hLgaOoeHc/VB
   A==;
X-CSE-ConnectionGUID: xUZMDokvQ46wecU9UoNdzQ==
X-CSE-MsgGUID: s2pasSi+Qm+ubXiUs3UH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105673022"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="105673022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:58:37 -0700
X-CSE-ConnectionGUID: qR6xHugqTXSg4HYDG4HEJA==
X-CSE-MsgGUID: omIn0j7FT9Krs/AhHY7TRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="249114890"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Jun 2026 08:58:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbh2f-000000001Rj-0v8H;
	Mon, 22 Jun 2026 15:58:33 +0000
Date: Mon, 22 Jun 2026 23:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 2/4] vmlinux.o: error: objtool:
 x64_sys_call+0x1b3b: return with instrumentation enabled
Message-ID: <202606222345.b1RjVYLT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   47c2508c2db3f83600b4d5e8f7a83226213b6cc1
commit: 9056c35af120a6bba4e4532eb34a00533f6f73c3 [2/4] x86_64/entry: Make syscall dispatch noinstr
config: x86_64-randconfig-101-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222345.b1RjVYLT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222345.b1RjVYLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222345.b1RjVYLT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: x64_sys_call+0x1b3b: return with instrumentation enabled
>> vmlinux.o: error: objtool: x32_sys_call+0x1c7a: return with instrumentation enabled
>> vmlinux.o: error: objtool: ia32_sys_call+0x212b: return with instrumentation enabled

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
