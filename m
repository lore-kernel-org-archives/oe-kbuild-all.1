Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB9249F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewBfM73C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697152299; x=1728688299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GquWiZPGPQECdXXaLpW5xHiCfYqYw4Wy3Mhhm56S1LE=;
  b=ewBfM73CNU8wnTXaznUduLQy6wd/uWDUGqCybASWxlsvrxRqB/l5rgGB
   gGVBRuyOQQinjhfRf1XJSIZylhIaZM33KBnixnZi78d5L+nWWi914fdoa
   eM4YPbC2N5+hTJl8Tf9XN3BNCcOrBi8sj47Eey0aHFVWLyAuLT6hZ+eHY
   +bGpGT8PV2q+d1gEPOkQa9BsXHMZqwAywEUCjFR2NcY4p0tk8a8Yfz/X3
   pfBVAdhyAO+tVNFjQGLtWqniydMZnsVeCbrKrkGr486mpdrRLrR42kkXi
   J4ltUi1ZGQ7CppEO5MvSd1OfiMUg/ufQ+VTuIzBdAgN4wR2RtvqcH9LN3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382288625"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382288625"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758240760"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758240760"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 16:11:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr4q4-00040j-0G;
	Thu, 12 Oct 2023 23:11:32 +0000
Date: Fri, 13 Oct 2023 07:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: vmlinux.o: warning: objtool: sja1105_fast_age() falls through to
 next function sja1105_mgmt_xmit.constprop.0.isra.0.cold()
Message-ID: <202310130710.e8aldrhL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8c127b0576660da9195504fe8393fe9da3de9ce
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   9 months ago
config: x86_64-randconfig-004-20231013 (https://download.01.org/0day-ci/archive/20231013/202310130710.e8aldrhL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130710.e8aldrhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130710.e8aldrhL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_mgmt_xmit.constprop.0.isra.0.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
