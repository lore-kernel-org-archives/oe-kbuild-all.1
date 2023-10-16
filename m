Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E76163
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TABDXoee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697414892; x=1728950892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76QBZaCIPV3B9uuciFn7H4x+E1P5u1ZPDvp199j5cS4=;
  b=TABDXoeebB447tUOC0g0mtr1WuUSmy+uluQoqJzdhTxwdY2fw2rDrlBN
   f7Vij+QYQhmhTi7yojVxAiSPsUnab2cZF6uJjJb7XtGFJ6z0Gy9qsS2Ye
   zkKLCLMKCHkPMqArgZiM/roF9K5ZPlrrAWCU7b8KVbdYGFgjzlCZwBHic
   p+5A2kQB+C68/mreJi1ZzJU0U5H2TdAucLZJYk4bs+i8DGXztriRj/Pz0
   vtJ57rYy8O/b6XwEuMuCjrA/Y8K4O+wQwwHMXcvEHieaaIcPGOuNAiEXq
   sPka2ARLurZviTKlaqMFUjQDXUcFvpeoXZreQC584Gx3w0wTTHKDLuGh0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416489463"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="416489463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790623989"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="790623989"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 17:08:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsB9S-0007wd-1v;
	Mon, 16 Oct 2023 00:08:07 +0000
Date: Mon, 16 Oct 2023 08:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 34/34] checkpatch: ERROR: "(foo*)" should be
 "(foo *)"
Message-ID: <202310160829.WJi8KiqS-lkp@intel.com>
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
commit: 5abd981a4880b734bd589e9d30373f917a5abc89 [34/34] dyndbg: cache the dynamically generated prefixes per callsite
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160829.WJi8KiqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160829.WJi8KiqS-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#74: FILE: lib/dynamic_debug.c:868:
+		prefix = (char*) mtree_load(&pr_prefixes, (unsigned long)desc);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#91: FILE: lib/dynamic_debug.c:887:
+	mtree_store(&pr_prefixes, (unsigned long)desc, (void*)cpy, GFP_KERNEL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
