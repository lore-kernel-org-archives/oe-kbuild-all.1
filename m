Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020A1DE4FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666535; cv=none; b=fsRxpjnMrQxzq1zqD8qoxP8wP1/XnPrQR3p6Oyo1QRRqJN5aKzaRFjDZFb40237bJsFKvYJWFusBPcZMmT4wjNpDAv3wGR1pVfg2oppJolkxvNBYla0nzOv/OK9E/J05cQyZ/T4j2TQHVG5GW/7mV/BiyssO1CAI6gZOMVHPQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666535; c=relaxed/simple;
	bh=c1ZKsl0YEM7PKJA8XdEFOxnAM02yirZSG0kfpo1flD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkf4KNT1+scg0pOfmb2hd1hoCn3hwFNhiHAhtUA52v4UPtblMme5ape1K4VJxmFN8bpL8Nam0z8v3x6YgL0gA7KPJkqi/HSaCDVhxQsbrSZraOtAeXWdMgE7Gx5VbIm4hTeZc0umxWs3XYJ7cIfLSFEnxXQkaIPPKZIXjUxUGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evEKrx99; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evEKrx99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747666534; x=1779202534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1ZKsl0YEM7PKJA8XdEFOxnAM02yirZSG0kfpo1flD0=;
  b=evEKrx996OTU6Q/qfOu7pIcd11YcWANgGk0tjK1YT2Hhw+WvfyOL5qcC
   Y16ApY4IC/RDbOPwvAnUJ/Ohu8quPB7byShI1pXgXQqmucGY4Y2kWkEMy
   NH4SKqVvoZ9dY8FDRPpdVXVNTbX2Ft5UVHYdr76bZZ40fAr9n7w713BBN
   MIV2EhBJGEuVK2FjNhM+pP0/XLAIwZUOH04/IFyOBE+wrV4MoZKez1m5j
   9qmZAldyHmQcamc3DV78Xk/pCNXAyMPcSl0f+a+zgz7/UUudzrQUzcvrI
   +S86GpmS1fYoL5A3I8KRP6+Gl3HTsgw/lp5Fc3D8t2Qf5SOSySyxay3MS
   Q==;
X-CSE-ConnectionGUID: CktQNcLaTgCRAq8MpH2fqQ==
X-CSE-MsgGUID: d7ojRzQaQxeK/Vg+zA+yXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53365286"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="53365286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:55:33 -0700
X-CSE-ConnectionGUID: Clm1k8J8TfSVz/mm+46H8A==
X-CSE-MsgGUID: nYucGFsPQYqzGJG6iAi1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="162674067"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2025 07:55:31 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1tp-0000qt-2g;
	Mon, 19 May 2025 14:55:29 +0000
Date: Mon, 19 May 2025 22:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 arch/x86/include/asm/paravirt.h:873:47: warning: declaration of 'struct
 mm_struct' will not be visible outside of this function
Message-ID: <202505192250.Eg8IpFUz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: 7acb4f6bcac9871c147dc6652266b3ec4235d0a8 [0/1] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-buildonly-randconfig-2001-20250519 (https://download.01.org/0day-ci/archive/20250519/202505192250.Eg8IpFUz-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192250.Eg8IpFUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192250.Eg8IpFUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/early_ioremap.c:13:
   In file included from include/linux/io.h:13:
   In file included from arch/x86/include/asm/io.h:45:
>> arch/x86/include/asm/paravirt.h:873:47: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     873 | static inline void paravirt_enter_mmap(struct mm_struct *mm)
         |                                               ^
   arch/x86/include/asm/paravirt.h:879:51: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
     879 | static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
         |                                                   ^
   2 warnings generated.


vim +873 arch/x86/include/asm/paravirt.h

fdc0269e8958a1 Juergen Gross 2018-08-28  870  
a1ea1c032b8f8c Dave Hansen   2014-11-18  871  #ifndef __ASSEMBLY__
fdc0269e8958a1 Juergen Gross 2018-08-28  872  #ifndef CONFIG_PARAVIRT_XXL
c9ae1b10d95610 Juergen Gross 2023-02-07 @873  static inline void paravirt_enter_mmap(struct mm_struct *mm)
a1ea1c032b8f8c Dave Hansen   2014-11-18  874  {
a1ea1c032b8f8c Dave Hansen   2014-11-18  875  }
fdc0269e8958a1 Juergen Gross 2018-08-28  876  #endif
a1ea1c032b8f8c Dave Hansen   2014-11-18  877  

:::::: The code at line 873 was first introduced by commit
:::::: c9ae1b10d9561012a222e05f0d3ab4e93d301f06 x86/paravirt: Merge activate_mm() and dup_mmap() callbacks

:::::: TO: Juergen Gross <jgross@suse.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
