Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655D1A841C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 01:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737943140; cv=none; b=qW3bUtomt0tvG/7VxjPogbpNuK/NxTRrulnUg3QL0sccKrz65A2WPWuPteJDxrKBVvSfmDhlh1LKlOJRDFfPn5NZzR/Pktmko/E3S2XCDMGJ70Q5n1Gr3ilXe/gzgaUeJ2CVsUH2wOsp9L60qD/h0GA7iCunawpoFKMJMwAb95o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737943140; c=relaxed/simple;
	bh=7KhAEwdPjrGsXUe59G+eBiKmLpbIZnN4bQw5EqLCUiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhwwfQnvCBPWgOdGtiYs1+/L617IwqQRhINLLWD/BQsjrjFKRf2gKOeG2CDKGs2zWpu0S6/EaIsgJvc8y5urJT+ZmI0bPwaEnDumTS22JICGHjGM6z6wCfflaKxoyKJrdIm3ZaWQPuSPuzE34fwaMz0ws3Gwu25iV17XvrInvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBHYUEbc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBHYUEbc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737943140; x=1769479140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KhAEwdPjrGsXUe59G+eBiKmLpbIZnN4bQw5EqLCUiI=;
  b=KBHYUEbcygl7Ppa7OhFd9waUG+qDprDSybctuCSWm/lWodTtBd0H08TC
   X92XQUDmqw06ihC9oQB24GAA2EGoz8J80qF9Q3v3riNvRT1rekxmjDOqz
   MNKLWf9VuybxOrIRe3ws9MDDn3/6ZCZGXq8qAce6Wqx3j26iSWVkGYkmN
   2/vOt5qNNBYa+Ub3PLS5ET7iX+5WFunhOLyMMFr8I60BKlwgK7oVTOaat
   a36HUPs7EWeyCHzdZGCg83WLNOFQvy7CuIjo9XXLPtr3wvB/NImR6ISOe
   n+p3cDcWLZxoVbLZ6+JyRc6Ouz9B/v8KBGX29Ei9jZOiM59XA9PiNiqRh
   w==;
X-CSE-ConnectionGUID: /xqqO5MMSoqTY1VmPxLgrQ==
X-CSE-MsgGUID: 1wxUp9UzRT6YfvPYT2VBwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38287481"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38287481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 17:58:59 -0800
X-CSE-ConnectionGUID: MmMGy4U8TDyQIsvOoQmRnw==
X-CSE-MsgGUID: oRV+IE+OSJWdx9dkPPdvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145539425"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2025 17:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcEOt-000gJ9-2B;
	Mon, 27 Jan 2025 01:58:55 +0000
Date: Mon, 27 Jan 2025 09:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 77/83] ld.lld: error: undefined
 symbol: dwc3_complete
Message-ID: <202501270926.eFLY8K3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: 6d5cb9b07c07bdcbb8f6c93aa52b89034c2e6983 [77/83] usb: dwc3: qcom: Transition to flattened model
config: x86_64-buildonly-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501270926.eFLY8K3H-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270926.eFLY8K3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270926.eFLY8K3H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_complete
   >>> referenced by dwc3-qcom.c:888 (drivers/usb/dwc3/dwc3-qcom.c:888)
   >>>               vmlinux.o:(dwc3_qcom_complete)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
