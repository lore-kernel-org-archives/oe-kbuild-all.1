Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3FF29CE9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761765995; cv=none; b=QIQhQN3R6lYqrfS/x3gi/tI4UX7OOViuOqMPNfDcl5vVN0cCOi2zWZBBzgJx20ZqFFx7pEFr8ZgRBxO4Rgs6afrdPGunQHWsnWtynvvWw49V2ciDh2sJlQAbVcNxxuuBfUBH1nMBySFgSQHmRe0Von74YRUCMsC4G+unbE3AdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761765995; c=relaxed/simple;
	bh=NcLeuxuShzQht+pLf22v9p8fhAslHDJLpw/w3Ys1Kvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8Ms9mOfD1c+NZjpBw1KmiIr0loDg4+5zBH5BHHN2TlTZZm4CtUBTGtCF1vbvUI4RpnQ11enMHTkOBD3QhfqFO7/76yxWKeKEKXybpl/PNc77RwwGSW4E2sHGkQI2UKWpeWI89hmDNsgT6rAJU52UsOF57GrSVL6f86ZGGvdwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFO+m0wP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFO+m0wP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761765993; x=1793301993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcLeuxuShzQht+pLf22v9p8fhAslHDJLpw/w3Ys1Kvk=;
  b=FFO+m0wPKMg0gi+4mWPaiRo7yTENTVHZNajWB0Kev8ZhqmNrf4aH1IZd
   N/v/ys/omcx4YTv//reB6lIL7ZdvAIu0Jl838rmByMCf1gEXUCkY21Onh
   XtqUxt0i1C+vxMXfBeACr1z6qiSwNOVaZDjDEd01WFfkI4diMKH3E18fl
   knjzdWDI7cyP9khhThTqP5rxIRp+46R90jpjQGdwMPI6qjCidUs9TDpJQ
   NdfFxKraI5Y9by+JS+2EdiduEFwQs6UayBCP47WF4Uc6xartQd4sE1mEU
   QP/NXP0Yw5bfvBrjw7uTKC8ilmxln8A+Pylqsgv4tffRLB9nMQLaVrgKt
   Q==;
X-CSE-ConnectionGUID: iHMQoMLsSMmcBW+Xvmyeng==
X-CSE-MsgGUID: cniqywNMQkaNIzvewiEURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74188797"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="74188797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 12:26:33 -0700
X-CSE-ConnectionGUID: BgG5gRKfRXmeclUc/emeQQ==
X-CSE-MsgGUID: 2ItTRnvWSBiGowyHXlUFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185402286"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 12:26:32 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEBoT-000L62-30;
	Wed, 29 Oct 2025 19:26:29 +0000
Date: Thu, 30 Oct 2025 03:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257] fs/xfs/xfs_acl.o: warning: objtool:
 .text.unlikely: unexpected end of section
Message-ID: <202510300342.0lpOlnRP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5860abf4ca1c1e5ced0d4787886db4195a9c54ea
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [3257/3257] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-013-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300342.0lpOlnRP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300342.0lpOlnRP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300342.0lpOlnRP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_acl.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
