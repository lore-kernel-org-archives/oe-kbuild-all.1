Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B1823CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715169931; cv=none; b=nvCgFlx4mMiGTncfIMgWVv6Scmikf4jWDngr0e+bNs+wnCp8ewNqxNfPPxK1LIMD3WyQ9eIDPn9AK4DCtIWS/yfUmtRHNgFCAgTAjfehfcSUscsbgTV2qfBvanDvykhia4TfVFVDziIgbMisElnk1QdJtmm1zGoTQ5YtWmFvYHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715169931; c=relaxed/simple;
	bh=aseCNHmKKS5qkahI5W36HCmMPTmcdR6RAnLyKlgJP5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSmhzK/NwNO+mu6Tpkxs0Eutt2U5cNay1xVhphPRK2JQX4yZJtiIZrbVIr8bhIe/Rwcde5b7Wdg4AG/2PJrsnqagE+HK5f+cL0AaUVNmUdNTDOT1mnJvOgJET8fKzyqJb2XeYJauNgKPQwcxLnTjEmFlWbVSuAn5jxHVj6rxsj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGPLKVum; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGPLKVum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715169929; x=1746705929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aseCNHmKKS5qkahI5W36HCmMPTmcdR6RAnLyKlgJP5M=;
  b=EGPLKVumN+4iFkXEZwqyNceKfIvIYD52ojLkc94l8onlAJ6ln+LsIAL6
   TLbgkV+fN0u41UxYa8/mV+zTCdItZ8N8psPtD0dWbxuRH2mhuSzea17T0
   R/UKgTc/9umELTbYwMXaTg3jWxSPAnBP0hYnT8+eI3WoLULaeuENLEKMK
   ZdkQ1WfrWrev2/GJTdbuSpK2U9pqDXcNHLc86w+P/JG26hrOGRdQNpmoB
   S2NzErSyRVYsF5SxXy+u1deATX7ZII0zd4OHHlDkbSgNIvpJxufl5YBeI
   /IGIfXUktsvV4+jsLHFQZz5n9Qs/MEPCYc5LYYrLkJoGXvb+KKlSQ9D9h
   Q==;
X-CSE-ConnectionGUID: yqFM1BuPTBWE9t/yB0uFNg==
X-CSE-MsgGUID: N5T81SiuRViFKRjHdFwClA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21623468"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="21623468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 05:05:29 -0700
X-CSE-ConnectionGUID: 2cac2XfkRkKEY8Vq55B/pQ==
X-CSE-MsgGUID: iXBhg1OdRfKnDxOERyJe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33337605"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2024 05:05:27 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4g33-0003Ne-1g;
	Wed, 08 May 2024 12:05:25 +0000
Date: Wed, 8 May 2024 20:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 10353/12060] powerpc64le-linux-ld: warning:
 orphan section `.stubs' from `drivers/dma/fsl-edma-trace.o' being placed in
 section `.stubs'
Message-ID: <202405082029.Es9umH7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7b4ef8fffaca247809337bb78daceb406659f2d
commit: 11102d0c343ba06ddd303f2503c0ce46d70052f2 [10353/12060] dmaengine: fsl-edma: add trace event support
config: powerpc64-buildonly-randconfig-r004-20211025 (https://download.01.org/0day-ci/archive/20240508/202405082029.Es9umH7n-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082029.Es9umH7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405082029.Es9umH7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
>> powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-trace.o' being placed in section `.stubs'
   powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
>> powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-trace.o' being placed in section `.stubs'
   powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-common.o' being placed in section `.stubs'
>> powerpc64le-linux-ld: warning: orphan section `.stubs' from `drivers/dma/fsl-edma-trace.o' being placed in section `.stubs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
