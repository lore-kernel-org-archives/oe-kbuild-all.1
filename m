Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A1A199949
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766236841; cv=none; b=SoEU6LGLUVEDJ4Pdtp/sB+AhmvOMivhz8apWstVUeYY4DoWH9qMNuYlAys8l9pzdS0F+cPahMeFMmWMcWPCTijSUAg5XZtsqdVwAhJBEosSNh11F1yV6htG9LF5rtkkaY0AaKP9mObTLqxr1IcIe/TApUeFFP0UsIvus09uTTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766236841; c=relaxed/simple;
	bh=ddR2Zm/z1NkrFhggUlKkiDLmTSRnJMkHhAEakago+9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mceCwqd9myJ460vSMio0uumzSFiuAMzngxP5WwkwCxeAh9u5wjuB1GymzgN3zq+CNDAUquN+mayO8A6Vxavvb77vPfAL7R+Cqdc6hJHj1YH6C+KgFXSU56YLxi09v/qk2Zjn3FcYhoJEwtBGOQP8LRlGJQw7VXA9LkGnUNk+Tg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtsjGU5j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtsjGU5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766236839; x=1797772839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddR2Zm/z1NkrFhggUlKkiDLmTSRnJMkHhAEakago+9A=;
  b=ZtsjGU5jiDbun7OgdyaQ1U+14DKT7qtPfEf8fRao1aQZ82j+Uae4NOpB
   wAHLJ7FO/ZhyJqy5TWQ5RviFevInwEhXXID88jCohLa52HY+pAy3L0aN/
   8m1D/IyDl/oGzzwN8UVolTuq+U7PFZYwyTLzQAM9jvfgPLF5ZsL7MatMf
   EzYhl17Mht9uj9HGrpv+Y4KLom1nHpf6jon+Rzd6Cgji0NQzwJq+25wyL
   0zcPhnW5ZlXonW1sr4C2C4SvVhdl760TphYxIenSYWn07Akhtu2AtQlt0
   EUjbmXqkgTM+Tex698u1+Qszu1tb3nC5fzeohKzfaHIvnWr9d6qJvS6SP
   w==;
X-CSE-ConnectionGUID: OYLROkXmQx2mU/RDOTXqsg==
X-CSE-MsgGUID: 8EcQzI44RTa0uk8M69xn2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72032620"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72032620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:20:38 -0800
X-CSE-ConnectionGUID: 3ycxAd8vQYWpup51T0N5rg==
X-CSE-MsgGUID: vyYB09GJTROb9kW3f3k+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222561515"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 05:20:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWwst-000000004aS-3XCq;
	Sat, 20 Dec 2025 13:20:35 +0000
Date: Sat, 20 Dec 2025 14:20:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_SVA when selected by
 GKI_HIDDEN_IOMMU_CONFIGS
Message-ID: <202512201443.5dxCbXIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8a0f08a5606260a0680a6074ee5392a57cd3133d
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [2/2] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: x86_64-kismet-CONFIG_IOMMU_SVA-CONFIG_GKI_HIDDEN_IOMMU_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201443.5dxCbXIe-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201443.5dxCbXIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201443.5dxCbXIe-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_SVA when selected by GKI_HIDDEN_IOMMU_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_SVA
     Depends on [n]: IOMMU_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_IOMMU_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
