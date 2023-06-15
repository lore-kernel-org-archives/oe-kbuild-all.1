Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1F03D75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686824100; x=1718360100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuqESTY7ZX0Pyb/b1bFjfjfBnLymskwsFaOcl6qdrww=;
  b=RtN1gmJqZubVd5IVB0pWmdvWllE/qcfbqiCQyKDcuGS4DhOwYpYn2Dx8
   LJ1Z33z6gpaxhNjvAdFBmooWXDJWEzRoe29KxIAgtskfVzlYSQvB+6cA/
   iqLperhmSmHd8bOcXrTbzngb7g9MnaSMNem0fTqg48tK4VZlvK9FRdoia
   NLDLyYoQW34KbC6bq5xp87rlEZkrUI4rEhxcsBIDaQF58ZWXHO00Q+gNW
   djZb6TSbrU/SYu2h0r8Urc740YxFxbbQgwErn/4Y5dLxSjOx5X9ZtJ8ZS
   P+qEG1N4GbnM6yCgAbkmo3Yj1Ett6OTzrIUEqW+xhTbk28yBvflVtmROu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387310811"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="387310811"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 03:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777604938"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="777604938"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 03:14:55 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9k0E-0001jr-2m;
	Thu, 15 Jun 2023 10:14:54 +0000
Date: Thu, 15 Jun 2023 18:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 12507/27777] htmldocs:
 Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
Message-ID: <202306151856.QOXv1epS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ionela,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: 7adeb94694a689cd20d41e1405e493a4b17a7289 [12507/27777] UPSTREAM: Documentation: arm64: document support for the AMU extension
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7adeb94694a689cd20d41e1405e493a4b17a7289
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151856.QOXv1epS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:250: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:256: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +26 Documentation/arm64/amu.rst

    23	
    24	Version 1 of the Activity Monitors architecture implements a counter group
    25	of four fixed and architecturally defined 64-bit event counters.
  > 26	  - CPU cycle counter: increments at the frequency of the CPU.
    27	  - Constant counter: increments at the fixed frequency of the system
    28	    clock.
    29	  - Instructions retired: increments with every architecturally executed
    30	    instruction.
    31	  - Memory stall cycles: counts instruction dispatch stall cycles caused by
    32	    misses in the last level cache within the clock domain.
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
