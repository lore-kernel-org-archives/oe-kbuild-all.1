Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91117AE11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 16:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822529; cv=none; b=Z0yVlsfeKLu2iaYG+DsGMw2t0yBMfD+Uylw1kyjE4XxE3gTzoqIxKjmpiC/CoH+pkfU61PSf0ICxA2989tErwCI/disYF2knZVFEuNAoCEL0/u9+o417/q75KHDcp9WNrl+FSc7VQYbKwBTeN6r76EkIE9UBeEqkdRflHGlypWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822529; c=relaxed/simple;
	bh=BFkelapwhRtIc4Hl3PiBryS6L+SDx/0/cqxlV7LDztI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bgxLGQUlT+iZUMBow77YujHj663I1Wn+JY8LSyXeGzeDUAXbqWK5scpD+gqyXcep91Jjd/CxMlj8J/AK1V+wc2L3eqXVaAscNdMD87IM5HcjPsSqJkz4Hp6NlEIWavc8fFPg7nOB7V474b7SPNJ2VMQXsEM/kcFyPZ0Zm5z+loc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4a5kUWC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4a5kUWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744822528; x=1776358528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFkelapwhRtIc4Hl3PiBryS6L+SDx/0/cqxlV7LDztI=;
  b=E4a5kUWChFjZg23bl3IXh5dmjwJR8iDD+CjbPgYiIr8d7I/jTl5nkUAg
   ACAc0ZDAynPI1JCx4FVPXcFxwuVitHQ7rFTAlJOBjWDWLiEb9PsbzZ48A
   Q+MM4sxEy5lIhzJqsd6GBg/fsKk+vE/W+zoCjFCsZ7p2m3iLzhIy1VkK0
   SKSSwcRGG0pTxosODLOOqGvbPlrvSxGHrYG5FGUU1E5wEwhVaqNrk3MTO
   dwhUSbGV6rhYDBXqBF45Nk3bsADwE55mcgmuu8SYBUnrMnA8zK5960U8l
   /PNBDsWcLKgcpfcyJOdUHE4rBfUzpV9Mse7ZfkWqmkN53vRh3pUGTo9TF
   w==;
X-CSE-ConnectionGUID: Jw6jcJDSTAekjd/aTMbwVQ==
X-CSE-MsgGUID: GCWy90fTSSuBQzYlhAelmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50033027"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50033027"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:55:27 -0700
X-CSE-ConnectionGUID: FzPCTTFcQWW4k8N3Xccbmw==
X-CSE-MsgGUID: Usl0fN9WS7ySIGKRr24i/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135614513"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2025 09:55:26 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u562k-000K5q-2x;
	Wed, 16 Apr 2025 16:55:22 +0000
Date: Thu, 17 Apr 2025 00:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1582/1582] kernel/futex.o: warning:
 objtool: futex_wait()+0x2ab: unreachable instruction
Message-ID: <202504170042.n4ixMCSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d47443532b562cff105f8cfbc32343f83a2ecd01
commit: 1d78ee3e3677377ad1596c4348677899fe8337ee [1582/1582] futex: Move futex exit handling into futex code
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250417/202504170042.n4ixMCSo-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170042.n4ixMCSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170042.n4ixMCSo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex.o: warning: objtool: futex_wait()+0x2ab: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
