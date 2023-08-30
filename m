Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E51377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693369029; x=1724905029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXLGUa85AiW2PdpfJP4uNVuQjgMfN4WgWolB5Y822Xc=;
  b=j74eFcyquEVpMbj4/+Av4B+mUVz0sXSk0BxnOxUskTbbPmGyk14SELYt
   s1eBjOJ3Glt9L5pctzRmxhawCOpwhMzRuJAVviQyRjwG0PcxAZfUMCkCy
   MJRbFmZrA29k+D/lHAGrnz5AzRWABVtKjS9/ZGZRxOTTkofbwCGrcpo9t
   NtedFd0KViIgX6KW0MoasO3ZUw5kS4YxKObY6i8tJwary0wPyw8FcjrxW
   BBcLZMslm6SyDAcWo34ZtZ1zVMV6eyxvxlamT8nPnR029a8fTaNbMi9hv
   gqrWacFCbB5QR+Y2W07XvqcbZ6FOPyV8y2s8880qH2RnJalnrFmCZ8b+N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374447867"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="374447867"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="829073707"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="829073707"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 21:17:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCdZ-0009Pn-0z;
	Wed, 30 Aug 2023 04:17:05 +0000
Date: Wed, 30 Aug 2023 12:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-audit@redhat.com
Subject: [pcmoore-audit:main 1/1] README.orig: warning: ignored by one of the
 .gitignore files
Message-ID: <202308301248.hEwyeVEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git main
head:   94e5ef9b157c6c3779352a8d4121542f71de52a1
commit: 94e5ef9b157c6c3779352a8d4121542f71de52a1 [1/1] audit: add a Linux Audit specific README.md and SECURITY.md
config: parisc-randconfig-r012-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301248.hEwyeVEl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301248.hEwyeVEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301248.hEwyeVEl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> README.orig: warning: ignored by one of the .gitignore files
   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
