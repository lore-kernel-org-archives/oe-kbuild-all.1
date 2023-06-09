Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D217AC4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686321499; x=1717857499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JxN41YmOvz1aTKi1zoNRMCaLoSGLxWGo/QPcsgK0qo=;
  b=BgNThvEgqPNkLJcP7cFjgquUS6RC8SpC6hGsQI3ORtHR4qch6HRUv3yj
   doTQpKMTYJoxT5eGANKAHMIDWWrItvvSlIbAz3KnyomnvJGa9U1A+KdM1
   IdoLpxN4cqHRUj1c3cOjAi3GsNSwErGaMdc1++ojfIK7VY2K+igsbv4F4
   DgMibAWx2VWcCVDqWNITQenDlv0V9V/FvmiJA9sPsyWEOC/rhk2krIc9J
   uIyNhlpQAD+ot/V1Ybg1fohsbywoq7pj/qBvyxbZngPwwTlA0mfOgUz5a
   VN5Zfwm9ONG3V9977Q5GlwKNNpVqUXBcGgJI7gH4sOxiiUnOJV1YfLuI1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347256707"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="347256707"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854762266"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="854762266"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 07:38:18 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7dFp-00096F-17;
	Fri, 09 Jun 2023 14:38:17 +0000
Date: Fri, 9 Jun 2023 22:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/9]
 arch/x86/kernel/kvm.c:238:2-7: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202306092258.Z8Z1dwI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   68923c644aa6f593a9d5f1b2d6287880a5f2ae91
commit: 6ddf8dd5733cde12d1e4648061a5970cfda76565 [4/9] CHROMIUM: kvm: Don't call vir_suspend_time function without config
config: x86_64-randconfig-c002-20230608 (https://download.01.org/0day-ci/archive/20230609/202306092258.Z8Z1dwI3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306092258.Z8Z1dwI3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/kvm.c:238:2-7: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
