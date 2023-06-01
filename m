Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9DF1854
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 02:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685585931; x=1717121931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJJUFKG9Ao6rJNL0LHygzMdUesF8PSdZU7uNcDq4vag=;
  b=ibdzvznU9BDszMVEeVsKxGRaleUU2gKW6A46tKQ4LKKvkpcI8OoTLJXh
   L+kuI2AX25grVDB7Ysn5jJJZ7wBsAKiBgpkBZ+CuiVoj1okj6t6B/usgE
   xNf+E0rmKMTYpGQ2YThrX2zKFwT/HSmbgU+9asU4etlE9Z456+7wthyK4
   b6ny8b3OVq7VQD4l7mxixGWXYp4DC3KjQLSAcRkH/4LhpXyJ28yajkOGj
   uOEOFHsN5jpdgLl29sa2Dl49H3yotZ3JRtrvOtAGyENM5RyqgcouLwvxT
   Gp8b1TF8T4TaVzwGt0xYapG9GhnBQpzrmh+Sz9qp34OcxYRRK6SJBldsJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344952915"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="344952915"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 19:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="831409190"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="831409190"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 May 2023 19:18:49 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Xto-0001n1-2N;
	Thu, 01 Jun 2023 02:18:48 +0000
Date: Thu, 1 Jun 2023 10:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2023-06 2196/23265]
 drivers/staging/android/debug_kinfo.c:164:34: warning:
 'debug_kinfo_of_match' defined but not used
Message-ID: <202306011043.ht1mvcRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15-2023-06
head:   397665b3edde04b889bf8d24cde0b85cc8914342
commit: 1a9c7b3e3bdd87a10205891806a0d880fe27230c [2196/23265] ANDROID: staging: add debug-kinfo driver
config: x86_64-randconfig-r033-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011043.ht1mvcRb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15-2023-06
        git checkout 1a9c7b3e3bdd87a10205891806a0d880fe27230c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/staging/android/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011043.ht1mvcRb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/android/debug_kinfo.c:164:34: warning: 'debug_kinfo_of_match' defined but not used [-Wunused-const-variable=]
     164 | static const struct of_device_id debug_kinfo_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/debug_kinfo_of_match +164 drivers/staging/android/debug_kinfo.c

   163	
 > 164	static const struct of_device_id debug_kinfo_of_match[] = {
   165		{ .compatible	= "google,debug-kinfo" },
   166		{},
   167	};
   168	MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
