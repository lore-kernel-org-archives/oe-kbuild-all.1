Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173281369
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 01:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ0qbarI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703813154; x=1735349154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DgDVTyO39BLTv8TpFjbb+indRrTyJ5iXRnoAvzE8c0M=;
  b=EQ0qbarIEkKKffiVuQgTAItJPWvpIwvh2KurhvY1RxQF8fzev7Pa5+n9
   zXwWDFqkWu8BBWw6BBIyLRCSdWVZML4/JulPJuTdtMBv0SQ1tD+tIDxTq
   GpXgZgLa3GKbuwY2odkdCkcRftd6q58UeQ1b/wESgRgglDGPV6WjcnsKT
   uHV8I8ycO7nfJLyDIFeJ88sKwxmpP5J9VtV9OGVApiIfV57tsJoySBbrb
   L36HfPuJRb0genUlcR4r7Pd0B/RiPuBX9cDQoBc7CmwPczDZzmhMEmMEN
   SceULyK4NYIiGFj4o2ml7md+SyLaXirGhgb4Wvow2phXendKL5a/BpUPb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="482789980"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="482789980"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 17:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="771842183"
X-IronPort-AV: E=Sophos;i="6.04,313,1695711600"; 
   d="scan'208";a="771842183"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 28 Dec 2023 17:25:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJ1dA-000Gyj-2h;
	Fri, 29 Dec 2023 01:25:44 +0000
Date: Fri, 29 Dec 2023 09:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kleist:ipu4-dev 36/59]
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:17:19: warning: unused variable
 'send_msg_types'
Message-ID: <202312290913.BjTjtYnZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: d6af6bedce7b474ca2e7fd6a77ec679a5733ecbe [36/59] EMB-2014: media: intel/ipu4: Port fw com structs to IPU4
config: x86_64-randconfig-r112-20231229 (https://download.01.org/0day-ci/archive/20231229/202312290913.BjTjtYnZ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312290913.BjTjtYnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312290913.BjTjtYnZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:17:19: warning: unused variable 'send_msg_types' [-Wunused-const-variable]
      17 | static const char send_msg_types[N_IPU6_FW_ISYS_SEND_TYPE][MAX_SEND_MSG_LEN] = {
         |                   ^~~~~~~~~~~~~~
   1 warning generated.


vim +/send_msg_types +17 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c

    15	
    16	#define MAX_SEND_MSG_LEN 32
  > 17	static const char send_msg_types[N_IPU6_FW_ISYS_SEND_TYPE][MAX_SEND_MSG_LEN] = {
    18		"STREAM_OPEN",
    19		"STREAM_START",
    20		"STREAM_START_AND_CAPTURE",
    21		"STREAM_CAPTURE",
    22		"STREAM_STOP",
    23		"STREAM_FLUSH",
    24		"STREAM_CLOSE"
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
