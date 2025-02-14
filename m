Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DBC1519A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739516254; cv=none; b=N/IIKzfQ58X+e1BaQ4yG44ZA2h6L8n7aenStfWCDDBSAUUuSVZVRt4ieFiN26eIb4zTSpQB/zZIXnrFb7g6RrdBKUH7uN6LxnXSVHCKIW56fEefaI6WDsuKmaE+e7HpTQvCpAWY7GvqXrT0F6Wfqy3mLNgUdT4F06b84jsXFpPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739516254; c=relaxed/simple;
	bh=ZXG8tIPOzVmuASTfOthA6LFyHTyCEsQBcNgyjHbVe68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qCtq0BZfBAm9TNNyRbRgiebOotMWGi5eN9EGzRV6fVtnmKTT9F8x18sDp6qZbpnGQGpzwk1XzHqs5u+rP4S5AJc1ttHLe/jhw2JpGw4UNnxxtIACpoTQqeuubnBPB6Lo0xAf4p1KytFqQybxV2sLr76bdNIlZNEwef9Fncx9jjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFg3iLNJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFg3iLNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739516252; x=1771052252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXG8tIPOzVmuASTfOthA6LFyHTyCEsQBcNgyjHbVe68=;
  b=BFg3iLNJ7AYvdZxrdYfr+kNlzNMDHiF9Wq5CRQzAPpQTaGHPFTXhu3J+
   15T5Q9GHwIa83JdwcSBXciiAfB5FcS7ln38/svayvkHd0y+aPbFm3huf+
   frLxfY3a5Vz7x7fKIDzUJwrofVD88PtSHBdw0bO/9Mi4UT2Ahc1/DPoc8
   F0Ksau791rfECBuwh2ZQrJ0bCcIRz3UkrepL4Q6Ly3yT1gfcO90gLF5WG
   QyrZ4o4ZWvNndA5vHN85tsM4b7GEsRTaREjvKr9jUYGRi9Ujj/aeee+XD
   eKBSUDYof9BkriL4oxQZSqWov68jUD04l64Sx0qjggpQL4oH6mDEI1YYh
   g==;
X-CSE-ConnectionGUID: aFXcJIQJQNG4ozBRDayuvA==
X-CSE-MsgGUID: b4YL07JESyKDugj4HmQAIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40402854"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40402854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 22:57:31 -0800
X-CSE-ConnectionGUID: aRqv+IXvSwaS5JuIMtbdpQ==
X-CSE-MsgGUID: d5bSYhPWTCOEieQWBrVpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136600335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2025 22:57:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tipdf-0019B9-2U;
	Fri, 14 Feb 2025 06:57:27 +0000
Date: Fri, 14 Feb 2025 14:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>
Subject: [djiang:cxl/fwctl 21/25] ./usr/include/fwctl/cxl.h:35:45: error:
 field 'get_feat_in' has incomplete type
Message-ID: <202502141428.z07ZTHVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 4c96849fd2546afeaa7696d4d267d3889a211cf7 [21/25] cxl: Add support to handle user feature commands for get feature
config: i386-buildonly-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141428.z07ZTHVc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141428.z07ZTHVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141428.z07ZTHVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/fwctl/cxl.h:34:50: error: field 'get_sup_feats_in' has incomplete type
      34 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^~~~~~~~~~~~~~~~
>> ./usr/include/fwctl/cxl.h:35:45: error: field 'get_feat_in' has incomplete type
      35 |                 struct cxl_mbox_get_feat_in get_feat_in;
         |                                             ^~~~~~~~~~~
   ./usr/include/fwctl/cxl.h:52:51: error: field 'get_feats_out' has incomplete type
      52 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
