Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77B01862B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oojtlid3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302013; x=1728838013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bo3J6zCK+P/MTSXKFpM9n/5nlVIq7FVfHPy4Ii6DMKI=;
  b=Oojtlid3InXxNfOjk7NMwZUkeSQ5EH+OcGNKrQpZYl+z9ZAQGLJb1dlo
   A2L5d/N1/NxlroRQ5jMdFoB88IL30gyDhcEG5TaAqtndBR8thK+rQuIBU
   IVgiVF8sLUWnUVxSWgD2vJEsoF7a0yqCZJ8fHhVUMF6S4LVi1fOObxYit
   HXmcW02MfB5t77UxLXOKfVcag1BvGcG6G74T3CL+6Y+v8notvEBO2Oy8E
   Hp+fOyP911NNOvN8czbLNZEJczTTeXLjlU4kgz5S4LEe+TaHecVGvrJMl
   Sqop8o/fIEJkyCudhEhxgzzVzTEBSpEB23V6Txf1iX85RtyKrb/77t6aT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364698881"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364698881"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784513401"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784513401"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 09:46:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhmn-0006P5-2k;
	Sat, 14 Oct 2023 16:46:45 +0000
Date: Sun, 15 Oct 2023 00:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 2/3] checkpatch: WARNING: Prefer
 'unsigned int' to bare use of 'unsigned'
Message-ID: <202310150033.HD06UJQi-lkp@intel.com>
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
commit: 047042554ce511a29790b43bfbba9e2e64de7277 [2/3] Add ability to reserve a number of pages per size
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150033.HD06UJQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150033.HD06UJQi-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#25: FILE: include/linux/gfp.h:330:
+int set_page_order_min(int node, int order, unsigned min);

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#53: FILE: mm/page_alloc.c:5062:
+int set_page_order_min(int node, int order, unsigned min)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#59: FILE: mm/page_alloc.c:5068:
+	unsigned remaining;

WARNING:LINE_SPACING: Missing a blank line after declarations
#67: FILE: mm/page_alloc.c:5076:
+		struct zone *z = &NODE_DATA(node)->node_zones[i];
+		if (managed_zone(z)) {

WARNING:LINE_SPACING: Missing a blank line after declarations
#84: FILE: mm/page_alloc.c:5093:
+		struct zone *z = &NODE_DATA(node)->node_zones[i];
+		if (managed_zone(z)) {

WARNING:LINE_SPACING: Missing a blank line after declarations
#207: FILE: mm/page_alloc.c:5356:
+	unsigned int order, t;
+	for_each_migratetype_order(order, t) {

WARNING:LINE_SPACING: Missing a blank line after declarations
#252: FILE: mm/vmstat.c:1730:
+		struct zone *z = &NODE_DATA(nid)->node_zones[i];
+		if (managed_zone(z)) {

WARNING:LINE_SPACING: Missing a blank line after declarations
#254: FILE: mm/vmstat.c:1732:
+			unsigned long f = z->free_area[order].min;
+			free += f;

ERROR:SPACING: space required after that ',' (ctx:VxV)
#260: FILE: mm/vmstat.c:1738:
+	return sprintf(buf,"%lu (%s)\n", free, zones);
 	                  ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
