Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAC21CD15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010551; cv=none; b=tzcZk2KHCfnl16uvEYE6gs4OtolNwK+SkFIottFUk78KomCfg0bxOphcckejt2DLM7qcueHthaQ1swl3qLDNYwxyLpEdPivZEu6og+xXvucd1Irx4tMrTwuAE63JntMeN15eDd31zVEvI3woWl3BQD9kboGAX1J5mDNbwjhqCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010551; c=relaxed/simple;
	bh=eEDMPY+IJjJbBV7DPl/Sf+K7S6mR5PmbFmn+yPfB708=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DO4swsRhxHEaRkjVuV0ohLon96A/m85XHYe/sbFRcLLi5IO/gbko+Jn59q/2lsktILTqBi5gQWNMezcTMu3slXfsjP2NQhVGZhWW24sqvpeurcEqVjDriHvk1l0CYTGN0mXLskjJYLf3yfb9/Zm7rR2lObNSXyc+h0rbNZr55Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWJGRVZ5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWJGRVZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746010550; x=1777546550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEDMPY+IJjJbBV7DPl/Sf+K7S6mR5PmbFmn+yPfB708=;
  b=fWJGRVZ5w6VRxcll/wTQy9j2ngcje0dH2bHPsD+9VcbiUzBFge3vyfUc
   KtY40oxPVIdaq3KnlcM5UqjqPJDnyo1z6eMlsX0FbspL642MjW4XmLA3j
   /ffD84eqeeprJ1VhJ6AJYfHxyyD1fB5LRv7dcetWlVE6k1bDl03mUjx/W
   zD0+gJ4STJ0211lJGZth9hyaoHnPAFoRZ/Bs8IEWx88Vdx7gilOfgK5KM
   keSVzgdBK2wR5fE5vdCM7pUFEXKuoeaTvhCmBvc8tL/QJfKNKuah3uBQi
   pzbizKSalDeMTYInft2LOKwi+rkfNPAjY2sMhTMnFPgm6U4LyZJG+pcCr
   g==;
X-CSE-ConnectionGUID: ty6bEK8mQhSA7TNip5KGyA==
X-CSE-MsgGUID: Nr6iweXyRc216CwdA5bH8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47678703"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47678703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 03:55:49 -0700
X-CSE-ConnectionGUID: WI+FpKMyR++URkBUOvrbUw==
X-CSE-MsgGUID: VQy+faSYRO6Bp0fNhgsq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139270597"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2025 03:55:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA56Q-0003Of-04;
	Wed, 30 Apr 2025 10:55:46 +0000
Date: Wed, 30 Apr 2025 18:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/1] WARNING: modpost: vmlinux.o:
 section mismatch in reference: pci_xen_swiotlb_init_late (section: .text) ->
 xen_swiotlb_fixup (section: .init.text)
Message-ID: <202504301850.qS0dn3oW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   242f90b45e895bb0721721f486e2497054eeb0c1
commit: 1a95cff6e15945e8bc7a4e4cec9f9b85f0fb08e7 [0/1] Xen/swiotlb: mark xen_swiotlb_fixup() __init
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250430/202504301850.qS0dn3oW-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301850.qS0dn3oW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301850.qS0dn3oW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o: section mismatch in reference: pci_xen_swiotlb_init_late (section: .text) -> xen_swiotlb_fixup (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
