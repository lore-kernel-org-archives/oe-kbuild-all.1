Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6068837
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 02:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741918522; cv=none; b=rHtHx7oDK8hX6qv6DNsnC60/q6f3G/XrgDzxjDc5BOe2n62WN0OcjWuN38T6gnAw4up+6M4HEoKASaAolDKenZyI4m7TS3azuA2oM7VLBAUEm4pA2eDQ5TmuvTTgLeTaqT4FiXsO5VwOs/X961cGKKTsl2ohCqbg7q37GQRT1Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741918522; c=relaxed/simple;
	bh=GlsIwOkQlefW4NmPsWDwLLZXm6eTTIu9gB/+Oo29K/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbUC8Nt/HWcWj42Bmjq1kvzuL6HjHbRcWbUKHe7rMnK2mY0bPMtZm86hfFmzIdFGIoeoDq/PgW5ZvIekP1CTL0Mx0NtaV+QV6Ts9YqG/PK9aNmCBc0UnzL3tOisqaco19/YTLlECvuq9+6RRS37Vsji3GigihmsLZdUU8wQJ0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bL66rh5l; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bL66rh5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741918520; x=1773454520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlsIwOkQlefW4NmPsWDwLLZXm6eTTIu9gB/+Oo29K/I=;
  b=bL66rh5lJ0Q1+w3TiWqK1jREYBuyqUZEVO7GVTnpjs793jko46DvFNXy
   zppjHBgYaaxnxaABerEekLSTgar/PZY4LW2YTBwoETsRfTEVEr05JDMEd
   7PM/0NpjDMTV8w/yGHsI7EZALJmGAnm6vlfDtZvFoCqP99alMWxVxrQUm
   jyjBVlCwUAIGHhUagWi6UwZY7gVwAz8JwLoIoTtVpxeAnpVuZztRRZ93y
   sThw9xYjy50W9Q1R2tw2bfaNyNzWSK1C5tS+2p+uTHr9pWHWSFx7wlViU
   zEz2V/UxSpGbhnk7VNE3Hdmqyr0CkmKb4JZxc9wYk798WCox7yHjW0zbe
   w==;
X-CSE-ConnectionGUID: XmvBsJfcT32wg8jXT9w3zA==
X-CSE-MsgGUID: xsUeFrEpTDC61FwUE2T5uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46850665"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="46850665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 19:15:20 -0700
X-CSE-ConnectionGUID: OPIEFe1SSKOgFGOkJ4uRgQ==
X-CSE-MsgGUID: gfoTB6qBRzSg0LN4FWeYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126321868"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2025 19:15:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsuZx-000A4y-04;
	Fri, 14 Mar 2025 02:15:17 +0000
Date: Fri, 14 Mar 2025 10:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 6/155] util.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202503141027.qth9Pwkt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   1bce9e8f555efddfc701efbcb50af1c0728587bc
commit: 9c18ea7ffee090b47afaa7dc41903fb1b436d7bd [6/155] bcachefs: bch2_get_random_u64_below()
config: arm-randconfig-002-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141027.qth9Pwkt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141027.qth9Pwkt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141027.qth9Pwkt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/bcachefs/util.o: in function `bch2_get_random_u64_below':
>> util.c:(.text+0xe2c): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
