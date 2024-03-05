Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2829429
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 03:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709608537; cv=none; b=Rt8j+Wrqvx6F2OIwwEIu65WKz6lfsk7I1ZLevhU4WUvUKiDwhPNQPltLG64CP2tazxzP8V7StC6Uu/Q/s4Z6z19hbhT/A6jzP3qVpSK3LD47W9Xg7flB2e8IPL0ZKddEAgjuBFHRGfl9lfgztRSThn2NYGmCSGQGX9ZR2W9Ecd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709608537; c=relaxed/simple;
	bh=0jYtQUiAZIH7LFGNXKxGVhZhRclBwxltxpbnW5vHsyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulVQolhjWSrIvKtXP8isqPm/yDzK/ohIdWJiz5QBOWL5siL+Fo0HhgqHvkzyzVI1Dcz0bmzfG718vETpe6VSqKnVujetm2QUscJOWdSJj5syDd2p7PeB/1oasKK2Y39TRdV6sGvy7qe/s8u+jH6vQz01zrs+o/G0D/ciaITF7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgJAs4w2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgJAs4w2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709608536; x=1741144536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0jYtQUiAZIH7LFGNXKxGVhZhRclBwxltxpbnW5vHsyw=;
  b=jgJAs4w2UydsSQcFdypfaswHfOItFbBLEMKr2plSNi6NzNipnHDrUA2C
   VQz4M594h8fNx1uNO5L7idkpeu6JjVpIW8egt9pilwjhErEUiphfD2bUP
   F7ObZivyNJhBoi8SmK+Tv5wB958iMp8ZxgwJU5haAHdaOMX6Hv1Ea3ZNs
   fJ8ITmJfIlkyPCGbqO+DZM/TNMri7tY8wnmF/UKnPNh0aa3JARTlCCdCZ
   PA+ESxSMKYmzpSPjJrsHUTBQG1AYQfa1N48C0V49fKQOntiwa02Y/T+qr
   9obglgNB7gz3hqY372rmuAVt+LqpYr4IGOzCM+9VQf9WUQ1OYEbEFXDen
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14780338"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14780338"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 19:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9289050"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2024 19:15:29 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhLH5-0002yz-0p;
	Tue, 05 Mar 2024 03:15:27 +0000
Date: Tue, 5 Mar 2024 11:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/mm/numa.c:925:5: warning: no previous prototype for
 'memory_add_physaddr_to_nid'
Message-ID: <202403051100.7d3q6TbN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 174b9d89c2606874f5d7a8cfa3f5e0e818347a4d x86/sgx: Add a basic NUMA allocation scheme to sgx_alloc_epc_page()
date:   7 months ago
config: x86_64-randconfig-074-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051100.7d3q6TbN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051100.7d3q6TbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051100.7d3q6TbN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/numa.c:925:5: warning: no previous prototype for 'memory_add_physaddr_to_nid' [-Wmissing-prototypes]
     925 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memory_add_physaddr_to_nid +925 arch/x86/mm/numa.c

94096826d288b1 Dan Williams 2020-02-16  924  
94096826d288b1 Dan Williams 2020-02-16 @925  int memory_add_physaddr_to_nid(u64 start)

:::::: The code at line 925 was first introduced by commit
:::::: 94096826d288b14067cb655fc196aa3bf01b8439 x86/NUMA: Provide a range-to-target_node lookup facility

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Zhiquan Li <zhiquan1.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
