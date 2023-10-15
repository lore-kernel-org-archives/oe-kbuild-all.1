Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB3110A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdyEqCH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697338341; x=1728874341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7pTiSVIT0Y6sCVvh/i1icfKyGaUEo0jXQf61KnsPCFA=;
  b=SdyEqCH1lBsYUjdHV5BTE73fg5QSMUL5dulDWzAAavobMGCu5p8Xm8Sf
   LWQUB2H+H37VAwHIjVl8l5MfuFygkyIhhRv1JGnZvEPDxCpA9i27jKvCD
   Vdev3zfI7zBBZe5b8xjP5oSwzBq3iM2LJ8bycXS4VxJBe88xzAAMahw8y
   HnKkRnATWB5lSSdt7m+aX4puJsEyl5vWfDPK3Rci+YSalh4FRmlNwnvkE
   rn1nmNEkUAZ4zzQUtl70bY+Mv7vrroyAckNKHUIcCmyF109MOjHXG0oyW
   Okun0lNDwrSTSSOuFDNTzfo/xH/VmTsUi/LwM4SWk7zBKAs6iQ245HUeY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6925453"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6925453"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790353026"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790353026"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2023 19:52:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrEn-0006xD-13;
	Sun, 15 Oct 2023 02:52:17 +0000
Date: Sun, 15 Oct 2023 10:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 80/102] checkpatch: ERROR: spaces
 required around that '=' (ctx:VxW)
Message-ID: <202310151057.7c0G1nKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   8f794ba7e970f5144ad374c5b40f7ce015a03563
commit: b4449cc3e9036fcb1fbd056feb63cc4c2d440e54 [80/102] resctrl2: arch/x86/rdt_mbm_local_bytes: Add module for local bandwidth
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151057.7c0G1nKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151057.7c0G1nKI-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that '=' (ctx:VxW)
#86: FILE: fs/resctrl2/arch/x86/rdt_mbm_local_bytes.c:34:
+	.mon_domain_file= "mbm_local_bytes",
 	                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
