Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D10B14AB6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvpdU40a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697412269; x=1728948269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8429CJmmyz+/12NUQCoBDLKsDa+Jd12WgV10XHEF03k=;
  b=gvpdU40aZ/HUbDU8UK+wSBeoszNchZsm15QFHCbXanvFpYW7GLRDmv7k
   p3hXQSepVF5jr7wPhIGqBckhkOFLVrWS1/VVWupgtmrUTg7aWpHxRbcQn
   nNsafqtTDXS1EIHAJVrku8W2E02ObnO6SjYXxRw/cxVpKfGfC1NwXFind
   E/u6Jd7KcCPWSGwsr21MVPXb5hmwA8W4eaJNv1pNjcyLeKNRQcWnaH421
   V2tGOh6S6ZCfpsl0GOOd/rtk6x1iAK6Q+Z2/F60wH2LmIyLWSPtvJiy1z
   kANL5v23HSZw1zvTjiOu6KFxWGsCCBQnAk/sGOwiK5sXdLJQlPrjhk4fK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388285571"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388285571"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784889349"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784889349"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2023 16:24:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsATB-0007uT-0U;
	Sun, 15 Oct 2023 23:24:25 +0000
Date: Mon, 16 Oct 2023 07:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 25/34] checkpatch: ERROR: Macros with complex
 values should be enclosed in parentheses
Message-ID: <202310160720.TZTa0khL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-shrink-3b
head:   5abd981a4880b734bd589e9d30373f917a5abc89
commit: 8a4d56f15c0ef3e67ee63f833e63e840926fbf35 [25/34] dyndbg: prep to isolate 3 repetetive fields
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160720.TZTa0khL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160720.TZTa0khL-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#52: FILE: include/linux/dynamic_debug.h:67:
+#define desc_modname(d)		(d)->_modname

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#53: FILE: include/linux/dynamic_debug.h:68:
+#define desc_filename(d)	(d)->_filename

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#54: FILE: include/linux/dynamic_debug.h:69:
+#define desc_function(d)	(d)->_function

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
