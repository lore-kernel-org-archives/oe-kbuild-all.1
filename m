Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F657F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORuUYwIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700453694; x=1731989694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMSKGXdV3xW3EB4bqIFoLItohoKXU8hxd7j1qe2o3t0=;
  b=ORuUYwIOgBfthUeYSSNbvI80l+Kp/BvYXzKZ6KYy4aOgISf0hbgm7WEU
   7y8tq3I2P+wqYHj9dQ41Al9cwMHTyFsVXYhYoilRGetEGpoW1Pmad1d6E
   CZSQGEWR1vl67C8mgj2WQ0iljPff9XiwSC777ivpB4WzFxeMAZPCkfoFO
   Umn+mLGlLNjfIjttxvrtNJfHQGejzTAcZVk8zRsUI34F09e20zK6k6nGy
   CCfAOYVImTOSPb5gQSUv9FlqQEcUF+RI2Z4e2PfVdWCnyOMko6I7EDM9S
   OmZ6JENDXJX9JvHX/q3GOFJzgaInNy6EUar/LYQ3s0cqZU9GkCo8HJf0C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422642105"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="422642105"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 20:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801028290"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="801028290"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Nov 2023 20:14:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4vgM-0005vh-1b;
	Mon, 20 Nov 2023 04:14:47 +0000
Date: Mon, 20 Nov 2023 12:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 122/145]
 drivers/mux/apple-display-crossbar.c:267:1: warning: 'static' is not at
 beginning of declaration
Message-ID: <202311201214.6jDQzP7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   e3a82f03cd81edb4608ab6dde0e073ac91e2fdb8
commit: 486e729f36e962ef2d3bd0c00dc95bb508027e4f [122/145] mux: apple DP xbar: Add Apple silicon DisplayPort crossbar
config: arm64-randconfig-r071-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201214.6jDQzP7E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201214.6jDQzP7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201214.6jDQzP7E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/apple-display-crossbar.c:267:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     267 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
         | ^~~~~
   drivers/mux/apple-display-crossbar.c:272:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     272 | const static struct apple_dpxbar_hw apple_dpxbar_hw_t6000 = {
         | ^~~~~


vim +/static +267 drivers/mux/apple-display-crossbar.c

   266	
 > 267	const static struct apple_dpxbar_hw apple_dpxbar_hw_t8103 = {
   268		.n_ufp = 2,
   269		.tunable = 0,
   270	};
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
