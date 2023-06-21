Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B881C775
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 18:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687372286; x=1718908286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWJmo1LwE9Eq92i2q4mh/RHqL+lCfGZHYo1kdlkLUCo=;
  b=GuZsGHNsJ32gk6yToXe/WRMefre3dcyIlDkx6kMAZHCNlxAqWNhjJYwA
   qszmicmeTcJikS54ySUzcPXxttH3wATh9nVsDae28Nf/KuVI2iqfMjenD
   05vQIJVtT4psJtQqjAapxuqe7gbPr2BAXolgFlx46jhQBqF1V87+eMXBN
   yEJvT+RNgipAaaDi5MAOvyKriMWlv+L+sudYGDypfsWK3JLXIscHwfRMT
   pCWyt7KTMJXgU7pOiCqtRu939YlnXRjKZPI5iBXy0lxhSyIKBXTo9E8VV
   Qs6ZUh8DrDMDIAc70RYxCIdqDT3r2RIxN3lKQiNUBTCmv6mN0wVtffEZ8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359131867"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="359131867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 11:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="838723063"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="838723063"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 11:31:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC2br-00071P-0a;
	Wed, 21 Jun 2023 18:31:15 +0000
Date: Thu, 22 Jun 2023 02:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] Unsupported relocation type:
 R_X86_64_GOTPCREL (9)
Message-ID: <202306220239.x5Iacak1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   b0a9bcb910ac15c1c06982a7dba106bed5548c02
commit: b0a9bcb910ac15c1c06982a7dba106bed5548c02 [1/1] ANDROID: HID: Only utilise UHID provided exports if UHID is enabled
config: x86_64-randconfig-a015-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220239.x5Iacak1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220239.x5Iacak1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220239.x5Iacak1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Unsupported relocation type: R_X86_64_GOTPCREL (9)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
