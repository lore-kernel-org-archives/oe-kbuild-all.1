Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280537475B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534007; cv=none; b=SqqFRMAN4Vh/2kYT93d2OGmVu5Fvypv9bysvlsMXdJUIkTx1Pma3qOARASAKmcKPNI+618iOh5JOU64FpClV6IrMF0AdZ+EYf8iEqAiQcsDi/ir+RdnDvrfjdumQjGsOzZ+var8pgGDya9HcvcVxn8mV2M7sb5kdnSA/GIyAB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534007; c=relaxed/simple;
	bh=xqqXf+Dhi0s6WSRLiUjwAeGzKobHtq34WIkNNcC87Yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wsvex3iyS62Wkbm8Z66g3MtbI7Fk5xc+u0/ig3RqzC0Fk7PPUqzSLFQagi584MrJMEvytxlOep+x7smAslgFfS24JVlA4UPcM1+wh2KGDDQSGKpgVEkdIKvq8VK7xLfNZdgIAYryRzuSZVTCNPvduPcQ5+7b9xZTTx0vFoe6v9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwHhNdzI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwHhNdzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534007; x=1807070007;
  h=date:from:to:cc:subject:message-id;
  bh=xqqXf+Dhi0s6WSRLiUjwAeGzKobHtq34WIkNNcC87Yc=;
  b=ZwHhNdzI/oBi5wB4M1KlrlLOPikP11WM2ywN+QNMXx6XEPT8UuhYKnf1
   8jg8NU2h9Yel5mNSRbNXUWyUDLX1uM7sx3PRqAULcLXYXmnOf8atnnXPe
   ama5Pncdb6mfpfNzvv1oUFxjnwBTzcUnb25asEWsHlxuINCx03H/mars5
   k+Ui1sBYaOFo7Kwzfv2H/mwPN2knMow+3nojJla4ZbRPQiXrV6wOg5Exh
   jqEJGV3oXEn3NIGZdPMI5rvF1e8FvflptPW4Bs6fj+u3N6yAyaDCFitCx
   2Wn71oc9EU4S1H0co32Xe3AK/bfsiG5kQZ2clE0GrCxYpRsIi1wD/9TlP
   A==;
X-CSE-ConnectionGUID: R9iE8DA1Q76YOGdx9UDmQw==
X-CSE-MsgGUID: X5J38KPKQcCdLPRF94w+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86781612"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86781612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:53:25 -0700
X-CSE-ConnectionGUID: M7tSMqiZSd6rKSVqRXRSnA==
X-CSE-MsgGUID: ptL1L/JURYWASoOw72MI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225303575"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:53:24 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xVB-0000000003D-2ZWB;
	Tue, 07 Apr 2026 03:53:21 +0000
Date: Tue, 07 Apr 2026 11:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9/9] udmabuf.c:undefined
 reference to `vmf_insert_pfn'
Message-ID: <202604041133.Uendf3Fg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   efe16a3021b9f95eb1cb83e98d0d1db9bff94ce4
commit: ac48ddf6b0232863674d38d4d0edecb40a1bda78 [9/9] udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: arm-randconfig-003-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041133.Uendf3Fg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604041133.Uendf3Fg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604041133.Uendf3Fg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> udmabuf.c:(.text+0xec): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
