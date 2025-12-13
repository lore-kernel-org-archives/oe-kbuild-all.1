Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4928DF2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765629753; cv=none; b=tP8nXOOu6UVrBwSJuALQMO1/hB78ddSYqP7WHqer0xzWug9fHRST4g08BVWKs6+VXmx+RL0FHDM33m1Jgg987IJc59Ki6z0pYXHNH4v0dnhC5SKm7hTc7MofU2Mr+FTY1e4W+kW/GwgpdPHJF/uHWLzbBkTlsYT/G+HXpYGpu8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765629753; c=relaxed/simple;
	bh=Ug4uePsfkjMZpgmTkJ0qlzvkwmgU47XglSxXn/75r90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H0gp59jZk3BtS1EdjV4Rb3fjiOkZzajW93WWj63RiAKEs4Q9ODTTpzEtp1uWNAKugi/wpPNarWgMW47plsKQ8wFFVsqN+qoCulFvxF14RcVoILvlAhq7EpuXdYhixC34TeJGSC7uiN0tWngDUpONoZRhAFKvbwjKkqQEEpdSSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSLAIRox; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSLAIRox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765629752; x=1797165752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ug4uePsfkjMZpgmTkJ0qlzvkwmgU47XglSxXn/75r90=;
  b=lSLAIRoxFv9ZgZsaTAtLwcmZUdCfcMiBKJGWl8J06WGqdzI2fNfoFfmg
   NZgkZDTj3jj6QOlVmPwnBTockF4TfCvmjT6soo/WWOyz8GafqfhKfqgvE
   nrbU79QiuJJhSfDAXyLKq8ZDmiFrgjAIEvkyYx+wQiYaZOnkpLGgHhB7d
   ClDysoiQY3F8n64oCL0Skjd53sS5I7iSk5/n9ZtXasEH1EXzTovXcDFS1
   aDq4ip2SnsG+ypMCDbE2SPt/DjAC6DY7G83KYy5XdNKVa1UkD69+rBj7x
   nNFvxCUrSo6742IvI+RjNBJuWyVV/VpURMS0CBKu+AheCFnn5xI0z+lyy
   g==;
X-CSE-ConnectionGUID: wWowHAmkRWKHNaF3GVuiAA==
X-CSE-MsgGUID: bOaqt9IpQ1SmHFRZFZi+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71459617"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71459617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:42:31 -0800
X-CSE-ConnectionGUID: KE+KX4kMSkuAmteCmKfc+g==
X-CSE-MsgGUID: MKB2p24lREueje+M7n0ixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="228368799"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 04:42:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOxA-0000000024K-1vJY;
	Sat, 13 Dec 2025 12:42:28 +0000
Date: Sat, 13 Dec 2025 13:41:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40]
 arch/x86/kernel/cpu/amd.c:1255:6: warning: no previous prototype for
 function 'amd_check_microcode'
Message-ID: <202512131320.o32FzKLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: ed9b87010aa84c157096f98c322491e9af8e8f07 [40/40] x86/cpu/amd: Add a Zenbleed fix
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131320.o32FzKLs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131320.o32FzKLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131320.o32FzKLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/amd.c:1255:6: warning: no previous prototype for function 'amd_check_microcode' [-Wmissing-prototypes]
    1255 | void amd_check_microcode(void)
         |      ^
   arch/x86/kernel/cpu/amd.c:1255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1255 | void amd_check_microcode(void)
         | ^
         | static 
   1 warning generated.


vim +/amd_check_microcode +1255 arch/x86/kernel/cpu/amd.c

  1254	
> 1255	void amd_check_microcode(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
