Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5719BDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 06:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715666786; cv=none; b=h549KL1fcfjrUHql6NHYIC6bNmD1VZ5kNCjD6LQ1dCPgfYmXcsb09+Zp3R7BGvyN2lw2v38T3dScHhNfRpSCf6/1z/SepbBpmynEW28qU75Mezhq42NmOsLSqnZOHlvuj5T9gsQYFwrOzW5QGVK+QQshXZNORa8M14rk5SNb9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715666786; c=relaxed/simple;
	bh=B2jEE5MRBGN4vduItJzzI9py6MSTJTQagyqpFawX0RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAMHekT2O1lwt/88aoQbmT7crFLazykfwf1Ku44F/1DnzXmQYdRLWnax+IBSgH2U+fq4HrR71MNL9Prjeh0k3dKi5EMZuZMl5KDVekNfqPiJ8PljaKJ30I8qg1LrDLZGGrotC80zEGVgnqaOeq4MlL5eCEWTf67/OVVC6XJ+YWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/AkbAyY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/AkbAyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715666785; x=1747202785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2jEE5MRBGN4vduItJzzI9py6MSTJTQagyqpFawX0RQ=;
  b=Q/AkbAyYjcnYrd4Y8q5Q7J9N2iTNJUMZBQEYwjGY+FpJcwDOjcuqHgLY
   J9qDjXsCd2Ew6z40vxK4P0KdpIZxx6hquEVgPQ15SwpwhhXuvyKAq3V8x
   wMSloxrqVDzwWHeVdwfkDHoPa5gSzYPImZqTFCd+Ke1qAa4graAnJf1+6
   M8hXIPcRCCT+0eYhEXyvFYsjKLwKaPAIGmWyFaBsF3poQm1+MBfsgcMBV
   jMgAG7ilkdkYrx75yu9uMLhP26AB0EDhsey9EfmyBkhk4AnvRw8jKo7pf
   IUHmbcLBPdLVTPq/yCjniulpOL9y/chZk1i3x0u69J9/Klof2lAI2BYkL
   A==;
X-CSE-ConnectionGUID: cJC81RwZSdK77PDVwGYJ1A==
X-CSE-MsgGUID: mXHt7wA1Syi+eDmwxrLFyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22229655"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22229655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 23:06:24 -0700
X-CSE-ConnectionGUID: 72ZkUZ9jREO1b5P0fnnomg==
X-CSE-MsgGUID: n0TGnlXqR0O0WKonONXbPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35268822"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2024 23:06:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6lIq-000BBM-02;
	Tue, 14 May 2024 06:06:20 +0000
Date: Tue, 14 May 2024 14:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 8353/12793]
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o: warning:
 objtool: map_partition_power_domain_id() falls through to next function
 get_instance()
Message-ID: <202405141321.RQmskiTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: 9d1d36268f3d8276aefd1fad4e0a415dc8c36edd [8353/12793] platform/x86: ISST: Support partitioned systems
config: x86_64-randconfig-101-20240514 (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmskiTj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmskiTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141321.RQmskiTj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o: warning: objtool: map_partition_power_domain_id() falls through to next function get_instance()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
