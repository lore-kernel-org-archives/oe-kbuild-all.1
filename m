Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3073B7B91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793837; cv=none; b=dHcQemrifjfMaAsSugag9oWYkKmdRbVAH9iIJXKz+opyOVQrVFNJCbkm0Lhohtt2Ds23yIVMcID6GxuhMtaL4x9wlUgJRm4jDWtOuUudBNfSQcnQF2+4Lwk88StmWXuG4HntcYjb11eTyRYCc0PWl2/v3+cSErPwNZGjWR2voSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793837; c=relaxed/simple;
	bh=OTsrmU+bhyn3VZCxiU89rd4HceiWL/nRvXizikFUeoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bD27OrOQlp5AsoxCAETTT45ap9llrSLZ09zw0e46LXkQP9ic+32709pQ4av/RHqDKZ/+FPOQw8O+I0bfjGfKyP4YdZKnxQjae1u0n9wA8PoZ5CvSzzMc051fs3DrM/lzawsJiNFx4/XQpqoPh3Ib0OEAjaJ3C3DDsIH5WFhlMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdbPoNJn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdbPoNJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793835; x=1810329835;
  h=date:from:to:cc:subject:message-id;
  bh=OTsrmU+bhyn3VZCxiU89rd4HceiWL/nRvXizikFUeoc=;
  b=RdbPoNJnZYmsL/GVY7Ca9el9xz0NhFlZ7A93hEVb8e3FvYLs85rb1bzP
   QicCKCpqeabHQEDSSWqzgddrcs7Pr9YcjqhOzi/0NbQE+rGHYbQ3O8K06
   /6t3xBCDmZA/QxHQgRpRhii3lX8/+l+AAkI97uS6pTD5evsd9Mw1iI1o7
   rcVMrNLJ6XElqmihkKeS3+10DGSL5eXo/NBW7GAq957JtUv6bdRLJocQ0
   hTeXkhMLrtMbVqStOWW0YscJCKCBL156+KjZCd19HMNXaJbyvGxhC/S3X
   iVMnSpB3eoQzaleYYl9nvRTgQHiZrF6HR3PSAScdYki/NNd7Ao+EqEEmB
   A==;
X-CSE-ConnectionGUID: d6gO0+loT6KSJWXGL3CvXg==
X-CSE-MsgGUID: SAL3jmYLRpu9CHUrNzS6nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603402"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603402"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:52 -0700
X-CSE-ConnectionGUID: WonYBUcaT/CoZFcLfA9TLg==
X-CSE-MsgGUID: 6nCqy1ElR7GKcsER09I3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458958"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001I-2iBe;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/el2-vtimer 1/17] Warning:
 drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in
 'acpi_gtdt_descriptor'
Message-ID: <202605150401.Pd0Z0ZjV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/el2-vtimer
head:   e793e78f4ead18e3dfe5a3a1be912a7ec5bc55d8
commit: c58180850debdd9b2306a86238860769137f40cd [1/17] ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descriptors
config: arm64-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150401.Pd0Z0ZjV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150401.Pd0Z0ZjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150401.Pd0Z0ZjV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'
>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
