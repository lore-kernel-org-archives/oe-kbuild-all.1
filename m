Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7041A9C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Na7cVWzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697541656; x=1729077656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MA6w0A3pCFzj1T62b7kVH+Hsarm6twjhAXjpj/8mVu0=;
  b=Na7cVWzRwp+eSnkzxQUZQ3Enx+SSX3CMB7d13lRQnDp3ciAgzOA+1n5W
   1Q0PyOmRcDYoh36QQueu+Lptwrq4BuFRnRzLa13l/bMzMqQNfPN2KVA3d
   CQWp6Cqp2QzijhQQx29u/nRmt1XXDhBaN3yDgCyYHEBP7nhLZycaPU9Yl
   HYl4Y1GmCb+bJPq1EwX8vzZPKsuQOcr2Nn74/XsoUHkl+/L4Vt/NX9tzs
   AkHCnbSC663ssrgyx5BNFRZ5Rz1pTRHeflHFoKotPStHm/A/72H2mFYhD
   JQR6VqPGJvNuq7kC2l5Fyn6RwjBR4Otr0PNVwgRhbLN2qYZPNdiO/YJL7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7315890"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="7315890"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087474310"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087474310"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2023 04:20:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsi7y-0009Vj-2X;
	Tue, 17 Oct 2023 11:20:46 +0000
Date: Tue, 17 Oct 2023 19:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:extron 25/183] checkpatch: WARNING: Missing a
 blank line after declarations
Message-ID: <202310171943.k9Wu37GS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   9cb1cb3ffe4f4d29073ccb03f33323cf9c1afd2f
commit: 0ab13674a9bd10514486cf1670d71dbd8afec421 [25/183] media: pci: mgb4: Added Digiteq Automotive MGB4 driver
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171943.k9Wu37GS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171943.k9Wu37GS-lkp@intel.com/

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
