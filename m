Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075017A305
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765671637; cv=none; b=jTV9VV4AADgJvGdXsXOlXoHoxqdnbFbEC6wIX0NTVfBEF/5rEqcW3OyoA/ymVxF8T5fgy4AhijP19EnYvyblcu4SwcWqqPliEkwWNZSfIg8O9Kj2sY0x1pwXmizXIUk5PKiTAfjQxUn7vJRf3aSpzA0Zy7gu9eDW+FGxNIDyBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765671637; c=relaxed/simple;
	bh=3YenP0SGuD+QmVpefOij9B+KkSsiwsOsle/DAhbHhYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVDHp4sCYliW/Qxf5I+kWvUAGl8AMeqPCM2elY7ZKtKW2jmiNwTlYP+tFGVEIp34i4HUYBBxP2SY5JHL2h9/Eklw+687piLWm+OEgpTeeui7g584tR2/7dY7BwkEpxGjroPVSuSdlOatrGZzmdFcHhp4YsPkrq95KBOEAXrGUDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C16ufBSK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C16ufBSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765671636; x=1797207636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YenP0SGuD+QmVpefOij9B+KkSsiwsOsle/DAhbHhYE=;
  b=C16ufBSK5esjEbklBHUtkCfQsR/lQX902fzPYkNEjwzVXDfKCIxQfsOv
   ffNLJMH1hXu0CA5IbMfVev2cOW5QE9mbEyKFT0GlpsK+9rLHVUMaOqcfx
   G5AIpojFr2UgShWVpPM8RrG/jsIrcKKlRNffaTfmdGmowREmsl4mfye0R
   b+1DttSstb2CPAGI6RfP606cKa6mV7lQuQlaSW8uFfLjvMkrTgKDZ6ZeL
   3a8I8lVfTxHr8CK72fXN+CI/9+8rEEGDEi44pkuniE1OQt2eyrA5NTEO4
   2gTiRAyVly5olsP/P0YUbQUAVx6RU9SZiMyXiTckPSv72NSgYsXz0rYRi
   A==;
X-CSE-ConnectionGUID: b7LGV7cCTG6BGYJRq75VjA==
X-CSE-MsgGUID: BdX/d3qrQ6mmUU07+Adrog==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70207761"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70207761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 16:20:34 -0800
X-CSE-ConnectionGUID: 42pBDU0aS5irW7HM9VLrVA==
X-CSE-MsgGUID: vDkFyKDESJGTT+SW3UnJiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220784810"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 16:20:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZqg-000000008Me-1Aox;
	Sun, 14 Dec 2025 00:20:30 +0000
Date: Sun, 14 Dec 2025 08:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: arch/x86/xen/enlighten_pv.c:118:24: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202512140856.Ic6FetG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 1ab7b5ed44ba9bce581e225f40219b793bc779d6 x86/xen: Move Xen upcall handler
date:   9 months ago
config: x86_64-randconfig-123-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140856.Ic6FetG6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140856.Ic6FetG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140856.Ic6FetG6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/xen/enlighten_pv.c:118:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got bool * @@
   arch/x86/xen/enlighten_pv.c:118:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/xen/enlighten_pv.c:118:24: sparse:     got bool *
   arch/x86/xen/enlighten_pv.c:120:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got bool * @@
   arch/x86/xen/enlighten_pv.c:120:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/xen/enlighten_pv.c:120:9: sparse:     got bool *
   arch/x86/xen/enlighten_pv.c:126:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got bool * @@
   arch/x86/xen/enlighten_pv.c:126:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/xen/enlighten_pv.c:126:9: sparse:     got bool *

vim +118 arch/x86/xen/enlighten_pv.c

   111	
   112	/*
   113	 * In case of scheduling the flag must be cleared and restored after
   114	 * returning from schedule as the task might move to a different CPU.
   115	 */
   116	static __always_inline bool get_and_clear_inhcall(void)
   117	{
 > 118		bool inhcall = __this_cpu_read(xen_in_preemptible_hcall);
   119	
   120		__this_cpu_write(xen_in_preemptible_hcall, false);
   121		return inhcall;
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
