Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BE714F9E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+6S2MUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697413630; x=1728949630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FY7CztH3glyhvdH9hZQQEtY6sFRV5fIgreBmVjFdnlc=;
  b=k+6S2MUZMiPYKybmv/8/NbYCBEeY2lRePkygaL2bbyfTEaettOgTMsNj
   wUSSJbz5DIlH02SRX5lgnv3JEWgF+rlCX0fpmyl1TscrKkb6E0aybR8K7
   50Aba0VUadz1aoajwA66MyFwP5Jb0Kywxt+L+Ca5wohNcn5B100XoR+PO
   VVctiyytFvJ6Xce28k7snsNL1i7xE61qy3CZo/LkR4RfmqrrddGDwn1NX
   /m3rOZtsjd35wNoi5FhSyAsQM5TEBmSMDP+RujIYS8E7Zwy77brXzTtUn
   O15HGe4V8LaucFYrSVzntghsukNEBQ7YFzI4oLpWlYCkaPviVRa5aR3fj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4032471"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="4032471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790620970"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790620970"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 16:47:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAp3-0007vp-2u;
	Sun, 15 Oct 2023 23:47:01 +0000
Date: Mon, 16 Oct 2023 07:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3b 31/34] checkpatch: WARNING: Consider removing the
 code enclosed by this #if 0 and its #endif
Message-ID: <202310160707.ZqtuDl19-lkp@intel.com>
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
commit: d2b89bb4f5064e972108214c67944b2e3af2bfa9 [31/34] dyndbg: wire in __desc_*() functions
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160707.ZqtuDl19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160707.ZqtuDl19-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#40: FILE: lib/dynamic_debug.c:235:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#56: FILE: lib/dynamic_debug.c:248:
+#if 0

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#72: FILE: lib/dynamic_debug.c:261:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
