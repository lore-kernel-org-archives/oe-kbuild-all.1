Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C61E9B36
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742581882; cv=none; b=eWlWE1dgebvH3e+KIA6ghtHE93TZ6hAoFx6iiVuFp88J+7hDMIXdJIZI4NdL1pVUctfuNbaQ9XVww/vr4oUHsMXV5WimMRtffvfkJzV4ggv1mL8OSRFgyERnLkNnEuqtU8vuy83r6BZ+FoYX3rWgnLLMAdHOPt7sSFNrK/IpWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742581882; c=relaxed/simple;
	bh=y6EGF/mxSagxfgbYKqdWkLT4HZXwRDQ3HIzuXaFUuQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tr1R7rwmpnn2SCYyrZwFFQ9QtEfmhpXPbKkM1Y3EYmKQxb1UjHKojULw5kR56/FEwP7Bxk8YkB67eev6bFZw5ScxgZrYLGaa68l9dOLpXxGt+H+SEdvIebJ73USaWD91P4UlFCUEOFlJUyctY+C2kb/L0s5aQEhdj0wm/xtPMDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M528O1iH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M528O1iH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742581881; x=1774117881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y6EGF/mxSagxfgbYKqdWkLT4HZXwRDQ3HIzuXaFUuQk=;
  b=M528O1iH+ooLNlWJFg5yKHUcMt0KiC+V7Hxb0WGFbhr6YIVDAblMajJR
   pxzN5GRTtD4n62zKoeg8mjIULS5pJ82PgondS7DptKD5ZYUH1Y1tVIJmr
   tLBjJGdeo8atG9qaAzgELgvEyvHxXBB1UgahQhKUL7LJnhGZf9xKD5AZa
   QOg7wmndT6XrWWQvN3+6544lizKS6VyhiGs4HxiYr8QuK8kxqD2uq4TcS
   lN1DngL7GMsEvdi4MXZ4TYCIEcZSo2+qt1mF6cMq7F2OXl0xnvI5YaQPq
   z/r7aTY9nGhoRBCu3aW8CmODZriIScif9Nf979sFKoWBuAQfb5hCqHcCJ
   Q==;
X-CSE-ConnectionGUID: lJkeer62QUy03yCzOWtsoA==
X-CSE-MsgGUID: mGR6bnkYSxGod5cPk5Mdqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47515768"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="47515768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:31:20 -0700
X-CSE-ConnectionGUID: D5bEjmkNTHSv0JQpi2zF2g==
X-CSE-MsgGUID: qgxBRvGqQjucbOdMzLh+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="128298920"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2025 11:31:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvh9I-0001ad-1X;
	Fri, 21 Mar 2025 18:31:16 +0000
Date: Sat, 22 Mar 2025 02:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 24/26]
 drivers/platform/cznic/turris-signing-key.c:25:50: error: parameter name
 omitted
Message-ID: <202503220206.LHWsolYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Marek,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60
commit: ba8755ab541fc629948233125db870d4dbf00a75 [24/26] firmware: turris-mox-rwtm: Add support for ECDSA signatures with HW private key
config: arm-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220206.LHWsolYc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220206.LHWsolYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220206.LHWsolYc-lkp@intel.com/

Note: the soc/soc/drivers HEAD cf2ae5e5b68b06b4c8bceb42d46fa311e6db9a60 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/platform/cznic/turris-signing-key.c: In function 'turris_signing_key_instantiate':
>> drivers/platform/cznic/turris-signing-key.c:25:50: error: parameter name omitted
    static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
                                                     ^~~
   drivers/platform/cznic/turris-signing-key.c:25:64: error: parameter name omitted
    static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
                                                                   ^~~~~~~~~~~~~~~~~~~~~


vim +25 drivers/platform/cznic/turris-signing-key.c

0b28b7080ef5a32 Marek Behún 2025-02-04  24  
0b28b7080ef5a32 Marek Behún 2025-02-04 @25  static int turris_signing_key_instantiate(struct key *, struct key_preparsed_payload *)
0b28b7080ef5a32 Marek Behún 2025-02-04  26  {
0b28b7080ef5a32 Marek Behún 2025-02-04  27  	return 0;
0b28b7080ef5a32 Marek Behún 2025-02-04  28  }
0b28b7080ef5a32 Marek Behún 2025-02-04  29  

:::::: The code at line 25 was first introduced by commit
:::::: 0b28b7080ef5a323c3afa3860c3d45d627629830 platform: cznic: Add keyctl helpers for Turris platform

:::::: TO: Marek Behún <kabel@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
