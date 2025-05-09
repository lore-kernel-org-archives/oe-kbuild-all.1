Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD3208AD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 01:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754752; cv=none; b=aSTxae6J6HW4PFHj9V1wf04M4S73Wy+SBSK4f/uZqXwF+R0CB5i/TrXM0+awybzGCdeJdwp8qk8vtnosfHFgcA8qWQop/yFPji9ktRLuedcLASb5T+JkgO742wJL54p5fIOZuc4CiWy+pJa2+cntCYl7qomNDK3ZN80XoAYHLtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754752; c=relaxed/simple;
	bh=xl/wH8teuWGsmJ2JBkgsY5tFG84x6ZpYTk4GSGy+K08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W+ANF2vk+RqcYD0ysHW0N0iPyelJvtGCGVRGarMfdd0kv4MFMgj4e6X2fa/Kpa6C+aNIyv+a36AI+obXiTIPnTqRbVptWrIDQ96biiK9WlZvws3pPfom5M/gXYh76ToKi9jciY4vlthCe9T497w/BSJlQKWamgso47ckAj52v9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnVWBpex; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnVWBpex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746754750; x=1778290750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xl/wH8teuWGsmJ2JBkgsY5tFG84x6ZpYTk4GSGy+K08=;
  b=SnVWBpex/kYD43Qd+iRKvk27PuVftG3ZHRd7pcq5Z7psC/EGR374RwHy
   S8rN3DbVlNs++vo/0fSM8eTLpJZTcJtd6L+K9gPrCZzvUP88scO/ngWO7
   rdKzYF8ck9nenVlqTMT/fi0Rm/ll0eqJmeOIF6s+s70iAiEoTDW6rppMR
   c6cd/ykdrKIhrKBUUBKQ8FXkqvdYfVeKTDudkw1iRg41pDrQK/JSvBzHU
   ZvNd+DPYFQWPIaAuRs/+0H/ZCFHTOfO+prgdl8rLTw7mRLSUCr1mi3AGS
   3NAf6ayO82g/ta4VzlHAQEu+dDczg7ILmUlAcvB9GuOKalffOc1ULEqGm
   g==;
X-CSE-ConnectionGUID: p9VkcUMpSjWeucDL8jSmIg==
X-CSE-MsgGUID: jARTDjE3S16oq3A9ej4MQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71081721"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="71081721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:39:10 -0700
X-CSE-ConnectionGUID: KLz7NVaLT0eGZU6wvoWcnw==
X-CSE-MsgGUID: b3zazLYKScGZMpSsRTxqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136426588"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 18:39:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDChe-000BXP-0h;
	Fri, 09 May 2025 01:39:06 +0000
Date: Fri, 9 May 2025 09:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 9587/9729] samples/tsm-mr/tsm_mr_sample.c:17:3:
 sparse: sparse: symbol 'sample_report' was not declared. Should it be
 static?
Message-ID: <202505090938.avfIhLsl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 42ac41dbc5726beff7c0957f15f0a887f70da199 [9587/9729] tsm-mr: Add tsm-mr sample code
config: x86_64-randconfig-r112-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090938.avfIhLsl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090938.avfIhLsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090938.avfIhLsl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> samples/tsm-mr/tsm_mr_sample.c:17:3: sparse: sparse: symbol 'sample_report' was not declared. Should it be static?

vim +/sample_report +17 samples/tsm-mr/tsm_mr_sample.c

    10	
    11	struct {
    12		u8 static_mr[SHA384_DIGEST_SIZE];
    13		u8 config_mr[SHA512_DIGEST_SIZE];
    14		u8 rtmr0[SHA256_DIGEST_SIZE];
    15		u8 rtmr1[SHA384_DIGEST_SIZE];
    16		u8 report_digest[SHA512_DIGEST_SIZE];
  > 17	} sample_report = {
    18		.static_mr = "static_mr",
    19		.config_mr = "config_mr",
    20		.rtmr0 = "rtmr0",
    21		.rtmr1 = "rtmr1",
    22	};
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
