Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF03A290
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2/qh2C0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697051971; x=1728587971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7+BOOXwYdQT1h+w/HH/GHVggnJBlskSbVh7+rh4u9w=;
  b=P2/qh2C0rab/tZVFMXrcP7w8YzB6R4XKQ4g4Y9w0peb0u4ZHlNptNhpV
   ufu1xOmd26Up1PmRJkD5s7FizB3T0um8rIxc0H+eClJsN7Fxe0MI2LYfs
   8WGDXaxKewqpmogHAPBEoUq97IWIIlKOlDxQlBDDPCbLOFLCNAxavogpG
   BQUCeDhqxEmuuhyl47gxGOX3WbQER1NdoFMWo1uz78MfQ786SbfeqViSz
   Lh/E6WGebYdbl26oHseaeQBS1EcREn/BfQw7vidZC2ugNVQLCr+p83okD
   dFYbidK62rBrNitGWsom/jUxYZYfH2AMfmwQ7xgUzYVGNNwrBqNhus5Fx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381990562"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="381990562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730608590"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730608590"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Oct 2023 12:19:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqejv-0002cP-0S;
	Wed, 11 Oct 2023 19:19:27 +0000
Date: Thu, 12 Oct 2023 03:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:for-v6.7o 25/118] checkpatch: WARNING: Missing
 a blank line after declarations
Message-ID: <202310120114.Ns43rCgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.7o
head:   baa2891fd65597edb9c4bff2b6fd0ab23e80bfc9
commit: 0ab13674a9bd10514486cf1670d71dbd8afec421 [25/118] media: pci: mgb4: Added Digiteq Automotive MGB4 driver
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120114.Ns43rCgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120114.Ns43rCgf-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		u32 data;
+		s64 ts __aligned(8);

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#3369: FILE: drivers/media/pci/mgb4/mgb4_trigger.c:93:
+		s64 ts __aligned(8);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
