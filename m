Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1BE1E506
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689093970; x=1720629970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+WwHlcBcMbIFlgol2/EvfjYcZf07mhsmzYG24mARp1c=;
  b=WXQcX9IzpmgzBlHlf1Y5pA+AXPyAKM3pvqUPNQz7OZOsX6otgDIxrf8H
   hO1DB5jdrSH6rCuFVpf7LH8SlJYfnocI3GPMd83Ax77Ba6qtNOh8YWaOM
   g1LLVgsYG5mxJjKUitEfjeH311ubrjCmBaE70YC54cnl5yNtHjFWGjZ95
   yCQN8zK5yCvo3Bm3po5Dl8ro29ov+ad0lYzynkXZkkce9I49ljadsYfRx
   Dim2JtLQNHT+HS61C2TrBggPwhGLOW5TSArmT2FrTt8+PBsBG1pd2DKVz
   MT3cnbdLX15V+GMq/1h2xvI6kTHUHYA24ateR+jtrgrXl5mhHUTbBM9Or
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354537441"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="354537441"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 09:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="967872075"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="967872075"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2023 09:46:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJGV5-0004wp-2r;
	Tue, 11 Jul 2023 16:46:07 +0000
Date: Wed, 12 Jul 2023 00:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Tayar <ttayar@habana.ai>
Cc: oe-kbuild-all@lists.linux.dev, Oded Gabbay <ogabbay@kernel.org>
Subject: [ogabbay:habanalabs-accel 21/24]
 drivers/accel/habanalabs/common/device.c:587:5: sparse: sparse: symbol
 '__hl_mmap' was not declared. Should it be static?
Message-ID: <202307120026.ou105v5h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git habanalabs-accel
head:   66064465171cd205e35f2c0c1f23eaff0eea3d56
commit: cc9c2ec0e61883b26effbe0b8cf40d5180999d21 [21/24] accel/habanalabs: register compute device as an accel device
config: um-randconfig-r072-20230710 (https://download.01.org/0day-ci/archive/20230712/202307120026.ou105v5h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120026.ou105v5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120026.ou105v5h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/habanalabs/common/device.c:587:5: sparse: sparse: symbol '__hl_mmap' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
