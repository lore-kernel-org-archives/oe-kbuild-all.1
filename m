Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCC319046E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084872; cv=none; b=UQGF27QLQYjI2wX2quYv+PfCBph8JQNMBvTankye0pCElyLOJxxLys+vdRchCcCSkgZO/HB/V/SfnDYXhp6M+l02Q03Rxg7fDUkMhphKqvCIi4c4ybXusq1mwtnSK23cjzg7KS+M/ToF54rQpox93qDilRqnh4y+oo8vUqkKFuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084872; c=relaxed/simple;
	bh=Lu85mNIc9/B6ZAnoH/ZUc8ufVRrnWmoJKSCln0nhX9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hQJQt0WBQMR91J90XbHMENKlZON53rCeGPvE9746UNrbP9s/P0g1S30TIc2HU1c/BrsIkIfi4Btp15lKEndtkYvBO9zxU5kq9h18hG3X9SW41WfzptQ30ca8TNSlt8vQ2nQZcRfMeiB8BTnA0p1JSqntNZ0JEye0avjJ/ni768s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyfeEPmB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyfeEPmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792084857; x=1823620857;
  h=date:from:to:cc:subject:message-id;
  bh=Lu85mNIc9/B6ZAnoH/ZUc8ufVRrnWmoJKSCln0nhX9k=;
  b=KyfeEPmBFV0Y3PCDRLASJHNRaRtanzoCChsS/tvIxQ7fzuwesXLLcwW+
   JZw7np2jcXR2iKd4Ko3JPjvLQ37uBKVWml6vQkKE4zdYLuVOUoiL3IgLu
   Y8PDLiQeybwZsPJ3j2V8LekuG1Sm81rB42ncQ18jhLes91jEQ/bHFqVyD
   DlrYkrVKqqRSbnsetfmxA8yDZt3AxFtvbYmxr3B6wmEYomTZ4rG/BLbZC
   mWFMorYw4RpVa/0Uk7pZdj7Yl4LFtcz/l+prjh4PpliSDzb1aXT/KySaN
   s89JG9jcYMjE3e1IOSdVyS8ZPUyVarUa6SB9V49xBXxP7OkHF9WiozoMj
   w==;
X-CSE-ConnectionGUID: VZOjUA35RKeddA0+MwEGfQ==
X-CSE-MsgGUID: It03wmUBTs6H75N7rBYwSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="747371"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="747371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 10:20:57 -0700
X-CSE-ConnectionGUID: K+6GQbGZTlyhN/onqdKTNQ==
X-CSE-MsgGUID: gGRIIziGRxmDLoy7WOCLzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1841391"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Oct 2026 10:20:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHP8O-00000000BnT-3cb6;
	Thu, 15 Oct 2026 17:20:52 +0000
Date: Thu, 15 Oct 2026 19:20:45 +0200
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 158/334]
 kismet: WARNING: unmet direct dependencies detected for PCI_TSM when selected
 by SAMPLE_DEVSEC
Message-ID: <202610151954.R8gDKvG6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   c390eac65ae31598feebbe91bb9fa76ee4ae8cea
commit: 3ce3bac6a3b4fe37fd7c88a0b8227e6cc0e55f9a [158/334] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: microblaze-kismet-CONFIG_PCI_TSM-CONFIG_SAMPLE_DEVSEC-0-0 (https://download.01.org/0day-ci/archive/20261015/202610151954.R8gDKvG6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261015/202610151954.R8gDKvG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151954.R8gDKvG6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCI_TSM when selected by SAMPLE_DEVSEC
   WARNING: unmet direct dependencies detected for PCI_TSM
     Depends on [n]: PCI [=y] && ARCH_HAS_CC_PLATFORM [=n]
     Selected by [m]:
     - SAMPLE_DEVSEC [=m] && SAMPLES [=y] && m [=m] && MODULES [=y] && PCI [=y] && VIRT_DRIVERS [=y] && PCI_DOMAINS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
