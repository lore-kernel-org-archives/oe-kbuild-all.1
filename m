Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7776EA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maitWCRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697305147; x=1728841147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGssEhEVbBlCJ+gdbB5Bcz3McRw2orjSxuL/T7weYV8=;
  b=maitWCReBYboQNIXIm/lWIhNtUMGJfenJkP6lzwDBFy3CQUyABntWa0s
   pDIy0P8VDtE+5S2kYZt6htaDIxgmgS/7yWRaFaSk0n9jHUQnfyYImxhp8
   B+JTWZeXu4fQJP2FKhvzmoM6KBW5iADEccnbp7V4bXbwqKOei8eB9GYwm
   jwJZ50ekdMQQERuaPyT4N+ht0PSArdVBANRIyj7HRlrYzn/29ssrZ2U8Z
   BSkdUXv4x6k40nQ9/y58Rbc3P3puFyNgipZDYwyComPcGXupaBQlmXB65
   1uEGQ13JNZzVqGhH6noUvomIXazGUES+h0TyQMkmQdGC2luohRGOV+BVI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449529866"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449529866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 10:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871498691"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871498691"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 10:39:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qribP-0006SF-0l;
	Sat, 14 Oct 2023 17:39:03 +0000
Date: Sun, 15 Oct 2023 01:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/213 1/1] checkpatch: WARNING: Consider removing the
 code enclosed by this #if 0 and its #endif
Message-ID: <202310150114.FUzy32WG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/213
head:   5ffecb67c173b2e06118e1dede556fdcc392a9d4
commit: 5ffecb67c173b2e06118e1dede556fdcc392a9d4 [1/1] media: apple: isp: Support system sleep
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150114.FUzy32WG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150114.FUzy32WG-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#84: FILE: drivers/media/platform/apple/isp/isp-fw.c:280:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
