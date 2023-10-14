Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49156125B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At3WZtIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302011; x=1728838011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S9xWBPDz+d/AwFv+3PsJbsbumOPfx+ha2wMYDdDeCeI=;
  b=At3WZtIOLDYT66WK176QWfX/DMJaXo3g8+hxYvosRyLE2YZ/QHZvybHy
   CYJAYg3R7CBIxhtCLHDLZcULGRTJbbIc03HDisSHX2P91K5nFXji/4DdO
   yE1q3HdKsVhEK/hH9ynJbxcgkTV8ZNwLoqOSJvcJAvGCX8k7nl6TicEch
   erpeppV0XUFfkNEWxY3MfHt9XITh0LfDbl/J1bS2of9EKw3M/MVPPK4cA
   wFy2en9HXu1+hkzHJpmadxcuHBI27luoIEki9+iE1HdrKtZ7+JyunqTk1
   9cQlETYYyljQOT9IMkOnWqguA9jtnaiKhUlh9UYtBHpKIIyFXpBCYej5I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364698880"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="364698880"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784513400"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784513400"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 09:46:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhmn-0006P1-2T;
	Sat, 14 Oct 2023 16:46:45 +0000
Date: Sun, 15 Oct 2023 00:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 3/3] checkpatch: WARNING: suspect code
 indent for conditional statements (16, 16)
Message-ID: <202310150039.oCZWolpe-lkp@intel.com>
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
commit: 8216937c02e2cc14d3005e5cff6c15bb72672ce7 [3/3] Updates watermarks calculation for page reservations
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150039.oCZWolpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150039.oCZWolpe-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 16)
#36: FILE: mm/page_alloc.c:5816:
+		if (is_highmem(zone)) {
[...]
+		for (order = 0; order < MAX_ORDER; order++)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
