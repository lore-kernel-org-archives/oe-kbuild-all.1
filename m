Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BB25785E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 11:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811308; cv=none; b=YeetXEIN6Z0n+AOBJ9xU12GB+g6AKLg3pO8qDGqx6zdUdXkMdbzC9cJh0L2MBZsizdQf8mtc+IGF++0TQX1bUI5vNzuTOMIszV9g04Ma2pWMD4j/8nl6W7bJ3lPyss64tmOl9GwrFajkFIGhfJzCtIIVAzSlWQOQju9A2OeJCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811308; c=relaxed/simple;
	bh=miptqYNEwaPCjNU1SL4xyXLXCpx7Wtbq2pxbAYBs74I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dT2YR1tPCd9MqZKdlNt/ZY+QWp5AHp+FC22PUO/qkEpDpMOQhdu6o36tzikUBnH0a+TKF34jA8Kj65DzRpYyamKsq84McLUle1yz/Msvcc2tV/xrtgeW7tuPM0TAuLqRRGlN6mdCc5CNQ/oZZLJYcT0W4sQbDXsHf8rHrB24fOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU+5HYhS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU+5HYhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763811307; x=1795347307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=miptqYNEwaPCjNU1SL4xyXLXCpx7Wtbq2pxbAYBs74I=;
  b=LU+5HYhSHhQ2QEP8MkOqQmdejxpzSiazMMvX8uFbYE6Mfb6cyFlrhzi0
   UT1jiqlZ9h7OXhCrMMXw7EhncPL0OxMBVr/Y3IJW+u3/sv661xemTqJDD
   1cUFoupWbv63sxpsyzmQXaaml08dWGZBXGuY9DwY2qzBpdpm9IY3J/wHY
   wQFzRMJtcV+BqXV8IWSkLF8rOBolAce6ErOgaRrSCrNg9+3voya7Jfweo
   w0EEGmEp6q81UoJMtNBxAJ0jrdQawBJ32QYu4nRSwsY4bi+vxEOYIbCcs
   FNPnpMT+aNUYG2MnbdApQbeScLfNiLRBKj+KKg+qT3qCgCWe430n6xVO1
   Q==;
X-CSE-ConnectionGUID: n4GK2A2DSNWSOV2QDvzslQ==
X-CSE-MsgGUID: OPRViciwQGGH7UJuqTIinQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65773148"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65773148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 03:35:06 -0800
X-CSE-ConnectionGUID: iJnGYFAHSgajk14o+GT+nA==
X-CSE-MsgGUID: EGxoSIeJSmaPSiXIQDWyDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192030038"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2025 03:35:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMltO-0007Rz-2r;
	Sat, 22 Nov 2025 11:35:02 +0000
Date: Sat, 22 Nov 2025 19:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:258:57: error:
 expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
Message-ID: <202511221910.55v1D21P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   53a0058b6ceb67b7a632bf92718986b1b30438d3
commit: 3e6566e776aa77ac22ffb4bd16fca9e9afc9d98c [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: x86_64-randconfig-005-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221910.55v1D21P-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221910.55v1D21P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221910.55v1D21P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/virt/hw.c:258:57: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     258 | static int x86_svm_emergency_disable_virtualization_cpu { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
         |                                                         ^
   arch/x86/virt/hw.c: In function 'x86_virt_emergency_disable_virtualization_cpu':
   arch/x86/virt/hw.c:271:23: error: implicit declaration of function 'x86_svm_emergency_disable_virtualization_cpu'; did you mean 'x86_vmx_emergency_disable_virtualization_cpu'? [-Wimplicit-function-declaration]
     271 |                 __r = x86_svm_##fn();                   \
         |                       ^~~~~~~~
   arch/x86/virt/hw.c:330:15: note: in expansion of macro 'x86_virt_call'
     330 |         (void)x86_virt_call(emergency_disable_virtualization_cpu);
         |               ^~~~~~~~~~~~~


vim +258 arch/x86/virt/hw.c

   254	
   255	#else
   256	static int x86_svm_get_cpu(void) { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
   257	static int x86_svm_put_cpu(void) { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
 > 258	static int x86_svm_emergency_disable_virtualization_cpu { BUILD_BUG_ON(1); return -EOPNOTSUPP; }
   259	static __init int x86_svm_init(void) { return -EOPNOTSUPP; }
   260	#endif
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
