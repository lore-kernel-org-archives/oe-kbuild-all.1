Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACD265632
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766825430; cv=none; b=A6k8baZrXzVU0zIE8QBUySu4yUFuNw2ajbPe50Ter1rn+Y07UmkgxEK+dKDcTPlPwVDAxo+NyL0DrBlg2Eeh9RWiD1ZmQlQQTF+2w4xdbKATVFCTCSzxJanoqxqqdKkgNcRDp1+btMX1mXQ3GWI7kQ1q0RRuDnQ8J9biVuXPtyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766825430; c=relaxed/simple;
	bh=lYiPTM/naX/HR/CY8Fh8abTKM9IaGidN/7qgDVMge2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FvqmuqIkKANUwmIlx2UPSgKjx+K3oJouYAHVShq+MTm3PjECC49kQdFjNFmhnMjPZCnywZpyJu67USsoABGQQJCgSkOabvHToNaalsfLBmOLLL7ja3FK5/YhMqmttsLfS2nh+8yAyMhk3oeS/Zsj31dNRU2LkWkL00J0yvusG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBzoktHQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBzoktHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766825430; x=1798361430;
  h=date:from:to:cc:subject:message-id;
  bh=lYiPTM/naX/HR/CY8Fh8abTKM9IaGidN/7qgDVMge2E=;
  b=HBzoktHQwnlOwVpgjBp6xX7Ji6rf/BjtzmaxJ7qu77gk/4YqD6Ac7Y9C
   UXkCW0pjyrZdol+gNsC+CguF+BYLe5EAO0oNFG9AkWagNIvsk6QhIjQf2
   O3ooxrGsQA7hArhvJhnLXhkII4oUiD/9f+H3+NmD903XZqyLszT+STvXR
   Ul8Ezi5nrW9UIstamzbvlSH5WB2B3TlMwx2wUqFBC1QCh5hHIzQasNGcr
   d9VuqNwTaxgaCnoJAh/kFLihb4Hvpy8wG3o+dNUpdq0dqGbjZzNs76gx3
   fjzNQT55Hi3MbKxhYJmRb/DF6qM0H9eX2et6CQhD/iNMO4tmTxVzEtG0R
   A==;
X-CSE-ConnectionGUID: mK7IwOsASqOQH0611gXMGg==
X-CSE-MsgGUID: wjmPD0t3TbaQEO5ZzlGOnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="72162914"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="72162914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 00:50:30 -0800
X-CSE-ConnectionGUID: YPA9iai0Tqavgzp31sv17w==
X-CSE-MsgGUID: aLu4repGSEGfmLuhHgoIFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205052162"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 00:50:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQ0E-000000005hO-1Y6v;
	Sat, 27 Dec 2025 08:50:23 +0000
Date: Sat, 27 Dec 2025 16:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 3/29] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk
Message-ID: <202512271615.YH4nHgBs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: fc7b63cabfb09a38e2d273593c58996f28d4f825 [3/29] x86: Use PIE codegen for the core kernel when CONFIG_RELOCATABLE=y
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251227/202512271615.YH4nHgBs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271615.YH4nHgBs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271615.YH4nHgBs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x2: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
