Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A235D14F74
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpowGdGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697412895; x=1728948895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MLLALCC8nNQDBiwP5+sarFAoagbGOJtCNYf2T/JWneE=;
  b=ZpowGdGhe8ihEA6bk2g4CLcl7NLUM73Ha3lAjzaf52Nk6gvPtLh+hGsE
   5mPq+1/JCF7W6SPLJjBVOQjQ6043fH2cf1Oa8AI35WbHx3horISlW6XPx
   LMEX1cyd2hSPDBMKUBxu8wOR/CPcreUF6bO1YUq1XEgIZ4gEqYdzdYUsh
   ICPmyNosBp97tjoNo51iKVEgTVX7NfKZZNWNPrvKBJAntxbbCFGikQpqO
   oT2llwLDJMvOLenK5A7R1vCg437wOBOzOWk5nIn7iAS7LRAFSVi8tzNNx
   lsv/ed59aC+qiLrJZpKsVG5dL9wkrZBQazr4zERXAoRoYrJCtBrCd+NkE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364783085"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364783085"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086876202"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086876202"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2023 16:34:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAdF-0007vR-1p;
	Sun, 15 Oct 2023 23:34:50 +0000
Date: Mon, 16 Oct 2023 07:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 28/34] checkpatch: ERROR: "foo * bar" should be
 "foo *bar"
Message-ID: <202310160754.3FsSROmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3b
head:   5abd981a4880b734bd589e9d30373f917a5abc89
commit: 2de36fe6706d84b424011a44e5a7867d16cefcb2 [28/34] dyndbg: save _ddebug_site mod,file,func fields into maple-trees
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160754.3FsSROmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160754.3FsSROmH-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#202: FILE: lib/dynamic_debug.c:227:
+static const char * __desc_function(struct _ddebug const *dp)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#210: FILE: lib/dynamic_debug.c:235:
+		       (unsigned long)dp, (char*)ret, desc_function(dp));

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#215: FILE: lib/dynamic_debug.c:240:
+static const char * __desc_filename(struct _ddebug const *dp)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#223: FILE: lib/dynamic_debug.c:248:
+		       (unsigned long)dp, (char*)ret, desc_filename(dp));

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#228: FILE: lib/dynamic_debug.c:253:
+static const char * __desc_modname(struct _ddebug const *dp)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#236: FILE: lib/dynamic_debug.c:261:
+		       (unsigned long)dp, (char*)ret, desc_modname(dp));

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#255: FILE: lib/dynamic_debug.c:1390:
+	void * ent;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#259: FILE: lib/dynamic_debug.c:1394:
+		v3pr_info("  %d: %lx %s\n", ct, idx, (char*)ent);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#274: FILE: lib/dynamic_debug.c:1409:
+	rc = mtree_insert_range(mt, first, last, (void*)name, GFP_KERNEL);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#280: FILE: lib/dynamic_debug.c:1415:
+	val = (char*) mtree_load(mt, first);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
