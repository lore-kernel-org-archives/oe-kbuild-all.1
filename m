Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1371F1317
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754679015; cv=none; b=nIk7/RfizyciL3vTQFWlRxgvZr9spqPgGtslE+UNhU21FlpgXlBNE3bHBylRjpS32vp4aHK+JIIsGIhMQUA4WjefcAmzXe2h1s4Oa+h9PNsklGrZXEULUsCddqYCMDdcQ8JS1JmKg7HnhdwiCpBHXAPRZ6SvpwLewVb/LJT8RgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754679015; c=relaxed/simple;
	bh=rYFqnBme3kyq/13psmm6rGX7uKkgIKRn0pMT08gWNEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ij0Jsk/pubOXZ1bNU6eVb0c5/zO1Pl0AFv4cMlEInbAsW1962m/DYB43AMbjlag7H1HFNz039ZO8ORnxS/5ja3pietoxO8CvZsCBUD9rFF2BRbHJm3crPGMHVeScIrp2zwEMyR0jA7PUV6Tg6JfZodpolR3F3s3bk1RViH3xTgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do1K+d1J; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do1K+d1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754679013; x=1786215013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYFqnBme3kyq/13psmm6rGX7uKkgIKRn0pMT08gWNEA=;
  b=Do1K+d1JobkhlUzoK9AmZmNJVuEW0M4DSkriW+4ghlbJTw9FzfnDsSNt
   HtHOblU4QoNyXVva8edD9IPykdfznEJy3Vz5S2pt88tDseUPx4hoKfoM3
   Fdd31JMQZD1Xy2/kfk/SMSsJimbvb5qKsUpK9EpM7WeVm0q4INv23FUx2
   Y40XAcXjhg24rGv9RUaOt4I9KYNkoFZKvjOkXUNinjzR5d5K/QpL9xKiY
   XDudpbJBmzI9qH+j8AcZuUNBUpVyIxT8nAqA+Rx1I+G7H7wbh4uSxaYQV
   JGT//idmKokmJxlVd+FbQiNDvnvGllHSQIXMc1wYfgCWg6rcIKsQ4Kn3U
   w==;
X-CSE-ConnectionGUID: s9d5nWzrTtK26RB/jWGBpA==
X-CSE-MsgGUID: +fb7LVmITEabYcs8NJqmUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67736492"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67736492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 11:50:12 -0700
X-CSE-ConnectionGUID: PUIbCiP6Q9Wc54ufJOhT2w==
X-CSE-MsgGUID: rCIBFs78T++1tpnzz/RXMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="170764879"
Received: from unknown (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 08 Aug 2025 11:50:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukSAK-0002fX-2j;
	Fri, 08 Aug 2025 18:50:08 +0000
Date: Fri, 8 Aug 2025 20:50:08 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1753/1753] mm/memcontrol.o: warning:
 objtool: missing symbol for section .text.unlikely
Message-ID: <202508082052.b36GXYCR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   748957057cef2d3b3e35d749c9a1ade66e2b5e73
commit: 3d8b38eb81cac81395f6a823f6bf401b327268e6 [1753/1753] mm, oom: introduce memory.oom.group
config: x86_64-buildonly-randconfig-2002-20250806 (https://download.01.org/0day-ci/archive/20250808/202508082052.b36GXYCR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508082052.b36GXYCR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508082052.b36GXYCR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:5751: warning: bad line:                | 0, otherwise.
>> mm/memcontrol.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
