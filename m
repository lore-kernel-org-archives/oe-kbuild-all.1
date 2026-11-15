Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760137;
	b=gWPODRksM0r+rW7PpOcndUqUpt16YFAU1ect+C08rTDkr27kPg6xuSbo798y6EuPK54g
	 hVPuEqcDFazBdqboIjGxXPUND+bIkMdxFkWcyu0gYyVRV4u8XqcrWhzTj5qRXC9iyTtXy
	 gyVxM2AlNpBbAa7VNgPhEPfyhA3QATd0WAHdEjHTy5oK3K351/7yvXGRyzq4hBK9VsXti
	 xbFYPO4/AD7eSya0EETbc2EE1DLwnD7hU+0jphebT7ciJ9IIuZ94lIJZbPCWE4hChqz6N
	 kMnIpqD6WWLTUL3vx27vU2k8jzh26NVATe92XTZYQ0CBFNkMCL52GOtb8N1G1Tgbb1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760137;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=K4tqPHQ2TGxmxB2s84Ytr8HIVLoVGZcqE0JXAR5BO/8=;
	b=VEOh26t7eLArkP+fQm0fL4Ogz2pIS8R26EDyi4zZT1jQIS/BtM2OrH0iJr0zTMM+lU0M
	 fMb69rXBpjeq25ufsj4NnGVHwdjl/0/840Tr4xCHws8omw+ZdK61LCeBeVd+RF5j6pCDV
	 lK/RzEg628hrLIsuDNPMQy7HXwhx7BoNg8cw7NWiVAMPrfF5zMHUD1acLo2hMzT1d4Ocg
	 UnI8USex9vffyDlVfHotT5zgPSuKUawitIXO2t5z7vkYP4lMKWYg+5P/v1k8sbe2WLLE8
	 c20BJY3TnBjlZnpSC2o55q+Vs1lu1rADl2xE0fgvTpZiRR8shLEZfYf5NjLVv9i7zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luknuyNZ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B27606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 16:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B27606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=luknuyNZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794760136; x=1826296136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGqceJuqxNxltkPLs29w2Zuuud7BMNwlebSNpiX3d4g=;
  b=luknuyNZ230CY1mKn0WOJJ+GNQ80C2UJ+jj1npQ/enxZC6Vw5wbkrwLR
   JJnQ0IbjPM6wS49PLO/Z+j5+8YLLbtAMqCbY4cDCi09wbiHv9ydof6KM2
   520aHwC7uikLPwiJVBXR3vBtlGqrj+9TXzlUwico+pf9TsQv/CkQoq/oM
   Jtm+Q3Vwmf8JAIWuBzFSQY2suux0eMCCnFjj/5S46/UlZOvhaKJ478n4T
   FGZRU0maEDRA691bncxQ+Z4a/TyipQyMn3J/bgCuzy8kovq2cc8Jq7V9b
   b/yk5N9ITQfyTljLsPIMI1+NP7MljRdKQ3E9XSOdrbMD8R7QyRN8999dx
   Q==;
X-CSE-ConnectionGUID: RjMAsclZTzCvJlyw0ZA/Lw==
X-CSE-MsgGUID: sXHwI496Qrqqfguj3avXiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3494213"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3494213"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 08:28:56 -0800
X-CSE-ConnectionGUID: sNze3bm4QE6lyf7pN4kNlg==
X-CSE-MsgGUID: HiHMIc9bR8KtT45EdEFtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="11075420"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 15 Nov 2026 08:28:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSd64-000000002Iu-0tAs;
	Sun, 15 Nov 2026 16:28:52 +0000
Date: Sun, 15 Nov 2026 17:28:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: ERROR: modpost: lib/lz4/lz4_compress.ko: symbol
 '__divsi3_table' undefined!
Message-ID: <202611151706.g0q1YGnb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 2180d11e06fb56fd13643ae59964f144896870be nios2: ksyms: Declare __mulsi3 export
date:   4 weeks ago
config: nios2-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151706.g0q1YGnb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151706.g0q1YGnb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2180d11e06fb ("nios2: ksyms: Declare __mulsi3 export")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151706.g0q1YGnb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/lz4/lz4_compress.ko: symbol '__divsi3_table' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
