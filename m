Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45019CD0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728906364; cv=none; b=BksPP3R8Jesj0WruUPFSl7wuvKu8TBVuBlNQXDv8bxETto/4tI7T8/IJEdw6uOba4nAy88JhSAfPIvuwFz70BWHDJu2BGDcYRyDpoIMr0y5XZLiPgsqna7SLgBF5tzqVk+1uwVlV8C8NntAn8Z0G+btYN3TjQs1gaU0kmJGgV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728906364; c=relaxed/simple;
	bh=TOxPNVmv+iW3f9yB4Xpv0XOZFA0zK5d7oPDHlC1noRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jv1VVnKb97XeV0eLse8u1C8R4kgWENkUpWSwokTK+GWjMFhBNtMzjmLlrz/qGbhiUJcOgEoXxApGXNaLrL8ZznXtKHQMUenXAWt1QzEl7tKk81OldBXxA9cCswJ3xLbpTu1UeyPNTlZKtq1mVEe1v2l9v70lqISYqvZ5smjM4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijAiQ93X; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijAiQ93X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728906362; x=1760442362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOxPNVmv+iW3f9yB4Xpv0XOZFA0zK5d7oPDHlC1noRo=;
  b=ijAiQ93XZhVJuplfQ55sct/4vXKs0nR67iagSDAzBVkgAccNl8dDDCW6
   ZUbOkSAE0MNX21hRyAeVbueDD/SjtoyhperGpk1o1RGIH6eE0gsabhuF+
   iElb9TnArSMsBjDLnvxRCD/6icUoyd223bT+N7uqF1HlS09ahe2X0xt6o
   BDcDgLgkN7JVovOIfq56qCqRypX6smMg+/WFr8ia0Kue+nhRJ6EnLJ+RF
   ZoduzM21ETPMIHxsru8PtHoZuXfLOW9OLEiVmb54IiX/Naz92TgH5NKiq
   cRKPUMrW9msq3P/hAaFb/YVXpMunF289oEoHVLkbeCmQPEn7U+v4YUPgP
   w==;
X-CSE-ConnectionGUID: zvunT56GQLOzlquCa1qMfQ==
X-CSE-MsgGUID: fLNbfFsNQvuxAGkV5N8uOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38805001"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38805001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:46:01 -0700
X-CSE-ConnectionGUID: WcAP6rBwQ2SSOTziSX36Zw==
X-CSE-MsgGUID: 0EbFI1RJRhGqFHi8f6NZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77892159"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2024 04:46:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0JWQ-000FFB-2N;
	Mon, 14 Oct 2024 11:45:58 +0000
Date: Mon, 14 Oct 2024 19:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rebase 606/1105] drivers/usb/host/xhci-plat.o:
 warning: objtool: xhci_generic_plat_probe()+0x9d: unreachable instruction
Message-ID: <202410142137.rFE8ScvP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rebase
head:   3cdd0cc9c0e53917e2c4e56b1e7256ae8923845e
commit: 7ce55f4ea24048dd70fb4aa8f522c94d5f767f08 [606/1105] xhci: split out rcar/rz support from xhci-plat.c
config: x86_64-buildonly-randconfig-002-20241014 (https://download.01.org/0day-ci/archive/20241014/202410142137.rFE8ScvP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410142137.rFE8ScvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142137.rFE8ScvP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-plat.o: warning: objtool: xhci_generic_plat_probe()+0x9d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
