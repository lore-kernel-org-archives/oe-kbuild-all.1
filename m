Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2738125B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN/PVg+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697301369; x=1728837369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDfzxz3ZjiFmKgBXH8b6wgY/zuMFl9Ci5ORWELcNR8U=;
  b=BN/PVg+hBt68lP8t/fthapTNVrfDTUC6uZRaGLfTHWyM62JQcT7zUKVR
   HTH4nN4c0M69CQlHM0gSmjbBv1ZsuHnZ/Tx4BjqTIhgLLkLnkLPqp3Nli
   G4ZXrVmajqT4clh8E0j656MLjw0h7IKWcOEpdo7N3lFOqNWIZQ3xQ/jLv
   u7/TY/DYRBakwNle16nF19OfqxOqpcFUJSvNiHBU4dTyU/fAXxLBUCsSR
   ArFdFIZAPjKkV/ujf9dOCpQ3IX+oIn6g1bm7phAxUiE4puzQT0FrJDp1X
   uMJXDDRLdQl0f8nAXbt3mWXB08lYz0l09tmnaz8Ownw+Alc67Z5pwhaFr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385174733"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385174733"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086515011"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1086515011"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Oct 2023 09:36:08 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhcS-0006OB-2n;
	Sat, 14 Oct 2023 16:36:05 +0000
Date: Sun, 15 Oct 2023 00:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 1/3] checkpatch: ERROR: space required
 after that ',' (ctx:VxV)
Message-ID: <202310150029.DTG0zRBu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/christoph/linux.git largepageprotect
head:   8216937c02e2cc14d3005e5cff6c15bb72672ce7
commit: d20f49ea794687e91b762f3786256c90497ee523 [1/3] Add sysfs support to view current page sizes available in sysfs
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150029.DTG0zRBu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150029.DTG0zRBu-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#172: FILE: mm/vmstat.c:1674:
+	int i,j;
 	     ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#184: FILE: mm/vmstat.c:1686:
+		struct zone *z = &NODE_DATA(nid)->node_zones[i];
+		if (managed_zone(z)) {

WARNING:LINE_SPACING: Missing a blank line after declarations
#186: FILE: mm/vmstat.c:1688:
+			unsigned long f = z->free_area[order].nr_free;
+			free += f;

WARNING:LINE_SPACING: Missing a blank line after declarations
#197: FILE: mm/vmstat.c:1699:
+			struct zone *z = &NODE_DATA(nid)->node_zones[j];
+			if (managed_zone(z)) {

ERROR:SPACING: space required after that ',' (ctx:VxV)
#209: FILE: mm/vmstat.c:1711:
+	return sprintf(buf,"%lu (%s) (%s)\n", free, zones, mig);
 	                  ^

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 24)
#274: FILE: mm/vmstat.c:1776:
+	for (order = 0; order < MAX_ORDER; order++) {
+			int r;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
